Return-Path: <linux-arm-msm+bounces-92665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAl9OpCrjWkK5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:29:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF512C80A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA3403006092
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448032DCC04;
	Thu, 12 Feb 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0b6HYje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZIuaO9mN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95729BD87
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892172; cv=none; b=eLqzr/mUCq/iMbKEfPw4vNwh48ZS9eI8EmJzNK+Cy8BBFDQkxt5U3NaJm5QiM3DiiQUZzcAMPJ9bdW7Uyih1ZqqVDf6t+qMCdNZ+CLZWiPCGpsz4n5HLGT2ACSDh3XfL1iJ6wP1wDpKqleHT6rgOC/ByGFU2KyzOAKEc2oBagOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892172; c=relaxed/simple;
	bh=grtOFX/dL6G5MS05nZqVvq5cypMK28NE3KWtmcoV9kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/Ohfcp0eaHFyDIdD2il6x1j9E/rDuXyJ8jM4/i5HbqLaHjEbYRSBMwG3Aiiy/pKUtrr0zjIuQMlSRi0XwpriRNp5RiFumnBJJIzLCBd4ESioRdvvpWaNoI7Vvh5eImhkh3cGYMZv+VvdkmqJFkC/4p/p14Z6TTzxkl8QxGuOUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0b6HYje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZIuaO9mN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAEfcW2545026
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=; b=g0b6HYje65DID16Q
	dVH4/r690p/9783TMw+GF82GQzDUXGHpzHDZwkfSyxnDRGP2L8WTzdPDjwBwvRYU
	35ODAe05LnKu//gNG0butsovZcEEgxCOCYBi07yJe8rgkk7y2Ip7g+ltidJ8t4++
	qZ4pyesibQa92pSKFnz9wBD92jPc72ugWWZpWpdaMFwC8EpnaqYZDhgMZcWx6yqG
	3/uFLZE22/RK8itYHjQvlJPBf0tIL4xYmbjzZx+0gDbAlmOdlQNcCkTarXJzk37T
	eg0L0WSPyRQM8be15he4i0swAnVZqWGioMsc5wnpzj7a4jQv8M/rlampr08lTU1l
	8jZ7mw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpjwfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:29:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso398280485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892169; x=1771496969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=;
        b=ZIuaO9mNoUIzhl47qU0c4opeHyGLf/saZu5Bl4jalzhQgqgmFWX978sTJxCoQHpIxp
         bewbMNbVaakI2vLUSL/bJo3Lr/qDf/7LPoENBph16CVzJs7C5PmKPr3I1Ws9vH07kruz
         CXEMHh4TIwYf4MMu0doNfx801TkcU5cIxWXb+G4LpglhqewBdw6RRm+CXRPXouJ7Dxux
         KIAEjMxMMx0xxwhhdXvgSAvSNGIeNoHf7LvSxhn4vcdpVoEIR/eE6A90wZlZMGEV/gIW
         xwFV2JzbDu9cuZm1svZMVcx/jWBMgCJpV1wDDKPEsZ4dTSR9hx/wWs+gvQ5L3AZ3Tq64
         lDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892169; x=1771496969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtWD5KPpr3uE+vRZBfsKTfgXmw9x/t9BQ2vLWIDrTUw=;
        b=vKr5SrXM104L2aAq4tAf8fVfL/s7UgZvkQqUOXk2u5rVPW56sV7LXXyyXcOOdZfJuZ
         uj3HnKmj2vmqls8U5YOFiK76/9hQXVJrVPGmjZ57T0FgqW2J7oAjwmG6YSlyTQQzolaN
         deI4fJiwvE1whOzuZlf7Tnjb6oxlTsl0PH4yRpRP7Kfo9XUhs4AkXPjOt1Yc+Lc/0/CR
         EuNfmHySmDw/t0ARRwlaSh5e3/PRYMMZdsU5eNlRq1hEdmS9BQGrro3GRVHVjhFEaCJX
         CwRn2z4AZ0AbD9Fy3BUZ3Xp7p7GNzVXQhmTtQuaD3+OIyj6jXP1tVRBD5bYUAzjEkrqd
         KIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVd8JCTeOzD2kR1Opq+OOE9sozYPrtM0N9Avk4qID1PNBocOjTNBD0HvMZAg9cZCTTOP9XybYZW5WVKsLje@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPAjsaeAHEBLyYtGEP8ZlE443PyiykUjl0HOFIJmloCwsDE1/
	4wKnOIxWKj1xFia73eeahLdwleG9iEKExUvYXQv8kj2mNEVsdsrPk7j12O6+ovc2xAKC/eZKZte
	itOHNff/mcxAxITA8tIhftE4nsMUfdcUGRHqzOjXy72SB7euL5Iz8MmPxscKH1aQ91jNq
X-Gm-Gg: AZuq6aIohJyBA29fCtjvnJgJKQt+PpDAJ6hJ+MzaFMo2COg4FrJsy/1cQt+fXoqFhYo
	Nt+HnOGyHamYS2vRfiC+G6BuQiU3MU5ifhIXkuqb2vsJw32G9hwcAwyJ5o2Jz37wNRr2fgHQMJB
	t3h8E3a3SPUBHg4JP7CdbUrff7J+GDVH9ymLL/ki0XcqKSUkwYVm3gynEMUAyHQXUMrxv8omjdP
	LYvIX2QrfiHwRbCXeRpy5jCmHFDBhHbLts0UCt7nVupxP3u4VC7Fn504jbO6UQZdzcsew9uwqzr
	m7kWruxWuvvYoL5cJK87DauhYdkk9MfEDajwB2/ut22lkEw3yNOShlrW1i+5vzSlK3FXJ0xGDAJ
	e1qmxpRh0kquEmamIGtvrnPhgFGJohyisXh6ts4jsdMAkIn4gUB127qjzJyhES5DijKnDmnbfv2
	/YfHk=
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb33166e10mr211209185a.8.1770892169298;
        Thu, 12 Feb 2026 02:29:29 -0800 (PST)
X-Received: by 2002:a05:620a:2545:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cb33166e10mr211207585a.8.1770892168824;
        Thu, 12 Feb 2026 02:29:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fa0cf9093sm5583266b.29.2026.02.12.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:29:28 -0800 (PST)
Message-ID: <d5e76996-e68b-40f5-a2a3-9dd030968717@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        yifei@zhan.science
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
 <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
 <aYzZf-9rqqBikpNA@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYzZf-9rqqBikpNA@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698dab89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Gbw9aFdXAAAA:8 a=0Wqi5sXYzvoKQ2Wxs_MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: Nv8Mx__7xzG9OHptB_G-JMToh79EtGKS
X-Proofpoint-ORIG-GUID: Nv8Mx__7xzG9OHptB_G-JMToh79EtGKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NyBTYWx0ZWRfX244bcJ8gEAt8
 5CsUUF3FpE82mDUoDLgznmbxThK3bT+Y9Q3CNc+1hUIIYrJIXU4IquxN8Kc/gPJ8Q+yXccHzfS0
 UEQxceLjt209AjXanNtQOtwoS4Y3MpwNryX1GQ/9+3yZkTYZCo2FRWySMuRpTZGvdB+71yumYJe
 FEfbrP2QMddu1woddkWPDPzwBkd+/PHPIm4GgNsIrzznnWJbiXM4TRlfzAVGf0vWS7HTxnyrA27
 A2+wkOBwxgi1vaB+J5s1Jkfsu3vQRhHaXWy+otD89MQJFmnnVpaWIFk/Ymwrol6ZEiTq8DI4vBs
 kabkyxKe8Mi55E7wMXMH1rteaKvmQ125mKaTFyqCp3F5RblLm0yhh0Hh53NZ6as3KRuR8cyPN3R
 9hJzw7Q5I2dcscNy+SqfxSrU0FwIWablfXevJOHlMb2/yaQXPjALQ0blZhCSgg7K9TgmhCXJjhd
 TNnq49L3NZMN+CxXgvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92665-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:url,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CAF512C80A
X-Rspamd-Action: no action

On 2/11/26 8:33 PM, Richard Acayan wrote:
> On Tue, Feb 10, 2026 at 10:10:46AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 3:33 AM, Richard Acayan wrote:
>>> Some Pixel 3a XL devices have a Tianma panel. Add the separate device
>>> tree for this to support these other devices.
>>
>> There's not a device upstream for any kind of Pixel 3a XL - should
>> we anticipate a non-Tianma-panel one too (i.e. are you sure those
>> are out in the wild)?
> 
> Yes, some postmarketOS community members self-declared as owning the
> variant with the SDC (Samsung) panel[1].
> 
> [1] https://wiki.postmarketos.org/index.php?title=Google_Pixel_3a_XL_(google-bonito)&oldid=89946#Users_owning_this_device
> 

Ok, please mention in the commit message that the panel is dual-sourced
and the other variant has a samsung display then

Konrad


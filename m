Return-Path: <linux-arm-msm+bounces-117248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fGuJ5/STGpFqQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:19:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D871A3C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:19:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OHekx5LI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="E6O/jUlC";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A4823084354
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DFE3D88E3;
	Tue,  7 Jul 2026 10:14:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AB3DA7DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:14:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419258; cv=none; b=emN3DspJ5PDRLE6kWLQO+v2GTeFdAK9Sm6jvi6UDC5mppf7yFrgmgv4dFzA/mRbyjqHY5r5n/W02Ji5zqCpQZHH5uo8g1ikcgBzX1rzS5WYX8y8+ke1oF5HXTacL4ljbB28KLtk5SanJXk1snug4/NfNdiJjX7kCaLcDTgjxRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419258; c=relaxed/simple;
	bh=Dh0tPcSqug028EFE+Bh7gYoEMsrwEvamEbpWBAp/dS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsNg2BbZgFAl8APonCHTpVdCfpNcCoxuninnKdfNtLtRuGs+tginzZiSRB4dkIYwRpWVvvcEmL9L6RXr7mGn4g1O6YqVdkD1cAcFtOGE9yaJKye/m8F3tmCVH+NGI5mJgMEwxNqStsfpwRiHg7Y8DOKRLntgpUg0wpUr2Vu8EOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHekx5LI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6O/jUlC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DZLP3219232
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=; b=OHekx5LIk1J2XdP2
	vWYA2bxSGx7B6O0X8RG/XqS2REXIThqEjSyxw6c/Zj90a4c44GUG9aFNGpprHYcg
	A0t0qlMmWPftY8ZRDMDPCta7NTDpZ5uOeJWEBfKu2wCmE1+khZyLAgIjidqJfWxJ
	d8pXGT+DX6aQ17laHQQu58TxlXkMLQkpk/CqMl4Ef6nzwWnVCQN4wWoxxzDFsEBR
	QrXIeK9SpBO9G1LKq7g1vxPIjbn3UyC5V/6IfAbm4ohTxjeu6Hd6Co9GSA5omlRL
	SG0bZsU7tmglNior0XFRyXFFaz+RUwYa+BzrkjiIPICRMf04cqB668PLOKA4//AS
	NqS/Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0k11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:14:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so7620221cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419256; x=1784024056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=;
        b=E6O/jUlC1zwGzyPwhc0uBECDpzFARSq106vso+abhSsMhAIzKSyTBs8aVbGKPWHbhF
         OAwIQG4yVcrnx8H9loeFg3iq7oHNVaA389lzcHfZZ9yBbDCvKzhyrMH2xhJDumz1I42q
         B1UIqvJ4ju8wapH4FggcJtKSiApiHdVNN9R1pY0VYbdpcIYv4wB9S9/DZJoNkQ2xPuqi
         mniu14jefAqa3z8lmWErSUPll/wjidiuombK0AlHtDobqfUT+nzbcwfpFx0i3f73Q3KD
         hqTQ8ssQWjVTrQ2La1Xn3zo6peLstB+2affyKENngTeqCzZcwJfF2cLgL50+4RQL2nlZ
         pefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419256; x=1784024056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0W7SRzSVm4xBYYBmwRLEVmU+E2swBGIM7abCVC6Djw=;
        b=J6DqCEjVtwOSY9JK908gaVSuE/sPiC/ciWMso2uxXMlZfvOe8MYxZS16ZHPKGS07WR
         lertKfOn3I0x8Ha6hDBKAFVVJc5uhMVR1cbSkvhuhfpyE7k5MLYgSD/PSeYDqAoboEoW
         x55Mq1r6pMNcHBa5UCSUjNizrPgmpG+Jo0Wk7C991FTSyELFAV1QKIkye32WRX603BUf
         85EM7ytEb4w5SsXtt8OzZlDmfyXGtmv1vj2VP4ha7WD7SbtuBWkl5sgi8rMXcVkgGXLJ
         vFZZD/oxhmrjFyXKiOLcRuhjx4vEhwJ3czvzglWOgxTW8x3bEDXmzSljjpcTFdtbfQty
         fA9A==
X-Forwarded-Encrypted: i=1; AHgh+RrXtEETPVB0KQ+qptfw9U4uROrsfNfXugw+htasB997yVPW8VzyzI+/Mr1L6/8Y6/0Neu3odBwiSyMXQLus@vger.kernel.org
X-Gm-Message-State: AOJu0YzH7DmoTWabWhwoObr88Y+Bh2TlsjucnYQcdMYSA0nv6bGNIKls
	PlD686ZaBlGgFVDdlRpLOrvNLKn+pcg/j0obd82n/512mG+3GiBbcDBflKz8XrVdksXphhDjepX
	sjuE9PPwAG8iZj4d1oMQZjiQL69GocXXe8er/gAMn/A7ZclOQz8Cvmh/I0dm2Q5ThV12T
X-Gm-Gg: AfdE7ckVGIBNvuunc0cJxi5S8hSEux1PRlpg2XpYk0vchf2/wIhh60SPoF0yOXiHsZq
	ukLqLgGw2x9yGQhDhEq9gAjKhZoiI488YBdbXoOVeDlTHF5UMNzO06BN0zxI8dSjQlWUiMjTjUx
	0HXn5CFEH8L4A5LWFlYWp7FNDTgHqvg+t+JOH7xa/xcDq9dXbgO+MRLm2KL5XlMXYqszYtkUDOb
	XqDHAWWRlKHIaPAcv6BlPc2g3l1Ps8mgbGkf3vOLvf/bHfg2T8OKTs3Z5w85I535UzjGXtLqNP/
	Hw/HWsDzr1NZpd0stf1KZQS1upL50UaJ6CxIWkaiu1tyNndH18O+FVmvRhsmjLElvA5BnonKkYK
	nb9U8ljeL3gk8lt9WmeveXAqrZltAta3wI6o=
X-Received: by 2002:a05:622a:3c8:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c79f43e06mr13717651cf.11.1783419255701;
        Tue, 07 Jul 2026 03:14:15 -0700 (PDT)
X-Received: by 2002:a05:622a:3c8:b0:51a:8c9b:64a7 with SMTP id d75a77b69052e-51c79f43e06mr13717391cf.11.1783419255310;
        Tue, 07 Jul 2026 03:14:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bca25sm100329266b.35.2026.07.07.03.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:14:14 -0700 (PDT)
Message-ID: <d695c08c-1df4-4036-bfc9-b07dc44c9e16@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
 <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
 <2dad960b-c9e4-44a2-83fa-bd2dfff6deb4@oss.qualcomm.com>
 <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <g5qoveh5kp4m2ororxwpima6c3nlzp4s72oakanlma6vngc257@sli6for2zmo6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N-8S7CkSoMq_hA16FwLVVgNKNyMr0f2m
X-Proofpoint-ORIG-GUID: N-8S7CkSoMq_hA16FwLVVgNKNyMr0f2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX8itp/+U1vkPM
 q+5LvS8bAlIAT9LxcNswMOFKn9mstaliZNpt8eJk2xn61isSHEk+qB+Du/d0IKpZ97HYCUX9gSM
 lX1EF/0n8XvQUMvEIFhHzHOAwJuFdE2h7Gm4Ua5lJ4pxm5hPGYLhUE5Mu6pf03WTG3GpZ1xDTq6
 6JgB1V7GdCFenHfiJu21g4q6zQ5tYLS4Utgs5Sp8EBz9CobI0N+a9rv3UKOtC9z7zo3vjBecEi1
 tMfEengYM2J2aC7elRt0q1DpMHvxGDM+/Djog5jws/Kzj05g0MewMBp6jDubwTaACIIEoyjjeck
 eEFT0PXg7fw9ybQj8xBHEm9bdp+ApONo/7Oj0/eR+cMEY7PhNxMdfuFTSorzpes2TC07NnIQUGW
 eeQxiau3ZGIEP7T/p2lpzsxubwkuw6n9ue/BjI0RCw1njlZeJ1eZScT9VCU+N0XfvgjPi5BmNsC
 b7i9ph0DAAaFT9OPINQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX/7azC+G7W8Zi
 70CX7B8rcBE7ayaK48/RpYJZ8qujX/K3Pn/Q0IRr81tCg+cL4xgaQQtFfDRBkM88Afn1LOA0B3A
 /GhAip6ZwsgNg3GVvtO9S2nM3krc8ms=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cd178 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VKWnMpf-0DTvsSkH75gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-117248-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:xerikasxx@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,igalia.com,vger.kernel.org,postmarketos.org,lists.sr.ht];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF2D871A3C3

On 7/6/26 4:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 03:38:42PM +0200, Konrad Dybcio wrote:
>> On 7/4/26 10:55 AM, Erikas Bitovtas wrote:
>>>>> +&usb_1_dwc3 {
>>>>> +	dr_mode = "peripheral";
>>>>> +	maximum-speed = "high-speed";
>>>>
>>>> Does super-speed not work (if you also remove the qcom,select... above)?
>>>>
>>>> Konrad
>>>
>>> I can make a file transfer over scp, but the speed is inconsistent and
>>> slower than with high-speed. Must be because this device does not
>>> support USB 3.0 (super-speed).
>>
>> I'm asking whether it enumerates as super-speed if you make the changes
>> I referred to and use a super-speed cable.
>>
>> Some devices wouldn't, because not all manufacturers connect the
>> necessary TX/RX lines on the Type-C port.
> 
> the GSM arena lists those phones as having USB 2.0 only.

This may be inconclusive.

Erikas, if either DP altmode works or you can see superspeed
enumeration (downstream kernel may disable that even if the hw
supports that), the wires are there

Konrad


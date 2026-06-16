Return-Path: <linux-arm-msm+bounces-113410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFe6MD9FMWoUfwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:44:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9968F7A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:44:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z5vv13/Q";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QsBPe7Az;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113410-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113410-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C9731DFB5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4563367F3D;
	Tue, 16 Jun 2026 12:39:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64629361662
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:39:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613556; cv=none; b=d+qRI7cAK2rosa5ejpfca0dxCstzy/kCY2Aw9jWWpCSnQs4X/QzT07Wx6rrsCFYPLv1Oz1LRM7eKYHmDQ8UUY1zBpzp/KpXPQnDUmyjt3wgqOz0ZYqDIreu5RSEcd/bG48nZteVJ1NJx5POsVcmP96RzXNd/GfmpB0j0zI+7qj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613556; c=relaxed/simple;
	bh=2cN8pStYk6HKFKvoeomkej232onlU4BhbtiKFnBUqI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSTbJQpVKAQ8dGSakQ6KkYimumHauUC7QynPSaeerGQRXGV5NI0unl+5d9NLHi1fU+HA82f1aEBUsvoTMVIO/uOFKp2BzxmRiUckcki3+pMLV5WAPJkDSlOyQ83i27Mvn5r7stmCD5GCO+296pluE3rb6I8ZUT3vCog4142Saso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5vv13/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsBPe7Az; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9TYW2894180
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=; b=Z5vv13/QhbtcBOAn
	TsL1rTBs5rgMe1o7xH3JiIxt5JfbVf1uaJAIQk97ysIeo56rxEIh/ekKs+FEBb27
	0PfQ5QzJXTSpA13oBgLtvmUzHjIwTGCxWnzLmw27vueEBTtzuwIhwvoe2EJdBhV1
	7eyVu0fmdD88ShtS9DuJ827LcpT2XCUb2CDHV7/XPfZ8B1ZdCldWdYlWQdW2gCLa
	hLaGFK3TCbx0i8Ps39fLDyUBCmAjnjO5ErBPiEvS48u7QftPlLZ5jIlLjAcHjpmM
	14HM+z5UzPZquxguBxTUdZ8285UM1+qtHDPcf1PvHtLWY+2TTfQrQHq2MJpGyJb+
	NkUZow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253h8cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:39:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9160006de85so120053585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613542; x=1782218342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=;
        b=QsBPe7AzScWvseC3XDi5PX3AOpTyTWhRJsUXUdJmhGU1CGduCMM+NvWQAC6vdIMpBw
         pWB0jNH+Xi7VUB8YaSn+kA/s5qG7FMip82A5RsoYePo1z76hqwHuc84w06TEd8FEwjg/
         ljN1TbEaLcWhiht9M5s05MsqVcQeK8KAPBh31yXcd2b8fHLYPLFzTKf3uM/QkQgHMTm9
         w1U1SL9Ziv2LWP6QnRySgUy/TOnGSfLt9tnO9RqsDnr1o9k44L06QRq7u4k5ZcgcnXfB
         0eYIdmeuldGNmUPUFy0zwGIL1N4HxaNgYtUY9B7uRL5XEQ4645x66PnWVoVSu+ULQV9U
         iieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613542; x=1782218342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1jDeroSRDCDzCHfL9jQEPFl5rUbO6XQjWCdkBFa8AU=;
        b=VKFom3thqNNHIy2+OHJVKa6e833g5fczYYPZE85+PoItXvWyNa2ske1AtLPAHNgvvZ
         uhoclTBgRp/Zh0OcyriqK/XMAQ33N4WSXo39hvvcN2dND3PL0gk7QjQG++7GzobEdizJ
         FWorxiJyl7p0HmbcyS9QQ03eo4WFasRpUgpimHvL7II6wEPhxIDK44SyupR518De6d8s
         +p7gbP/tay5U/fTw3KwBGHZ1QR8IdA4WNhUi4o/vp75O/Lnt/oBkz9D0YZsFeKdwc0QK
         XPGltap9tjIFeI0D8YQjwtzNk+w9CfMmYhFw2jsUNUVQwzUJIPKs9Pl1dIAJ5VFZL3hB
         +BwQ==
X-Gm-Message-State: AOJu0YwvXwaBGFod4w9SwIrr15VU4LdVHNIf7YJgEgi25ltmOiPl8tow
	3OWRS98Y3gxM1/vd+VU0EH1ugONpgqA/kgygsWwsQReHBdMSgFWdBikeJqWPaEkYad32TUlO+W6
	Aag4DlspLHZOTL/OY3KUq7MXVkpYix6wI8gju6lILF0ZyyZ+MY5PgNSTLRh+nl1JNaFGB
X-Gm-Gg: Acq92OFJHhTr1IR92X03XGCGb5Uoeu3/La5A5oo0TGugxIrCV2DjNeMjX7xXQu2TZ/Z
	btw4ugNIpMPsbKF964nP0/wTUANYoxwN+QBTMD0tlBMF2HfsMwtlZjthk9c1Xxq+m9il4xNcla6
	qQLR+hXD+FIPAZGv1IWw/mKP7/ytZ4xjHwvzSbsDJQq3PjuybTUpQsN7dIoOciRi3XtM8TFACTr
	3Z9DQ28d+GQc9/qz28AN3r4pmDthX23S33n+kWmaKiVbLzRNUHrUgQbx0tG1FgeGOugYSsE6o/g
	Y8ssHc91Gr8VGC2xYNc/mPnyiYj/tydj0dkb3C+DyOR+7hN3DXWUrCd2SNKofckSHg5IXJN2ow9
	nnFLuT2ajKKHaSPOZG0jLP3OxeiTH7+fg3AQ8uiXX3lAiZg==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1845810285a.2.1781613542011;
        Tue, 16 Jun 2026 05:39:02 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1845792285a.2.1781613539676;
        Tue, 16 Jun 2026 05:38:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8341840sm650145666b.43.2026.06.16.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:38:58 -0700 (PDT)
Message-ID: <d291a679-e8c6-49c7-b526-46a233c510c9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:38:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
 <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fX-9uA0riRWPMWA7tVqhq_bAAkauEY7Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfXyD9zLT4MHStX
 greD1E0akcFC4GzYQQGdu8e0hVcld5G+CobK2krV8NtaWIN7jxY0ZNzkPaNX3vCiaCNGqYwYQUL
 co3/BT79YBK50EseW8+Lt6GgyIwHQfI=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a3143e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9N7u2682LvJSGfYhleIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyOSBTYWx0ZWRfX/YfsCWxY7c3Y
 8Paqd0gehGLGnV1l/x3BIn0OPNGAABUOEI0SuoxMBYunA1NfLTJpomMsGBbtph0LkSQqW8Nu8wA
 0dM+0mvrKBlGRRRq1BvUqSpjl/s4sA/LFQzPC4tgE2MVARjvTrp/1h/uQtEZ1hCrSe1Ktr6piWO
 3bMAaFXOg4U8X0eosG1wNxIZcq1UoEQ8Jy10sSm0nfGLzTmHNvVhXf3q3sp0jeHimWieIJALceK
 xnZzZ6lDjX6B+/AdVnKyX0fLloQOuQ4SAEIQoDYWKN/k0LbYYG+YDf35cBnB5yU94311B/wA4Ll
 jAR9ZtYb2YuaRWZxpUvizLZQuNL/+wzyjJyqdcCPinSl98AlTaOI9x76cGIVVewY6Hk7LB6mpI4
 SyKbhNFpaD26C3egMS6ZOLWjlmowllNF3qle4KGXJdlHt92cW03+c6ikvSMZT81qTTKGk3K97a4
 AxrDj00Lphqny6m7M3A==
X-Proofpoint-ORIG-GUID: fX-9uA0riRWPMWA7tVqhq_bAAkauEY7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113410-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:azkali.limited@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:azkalilimited@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23C9968F7A2

On 5/17/26 3:14 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add the QUPv3_2 SE3 High Speed UART (UART11) controller node and its
> default pinctrl state to sm8550.dtsi, so boards can enable it through
> &uart11 instead of open-coding the controller in their own dts.

The latter part of the sentence is rather implicit, that approach
wouldn't be accepted


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


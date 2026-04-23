Return-Path: <linux-arm-msm+bounces-104293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HXpIJT96WmeqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:08:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C561451172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF879300D9D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1FC3E63A1;
	Thu, 23 Apr 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfCt+GvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNBynSpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704763CEB8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942479; cv=none; b=W6wi632lKcceyC1kZ0IwDdkxw1tduo3LjgQtfB3BOpfYtaO+acnXjp33AGhZ9o/ceAYdabvxDF5UgzdtxGrjeJgN2Ecnxuar1zMNKMLXkRL1j88wFKf7vYzznv+Cxx88CO20qdhwhnXubQu+X80AlmXmBgYixrJ5B5V5ZCeOi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942479; c=relaxed/simple;
	bh=tNbhABNqfXMqrmy58rocC9BJlx470ELdyH7C1EREDFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CszVcfbzfQTGltyvksEtFUs//+Fx/UUS/tcdSStJbMvjNfKWSZs1PGAMjlytfcPCiAXqv10cOtCiYIAi3JLQyIe7ylEt4Ro60s81nvUiTJX6PxHQeX6LTYMBVj8LW6WptM+cJG/HHHwRj018t/1qaKb9QbVp5uJLbk69ESGTU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfCt+GvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNBynSpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2cc366240
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=; b=HfCt+GvVAce9r35o
	va5MMuOgxZwCEEcDjNAyE5Mc0eRe1j8xegIxLKTokE7kFYV+NipZnb+5SO+ZE9hF
	8jt9rUqdkHqa0Vhp2uvGlIB+/QOzkVIHwKt5uMEUO5yKiuc2mFm7kU2UiOV8+6/Y
	xltCFFSBU4DmXI1+5XvkGvaGEYXf89uYueDSGqoNU8gfaOhYtg88Oic1HLX2rHIt
	LDaDe6H0xlU7OPn8jplhHfihWsESMq61Z8CwRatlsK/5N21LbyYno83N1f0dIWUX
	fyUD5XyimPxqJT7tA90n3GakvgYc2Mecc+A++mXehWzH/9eFpV1uv3A/vd3zCs0Y
	HJ40Jw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rb4r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:07:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso59222581cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942477; x=1777547277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=;
        b=fNBynSpE64c8PdEhGXVWJqnd8ujyQp7DscYSkabNxOHsMHCIzMcV6EO+5swY+eAMv9
         0oRVxurXrjfOsnzocQZ3ivyJ4WR/beb1uKoRxxBohzI4+TAh4LBmDMFvhDW+MyHFS7oj
         Kxp3NsIpVuM1bEXsQGYFlPBbbjLN3kMQO+j2Z9gueMddT0KhcTo/LFhRiT6UKAaAw104
         RSsbrjUKHIZMd+wtN7cxbwcn2IyHNY3WxeDC5lbCte8yB/8NeaUJRHi0GWeyGCs2DW8Z
         TozzULiqq+XlofbCIr5XL9x/iF9/Sx0CCpGmXdtJSoo9CrAtyPf5HuDeEaZMx3VnNcnI
         QTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942477; x=1777547277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYBndjbSBxlH5m0LQ4aEBV3PunPAUSt0O1wjwpo6cDY=;
        b=PAyn2OsOOye20KWQuQTkuQM5RI9y/559hzApjaTr/6De+GjMqZo+iIw2rvqWr9/HNk
         3rzDLst5enxzJ7VfD/7MXUm4a6LdDpcyzbYw5etuxi7X3cbaETuDyi5v3rDhJsZD/x9f
         CC3KfqKrtW+WeVOJ9vQ4ccB2IPn81yqpJo+a/Qsd9mwsy3nXRZmZLBj1pGJ095/jgyI9
         Dp5aLfEKiHJf4xcqE+kAdtZ6T0ELM7KX/VBW8FzzW2iI4KYarddqxJhWSyEmZwWXpLK2
         kuFxykcvdeHNwGxcNgzQvA7uKZNn6cCCaielOYJJxFkaqkIDefHJph0aGEdeWBo7pTy7
         fSKw==
X-Gm-Message-State: AOJu0Yy+UUKb7xh9AutjGUe+K++JA7zHeNcztioRXfHcc7lwIIbVCPSu
	MjG/ar91NPwMqOg577ki87ZoG00S3WVWYqg4To73E99CanLXPMAaWTQxgi+nUBEOSGEDo9IH207
	KX2mzi8JI8WorcPMCLp43vpTUN3HrcrgxOPt4lHwW6YoZiQdNRT3x5PiW9lSw6dGfvgGU
X-Gm-Gg: AeBDieuUVqE6lM5cM7z1ZEMNFyBNOKUWS9HHT2W3yQ5QAlQa6AmbN0reanR54vQuRMJ
	aGHGvMrTIQkT3MWB2XltkXvAhVwuwc5LWAP0rjjTdaGgoJKELU7oTwqi3liC1gU9U/R4Ciq/4F3
	ykiAg6tUVOwfI8HDLEh/2CA3WnZp8/8jkT4AnJT/nzwS5bVvvhj9Y7EllxLZkj7RCllz86pwHVZ
	iclAANFmdH79Hdh6JBtxnINo1UfiEGI6QPZ+pIvxgryr1mM1jk+GUBSwhSkt6JCg5DzzrgCWhS+
	GTFrbL3+292VILHyh+yFaImHNNyrZykvjkCc5wMAkMUhTt/1UAh5K7GzE3ai8rqQ5sjAJOb+19n
	kp70FwWNA9YNQkTGv4R9FXyoDu9TYcjzRaIueItQ55dC6MVLitIaKJD6h1Wl38HmuTgkjS6ekMC
	wjj8GqnaDUKyPAwQ==
X-Received: by 2002:a05:622a:1148:b0:509:2a92:8088 with SMTP id d75a77b69052e-50e36839737mr257839641cf.1.1776942476837;
        Thu, 23 Apr 2026 04:07:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1148:b0:509:2a92:8088 with SMTP id d75a77b69052e-50e36839737mr257839341cf.1.1776942476309;
        Thu, 23 Apr 2026 04:07:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d69708sm4032514a12.28.2026.04.23.04.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:07:55 -0700 (PDT)
Message-ID: <d5839700-d3ea-42d7-86f4-c09c5696b193@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
 <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMCBTYWx0ZWRfX532F1SdTr/6m
 Jhmr12zPt2XwoHOEARa9vRokroWRcIN5h/Xb6VJqQYQaRA2QmxpBbIoTsGR5Wpq1oUWmmoqQgx4
 8PpRpXUUJySYZEIOl6QzhDhaOrmtZXRUVgSqlF5t0vZ/Utma9hJEKCEMMbn9cDKbiEm0akpEqfM
 wUjTZt+VXUiTW4PxowsVL5nCFDRZQTWO5I4WyR/BO+qSlNbh85gMwoR3BS6/2Qlwvlk3j2nJAmY
 M+UGchVnX1hMMWWN1oJmu9TfG+ajovnZnyarKNR7VI60X9zQAePbnke80UiZsv/RKAuujnichcG
 bYFct9RNbSKl1OY+iqz6Qk4FDl4WhiqxHLomLlAXzE8n0DuQv0tjl5I4EdDqUlQuraNkOBOc3GY
 fcIP3fw/4mZX1TX1oy2fKMeMdreUqwFxjw2O5u801VxkBguHnGJp34PcVrmMm2b7ZX0m5fP2Ghu
 wsfYIYrMz7tmiIB8y6w==
X-Proofpoint-ORIG-GUID: Qu9Zxn_E0jPf_CMz99YbREO4iTsGsf1e
X-Proofpoint-GUID: Qu9Zxn_E0jPf_CMz99YbREO4iTsGsf1e
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9fd8d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=27t9AhEcw4iSZbU8vf0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104293-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C561451172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 6:43 AM, Alexander Koskovich wrote:
> QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
> function name cannot be the same or the alternate function cannot
> be selected.
> 
> Split them up into individual lane functions so boards can specify.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


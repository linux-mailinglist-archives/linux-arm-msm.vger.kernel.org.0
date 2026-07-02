Return-Path: <linux-arm-msm+bounces-115949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZA5D3hGRmpXNgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BEC6F66E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a2hGTebG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYwAYDZ0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F26173048DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E0F3C5DDE;
	Thu,  2 Jul 2026 10:55:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465063C661D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:55:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989757; cv=none; b=qN5yyPQxe4Xa/DEWb1cBVjBk9+tO7nqG043wADFL3GikA47TY8YS0nxrNjYQn+v86PUckCn1jLO3Nc/UfuO+iwADggd3sl+B01Z54W3DuoCnZV+vdimebYq3ndXAQuiypOJE5mmeVjIKyuF4Tuq9nc/sPBnV/9kXXw0tneVY2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989757; c=relaxed/simple;
	bh=/ZzlequwXhlS7LWvnF4LjPV63ziQ+cD3M2ZZ5OvxKnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AodtAM1T8B8OX2y3PjkoP1gwIw4pbN5JUJ9/EUBDWVXVFZo+8VbuaOJGI/XrvJzGSAcTnpaYPikio1Gd9SEHaKoIRafz9hcMBWv0wke4Kfz99zUOXrHd3agxUtgIYriDlZNy1T+elofYDI4e/eZ5srjZ+O+OZIkrkebD7Iw4idI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2hGTebG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYwAYDZ0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628PIvS3009608
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=; b=a2hGTebGOPF34xxb
	UhjLMYhe7C++fX47vrTKWSBq+PICLiPz+P8pWN01oDjQM2YxFAtKldwza9BTz8mh
	CYtST+LaUsMAKCTZfdatkDlRKGNolCksgd3We0aKXId0NPoUxselRmnNgej0vlRS
	rLC6yo4Udy4RI0xcmwlqjCyRDNCvfAgvCWLOcdT8tjN3sHAf02YasApZ15j7K7AE
	6ql2Ub5/hm8yM5osiID1vNaTCrjBXBjbtgq4F2oMkxjuxD5AXR50SqCjwFrSBfTJ
	70fX0hS5JuTNk4rMBwo/RC51HZnkcAUaSQp9orNjSiX4nvjPdhv7ZVEooelTY3Ba
	bzHp+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579rum6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:55:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so3369351cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989754; x=1783594554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=;
        b=iYwAYDZ0Hnc2OWSmwmko/D345dKyhadKPMys3qyENSbdho0/zaNa0XEsXAVDT5GjLk
         +c6gV/rGlXAKjc0WKd6eZdKEXZ2YScE/J1JPtVA/v2f2FBLGz/P1QpkX1BJm6IxOxAXe
         3zyCW9s/c/9VYIFBbJa3qUoXKWBH8e6NZ3Q2ab73yLYeVVwl8Sc1kVkPTylP1WkSatGX
         2u8PkwSta7oEE+rZxY1eWeuuxDcALIHjPO0IsqaTMgWdgObLHrtzPo8VFxAX0Tx3ITFp
         yoBY2Lm2QyTDvubixdRx+MlMVcyomcy9PP30JRlAk01bj+o9D0XjABt4kOxF6yuCPWkp
         V0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989754; x=1783594554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=;
        b=WRsccxoSRQVVmIXgKnjQ8ci3VIsD+nRfx9PylHil6a1Kk3bT8b1tmsGBFfQySNz1ql
         iZKG+Qz7rzIdnJiuYeDC+pfYw3NP9+NyTpweUzlyPnlpRgEkgN+GzRt5IvVmFgpJNoX+
         he06lzuWQP+8VSa7OZaEjahDbLl7/qy9t1f1J+lKd7SyvZ9yQ5/9gQgFl/B1O+J2tRmE
         ojF3PVXWWWcYzjauqaOpFGMq5t+AUB6ZA1mS7ypGZT400TTpw7hZ+mcdgUwQKasi4vrI
         6NRl7a+LlsIwO6ap3K/6O1pb+8m0gRkC6rlkGcri5tyTv84k5CTAFk0B7rKkATb/4s0G
         3b/g==
X-Gm-Message-State: AOJu0Yz9kfYvd01yyun1GDw8W+YMw3jY/yL8PBahPFTYzA6vUSJvzU2H
	Oax2rmjW0FLwjr/9158JNI2o+EabMTMf559azZAk41I2pwxM512FIC/a/6JCisCTYX7bvzYZYEU
	qcKuuJLkfxuDe4qnBi1cH65QpgfhOtDOYNeVBjDTfaODwkV8P0fRu9CuVKqEnebHSxofc
X-Gm-Gg: AfdE7clonInAHmeiKJaYpML5mqdg5TB748JjHTPB5ojOS+6MEvlvRotdKDQocc45iZo
	mkdSRtU+keHWtzL4aIzOaC93iHWdfPP1uill/OpvyMfd1xKbjhBKro/NLZSOmaz6R/0s9rSRUwZ
	Vtg5uW6sfzspAepQ1CCOyfK7YSZInToI3oDI0yYupTig4TnR1qVXthScnddc72wduKU7Mwx1+cx
	wVsDeQUUFbbjYG8PjwO4qpkidy8/gde40Pb8M1roQh+6bnhU08uxb66P5NWdU9GMUB9q698P3an
	eEhi3QlWlbgyQZo/ZntcwW+qIyFa2K2/7znSfEnDF2zr+/HqcasNndU5WodxsYZMd8prEn0W+qX
	I1xpyCy+ddnI6qU70TgcA8T4S7scD6xi/ntc=
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr43962761cf.10.1782989754242;
        Thu, 02 Jul 2026 03:55:54 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr43962511cf.10.1782989753769;
        Thu, 02 Jul 2026 03:55:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad118f43sm788110a12.25.2026.07.02.03.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:55:52 -0700 (PDT)
Message-ID: <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX7FhuScLMxOnQ
 77zhYg2OQQTXwZpT4WuZZlFpk8Zz+aH9pz99gSKImFilL5UqIeteE51e7oL1ZiFeW7xMdAq0lgV
 ojmsLLjzoGnsytaIaaGtLL7vyMlDh6T4qS+2WWvY5mNozvmpU9YUvxiognRxGZvRYmwyEwqa55o
 OPWDSjjt8tFc4YkjxW65UgE18dON+jWdRuGZJaOSGD8WE42WB/eJ8eSjkXDJftI+6hcmhaUTImA
 ftEIpqfctQDX8myFTnkknjOmMqB0mRD+7FMYZxBADlvO348H3YOtz0t9p36vlTlN0KylD+XdxIu
 wVG8EVWzh9EMig9Jp/DcaYRbPxAssWi4kkmSbfoFginFhGqTGl4tOKOTCntEqeRD3YZGsai87Xm
 NL+JN5Z/vv6tgjGxDegyf3njOVNu2G3FosLt7rUftBPGmI/fGzcLPrAc8rMCCGdad74YvBgvX1C
 PPScv0SBJli5yyOSHsw==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4643ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=t9bxL2sBmI2IUrh-d9IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oHIq1sGe1_HGkbcmrdgM58-B0daUcOFP
X-Proofpoint-ORIG-GUID: oHIq1sGe1_HGkbcmrdgM58-B0daUcOFP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX0/kzAJrlYhYh
 SzmmE/291zsOa+6+8gVC4L4EWUyZs1DMg2cfPU1I2xYBHqIJX3R1tg+ImU51rT981x8z2UG+MTb
 uwaWbyBjc+rXsFxO0BLziyhgZCz9EyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:apateriy@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85BEC6F66E8

On 7/2/26 11:50 AM, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the tlmm node for all three
> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
> SoC internally and not available for general use.

These are generally added to prevent non-secure access upon TLMM
probe, i.e. the board won't boot if some of them are not protected.

I assume the proposed set contains both ones that are _absolutely
forbidden_ for Linux to touch, but also ones that are dedicated to
some specific purpose that Linux _shouldn't_ touch.

Please add comments, like in glymur-crd.dtsi:

        gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
                               <10 2>, /* OOB UART */
                               <44 4>; /* Security SPI (TPM) */

explaining what these pins are.

If any of them are boot-critical, squash this into the introductory
change

Konrad


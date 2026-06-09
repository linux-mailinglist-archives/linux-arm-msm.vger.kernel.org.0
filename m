Return-Path: <linux-arm-msm+bounces-112029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8lEYMOHCJ2ra1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:38:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B565D4B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:38:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TZhxkBsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LbkYg95E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D4B5302B059
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563553DD847;
	Tue,  9 Jun 2026 07:35:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D1378814
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:35:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990517; cv=none; b=ULGeS7pw8LBaVyYoARzZ5V/NxNPkFb+z6Uld2ca5hj0HQ6Q5fuCeJH1tmsdDoQbnCOwtnySpcQ6DAVvvqBjYwA1C/rutGQUJLp34moAnxyZAUXVEHw+mHr8ZzmNgEnv3yJfnEyQN3SMqV2Wki+S4uq9nHf4QF5meSxXa4ti1rLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990517; c=relaxed/simple;
	bh=wWzRFvVVGH2YX4hnEDoIFpmU2i1p5wbNU0mAYgwDTRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKOs7at0nqvfLwFQN8xk4fPWJFLFIMzCeDEgLBDe75MXXNi6ozp/wXGr9Yp1jluL1qqd+y04Bw5hWl+MaUn2tlExT4sa7ekA/MMDIEmWmkWd6bq8qJyD726Ecuuel8mvjgXeJkhb0C8lZ6CBI01nAy+MWG250E92a/jlDqLAe1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZhxkBsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbkYg95E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65940JKJ1520164
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+MUlD26qjSFFsWjNX5Rl/mqpEy4GVQMqKYLWQMQpVuk=; b=TZhxkBslo4cZAcM6
	BVjKRTXVuRQClIKX62G6lhONmrJ0R6f+2e4K/EK8FJALlHtNhN7FLT+QXLymro/d
	pLFrMVe5iA30sq2I8E5DN6hum5LgyV0YyxWHc7yV1nEl4XZr3hleSnN/+efBbnEw
	7rEgbYJXTX9LL59SjddK5hA8Lx3u/fLnhAmi0f+1OKSInr6sfXp6SD5vwu2SJiBq
	so+v6+vPNVGGAFC4VuivWgKe/m66QzclDk2uzcRYEhArV+IGZn8vCJG9Mf2mZWYR
	sQv04mdXM2H5riO2CIKB5+hNx9+47Lk+IUFH83CfSTl/yJ2Zrb/nMJ40q6mBCviq
	IQX32w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvck6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:35:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so2880421a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780990514; x=1781595314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MUlD26qjSFFsWjNX5Rl/mqpEy4GVQMqKYLWQMQpVuk=;
        b=LbkYg95EcV2chb33sO804lxtU9koEZc7qpbBBpUTJHY9F90xsF4UFfFtuXAcH1OxFo
         Isp6gldE3jjvVq63XiP1+qdsypEVYCD/RqX8PCRSEbHfYCGDzKe2kRy/F3V1+5XFr/KW
         e515Yn9wtnZxoZ4LJLObnrztVLWsONozdx4+3wh+kSVs+o4Jvwykea4SweBsaGYlHC7R
         jtfSXWPg4vfcPEg19rJujaDyKHtJAR518zUn0AgbKl+PV6vz9os4d0RFbQY1F2y12GLp
         ae5kFLvGLlolqd5zmRBfbycptFFYdnIW7XhzodscDnG2gFLUbAdhDJnX5VMWEElTr3Zy
         U0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990514; x=1781595314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MUlD26qjSFFsWjNX5Rl/mqpEy4GVQMqKYLWQMQpVuk=;
        b=U+3g0sg+iS9GoNQFCNcbCDk0URmtHO2xGJiWtDEMoFnHx3uyb/dP57wdaZVMHP7u6e
         ljGOW7+rteYtv7dURNHRsAxlNRQUMFpmw00KtTI7eVVl+oZVsohMGPJXbr739k/O2USO
         11G0YL+rVAoHnjQSGfxYhheWR0EACbWCd3qtUXTPSkW9YQ0Ouwx4hEUscU1/S5Y6irRs
         76xgfsZU9otHHj37FiyvfN3Se7gSbSLp6J0wdMhEwnnaNZZD73G2Rshj9clQnNR+zX2P
         HL0D+r0wOVJB0RgCnwD7yof5cjbL6bGwIKtakfiWjjjhfCdiSWFCq3XZD4SlMxjZJrgF
         koAg==
X-Gm-Message-State: AOJu0YyZrlGZwKkv9Cw8dn8gBWXjmWTpqKlBztmtFw683JlClJ+IdUd2
	zfhdhXQt3ZrhbunUVfn3ddPQwD+lbEOgMRTy5xSk9wjwYEBtvZ+SRTwcje2thRSjGioX4ATG1Ld
	QcZMZaIWI/G9fhN0RKHPb9eSChz5vv33pVhufw55tK3F6X/19HVQxAp+pvoUOqufoP1Du
X-Gm-Gg: Acq92OHzwljH/qCgBNDedB/WIUPQZrL5mEpLFDWpQUhjdapQJlBqnT0B2XQLs+0+PHc
	6SpSOIwHyAB7ns4z80C4JsU3n2Gc5xzrCU2PKx7UWliZbPndn1ZBS7ZxIidipMw7j8TFh28Lf15
	EWvTyBcN5TyQ60j24hy9F8a0EUAGjtczdq+kWwN6CyqjvkmX/xByFXqz+cwRNQG9LSPKzA5E+5/
	KK+1DWTHH2p92nau8Zkv10l8pDHETTE+m1ryxiYsB72pGrOa1jrc/6M3o4RNlN2J8/3wd4XJPv6
	H13vjzLVVRbRm62FuvSRvlJLHtt2M+wZSYj64Xzd07fTED6IeaEegziV9dlLHZEZZH9DilLz+15
	Y+kuYz92OIN/kXhYmo0qPRK++xchVxDeb//1Lzlxt1R/ppfKJEI2eZgD6X82fZgE5VdM=
X-Received: by 2002:a05:6a00:a21e:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-842b0f97f5dmr19916204b3a.18.1780990513913;
        Tue, 09 Jun 2026 00:35:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:a21e:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-842b0f97f5dmr19916141b3a.18.1780990513245;
        Tue, 09 Jun 2026 00:35:13 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828836efsm20221481b3a.38.2026.06.09.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 00:35:12 -0700 (PDT)
Message-ID: <5ab6d5b8-41d7-421d-bf3d-370371caab4d@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:05:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-1-75356d1b7f94@oss.qualcomm.com>
 <3c441940-e4e6-4626-8ff8-36db41409644@kernel.org>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3c441940-e4e6-4626-8ff8-36db41409644@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tTAdjJeEjo0nedn2NR9foSN-5uj5XsXP
X-Proofpoint-ORIG-GUID: tTAdjJeEjo0nedn2NR9foSN-5uj5XsXP
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27c232 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=vAWKRZcgqgyjYCNlygsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MCBTYWx0ZWRfX42YrC8zjQyUY
 11titCSAlz0/JE5NaSN0coOg9GJKidlOFT9hs/lhJDLAUibuzjiC8GgMlJW5hUMA8IrraCpE3hm
 3308bD0wETazHNJHMqi60q7lMWUDOXF+4QmYLZRJLKvUeNy35/hkwJEeAKi3Oakl/oQp16PO/Mu
 bSJilJCDDb9W6u/yCdmgZEFYCaXQCTlqdXa1EJ9oqiHO9L46hEYR311eWjjA0L9ZTnjBouEpg9D
 21hHQPKduI2fvxSIdL/LvqUFnDq9r5dVz8ZRjM3+Ap+GvQk4pzdZKz+ZtmBDHvlRGPiHNSjk+jD
 N1vmfa9puURNbwYr6bVJtoTeZ3HWAC0w8EcJLobedjTUDxx6ud81nCieV6zoCvuAh68+x4PZMJ8
 y8KyBU73gUlPVMFCdtMZBTyyaNzxo1OkXGZvfdGCpd/47pJVHSOBDzGuTSJqj7/fK2/7mfWoz3S
 E20h9vcSZbXhwSCMepg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112029-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9B565D4B3

Hi Krzysztof,


On 5/30/2026 5:59 PM, Krzysztof Kozlowski wrote:
> On 19/05/2026 12:49, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>> new file mode 100644
>> index 000000000000..e9bb70c3a3aa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
>> +  power monitoring and limiting capabilities for various power domains in
>> +  Qualcomm SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,spel
> 
> You don't get generic compatibles. I think I commented about this enough
> of times.

ACK, I will move to platform specific compatibles in V2.

Thanks,
Manaf>
> NAK
> 
> Best regards,
> Krzysztof



Return-Path: <linux-arm-msm+bounces-94219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPEFFVXjn2nCegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:08:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A246B1A1349
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FCF4303FF36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4F238B7B2;
	Thu, 26 Feb 2026 06:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRpRAsCU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoGIOVAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895E387571
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086060; cv=none; b=sXoRRcG7+3RwRMKZh0zPS51NNkvskjuxOC9WYe8MHSBQd8+Hkhs2DUna4pxUCckMNtImMFpEnmKmrCWaUK1NwXHimYaSX67bpQC6c7KooPd/1aXC7ZQfpBlrqcnkxAbvKGurzMsU0RqespCM91xcMCXAmms8jPSrziuZe7A0N40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086060; c=relaxed/simple;
	bh=QvWibBva0xSDel4cPOlNzbIBCNUOeMrXiE379I3hyPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxy8p1lJFmljXsG0aI1ahjB1p2BBr3XeU9etIaQnFZIzlA4KaqBgWw3g3jBshT8P/xvNVoBjI8651SKKdonc7R/vCMEcx5lY9psYkhNZxz3/RfOMhh752EhHhzQr37itxmm5GUAGyd9+VL0jxEfD8G1Al5YWWbme6GZ10FavYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRpRAsCU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoGIOVAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VAnp350356
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=; b=mRpRAsCUzV5g29KJ
	MVEUWokgEgo+PlA2MbaGHY8a4G9XVYQu0ptG6vHSUzodF62jMErizfog+bGJBN8g
	eHKKEHT2ec9ZOYrwRGWBJyVWnaKE33f2cl9uDmCHw9ZnWkqpLgc69gijSDkpgBvQ
	oHFELGHm3CAPHTXEfXSiOKrDyBs0d1rP/nyDLY5wqAW8bzxpjbjBBnOVwBu84bBY
	Lg01IV+vUCp9dYcjYYcX04xZgviAN72bCErWZ1Mj2VV1guqKaoyfq1cae/ewtrVM
	yjAby7CdCJfYsyVPyGxDB0Y6mA4b/sioR/uATNkcBV7wEWFO1mejBDV60htGGEIy
	AJEU4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54pa0t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:07:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8273855525aso620711b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086056; x=1772690856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=;
        b=JoGIOVAwOeEftlPVpqLsQokfwmd91BG12SXuRvXNi0zdke6l9JO2R7jtJnXeHn+N++
         1NoiqaTLJxDW2nW4ofz0nN/30BsW8tQS1mazDkEC0oeeDdZXwAJCjKbeygWAPRsmP6UP
         eIiMF6QO7h9eWJaEZxuwJbyNH0I/LgqDXEWe+GuWmiMg6XiPIfWXKEgPvshk1qRYGT2b
         EQSyAjd0qeqlPpM5XEuFcn3N+1b33A2bTlyxcqIIZcGcd9t2aap92fqlT1Zl9AiIJjpM
         qmnjdhOvEqkoSwGzWyfhoSTcHQeMtqMgjT2KM/47D0iFnwaVpcxQya0SfBYIOi7o7TFZ
         SzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086056; x=1772690856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=;
        b=S6fN7xQl8Tm1Xrmit8uesFq3Zei0tae64AB0NTF6/rwxMnGeuPr0VUZvr06fPhNUOY
         17a0L0ACHoSRIewzEBNMoGX/boo6ZwVXX+EETjhpI53PMKdMhgoSJxOdjfH7jIYWvszg
         LXJZEJWLySQrmWo3T7pDFHmOEsVD6XkJEpzCa7PqoyGytAr2NNM/wH4Z6iHJzFnFqCn+
         lYiMFffmpfZRQH4ve/3Q/H/XGUYPzw0tNAeLuWkwT7PwCmKFd5ax5KJ26lNHkq54e2Hn
         l1PFk/q5IKdTt+IkpGLQqpV93dEJU5h+5i52A3S6U/WB3rYrznyUB0KDR3p5tJXqpP3H
         Xn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdI7YngCYufAK4wVa43oKnk8Hb4Sum9gS3hreczWIVE9G07vPfAu+MUctE6dSOosNbHJEiB3TG6BvJHVEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwh9qmIXauJYveAbrzStJ0Z/L2jnuTUNG8kM8texVpRMng2+9L
	J3TbUKgbvBPhM6/A+zWrdRRXrp+01sP43hFQy5FMQEXkD3WtiakA8+rUPA/hgDnS+qqT9aYsbHW
	qs/kJSexOftWVLXK+cJJq+LDQR+6yfxpnnzFYS4QA+iM90KYGsi0aljv2GK7UayiouC4s
X-Gm-Gg: ATEYQzwDXTdIuPCag9a2j0DDzG2s2Pw+Uw5hqF+B0iVfLAI/x3CxrtiPVtYXINtP+OR
	EekE3Ez5A0EanVeDWtURszT7kkztIEVKU1mpLig+MDvBP2sAy82bFyQPZMPPfPT8IWzp2A6hFVq
	nQpik1hjtSnlWcjA8q5tX9qJUzM/ho9GZQ79NU+9lAcFI/f6fSUo+yEt4zQnBofMGqFVfXWC/6D
	GXW7WYlDOGeec1N7d1BhaUYOhwoVAfIEY/08LX6tWe3FJHgkiG8+kzqQjRsU+vNALvLg9t0wJGv
	KAVKxUGrTFnlG2TUgh/JjxaX1ccK0Q5ueBoXW+WfyGe8Yur7zraSHiMYq8BbsET3N+W8X0Dem1H
	0MtWjaJud9NKnVHA0sb5LeG3SIjfOdJbsg6oS+ovJSsTFwq1yOgeBpPrC023pfsMAPpal0vYhr7
	K7BsjkJnnFIg==
X-Received: by 2002:a05:6a00:cc8:b0:827:2b7f:e1d0 with SMTP id d2e1a72fcca58-82739827658mr1697779b3a.24.1772086056039;
        Wed, 25 Feb 2026 22:07:36 -0800 (PST)
X-Received: by 2002:a05:6a00:cc8:b0:827:2b7f:e1d0 with SMTP id d2e1a72fcca58-82739827658mr1697755b3a.24.1772086055513;
        Wed, 25 Feb 2026 22:07:35 -0800 (PST)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739dabd43sm1290899b3a.25.2026.02.25.22.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 22:07:35 -0800 (PST)
Message-ID: <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:07:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
 <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MSBTYWx0ZWRfX2CwyiGtT3Dk/
 COLiyoLfs1anZszsQ3CU53vGMvw4QerxkXbLiU9/zWvYyYSfRhr7xxwYNAjGlo/kKJa505tsAW4
 qC+KwN6V/bKr3kTdAqG1z1QZM5My5E9iQMFu6EkyAbYdhaol/jgjaUPelLQx1Hvfe1LJEyDXn70
 XJWqkDjiQ5U01551ccX5V1FFKueF4VvhcWXHe9kNQF1cHznJNtJfpLC/EnAnbGk2EYWjrlkqQoH
 ud71VY/gTpD+db3P0d7VcPZultgcE4riOviDir7FwpACjJU6dUDjLWQbSNPTg4S4Z3IIGhh0Atg
 E+jzhiqnBHGGYvU+WaERxvsJfoXNQVhwCT0E7c8Ar6Uhxzc5SUZCoVQTwGiK5USLYMmfa53zYi3
 bw6FlV2GYq3iqVU31zg8JokkIIvaQyC/5wNXabrJRCehDA6amiQotrsJ2I73sg3m4C991CcPfKx
 IgvgSF6d4mW5bMeLrdA==
X-Proofpoint-GUID: DUSudGbJg4nHIq2Rw3yYdGkBPQ8h_byv
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699fe329 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IwjJGIUIzvyStixYlZUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: DUSudGbJg4nHIq2Rw3yYdGkBPQ8h_byv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94219-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A246B1A1349
X-Rspamd-Action: no action



On 2/26/2026 10:04 AM, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>     TGU configuration space
>          offset table
>   x-------------------------x
>   |                         |
>   |                         |
>   |                         |                           Step configuration
>   |                         |                             space layout
>   |   coresight management  |                           x-------------x
>   |        registers        |                     |---> |             |
>   |                         |                     |     |  reserve    |
>   |                         |                     |     |             |
>   |-------------------------|                     |     |-------------|
>   |                         |                     |     | priority[3] |
>   |         step[7]         |<--                  |     |-------------|
>   |-------------------------|   |                 |     | priority[2] |
>   |                         |   |                 |     |-------------|
>   |           ...           |   |Steps region     |     | priority[1] |
>   |                         |   |                 |     |-------------|
>   |-------------------------|   |                 |     | priority[0] |
>   |                         |<--                  |     |-------------|
>   |         step[0]         |-------------------->      |             |
>   |-------------------------|                           |  condition  |
>   |                         |                           |             |
>   |     control and status  |                           x-------------x
>   |           space         |                           |             |
>   x-------------------------x                           |Timer/Counter|
>                                                         |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>   1 file changed, 92 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> new file mode 100644
> index 000000000000..5b6a58ebe691
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger Generation Unit - TGU
> +
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> +  configuring the conditions for each step after sensing the signal.
> +  Once setup and enabled, it will observe sense inputs and based upon
> +  the activity of those inputs, even over clock cycles, may detect a
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> +
> +  The primary use case of the TGU is to detect patterns or sequences on a
> +  given set of signals within some region to identify the issue in time
> +  once there is abnormal behavior in the subsystem.
> +
> +maintainers:
> +  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> +  - Songwei Chai <songwei.chai@oss.qualcomm.com>
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,tgu
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,tgu
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +

The TGU device is no longer a CoreSight device, so I think the in-ports 
property is no longer needed.

Thanks,
Jie

> +    properties:
> +      port:
> +        description:
> +          The port mechanism here ensures the relationship between TGU and
> +          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
> +          function as TPDM's helper and enable TGU when the connected
> +          TPDM is enabled.
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tgu@10b0e000 {
> +        compatible = "qcom,tgu", "arm,primecell";
> +        reg = <0x10b0e000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb_pclk";
> +
> +        in-ports {
> +            port {
> +                tgu_in_tpdm_swao: endpoint{
> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
> +                };
> +            };
> +        };
> +    };
> +...



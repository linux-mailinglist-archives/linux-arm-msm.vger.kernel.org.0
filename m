Return-Path: <linux-arm-msm+bounces-90334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFRFMPhbc2l3vAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:31:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2A7505B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD474301C5AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9567729E0E6;
	Fri, 23 Jan 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFKaEJnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jN2XyBy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC632641CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167846; cv=none; b=ZvqQ1YzLfXVMr5Yme6lHdC9F0WA5hCQQJyOFJ2McHkEbSzHD1aqlsZ9XstjAro2MFHL9JvaKuVG3FEnTAt9PjLS9LwbqBPs7qVAmSP+r+pokb3FwE4KQoIX0I1N3mFQSzseBCYOknVwavDHKAsQx753OkVq4oWFQ16z/JDQeDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167846; c=relaxed/simple;
	bh=HgHZLeRI45lYIBDGvCiahkx6GqLM3bsQcdVA2PcR0eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3PG8jUmpNworIQ18B/dQzTeqao0aVGqY4wyzjem3EwIu60/+yub2nOMTQI4EG840AjIU4cAhgKuDwYoBbCSBEM7+CiKLTNOBbTemK3QrOh38haEyw59m8glHf6booh5SA9m6A3Kt6isJyPoKl02s+TQ4Dqkpp78tkcP4t6r9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFKaEJnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jN2XyBy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6TuiW2915967
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iwAyyedpE8I4ZDvxsvut22iK6mBVirS7MV4judrVUvM=; b=BFKaEJnkh05et+aO
	ajVTYtNdPPbxphhi2QwiHoMtbQU7hlvaxCzLt78BV539CYP2L4P/xqpTqiizQ3Bu
	wOt1I4fw9zEc1KmDmEQLBSPcIay8yg0+WzQsaV+1vsU5M9mRRGLsrvInO80frzm2
	0raB099qX+fRswVAVRrcFezJylWuoMw7ghrqgx3t2hWh4ZsnZs7GsZomhVl6for8
	HaQjiKHC+n0vyGROvIA1KDTzHr3RGOP+iEsRlAoALyXqDWCNvOFobPKblArgZIG8
	S2BLgTJVAj/N/LzVhkmOn/xnJATvIUFGCOPEE24PKYGu7qc3j//LqXiMum6LBVuK
	6MEsLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1tfxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:30:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c69fd0a87bso181137485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769167843; x=1769772643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwAyyedpE8I4ZDvxsvut22iK6mBVirS7MV4judrVUvM=;
        b=jN2XyBy0tJnC8xnVlgDUs9gmpY5cilPa0E+gn2qJPTALEvfuhBnPjujNyUpMisFM5b
         7Pg2Z+U06pwa6ZiLqRnjOtDMPC+USUcjcv8wxN+mXt9Z5X70gE+4xp7Lr44azA3YrjQz
         chsBCevtFWIvsMiae6UOBBcZpSM5NMo2FxYKOd1tYmxPY2mU/k5aJxplWweiNjQaLNgy
         eAXc1ykq5oAAgpE1H+UEQMycZcK3gSZu9VDlMVP2SiNVNX4D1DHhQsXZqRIHZ2sSn5RG
         Jva+NVAYPtB4VjhnxeGpwI2qmSTfO5lfTWss9dyxhpxPpSvJRI6g9RjM4GH7oaPEG9fM
         FVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769167843; x=1769772643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwAyyedpE8I4ZDvxsvut22iK6mBVirS7MV4judrVUvM=;
        b=u8ShM5XJS/tUxl9jouW7JvE4S43qrIhE5PwQAa5jcw6cGNDPqWsasgcE42cHlPnSAI
         wxNZzTC11T8YNkAaSI35HR4DdtEcoK+7yLyB1Zq1HQD3/K09EI9R7O+ml/iMQ8zhS1b0
         zN5EU6dnn3sGr+OtwhsIGbOtbm05vEERJRyldicZO+WgRcGKHqfGs2DDBU2GYXkk0qDa
         jgfLL3EXtEyVkjVL3CQf0l8A7EMYxrn1NRms8QIuU9UkF2NdthafktKxNLVpw+XfN0vh
         d+0VFBqw3VOtzPZrmyEtfS7juyOnWlJJe4m7zbyEtHrQ3NZHo05XXxzs6+QGVkaR5AqK
         0JRQ==
X-Gm-Message-State: AOJu0YxJi5cE+gw7KxCQYM9LchD0yp4ibGBGA6/KfekZ9Qrisndes7eG
	03jh33TuYcEh6HGBWg1O5bxTYZELppaWer510O21z18KQXVq2L3Gek8qe+BLsm6Yts2JnsDj8eI
	yXGFdMr+8kAH2HAZSfyra64v6KL57G9+rxmc4Z4ffi1d2V8T/y6JkRB7F5QnKKkAm6jbG
X-Gm-Gg: AZuq6aJB0ooEU2SQaDZmpguBrGZQCi9hCin81MXAEnBoNvEuEZ76reAS2QGKPGUu8Sb
	me7uAL6JWo1KTVOD//c8LmYsUfcE0G5RkL2wj9mpiRkFhaaAr4i+urrUwbQvc2C53BTrJdzsh7K
	U4/YIPfFc6QLvepD4CjrP7/QfFmPpisfMP0OsVMQuPrIbxH401hLMWKlTX5GwjWwSBPgExDT9iC
	OkcfMEx5HP51y8R1X4XTElEiK4dVHetmXPfhXjDX0jLB34EetsbCQHIf6dWIVlfPCF8uxFHw8rB
	L2+b3BNG/s46icHoBuGA5h60zZYPqVyN+htuGFKoUJj8MOq6errQfqDj/CF/F9XXAMEUKMf2G+G
	AQlmkhLyYYJdpuaOSEb99WVmxQcCn2szNgwXTcvDayMewfMCNDdIhslM6cMSfAUNcVG4=
X-Received: by 2002:a05:620a:319f:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6e2e10500mr212987085a.7.1769167843356;
        Fri, 23 Jan 2026 03:30:43 -0800 (PST)
X-Received: by 2002:a05:620a:319f:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6e2e10500mr212984185a.7.1769167842814;
        Fri, 23 Jan 2026 03:30:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6ff080sm88260666b.38.2026.01.23.03.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:30:42 -0800 (PST)
Message-ID: <eafd209d-933f-4c86-9b9d-d13e334bd5ee@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: talos: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
 <20260123103503.1259645-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123103503.1259645-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hzaeYRwuv5i9RV7rTWtbMuEp0fEOC1Y4
X-Proofpoint-ORIG-GUID: hzaeYRwuv5i9RV7rTWtbMuEp0fEOC1Y4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5MiBTYWx0ZWRfXxRz5PgN6bZEF
 j6SerXqA28sY7EMUVI42h+8diNuLkGDMvEFFQDFvGgHmgvwiumVGVtKN4pOjt8+lY0jeKqmtjOO
 iuKmVN0SI+kMJxbVQElq6Zm/jEj9abdKRs1qSFz+jcORiSS8lz7Vk6ZEG/yAd/YbfaKKIuYPVty
 crnAJI6h9y7ezZ9GRO7Isu3UCdyzzCI7ePaxAeXGk08m/acH5wxX6V+Eo6V0tjn8hsyj7o/dLwT
 uYz5BvHRY+bq6gLPyBLEnClpNPZjdRHWP53TQLmP6vf8tFyCsa3A47N4fzOSh2wpNQJD8f9W9rC
 oMFBMR8vJlTQ8FDvYBTm3WJTliQE5Sm1RTOO+m4x2NmHBaB5OMYDM1Xap95xguVqe6qN9uyDpWQ
 xIHz2imQQDG4UzgaK8zXOE52tp8yxDqHHyXWITDCB3LnKV5v9/7HXN3RfrMiUm6EKxnMfMvN77P
 Vq03cFpiQAQriGkpk5A==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69735be4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=9xatLwlGkz5OWhtWUXsA:9 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90334-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61B2A7505B
X-Rspamd-Action: no action

On 1/23/26 11:35 AM, Mukesh Ojha wrote:
> All the existing variants Talos boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices.  However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Talos IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> This patch has dependency on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
> which adds gpu_zap_shader.
> 
> 
>  arch/arm64/boot/dts/qcom/Makefile       |  4 ++++
>  arch/arm64/boot/dts/qcom/talos-el2.dtso | 28 +++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-el2.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cbf7d89e432c..48ecbea17a4e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -141,6 +141,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
> +
> +qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/talos-el2.dtso b/arch/arm64/boot/dts/qcom/talos-el2.dtso
> new file mode 100644
> index 000000000000..03ca04c44976
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-el2.dtso
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * Talos specific modifications required to boot in EL2.

Preferably merge it with the previous comment, separated by a newline
after the copyright

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



Return-Path: <linux-arm-msm+bounces-109090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K+7FmUKD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E05A6021
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2326C30B53E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B4C3D7A05;
	Thu, 21 May 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGYqDLBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7Q4G6FN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AD3D75B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369384; cv=none; b=iC+XKYVvi+oPu3FrCWIAe1FLZkmR0BVafAg7OM3unS6chSBWUR01FQ/qO8DIaIvQJznpUNrkf/DN53ENwbQotT79QaWCSZqHvO1DCrGd6/uQQ/QWeNGd4JWPiTw8xxZBGAQMfnb7D8R0LS/XelwTzVWfbC8X7W0JrnaXbXuv8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369384; c=relaxed/simple;
	bh=o5nagHM7th0l0M7MvXlGGwb3D8mtuYwjEL2ZjRyY03Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEDR7CrPL9mBzy9D/v+La3obEyR+b6gJ7wXdv+9wXUpLEY+S5y6cuN/awgWlNfYudi3cThScgBkwPtDRoXnJf9vzROcCL1Xav/1+YIloEkkJ1RCp8+3UVg4Thk7vaGtpz7auJZttocWj/15EIQVq0buvUTuHYqGTJMvF2dgPM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGYqDLBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7Q4G6FN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nuh3118648
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=; b=QGYqDLBR2APNi0ml
	rPtkMTeeM3ci8VYpGdG9dSh4tSLgq2CVr3ipp0NeD1donLbZeHoFcOlNDqNiQf3t
	RnZR/5aAIdSsnsvBGjIuKOBoMJK7X6z01ZC8TZYkbHywWp1NxGIm70Wt2JpROyyd
	6JWS7pmo41SopPr/R2MzAN/3tScPzhqClkSHnOztzX0jUDWUeh1dCU0JdPA4mlLs
	vKvZnvxxEyQcyEspOpfpmpdSrO8lhqLJoby1iURckLMgOUqdgu7K6eqwIZOARS0g
	9JXJ3T9Qq/83/cP5rD45eSMKK2qA3NWMmIId3/yV/V7VMg8InTNxccBX1Wwhfwsr
	vXEAdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962k0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:16:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so5512257a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369381; x=1779974181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=K7Q4G6FNF4XQYnNWhsrWcIn8kym5I1bBREQBafZv7/V5u38z35PmCgVSFAeOrlrdGU
         X6PyspZIcP/uKAkfPhZZZFc7D6smKffRVeIVlPml/qCDVItIqANuIiBWaVVyGrQZOd8R
         9TFcWPFK94buxD3AuSDxsUSMir7rNCSlmV10jJhuqqgqqX2gtkF0trTC/CBTetQi4ntQ
         CtDQwnIEihQaQ/aCEzauvwDtq21rsAwXN9QsqvjcTIaKDQBxp8ECmyNqwA2BVe1WB/Rj
         8DwDIJf8roVVK3fyP9Xldtyj+Rw8Ng7QYD1FQ5Wb51ywcSOuyc1wA3WHhYkY+8I3Xq3N
         PJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369381; x=1779974181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=qw4KzSA+1xJ8E9qA7YByfLu1FU5LQJ2RRkpLtvxDVSW/ZhHQ8kPWzFvS7CJAUZkHSo
         yyMbBUPXCSf286YKWSycgMz19nHQi9Z9h+R1vHgA/cdyai7MB6ENnuat8yizGE3TVZ+Z
         uO2Em9Ok5MJhzhYkHYijYdAQOROU4el7zJ4TAab4C/f+bAaCm6+3zfkDp8ON/3cfrVq0
         VAk/8ezq4gcNSShz/L6P4v/J3AwnNCOEwG8t62fA0SyNUIa5mJl1oT1Anm715BWnivu0
         JsDbE7JhDmjV1xoIc7mUTFEN3E+Vpa1L0WO6YBPO87jxDvgh4+ccDQ2kBRxxvn+oyJcj
         sGFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Sy9nQUQeCpbujayUqM5EXps++bMGlU97M8VBMN3p1HcWSz6LZhXVTHlFew54aSKrjbZdO8OC6juNNXN+C@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5tp+zK7XZqneVlVzjvRADnZfvShfEImb2z+gLVZ5UhJc+OHU
	e1EeQMEo9pxwqqWKMPUDG+DubTV8KgZJikwYMtmdGJnaqIEURJQVWurzVHUahycncGauLuNm0vQ
	cx35Ys2LN+gxdpOV9xftnTdRaFziYGYE5F7BimJ0wkA7wWOYSbWbp9GZMLhuY/MbLBYS/
X-Gm-Gg: Acq92OFwhgxWsUpiRgsE8VKMGQ9J+94fQ6FY0tP+iNdm5PVACkHz0xn0GINyLwfLH+w
	HS56rIFRX20y/b0PEPlBltlCjfqvl+EHbUZ4jTzUq7dZrkhN8xxfgvTSIWTAfrFiGnfmmGV46qu
	pMydcqOY6FbS/x9mLGqVMxm2IduSyfMKkWPwg1OwG90WyGCpzHsv9MvfU0LXrXRh5oHEJRRR4zr
	sIcAX8NqNNV3GzH9GZZuxvkSdvI/4N1o7Zv5XvKlOQaTk9etfsPbTURBaHdkro8wxTzE7lD+3mE
	iFAMWj/DoV9T+pNGSb7D3zpALs2Xx/+hQpuicJrzDbCInoKU5nyRFmMxe95NO/E+rBdQNn61Iwb
	Ragam/dp9IyDz7MiizuNf7roBHkXAQh20trI+PNY5NEXLNGOke9Mc35PnXTa5zDk=
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836415a91.16.1779369381106;
        Thu, 21 May 2026 06:16:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836371a91.16.1779369380614;
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Received: from [10.206.98.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5afec699sm775780a91.4.2026.05.21.06.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Message-ID: <6bec7091-6fe7-4cea-ba2b-f405369745e3@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:46:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9oEMgdMlIHs3S3k8twCclulRUfEHbKKI
X-Proofpoint-GUID: 9oEMgdMlIHs3S3k8twCclulRUfEHbKKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfXy+QkVAzsw2YQ
 NodHeIaa0cNxJ5Nk24gixTkBsQYQs2xuGiyfC/rFMWtyQCfbSYi1dSC/eliWhkbj9q4HQc9lzZh
 DpRAjeGqJFtLOOdP6dZq3OhwoTL3SmzejTKGHb9t4AZFcd3T3NnTMq3PhVydKE8+lUXTElaZiPx
 fxKSs0omZ/6CM3vhTy3wSfrz0+6tdqDPRUT8nZbjSitNrCRyi6k8O/DOsjYcfRgPw4z2YzGJRro
 bUShmA/8AY4xfsuzbuwl49Sld7vfP24VFBObK/xYltfR6wIUiNsJYflc15BggbpFqRLOWBMJGd7
 rNlQ1/lk9D7rYLaHgvqiBs1pp0x9CrFt1AbVsgaEV+rB8tXuTpYdVK5HM6KxK8+oy9ttfJDBUPJ
 GNypXtRvYHkxYkxQsabKc2YqUh9KZH4/3mVsVn3SE1y084r3bX8Ffg2llM5EogTaxGuYuug0++y
 kQnTx2TqnoGxL/KIHtw==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f05a6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7XmJ_PM_-5BJ_RrxexwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,acb7000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F19E05A6021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> +        camss: isp@acb7000 {
> +            compatible = "qcom,x1p42100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,
> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acc6000 0 0x1000>,
> +                  <0 0x0acca000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
Please cross check sizes for csiphy.
> +                  <0 0x0acf6000 0 0x1000>,
> +                  <0 0x0acf7000 0 0x1000>,
> +                  <0 0x0acf8000 0 0x1000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>;

Regards,

Vikram



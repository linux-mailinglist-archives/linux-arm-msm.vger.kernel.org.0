Return-Path: <linux-arm-msm+bounces-81277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62DC4DF2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF09E3A4A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17CB324704;
	Tue, 11 Nov 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQfOSgYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isCtypYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B6F3246F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762865222; cv=none; b=LT5+29DfU5NRJMSCdt37QFF7/kXRA67rkzfbuk13NKfWt7XwCw0cPlmAp4AFbdqCWDOsAsPW3Bxcvv3ux0Iy/se1ggoBGZSDJWASt2CtdgupOKufHHG71TpXJCl5SwmicbvI06EszLqUjSjX7xiet7NtUcxFR1GZLBoAlUmnE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762865222; c=relaxed/simple;
	bh=vI2c24xcDfLO+jj774i6XGCsjUpNaRMZS3K8xPM2Qr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6lzeMZbKYGMbq4KBfJFHuznDcLNr0ON49SKZ0rFU0bg/ed/sn3+8zj8BmAdM1jbSTaAum9opykumq4lJjXyySSQH72//xSdiQFsCZDeFEolD0YXjx4JVKlpjUgK7SZanb93Q9vItg2kGFwVKuWpuFYvtBNEm5uG8Lmzmd6u4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQfOSgYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isCtypYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBH1Ii2029211
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcgrCPztTJBR65GQBdHRM8vG
	IBP891DcZKanjQPvZlk=; b=OQfOSgYRI409fge3xzAPl1zyGh1B5qggKlE8dJ9t
	7tGU0Iy6M3IpsQ7petXXseFGlD8E2Fjzu1/UXXq1xmotBXJ5PEtsxTlwh+OpV69g
	Jd2CqZlRGXOD85TNRmKFGa6jgJYlo4dTgpQzM0kN51g6l01LlZbs9nJgpmTbTEOz
	oYFhm6zy30mLObmBJyMilSLomeqaFxxlToA2AzNdqKBQSei/1kKkOr1TJHhaQZNk
	E9It9O4+VrxAYgj151rDfZvzTmVsj+kMyPO+vGzD7/jnRhEGQRwS4bIvJnM71qtB
	2AZsIUQWQt319t/kgHlprzALrj7ARmEAacxX0voP7QALMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw18p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:47:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb927e4deso64392271cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762865220; x=1763470020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=isCtypYewDqx3Xqp1Bie+YA2n4Eyke+4xOIX/aZFBsD3gA2z4Wk4IF9y5QCwDaLbis
         UGU4ja2rWyGTu/6AHSU6wfIiOiy49fgQwZzW0kswmv+LIgHNgR02BRX1cSAzSyZqSLsU
         72C/z79D8CbBbOBaVbtj71iYPW5eAhH3Mbajr63n34e9xvRDY7PAaE68vMmV3VJ64edK
         UuswBH/pW5E91NcDS2IX9j9qFXVofF6ZrIKCoD13f83xhWo00FIX/aIoSgaOkG9GoVzy
         uFb1vNMLvk5CX2A2GVttLGMionkbk6q5l25JZaafK4DyjtQr7velDN8kYt87Gss3V+D8
         JS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762865220; x=1763470020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcgrCPztTJBR65GQBdHRM8vGIBP891DcZKanjQPvZlk=;
        b=Fpw8uombId84/sIOwgLqhEDygvW4UUYJ3/0Trxz/FqdmlidEEUctXDfR6/pU2WfTaX
         kIwNZeCAwQHprL1cL77tITSThjofagYg0kpYqXg8I2hKE4+qXli48BcV6sSBSBxN+9aJ
         z/ID1OtFvBd5Y4CN2eDt2dlG4CbhBuiXfiHTmvAeKVO0HOmfNmuGK5et1hWJlfXgJgK1
         uPpnbCzhgCsqEWoPLXT7u+leOZ6ZkqGwItw3hXqP7FkPcHj1h6oUlOmnFGMhPZmCM8u7
         ywRKbBZGLPGnNK82aNwVyuQ/frAwyqO+/sprWIaZ0GiN5W+d4vfKm3ypC43YxES5F/Ht
         OzEA==
X-Forwarded-Encrypted: i=1; AJvYcCWHx8UuoeGSVqzeK0DB/Grj3+vfvCnWT9vd2CpEyMaNEbEjYBWVxYT7FyDY62dkKtFzn5Fwy/JgTq8ohIZf@vger.kernel.org
X-Gm-Message-State: AOJu0YwlZ8Cmd60i9tUbi7WaCRzI/uwAfn4xzrnN8ycFVjAc966A/d+4
	xCF2kw7kgSDh+Mo4CwPo5UuZxgUC5oLLowtmuABYvr0iibLdrPNJUa1ofyN46xTyTZFcTR9XTp4
	VSWLr5NENoWwrpb/tUop5hxP9+ZlT2AQX3jilqxcdx0dJSvgO2N3VY62+mmcgFe49g30x
X-Gm-Gg: ASbGncu9AJF3sTlIejxagegdjrWEjQbSW1EQtMSFRu8b1R+ixtC72nFZTGTGOKkOBDQ
	erS7h4RIbXCdYrJOsLrn8UBvGFhll3oU3OUnqTOfhMqWNNS4X7Op0OCTO1hEUAhKX8Az81Ialol
	FFhUFKY9CcBJwl/tWaDV8/PRD2VDoMia7KK5YTZCJ/RR9OhYFD/tUAP7OnxClWyv1y72TABYy2O
	vJ+PcbYATqYnplZDT1toEzTNHZdM2CzS7zzW6ZGVPlqh974vxBMph4OKQ2ovOn8A9GJkjW/N7HM
	OqTS8Edc94pb74L/ym4pJouq+tRmBtULRvEsljv4JXPf0GVUw4vUVop6sgP2kT8l2WJRne0IP+E
	0O8pLtyI8PoJwJ5xyv4Uefa+rSWUXEjtcPwJJTbhHb3wE7KynhE5IVTQee8FaBD2Fq34u24m4dz
	SLnaDhEPuzeArc
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999671cf.6.1762865219508;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhAlncYp5HpdTxD1HrQnjF1b0//yHkzKS+jDNKrjtjAklFMPHNI+T7aD4cdfUGmuDLd6rdcg==
X-Received: by 2002:a05:622a:14cf:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4eda4e8ca02mr155999401cf.6.1762865219022;
        Tue, 11 Nov 2025 04:46:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a39eb32sm5013667e87.82.2025.11.11.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:46:58 -0800 (PST)
Date: Tue, 11 Nov 2025 14:46:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add
 firmware-name qualifier to WiFi node
Message-ID: <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEwMiBTYWx0ZWRfXxJNiUEyXap7f
 AlkJFFtNAl/nBWzEtCrUN0WkzviRNBgak440UYk9FElBJfxzfSFxhPyFfa+EOxvsrPuSStz9ZPY
 1puuzskdRgy/mdlT4cfzJsTIegpNbRGyCgnm4iVc9cqmnzwqYM3o5ZpAiYeyJ5O+o8r8gYZq+cA
 eS44PtklKyvqqTp66DxS8eQ/uEm5XZaS3fDTOKQo41TM+ayHNkslc4BO8/7Q1erl+sUZjKG4nI+
 PPHSAFC9fUF5M3GlAKRjss2L6ySVKkqWe5BtXn3ww8mZ9qQYoYPapNvnw7zQbjuqKv3pgL2ufDt
 IvkNwUX2YzHY55e0nai9VIakIM2W7cWn8E1Dw+E/3IQbzVXBt1gjVi/D7hp1nDHtENvZMUUwHw6
 zmg8ZzVlfKv/t+nXjZSPHgLwH61lmw==
X-Proofpoint-GUID: StTEGdMI3r7nuqTT02PYW8vOBoBbboCr
X-Proofpoint-ORIG-GUID: StTEGdMI3r7nuqTT02PYW8vOBoBbboCr
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=69133044 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qG9Bp93c0gXLeqlDJoQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110102

On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add firmware-name property to the WiFi device tree node to specify
> board-specific lookup directory.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 785006a15e979..9b0b0446f4ad3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -631,6 +631,8 @@ &wcd9340 {
>  &wifi {
>  	status = "okay";
>  
> +	firmware-name "sdm845/Xiaomi/beryllium";

This wasn't build-tested

> +
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
>  	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>  	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry


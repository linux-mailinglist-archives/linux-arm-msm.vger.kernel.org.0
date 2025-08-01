Return-Path: <linux-arm-msm+bounces-67409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B428B18663
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C4A1C20200
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869491E47CC;
	Fri,  1 Aug 2025 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYysjp/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024F51E2307
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068498; cv=none; b=jE2Gvx/86PzeF//C6ND97dMbOPFkyCMBOd58PeIuuz59UBMd0WOLx393jOvUnKNRYm6l6KAqzXM+u/Tp7duq6DOuFJ+28K4ANAHhDj9R4PuT1VBryMB3juUWxp2lAlgGBDQq624VO+MKCUZ3rzW3+e0+BZ59L+ucRrYMfnta6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068498; c=relaxed/simple;
	bh=aOijRpLMfZAU+sXieMt/YHjyo6Js0ax034/IV5JCtLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q05A5qLLExL8Wuj7sKnD0A6/MTf7U1ODJMLgTlYWm+GRnWk/S2HnkaE5PJ3TPh1nqgct1jDZBkXMj3ggr+aQerQQoalbGxfWIRxR7hPejUJQIDuDxMiuszhVt7TXdA5h9qwMhjck6TM7IuIuBVjgHJQaVs1Tdb08BUvm82yrZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYysjp/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57194rpn020480
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 17:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GjIpDMJZqcrrLx0t+DaOeXkF
	Njy3j/r+a5kooErWBOY=; b=GYysjp/p7UOydI9jf1O/41ACeaPDHfC5Xj0UjIVY
	WiwMHfFPRmHJaCda2exNe2hdckTN1gqs2Om48b2HGKPNQG1SNzcXIG6K0Hca4k3a
	jkqzeQgSxg4HNMafdszgKI9sFanuaQ9RJMltKpN8o/E/+0s3ZqKPtc/x8zJttLuw
	SMiXgnugfSBDUzY3sAuWJkpdALi1Cy/JNyENK+cHKE9okeXF/pe//nRnPPZxpJl2
	X12N3Vs/e/z5+/rNy8ODaKKNrCeabG2fUFJgPysPqfp9IKd3HJa+/rJNJ5s635Wa
	r6tZybT9EDRa8WkZoLde5G2GCFhNq6Xk011an5vGAgbgVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1avh59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 17:14:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab6cc9811aso13192681cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754068492; x=1754673292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjIpDMJZqcrrLx0t+DaOeXkFNjy3j/r+a5kooErWBOY=;
        b=uMqG5b/RsDUy1gMDPn75h+95Y4leMgPRGzzfihrINJgUFWhVsvVonWk7MqsxxgFiGz
         FytnBYSZXL9iiCuJa+7r/Uw/dnpVA71H7wBILPTuFWIZPMLBiBYa9cF/5+ChasphcOMd
         vW/UNBOe9//hIm2PgAdoWCl31QB5Tdwz787nlFGS0eKvbbyuN75hhQk1VLNwb9xqZ8yZ
         xRapDOKgkHmRY6MpEDQnIQdqc/72CPdpraQtV8hzVB9260G/kdM6vtMsFfNxq/jQaGcz
         udZCGy7/OTi/SuivG1XOII+Ar+3lXqcxBPL3wtnX1D9s4zZ+mgt4UkPHzbw4Bmfdk1BG
         Zkng==
X-Forwarded-Encrypted: i=1; AJvYcCVt1PoQ3sQnMc3YBvwdBo3ZhrsTZpms0U/QvYa4j9vG4UW1C6iTzyZ8H00YpY2aluNhaWcz7rMkTt39qjLs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9U6LGbtC0NJe6+00ep6dO6Q6CxilPkev6yuI1rpLEzscPLD6Z
	QZJMaON2LJNbsKkkjkfK6VYTp/2Fbm2qvTLLruRsuTm1IHdScgwDG+v1e+cen0ZqWPuqOWwbTsO
	DmW/d1VSp6CLuSCqghAc8Z1+js3h7gztcYQhrYkrG/dDtflRy+vAnhDB8Z8dQxyC82nve
X-Gm-Gg: ASbGncsFzuR3nNH9PkN754TRH4WiyStd4WZsj6wt+9JwkwzQ/hJVjLhEY1v6GD47GTe
	QApEUij03r+1/d4/gfgLYqsQxA2EBkEunPWmUszxA3zvf1qacpbndiyfgU9Ihm02h/RAcrrbVJY
	7Esh1VISc/FtNnHNdy2A0jgrPAKdULt9PS7LGPip7gGGGAibjDKVoFyPaiV5xgYU1JXRhcWhZTx
	GIncwLT/exF9AakfGwnsRP/cenPcXzroczXJl/bJILGlsQB0dt2UPeHLY/ewDHzXM7MAdRb6rWB
	MyqG0g4UMwrQYJAwfx3DcGS5hrhKpXCAJWi3hewqwOJPAPiZvg1AxnhOx3t2Poxxmtb4MJ/i6uX
	9hHbKv1Vo6XZmxIibMtu3xJ4nuX93vCOVmyxPgeSYo3NyUoA9awd4
X-Received: by 2002:a05:622a:1819:b0:4a6:f4ca:68e8 with SMTP id d75a77b69052e-4af10d8d43bmr6534241cf.48.1754068492166;
        Fri, 01 Aug 2025 10:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZeft7UM185DJ31idsTVovKtr5SEN51ZI55OaWAMuhEXrYhTLrjzffx3vJ/vf8XKyK2sS4Q==
X-Received: by 2002:a05:622a:1819:b0:4a6:f4ca:68e8 with SMTP id d75a77b69052e-4af10d8d43bmr6533521cf.48.1754068491453;
        Fri, 01 Aug 2025 10:14:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ace49sm657841e87.71.2025.08.01.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:14:50 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:14:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Add Monaco evaluation kit
 initial board support
Message-ID: <4rxy4iuqy3dstfuv744gw327gf5n5g6notjpmkspjme2w4sd3j@5sbqfoumb5y7>
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
 <20250801163607.1464037-3-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801163607.1464037-3-umang.chheda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jR-GDIBERNr49_1pASBBc-x6a1njTdUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNCBTYWx0ZWRfX8D5u+vsyxy0R
 GMX4f64/Lji10wDRhq5wz/X4GYzqQx0r+Udhf6Q9q88tYIfurhhu8/2sTEymsNhDP06hEttgNRQ
 nPzUFpcESUmgjxEzPs2yg53HpblEPcCvk7//4K8eSZm5BuXIReuJoKCCmN7o74N9FIhSjDtHns8
 BFEjmB6OPjLXEI206IT6F51SAaaZnQ6mfRXD1c8Gfgi+WEqYLTKwF23tfAG7iwYU3fgLAL19Dy8
 X5bxX5ry/WNM8ajMH2J6rMSstUjFKyYdy5jvTQ34uSHEbixwnDXl4qISp1s557yIwcYiuxidkR/
 FTKYdC5AJkXaWzZxzdFbxV3IFIcQm+3tMhsMwMP0mswRxXxDNz0OJSZw95Iw8I6ERYVeVcwVF4X
 jOW+d4/h2+Wh6iHAlwtaqS6mE7hS8Gd0PRZGLDLT6UW12yFTPlTdDQev0sa/WrAuv/qxshU5
X-Proofpoint-GUID: jR-GDIBERNr49_1pASBBc-x6a1njTdUa
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688cf60e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dzsA3FzLxQdHMSIhhz4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010134

On Fri, Aug 01, 2025 at 10:06:07PM +0530, Umang Chheda wrote:
> Add initial device tree support for Monaco EVK board, based on
> Qualcomm's QCS8300 SoC.
> 
> Implement basic features like uart/ufs to enable 'boot to shell'.

"boot to shell" only makes sense if the platform is new and not all
devices are enabled in the Linux kernel. Granted by the current level of
the platform support, DT files for the EVK should have much more
features. Please submit a full DT at once.

> 
> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 199 ++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..e78f56762b6d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> new file mode 100644
> index 000000000000..1e0635c93556
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "qcs8300.dtsi"

No qcs8300-pmics.dtsi? Why?

> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Monaco EVK";
> +	compatible = "qcom,monaco-evk", "qcom,qcs8300";
> +
> +	aliases {
> +		serial0 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +

-- 
With best wishes
Dmitry


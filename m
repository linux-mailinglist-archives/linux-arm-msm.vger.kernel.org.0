Return-Path: <linux-arm-msm+bounces-74862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEDB9D19A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6900D188C143
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3628D2E1757;
	Thu, 25 Sep 2025 02:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfUnTKVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F52DF3D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766223; cv=none; b=ljGuSvLFVbVM9bvB/KCWMaY5Stg1uihNn2p7/QH5RU+yQWs1b1l4nH9HThLhMf57phuBRowYAlZauAwzCTQ3lksdyPrAXBBa0XFBBXIL8lCtt1pt7uJ1a/YxRMy0O5p/ErQJ5+XRwCXOjKK0b7DJVtO/3GPR7rsYDaceDZMnNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766223; c=relaxed/simple;
	bh=bjee08JRPy0I62XUoi+pR4Sr5AISrB+/yfRGenhZsNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frRGszX8351epNaUn7Jv2ThcYjHS1XdHeE3QbkN5Un0rVRLKGHq4i2TBOgg3tmvi3SGIyyXIzqoeyyifGOs3axvL/L4QC3atTwGmbriydKBzLUjS5vEHWGoia/exCuod7ddC4QYDNhqFjq/3IWBQr3JyMr4hyMk+WhgP5nt9nsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfUnTKVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XFus025105
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C/7uHCKAmdWyZHNd0/dLgQZx
	NGpO7Z+I9wSgi4aQWpw=; b=gfUnTKVxKRrXAnjEvnmU379FIOSq0pBrvmZrUcpr
	i2ca7c6etOZPd92L7yYWVfmZb//GRUIONVaEeH4/kC+q3KbTI1Sal/hx2niUO7VR
	Okf3/wm3C0AD/RBZIg7zh4B/V3BTGYAwNu6Df7mv0b6ryFB/tdUPwGJzYWvuRjHV
	qyiiwqEiQ9xs84pobZjXX8ncipxxmxlNoXHV7B7bsX+BtK5IV/jFH+VE60uOzq/M
	WwO4PmPu7sXXTem20yz31z8Le07FlzGLVHy3ttdPJqQv60hW1lDR26WVSzVcHGsC
	y11+WmSP/ZZHd5QVCQZfMjlmAyR2U1Mwi4mazGxWEdwoYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv16e1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:10:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d91b91b6f8so7848791cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766219; x=1759371019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/7uHCKAmdWyZHNd0/dLgQZxNGpO7Z+I9wSgi4aQWpw=;
        b=PRWtFF0huVuMBr1yhMP1gbPw1GWX6Ce6roNq3hkQvw/ymIFwS890/qjydM0fRP9Pwj
         VKzR9MiGOEaqq0LccaIuhMPELshLwg1M0a5fQd4UY9OfsYjgBk+Qtf7nFEdisPAr4KLG
         b1jM/Qb8kzCfQAJBlDbN5iRnZo7z6qzamnL2q3+i2qT7hyYuIs6Jm9LZh9CcpMAvEbU1
         5awg8Q8iQXYCNAVu8LNnTbusJRgN2qyANtQkZiEhRw392DTgv3toxTtXQZvLmREFUvSR
         +fvfH63InwNwKp41FS3Euip5bibrnzJ76boZT8jlHS35rGMl9ZkBiWzmbj62wW8CtBYV
         YX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa8CW8MKMQ00fQ+91gS/Dty9ejEBtqg2u8OGhnIfSzQjkU77C8tHTm7KK+xQgUU8nTI9iyqlQYRnD/LYdK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Zb6ad+J1wJZXAQVw23XpL944wdPm/Xg7hODz3wWs5dTs3MJd
	YIVVLJjsX7hmZkZnvyxFwootCBF/zK77YtS4LNDVbuvHor5+BJOOuu2V9VblA7V8B3HfTS9cIOJ
	s08cKMU7GiPi56im7iQy4GzEeHmNXi/spVLyyeSeGHVkms+Jl4n1B6NYxTxG00WI0zImI
X-Gm-Gg: ASbGnctd1O+TEXnO70zAtEHh3NwzLUso9JTpiQUefggpy1XJ5Rdk+I+L70qNNuaJgqz
	0UkeS/GsfEQid4I1k6skDPmJX/hWyOLZYPVPMYpeIp5PNSvHsNx64hCZ5RSngqLmEUXUcr5IXjp
	CAvJGtyf2i8cLtaBG8kvAiKF8LaDbdbEs8NmxzwPXlWCrTI4aT7K1jK25hpOjD/GkmBH8rI1QuX
	0GQyYIjBhtTkDcqkQMrd6A/D8/iWaA2jUyrSlFLlai3W5l6Hoss5XEXAND5RIjjDVj5Mee6VJvR
	U+K5+UCatp1lshRhAYISX7ekxQ1JHGP2wm53SbsGwMLxzclveoJEacHi5v4gMrY2CVRVMo79/KC
	GIzFG/I01j3CovhOCn67NCGEoNWFdmfVzANsq14csxPCcugU/JVAK
X-Received: by 2002:a05:622a:8cf:b0:4d6:173a:8729 with SMTP id d75a77b69052e-4da47354eb9mr29433881cf.10.1758766219482;
        Wed, 24 Sep 2025 19:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvUUmMZkLOjmwfUxC0iVnkbYdMU7OcIFMO4AR+CisgKDy2LIfUOS6Qp9qM3Rb+mOQMi+xa4g==
X-Received: by 2002:a05:622a:8cf:b0:4d6:173a:8729 with SMTP id d75a77b69052e-4da47354eb9mr29433481cf.10.1758766218832;
        Wed, 24 Sep 2025 19:10:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd67c4sm239442e87.55.2025.09.24.19.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:10:16 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:10:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 15/20] arm64: dts: qcom: kaanapali-mtp: Enable modem
Message-ID: <iexa64nrdqmwitvunl3inmgtmhufphl3p4p2kbvhgcsb2y6l7j@5tpt23yd6jzh>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
X-Proofpoint-GUID: SIE-uJAU7qGe9P2p3LBkGdhxu-PaMNU2
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4a48c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=noE4yVIB50t1Y-xfs_8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXxHVUZ7p8t/lr
 s+QhaHBmgiCxF6YCmtridQTFxeG29DiWicmhV18m/OsDMaKf2uCblxL4+CpTYLkojxFZwWwKJjv
 DOxJZmmDznZ/jGbPzLvXkfklKv2LGs9DA8VlUdeaOe2Xedq3yVYmGh3k4W6GNSXPg4bPZRRXbQe
 t0Da1+hwiM2fuC4JRdbX3w2jp9SPcs0WtVh8/XlI6GShMZ+q+eXHpKUgcPjC2BqAwXY/xV801fX
 tVs7SMkMui6hqnCNyPY67Tceyfk3GMK6rPctNHopGN7S9Dii/ZQOPFyR+qBT+jH+wEJGY8WfeLO
 5BpIlk6wb0ytpbeA6E737T1u6DYFQ0Lek/UBT1JHewN7Gbl+Wdng5CckulRmzvbehBiFpyH0dWJ
 XG8X1VZP
X-Proofpoint-ORIG-GUID: SIE-uJAU7qGe9P2p3LBkGdhxu-PaMNU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On Wed, Sep 24, 2025 at 05:17:32PM -0700, Jingyi Wang wrote:
> Enable the MODEM on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 2949579481a9..8d1b3278389e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -1263,6 +1263,14 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&remoteproc_mpss {
> +	firmware-name = "qcom/kaanapali/modem.mbn",
> +			"qcom/kaanapali/modem_dtb.mbn";
> +
> +	/* Modem crashes after some time for OEMPD load failure */
> +	status = "fail";

I can't call this 'enable'. Why is it crashing?

> +};
> +
>  &remoteproc_soccp {
>  	firmware-name = "qcom/kaanapali/soccp.mbn",
>  			"qcom/kaanapali/soccp_dtb.mbn";
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry


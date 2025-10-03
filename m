Return-Path: <linux-arm-msm+bounces-75951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A21BB83BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B74A4E04BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F726F45A;
	Fri,  3 Oct 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKp1wcWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4627533F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528165; cv=none; b=XEObq/UpeTm1kONlp5mrTTMcjPDqkwZtmLw/0Y7ckSkzuGYtzi+/UWP1PmElNrFTdrIZRWW5WEpNt+BRyFgGSRJEZ6zO9b66slQX95vlY1gs+kjUeuThUnlwMntH2eDD1M6gYa9FEp0oBkB0bEw7ajIIXrXZbCjPuWg5O60r3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528165; c=relaxed/simple;
	bh=A/f+DLzpbgnkUkV/C1kd0kS9KdLCf8R82uaOHH/AiWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOnF0Q+6HwkLpn72HTkSc/+E6OwLoOaRrYAHPJ07whmWuA/AycY6A5KAxi1Xh7muTtvo1bpLuQOqMaC8Xm9OCmwaDXUg7VExlclRtJlcfmXpv6WcUpaanrUNNKXg7qfYjguUZDNKmSBWC+Cnghuz6FEgsSgmwQutyMO6Ooq2P9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKp1wcWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A8hv4024866
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XAOFnLM9b1JHUcjOkh6stGs6
	1EHxCRmkb+sraxhnzik=; b=FKp1wcWjXLhw6UaLx5luXnYedDPCxms9CStmb8li
	+FuE9LnzDpG12vj8TdkTzgLS2PkepIPY27c5jmpvaDDXYdb5sK9g24em/cRPyj7f
	maZSJ2qUhjMbrLxZjmSK11lKPF4fb4hdfpusJ2yRGDy6dWYTkzBFJrkAuJpIblb+
	3iaolSdouQ2LrQYVH/08IURZLW4XS+amHAcreGfdmols2U+hwhu2Y/znYasoCvVq
	1pq1MbxjL3xlmZwzAVgyNPhxB+cgJ6ky27m52pWx1nV13zyNb12DIzxU0DssGJFz
	X9hFnUZ+arjTSdtcHYkF2VQeoBm2YV97pQyI8Bh5wKliug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e9783v4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:49:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e484dccaafso68158891cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528162; x=1760132962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAOFnLM9b1JHUcjOkh6stGs61EHxCRmkb+sraxhnzik=;
        b=Ia98NzT9a84YTKDDjdEMfpJfjQMiTF76pp0+xxdLhsENNQgHi5gFrDu/12kNLoSfXH
         KtEVjv+46VpxpE3+qxyqrnirHvncApbC/nGQIzHMVpImJZOkftpU+WSo/kAu8uehyLYM
         4/YvOgk2TnzzybduH89/sBfNMWZ0L1BYRhWFjzrIeedXNpXGOezqxQ1Uk2Wns+tt5oYF
         DRR/RheUtSKL5POxUDbDp/JkRtTNkCEYdr7GBPiDTgVfrScuIWvU+Xxl7B53b2WiyTcH
         KBx9zvXt28k6oUtyP7ArX6TXVAfP8/6BJ8oOJarOZ3ehbUt6kXWzBBgMnpfh09WE7vkz
         0B1w==
X-Forwarded-Encrypted: i=1; AJvYcCXJKuZvRbNT17UJQe1dAkwDfJF7jT2pauy9yyMCWCMD9CAEmmvgQVJBSJyKqtrrjI56Y25Xt/Ty/rOBvQDA@vger.kernel.org
X-Gm-Message-State: AOJu0YxRE03g03IIvGzJvQbXp/BJlD14e1IiV10GpoyBz3OETIsVZ4+V
	SHVXVsEqrPpGRVgc/KvkgeL8ee5kCD72Z6456nBk5qKtpz8ufWosJeB9fKgX76mcfn3HlS8jKZv
	pTyCDKV76NUJZ7NoAYwIFvpTTXttKkSXSkFiQwp799pjIoMYQNE2SCf0FsOb7OGCEsuvU
X-Gm-Gg: ASbGncu6H+bmmH0FxYE18UXrTwB5CYUOR6u19L8EtAi5EVr/YUFQcmpEbOZImcCXbE6
	D0oHeVcMZ3DEwfZM+lFqdrfyZVlpHgZfntXY9ekJbHTxLD7Oz0o7Q7xl4F+UrsZ1u8ri1c2aB+j
	2XHLYlbcTiDRMzvZvr6Ri86wknJTVdcKPCZn4CWzVZ9lydvdgzZgNbrozWTDU2d3pFz0EwOtYlt
	ZrI5RDsC0v48hNmceKBVDmfdy1b4msw/vqLvMJ5NrYC926mc2fXzdA0HGVr/9NdqylFyaeVg6lh
	XidEBhGrdt7ZLijOgIjRo+J+V2ArpbBmrZSg3cSkeYk7YoBDLfVnaJ9Fj1ppxWvulEHHpJC2GvD
	LEQ2y15BeXzRxuo00gjkUvS6cCDgXzJm/dtZsVdoLfdl/Ie/VOxivLSSCEw==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr98158031cf.3.1759528162050;
        Fri, 03 Oct 2025 14:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gWwma9id+UA8T3lgXIHkN0ALwpvBBmEnGVLlo43J/2+suORG9AN6jJLAOp/iHdUYPalYdA==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr98157801cf.3.1759528161574;
        Fri, 03 Oct 2025 14:49:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm2143792e87.103.2025.10.03.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:49:19 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:49:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 06/11] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <5xsdio5efpcpwpqek6e7tdk5kdr2f3xogne2iyhdl5ra2aqamu@icnfajxxnlq5>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-6-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-6-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: VTpWpPkUrmNJfKNoNIvCPaNmJXBn6Obd
X-Proofpoint-ORIG-GUID: VTpWpPkUrmNJfKNoNIvCPaNmJXBn6Obd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXzyIQwE2Jtkmr
 EbOwwNmoh6UJfbyoX+e5V12YMRVfuP6bWS3yVExHcKHujw+gLPo51DX1jcLtCQwjLK4kWHBWIIn
 Vwp0MHYSvHsDAWjHCirEiC6u4f8JEWi1ATLLd/E/2y+sW5onJF9ef7iE3k697t4t3trmUVpCpc9
 0of+tYCrCdL9ui1m3dzVnOdylLnOysRUU14rR0QumRtFxaZxk6TRRRGunN24fiIn+5cD9iAsEHa
 abvKbnVR5p4Q+jSvhNTyuAAzVVh5tKrAjXJIV5W+aUApAP9qyvkzzxJ1HlyiDA08/lvTvK7gEWi
 Dy9ZB9GbIrodhIIZNEse4CpLta6URjAZ7uN2E2wa6BlxbRg4th6lrs5NL7WZIPD2C3Xrnn7kYaB
 2o+DApVoLAcIoJMzP8tW4xkpLQjkAQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68e044e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=fxdwwflXBt89RVFT8wIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Sun, Sep 28, 2025 at 10:05:29PM -0700, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, bluetooth, venus, gpu
> 
> Enable adsp and cdsp nodes since their firmware is present
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.
> 
> Paths changed to qcom/sdm845/lg/judyln
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 26 +++++++++++++++++---------
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index aa338612433f9ac3b07363b79d8a3b8e0eedd98b..0f0a3f471f48e26cc48feb1551093599fcb35d7f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -173,6 +173,10 @@ &adsp_pas {
>  	status = "okay";
>  };
>  
> +&cdsp_pas {
> +	status = "okay";
> +};

Please move it down. Also please check the order of other nodes in the
patch.

> +
> @@ -137,9 +141,13 @@ sde_te_sleep: sde-te-sleep-state {
>  };
>  
>  &bluetooth {
> -		/*
> -		 * This path is relative to the qca/
> -		 * subdir under lib/firmware.
> -		 */
> -		firmware-name = "judyln/crnv21.bin";
> +/*
> + * This path is relative to the qca/
> + * subdir under lib/firmware.
> + */

What happened? this should be a part of the earlier patch.

> +	firmware-name = "judyln/crnv21.bin";
> +};
> +
> +&venus {
> +	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
>  };
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-44996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B751A104CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 250C01609C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A4D20F967;
	Tue, 14 Jan 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezAoWA8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D720F960
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852317; cv=none; b=gpbjxGfu43IqAll9uQ2VxgiQckWSt4Yst6LylvA60rq4oNjC8PbhKgbmM29NJouXL2h8COiNjHD42WAsuoJpGPlKMYSPcjE7d7TkW1MMNoln6rAyX47zZsgWo0YfabBXMAL+E38MioGIR+MbCjLdJSIlz8Qt65xFl/5FSqgUw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852317; c=relaxed/simple;
	bh=tfQsTc1nT0Ft+LZBuVNjWxLnJbLWjrvfw684D9dezC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYvBs53aA3XT4kIdPnzU7hwSckoVJxwwPOeuYdLUPiVZlAXvq33UxAH0Saq+2RUZNb6o+EuV9vBXquxzaJl/C1Sj8uMR6o4KJcuIbbTO8MlfityBcIfe8ga3W+pU+JDBXfASzi+e/x0vSwAqrr9Rdby2yP0crQBOuMCHAjOzy9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezAoWA8B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e399e3310so5531835e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852314; x=1737457114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v06DTStht/BGs7htXIBio0Lcr2lokSmMNBRohHl881Y=;
        b=ezAoWA8BAhmTVTYB6tsIj3DWNGNMeo5uKLZ72+oZD5z7dG7v3YWXm32fbwilkQZ9tF
         1cQ9tdUcuNpzOBnAJeBeZXlGn3mrCMAwar00AGp1tka25gQ3mu5TmaK3TiPWvGs3xQ12
         l2fvamne2KUhVrz5K2DepR1gl8B5iC3nyT9X7BfRkub5PQjs3GKt52Zj2SAnWvM/hzTH
         /6gRXkoFpvGT+xKbRLCywVvPDgd6/fEsKadkvWxBxMPjpEe2suvUAFsxBGFpdJ1zcV/0
         orWpM/daqMIK23D7etqsAa61Cvh/W3K2l07VILNMP/1h+dZnjttHbu1jTjOIJTv2EEXT
         gM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852314; x=1737457114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v06DTStht/BGs7htXIBio0Lcr2lokSmMNBRohHl881Y=;
        b=Aru0KzoMilYxgpg5QZMJ/tUNSRHWvl442HO5dctVuoGTdzjZyUrozhWWQqCCPGsI7r
         h7rWEzyHdcxUUbdW1Ow5rVq0q1Hx6WA3rGb4T6UxSh4k36rrqnMlUWA6Zwkv5K2y8Jz4
         D04aJpAjzkEh6oRp1hSnylrI4rN37NJdJr+iKbd2740PoXRmo1UWR3b46WNaiosV8UQu
         P5RMAOt1eUeXeb3yT+H4uM8lnnfpwkj1MCKImcZXSoh+a3yvgtPvKJwpOdU/LmVO8Ho5
         0IYzEmX/rx+C8J/pRaTYAWcWAW0Xgk5NbtD5GNmTEXRVxrUsRZjCJTQQ6HjRTwMqIktu
         uRBg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Vbp4rrXea62kbOE1jb6cf0CxH5JhFmIwJXn+grGuigUbbM7tOIDs1Wo/4GjEcjG7274W94Eo9S0v9q8g@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/j3H4sKrKAfDzJ2aOgcf5ASpiSJUM9elvX2fC5h/Vp6eDiM8
	xg9ncQXD7DFdBs2Dc1ECrysTpMOngNuDaGjGffrQYCyobOFC49fipnznE0oC4d0=
X-Gm-Gg: ASbGncvN9BvtO7kl6jWAJiEGc7mjnqw/ZpaSWBoLXbj7loUFqVY7Qp7n0xh6FwdND2Y
	HngyGle8DqEBYxM22QF7+RekY5KFSjB4p3mb03nPd4zlQ8vGIMso7tUsgDi/PWR85HYpDM5vOO2
	ptcROdjREsc8U5VygD8be+S/xufx5zbrOnqp+LE0Njl4Oal/MqhCz03oMSNBnvSw5ocK+Ql49mM
	la3TkhsYkT1bJXKg512pChJYH9OzcMGhCwYihXktdJo3aUJs1Fp6g3WmOtx/BqVrVwFbtRV3WuF
	ACI1qv2GSajUzUxnImttshrvpLglOp2Sh5ao
X-Google-Smtp-Source: AGHT+IETi/WjVadv1RFOndvu0JxOjoN1KgR9F9kiGHeQVMY2QDkVGRBDuKCOeEVC+YNHHTcQ87OekA==
X-Received: by 2002:a05:6512:3188:b0:542:98e9:63b1 with SMTP id 2adb3069b0e04-54298e965fcmr4074618e87.31.1736852314398;
        Tue, 14 Jan 2025 02:58:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea669dsm1676326e87.164.2025.01.14.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:58:34 -0800 (PST)
Date: Tue, 14 Jan 2025 12:58:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Message-ID: <ididns3nh3zcokenxdutxgzotmegmhgmtbxokt7tsicd3ja6rw@v35fmdneranv>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_llcc_master-v1-2-5389b92e2d7a@quicinc.com>

On Mon, Jan 13, 2025 at 01:26:41PM -0800, Melody Olvera wrote:
> Add support for LLCC V6. V6 adds several additional usecase IDs,
> rearrages several registers and offsets, and supports slice IDs
> over 31, so add a new function for programming LLCC V6.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 212 ++++++++++++++++++++++++++++++++++++-
>  include/linux/soc/qcom/llcc-qcom.h |   8 ++
>  2 files changed, 216 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index 8e5d78fb4847a232ab17a66c2775552dcb287752..7a69210a250c4646b7fd6cf400995e35d3f00493 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h

These are not relevant to v6 support, move them to the platform-support
patch.

LGTM otherwise.

> @@ -24,6 +24,7 @@
>  #define LLCC_CMPTDMA     15
>  #define LLCC_DISP        16
>  #define LLCC_VIDFW       17
> +#define LLCC_CAMFW       18
>  #define LLCC_MDMHPFX     20
>  #define LLCC_MDMPNG      21
>  #define LLCC_AUDHW       22
> @@ -67,6 +68,13 @@
>  #define LLCC_EVCS_LEFT	 67
>  #define LLCC_EVCS_RIGHT	 68
>  #define LLCC_SPAD	 69
> +#define LLCC_VIDDEC	 70
> +#define LLCC_CAMOFE	 71
> +#define LLCC_CAMRTIP	 72
> +#define LLCC_CAMSRTIP	 73
> +#define LLCC_CAMRTRF	 74
> +#define LLCC_CAMSRTRF	 75
> +#define LLCC_CPUSSMPAM	 89
>  
>  /**
>   * struct llcc_slice_desc - Cache slice descriptor
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry


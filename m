Return-Path: <linux-arm-msm+bounces-54049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA55A8648F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 943427ACB49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACDC22D7AA;
	Fri, 11 Apr 2025 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzXMU6+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34843221FCE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392081; cv=none; b=qIeKEztOe0OceOaIEn8U5ZkFkDY5OSrvmzTvhrNkieGLgaYCAk/VwWKAzd/xKLQgHb6CANcaNbQRQ4HS7wSoK8dzYgntUzZ00aNf0yIbjycrBClfTs8E2pZ3t1eXaiEzLPVdtqywYZZFChT27Lstf16lx9LPVIReT7JjPAE/Ga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392081; c=relaxed/simple;
	bh=9R9uLvsmeGoe14eRCjcItaLOJaEEHinQ3mbc0RgE83Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Unzlh7lzFwxalZ4LO4nhQxLiNsc2HH/4LCTcBnF1eE3DAXPumaP5CCwTG+GmNNLeGlIoP+2wBPGVcjmglCahsY0ZfGcPACVVGbublWc2IttCUbaST+CKACArFG8Fq8oSFj6ej6jEEeBZTdmyplYygTIpIuLwNdPPj8O1XxVhyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzXMU6+7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22a976f3131so25306475ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744392079; x=1744996879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptvUoeOx/AZMyIxL2MXssLTygn46TbSRcNaMqbuDt2w=;
        b=pzXMU6+74I1NKFQ4cCgXfY8uvYLZQtI3NJ8sGbYBpso31b0ADraTDwbo5jkqA5c/Q1
         JzfnL0+nJEnY6UgYKDzjMtm+hbahUw1R0wym2ZKoJyS2UcmYuFQTvjO3s5swkMe1i5hC
         PjL5dVwpGmR2bI95+fLxJn0P1hWvXHZErPU0T8WEehUz1WYfhr7s+FCv+ij2f8O+YHcK
         UmIDUmmCop7l+x6zg7Bcz/3rRoGbzd0r+tqj4GPbLck9ivGKMWf4B8VDn7Cv7O65Bz8J
         ohQn+wVu6/jlfbKFfwipWsYQ+5jriS47dAYCJmT3jVVGQPRnRc2a3GyfVVb/1/v7OxxS
         v17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392079; x=1744996879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvUoeOx/AZMyIxL2MXssLTygn46TbSRcNaMqbuDt2w=;
        b=jMO8bzbprlpkGOSe5K9PHD72g4TwpgpP223aTk36T3AfetCd4bmBMlI9xSOzWs1EJ+
         br8TrAxtGpBPWM7IUsbzgZH2082WHTbYC9SxBjquL3luRH47v2TYOoCOpDkReyrWQTK+
         06YcJsXVQaa8JEBYg6aUzDFzosd12DrFpkVyPmmWYC4TDekz8nRhU/kTR53N5cSKdlqs
         GrFI0buBXyM6zpoiJctkcTwgD7GPFMijDdvP7C17zx/791DJFyjaqXh2mGxYAFc2SCSm
         U0TRdbAamoskVUkMwrP5Z2sHBpLqKqej+MN6eS/liyFjeN9dCVnyyZgXPlQ8zvrzN8Hq
         c+gw==
X-Forwarded-Encrypted: i=1; AJvYcCUHKHNd90/zthzAWXbxnDfHnVfAxghxy6GxEJtT6YErnpiMZLfrSyPmyBnNAeK6FHfoteDic9x70Yeb2MiN@vger.kernel.org
X-Gm-Message-State: AOJu0YweftZ7i8kiWR6flJuKefrKtG6Qtb6bYDqFir55S1iTKobicfBI
	LFcEvnUKbwJeB3kEQlCYc12h8GMY+yjTrs7ZNjkfQJ5HIPRuW/u28wABVHWI0g==
X-Gm-Gg: ASbGncsj9RilxSCinvQFMH/3lcIkHh7qPVJCYJNXBnLO/kEQDF2oAd7fFFPb3/yudGW
	wfKg6A9FyTTSD1SjAkUOiQsxRAoA4VDT81OVPhyQ2cUacZn11hLY6uLLOcFskPXd+cVKjWbZtIC
	Ii0Imo9RSFlUEcSQ4u6EjURaSio5X7C4KYX3/etRgQOY+ULeV96RoD9mOCZ3hMTI3DwuzIgm+Kz
	l8QDYSeXWt5YCfvlhmZK5ofA+fgwiB9gHQWXoNyPRI9cc2nxC65S6TEIBJ7P8rohasLpv/ueXwz
	ZMuvnnO8zFD9N2CI5SNjP9UkZ3+dA1Osr4rfYrlXj49bsa4ubmA=
X-Google-Smtp-Source: AGHT+IEkpe799Pegl6qkMrJUuoyw8pAVbCt7hNjunwJoxR7oSK/mpaIPaCfCt7LHX0P/PK4I3bcdSg==
X-Received: by 2002:a17:903:41ce:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22bea4a3495mr53313805ad.11.1744392079396;
        Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
Received: from thinkpad ([120.60.142.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87885sm52538765ad.55.2025.04.11.10.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
Date: Fri, 11 Apr 2025 22:51:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 0/2] scsi: ufs: Implement Quirks for Samsung UFS
 Devices
Message-ID: <nziy3xvvduxeeav7umyvorguctatt7kw3tt6bvuvgwwn6knhbd@2nrs5wb5b2vb>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411121630.21330-1-quic_mapa@quicinc.com>

On Fri, Apr 11, 2025 at 05:46:28PM +0530, Manish Pandey wrote:
> Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
> length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.
> 
> Additionally, Samsung UFS devices require extra time in hibern8 mode
> before exiting, beyond the standard handshaking phase between the host
> and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
> by 100 µs to ensure a proper hibernation process.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in V3
> - Addressed Mani's comment and updated commit message.
> - used BIT macro in ufs-qcom.h to define quirks.
> Changes in V2
> - Split patches to add PA_HIBERN8TIME quirk in ufshcd.c
> 
> ---
> Manish Pandey (2):
>   ufs: qcom: Add quirks for Samsung UFS devices
>   scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices
> 
>  drivers/ufs/core/ufshcd.c   | 29 +++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
>  include/ufs/ufs_quirks.h    |  6 ++++++
>  4 files changed, 96 insertions(+)
> 
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்


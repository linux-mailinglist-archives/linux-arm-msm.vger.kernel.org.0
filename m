Return-Path: <linux-arm-msm+bounces-78718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84716C057AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B3B01AA60EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6025030EF87;
	Fri, 24 Oct 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFbI3ZGs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B589930EF77
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761300287; cv=none; b=LBjEXpArRzWzMgHnxHEctsdy/Lu8eUtOuKFqUCHEuorEFLcbYwpYtwn3p4yNxsmRoFbTtYOzaZX7ats47LQJOf/8ljfon906fwEYVc5xzcgDQpiyNgNEV4WkpB5E6YolchKsrhv/JZ1VjhMw89yYAt9/Z6r8fqHaGpjktLBM5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761300287; c=relaxed/simple;
	bh=1NMDLivR90btbfYJlV9HQXUoq859Lj+TSXKRZvfqwJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvSnLzgYSfCLt7jO1P+PjeW1V/ncjsbGoIbs3pukborM3c6kDeVy10AfXuCA+K7AqktgYhCo8bzMR62cfcP30YYnw3XsfXoJCxbZ+d36d1xFKJxXocMl6t/uLyNslSztS+cFOAWvwjZ+Lhd81VvaRXubY7I1r50XNzggYOt/Fww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFbI3ZGs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee12807d97so1482526f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761300283; x=1761905083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zWbJl2ZfP1e0T4fLhRHbzMHg9996oUPVq+nVGOMakuY=;
        b=RFbI3ZGs+Si+hP15o6HvOAVo26sAFA+ZjgBwFY8wzgwCJrSgPOCCChKdmVr/B04PqS
         qPdpMEuM3UmRDlvZE/GEoIokPSPmF1TA+Cqq2TYX8zaXKz0AuxrZq7o84KZIiuz0ez3J
         aUKz2d3qooRIJpGoU4U8cf5Dx3HXFfaNK2fw5UIba8KErejhjYQ369O8OWj+s+AELKtA
         Z5buQnhoOAXVaelX52uaU4TCys1KNUHTucamtWfAgTSVDUc6Twm+eupvOHJdSJfTsA/6
         EVMomgTOduK+Db/VH8UiTutUBhW9HEZ94/WzNCGxgwUPQCEavYcdZFqPiQjO8RhsKmL1
         XkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761300283; x=1761905083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWbJl2ZfP1e0T4fLhRHbzMHg9996oUPVq+nVGOMakuY=;
        b=V1McflYP66/Se3fVsThNEAmV98Rf0EH5pyUuJVtvSSHaAc8m46Zgys33hlwzmcWrfd
         KsZ8Zi6H5TQ6xD9r9v+3x2deFK9im6Rc+0uHP3WIseU00+L0LmMbq/PcF0voSItkCSup
         K0nBm4IoGXjv6CMrjBQfvh2fA5W8d3Kz34Akfihxc8Aaezw/9G/DFuyfoAgHVJS9ZbJq
         Q0JOh9umuMyjbd1uO2yQOlPP8jswWFlnbfjkIYZ9QpWnsYzIvk/yawoWF+Y4aaLmDQB1
         AlsZ0FiRD5Sp0RXvOFLqGmzz0Wxt/nF9dAvhW8RsgkjLiHfFQLbOZgvh2l9KyWPV4xSi
         ugGw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Y4rpM+mqVVlWACu7I924BeAS0wlEWJwbhkHLZA2uvglwEkVzzMjM/kwiLRFI8joHf5Q2A5kMleFS67jA@vger.kernel.org
X-Gm-Message-State: AOJu0YyLD4xj8N+rb2NZpjJdSuV+IprxP9Gvkop5u7c+cu7xto3pByDy
	Kkp0Uk/E7KohqXFCH+67lNdYUPsRki7tHNXb4Cn2DJRrTKB2MTfREPuO+FrQbnEhVWM=
X-Gm-Gg: ASbGncvB0cCnJkr1LU1ghkRhmVmnZCGgKeSshek+Ms/UIE05k1hYXsWQoD0TszB5vhL
	8rI9Y2aBaOz7wb38jQ0BoHXo5iG3wMdJaMVwV5YJnqAjwqW4UylfagjR4oZvcX9KtaRzHnpalFE
	gKwIC8hGx9c38qZnLvpwcork6tZ6yjT7KqLI/IMeu2rOcA6TTW3nVEdkR7oYmg4esz/FnQ3yzdM
	yd4RldpFaT3sI78SJiOfin9ny9PRKF6mhbdZNoqnk1AuPZQ9lhpDbfWa6L0S8Yo4oamdkQuK8uo
	JF16hC8158Sf/67WyY4ekhIqjByzG0c1JDiH1T/FVERejwa89KugP/mWiaMmROEmgFnSGvd8zw5
	LF/V8pZXQrM5ZPRaoonBOXR9COGM3WRjaeFyr5lXRn0/iPOjFjFu3BMspACYB8nEay+EMy8NV
X-Google-Smtp-Source: AGHT+IF6VTaVr9HVL8Awi/bueaN0T/qnC3Sz1N+B3cViCb7Dj9HwQB33ju5SKTW2SyXrW4/F7vp/AQ==
X-Received: by 2002:a05:6000:2303:b0:427:6cb:74a4 with SMTP id ffacd0b85a97d-42706cb74a9mr19917135f8f.39.1761300282850;
        Fri, 24 Oct 2025 03:04:42 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccc60sm8596305f8f.34.2025.10.24.03.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:04:39 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:04:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, 
	vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <zaotrz6upmpwv2w65633rlflubmykzn5dqiydl66y7rdalld4l@bo4oto5iynor>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006222002.2182777-8-wesley.cheng@oss.qualcomm.com>

On 25-10-06 15:19:59, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 314 ++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
>  .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>  .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
>  7 files changed, 1240 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 1caa1fb6a8c7..8216820e388f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[...]

> +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
> +	.offsets		= &qmp_combo_usb43dp_offsets_v8,
> +
> +	.serdes_tbl		= glymur_usb43dp_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
> +	.tx_tbl			= glymur_usb43dp_lalb_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
> +	.pcs_tbl		= glymur_usb43dp_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
> +	.pcs_usb_tbl		= glymur_usb43dp_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
> +	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
> +	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
> +
> +	.dp_serdes_tbl		= qmp_v6_n4_dp_serdes_tbl,
> +	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
> +	.dp_tx_tbl		= qmp_v6_n4_dp_tx_tbl,
> +	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
> +
> +	.serdes_tbl_rbr		= qmp_v6_n4_dp_serdes_tbl_rbr,
> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
> +	.serdes_tbl_hbr		= qmp_v6_n4_dp_serdes_tbl_hbr,
> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
> +	.serdes_tbl_hbr2	= qmp_v6_n4_dp_serdes_tbl_hbr2,
> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
> +	.serdes_tbl_hbr3	= qmp_v6_n4_dp_serdes_tbl_hbr3,
> +	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
> +
> +	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
> +	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
> +	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
> +	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
> +
> +	.dp_aux_init		= qmp_v4_dp_aux_init,
> +	.configure_dp_tx	= qmp_v4_configure_dp_tx,
> +	.configure_dp_phy	= qmp_v4_configure_dp_phy,
> +	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,

So I see you are adding the DP related config here as well, but it is
definitely not compatible with v6 N4. I'm assyuming you picked v6 N4 as a default
just to allow the USB part work for now, right ?

I don't suppose we can drop the DP related config from this patch and
still have the USB part working, right?

Otherwise, we need to mention the fact that even though the DP part
is also being added, it is broken.


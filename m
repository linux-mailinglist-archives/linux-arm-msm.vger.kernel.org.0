Return-Path: <linux-arm-msm+bounces-39447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC99DB877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 101D52821BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A55B1A0BFE;
	Thu, 28 Nov 2024 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8R+pAdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4C1A2630
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800167; cv=none; b=ZOSdpitJpp9+FThNYssuoOsrbqnl31hD+QYaXwtAf6S1W/gKNUgu/aGpZhjcSbQfsKN6sP9NdGKZiOSafcNl0DXdvv1d9kpXdpdyWHCa6SCi1b7chj8nc7VbSBehmDf32Pig2aweLC/ZDIm9KbukCjzsihNDWT5D/U0O91WyTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800167; c=relaxed/simple;
	bh=ZRTyKOcF+BOsP+CxhKgOS1bm2CPzFXS7M1kc1Sukgn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8UoK2ac5jKia6WMvNwjB69ePElIpQBvSnig6ykmcDP7ZSaux8CJYXnC8YwFWsPDgaMD2IQGsjGaEvGUzrZ3ou/S1QifsJpbuOzhVx3WBfdUyYD65IIH2OxRHOa6nZrphjkSy8qPRPwEcFhca+0EHGo6MLlkOcgfcn29TmczPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8R+pAdW; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so7325671fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800164; x=1733404964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0trBlkAARfcalt0wvM3utILQ/svffGiHUkuNkTIjo9g=;
        b=Z8R+pAdWxh8Ft2ueY1WbCJXpEc5aKDWRpXKwbRPVW8qkatDyoqEyOWO6/rxW7JbFcw
         O7a/PdF1BY+3gB2H6+3zaYQjwvp9xOZJR+aCcNllJJ4XWfNmLwQX+uDEASojOvpgbZDw
         FwSh4Bl6VwvsaGN3jZJL/WAw5JEOgAO/ATN6MhqAa54o7tKBsuQrk2259V9qQc/fOh7z
         fPVnjn3BVByHyVOxNIXYOnFnOEIO83oYa8iaAbb+RtMPfhSZ0RzxLNTZPgVapzpbKkoF
         K2qtXPJYF4hLDel99cLaGSg88dAl0FgyS/U00GIZW1kPIx8b2TnxJAzxxPJsglYq8Tpi
         WQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800164; x=1733404964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0trBlkAARfcalt0wvM3utILQ/svffGiHUkuNkTIjo9g=;
        b=DcSNfP6vUZYippra8PDZF8V2HRgh0ZG4Ncz3Vv1WzhwVRB0ISaRxqp61OtjdzF9voi
         KsW9+B6DB3qpiZO9Hl8/SXyb9Z/XObmcsWmD7wwCVwLrhQX8g+oa18hMFonSxTrrQEe0
         MqPvGKIimX9YRfMQJEbRUJXyW1GDxMZsos+WKYeVz2gTfOZRIhKqtQ71MYQGAy4eQGB9
         QP+19wEwMYC7Qn+EWXf4ve0DiEvMw1BlZC0E8f5lknraOFvUpOLgPNGO22OiUXyZXAt1
         neDz8h2AV9M9QZDK2ZB0ae21B1ptYj3dJkSJvPbT0DGELpZhBJdUHYTRINq1WIO5EQ6i
         en/g==
X-Forwarded-Encrypted: i=1; AJvYcCUs0CH4OrELK1ta+63/+KTHUPw9jB167Tn5zIjri1p+5TgSV1U+XoLk/q1T7umczwt3UnO1DzfsBg0U+Zwl@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTuU46k9Lf0BdD7qZdY3zIyLePsKP74g9nNWPV5u7sY7eA60o
	U8oYkli1oMtHNcHl8Wu3H7vUgARK9tGOE/d9/9Hz3k1r34nkTOqsloFqAbJVb2w=
X-Gm-Gg: ASbGncvglRkIP+SPI/zxutEhm/IaTs01gL4VTuWQbxzzIzcUJtRDttD/neU5MAhRxPB
	BWYucc7xCbTCpLVVYpZhlD3bI8NUdbkCpbb/SWdWcU2nzy398ncZ8QZfeAd7v/KaQ6Rb73EKvJO
	dwFTuOFRQ0VdHxHYgBk+T8H+wVJ8Qp8IfMXungusOxikvfEWPhHKp1JmFiSFsCmpvNM6lH0KFK8
	fTorYyzt2zDJkNVInt8RLELYrO3iS6NejnhlXMFm3hK4BqjgNlbObFZN1S1Rvmhy3KCjuBgSO7B
	UimJ1iq0l50nFuiFaTbsQz+DrgYgAw==
X-Google-Smtp-Source: AGHT+IHEvVWrBgLarPrP+szMgf0Kt+2464HFdoUTduj2gmCoJGkPBz1dSTuSfhoY5FnSXf3ADQPMpA==
X-Received: by 2002:a05:651c:150e:b0:2ff:d41e:d1eb with SMTP id 38308e7fff4ca-2ffd60dc0b8mr25239271fa.37.1732800163793;
        Thu, 28 Nov 2024 05:22:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc7503dsm1894131fa.75.2024.11.28.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:22:42 -0800 (PST)
Date: Thu, 28 Nov 2024 15:22:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_tsoni@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/8] phy: qcom-qmp-pcie: add dual lane PHY support for
 QCS8300
Message-ID: <3azkbn5grdficfn3ojuckfawug65piodgs4jvcaukxkvgrhtkf@2vfm3qwv23vl>
References: <20241128081056.1361739-1-quic_ziyuzhan@quicinc.com>
 <20241128081056.1361739-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128081056.1361739-3-quic_ziyuzhan@quicinc.com>

On Thu, Nov 28, 2024 at 04:10:50PM +0800, Ziyue Zhang wrote:
> The PCIe Gen4x2 PHY for qcs8300 has a lot of difference with sa8775p.
> So the qcs8300_qmp_gen4x2_pcie_rx_alt_tbl for qcs8300 is added.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 89 ++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)

v1 was already reviewed and got a tag which you've ignored. Please fix
your process to use b4 tool. While doing so, please collect all the tags
from v1.

-- 
With best wishes
Dmitry


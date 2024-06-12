Return-Path: <linux-arm-msm+bounces-22397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2840904F8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8901C20FBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F4316DECB;
	Wed, 12 Jun 2024 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mgHvjpG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DFB42052
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185587; cv=none; b=nPAY1QVZIS4Z9SNAqjVM7zpfAKYoD3t03B7wp8afKEPpL4usPHvahl3JH3qeA+e33hEIEd7iONR3wTQr06P8NzzzmrtOC6MMCy2DTI+olXQt6xudQ2i46B/NycdJYzuSN2dYYa6NabL4GQrruoGGiKWJa7I0WNSslCrkanoWxCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185587; c=relaxed/simple;
	bh=W9ndXkFGN+0mJvooAoPTWczE53d1nQ0rmrqRu/keLPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI/8+PuWB/iU1QJXtXx1q63kg4G6o8/qFgKsIKPdIRIZGJCPAqbDbETMijxHGugeOXWHSptLnQ35gLSr2n8E5Mfld6x8Ke9fW2b3pZtZ879wJhIjrl3V208haTZKC+63GKy+FlSUwDgVKMJZYfjth3hEfF7TXlSzU4MsHDZAPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mgHvjpG/; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5bb36de2171so448313eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718185584; x=1718790384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7o5lyLDpCnCOWAKSNy5bFFrbCTaImlxo26NRKCBcB40=;
        b=mgHvjpG//vBx3LRfzTNfIpoPV3IMScA6Qy2kCT2yyLBX2Ivm6isQLJotFrHcg6kRBN
         kXzsyraKDq/Y3mTFSLzIsf6/1pyXzJtpSJJphVh0PgnEEHQH5PIu6AUQ64dveFqXldDk
         bD+m2wHRpDk5v4qCCz2VsmUNS2xPj/UqXjBLmUzgl02GnyN6SOtJNkh/yok2s2MTNNZX
         xL+I2Idfvbtl4SwqiY+Q0AjoEVMDE7nJOZ4XS4knvaxptrt5h6TAHZZ+9IBVrF7EQfUR
         jbKRgy6uskUv/B5zJZXsUMDzkmxJatwd5hNFhqrcpvQPiN8rqa59gPLOPbfXWdIChNaR
         Lsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718185584; x=1718790384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7o5lyLDpCnCOWAKSNy5bFFrbCTaImlxo26NRKCBcB40=;
        b=VhjtmJztUp+/7J1r74VKbT3hiqRf39lHrUVXl3djkR7YYWHWxcSRgEDN3ucT6n6LNF
         UNa6DA5CEe9mdIFCRdtPlwEaszkS4mNeQuIALvHFFLPn3dBiXb2fVAHFvsU9ODqH1OWJ
         1eciD36tmrRXqNGuFWnhYFgxmiBrLAYjVIR4bVSLSzb6Tnmgphdx3yyAPEJwQxgCWy4U
         3Z5LWvuAQN8/yvoaZAYKRhQ1/5XelH3eI0Bl2Re9RoMoK+Zgch5oO8CCTI7wokAYvPNM
         ZChwA9zAkzLLfAp6yy7yAExJ/vnPykJPheWeGkEs1st9Crj/dDkscZ0+N/OcVDT0cihO
         n1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWEbGpKAPNv34M8OaWj1RAtJNUcs+cqAVNvUOEfUmaRls0TzHbfGbJoObPGe9fgEh0ZX/o519vt+oYUXhBHGgbRcwDL5jQ6/R3ZcUI7EQ==
X-Gm-Message-State: AOJu0YxhbW9HZK4iqeoQaxsqvY9w4KKiYNpxCVIubQCxdUzz2QMY2e5A
	HYpkZpKaquOwGQTPCaw9at3zAWTs/WLQLNk/tcm46v0jWu+fw1cm2kue+tA/7A==
X-Google-Smtp-Source: AGHT+IGmU2eeEDxojuHCD3Q7xWva5vETr3bu38Y0Bbw7SVri6LNH1NAs8U8qZoVnVXKsiVvHtXFhGw==
X-Received: by 2002:a05:6359:4c9d:b0:19f:48e8:2d with SMTP id e5c5f4694b2df-19f69cf6bbbmr142440955d.5.1718185584205;
        Wed, 12 Jun 2024 02:46:24 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de200849b7sm8803874a12.18.2024.06.12.02.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:46:23 -0700 (PDT)
Date: Wed, 12 Jun 2024 15:16:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, quic_jhugo@quicinc.com,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: Import mux_id item
Message-ID: <20240612094609.GA58302@thinkpad>
References: <20240612093842.359805-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612093842.359805-1-slark_xiao@163.com>

On Wed, Jun 12, 2024 at 05:38:42PM +0800, Slark Xiao wrote:

Subject could be improved:

bus: mhi: host: Add configurable mux_id for MBIM mode

> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)".
> So we add a default mux_id value for SDX72. And this value
> would be transferred to wwan mbim side.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  include/linux/mhi.h                | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0b483c7c76a1..9e9adf8320d2 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
>  	unsigned int dma_data_width;
>  	unsigned int mru_default;
>  	bool sideband_wake;
> +	unsigned int mux_id;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>  	.dma_data_width = 32,
>  	.mru_default = 32768,
>  	.sideband_wake = false,
> +	.mux_id = 112,
>  };
>  
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>  	mhi_cntrl->mru = info->mru_default;
> +	mhi_cntrl->link_id = info->mux_id;

Again, 'link_id' is just a WWAN term. Use 'mux_id' here also.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


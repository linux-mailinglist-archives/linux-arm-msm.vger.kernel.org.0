Return-Path: <linux-arm-msm+bounces-22368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48262904A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEEAA1F248C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 04:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B54250EC;
	Wed, 12 Jun 2024 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rts1nzaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B43209
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166803; cv=none; b=i6ulTHD5WfIhFXhjThoaAUglKPccJakELZXGxStLVYjusVnUza1/7kJg6sGbCXZTnO2d4OW1x6uplF563UJc594U6sHPEMXLdWyPsTC6RU6y93FaKZ0mxnrREKYljc4WLhwvKJHDDA4LWqoEsrDnLrQa9O8flmDAERLRW1ttwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166803; c=relaxed/simple;
	bh=oKOMiTUMh2lH/esnQN6AZVJ8ULwr850HU8/bFBOc1G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swQmS4MSPTjpizgvxH9gKOtYUuAVGVwBH0KVqOSoKIKNX9ikXMwMpfKw9u5lrJUycMK5De3KC/AKT+GFL3FrA16pYe5UA/bW2np7fpmKVevo8iVNtQyZTS7WevHkwIGeeCAu8U5PYwiB4kWfL/g1iPPesRso2ayZil91P+TLxrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rts1nzaL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f70fdc9644so4225755ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 21:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718166800; x=1718771600; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lFT573xAr2xtznmal0QSwzPFRJXGMmZiiu4vvGuLRvE=;
        b=rts1nzaLBTcuHma9FzL6zT0302Zo/xRoK3j+c+YQo95UvVzF5pVMkKDp408KuI6RPb
         oxswPss2uVooM/Hz2yyuesAkK+Vtre6DjNCCi2j11qo2ecT3KwogsEM28QAF25G0fmPC
         kKBX3WZJR/bQryVBYDEbtZsC7RrMJQQJEzDn8lCOhTMVh9w10VnJd4X28iYtyXta5B8+
         YQwZKd1D3oPLO6biHaiyFDyvs3LAdN3vqPvxBQpwliCbmkNCwrJ23SIPUqyffh2FfJgc
         ciUvYMBdsHbxyfac8vfPkhrD8GOXNn29Af6z7gi3kWwl8GFDDkOGJykwz7ukgEdTpTlA
         79SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718166800; x=1718771600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFT573xAr2xtznmal0QSwzPFRJXGMmZiiu4vvGuLRvE=;
        b=bV6QQdMuG/alQpWUxC/r6GeeozUpHpNLV0g/Hb9NsUOQN1AkGymW3q8QEbgo3gm/B3
         rNtISOB9/kJEWo5dVB2ilnLUyeXwTsN1rns0NLTsCn/GTGTHf+N0a5AiSf/G2B1X/FLp
         MoW3sj1aImi4zhuj3EOSFpzxr4rEJCF9T5FKut7pTmvH0Qn5N/UC9tYHlNMLFCoVMq6s
         yNqnWcMX3kWE7KIhre2IftroQBBFmZkpHTzzgxbP7wCvXW0oHspxZIJ5baxLSuLVKQOg
         v7Soltmtv8nV8POnZW2lGT4mXqKaxqpBO+y+FeOjoFafuqSpHiK2+dHW0GoDVgkB7ptq
         tN9g==
X-Forwarded-Encrypted: i=1; AJvYcCU0Vkh24pfHv0vtWjvlWIiuKl1xULvi23psVhVw3XIn+HQHm2RClQ8BNjv1iwWHu+p2U5diWjVqOGKxfZFAq6kAEMwbApf7OUmWjSUxCg==
X-Gm-Message-State: AOJu0YxTkE97crQuHE2YRZBDfYsDGiFvhnbRr7Nq8UCSZUnHjkSd1EJS
	0yLkJBTATGzP+xje35UM+3k5j2shSFtG9PX0Apj/1GDucocFl0P7yMXbmMGISA==
X-Google-Smtp-Source: AGHT+IGjgzQJMzZ2YsUlBKZq5nu9pQSdHRAY35QBtjOBYDL5ZoL+j3Fi8tpi16/g1dFdclnegZjxZQ==
X-Received: by 2002:a17:902:6f08:b0:1f6:e338:2a6 with SMTP id d9443c01a7336-1f83b19c24bmr9564885ad.23.1718166800089;
        Tue, 11 Jun 2024 21:33:20 -0700 (PDT)
Received: from thinkpad ([120.60.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ee4ad6a5sm76284795ad.151.2024.06.11.21.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:33:19 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:03:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, quic_qianyu@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] bus: mhi: host: Import link_id item
Message-ID: <20240612043314.GB2645@thinkpad>
References: <20240607100114.452979-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607100114.452979-1-slark_xiao@163.com>

On Fri, Jun 07, 2024 at 06:01:14PM +0800, Slark Xiao wrote:
> For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
> This would lead to device can't ping outside successfully.
> Also MBIM side would report "bad packet session (112)".
> So we add a link id default value for SDX72.
> 

link_id is WWAN specific. But what you are passing is essentially 'mux_id', so
just use the actual name.

> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  include/linux/mhi.h                | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 0b483c7c76a1..1f9de2730766 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -53,6 +53,7 @@ struct mhi_pci_dev_info {
>  	unsigned int dma_data_width;
>  	unsigned int mru_default;
>  	bool sideband_wake;
> +	unsigned int link_default;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -469,6 +470,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
>  	.dma_data_width = 32,
>  	.mru_default = 32768,
>  	.sideband_wake = false,
> +	.link_default = 112,

Just use 'mux_id' here also.

>  };
>  
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
> @@ -1035,6 +1037,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>  	mhi_cntrl->mru = info->mru_default;
> +	mhi_cntrl->link_id = info->link_default;
>  
>  	if (info->edl_trigger)
>  		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index b573f15762f8..4da10b99c96e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -445,6 +445,7 @@ struct mhi_controller {
>  	bool wake_set;
>  	unsigned long irq_flags;
>  	u32 mru;
> +	u32 link_id;

Add kdoc comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-msm+bounces-55549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC82A9BF32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2745C1B841B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2122E3F3;
	Fri, 25 Apr 2025 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLnefPzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA11E5B70
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564920; cv=none; b=NqsVtycOQTU7WnpgK9MdjOxAFdiy14CwQ5oB1HQEqMmebYTSh1narM+VmsIZR++3ftwZEKAAx6mzlH/P0WhRgXC7uVmJRg2lBJzRKUVy/pOoFvIfbz33iEGJ2EYRaHtDv4trnc9z7+69VLAcSPcs7KwMftb8ZVdeG8+0DeMUHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564920; c=relaxed/simple;
	bh=PYvTg9aZdXtTezen2D7wExhWe3Tt/yAwWVhr+w0wvT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RT2JrRWcKvT2I6Vq68FC9xqKNjYk2ohqMKQiPVkfrW8QlIB3bm5GTd9xzLvggC6cwjsXn+pk6AkMtETtbkW3XpGg1niy8U5lniHAdQ3sIXi0n8aH/JtgGEWjRtXB1HgbhDGAk/kO957djK4ik/3/WAvcXHFlqhplYzycL8ZAw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLnefPzb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so1705829a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564918; x=1746169718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L31hl+vK6k/kd5TD37YLRKUEjEgBTKXW3stAWQwxpz4=;
        b=RLnefPzb6DeDbaloFrZ/yTQWm5c9I0scuDeF2Eb1UOrOOzMo3iGRXupZH/uKQ7L0+x
         C6aTKtawAvlKrWG/JFaq3De4lGT2FKkIzUnsXIeCWP058/P4w6ChD/TJg4/lSWxwok0f
         KsDB8sBMiPgka1QSVukmdG2ZHefy4gFnM7vGp6v/FhdfNgkLvSYvpORbFbJo0KNRDV12
         pnsl6xyZ6U7bkwKWsBUpzjpBWmaO25VGpFMtBWfQtxo9WJmOtwyPtj5T6mLTFtOgpEhm
         MQsnjZISZZbO8JWUPhwShoD9LrZMENXewtyzXJTGWjUwqqpLyqsMSj/PhTdb6Pt6rhpA
         P6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564918; x=1746169718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L31hl+vK6k/kd5TD37YLRKUEjEgBTKXW3stAWQwxpz4=;
        b=cajyjWRFyWNifIlbb7MIZiRq2TVbOSHPlBqhTLststRNBH+qnmeaaG4bSLSKzO5cjE
         /3RtE5Mai6kBpvVp8Y03AGcFMqQVEsqx7dLmYjcwlt2DJa81R6m+OxokgRunffVGRaYK
         mMF5Jv9jIzP+Sqi+yiV+TgxmjQ4MDBgATzTLs0fsvyLo82zxG3p0vkQAPDO4aV1A5NHC
         bbLxHh0ZJGSg+AXlr2n5K3nJ3E45gBVPHZWIgUx3wkenakyx/ilp7rR1Q8nqCrtqDsgp
         +ptFzDcv7+kgh7Lq/wLQCZ0nBSzQFr5xtPnQ3PnbwpCpMtPKA8yvXlDEtz7oShufXYOv
         XvDw==
X-Forwarded-Encrypted: i=1; AJvYcCUTxkCKtycN2oBcfRHYl4qUCufVWcQbfzww8Bpjf4+WSIchn8BrkoVySu8gMxCi36wyZKP+Hhz+ZmWXhrSE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WVhVfLIMuZ8SBuOftKg5NP2bjXVw6+u3PXQU8VA+oTenAn6A
	FcjUiar1/daXqWJiWJCUQ51bhFuMhevXy6AoVy2VzNc046CrZivt2uZAO07FY6Dk9JlmOp2YNPs
	=
X-Gm-Gg: ASbGnctxTFo8rWySnuvP9B5X2/61yVa1nFgXZ6oSYTgr261iIeDazNrcs5copJhRPqa
	mFrKSKtEuQJgshmPaUXedAZp1w72aBUM09PZU43IW3VXH4aQjGZKfhV/iDFjEzRHKazwOlhAeSQ
	l9WeMhVgKiEzmDGc848fP3dqtLb1VRTefhGCTk9YqWygSblsKuxYKAc8TaeQ+eEriwYZwRlTkvh
	OONUDnxampSugABS26GRjCCW5TGht79UPPUklaXMyddaqcB9ePMAVRz9Nf68cLo+v3C195IiUQb
	i6W2U5QLbSPSf4DOK14WJNZ/rwcwuXRVmonopvc75C9bRlt7KSg=
X-Google-Smtp-Source: AGHT+IFGW/FspbdQs6JeqyJL6is9dbZJH4PkDgO5s3NqtvjGFtvY8vCaQhjN346NJ+12RZnjfEeUjw==
X-Received: by 2002:a05:6a20:cf8f:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-2045b9f19d3mr1936987637.35.1745564918031;
        Fri, 25 Apr 2025 00:08:38 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aa16cbsm2493468b3a.155.2025.04.25.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:38:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v3] bus: mhi: host: pci: Disable runtime PM for QDU100
Message-ID: <ciwwfmadzgpzaie5isrmpzd7s373bgyk27hh5fjaqy6blqa4qo@ar7cdrv3uuxy>
References: <20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418-vdev_next-20250411_pm_disable-v3-1-0175b691de61@quicinc.com>

On Fri, Apr 18, 2025 at 07:18:18PM +0530, Vivek Pernamitta wrote:
> The QDU100 device does not support the MHI M3 state, necessitating the
> disabling of runtime PM for this device. It is essential to disable
> runtime PM if the device does not support Low Power Mode (LPM).

LPM is not very clear here. Please just use M3.

> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v3:
> - updated variable to no_m3 from pm_disable 
> - Link to v2: https://lore.kernel.org/r/20250418-vdev_next-20250411_pm_disable-v2-1-27dd8d433f3b@quicinc.com
> 
> Changes in v2:
> - Updated device from getting runtime suspended by avoid skipping autosuspend.
> - Updated commit message.
> - Link to v1: https://lore.kernel.org/r/20250414-vdev_next-20250411_pm_disable-v1-1-e963677636ca@quicinc.com
> ---
>  drivers/bus/mhi/host/pci_generic.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa887952098661a488650053a357f883d1559b..df80f3f62278d2cf96066c04926ce1ce58700d1b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -43,6 +43,7 @@
>   * @mru_default: default MRU size for MBIM network packets
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
> + * @no_m3: M3 is disabled (optional)

Remove 'optional'. It is an opt-in value.

>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -54,6 +55,7 @@ struct mhi_pci_dev_info {
>  	unsigned int dma_data_width;
>  	unsigned int mru_default;
>  	bool sideband_wake;
> +	bool no_m3;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -295,6 +297,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
> +	.no_m3 = true,
>  };
>  
>  static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -1270,8 +1273,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	/* start health check */
>  	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>  
> -	/* Only allow runtime-suspend if PME capable (for wakeup) */
> -	if (pci_pme_capable(pdev, PCI_D3hot)) {
> +	/**
> +	 * Disable Runtime PM if device doesn't support MHI M3 state
> +	 * and Allow runtime-suspend if PME capable (for wakeup)

"Only allow runtime suspend if both PME from D3Hot and M3 are supported"

- Mani

-- 
மணிவண்ணன் சதாசிவம்


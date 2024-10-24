Return-Path: <linux-arm-msm+bounces-35737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E59AF2AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCEE21C20D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3FC1EF931;
	Thu, 24 Oct 2024 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+/zXdSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315A22B662
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729798793; cv=none; b=NKueiQoGIaCeG+QDgfFG67PjZJBBbRvYT0l5VZPnBPFyxCmsDon4zRxogl9Ms9w5bR05C0tbIGLKo+PBtlm1mPgaCBbviXOM8wXRHGfRUEnwHGm1u5HHY2LkVnTWGm3PmNtgxJ1GulRp0fsgP/GMM1HZkHpvKdNzh81Eg9+GU2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729798793; c=relaxed/simple;
	bh=F/Ze67nW0IFUKBtGoiTQlpJha5hQGjN9SKG/CdavfAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tulH9ZbfPbKSYqHBcsGpvGJe0RHELLXc0kOcC0vR76+xzygtysDEUuhWxXb/JQ9HaPdHizSikQmlxwAJ0Cmev3qyjGwxTc7ZnBhY8mfq70pSOUTXsyfRF2sSTdKCzHoNVnXkKCpafoaFFVTstEeh8rQFIi3v1E77MThxP9P9a6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+/zXdSi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so13834551fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729798789; x=1730403589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odUCZ6i3Z9JVAJZgtcokijO9ujjlw7b3NCqdho3UKJk=;
        b=E+/zXdSiOe3uzIvSTPTRLaSGcyCsNvL7XX5Bk3Jpht3uA9HNhxwB1aFSi/HIOEsfoj
         LxGKiM8M5C49eqPRUuoOmB9QEe+GVFAmAO8+Gz/fQxu6y1w3g447189AOCjrzmNL/sSL
         m/zHnTVuP4iMayekYk5PaH5w2AI8p+xnNG56tqUMH+GHGgDh8LufBbOSTus98UOm+bg4
         wwJwdPlYn3jKWIS79YbeSsclYgH2bHklr5QnjLFTftmJatqvutX5vQS6XcsK7fenfgqC
         BSC8bthQkYbCMm3GXIMhZlB2UUIT6tQAx04QRH7/EzfsgEAzKe9YWC61wEG5PklZvuC4
         3brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729798789; x=1730403589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odUCZ6i3Z9JVAJZgtcokijO9ujjlw7b3NCqdho3UKJk=;
        b=cTXaXDwC5QeDDsAOH7B6lb0t4jGn7zE3VLhZ86Br3u9UHaFqbjs2jD5HwChAFIziY5
         LTiVPoInSR3GWed6krSHl5PIDhBnWJvJNdN0LslRJmEDwa4gZV/fPJXAAp58U/A7+dvu
         Of61+RjVg3QG2vCUTdmSKBq8SttxZOx0BgjJohTsuYlrBN2iIepdpcMCE1eY1uhyaSnj
         FmbBNISzvbTfJcXV6VOHMcUFvusQSo/3uvi18cuRgNuiprOa7aPSKysa/Dnmn6Uohy4k
         WB9qLhCMuLsAr69lVcIRY7QSZkROhYGjAYpMCbMt7DPoGmuVglmPpkQCkkT1ZK7Ubhpb
         1PNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIMypefNyXSzWO0aK1d2AjM+3rAWjm+/2IMj84mjRv8s99PVs4GKhzeWxI3Sn9jGrkdV4T7ODru/vdi2HG@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFgrianuIv8bL9mw4U2w4OUbE3N+iLaJQ3iK1Ol6mTEUI7bog
	vVINlDOT01mALTuaq8RoG4QACiG4WC2CFH1ccWWCGGioMO7y+Tmo0iSKZTRWyTc=
X-Google-Smtp-Source: AGHT+IHIulvo8rdeRwX4wcEo4Hy4+qR8jVUvlgiU74rNHovMaurcP6k/nUFgntCcOTVditUUe1/7GA==
X-Received: by 2002:a2e:4a12:0:b0:2fb:7f9f:7f50 with SMTP id 38308e7fff4ca-2fc9d330671mr32005781fa.13.1729798788920;
        Thu, 24 Oct 2024 12:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad608e2sm15086261fa.32.2024.10.24.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:39:47 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:39:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024002514.92290-3-quic_miaoqing@quicinc.com>

On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> IPA, thermal, RAM size and etc, so new firmware files used. This change
> allows board DT files to override the subdir of the firmware directory
> used to lookup the amss.bin and m3.bin.

I have slight concerns regarding the _board_ DT files overriding the
subdir. This opens a can of worms, allowing per-board firmware sets,
which (as far as I understand) is far from being what driver maintainers
would like to see. This was required for ath10k-snoc devices, since
firmware for those platforms is signed by the vendor keys and it is
limited to a particular SoC or SoC family. For ath11k-pci there is no
such limitation.

Would it be possible to use PCI subvendor / subdev to identify affected
cards? PCI Revision? Any other way to identify the device?  Please
provide lspci -nnvv for the affected device kind. Is there a way to
identify the RF part somehow?

Could you possibly clarify, how this situation is handled in Windows
world?

> 
> For example:
> 
> - ath11k/WCN6855/hw2.1/amss.bin,
>   ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default
> 
> - ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
>   ath11k/WCN6855/hw2.1/qca6698aq/m3.bin

This approach looks good to me, thank you.

> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 16 ++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index be67382c00f6..775e48551522 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1178,6 +1178,22 @@ static int ath11k_core_create_chip_id_board_name(struct ath11k_base *ab, char *n
>  					       ATH11K_BDF_NAME_CHIP_ID);
>  }
>  
> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> +				      const char *filename,
> +				      void *buf, size_t buf_len)
> +{	const char *board_name = NULL;
> +
> +	of_property_read_string(ab->dev->of_node, "firmware-name", &board_name);

soc_name rather than board_name, please. Or just fw_name.

> +
> +	if (board_name)
> +		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
> +			 ab->hw_params.fw.dir, board_name, filename);
> +	else
> +		snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
> +			 ab->hw_params.fw.dir, filename);
> +}
> +EXPORT_SYMBOL(ath11k_core_create_firmware_path);
> +
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *file)
>  {
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 09c37e19a168..ce4102cfed4d 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1249,6 +1249,9 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
>  
>  const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>  						    const char *filename);
> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> +				      const char *filename,
> +				      void *buf, size_t buf_len);
>  
>  static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
>  {
> @@ -1295,14 +1298,6 @@ static inline struct ath11k *ath11k_ab_to_ar(struct ath11k_base *ab,
>  	return ab->pdevs[ath11k_hw_mac_id_to_pdev_id(&ab->hw_params, mac_id)].ar;
>  }
>  
> -static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
> -						    const char *filename,
> -						    void *buf, size_t buf_len)
> -{
> -	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
> -		 ab->hw_params.fw.dir, filename);

It could have perfectly lived here. Is there any reason to move the
function?

> -}
> -
>  static inline const char *ath11k_bus_str(enum ath11k_bus bus)
>  {
>  	switch (bus) {
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry


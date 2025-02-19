Return-Path: <linux-arm-msm+bounces-48541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3FA3C632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF7683A9C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC69A21423F;
	Wed, 19 Feb 2025 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMIIVk5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131DF1FDE09
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739986083; cv=none; b=KIq987sERWJltQ/8IIva+VVlVTGs3LgAMpo7UbSTUq8IBNCBqiw5O95EeDQRh62oJG6fbOgtsBrrfjlLcRYHdrSXTQpHJXkVIZhdR4HhBgHsh94NGJv8VNCZz0GKCYeiWENeLeAyYizR2oOEGo1DZldhXHjQrfJVFRnxPgrocgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739986083; c=relaxed/simple;
	bh=A2+HN4X0kozADOMd8HPrxpMBAxhu8YWTaMSPkwDk7qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7ydmW7R5aF2e+otcdkKkH39A69NeV6BwMkVG5/p8nxMUjtDCYl5DlH7b6P7QDr3TJEwIxreLmvYqLmCm5dB5F0yROhYwo0OF1mQfINJoDK3FEcXavE50Ye8vOOFeUmoUgXommZ/eW7zUT4HQskczycOJc6Xw/ZCuu0PINJWmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMIIVk5X; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc1c80cdc8so52751a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739986081; x=1740590881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NzngaP+OJcFLsyG7y1oBQVz797WX/iYaGWrcxV/1GA=;
        b=WMIIVk5X/P+UcTpYed8sUaeBw6DrbuXb7SgnrczGTSV8LecrH+o+PyTU3QQcdj+E15
         Y2LPES0UK3byQR0gsU5DLnrE1Q9hVq4H/FSpF3HnSQ7VboN5lyJieC0B9SSKcDZmqtut
         OpzXX2/Od0w9rDn82DN8c/Nz0YNoMn9V2jxYorO9EPqhN5z69JpHX4HvwyT3Y0fqGcRp
         u5uHrVKTf7EbafgQtPj6pXS4LEjLpshA3no4C9tKoTF+q/nvI4OxiOoMGQH20tdrOBeS
         mN1h9gbNSiqN2oI5RKT5DtO0WDDZNSsQDViQYbIzMBX3v+fHq3pv//8vQ64/iQR41Ijc
         IzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739986081; x=1740590881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NzngaP+OJcFLsyG7y1oBQVz797WX/iYaGWrcxV/1GA=;
        b=N0LotAuGuyYRjePKIztP9f/9gwc/Ngy8aLeinQ5vJgE1rknnrNdPYiLO2moc4gMHVu
         gMHjb5ts45W9+ji19OA8fHAxD0pkMPPtNgC9jQj/KH+uFO0w2VFHPF3g+zwFJIuf+dhw
         ZTmIwBsackJ5vn4B5d5lqr/PdSAXiBav7wbL+w5WxAfsaZ8qiyKNWYehChpvbkm9RySY
         HiZV1JMG+JQmZVrxyzMYiPEBiJAP1AlKukZ0ajPYcd4tVP622D7lPV3LhPXwR2k4ikmq
         HvNJuKQfYX62N/P9I2kIAmkDqCjnRTOOLQVdKzQoiE2Dg3PxamE9mEz0iHJ3WMu4OWbF
         O2zg==
X-Forwarded-Encrypted: i=1; AJvYcCW4jzUf3/Ii0mnZAg45TeoBASTvxhZvcn0HFlK6jl9jV9Az8DlzCK9Qngmxr0OhSbNUyrLGzngxigRHmCGk@vger.kernel.org
X-Gm-Message-State: AOJu0YzOh2VAjfik2M74x2oi+/qxaTIzVm1LkCJbZ7CLTYMIt6MSEcdz
	iP+SBArtU7atCtyrZJ8OsY17+bgas/OHwIKARmdqEWdOFhiH1Q70h1HxI6W9DA==
X-Gm-Gg: ASbGnctvulLwXPP0ZAlxIDGZjnH07QWpxoLyT1YgqVlZHRK2EBbh2ugr0xGhZIHurED
	z+anMXuZbNQZK3y07P+Eom7b3tiAIhRTxVIPB1eNcRyWGOWFcdwTZBYRJckvgBaZTUt+vSqDUtB
	DwZLhglB7gRkjOYjr6QcArWtLbpCKGD2hhq73doxTeAbT26wtP337IZfNGTe9+YtAnXiEaGIlbG
	iTTfneKlxKZslSxW9wW0Oy9N3Ig1LWTiC27ctfauAj4s1v65qHs/MC4AOeSusEseIDEk9BhYK+P
	fvlHQKcbSVazHDM7xA/YmHdJvg==
X-Google-Smtp-Source: AGHT+IHOShpnSsF84pZmQWIv/xBAmLajjHNqHii8bXec9NnuKW9M7BOSWjuz/fRYPwl+0byTPs9X6w==
X-Received: by 2002:a17:90b:1b06:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2fcb5a996cdmr6581509a91.27.1739986081323;
        Wed, 19 Feb 2025 09:28:01 -0800 (PST)
Received: from thinkpad ([120.60.141.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm15735500a91.30.2025.02.19.09.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 09:28:01 -0800 (PST)
Date: Wed, 19 Feb 2025 22:57:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc: quic_cang@quicinc.com, quic_nitirawa@quicinc.com, bvanassche@acm.org,
	avri.altman@wdc.com, peter.wang@mediatek.com, minwoo.im@samsung.com,
	adrian.hunter@intel.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] scsi: ufs: qcom: Remove dead code in
 ufs_qcom_cfg_timers()
Message-ID: <20250219172755.b2jq5joh7nrrf6rr@thinkpad>
References: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>

On Wed, Feb 19, 2025 at 09:16:06AM -0800, Bao D. Nguyen wrote:
> Since 'commit 104cd58d9af8 ("scsi: ufs: qcom:
> Remove support for host controllers older than v2.0")',
> some of the parameters passed into the ufs_qcom_cfg_timers()
> function have become dead code. Clean up ufs_qcom_cfg_timers()
> function to improve the readability.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 23b9f6e..d89faf6 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -509,16 +509,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>   * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
>   *
>   * @hba: host controller instance
> - * @gear: Current operating gear
> - * @hs: current power mode
> - * @rate: current operating rate (A or B)
> - * @update_link_startup_timer: indicate if link_start ongoing
>   * @is_pre_scale_up: flag to check if pre scale up condition.
>   * Return: zero for success and non-zero in case of a failure.
>   */
> -static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
> -			       u32 hs, u32 rate, bool update_link_startup_timer,
> -			       bool is_pre_scale_up)
> +static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	struct ufs_clk_info *clki;
> @@ -534,11 +528,6 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
>  	if (host->hw_ver.major < 4 && !ufshcd_is_intr_aggr_allowed(hba))
>  		return 0;
>  
> -	if (gear == 0) {
> -		dev_err(hba->dev, "%s: invalid gear = %d\n", __func__, gear);
> -		return -EINVAL;
> -	}
> -
>  	list_for_each_entry(clki, &hba->clk_list_head, list) {
>  		if (!strcmp(clki->name, "core_clk")) {
>  			if (is_pre_scale_up)
> @@ -574,8 +563,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  
>  	switch (status) {
>  	case PRE_CHANGE:
> -		if (ufs_qcom_cfg_timers(hba, UFS_PWM_G1, SLOWAUTO_MODE,
> -					0, true, false)) {
> +		if (ufs_qcom_cfg_timers(hba, false)) {
>  			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
>  				__func__);
>  			return -EINVAL;
> @@ -831,9 +819,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
>  		}
>  		break;
>  	case POST_CHANGE:
> -		if (ufs_qcom_cfg_timers(hba, dev_req_params->gear_rx,
> -					dev_req_params->pwr_rx,
> -					dev_req_params->hs_rate, false, false)) {
> +		if (ufs_qcom_cfg_timers(hba, false)) {
>  			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
>  				__func__);
>  			/*
> @@ -1348,12 +1334,9 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
>  
>  static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
>  {
> -	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct ufs_pa_layer_attr *attr = &host->dev_req_params;
>  	int ret;
>  
> -	ret = ufs_qcom_cfg_timers(hba, attr->gear_rx, attr->pwr_rx,
> -				  attr->hs_rate, false, true);
> +	ret = ufs_qcom_cfg_timers(hba, true);
>  	if (ret) {
>  		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
>  		return ret;
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்


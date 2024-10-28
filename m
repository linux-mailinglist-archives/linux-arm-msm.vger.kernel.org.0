Return-Path: <linux-arm-msm+bounces-36174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E49B3220
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA571F2139D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBD538DD8;
	Mon, 28 Oct 2024 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EoU1Gjwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA41D5CDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123322; cv=none; b=Mt7MCFBIS/a0NxRqt+9ZrL0ZfGrWmpId6bGn48lVDcYaRcar3SzNvYmq3NuWDFcI414TElmJJy5eNDo9IJMpZmMIAfX2yZ42TRAtEJRImPEHZuTw80T1LI2lsmjm5UaaWlU8a4z4twagFSss9ACKroUPmcgKFXjJ8zmpC7DEQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123322; c=relaxed/simple;
	bh=YrW21edBkjhRXffmq7fqCAfQrZQuwQVPA7CVYicTKl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7tmUZ9rod7+ODmFceOZGbH5frh3KmtOJKYPNDuw5oog2bjGgA3SkiEPeF9hPS8B3VROTZ198U/+WFDgcb2pgt43/l4ZSwrcXJSxNIR3rYz5jFUAaGqSQ97n+XKUqvt4tsOGTTskmMnY+o+mSYtsF6lq8ys9hFyDZLhbDBeMNCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EoU1Gjwo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so41080721fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730123316; x=1730728116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NZPCzMOzwZyRIXRnUMu7IH49kqTGW+c27dAQf8GF45A=;
        b=EoU1Gjwo4+qI3M6aAUwb770BkJlVdrRzWxWodmRq923X72qGfsVoOUXv4JO0Tc/0Zf
         h3nOuxVkBToPtzYBfNxooDcPAuI0P4L5aHBfFGtELvKf6ySXQ5WfVs8ov/5yuSS96u8o
         j5PhnxAnUKUPHoF9FPxpOAhU271uAhHk5QyiMTrxW7ahz6/O27bRgj9OoKmeDyDV0p9P
         ov8xeK/P8G1ZVLm80fCpGXa6tuzy6vrR27SxIXl7zB6CVR/wctC1G1hH4/2RAy9DQInl
         b0pHX23k1/HYD2bNwQ9yXgcN8BMQ6PakfEk1HRX8fjqcRI0XGYw/t+ywZ7EHi+0cn2gE
         kjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123316; x=1730728116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZPCzMOzwZyRIXRnUMu7IH49kqTGW+c27dAQf8GF45A=;
        b=M6tQNTl8R10dNHtRFBpGjVN6EUP6QHxqXS4slZvrzoidDYpzpcAj1+WaW0CSAjYNAs
         6G8OtzkWRbHsqY8Kjf4J3jupL/XoXDc0FglyuP3PAgHMrkamqb1kwcYYXyOImxPeCX6L
         GrtdqsEBcng9ykR+/Hud2HjSsoZLE2B5csqdn3uolFbpiF67VvEFSzAkEn28mj6l77bL
         9S28r3RuV9trgnHZ+5ub7VOR5XcOt33jpaLrM9JONBsKv4YIfwq6NpGt2S+ojOmQsuUj
         leAooltc0lkD2mhqc7z6czwfkkL+zyNNr1dtaXW21p7iDKkytTY5CQKiHjK/6NmaLDMh
         d/sA==
X-Forwarded-Encrypted: i=1; AJvYcCW+2PqzPSNG0ai2F1HTLg75Z34G3EVSsNOqsYye26rdQpSNtEjT0q68WrjN+2jE+UXo8fFltqnVUkH4vKXD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UijvGE/c278NXSjWPPHcOTd2kbK19vyHN4rVy+bOalUlWooU
	Nb3Y+iY+/IZZPK8IX+a+V/I0PvOZ4ubTpYIqJmTOX6IGV2HvDJyor+/wiI3Nz38=
X-Google-Smtp-Source: AGHT+IHTM1CHIDCV2UDPDJxvN6ZqApv1ULwq/ThlNzIvUfW5egqsYo64WYifyqbpv7OS67mVupIPkQ==
X-Received: by 2002:a05:651c:2123:b0:2fb:403c:268b with SMTP id 38308e7fff4ca-2fcbe05091bmr36189401fa.34.1730123315998;
        Mon, 28 Oct 2024 06:48:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d1ad4sm11746181fa.87.2024.10.28.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 06:48:34 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:48:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] remoteproc: Clean rproc-driver-data for each instance
Message-ID: <qegymrjtlysfu5otr22phsburrsaia2ohf6povpr4q3lya7jo5@ghxwoecqm5cg>
References: <20241028133216.3711914-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028133216.3711914-1-quic_wasimn@quicinc.com>

On Mon, Oct 28, 2024 at 07:02:16PM +0530, Wasim Nazir wrote:
> Currently, all Qualcomm remoteproc client drivers have data structures
> with many common fields. Clean these data structures to categorize the
> common fields and create macros to fill rproc-driver-data instances.
> This will help reduce duplicates and make it easier for developers
> to fill data using the macros.

NAK, this is unreadable. So far we have been moving from macros to C99
init sequences. If you want to cleanup the interface, please introduce
the "base classes" (ADSP / CDSP / WPSS), which describe the data
specific to this DSP kind, and let platform-specific data use such base
classes as required.

> Currently, changes have been added for the PAS driver only.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 737 +++++------------------------
>  1 file changed, 129 insertions(+), 608 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..58311c9ad609 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -819,613 +819,134 @@ static void adsp_remove(struct platform_device *pdev)
>  	device_init_wakeup(adsp->dev, false);
>  }
> 
> -static const struct adsp_data adsp_resource_init = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sa8775p_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mbn",
> -	.pas_id = 1,
> -	.minidump_id = 5,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sdm845_adsp_resource_init = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sm6350_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sm6375_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.pas_id = 4,
> -	.minidump_id = 3,
> -	.auto_boot = false,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -};
> -
> -static const struct adsp_data sm8150_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sm8250_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data sm8350_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data msm8996_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.pas_id = 1,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data cdsp_resource_init = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sa8775p_cdsp0_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp0.mbn",
> -	.pas_id = 18,
> -	.minidump_id = 7,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		"nsp",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sa8775p_cdsp1_resource = {
> -	.crash_reason_smem = 633,
> -	.firmware_name = "cdsp1.mbn",
> -	.pas_id = 30,
> -	.minidump_id = 20,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		"nsp",
> -		NULL
> -	},
> -	.load_state = "nsp",
> -	.ssr_name = "cdsp1",
> -	.sysmon_name = "cdsp1",
> -	.ssctl_id = 0x20,
> -};
> -
> -static const struct adsp_data sdm845_cdsp_resource_init = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sm6350_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mx",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sm8150_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sm8250_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sc8280xp_nsp0_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"nsp",
> -		NULL
> -	},
> -	.ssr_name = "cdsp0",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sc8280xp_nsp1_resource = {
> -	.crash_reason_smem = 633,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 30,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"nsp",
> -		NULL
> -	},
> -	.ssr_name = "cdsp1",
> -	.sysmon_name = "cdsp1",
> -	.ssctl_id = 0x20,
> -};
> -
> -static const struct adsp_data x1e80100_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.dtb_firmware_name = "adsp_dtb.mdt",
> -	.pas_id = 1,
> -	.dtb_pas_id = 0x24,
> -	.lite_pas_id = 0x1f,
> -	.minidump_id = 5,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -};
> -
> -static const struct adsp_data x1e80100_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.dtb_firmware_name = "cdsp_dtb.mdt",
> -	.pas_id = 18,
> -	.dtb_pas_id = 0x25,
> -	.minidump_id = 7,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		"nsp",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sm8350_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.pas_id = 18,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -};
> -
> -static const struct adsp_data sa8775p_gpdsp0_resource = {
> -	.crash_reason_smem = 640,
> -	.firmware_name = "gpdsp0.mbn",
> -	.pas_id = 39,
> -	.minidump_id = 21,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		NULL
> -	},
> -	.load_state = "gpdsp0",
> -	.ssr_name = "gpdsp0",
> -	.sysmon_name = "gpdsp0",
> -	.ssctl_id = 0x21,
> -};
> -
> -static const struct adsp_data sa8775p_gpdsp1_resource = {
> -	.crash_reason_smem = 641,
> -	.firmware_name = "gpdsp1.mbn",
> -	.pas_id = 40,
> -	.minidump_id = 22,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		NULL
> -	},
> -	.load_state = "gpdsp1",
> -	.ssr_name = "gpdsp1",
> -	.sysmon_name = "gpdsp1",
> -	.ssctl_id = 0x22,
> -};
> -
> -static const struct adsp_data mpss_resource_init = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.pas_id = 4,
> -	.minidump_id = 3,
> -	.auto_boot = false,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mss",
> -		NULL
> -	},
> -	.load_state = "modem",
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -};
> -
> -static const struct adsp_data sc8180x_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.pas_id = 4,
> -	.auto_boot = false,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		NULL
> -	},
> -	.load_state = "modem",
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -};
> -
> -static const struct adsp_data msm8996_slpi_resource_init = {
> -	.crash_reason_smem = 424,
> -	.firmware_name = "slpi.mdt",
> -	.pas_id = 12,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"ssc_cx",
> -		NULL
> -	},
> -	.ssr_name = "dsps",
> -	.sysmon_name = "slpi",
> -	.ssctl_id = 0x16,
> -};
> -
> -static const struct adsp_data sdm845_slpi_resource_init = {
> -	.crash_reason_smem = 424,
> -	.firmware_name = "slpi.mdt",
> -	.pas_id = 12,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "slpi",
> -	.ssr_name = "dsps",
> -	.sysmon_name = "slpi",
> -	.ssctl_id = 0x16,
> -};
> -
> -static const struct adsp_data wcss_resource_init = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "wcnss.mdt",
> -	.pas_id = 6,
> -	.auto_boot = true,
> -	.ssr_name = "mpss",
> -	.sysmon_name = "wcnss",
> -	.ssctl_id = 0x12,
> -};
> -
> -static const struct adsp_data sdx55_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.pas_id = 4,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mss",
> -		NULL
> -	},
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x22,
> -};
> -
> -static const struct adsp_data sm8450_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.pas_id = 4,
> -	.minidump_id = 3,
> -	.auto_boot = false,
> -	.decrypt_shutdown = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mss",
> -		NULL
> -	},
> -	.load_state = "modem",
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -};
> -
> -static const struct adsp_data sm8550_adsp_resource = {
> -	.crash_reason_smem = 423,
> -	.firmware_name = "adsp.mdt",
> -	.dtb_firmware_name = "adsp_dtb.mdt",
> -	.pas_id = 1,
> -	.dtb_pas_id = 0x24,
> -	.minidump_id = 5,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"lcx",
> -		"lmx",
> -		NULL
> -	},
> -	.load_state = "adsp",
> -	.ssr_name = "lpass",
> -	.sysmon_name = "adsp",
> -	.ssctl_id = 0x14,
> -	.smem_host_id = 2,
> -};
> -
> -static const struct adsp_data sm8550_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.dtb_firmware_name = "cdsp_dtb.mdt",
> -	.pas_id = 18,
> -	.dtb_pas_id = 0x25,
> -	.minidump_id = 7,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		"nsp",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -	.smem_host_id = 5,
> -};
> -
> -static const struct adsp_data sm8550_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.dtb_firmware_name = "modem_dtb.mdt",
> -	.pas_id = 4,
> -	.dtb_pas_id = 0x26,
> -	.minidump_id = 3,
> -	.auto_boot = false,
> -	.decrypt_shutdown = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mss",
> -		NULL
> -	},
> -	.load_state = "modem",
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -	.smem_host_id = 1,
> -	.region_assign_idx = 2,
> -	.region_assign_count = 1,
> -	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> -};
> -
> -static const struct adsp_data sc7280_wpss_resource = {
> -	.crash_reason_smem = 626,
> -	.firmware_name = "wpss.mdt",
> -	.pas_id = 6,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mx",
> -		NULL
> -	},
> -	.load_state = "wpss",
> -	.ssr_name = "wpss",
> -	.sysmon_name = "wpss",
> -	.ssctl_id = 0x19,
> -};
> -
> -static const struct adsp_data sm8650_cdsp_resource = {
> -	.crash_reason_smem = 601,
> -	.firmware_name = "cdsp.mdt",
> -	.dtb_firmware_name = "cdsp_dtb.mdt",
> -	.pas_id = 18,
> -	.dtb_pas_id = 0x25,
> -	.minidump_id = 7,
> -	.auto_boot = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mxc",
> -		"nsp",
> -		NULL
> -	},
> -	.load_state = "cdsp",
> -	.ssr_name = "cdsp",
> -	.sysmon_name = "cdsp",
> -	.ssctl_id = 0x17,
> -	.smem_host_id = 5,
> -	.region_assign_idx = 2,
> -	.region_assign_count = 1,
> -	.region_assign_shared = true,
> -	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
> -};
> +#define RPROC_DATA_COMMON_adsp                                              \
> +	.crash_reason_smem = 423, .pas_id = 1, .firmware_name = "adsp.mdt", \
> +	.ssr_name = "lpass", .sysmon_name = "adsp", .ssctl_id = 0x14
> +#define RPROC_DATA_COMMON_adsp_mbn                                              \
> +	.crash_reason_smem = 423, .pas_id = 1, .firmware_name = "adsp.mbn", \
> +	.ssr_name = "lpass", .sysmon_name = "adsp", .ssctl_id = 0x14
> +
> +#define RPROC_DATA_COMMON_mpss                                               \
> +	.crash_reason_smem = 421, .pas_id = 4, .firmware_name = "modem.mdt", \
> +	.ssr_name = "mpss", .sysmon_name = "modem", .ssctl_id = 0x12
> +#define RPROC_DATA_COMMON_mpss1                                              \
> +	.crash_reason_smem = 421, .pas_id = 4, .firmware_name = "modem.mdt", \
> +	.ssr_name = "mpss", .sysmon_name = "modem", .ssctl_id = 0x22
> +
> +#define RPROC_DATA_COMMON_cdsp                                               \
> +	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp.mdt", \
> +	.ssr_name = "cdsp", .sysmon_name = "cdsp", .ssctl_id = 0x17
> +#define RPROC_DATA_COMMON_nsp0                                               \
> +	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp.mdt", \
> +	.ssr_name = "cdsp0", .sysmon_name = "cdsp", .ssctl_id = 0x17
> +#define RPROC_DATA_COMMON_cdsp0                                               \
> +	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp0.mbn", \
> +	.ssr_name = "cdsp", .sysmon_name = "cdsp", .ssctl_id = 0x17
> +
> +#define RPROC_DATA_COMMON_nsp1                                               \
> +	.crash_reason_smem = 633, .pas_id = 30, .firmware_name = "cdsp.mdt", \
> +	.ssr_name = "cdsp1", .sysmon_name = "cdsp1", .ssctl_id = 0x20
> +#define RPROC_DATA_COMMON_cdsp1                                               \
> +	.crash_reason_smem = 633, .pas_id = 30, .firmware_name = "cdsp1.mbn", \
> +	.ssr_name = "cdsp1", .sysmon_name = "cdsp1", .ssctl_id = 0x20
> +
> +#define RPROC_DATA_COMMON_slpi                                               \
> +	.crash_reason_smem = 424, .pas_id = 12, .firmware_name = "slpi.mdt", \
> +	.ssr_name = "dsps", .sysmon_name = "slpi", .ssctl_id = 0x16
> +#define RPROC_DATA_COMMON_wcnss                                              \
> +	.crash_reason_smem = 421, .pas_id = 6, .firmware_name = "wcnss.mdt", \
> +	.ssr_name = "mpss", .sysmon_name = "wcnss", .ssctl_id = 0x12
> +#define RPROC_DATA_COMMON_wpss                                              \
> +	.crash_reason_smem = 626, .pas_id = 6, .firmware_name = "wpss.mdt", \
> +	.ssr_name = "wpss", .sysmon_name = "wpss", .ssctl_id = 0x19
> +
> +#define RPROC_DATA_COMMON_gpdsp0                                              \
> +	.crash_reason_smem = 640, .pas_id = 39, .firmware_name = "gpdsp0.mbn", \
> +	.ssr_name = "gpdsp0", .sysmon_name = "gpdsp0", .ssctl_id = 0x21
> +#define RPROC_DATA_COMMON_gpdsp1                                              \
> +	.crash_reason_smem = 641, .pas_id = 40, .firmware_name = "gpdsp1.mbn", \
> +	.ssr_name = "gpdsp1", .sysmon_name = "gpdsp1", .ssctl_id = 0x22
> +
> +#define RPROC_DATA_COMMON_FOR_SS(ss) RPROC_DATA_COMMON_##ss
> +
> +#define RPROC_DATA_FILLER(target, ss, dtpid, dtfname, lid, mid, sid, autob,   \
> +			  decshut, loadstate, regidx, regcnt, regshd, regvmid, \
> +			  ...)                                                 \
> +	static const struct adsp_data target##_##ss##_resource = {             \
> +		RPROC_DATA_COMMON_FOR_SS(ss),                                  \
> +		.dtb_pas_id = dtpid,                                           \
> +		.dtb_firmware_name = dtfname,                                  \
> +		.lite_pas_id = lid,                                            \
> +		.minidump_id = mid,                                            \
> +		.smem_host_id = sid,                                            \
> +		.auto_boot = autob,                                            \
> +		.decrypt_shutdown = decshut,                                   \
> +		.proxy_pd_names = (char *[]){ __VA_ARGS__ },                   \
> +		.load_state = loadstate,                                       \
> +		.region_assign_idx = regidx,                                   \
> +		.region_assign_count = regcnt,                                 \
> +		.region_assign_shared = regshd,                                \
> +		.region_assign_vmid = regvmid,                                 \
> +	}
> 
> -static const struct adsp_data sm8650_mpss_resource = {
> -	.crash_reason_smem = 421,
> -	.firmware_name = "modem.mdt",
> -	.dtb_firmware_name = "modem_dtb.mdt",
> -	.pas_id = 4,
> -	.dtb_pas_id = 0x26,
> -	.minidump_id = 3,
> -	.auto_boot = false,
> -	.decrypt_shutdown = true,
> -	.proxy_pd_names = (char*[]){
> -		"cx",
> -		"mss",
> -		NULL
> -	},
> -	.load_state = "modem",
> -	.ssr_name = "mpss",
> -	.sysmon_name = "modem",
> -	.ssctl_id = 0x12,
> -	.smem_host_id = 1,
> -	.region_assign_idx = 2,
> -	.region_assign_count = 3,
> -	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
> -};
> +RPROC_DATA_FILLER(common,    adsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
> +RPROC_DATA_FILLER(sa8775p,    adsp_mbn,   0,     NULL,             0,     5,  0, true,   false,  "adsp",   0,  0,  false,  0,       "lcx", "lmx", NULL);
> +RPROC_DATA_FILLER(sdm845,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      NULL);
> +RPROC_DATA_FILLER(sm6350,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(sm6375,    mpss,   0,     NULL,             0,     3,  0, false,  false,  NULL,     0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(sm8150,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(sm8250,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(sm8350,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(msm8996,   adsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(common,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
> +RPROC_DATA_FILLER(sa8775p,    cdsp0,   0,     NULL,             0,     7,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", "nsp", NULL);
> +RPROC_DATA_FILLER(sa8775p,    cdsp1,   0,     NULL,             0,     20,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", "nsp", NULL);
> +RPROC_DATA_FILLER(sdm845,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      NULL);
> +RPROC_DATA_FILLER(sm6350,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mx",   NULL);
> +RPROC_DATA_FILLER(sm8150,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(sm8250,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(sc8280xp,  nsp0,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "nsp",     NULL);
> +RPROC_DATA_FILLER(sc8280xp,  nsp1,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "nsp",     NULL);
> +RPROC_DATA_FILLER(x1e80100,  adsp,   0x24,  "adsp_dtb.mdt",   0x1f,  5,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(x1e80100,  cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  "nsp",  NULL);
> +RPROC_DATA_FILLER(sm8350,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  NULL);
> +RPROC_DATA_FILLER(sa8775p,    gpdsp0,   0,     NULL,             0,     21,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", NULL);
> +RPROC_DATA_FILLER(sa8775p,    gpdsp1,   0,     NULL,             0,     22,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", NULL);
> +RPROC_DATA_FILLER(common,    mpss,   0,     NULL,             0,     3,  0, false,  false,  "modem",  0,  0,  false,  0,                      "cx",      "mss",  NULL);
> +RPROC_DATA_FILLER(sc8180x,   mpss,   0,     NULL,             0,     0,  0, false,  false,  "modem",  0,  0,  false,  0,                      "cx",      NULL);
> +RPROC_DATA_FILLER(msm8996,   slpi,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "ssc_cx",  NULL);
> +RPROC_DATA_FILLER(sdm845,    slpi,   0,     NULL,             0,     0,  0, true,   false,  "slpi",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(qcs404,    wcnss,  0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
> +RPROC_DATA_FILLER(sdx55,     mpss1,  0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "cx",      "mss",  NULL);
> +RPROC_DATA_FILLER(sm8450,    mpss,   0,     NULL,             0,     3,  0, false,  true,   "modem",  0,  0,  false,  0,                      "cx",      "mss",  NULL);
> +RPROC_DATA_FILLER(sm8550,    adsp,   0x24,  "adsp_dtb.mdt",   0,     5,  2, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
> +RPROC_DATA_FILLER(sm8550,    cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  5, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  "nsp",  NULL);
> +RPROC_DATA_FILLER(sm8550,    mpss,   0x26,  "modem_dtb.mdt",  0,     3,  1, false,  true,   "modem",  2,  1,  false,  QCOM_SCM_VMID_MSS_MSA,  "cx",      "mss",  NULL);
> +RPROC_DATA_FILLER(sc7280,    wpss,   0,     NULL,             0,     0,  0, true,   false,  "wpss",   0,  0,  false,  0,                      "cx",      "mx",   NULL);
> +RPROC_DATA_FILLER(sm8650,    cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  5, true,   false,  "cdsp",   2,  1,  true,   QCOM_SCM_VMID_CDSP,     "cx",      "mxc",  "nsp",  NULL);
> +RPROC_DATA_FILLER(sm8650,    mpss,   0x26,  "modem_dtb.mdt",  0,     3,  1, false,  true,   "modem",  2,  3,  false,  QCOM_SCM_VMID_MSS_MSA,  "cx",      "mss",  NULL);
> 
>  static const struct of_device_id adsp_of_match[] = {
> -	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,msm8226-adsp-pil", .data = &common_adsp_resource},
>  	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
> -	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,msm8974-adsp-pil", .data = &common_adsp_resource},
>  	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
> -	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
> +	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource},
>  	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
> -	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init},
> -	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
> -	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
> -	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> -	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
> +	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource},
> +	{ .compatible = "qcom,qcs404-adsp-pas", .data = &common_adsp_resource },
> +	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &common_cdsp_resource },
> +	{ .compatible = "qcom,qcs404-wcss-pas", .data = &qcs404_wcnss_resource },
> +	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_mbn_resource},
>  	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
>  	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
>  	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
>  	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
>  	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
> -	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sc7180-mpss-pas", .data = &common_mpss_resource},
>  	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
>  	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
> -	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sc7280-mpss-pas", .data = &common_mpss_resource},
>  	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
>  	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
>  	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
> @@ -1433,35 +954,35 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
>  	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
>  	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
> -	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
> -	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
> -	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
> -	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
> -	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
> +	{ .compatible = "qcom,sdm660-adsp-pas", .data = &common_adsp_resource},
> +	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource},
> +	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource},
> +	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource},
> +	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss1_resource},
>  	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource},
> -	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
> -	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
> +	{ .compatible = "qcom,sm6115-adsp-pas", .data = &common_adsp_resource},
> +	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &common_cdsp_resource},
>  	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
>  	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
>  	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
> -	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sm6350-mpss-pas", .data = &common_mpss_resource},
>  	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
>  	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
>  	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
>  	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
>  	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
> -	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
> -	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
> +	{ .compatible = "qcom,sm8150-mpss-pas", .data = &common_mpss_resource},
> +	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource},
>  	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
>  	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
> -	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource_init},
> +	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource},
>  	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
>  	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
> -	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
> -	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
> +	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource},
> +	{ .compatible = "qcom,sm8350-mpss-pas", .data = &common_mpss_resource},
>  	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
>  	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
> -	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},
> +	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource},
>  	{ .compatible = "qcom,sm8450-mpss-pas", .data = &sm8450_mpss_resource},
>  	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
>  	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
> --
> 2.46.1
> 

-- 
With best wishes
Dmitry


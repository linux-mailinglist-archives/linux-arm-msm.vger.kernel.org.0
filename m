Return-Path: <linux-arm-msm+bounces-33533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1A994727
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B872E288A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F031DE898;
	Tue,  8 Oct 2024 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTVDJAd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD81DE3AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387208; cv=none; b=LIcnotYvMQOc69Y/QR8XSoDzPNK0wbXyh3b0qPpLwGudvHSacCXCw5Gpl/whyUH4LeZAJG08t20h2Jyo1sSIqGkfIPtL6yJaQGP9j7or/URDFqgqHcSl1YmGhi7oV/4K/rw7UZ5uJUt68cINyogzaITamEhmZbLfZbyDO/sOtpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387208; c=relaxed/simple;
	bh=PLB12oYQatJYMTutRvjXTfuu9W+j21isQNzbfPiFAI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6RPDIwMI4RwBHJjSdiHtJfXd29KWeRfSXpuJoP2UkZMgutfnZw+5P0K9D/ObudpKTx6/ji6dq1Emu+6N74NL1xj6QUXv6fD9koz46qJfQ5NENuJfdvRX5yAC8cvqi8tmpNzOAVSEgi1H83WIJ3HIYepwcwFlbMrsriE4kvJ/3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTVDJAd4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539885dd4bcso6841752e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728387205; x=1728992005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4K0Sv/bh2mIbht7JKzv/ZRENvOft50Uv7ZtC8ajNvs=;
        b=FTVDJAd4WYcoGohL9kyonFV8pPPRh1Gnaph/zgaZ7SIvhpfLrYv3YM3BnaEb6B0iIM
         Z6rT2XMpItIyWBgiCIQbAMeUXgs+Whe1aSQvDkXIH8VdKfJoFydIt1jwMFxcudVoHfNb
         qq2iITY9OuiV+Y7JIKfNTSgHwiFY6cb9MiePmJ9f06JBYkd/IX71/RkcIq3A44EBdPRb
         B/9i/MryVnUG6BaYExSr66l5U9zicvoGfaKBWAp5UgaMVaYiDBf1P+g7UDuZGUfWYO4E
         3oeIRHIdRVmUwBLRhpp63tZoOeO8wrrvHsDAL522QmD+QYMvMoAQVTmGVK3AV3JMsdXl
         fs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387205; x=1728992005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4K0Sv/bh2mIbht7JKzv/ZRENvOft50Uv7ZtC8ajNvs=;
        b=udSApcdzaKInBC3Sojt7Prczn11KF5pxcBMA6MnoFrD3PIZdIcSdFDVupqRSrCIgBX
         biZPVDi8kqUBtBHo1qKc0WwA8bRIuQ8hTQnCxGSww2wLD/3DgDet6PTPIXFaszrGOx1h
         VQD6NuB4VRiO6++ES8xdGFKCs/ETSCHlYqsxafjuXF3qfJuQmJxmP0FgKzV8uWsfQPZA
         E94cxJUJJIYx9z/fDVRu6NuAvxuCCG+YpWnhJ5YQnVJ5BMhErjRcPAjBytxWGzIK32Xb
         hv/rFtVQUl1wm8/CfomH2vUynpdEHWRANX8DhcRe5pQpbuOuRYpCxHIlolaacIqHVB0B
         k4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwJIpYdcH21/G+RtkD4MS9We2SCxRiy3id/x5iRj4/ePn8DisbLrXhAekEGYpXItWj/rXETjt4GFxR3mSi@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIevMhxvak0q+nDhyKCTEhyIdFRuXZlXbhQOnOdTtvzqMkaFz
	hiLGfN6lDQ9R0GPYysLNcZ2n02YKff1uf02unxjVmoMhL6lBWl3ctT8ZFHr3hTQ=
X-Google-Smtp-Source: AGHT+IHTHVPNx/1wPJW+yZd2c+2t1f2SoLmGMxU3c8lP9VJaGBWnVqYKgbXQFszBYzxjnRrYUZEVVg==
X-Received: by 2002:a05:6512:2398:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-539ab877af4mr9363301e87.22.1728387204599;
        Tue, 08 Oct 2024 04:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff282casm1172874e87.273.2024.10.08.04.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:33:24 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:33:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_renjiang@quicinc.com
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: core: add qcs615 DT compatible and
 resource data
Message-ID: <ag4hoy7gxnhdcodttldlcyli6e2fzve24rnzi57cdthqvwo3dk@rvn7ahqzrpjo>
References: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
 <20241008-add_qcs615_video-v1-2-436ce07bfc63@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-add_qcs615_video-v1-2-436ce07bfc63@quicinc.com>

On Tue, Oct 08, 2024 at 04:46:35PM GMT, Renjiang Han via B4 Relay wrote:
> From: Renjiang Han <quic_renjiang@quicinc.com>
> 
> add qcs615 DT compatible and resource data

Please expand the commit message.

> 
> Change-Id: I1a06f105f030cbf16f48a32f8c50c814f0dbde7a

No Gerrit tags.

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 84e95a46dfc9832981ac1c0c58e226a506896ade..15cd78279cb7487f5f1da4e5d617da7b4a481451 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -816,6 +816,55 @@ static const struct venus_resources sc7180_res = {
>  	.fwname = "qcom/venus-5.4/venus.mbn",
>  };
>  
> +static const struct freq_tbl qcs615_freq_table[] = {
> +	{ 0, 460000000 },
> +	{ 0, 410000000 },
> +	{ 0, 380000000 },
> +	{ 0, 300000000 },
> +	{ 0, 240000000 },
> +	{ 0, 133333333 },
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_enc[] = {
> +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_dec[] = {
> +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> +};

As a feedback to Iris developers. The configuration below is the same as
the existing sc7180 config. The only difference being the bandwidth and
frequency tables. We should find a way to move frequency data to OPP
tables to remove the necessity to duplicate platform definitions.

> +
> +static const struct venus_resources qcs615_res = {
> +	.freq_tbl = qcs615_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
> +	.bw_tbl_enc = qcs615_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
> +	.bw_tbl_dec = qcs615_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
> +	.clks = {"core", "iface", "bus"},
> +	.clks_num = 3,
> +	.vcodec0_clks = {"vcodec0_core", "vcodec0_bus"},
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
> +	.vpu_version = VPU_VERSION_AR50,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xe0000000 - 1,
> +	.cp_start = 0,
> +	.cp_size = 0x70800000,
> +	.cp_nonpixel_start = 0x1000000,
> +	.cp_nonpixel_size = 0x24800000,
> +	.fwname = "qcom/venus-5.4/venus.mbn",
> +};
> +
>  static const struct freq_tbl sm8250_freq_table[] = {
>  	{ 0, 444000000 },
>  	{ 0, 366000000 },
> @@ -943,6 +992,7 @@ static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> +	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },

The list is sorted. PLease keep it this way.

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry


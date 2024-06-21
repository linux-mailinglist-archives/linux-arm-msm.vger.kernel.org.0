Return-Path: <linux-arm-msm+bounces-23653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E44912F31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684751C2153D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FDA17C229;
	Fri, 21 Jun 2024 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaqRYFcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE817C21F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004103; cv=none; b=qWJdaJgrwuU7cuQcM6jLyL4tQjdzdivF637hpXzQ6dl608Nh435W57j6SJHl1J7+RjqPzOCjeV4XaaDkIOs/Xy44DEC59BxBC3mOxlh9JxO1/FH1TisMmNMNiCPpcM6SaJ+kd6N1hWof3EUy6vEPYyYTQbuAzEojCx88KSH/8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004103; c=relaxed/simple;
	bh=bPLaeEhvuwdvCfoGzBAsG2GsboVlPdH3OleZXzQ7dak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+YBQAeOm61U1jCAtKjn9GtU845mr+PvwL0g/pUs5AtKAcjX9hcnHZoX3aHbbpnfFrP/Yahiq1zaEyX72+1jZS/0R4bEs3sE1OrFDPwtJF0fqCCdmgAL/wlNhg9NeFuItJdrmD5eum46RwbBwNbX/8F3jcWCO5pFOLNzxG/pCdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaqRYFcA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cc5d5179aso3197965e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719004100; x=1719608900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKDn9WDsvMx1u3mvfwAal5NXqfcR5qwHZLdccCOZ9ts=;
        b=qaqRYFcAmCec6jLfffwLdpzqB6PXubz5oL1WOZ2Keu9cZC7djFzBkrekEqnWQgi0b0
         UvKLlA52xhNTHws1M8iiL1YJGAJncQA8gpT+MCTUrshz4T9edtgHUR5PHCjKccAB/wL7
         9BVxgnpt3ku5Mu0vF67gICfHoOXMB2TsG3iUidPCJxB8TcyMEEd58ZHALxgJ5ZmZKH6u
         RXwgG+weH/NoU3iVwHp9qWAkKpCj5vDCgDDvhhbraz6nYSp3MYxthie3QIdkXVCppjvb
         M7nL2yr7nzuDp5KRdtKnXPFI3p2GdfuGxUKBvYUNkbbBYGbSa13PCz06LkEn2jZnUpNF
         WWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004100; x=1719608900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKDn9WDsvMx1u3mvfwAal5NXqfcR5qwHZLdccCOZ9ts=;
        b=DeB4ZxMJ/rWsEtul/3ZQVFsOqR6y1vWuWAiPNtMzukotDl6E2tGhlanohnWkaiHp4X
         kL2Mcvas6/Y8Ve4MIPLl3w58BeLcmQQKzbFL7Dek2Iei0dfRzEe7VjkpN9Yefo5bNQ/h
         JzJT2y99SAYVRXH47O2Cw6uh5JCm1Pg+INLstZpVrFsKPHD0Da3IqNn9p1Do82ueYSQ8
         MiMjZjkXPskTa4dpYo3f+MV9XBTBMYEFL8sVdbvZrJjaIemJn4/rGn47MfSHRIcXYiqv
         DOg/9eJLIg8Ike7Vm2UJWVaG7f1UxL21r8yuEJjwirrc8hPxTV55qCSY7+EzpQjp2eZj
         i7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXcbMhijAGQw/+Hli1OCa/tNcrL1tbIZzC5+iiNudGC5h0f3UI3Hu4KoG2tFQy4QVHf8P/yMSHLVn9xzjaWy+2BSZnjvecG8d1fAYD7Ug==
X-Gm-Message-State: AOJu0YxZZpXdwkftlM1rs+OU9eHiDgj94vQ09xXBdpHXfZWk4I5Q11IA
	b4PhpNkZAMNpBK/R2jV3fbGIhjHGz8hR84aesw0Zr6/ld8eSQTqfXrgGxjYU9g4=
X-Google-Smtp-Source: AGHT+IFUk+V09aZUixf6lRl8ihl3H4k0wsEnZZx8TWif1xVFqV5G9crEcfDXDGZ4O1vGwGWzVcQI6Q==
X-Received: by 2002:a05:6512:76:b0:52c:84a7:f9d5 with SMTP id 2adb3069b0e04-52ccaa5a0abmr5695233e87.69.1719004099612;
        Fri, 21 Jun 2024 14:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b48f8sm308949e87.2.2024.06.21.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:08:19 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
Message-ID: <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-2-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
> PRNG clock is needed by the secure PIL, support for the same
> is added in subsequent patches.

Which 'same'?
What is 'secure PIL'?

> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
>  1 file changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 94f68c919ee6..366b19cbd994 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -91,19 +91,6 @@ enum {
>  	WCSS_QCS404,
>  };
>  
> -struct wcss_data {
> -	const char *firmware_name;
> -	unsigned int crash_reason_smem;
> -	u32 version;
> -	bool aon_reset_required;
> -	bool wcss_q6_reset_required;
> -	const char *ssr_name;
> -	const char *sysmon_name;
> -	int ssctl_id;
> -	const struct rproc_ops *ops;
> -	bool requires_force_stop;
> -};
> -
>  struct q6v5_wcss {
>  	struct device *dev;
>  
> @@ -128,6 +115,7 @@ struct q6v5_wcss {
>  	struct clk *qdsp6ss_xo_cbcr;
>  	struct clk *qdsp6ss_core_gfmux;
>  	struct clk *lcc_bcr_sleep;
> +	struct clk *prng_clk;
>  	struct regulator *cx_supply;
>  	struct qcom_sysmon *sysmon;
>  
> @@ -151,6 +139,21 @@ struct q6v5_wcss {
>  	struct qcom_rproc_ssr ssr_subdev;
>  };
>  
> +struct wcss_data {
> +	int (*init_clock)(struct q6v5_wcss *wcss);
> +	int (*init_regulator)(struct q6v5_wcss *wcss);
> +	const char *firmware_name;
> +	unsigned int crash_reason_smem;
> +	u32 version;
> +	bool aon_reset_required;
> +	bool wcss_q6_reset_required;
> +	const char *ssr_name;
> +	const char *sysmon_name;
> +	int ssctl_id;
> +	const struct rproc_ops *ops;
> +	bool requires_force_stop;
> +};

Move this back and use forward-declaration of struct q6v5_wcss.

> +
>  static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
>  {
>  	int ret;

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-81597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA097C57522
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC6C935095F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEF334EEEC;
	Thu, 13 Nov 2025 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSh0r3cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD834E74B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035039; cv=none; b=egcQ0moIe89VRY0BUNetaUrwiKTXn/WTAJXFk0fToIGCgOj9kt6w685EtOwRwSzVKygK1jNeU4Rr71nsrpJt5KTlqmQs4i/bt3MmAxcBJADyboNf2aqKKFbVDrkR3hm9wPicvbDhhQ5bx03WKQ+L6+tN/FyHhad7Rt+5Kkh3FE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035039; c=relaxed/simple;
	bh=3C29Q45QiYOyNH9+Uzgm2x1iE6Ss30RmLieomkQXEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOUnVKiMIj5ldhvbWeGf7mBXhTRrbo66wMQ3zf2xqKs3UUk7+rXCO/KJNpQYRYani4hunsGQmx5lavnjSymPt2MqEr5BEifY9BdNslCHVGdPDXpPmArpE/DJajvYUtEYoPfCaF4Am+KLqXAbgWUH0dtHuhr2lXAEdrInaG8H53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSh0r3cp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so1278418a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763035036; x=1763639836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pfe1V+epjpy6bgW6SoCEKzjepepuLRA0eHE/Lz4yqY=;
        b=sSh0r3cpu4mIwIgz5fFj0OyIhcgJDzVqNz1/2VE8rHJ/icz2YdsAuJeZxPUnZkBulq
         XLIlEyE7/wnq2mDYjhLr824ibMXNS+HxKqqoELboAqCO2minCU+lf7MA8SKdN0DCXtn8
         jATMyZnpX6slPbVL6oxWn2g4tbSIWmy0m4vq2c+/Zs3rBA34/W7HDDckyURGYpvxhpP6
         iVK/CuyshLcEz1amTQ59udUoACRZvOsazrf2FrHVn6vl7U/rU7NrgajMrLH1ym7f1zef
         2IAKXkiRgjK7qngopNfWe8wTUQBiUQsmM+R7l8Dbu337D65zbKVeCyVQ1YHSj7qyFmLz
         EHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035036; x=1763639836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pfe1V+epjpy6bgW6SoCEKzjepepuLRA0eHE/Lz4yqY=;
        b=TRKD6s8fo08eYLQk4UFgfzFHY38s8p4Pcvau5/EldhzYv5gLlDv7LUtcKrb8WEA9Eu
         w/y4Jaa8ACDRm9pyWB4rDjHHu74VZpjCADXoS/fa+VvC7MWnVv2gX6jfGfVTG5JFEhv0
         ua0UgeKb69oF4IgDVi7mnVjCvjjAFQF2IcSry6GLsPPDTMVrjXVZzcBSjsv2k2rY6E7V
         oSjgC8D9FCnHa86XL+pGi8OBQtbfcO/rSOpl1LUKmG0hhPMCYdU9+yiM0FLI6H1nekIo
         ypkuaiyB8yBGZ6UEap5KeTc7oDj0BJyb6HqLd8mn2irIVT9P4FmSEOsLgZ3Qocb1k4xG
         Mnyw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBwEFWJgmeRSYUiFd37iy2CN4/HE53YW07lT/r5fV3r1FhnMyE8RDOOUBKyiTPl1mOHW2XyNIV9JmKLHx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89A3RE0qvQuaa11MLh+HKtBdbhFpk6pVooQbSG8kaRNpN5CJB
	1onpsA7J+e4K+vycw6FVNsLYkgkHsibF66BdUZJlln/OVR4pSwr2Z5G81QqIc7suFDY=
X-Gm-Gg: ASbGnctDrHyyD1jAK26LYn20TKYWGNmiV9dUQthp118zBN1jqW7ubDfWVrJMt0Bav/t
	VR0ml1kJP5DNu4ajNDE01JYxzAzTnVsG52lfXinEGIHqvRGaC5s7oToY2BT9eBHkURMDOR3pdY5
	z/TAv4OqDbeGaSnMavP3K6mUvnm/KdXK17CsZLMR2EtPM/+t/MpDLx756AskDgtVmVnW7sS1YWY
	pONDTaqoudoKVeMzrTn8lKCaLBQpDxkDY4d4XMhp7c4y+YlQfXGa+FRgJuObm74OC5UsM2TD7rL
	ybpN8kzD8hIkJ+5BeXlmCR97bUwmp7l2LtMzTceycdxfZq3RZ3fApm76qA60W3H+9MVEslxePtk
	Fg+g+R6m7n9pdnRtoQ5Ce3j3dhQOJoS/6FqK+4gKKfgQ628jZC+kcqHmscVDk+xOuqdWNYj7kil
	A7N3qcjUR9QEA/
X-Google-Smtp-Source: AGHT+IGgiSF1zetGk7scP6UPOWU5rKLto8aKAOIhNy5s1Fw9vFiOgcRh6HS62kk2VZBRDEGdVcPCCg==
X-Received: by 2002:a05:6402:3585:b0:641:66cc:9d91 with SMTP id 4fb4d7f45d1cf-6431a56b3d7mr5951684a12.27.1763035035749;
        Thu, 13 Nov 2025 03:57:15 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e68d:9e37:1627:2b9b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm1309174a12.34.2025.11.13.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:57:15 -0800 (PST)
Date: Thu, 13 Nov 2025 12:57:08 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Message-ID: <aRXHlL49sSGML__G@linaro.org>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 04:05:54PM +0530, Mukesh Ojha wrote:
> When the Peripheral Authentication Service (PAS) method runs on a SoC
> where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
> reset sequences are handled by TrustZone. In such cases, Linux must
> perform additional steps before invoking PAS SMC calls, such as creating
> a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
> these additional steps when Linux runs at EL2.
> 
> To support this, there is a need for a data structure that can be
> initialized prior to invoking any SMC or MDT functions. This structure
> allows those functions to determine whether they are operating in the
> presence or absence of the Gunyah hypervisor and behave accordingly.
> 
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to differences in
> metadata context handling. Remoteproc subsystems retain the metadata
> context until authentication and reset are completed, while
> non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
> retain the metadata context and can free it within the
> qcom_scm_pas_init() call by passing a NULL context parameter and due to
> these differences, it is not possible to extend metadata context
> handling to support remoteproc and non remoteproc subsystem use PAS
> operations, when Linux operates at EL2.
> 
> Add PAS context data structure and initialization helper function.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 12 ++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 0a0c48fca7cf..e4eb7f3ab7a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,38 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +/**
> + * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
> + *				      context for a given peripheral
> + *
> + * PAS context is device-resource managed, so the caller does not need
> + * to worry about freeing the context memory.
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> + */
> +void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,

Why does this return void* rather than struct qcom_scm_pas_context *?

> +				     size_t mem_size)
> +{
> +	struct qcom_scm_pas_context *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);

Thanks,
Stephan


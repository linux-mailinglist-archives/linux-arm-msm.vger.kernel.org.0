Return-Path: <linux-arm-msm+bounces-69889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89434B2D6CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67F11672EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1432D94B7;
	Wed, 20 Aug 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzdfKpyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB727147D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678979; cv=none; b=bc0VeImmUbQh4X647yXvGnQ2o8fBDfWSV0WzmrbUHN+cUa4GeC/OPUxFxKneqXtmI/oh35rtS/BqRnAXf9gDDVZiv32cSyE5/MDSekrcM/F0ahS3/h5Sg3Tdj8OjKuGuFNo8YaX9ySMS3HMRO6I0PGz0u+rSk9wf+/zye9Opb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678979; c=relaxed/simple;
	bh=+qSVbXUS/clmIdfv3OXHciTtkLmQKmbi6XRnW5pvU3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5L2J6MAWz+KqMGlkkDfJBmSgG5bfXJUyMtqPTyd4BqkQpJ9/53BRAtpO4heqat2ZFLvWVhq9nU3gS5wT/Q6McbFThbZ2a1APoLReydaa6/A3mUznC0OjdP+ZUgJnPa5ygtnapfZmOYwlJWrEqZGSEtnu5KsKQIVKOKmFMNtn2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IzdfKpyE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b916fda762so301216f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755678976; x=1756283776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YAr6jehsKiHEOUhuldij9V65ueaJsFRa/9UyVncK9fg=;
        b=IzdfKpyEBOYk1Vpro1pk4mjX1StKeqYl5RURFsPu+nyW2sHQWJxL3qgkOYv0PpIReh
         0wRlgtqdasHieIBPCR7jNRIiHNyRFOzHYWYqEQ6NmDJ2pTCsb9AOZFTJrRfuj3ZGJdMq
         Rjup9nZGwXhparjpCmTLce9nBm29YepRBN7nVDJlyODZUYeXNH5djPXfe18mEsBK065K
         a1J8o88MI0iCX0HbRqBtzJc8ivwwVU2915u5ujE1jCtimjfxMptgc0DOlVyYay4ElDBK
         IbffjBHoX89beIcOazhzcVma57/vuOjCqCsLyuvDvl6uDVfIn/cIB6di327gu/GaRy1g
         WX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678976; x=1756283776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAr6jehsKiHEOUhuldij9V65ueaJsFRa/9UyVncK9fg=;
        b=QRg+KZ3PBvDkOd+0wo40t4low18W8n9L+ztS8BOL/Vmsx3W77ZdwF1wthA0IcM3Rkr
         iB7iPnu2z5ygRVXrfuFS9uhLOnRgBS+cqHEhdwFgIcp4CA4LQk3tilsattft5fwwp4iq
         1lZBinsDZuNbST5yQFR8qmAMujIsdFwAm2LQxtWz8J1Q+sAZS+kdNXzku/gYLBKjj3kv
         mvCl8U0zhnSYJ5q9UnIdsua7flF2krlSRURImOOAaQByDvzquKYdnT5dBhBqPs/2tCPm
         l9Q9ww1y0Zf4XpXTSibWsLj7Iz6OYzbRwV7132ZsWhwtChlkuZoQzJiyqCGJi+/iUFRQ
         vMow==
X-Forwarded-Encrypted: i=1; AJvYcCVzKJ2IGxDXHbMUSVgKjufJQMFD9AD8ZwvOFULjXWoWrY2L4puWyZ1y/6N28qQ7oYHuWMEXUoO3yc127DQj@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcII7rnvZRWpcpJtgrlzcxNLFws5n7QmEg+Aak+OSWueSu8g6
	CTAAnnS8p4Ajv8vv3O7tALJJWEFtK/JxLR5AIgHOUBUfQKwJMBSnPdbQtjmYE0nxiHs=
X-Gm-Gg: ASbGncuBc5B9JdsO7vV0Dt3kMX5Oe5VYpocKx30x8l1HuH8js7edAmsy9SHMP0jUXVG
	hqOvHbx8RS7NtN3Y/A4wJyinTXFEmAVLn98KxMxr3rbXPGT8eVZtIRYQc5mh9U0cbz9GkIWqxZw
	7t4FvbDb2FwzHkJFR5dKoJlAiIlihgmZDgPPVrwrGGLrPU9SIvklIxoF/sGU4U/d5YGtjjWsMjV
	BUykE/Di2bzw+JUwnVwyEnmDA6MDJfyJf616CrVGd5cEGaPZ27TrumnIEIkscyu5EfiapvFHOti
	HXETvQZDIfTm+CetHUPaWSxbPHUu/uyJo5LnEWC6X1ZsFGFseqtr5Z0qX6PNRaTXDllUm5gDraI
	OnpbbeKOsgXDltsC2nzhM5UiVrHvpiTkoCJk=
X-Google-Smtp-Source: AGHT+IGi+nraIikmoF7WftFp0em6MhyjlDmSPu86zOKlpKavPilVFf76gYO+pgNSjEXMVIEPdoHeBA==
X-Received: by 2002:a05:6000:2c0d:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3c12a803871mr4177431f8f.4.1755678975484;
        Wed, 20 Aug 2025 01:36:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4976bc73sm16131425e9.6.2025.08.20.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:36:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:36:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to
 parse resource table
Message-ID: <aKWI-izL5BooL61p@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:44PM +0530, Mukesh Ojha wrote:
> Extend parse_fw callback to include SMC call to get resource
> table from TrustZone to leverage resource table parse and
> mapping and unmapping code reuse from the framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c  | 33 +++++++++++++++++++++++++++--
>  drivers/soc/qcom/mdt_loader.c       |  1 -
>  include/linux/soc/qcom/mdt_loader.h |  2 ++
>  3 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 09cada92dfd5..1e0f09bf1ef2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -408,6 +408,35 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	return pas->mem_region + offset;
>  }
>  
> +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct qcom_pas *pas = rproc->priv;
> +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> +	void *output_rt;
> +	int ret;
> +
> +	ret = qcom_register_dump_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in registering dump segments\n");
> +		return ret;
> +	}
> +
> +	if (!rproc->has_iommu)
> +		return ret;
> +
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);

In PATCH 07/11 you have support for "static" resources that can be part
of the firmware binary, but then you never make use of it. Like in the
iris patch you just give in NULL, 0 for input_rt, even though,
(presumably?) the remoteproc framework has support for parsing the
resource table from the ELF firmware image.

I would suggest adding a comment here justifying this and perhaps
something to the commit message. I do see value in having the
qcom_scm_pas_get_rsc_table() properly defined with input RT support, but
it's not obvious from the description of your patches that this is
effectively dead code right now(?).

> +	if (ret) {
> +		dev_err(pas->dev, "error %d getting resource_table\n", ret);
> +		return ret;
> +	}
> +
> +	rproc->cached_table = output_rt;
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = output_rt_size;
> +
> +	return ret;
> +}
> +
>  static unsigned long qcom_pas_panic(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -420,7 +449,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  };
> @@ -430,7 +459,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index ea7034c4b996..8456cca3f3e0 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -22,7 +22,6 @@
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  
> -#define MAX_RSCTABLE_SIZE	SZ_16K;

I'm confused why there is a semicolon here suddenly. Did you edit this
patch by hand?

Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse resource table
error: patch failed: drivers/soc/qcom/mdt_loader.c:22
error: drivers/soc/qcom/mdt_loader.c: patch does not apply

>  #define RSC_TABLE_HASH_BITS	     5  // 32 buckets
>  
>  DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 62f239f64dfb..92ad862e733e 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -8,6 +8,8 @@
>  #define QCOM_MDT_TYPE_HASH	(2 << 24)
>  #define QCOM_MDT_RELOCATABLE	BIT(27)
>  
> +#define MAX_RSCTABLE_SIZE	SZ_16K
> +
>  struct device;
>  struct firmware;
>  struct qcom_scm_pas_ctx;

You added this define yourself in PATCH 08/11, so just add it in the
right place directly. Make sure you scroll through your patch set before
sending to make sure all changes are in the right commit. :-)

Thanks,
Stephan


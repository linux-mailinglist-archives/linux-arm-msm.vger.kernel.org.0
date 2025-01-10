Return-Path: <linux-arm-msm+bounces-44724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC39A08E0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 11:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A7D188A53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40A320ADF6;
	Fri, 10 Jan 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="af8bFHwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7020B1ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504982; cv=none; b=kKvNnxDjzmGHA1ciOYzN9JbvLp1anOchaBUpatv5CzQ0t/ohr3Lj/e4iSoDJjW2N8b70VSDuAkXkOws/vaq5qM5HVkoWmCfHXBMdYHykZUCYw6zMmE7IWakiCkgvon1ipYMr9zZggtyLBYsdTdIgtK/9+JOEzULMxcL9WJR94EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504982; c=relaxed/simple;
	bh=mT7hLXo0OAyRVomNCCOY75eOUAVIlmDmdMbe5y8doQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwnjtErrXK7AG1cAkBAi6OSL5ES1kg7rZ73ncSYIQPMR0ylAhlnfK9mmiDe62rJNkoKAvbjj04boqK5KVyWQ29r5yQf8/NPMZWul0qZGWXSYjBjB3lHd2J9AmCFA5x4vq6Dt6n/ptBNGfev1YOQ+sJcwLtrSApok+qOc78Vifi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=af8bFHwU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so343069366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 02:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736504979; x=1737109779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFXbwysOSLDtoIDrz04DXm6/Zw3SDx6zPfwlh2JFNx8=;
        b=af8bFHwUXyGfmfD+Kho3wnX3TXq2rrs58CFph7XdDrjR+t+EELx0nljulcIm+oEZx5
         3OJjv9xD2mLvJDk5Yk/tRLdUrfCQmJijQ7Azd7wfy4SXJP5ecAZR4G7xxRsmV5adfCHV
         tKKugtx7Q//00d2ps7HSzl+2ncM70umvKFByCUEjQfAKGEFKw91O4W7IE+4gaEgIf/wz
         WYWB/Syn93uUey4nSno/Y6ZVUhfj6ZwnQiVtLU3bwvCTLAm9CPDiXHDg5sNPcRdm2IO7
         KbyZpu/oOxpK0IclTk6Hye39UMhEYOxtsc5SkhIvSKTm0wXY/kiuccblBB5RGkgxJgqF
         C8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504979; x=1737109779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFXbwysOSLDtoIDrz04DXm6/Zw3SDx6zPfwlh2JFNx8=;
        b=r3+MsCLNcGf26v2iSBtCWSPy5TCbqLbdnZjWsSarO3xKkb7gEW2OdqXil2hTtFsNza
         2bzU+AZNJ4sNX363DmPwfwfKME27kHY7S/GpQflPgMY5kIVaw+Ff4+Wt1ENraXqgAmWt
         IldhDHoDRuKQGdjkICsgoyUSz8N5oHuZY9ZbH7YDf7jnCteS0Xb7ATHPiosf34EGCgKA
         Q/23eH96HqN/FcJpSdps+FKflgvPhTXsO07LVTCaIy4ZGHcxthoVExmrp7x294MgBGxY
         5ccjyrWT/xAj9NhgnfxDJERDj8/TKg0Ef76+pV9iR+MYnEpllWHmIgohBQX/N4trT3NZ
         QlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPPGu1MJ6RX9gC8OYJW+T6xKINCnAHyvIBxw9ZSI547GrqvullVwJezeiVIKISvPFmrPChRhGexdVNdG7m@vger.kernel.org
X-Gm-Message-State: AOJu0YybQuUfsR2heS75l+tuDgQc4btVks4g2XKHktkOtLuTLOeadigN
	7pCwR3IGaLRMQgB23JEtEkiYTbzc5i1LRlkaXqNZq+ld35KNdY6GQTu2XarG2UY=
X-Gm-Gg: ASbGnctIMl0rC76LWoe7BGauugDAhoKlypgFtc83SsvXsra/whXqy/71EFBxzc8V/Ph
	L6hCQidN9+7ywi4fdYJPw/LKfBw5iFyLthBtNHPfkF0bQbZQjDEEhkJEMYw3kYEQvrD23PCYw8A
	YEzZLDTZTyB4IZUGhE+uTv4wxGByoFD/Z+409ah7eA+X+6u19kXpfymEE2X9u8EwFrOCM71Uswl
	Jvz4LDgdKl9yRC3fq/AnlJqY7leYMnpzV+sEaWVi+JHWZc+FSJoKewOdZlCeMyti8W+
X-Google-Smtp-Source: AGHT+IFMqpCwcqX2sHs5/lhB+pWcvO3m7YKVkr7BbL4UklMWafwFeJcgHUkq0HgfG2Fc/USROn7i9g==
X-Received: by 2002:a17:907:72cf:b0:aa6:a33c:70a7 with SMTP id a640c23a62f3a-ab2abc8ecb1mr84005266b.49.1736504979103;
        Fri, 10 Jan 2025 02:29:39 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:d2b5:f46c:e0e4:a1af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c96468afsm153806366b.170.2025.01.10.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:29:38 -0800 (PST)
Date: Fri, 10 Jan 2025 11:29:33 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: vkoul@kernel.org, robin.murphy@arm.com, u.kleine-koenig@baylibre.com,
	martin.petersen@oracle.com, fenghua.yu@intel.com,
	av2082000@gmail.com, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_mmanikan@quicinc.com, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v4] dmaengine: qcom: bam_dma: Avoid writing unavailable
 register
Message-ID: <Z4D2jQNNW94qGIlv@linaro.org>
References: <20241220094203.3510335-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220094203.3510335-1-quic_mdalam@quicinc.com>

On Fri, Dec 20, 2024 at 03:12:03PM +0530, Md Sadre Alam wrote:
> Avoid writing unavailable register in BAM-Lite mode.
> BAM_DESC_CNT_TRSHLD register is unavailable in BAM-Lite
> mode. Its only available in BAM-NDP mode. So only write
> this register for clients who is using BAM-NDP.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

What are we actually fixing here? Which platform is affected? Is there a
crash, reset, or incorrect behavior?

We have had this code for years without reported issues, with both
BAM-NDP and BAM-Lite instances. The register documentation on APQ8016E
documents the BAM_DESC_CNT_TRSHLD register even for the BAM-Lite
instance. There is a comment that it doesn't apply to BAM-Lite, but I
would expect the written value just ends up being ignored in that case.

Also, there is not just BAM-NDP and BAM-Lite, but also plain "BAM". What
about that one? Should we write to BAM_DESC_CNT_TRSHLD?

> ---
> Change in [v4]
> 
> * Added in_range() macro
> 
> Change in [v3]
> 
> * Removed BAM_LITE macro
> 
> * Updated commit message
> 
> * Adjusted if condition check
> 
> * Renamed BAM-NDP macro to BAM_NDP_REVISION_START and
>    BAM_NDP_REVISION_END
> 
> Change in [v2]
> 
> * Replace 0xff with REVISION_MASK in the statement
>    bdev->bam_revision = val & REVISION_MASK
> 
> Change in [v1]
> 
> * Added initial patch
> 
>  drivers/dma/qcom/bam_dma.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index bbc3276992bb..c14557efd577 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -59,6 +59,9 @@ struct bam_desc_hw {
>  #define DESC_FLAG_NWD BIT(12)
>  #define DESC_FLAG_CMD BIT(11)
>  
> +#define BAM_NDP_REVISION_START	0x20
> +#define BAM_NDP_REVISION_END	0x27
> +

Are you sure this covers all SoCs we support upstream? If one of the
older or newer supported SoCs uses a value outside of this range, it
will now be missing the register write.

Thanks,
Stephan


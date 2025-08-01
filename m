Return-Path: <linux-arm-msm+bounces-67403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D058BB18506
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E7C16F301
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4B92749F2;
	Fri,  1 Aug 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6GskBDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0C2741D5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062393; cv=none; b=RvG9BH6Lb49bh/QcSYsftxhlT6Ba8y2L0iOWzEnY1eHpEl0pX2XHbBO/6gl7E6+8G3p+m36JJaUjT3bMIsF0GFkrus+VFSXeBV6QRqT54q2nS4APyk3suyEq3SRq/+gJ1c7xUjX27FmDA0dfFRFIDrPQYg4RgjHI63IP+xwdgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062393; c=relaxed/simple;
	bh=G8XzIPRtm4xk5lge123mz0p0xgKBk3goA4ZlLuaJzb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxG2UTAE4msohqeT0jSYpD88nmH+IVUbscxsGEdIcib0HYKx9eHvzqnJCQpfEI48ykFKiQHAUoemV/jt8eOX2JxXWVGA3+PGqRyFkbr/9m3jgA8FcKwTOqPnoujdfb+OJ1rJF5tu43TH3BCZxtuejAKuhgBCeYeg/IcgH7b6x/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6GskBDL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b783ea502eso1663259f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754062389; x=1754667189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMuhTiNgWdKprDSY7tl08r3yTLD5z9VbtaB9UQkibdQ=;
        b=e6GskBDLWvI5xgp6IaOORg6iAFkwfJENMf8NQF6p3+G21pz+LDmuf0nIgUmD+9x4PY
         sdRkmzzCnjyaLdsy98YzIdDN3gC39yXwdVyZlussTug7JGg/ugP1lwyX5ZAKSnJ6km0X
         3KNgRMVPoOozd3ORBWQVYV+5qYCnKmUH0KRuii3wH+mNmguUe8KPfzk8PpvrpUn+V8vE
         MoeCYQmr7NTeY9lazQ0WauhwgwmPi3mNvMTELfow+3+5QM7cOEjHnvTmNz5aBni/no0m
         gLAUMBJxqr6XAHmYsH9MH/LIbaek8F0HijKEcGcBkOQPfVbvDH24U4odqozY2nJGFkMb
         dZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754062389; x=1754667189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMuhTiNgWdKprDSY7tl08r3yTLD5z9VbtaB9UQkibdQ=;
        b=tV0ZvmzWrrSoXJ5AHhhDJyXtQvgOoHilpLKRhTwV7ocwJWxgHskleWPT/Kvtipia56
         mshtNau1HcZuRVFK3vpkUKQLtK9Xet/szpXebb+KTa8IigROAYsxTw4tQOPbPBfGmYtb
         rne5fPK1yMF/zKBh+SrzePiqgnnf8Up2UsgxJJRz/haHRn+Q20wZYUs7qUE0UdgSIQxK
         up9Xrj1FkpTSL7KjTGVbQiSbEsQTWtHOouoSQ1KQxMoYZ+Ekl67NZL8swSgIHO9EPqje
         CGE9MkAPez7sQ6RU4rWobfMXkwrA9JIAmyh1ZRyBIJJVXBktPULm3kqXgdk1ohuw3x5d
         uYRw==
X-Forwarded-Encrypted: i=1; AJvYcCWA5wmnu1lO+ejepoyCiPA4A1TzmWI9oyQCQrKhOspd/cPbWjx6sRs96Os1T4d2YK/++PNZySHabDcz2iHo@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWefM741w12I+XKITgvYZCNAlaRtk8s/cpPgcGDOQTN5Thfxj
	oIxnj/7Bl+2PFG5PssyHWmi1L6yNCX77+5Ov3zDeDa/pO3o68oHg10aGTvHxs/Jz82Q=
X-Gm-Gg: ASbGnctxsqlLiR+wRyZZgcORdiv8v1ffLxbjKFCI7HLKoqBUacVebglauI/8Hae0H5s
	medzXq6xAO6Xa08lkAeScgr00Lki+IxZZA02zpn7j4w1+MQhG2J0TKOBAGWREnPIkJ10CQY17Xl
	lMhsTsEwcnk931TUgAvVGJIxapYLM8p4ggLX+1YiLFnaAR2l1G0LEClN5q/pzVTFrsXz2i+eh44
	avfqZKpBafxU6Qp7ppJDLP/NxH/B5jhBRtmfpJVoa71K0RznJI9Mt630OxAx7RU5CcYoO0GWLc5
	Nsln2QAtn6a7lE4sxppT/rQoXuDxdxPpfCqBsnK9CjQ4Jxax+4NavAZqqUcmDyepXLaR+FHADBN
	T+fqZ5SBCXEXRBnEl2FKwJJuAGY0=
X-Google-Smtp-Source: AGHT+IF9pkrPJ7jZbeEE0PxlWTyARsA424FL3piKfJ4GOT1hGtsLhG5zjtxmcgLX2NPTV/vFIv7f9w==
X-Received: by 2002:a05:6000:2c0b:b0:3b7:9703:d98b with SMTP id ffacd0b85a97d-3b8d95aaff0mr48794f8f.28.1754062388815;
        Fri, 01 Aug 2025 08:33:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4696c8sm6121767f8f.55.2025.08.01.08.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:33:08 -0700 (PDT)
Date: Fri, 1 Aug 2025 18:33:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>, kernel-janitors@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] scsi: ufs: qcom: Drop dead compile guard
Message-ID: <d7093377-a34e-4488-97c6-3d2ffcd13620@suswa.mountain>
References: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-topic-ufs_compile_check-v1-1-5ba9e99dbd52@oss.qualcomm.com>

This patch removes some dead ifdeffed code because the KConfig has a
select which ensures that CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is set.
Konrad was wondering if there are any tools to detect this sort of
thing.  I don't think so.  I think the only thing we detect are
non-existant configs.  But let me add a few more people to the CC who
might know.

regards,
dan carpenter

On Thu, Jul 24, 2025 at 02:23:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SCSI_UFSHCD already selects DEVFREQ_GOV_SIMPLE_ONDEMAND, drop the
> check.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Is this something that could be discovered by our existing static
> checkers?
> ---
>  drivers/ufs/host/ufs-qcom.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 4bbe4de1679b908c85e6a3d4035fc9dcafcc0d1a..76fc70503a62eb2e747b2d4cd18cc05b6f5526c7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1898,7 +1898,6 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> -#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
>  static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *p,
>  					struct devfreq_simple_ondemand_data *d)
> @@ -1910,13 +1909,6 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  
>  	hba->clk_scaling.suspend_on_no_request = true;
>  }
> -#else
> -static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
> -		struct devfreq_dev_profile *p,
> -		struct devfreq_simple_ondemand_data *data)
> -{
> -}
> -#endif
>  
>  /* Resources */
>  static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> 
> ---
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> change-id: 20250724-topic-ufs_compile_check-3378996f4221
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


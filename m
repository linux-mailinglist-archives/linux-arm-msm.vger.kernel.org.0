Return-Path: <linux-arm-msm+bounces-79703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFFC20F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE86400AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA688235053;
	Thu, 30 Oct 2025 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vf0kFFrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF8226CF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838364; cv=none; b=aHzSFUgrvzftvWEYuZuTmIXyPYLDnxqguOHuteWyK5ViVCXjaWQZVNODhkKc4eJD5q9GuvdgT6fMe47aOB2EK8F97a9IqmmaLAsJAnsdsE2mjzzq+Xl0QOkq+Yd/pFG3PWyo+tp1RAa4cV7sN12KGT92GTXejIqxh+JARoIsIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838364; c=relaxed/simple;
	bh=7+179jkXBWf7iUMeoVmkYzlaHBEPAcDQsLny+3UjYeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJiiAIWW1uAQhm2DaVEa3VOVgoL8+wNG5j2jdKTdUrCL5V2KcvYx8Ba48jDhfCd03JM3c0BKruNR/6JTkM9sDZluB99i094Z7KPEvHcAQ/ko0Gh6ZgspuufRtAbIZiff7kfqACOCZyeHZ9Qf1bfrvJtIRby2MuqyoV5m65iIWLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vf0kFFrM; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-89e93741839so70786085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761838361; x=1762443161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=90sKvhv/LxlQSSqjQG+hqX7h6vW6w7D0vD2lEF/vA1s=;
        b=vf0kFFrMrpdF1xYyJ/jcOBzdPK2O80oecV8C30WBfcp/SGyFNZUNfhR2dX82+7MB95
         qkKCEotEQ7D24fuaF/pKZyv5Ix05UbafkmbZjF1l03GJWZEQzbZp+k8WziOmA2spFOHs
         qJ/LVotf2PxcOGSQf/wwZGgbxF1a0DE5+TXw4qqG/5BVurVlx5su4T90tHSbo9RdKJ2s
         jKJsh7iCoN1+/QpUDrcGRvQOyB9d+V+U9P2U5XDGL/u79PFgyEcabQW1FRxDODTNNAcI
         4TepyMvJjgVFDqto3/NTUAoJDfxpmxC3I/muFwOopBp2hqy8MSlC7s3WsE/09obr2xXJ
         f6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838361; x=1762443161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90sKvhv/LxlQSSqjQG+hqX7h6vW6w7D0vD2lEF/vA1s=;
        b=aGVOm0p9tLeU6D4zzc65VlPGC5jW6xDAF3Dbbub1XzJ8p2sM4v4g/4ZcXalW4kbvYJ
         tEgnCZ5Zw06cOZvLvmbVPom+VROrMEx0/Bnx11gVqqBVJedhl1TSVCnN7ny+oNmpR8Zl
         1XknO3JK6SsJxozWSDvEQ1u51xPc6H3skiwYn3EpkvpvZjsBeC1p2jKtzXvY+GcXXV3v
         2AI/PcFPuYu98fcMxEHuYsNCuy/5QG79yNJSJ7G1uy8IUTYhWNhrzrhKvJLgqx3a0zvl
         +YHqz8060ueCeEE1WHC0sMC2a7HGkU63jEorOQ79insYn47mixplAbEMr9HbBjBU0wvO
         wDyw==
X-Forwarded-Encrypted: i=1; AJvYcCWGCGCrynG+MKB66lffpdn49+uBtpWNiuZ4rXzLc7ay+H0yjrthIVKttr/5DpKA33pklD1lek9aBE0wR+A/@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrjD+6XsnEt9FfST91CeKyosYxA2AQeXyH1wrm/PvDkazLkkU
	on1DkN6WhyUns9pFgOWR5ctf5dcdVVoivNoWb+iWTCtskKycFaa9DqHVcDF2fF0pav+V8EIH+v4
	UqZOaIgmDV7XbuBN5suqXIi5bPeYDpchPfDNWBrrbTDT0f7Dpep4X
X-Gm-Gg: ASbGncsz7sQf4GwPf5e6MJPh+OZgtSyldCg+r2EWERG09zjURsYonn75Klj6Fn9LJsd
	JGNaQFZd2y2SRx0A4wdDnUJunRZluXBBRGRRpOhnTceLHVP/av6zJKnJ1ZH8Yy0DdTOYAHRm8Cu
	su1HZIKmLOUOvQlZ9VxdMzXT87wXj/HBKYc+ZzUXTajDfm3GwMrLiV8ZHRDq6zCvrTxrDXOHjsh
	bMCrwsJmDh9T/lBJM1VNs9A8kuJOTPX8v0M3sihknYANpM8lpp9RNznnaAtMEjsXa7UrQFwhzFP
	HLQ263rRCqxfhOvYnw==
X-Google-Smtp-Source: AGHT+IEgV93wREdWunbf+FF7vUk4F3W5QN6rnxf/b5n6hCHXmBsC+r6T1L85oyN8vW3LF2cyQS3Ard/bFxRE2AGXrLE=
X-Received: by 2002:a05:620a:2913:b0:892:7dd2:9f0f with SMTP id
 af79cd13be357-8aa2c563761mr433075985a.19.1761838360928; Thu, 30 Oct 2025
 08:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com> <20251020-extended_cti-v5-1-6f193da2d467@oss.qualcomm.com>
In-Reply-To: <20251020-extended_cti-v5-1-6f193da2d467@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 30 Oct 2025 15:32:30 +0000
X-Gm-Features: AWmQ_bmTZo8Ep2bfi7zMuaSG2pUo8tJvBDHBZCZJODqdh48KYMuAfDMpUBYETyw
Message-ID: <CAJ9a7VjLmCQ1WKu_FitcPhxksWe+v8gKoZBk20hYQZ_s42Da-w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 20 Oct 2025 at 08:12, Yingchao Deng
<yingchao.deng@oss.qualcomm.com> wrote:
>
> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
> structure with dynamically allocated bitmaps and arrays. This allows
> memory to be allocated based on the actual number of triggers during probe
> time, reducing memory footprint and improving scalability for platforms
> with varying trigger counts.
> Additionally, repack struct cti_config to reduce its size from 80 bytes to
> 72 bytes.
>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 58 ++++++++++++++++------
>  .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 10 ++--
>  drivers/hwtracing/coresight/coresight-cti.h        | 17 ++++---
>  4 files changed, 65 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 8fb30dd73fd2..8c9cec832898 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -214,8 +214,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>  /* DEVID[19:16] - number of CTM channels */
>  #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>
> -static void cti_set_default_config(struct device *dev,
> -                                  struct cti_drvdata *drvdata)
> +static int cti_set_default_config(struct device *dev,
> +                                 struct cti_drvdata *drvdata)
>  {
>         struct cti_config *config = &drvdata->config;
>         u32 devid;
> @@ -234,12 +234,33 @@ static void cti_set_default_config(struct device *dev,
>                 config->nr_trig_max = CTIINOUTEN_MAX;
>         }
>
> +       config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_in_use)
> +               return -ENOMEM;
> +
> +       config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_out_use)
> +               return -ENOMEM;
> +
> +       config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +       if (!config->trig_out_filter)
> +               return -ENOMEM;
> +
> +       config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +       if (!config->ctiinen)
> +               return -ENOMEM;
> +
> +       config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +       if (!config->ctiouten)
> +               return -ENOMEM;
> +
>         config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>
>         /* Most regs default to 0 as zalloc'ed except...*/
>         config->trig_filter_enable = true;
>         config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
>         config->enable_req_count = 0;
> +       return 0;
>  }
>
>  /*
> @@ -270,8 +291,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>         cti_dev->nr_trig_con++;
>
>         /* add connection usage bit info to overall info */
> -       drvdata->config.trig_in_use |= tc->con_in->used_mask;
> -       drvdata->config.trig_out_use |= tc->con_out->used_mask;
> +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
> +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
> +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
>
>         return 0;
>  }
> @@ -293,12 +316,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>         if (!in)
>                 return NULL;
>
> +       in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
> +       if (!in->used_mask)
> +               return NULL;
> +
>         out = devm_kzalloc(dev,
>                            offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>                            GFP_KERNEL);
>         if (!out)
>                 return NULL;
>
> +       out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
> +       if (!out->used_mask)
> +               return NULL;
> +
>         tc->con_in = in;
>         tc->con_out = out;
>         tc->con_in->nr_sigs = in_sigs;
> @@ -314,7 +345,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>  {
>         int ret = 0;
>         int n_trigs = drvdata->config.nr_trig_max;
> -       u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>         struct cti_trig_con *tc = NULL;
>
>         /*
> @@ -325,8 +355,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>         if (!tc)
>                 return -ENOMEM;
>
> -       tc->con_in->used_mask = n_trig_mask;
> -       tc->con_out->used_mask = n_trig_mask;
> +       bitmap_fill(tc->con_in->used_mask, n_trigs);
> +       bitmap_fill(tc->con_out->used_mask, n_trigs);
> +
>         ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>         return ret;
>  }
> @@ -339,7 +370,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>  {
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *config = &drvdata->config;
> -       u32 trig_bitmask;
>         u32 chan_bitmask;
>         u32 reg_value;
>         int reg_offset;
> @@ -349,18 +379,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>            (trigger_idx >= config->nr_trig_max))
>                 return -EINVAL;
>
> -       trig_bitmask = BIT(trigger_idx);
> -
>         /* ensure registered triggers and not out filtered */
>         if (direction == CTI_TRIG_IN)   {
> -               if (!(trig_bitmask & config->trig_in_use))
> +               if (!(test_bit(trigger_idx, config->trig_in_use)))
>                         return -EINVAL;
>         } else {
> -               if (!(trig_bitmask & config->trig_out_use))
> +               if (!(test_bit(trigger_idx, config->trig_out_use)))
>                         return -EINVAL;
>
>                 if ((config->trig_filter_enable) &&
> -                   (config->trig_out_filter & trig_bitmask))
> +                   test_bit(trigger_idx, config->trig_out_filter))
>                         return -EINVAL;
>         }
>
> @@ -891,7 +919,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>         raw_spin_lock_init(&drvdata->spinlock);
>
>         /* initialise CTI driver config values */
> -       cti_set_default_config(dev, drvdata);
> +       ret = cti_set_default_config(dev, drvdata);
> +       if (ret)
> +               return ret;
>
>         pdata = coresight_cti_get_platform_data(dev);
>         if (IS_ERR(pdata)) {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..4bef860a0484 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>                 goto create_v8_etm_out;
>
>         /* build connection data */
> -       tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> -       tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>
>         /*
>          * The EXTOUT type signals from the ETM are connected to a set of input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>                 goto of_create_v8_out;
>
>         /* Set the v8 PE CTI connection data */
> -       tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>         tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>         tc->con_in->sig_types[1] = PE_PMUIRQ;
> -       tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>         tc->con_out->sig_types[0] = PE_EDBGREQ;
>         tc->con_out->sig_types[1] = PE_DBGRESTART;
>         tc->con_out->sig_types[2] = PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>                 goto of_create_v8_out;
>
>         /* filter pe_edbgreq - PE trigout sig <0> */
> -       drvdata->config.trig_out_filter |= 0x1;
> +       set_bit(0, drvdata->config.trig_out_filter);
>
>  of_create_v8_out:
>         return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>         if (!err) {
>                 /* set the signal usage mask */
>                 for (idx = 0; idx < tgrp->nr_sigs; idx++)
> -                       tgrp->used_mask |= BIT(values[idx]);
> +                       set_bit(values[idx], tgrp->used_mask);
>         }
>
>         kfree(values);
> @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>
>         err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>         if (!err)
> -               drvdata->config.trig_out_filter |= tg->used_mask;
> +               bitmap_or(drvdata->config.trig_out_filter,
> +                         drvdata->config.trig_out_filter,
> +                         tg->used_mask, drvdata->config.nr_trig_max);
>
>         kfree(tg);
>         return err;
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..a9df77215141 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -711,10 +711,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
>         int size = 0, nr_trig_max = cfg->nr_trig_max;
> -       unsigned long mask = cfg->trig_out_filter;
>
> -       if (mask)
> -               size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
> +       size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
>         return size;
>  }
>  static DEVICE_ATTR_RO(trigout_filtered);
> @@ -926,9 +924,8 @@ static ssize_t trigin_sig_show(struct device *dev,
>         struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
> -       unsigned long mask = con->con_in->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
>  }
>
>  static ssize_t trigout_sig_show(struct device *dev,
> @@ -940,9 +937,8 @@ static ssize_t trigout_sig_show(struct device *dev,
>         struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>         struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         struct cti_config *cfg = &drvdata->config;
> -       unsigned long mask = con->con_out->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
>  }
>
>  /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 8362a47c939c..0bd71407ef34 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -68,7 +68,7 @@ struct fwnode_handle;
>   */
>  struct cti_trig_grp {
>         int nr_sigs;
> -       u32 used_mask;
> +       unsigned long *used_mask;
>         int sig_types[];
>  };
>
> @@ -146,20 +146,21 @@ struct cti_config {
>         bool hw_enabled;
>         bool hw_powered;
>
> -       /* registered triggers and filtering */
> -       u32 trig_in_use;
> -       u32 trig_out_use;
> -       u32 trig_out_filter;
>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
>         /* cti cross trig programmable regs */
> -       u32 ctiappset;
>         u8 ctiinout_sel;
> -       u32 ctiinen[CTIINOUTEN_MAX];
> -       u32 ctiouten[CTIINOUTEN_MAX];
> +       u32 ctiappset;
>         u32 ctigate;
>         u32 asicctl;
> +       u32 *ctiinen;
> +       u32 *ctiouten;
> +
> +       /* registered triggers and filtering */
> +       unsigned long *trig_in_use;
> +       unsigned long *trig_out_use;
> +       unsigned long *trig_out_filter;
>  };
>
>  /**
>
> --
> 2.43.0
>
This all looks good to me. Thanks

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


Return-Path: <linux-arm-msm+bounces-76813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9573ABCE567
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 21:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4281892400
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959D117A2EB;
	Fri, 10 Oct 2025 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+loCch+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE63F14286
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760123748; cv=none; b=Ced2sARiLyUJ1EZWW+Dab/xqn8ChuwAw/8StrtG9Y9zszBwYMDZvt/zFSEePF94FT9QoY1hAkn2W35uvUQD6Z3h922hSovCG67krBk56YRNjWCGtoIAT8gXN73q2TrUTQa1E2GRXi1GWm7suovZS+koxq9loiHCNAMZD7rYPKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760123748; c=relaxed/simple;
	bh=AU/qmCD5cC0KzetwkleNy4is6FLJyH2dU5vCeaeoZ3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGNzSEwy65L+IVTq9t4XpZUYo4wEjV8Hhhj+qZozlxalv9RDsublmRQbUoMEXZmJQNtjaN4En3locnrqKvqHmq58bM3xytWSu79EI/f4xcXUFXSHEpr4AKYPSWqU9YRGyBVFn+EwRPw7igVKsOfeRJqdZUUOk4LQtAcOLINLZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+loCch+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7811a02316bso1755087b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760123745; x=1760728545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtN1y6JJGKlHWKJcpFerhBy9qVQHVPsQ4FDCBS/S6hw=;
        b=d+loCch+fX/GRp5ri27orZuEI6DzNYNqscuLCUEW+XhCYQ2LSb8FeKJV3ZdSRs4BAN
         4kOz6SRbDhPY9GsLA6np7uJYMY366oAyTt3JJ1G1kA5yFmQdZj1n/GMvXBUPHxNz6+1A
         QddRZ7FuA+5bqzg+u5LC8kAngpH3pn1VWj501tRAgePFPeNG2wTSJksm7UOzWikOJeKa
         2CdsASwLCt+GMaQPV3FMksbIVtjLx2G/4fEGARIEgQCEoRZ5f3k0ZBEh8IfeMka934rd
         3YlgASBmVhEaa4QsVQxpN/+/rPN91gpYFbxQZcw+GWIcWSCjcBfLKLZLpzRsQA4IFLZ4
         suwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760123745; x=1760728545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtN1y6JJGKlHWKJcpFerhBy9qVQHVPsQ4FDCBS/S6hw=;
        b=rqAqTYl3ck2K9B5/JfIEgVcst21fLmFrA5GyjLH3jELjptYDPVm/l07N57G96ZkfnO
         6+XjWHOlNmokrclNRGQCKeTi686YTOwcmzZAIfGiFaDmQl6AniKp5MscrUQDN54yEbIx
         p4Uzy9n3vL7Wo4ai2WQ9sB+N6LivbmOB84RQ3d2udlZuA/b5cnHy14quacM78g18wBV1
         9yf5NpscvFKpzxWCNxMT+ZANvcHIk73Sg4d+R0xHT4vv1Bmh9uf1k+FGR9obCka0I1Bc
         yTz23CAjtxjTAFrl5OAjGFcuYPvhS4WVZo178vy/vrH3PnNaGNelrh6266KXlOYcmgEH
         I52A==
X-Forwarded-Encrypted: i=1; AJvYcCXf/Db2RlFuy2zcIQjYNGpZXs1jNzaV7tZ0uKXV56l9GKg8yaPDkq3OT1jzRE8eOR1VwQEMNda1/FRkNkQg@vger.kernel.org
X-Gm-Message-State: AOJu0YzzLlRucK8V3FfIIQR01+zweRH4h7lflYq5fRx73eyd2UUu1kOE
	QruRo3uagKGgp3J6P/gQP0jjVDr1e0HcxuO3T0O9d+f/6N8k8VYbVIJBHRGhUE8XDpZjmvgJ6ke
	gfdsDbN6kIEwGAKca1zSYMx1xpjWgbrJ7LexbEDjklA==
X-Gm-Gg: ASbGncs7Di4ObAOXvhOICJ18s9KVGebLiV/cUlajOiHdiN2XSNXk9n9BqMebde0DwG+
	EATA6JOZ53S20uI7qpwGCRyweBNojXzo6WyLPKrh+xmgfqy4dwuL6QPzGbRfK5cHhcUyCmyqytl
	RyRTexuIErJbutwsOxzy/kjY3AQdgEJL42o2Ti4o6qNnQYl08LzCf5LV8SE3DuDtvT6IYhi4670
	lci3gHbza6TaKcmbox5B/MOpudDWrfB4+Bt999dIMebd5hq4Q04kDwLgZZzCA==
X-Google-Smtp-Source: AGHT+IHHJgUb6FDE5gS+hjQFvGykwiURMCECSUjVpFfJN34GtWPLx3GG5n37RruLNr54EPP4kxJF+Wify4n2Z6VSoIU=
X-Received: by 2002:a05:6a00:2e96:b0:781:d163:ce41 with SMTP id
 d2e1a72fcca58-79385ce7bfcmr14107650b3a.11.1760123744520; Fri, 10 Oct 2025
 12:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com>
In-Reply-To: <20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 10 Oct 2025 20:15:33 +0100
X-Gm-Features: AS18NWA8oKLm9PywZBxngEJDgUxH2IqIfHV9ZQP6Ful5wbuFQ1SKO8ocmuNorFE
Message-ID: <CAJ9a7VhX=EcuJBuDkC==rJv+JaUjsXZZTZ1v_Bx_8TRe8XCtPw@mail.gmail.com>
Subject: Re: [PATCH v4] coresight: cti: Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, quic_yingdeng@quicinc.com, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This patchset is looking a lot better now. I do have a couple of comments

1) Using the bitmaps etc is good, but this is increasing the memory
footpint of all CTI data instances by 4x. Only the qualcomm 128 signal
CTIs need that space - and there are many systems with 10s of standard
CTIs

 I think it would be better to dynamically allocate the register and
bitmap memory to the actual number of registers in the CTI instance -
reducing the memory footprint for all CTI implementations.
This should be from the config.nr_trig_max which is set from DEVID
register and represents the actual number of triggers.
Thus the register arrays in cti_config, ctiinen and ctiouten, plus the
bitmapped fields can be allocated in the cti_set_default_config()
function.

I suggest that the dynamic allocation changes form the first patch in
this series, with the QCOM extended changes as the second patch.

2)  The issue with the claim tags is do to a bug in the core claim tag
code. It does not check the number of claim tags implemented - which
can be 0 as in your design.
I am fixing the core code to address this issue and will post a patch
shortly. This will mean that claim will "succeed" where there are no
cliam tags in use.

See the rest of my comments inline.


On Tue, 2 Sept 2025 at 03:57, Yingchao Deng
<yingchao.deng@oss.qualcomm.com> wrote:
>
> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=99s=
 CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs. Qualcomm CTI
> implementation differs from the standard CTI in the following aspects:
>
> 1. The number of supported triggers is extended to 128.
> 2. Several register offsets differ from the CoreSight specification.
> 3. CLAIMSET and CLAIMCLR registers are unused.
>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=99s=
 CSCTI.
> It allows a debugger to send to trigger events to a processor or to send
> a trigger event to one or more processors when a trigger event occurs on
> another processor on the same SoC, or even between SoCs.
>
> QCOM extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
>
> The commands to configure CTI triggers are the same as ARM's CTI.
>
> Changes in v4:
> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> coresight_cti_reg_store() functions accordingly.
> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294=
-1-quic_jinlmao@quicinc.com/
>
> Changes in v3:
> 1. Rename is_extended_cti() to of_is_extended_cti().
> 2. Add the missing 'i' when write the CTI trigger registers.
> 3. Convert the multi-line output in sysfs to single line.
> 4. Initialize offset arrays using designated initializer.
> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_ji=
nlmao@quicinc.com/
>
> Changes in V2:
> 1. Add enum for compatible items.
> 2. Move offset arrays to coresight-cti-core
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 123 +++++++++++---
>  .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 +++++++++++++++=
------
>  drivers/hwtracing/coresight/coresight-cti.h        |  22 ++-
>  drivers/hwtracing/coresight/qcom-cti.h             |  60 +++++++
>  5 files changed, 320 insertions(+), 85 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/h=
wtracing/coresight/coresight-cti-core.c
> index 8fb30dd73fd20ae613a45b1a467f457a046a9412..2431bc1d5ef39767d415b0df5=
a04da888a3104e5 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -22,6 +22,54 @@
>  #include "coresight-priv.h"
>  #include "coresight-cti.h"

#include "qcom-cti.h" here rather than in coresight-cti.h

> +static const u32 cti_normal_offset[] =3D {
> +       [INDEX_CTIINTACK]               =3D CTIINTACK,
> +       [INDEX_CTIAPPSET]               =3D CTIAPPSET,
> +       [INDEX_CTIAPPCLEAR]             =3D CTIAPPCLEAR,
> +       [INDEX_CTIAPPPULSE]             =3D CTIAPPPULSE,
> +       [INDEX_CTIINEN]                 =3D CTIINEN(0),
> +       [INDEX_CTIOUTEN]                =3D CTIOUTEN(0),
> +       [INDEX_CTITRIGINSTATUS]         =3D CTITRIGINSTATUS,
> +       [INDEX_CTITRIGOUTSTATUS]        =3D CTITRIGOUTSTATUS,
> +       [INDEX_CTICHINSTATUS]           =3D CTICHINSTATUS,
> +       [INDEX_CTICHOUTSTATUS]          =3D CTICHOUTSTATUS,
> +       [INDEX_CTIGATE]                 =3D CTIGATE,
> +       [INDEX_ASICCTL]                 =3D ASICCTL,
> +       [INDEX_ITCHINACK]               =3D ITCHINACK,
> +       [INDEX_ITTRIGINACK]             =3D ITTRIGINACK,
> +       [INDEX_ITCHOUT]                 =3D ITCHOUT,
> +       [INDEX_ITTRIGOUT]               =3D ITTRIGOUT,
> +       [INDEX_ITCHOUTACK]              =3D ITCHOUTACK,
> +       [INDEX_ITTRIGOUTACK]            =3D ITTRIGOUTACK,
> +       [INDEX_ITCHIN]                  =3D ITCHIN,
> +       [INDEX_ITTRIGIN]                =3D ITTRIGIN,
> +       [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> +};
> +
> +static const u32 cti_extended_offset[] =3D {
> +       [INDEX_CTIINTACK]               =3D QCOM_CTIINTACK,
> +       [INDEX_CTIAPPSET]               =3D QCOM_CTIAPPSET,
> +       [INDEX_CTIAPPCLEAR]             =3D QCOM_CTIAPPCLEAR,
> +       [INDEX_CTIAPPPULSE]             =3D QCOM_CTIAPPPULSE,
> +       [INDEX_CTIINEN]                 =3D QCOM_CTIINEN,
> +       [INDEX_CTIOUTEN]                =3D QCOM_CTIOUTEN,
> +       [INDEX_CTITRIGINSTATUS]         =3D QCOM_CTITRIGINSTATUS,
> +       [INDEX_CTITRIGOUTSTATUS]        =3D QCOM_CTITRIGOUTSTATUS,
> +       [INDEX_CTICHINSTATUS]           =3D QCOM_CTICHINSTATUS,
> +       [INDEX_CTICHOUTSTATUS]          =3D QCOM_CTICHOUTSTATUS,
> +       [INDEX_CTIGATE]                 =3D QCOM_CTIGATE,
> +       [INDEX_ASICCTL]                 =3D QCOM_ASICCTL,
> +       [INDEX_ITCHINACK]               =3D QCOM_ITCHINACK,
> +       [INDEX_ITTRIGINACK]             =3D QCOM_ITTRIGINACK,
> +       [INDEX_ITCHOUT]                 =3D QCOM_ITCHOUT,
> +       [INDEX_ITTRIGOUT]               =3D QCOM_ITTRIGOUT,
> +       [INDEX_ITCHOUTACK]              =3D QCOM_ITCHOUTACK,
> +       [INDEX_ITTRIGOUTACK]            =3D QCOM_ITTRIGOUTACK,
> +       [INDEX_ITCHIN]                  =3D QCOM_ITCHIN,
> +       [INDEX_ITTRIGIN]                =3D QCOM_ITTRIGIN,
> +       [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> +};
> +
>  /*
>   * CTI devices can be associated with a PE, or be connected to CoreSight
>   * hardware. We have a list of all CTIs irrespective of CPU bound or
> @@ -70,15 +118,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvda=
ta)
>
>         /* write the CTI trigger registers */
>         for (i =3D 0; i < config->nr_trig_max; i++) {
> -               writel_relaxed(config->ctiinen[i], drvdata->base + CTIINE=
N(i));
> +               writel_relaxed(config->ctiinen[i],
> +                              drvdata->base + cti_offset(drvdata, INDEX_=
CTIINEN, i));
>                 writel_relaxed(config->ctiouten[i],
> -                              drvdata->base + CTIOUTEN(i));
> +                              drvdata->base + cti_offset(drvdata, INDEX_=
CTIOUTEN, i));
>         }
>
>         /* other regs */
> -       writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> -       writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -       writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +       writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdat=
a, INDEX_CTIGATE, 0));
> +       writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdat=
a, INDEX_ASICCTL, 0));
> +       writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvd=
ata, INDEX_CTIAPPSET, 0));
>
>         /* re-enable CTI */
>         writel_relaxed(1, drvdata->base + CTICONTROL);
> @@ -99,10 +148,16 @@ static int cti_enable_hw(struct cti_drvdata *drvdata=
)
>         if (config->hw_enabled || !config->hw_powered)
>                 goto cti_state_unchanged;
>
> -       /* claim the device */
> -       rc =3D coresight_claim_device(drvdata->csdev);
> -       if (rc)
> -               goto cti_err_not_enabled;

As mentioned above this change will not be needed once the claimtag
code is fixed.

> +       /* For QCOM CTI, CLAIMCLR and CLAIMSET registers do not follow th=
e
> +        * CoreSight CLAIM tag protocol, there is no relationship between
> +        * the CLR and SET pair, it's  unused for debug resource arbitrat=
ion.
> +        */
> +       if (drvdata->subtype =3D=3D ARM_STD_CTI) {
> +               /* claim the device */
> +               rc =3D coresight_claim_device(drvdata->csdev);
> +               if (rc)
> +                       goto cti_err_not_enabled;
> +       }
>
>         cti_write_all_hw_regs(drvdata);
>
> @@ -175,7 +230,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata=
)
>         writel_relaxed(0, drvdata->base + CTICONTROL);
>         config->hw_enabled =3D false;
>
> -       coresight_disclaim_device_unlocked(csdev);
> +       if (drvdata->subtype =3D=3D ARM_STD_CTI)
> +               coresight_disclaim_device_unlocked(csdev);
>         CS_LOCK(drvdata->base);
>         raw_spin_unlock(&drvdata->spinlock);
>         return ret;
> @@ -214,6 +270,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>  /* DEVID[19:16] - number of CTM channels */
>  #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19)=
)
>
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, =
31))
> +
>  static void cti_set_default_config(struct device *dev,
>                                    struct cti_drvdata *drvdata)
>  {
> @@ -270,8 +329,10 @@ int cti_add_connection_entry(struct device *dev, str=
uct cti_drvdata *drvdata,
>         cti_dev->nr_trig_con++;
>
>         /* add connection usage bit info to overall info */
> -       drvdata->config.trig_in_use |=3D tc->con_in->used_mask;
> -       drvdata->config.trig_out_use |=3D tc->con_out->used_mask;
> +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_us=
e,
> +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_=
use,
> +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
>
>         return 0;
>  }
> @@ -314,7 +375,6 @@ int cti_add_default_connection(struct device *dev, st=
ruct cti_drvdata *drvdata)
>  {
>         int ret =3D 0;
>         int n_trigs =3D drvdata->config.nr_trig_max;
> -       u32 n_trig_mask =3D GENMASK(n_trigs - 1, 0);
>         struct cti_trig_con *tc =3D NULL;
>
>         /*
> @@ -325,8 +385,9 @@ int cti_add_default_connection(struct device *dev, st=
ruct cti_drvdata *drvdata)
>         if (!tc)
>                 return -ENOMEM;
>
> -       tc->con_in->used_mask =3D n_trig_mask;
> -       tc->con_out->used_mask =3D n_trig_mask;
> +       bitmap_fill(tc->con_in->used_mask, n_trigs);
> +       bitmap_fill(tc->con_out->used_mask, n_trigs);
> +
>         ret =3D cti_add_connection_entry(dev, drvdata, tc, NULL, "default=
");
>         return ret;
>  }
> @@ -339,7 +400,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_=
chan_op op,
>  {
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *config =3D &drvdata->config;
> -       u32 trig_bitmask;
>         u32 chan_bitmask;
>         u32 reg_value;
>         int reg_offset;
> @@ -349,25 +409,23 @@ int cti_channel_trig_op(struct device *dev, enum ct=
i_chan_op op,
>            (trigger_idx >=3D config->nr_trig_max))
>                 return -EINVAL;
>
> -       trig_bitmask =3D BIT(trigger_idx);
> -
>         /* ensure registered triggers and not out filtered */
>         if (direction =3D=3D CTI_TRIG_IN)   {
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
>         /* update the local register values */
>         chan_bitmask =3D BIT(channel_idx);
> -       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? CTIINEN(trigger_id=
x) :
> -                     CTIOUTEN(trigger_idx));
> +       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? cti_offset(drvdata=
, INDEX_CTIINEN, trigger_idx) :
> +                       cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx))=
;
>
>         raw_spin_lock(&drvdata->spinlock);
>
> @@ -451,19 +509,19 @@ int cti_channel_setop(struct device *dev, enum cti_=
chan_set_op op,
>         case CTI_CHAN_SET:
>                 config->ctiappset |=3D chan_bitmask;
>                 reg_value  =3D config->ctiappset;
> -               reg_offset =3D CTIAPPSET;
> +               reg_offset =3D cti_offset(drvdata, INDEX_CTIAPPSET, 0);
>                 break;
>
>         case CTI_CHAN_CLR:
>                 config->ctiappset &=3D ~chan_bitmask;
>                 reg_value =3D chan_bitmask;
> -               reg_offset =3D CTIAPPCLEAR;
> +               reg_offset =3D cti_offset(drvdata, INDEX_CTIAPPCLEAR, 0);
>                 break;
>
>         case CTI_CHAN_PULSE:
>                 config->ctiappset &=3D ~chan_bitmask;
>                 reg_value =3D chan_bitmask;
> -               reg_offset =3D CTIAPPPULSE;
> +               reg_offset =3D cti_offset(drvdata, INDEX_CTIAPPPULSE, 0);
>                 break;
>
>         default:
> @@ -866,6 +924,7 @@ static int cti_probe(struct amba_device *adev, const =
struct amba_id *id)
>         struct coresight_desc cti_desc;
>         struct coresight_platform_data *pdata =3D NULL;
>         struct resource *res =3D &adev->res;
> +       u32 devarch;
>
>         /* driver data*/
>         drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -950,9 +1009,19 @@ static int cti_probe(struct amba_device *adev, cons=
t struct amba_id *id)
>         drvdata->csdev_release =3D drvdata->csdev->dev.release;
>         drvdata->csdev->dev.release =3D cti_device_release;
>
> +       /* qcom_cti*/
> +       devarch =3D readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +       if (CTI_DEVARCH_ARCHITECT(devarch) =3D=3D ARCHITECT_QCOM) {
> +               drvdata->subtype =3D QCOM_CTI;
> +               drvdata->offsets =3D cti_extended_offset;
> +       } else {
> +               drvdata->subtype =3D ARM_STD_CTI;
> +               drvdata->offsets =3D cti_normal_offset;
> +       }
> +
>         /* all done - dec pm refcount */
>         pm_runtime_put(&adev->dev);
> -       dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +       dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata->s=
ubtype);
>         return 0;
>
>  pm_release:
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drive=
rs/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128116900acb0e65d44952996753e79..4bef860a0484d9e72c788e5e9=
e73ff973dac3365 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct d=
evice *dev,
>                 goto create_v8_etm_out;
>
>         /* build connection data */
> -       tc->con_in->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> -       tc->con_out->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>
>         /*
>          * The EXTOUT type signals from the ETM are connected to a set of=
 input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct de=
vice *dev,
>                 goto of_create_v8_out;
>
>         /* Set the v8 PE CTI connection data */
> -       tc->con_in->used_mask =3D 0x3; /* sigs <0 1> */
> +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>         tc->con_in->sig_types[0] =3D PE_DBGTRIGGER;
>         tc->con_in->sig_types[1] =3D PE_PMUIRQ;
> -       tc->con_out->used_mask =3D 0x7; /* sigs <0 1 2 > */
> +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>         tc->con_out->sig_types[0] =3D PE_EDBGREQ;
>         tc->con_out->sig_types[1] =3D PE_DBGRESTART;
>         tc->con_out->sig_types[2] =3D PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct devi=
ce *dev,
>                 goto of_create_v8_out;
>
>         /* filter pe_edbgreq - PE trigout sig <0> */
> -       drvdata->config.trig_out_filter |=3D 0x1;
> +       set_bit(0, drvdata->config.trig_out_filter);
>
>  of_create_v8_out:
>         return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_g=
rp *tgrp,
>         if (!err) {
>                 /* set the signal usage mask */
>                 for (idx =3D 0; idx < tgrp->nr_sigs; idx++)
> -                       tgrp->used_mask |=3D BIT(values[idx]);
> +                       set_bit(values[idx], tgrp->used_mask);
>         }
>
>         kfree(values);
> @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_dr=
vdata *drvdata,
>
>         err =3D cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SI=
GS);
>         if (!err)
> -               drvdata->config.trig_out_filter |=3D tg->used_mask;
> +               bitmap_or(drvdata->config.trig_out_filter,
> +                         drvdata->config.trig_out_filter,
> +                         tg->used_mask, drvdata->config.nr_trig_max);
>
>         kfree(tg);
>         return err;
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..d490e43810ad644be6cc076fa=
ae042771f8086d6 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] =3D {
>
>  /* register based attributes */
>
> -/* Read registers with power check only (no enable check). */
> -static ssize_t coresight_cti_reg_show(struct device *dev,
> -                          struct device_attribute *attr, char *buf)
> +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> +                                          struct device_attribute *attr,=
 char *buf)
>  {
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> @@ -189,6 +188,39 @@ static ssize_t coresight_cti_reg_show(struct device =
*dev,
>         return sysfs_emit(buf, "0x%x\n", val);
>  }
>
> +/* Read registers with power check only (no enable check). */
> +static ssize_t coresight_cti_reg_show(struct device *dev,
> +                                     struct device_attribute *attr, char=
 *buf)
> +{
> +       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> +       u32 val =3D 0, idx =3D drvdata->config.regs_idx;
> +
> +       pm_runtime_get_sync(dev->parent);
> +       raw_spin_lock(&drvdata->spinlock);
> +       if (drvdata->config.hw_powered) {
> +               switch (cti_attr->off) {
> +               case INDEX_CTITRIGINSTATUS:
> +               case INDEX_CTITRIGOUTSTATUS:
> +               case INDEX_ITTRIGINACK:
> +               case INDEX_ITTRIGOUT:
> +               case INDEX_ITTRIGOUTACK:
> +               case INDEX_ITTRIGIN:
> +                       val =3D readl_relaxed(drvdata->base +
> +                                           cti_offset(drvdata, cti_attr-=
>off, idx));
> +                       break;
> +
> +               default:
> +                       val =3D readl_relaxed(drvdata->base + cti_offset(=
drvdata, cti_attr->off, 0));
> +                       break;
> +               }
> +       }
> +
> +       raw_spin_unlock(&drvdata->spinlock);
> +       pm_runtime_put_sync(dev->parent);
> +       return sysfs_emit(buf, "0x%x\n", val);
> +}
> +
>  /* Write registers with power check only (no enable check). */
>  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev=
,
>                                                       struct device_attri=
bute *attr,
> @@ -197,19 +229,38 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
>         unsigned long val =3D 0;
> +       u32 idx =3D drvdata->config.regs_idx;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
>
>         pm_runtime_get_sync(dev->parent);
>         raw_spin_lock(&drvdata->spinlock);
> -       if (drvdata->config.hw_powered)
> -               cti_write_single_reg(drvdata, cti_attr->off, val);
> +       if (drvdata->config.hw_powered) {
> +               switch (cti_attr->off) {
> +               case INDEX_ITTRIGINACK:
> +               case INDEX_ITTRIGOUT:
> +                       cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, idx), val);
> +                       break;
> +
> +               default:
> +                       cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, 0), val);
> +                       break;
> +               }
> +       }
>         raw_spin_unlock(&drvdata->spinlock);
>         pm_runtime_put_sync(dev->parent);
>         return size;
>  }
>
> +#define coresight_cti_mgmt_reg(name, offset)                           \
> +       (&((struct cs_off_attribute[]) {                                \
> +          {                                                            \
> +               __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
> +               offset                                                  \
> +          }                                                            \
> +       })[0].attr.attr)
> +
>  #define coresight_cti_reg(name, offset)                                 =
       \
>         (&((struct cs_off_attribute[]) {                                \
>            {                                                            \
> @@ -237,17 +288,17 @@ static __maybe_unused ssize_t coresight_cti_reg_sto=
re(struct device *dev,
>
>  /* coresight management registers */
>  static struct attribute *coresight_cti_mgmt_attrs[] =3D {
> -       coresight_cti_reg(devaff0, CTIDEVAFF0),
> -       coresight_cti_reg(devaff1, CTIDEVAFF1),
> -       coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> -       coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> -       coresight_cti_reg(devid, CORESIGHT_DEVID),
> -       coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> -       coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> -       coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> -       coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> -       coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> -       coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> +       coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> +       coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> +       coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> +       coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> +       coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> +       coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> +       coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> +       coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> +       coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> +       coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> +       coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
>         NULL,
>  };
>
> @@ -258,13 +309,15 @@ static struct attribute *coresight_cti_mgmt_attrs[]=
 =3D {
>   * If inaccessible & pcached_val not NULL then show cached value.
>   */
>  static ssize_t cti_reg32_show(struct device *dev, char *buf,
> -                             u32 *pcached_val, int reg_offset)
> +                             u32 *pcached_val, int index)
>  {
>         u32 val =3D 0;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *config =3D &drvdata->config;
> +       int reg_offset;
>
>         raw_spin_lock(&drvdata->spinlock);
> +       reg_offset =3D cti_offset(drvdata, index, 0);
>         if ((reg_offset >=3D 0) && cti_active(config)) {
>                 CS_UNLOCK(drvdata->base);
>                 val =3D readl_relaxed(drvdata->base + reg_offset);
> @@ -284,11 +337,12 @@ static ssize_t cti_reg32_show(struct device *dev, c=
har *buf,
>   * if reg_offset >=3D 0 then write through if enabled.
>   */
>  static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> -                              size_t size, u32 *pcached_val, int reg_off=
set)
> +                              size_t size, u32 *pcached_val, int index)
>  {
>         unsigned long val;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *config =3D &drvdata->config;
> +       int reg_offset;
>
>         if (kstrtoul(buf, 0, &val))
>                 return -EINVAL;
> @@ -298,6 +352,7 @@ static ssize_t cti_reg32_store(struct device *dev, co=
nst char *buf,
>         if (pcached_val)
>                 *pcached_val =3D (u32)val;
>
> +       reg_offset =3D cti_offset(drvdata, index, 0);
>         /* write through if offset and enabled */
>         if ((reg_offset >=3D 0) && cti_active(config))
>                 cti_write_single_reg(drvdata, reg_offset, val);
> @@ -306,14 +361,14 @@ static ssize_t cti_reg32_store(struct device *dev, =
const char *buf,
>  }
>
>  /* Standard macro for simple rw cti config registers */
> -#define cti_config_reg32_rw(name, cfgname, offset)                     \
> +#define cti_config_reg32_rw(name, cfgname, index)                      \
>  static ssize_t name##_show(struct device *dev,                         \
>                            struct device_attribute *attr,               \
>                            char *buf)                                   \
>  {                                                                      \
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);    =
 \
>         return cti_reg32_show(dev, buf,                                 \
> -                             &drvdata->config.cfgname, offset);        \
> +                             &drvdata->config.cfgname, index);         \
>  }                                                                      \
>                                                                         \
>  static ssize_t name##_store(struct device *dev,                         =
       \
> @@ -322,7 +377,7 @@ static ssize_t name##_store(struct device *dev,      =
                       \
>  {                                                                      \
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);    =
 \
>         return cti_reg32_store(dev, buf, size,                          \
> -                              &drvdata->config.cfgname, offset);       \
> +                              &drvdata->config.cfgname, index);        \
>  }                                                                      \
>  static DEVICE_ATTR_RW(name)
>
> @@ -356,6 +411,46 @@ static ssize_t inout_sel_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(inout_sel);
>
> +/*
> + * QCOM CTI supports up to 128 triggers, there are 6 registers need to b=
e
> + * expanded to up to 4 instances, and regs_idx can be used to indicate w=
hich
> + * one is in use.
> + * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
> + * ITTRIGIN, ITTRIGOUT,
> + * ITTRIGINACK, ITTRIGOUTACK.
> + */
> +static ssize_t regs_idx_show(struct device *dev,
> +                            struct device_attribute *attr,
> +                            char *buf)
> +{
> +       u32 val;
> +       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +
> +       raw_spin_lock(&drvdata->spinlock);
> +       val =3D drvdata->config.regs_idx;
> +       raw_spin_unlock(&drvdata->spinlock);
> +       return sprintf(buf, "%d\n", val);
> +}
> +
> +static ssize_t regs_idx_store(struct device *dev,
> +                             struct device_attribute *attr,
> +                             const char *buf, size_t size)
> +{
> +       unsigned long val;
> +       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> +
> +       if (kstrtoul(buf, 0, &val))
> +               return -EINVAL;
> +       if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
> +               return -EINVAL;
> +
> +       raw_spin_lock(&drvdata->spinlock);
> +       drvdata->config.regs_idx =3D val;
> +       raw_spin_unlock(&drvdata->spinlock);
> +       return size;
> +}
> +static DEVICE_ATTR_RW(regs_idx);
> +
>  static ssize_t inen_show(struct device *dev,
>                          struct device_attribute *attr,
>                          char *buf)
> @@ -389,7 +484,7 @@ static ssize_t inen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIINEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_C=
TIINEN, index), val);
>         raw_spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -428,7 +523,7 @@ static ssize_t outen_store(struct device *dev,
>
>         /* write through if enabled */
>         if (cti_active(config))
> -               cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +               cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_C=
TIOUTEN, index), val);
>         raw_spin_unlock(&drvdata->spinlock);
>         return size;
>  }
> @@ -448,9 +543,9 @@ static ssize_t intack_store(struct device *dev,
>  }
>  static DEVICE_ATTR_WO(intack);
>
> -cti_config_reg32_rw(gate, ctigate, CTIGATE);
> -cti_config_reg32_rw(asicctl, asicctl, ASICCTL);
> -cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
> +cti_config_reg32_rw(gate, ctigate, INDEX_CTIGATE);
> +cti_config_reg32_rw(asicctl, asicctl, INDEX_ASICCTL);
> +cti_config_reg32_rw(appset, ctiappset, INDEX_CTIAPPSET);
>
>  static ssize_t appclear_store(struct device *dev,
>                               struct device_attribute *attr,
> @@ -504,6 +599,7 @@ static DEVICE_ATTR_WO(apppulse);
>   */
>  static struct attribute *coresight_cti_regs_attrs[] =3D {
>         &dev_attr_inout_sel.attr,
> +       &dev_attr_regs_idx.attr,
>         &dev_attr_inen.attr,
>         &dev_attr_outen.attr,
>         &dev_attr_gate.attr,
> @@ -512,20 +608,20 @@ static struct attribute *coresight_cti_regs_attrs[]=
 =3D {
>         &dev_attr_appset.attr,
>         &dev_attr_appclear.attr,
>         &dev_attr_apppulse.attr,
> -       coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> -       coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
> -       coresight_cti_reg(chinstatus, CTICHINSTATUS),
> -       coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
> +       coresight_cti_reg(triginstatus, INDEX_CTITRIGINSTATUS),
> +       coresight_cti_reg(trigoutstatus, INDEX_CTITRIGOUTSTATUS),
> +       coresight_cti_reg(chinstatus, INDEX_CTICHINSTATUS),
> +       coresight_cti_reg(choutstatus, INDEX_CTICHOUTSTATUS),
>  #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
> -       coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
> -       coresight_cti_reg(ittrigin, ITTRIGIN),
> -       coresight_cti_reg(itchin, ITCHIN),
> -       coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
> -       coresight_cti_reg_rw(itchout, ITCHOUT),
> -       coresight_cti_reg(itchoutack, ITCHOUTACK),
> -       coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
> -       coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
> -       coresight_cti_reg_wo(itchinack, ITCHINACK),
> +       coresight_cti_reg_rw(itctrl, INDEX_ITCTRL),
> +       coresight_cti_reg(ittrigin, INDEX_ITTRIGIN),
> +       coresight_cti_reg(itchin, INDEX_ITCHIN),
> +       coresight_cti_reg_rw(ittrigout, INDEX_ITTRIGOUT),
> +       coresight_cti_reg_rw(itchout, INDEX_ITCHOUT),
> +       coresight_cti_reg(itchoutack, INDEX_ITCHOUTACK),
> +       coresight_cti_reg(ittrigoutack, INDEX_ITTRIGOUTACK),
> +       coresight_cti_reg_wo(ittriginack, INDEX_ITTRIGINACK),
> +       coresight_cti_reg_wo(itchinack, INDEX_ITCHINACK),
>  #endif
>         NULL,
>  };
> @@ -711,10 +807,8 @@ static ssize_t trigout_filtered_show(struct device *=
dev,
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
>         int size =3D 0, nr_trig_max =3D cfg->nr_trig_max;
> -       unsigned long mask =3D cfg->trig_out_filter;
>
> -       if (mask)
> -               size =3D bitmap_print_to_pagebuf(true, buf, &mask, nr_tri=
g_max);
> +       size =3D bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter,=
 nr_trig_max);
>         return size;
>  }
>  static DEVICE_ATTR_RO(trigout_filtered);
> @@ -926,9 +1020,8 @@ static ssize_t trigin_sig_show(struct device *dev,
>         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->var=
;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
> -       unsigned long mask =3D con->con_in->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max=
);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask,=
 cfg->nr_trig_max);
>  }
>
>  static ssize_t trigout_sig_show(struct device *dev,
> @@ -940,9 +1033,8 @@ static ssize_t trigout_sig_show(struct device *dev,
>         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->var=
;
>         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
>         struct cti_config *cfg =3D &drvdata->config;
> -       unsigned long mask =3D con->con_out->used_mask;
>
> -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max=
);
> +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask=
, cfg->nr_trig_max);
>  }
>
>  /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtrac=
ing/coresight/coresight-cti.h
> index 8362a47c939c60399d7f2f3f599f72de4983a6e1..4f85986b42f0c559c7aa2033f=
b859cb2f6b12186 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -15,6 +15,7 @@
>  #include <linux/types.h>
>
>  #include "coresight-priv.h"
> +#include "qcom-cti.h"

remove this an include in the .c file.
>
>  struct fwnode_handle;
>
> @@ -57,7 +58,7 @@ struct fwnode_handle;
>   * Max of in and out defined in the DEVID register.
>   * - pick up actual number used from .dts parameters if present.
>   */
> -#define CTIINOUTEN_MAX         32
> +#define CTIINOUTEN_MAX         128
>
>  /**
>   * Group of related trigger signals
> @@ -68,7 +69,7 @@ struct fwnode_handle;
>   */
>  struct cti_trig_grp {
>         int nr_sigs;
> -       u32 used_mask;
> +       DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
>         int sig_types[];
>  };
>
> @@ -147,9 +148,10 @@ struct cti_config {
>         bool hw_powered;
>
>         /* registered triggers and filtering */
> -       u32 trig_in_use;
> -       u32 trig_out_use;
> -       u32 trig_out_filter;
> +       DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
> +       DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
> +
These declare bitmaps should be changed to unsgined long * to allow
dynamic allocation using bitmap_zalloc() / bitmap_free()

>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
> @@ -160,6 +162,9 @@ struct cti_config {
>         u32 ctiouten[CTIINOUTEN_MAX];

Change this to a u32 * so the array can be allocated dynamically
according to the actual number of registers, along with ctiinen,

>         u32 ctigate;
>         u32 asicctl;
> +
> +       /*for qcom_cti, see regs_idx_show*/
> +       u32 regs_idx;
>  };
>
>  /**
> @@ -180,6 +185,8 @@ struct cti_drvdata {
>         struct cti_config config;
>         struct list_head node;
>         void (*csdev_release)(struct device *dev);
> +       enum cti_subtype subtype;
> +       const u32 *offsets;
>  };
>
>  /*
> @@ -233,6 +240,11 @@ struct coresight_platform_data *
>  coresight_cti_get_platform_data(struct device *dev);
>  const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
>
> +static inline u32 cti_offset(struct cti_drvdata *drvdata, int index, int=
 num)
> +{
> +       return drvdata->offsets[index] + 4 * num;
> +}
> +
>  /* cti powered and enabled */
>  static inline bool cti_active(struct cti_config *cfg)
>  {
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/c=
oresight/qcom-cti.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..aaf55f3e5c29023acffe96505=
d9de0278261d1ab
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +/* CTI programming registers */
> +#define        QCOM_CTIINTACK          0x020
> +#define        QCOM_CTIAPPSET          0x004
> +#define        QCOM_CTIAPPCLEAR        0x008
> +#define        QCOM_CTIAPPPULSE        0x00C
> +#define        QCOM_CTIINEN            0x400
> +#define        QCOM_CTIOUTEN           0x800
> +#define        QCOM_CTITRIGINSTATUS    0x040
> +#define        QCOM_CTITRIGOUTSTATUS   0x060
> +#define        QCOM_CTICHINSTATUS      0x080
> +#define        QCOM_CTICHOUTSTATUS     0x084
> +#define        QCOM_CTIGATE            0x088
> +#define        QCOM_ASICCTL            0x08c
> +/* Integration test registers */
> +#define        QCOM_ITCHINACK          0xE70
> +#define        QCOM_ITTRIGINACK        0xE80
> +#define        QCOM_ITCHOUT            0xE74
> +#define        QCOM_ITTRIGOUT          0xEA0
> +#define        QCOM_ITCHOUTACK         0xE78
> +#define        QCOM_ITTRIGOUTACK       0xEC0
> +#define        QCOM_ITCHIN             0xE7C
> +#define        QCOM_ITTRIGIN           0xEE0
> +

everything below here is common and should be in coresight-cti.h

> +/* Qcom CTI supports up to 128 triggers*/
> +enum cti_subtype {
> +       ARM_STD_CTI,
> +       QCOM_CTI,
> +};
> +
> +/* These registers are remapped*/
> +enum cti_offset_index {
> +       INDEX_CTIINTACK,
> +       INDEX_CTIAPPSET,
> +       INDEX_CTIAPPCLEAR,
> +       INDEX_CTIAPPPULSE,
> +       INDEX_CTIINEN,
> +       INDEX_CTIOUTEN,
> +       INDEX_CTITRIGINSTATUS,
> +       INDEX_CTITRIGOUTSTATUS,
> +       INDEX_CTICHINSTATUS,
> +       INDEX_CTICHOUTSTATUS,
> +       INDEX_CTIGATE,
> +       INDEX_ASICCTL,
> +       INDEX_ITCHINACK,
> +       INDEX_ITTRIGINACK,
> +       INDEX_ITCHOUT,
> +       INDEX_ITTRIGOUT,
> +       INDEX_ITCHOUTACK,
> +       INDEX_ITTRIGOUTACK,
> +       INDEX_ITCHIN,
> +       INDEX_ITTRIGIN,
> +       INDEX_ITCTRL,
> +};
>
> ---
> base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
> change-id: 20250828-extended_cti-d441ec991b80
>
> Best regards,
> --
> Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>

Thanks and Regards

Mike
--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


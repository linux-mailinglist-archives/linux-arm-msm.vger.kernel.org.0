Return-Path: <linux-arm-msm+bounces-67779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A62B1B337
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B879E1703E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A314C26B2D2;
	Tue,  5 Aug 2025 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahsjTLff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5307248F51
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396468; cv=none; b=aLsp+4HyKcRqt3cRE6y20EmOrGv0fYFYuS9Gep2C0IvfrF+IFECcGIwbqq35SFGros2bxZWzqWbH6WxEP8/YcmJ00pJCLkUJjTUngfXcht5R4EqadpM86t8ORDa/pgHBKycX1CvzRvBjE9GW8cUslbroTsH72daH5gRFXmswlpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396468; c=relaxed/simple;
	bh=a0UMDh5jP/f890IY3i+ZFC4ojkk2vDalCxAMCT94zbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vi0mtVlIU3kXOFWJsR6mICW6FJSEU2p1d3FDP23OsK8fS9whL/dqPbIS4WBq3u+2sCaSbqw+L4VK6RSWvHgw9sdoyE8vl7PLV1W/XbrJ75jGwD94j5u2BZecV8VzmoqO+wtm3kB3kSvbLykKMMPS8ceo09eEKlek/Z8Rss7yqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahsjTLff; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bd050184bso6237734b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754396464; x=1755001264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN9TxnTX0jKI2utFknDqBh6efwBYZRO5RUzihffdrlo=;
        b=ahsjTLff6CccUCjNbTFpslQZmV4XcdXlMufbhRUXOwv/Nfx2D3qrw1ke3FVmuundVn
         JmjzW7cyCtANq1aDXW5wNwOd73i3O5+ubFkhzQAl0UpXkVsXxvOPodOhX4YxgrCzXDoT
         YpvjYPVt+bUPVMEbi3ogZBCZIYdiPYxwu6GhGX+pgGkY3lFPUXsmnXnVR7GMxDKTyVoj
         XF8O+GofCP4VxmXnKHnM6eRbZlPLi+v4ZsdHZsRFmf8rpLMmU/xJODWNzNiCQoWc1AZj
         a2RRC3lYg5akLnAaBTCPpEPgFowaM6DAlZqJzzqtNSKJR0+Cxjer//xL7BwXMZNvrXNu
         H/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396464; x=1755001264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN9TxnTX0jKI2utFknDqBh6efwBYZRO5RUzihffdrlo=;
        b=X47JsK7M3X//w9aaSMCHuQshdNzuIwLqJj6nNnDoj+wtt//WMcAWa2lrfgr9sTTh+A
         hRJWjul5YBwzjz36GopsCwOmNIYBUJF1D8Vh0ZBrR2aBM/T9ShysaNvB645OYwqS3pnM
         tcSmiMrHJCUx+WMNzToXS0DPWvwenV7TYu2QKza39V7wDCBVlMhEYCOCiHT17XDnrHMu
         TOAQVXh5L8j32AzF3Fgps4WlHQ8igk4jg+AO931tiyxuYCFu1EpNPjW+5/nTn/VE0Gq9
         zsN91RAtunfMJU7PjVo0q49lKaMcSOkVDsCKjnpUczvejCZ8D7OGQ6j353M9ijzYT05v
         WT+w==
X-Forwarded-Encrypted: i=1; AJvYcCWnn8p/mtRgJqrTMLOmeUjygBgeD+j7SqvBtfbKvrrI2x+kBCn4nI5tbiUXdy9jqZG9b6uXgAkYrzz178Xp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gcrgcPsB+SO2toTriz38eA7F/+DoFgPP7YCL3/gOI5IBHMbh
	HOKljXzyks8oCmLyKxOE7OwfhgNYQF8gaBu18qRq/Drp8BMcVPtiRbGSrSLz6W+RclNdKJV/Bbv
	qUDu4AhYxKGRXlHpcrqp02ER30/UXB5SmDftLfOHJzQ==
X-Gm-Gg: ASbGncuJ9MO24JH7gNcq3rBYW0zN1NzRoB7oTpcLz33rN6wsN3dCURa6FOrEBypliGl
	GJ5+MYIlz1CJDV15oqeeA8Em0n1NjtR6dSaxoWhIdW6a10j/0MiXMBVOPUgMVK72ZdQldmAhlUN
	AinE+yT7UoRr5sckq9JT+DwPuOvOnjSV2teOYCbTpdh3YSM4HPmyNoIZB1wn4JNH2Z8TgkR2D8o
	AsVhrKP1/eOR8O+
X-Google-Smtp-Source: AGHT+IEHmSX274Q0tSdhIl66o9BBHZpg6BJ4e5uuXUvo69qG0g1UHn9D1LEbqlSmmjVdRNMuJJ8aAYru64IjzvIBwrY=
X-Received: by 2002:a05:6a00:1ac9:b0:74e:ac5b:17ff with SMTP id
 d2e1a72fcca58-76bec48bbddmr16872257b3a.13.1754396463619; Tue, 05 Aug 2025
 05:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-3-quic_jinlmao@quicinc.com> <CAJ9a7VhSLdPnVdJfbsCTKLri7i8SKP4WaO9W8=mOU4Wjo0VbyQ@mail.gmail.com>
In-Reply-To: <CAJ9a7VhSLdPnVdJfbsCTKLri7i8SKP4WaO9W8=mOU4Wjo0VbyQ@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 13:20:52 +0100
X-Gm-Features: Ac12FXwgaNsBAyrtUPWBM9viZl-PkqMUlgP9hXnsVRmhOIrCJfJhJJ-Q66EfRqs
Message-ID: <CAJ9a7Vhh_DV1McYuLp9y4hCuzj7sdYNhd2g7vT32B_pN0L3YPw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, 4 Aug 2025 at 21:49, Mike Leach <mike.leach@linaro.org> wrote:
>
> Hi
>
> On Tue, 22 Jul 2025 at 09:14, Mao Jinlong <quic_jinlmao@quicinc.com> wrot=
e:
> >
> > From: Yingchao Deng <quic_yingdeng@quicinc.com>
> >
> > The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=
=99s CSCTI.
> > It allows a debugger to send to trigger events to a processor or to sen=
d
> > a trigger event to one or more processors when a trigger event occurs
> > on another processor on the same SoC, or even between SoCs. For Qualcom=
m
> > extended CTI, it supports up to 128 triggers.
> >
> > Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > ---
> >  .../hwtracing/coresight/coresight-cti-core.c  | 127 +++++++++++++----
> >  .../coresight/coresight-cti-platform.c        |  16 ++-
> >  .../hwtracing/coresight/coresight-cti-sysfs.c | 128 ++++++++++++++----
> >  drivers/hwtracing/coresight/coresight-cti.h   |  75 +++++-----
> >  4 files changed, 245 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers=
/hwtracing/coresight/coresight-cti-core.c
> > index 8fb30dd73fd2..d6a28df48484 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> >  #include <linux/spinlock.h>
> > @@ -22,6 +23,54 @@
> >  #include "coresight-priv.h"
> >  #include "coresight-cti.h"
> >
> > +#define CTI_EXTENDED "qcom,coresight-cti-extended"
> > +
> > +static const int cti_normal_offset[] =3D {
> > +       [CTIINTACK]             =3D 0x010,
> > +       [CTIAPPSET]             =3D 0x014,
> > +       [CTIAPPCLEAR]           =3D 0x018,
> > +       [CTIAPPPULSE]           =3D 0x01C,
> > +       [CTIINEN]               =3D 0x020,
> > +       [CTIOUTEN]              =3D 0x0A0,
> > +       [CTITRIGINSTATUS]       =3D 0x130,
> > +       [CTITRIGOUTSTATUS]      =3D 0x134,
> > +       [CTICHINSTATUS]         =3D 0x138,
> > +       [CTICHOUTSTATUS]        =3D 0x13C,
> > +       [CTIGATE]               =3D 0x140,
> > +       [ASICCTL]               =3D 0x144,
> > +       [ITCHINACK]             =3D 0xEDC,
> > +       [ITTRIGINACK]           =3D 0xEE0,
> > +       [ITCHOUT]               =3D 0xEE4,
> > +       [ITTRIGOUT]             =3D 0xEE8,
> > +       [ITCHOUTACK]            =3D 0xEEC,
> > +       [ITTRIGOUTACK]          =3D 0xEF0,
> > +       [ITCHIN]                =3D 0xEF4,
> > +       [ITTRIGIN]              =3D 0xEF8,
> > +};
> > +
>
> Why not all CTI registers in these arrays?
> Do not use hardcoded values in here - use the #defines from the header fi=
le.
>
>
> > +static const int cti_extended_offset[] =3D {
> > +       [CTIINTACK]             =3D 0x020,
> > +       [CTIAPPSET]             =3D 0x004,
> > +       [CTIAPPCLEAR]           =3D 0x008,
> > +       [CTIAPPPULSE]           =3D 0x00C,
> > +       [CTIINEN]               =3D 0x400,
> > +       [CTIOUTEN]              =3D 0x800,
> > +       [CTITRIGINSTATUS]       =3D 0x040,
> > +       [CTITRIGOUTSTATUS]      =3D 0x060,
> > +       [CTICHINSTATUS]         =3D 0x080,
> > +       [CTICHOUTSTATUS]        =3D 0x084,
> > +       [CTIGATE]               =3D 0x088,
> > +       [ASICCTL]               =3D 0x08c,
> > +       [ITCHINACK]             =3D 0xE70,
> > +       [ITTRIGINACK]           =3D 0xE80,
> > +       [ITCHOUT]               =3D 0xE74,
> > +       [ITTRIGOUT]             =3D 0xEA0,
> > +       [ITCHOUTACK]            =3D 0xE78,
> > +       [ITTRIGOUTACK]          =3D 0xEC0,
> > +       [ITCHIN]                =3D 0xE7C,
> > +       [ITTRIGIN]              =3D 0xEE0,
> > +};
> > +
>
> Again use #defines from header - in this case prehaps a new
> qcom-cti.h, #define values QCOM_CTINTACK etc...
>
> >  /*
> >   * CTI devices can be associated with a PE, or be connected to CoreSig=
ht
> >   * hardware. We have a list of all CTIs irrespective of CPU bound or
> > @@ -57,6 +106,12 @@ static struct cti_drvdata *cti_cpu_drvdata[NR_CPUS]=
;
> >   */
> >  DEFINE_CORESIGHT_DEVLIST(cti_sys_devs, "cti_sys");
> >
> > +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
> > +{
> > +       return (drvdata->is_extended_cti ? cti_extended_offset[index]
> > +                       : cti_normal_offset[index]) + (4 * num);
>
> have a pointer to the offset array in drvdata and set it at probe
> time. This fn could probalb ybe inlines and then becomes
>
> return drvdata->offsets[index] + (4 * num);
>
>
> > +}
> > +
> >  /* write set of regs to hardware - call with spinlock claimed */
> >  void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
> >  {
> > @@ -70,15 +125,15 @@ void cti_write_all_hw_regs(struct cti_drvdata *drv=
data)
> >
> >         /* write the CTI trigger registers */
> >         for (i =3D 0; i < config->nr_trig_max; i++) {
> > -               writel_relaxed(config->ctiinen[i], drvdata->base + CTII=
NEN(i));
> > +               writel_relaxed(config->ctiinen[i], drvdata->base + cti_=
offset(drvdata, CTIINEN, i));
> >                 writel_relaxed(config->ctiouten[i],
> > -                              drvdata->base + CTIOUTEN(i));
> > +                               drvdata->base + cti_offset(drvdata, CTI=
OUTEN, i));
> >         }
> >
> >         /* other regs */
> > -       writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> > -       writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> > -       writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> > +       writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvd=
ata, CTIGATE, 0));
> > +       writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvd=
ata, ASICCTL, 0));
> > +       writel_relaxed(config->ctiappset, drvdata->base + cti_offset(dr=
vdata, CTIAPPSET, 0));
> >
> >         /* re-enable CTI */
> >         writel_relaxed(1, drvdata->base + CTICONTROL);
> > @@ -99,10 +154,13 @@ static int cti_enable_hw(struct cti_drvdata *drvda=
ta)
> >         if (config->hw_enabled || !config->hw_powered)
> >                 goto cti_state_unchanged;
> >
> > -       /* claim the device */
> > -       rc =3D coresight_claim_device(drvdata->csdev);
> > -       if (rc)
> > -               goto cti_err_not_enabled;
> > +       /* There is no relationship between the CLR and SET pair for ex=
tended CTI. */
>
> What does this mean? - these are CoreSight required management
> registers required by software to claim the resource. Are they not
> present of this device or has the functionality of these registers
> been dropped.
> Either way this is no longer a Coresight compatible CTI device without th=
ese.

Quick clarification - after dicussions with the CoreSight architect in
ARM, these locations must be readable, but can return 0 indicating no
claim tags present.

>
> > +       if (!drvdata->is_extended_cti) {
> > +               /* claim the device */
> > +               rc =3D coresight_claim_device(drvdata->csdev);
> > +               if (rc)
> > +                       goto cti_err_not_enabled;
> > +       }
> >
> >         cti_write_all_hw_regs(drvdata);
> >
> > @@ -175,7 +233,8 @@ static int cti_disable_hw(struct cti_drvdata *drvda=
ta)
> >         writel_relaxed(0, drvdata->base + CTICONTROL);
> >         config->hw_enabled =3D false;
> >
> > -       coresight_disclaim_device_unlocked(csdev);
> > +       if (!drvdata->is_extended_cti)
> > +               coresight_disclaim_device_unlocked(csdev);
> >         CS_LOCK(drvdata->base);
> >         raw_spin_unlock(&drvdata->spinlock);
> >         return ret;
> > @@ -270,8 +329,10 @@ int cti_add_connection_entry(struct device *dev, s=
truct cti_drvdata *drvdata,
> >         cti_dev->nr_trig_con++;
> >
> >         /* add connection usage bit info to overall info */
> > -       drvdata->config.trig_in_use |=3D tc->con_in->used_mask;
> > -       drvdata->config.trig_out_use |=3D tc->con_out->used_mask;
> > +       bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_=
use,
> > +                 tc->con_in->used_mask, drvdata->config.nr_trig_max);
> > +       bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_ou=
t_use,
> > +                 tc->con_out->used_mask, drvdata->config.nr_trig_max);
> >
> >         return 0;
> >  }
> > @@ -314,7 +375,6 @@ int cti_add_default_connection(struct device *dev, =
struct cti_drvdata *drvdata)
> >  {
> >         int ret =3D 0;
> >         int n_trigs =3D drvdata->config.nr_trig_max;
> > -       u32 n_trig_mask =3D GENMASK(n_trigs - 1, 0);
> >         struct cti_trig_con *tc =3D NULL;
> >
> >         /*
> > @@ -325,8 +385,9 @@ int cti_add_default_connection(struct device *dev, =
struct cti_drvdata *drvdata)
> >         if (!tc)
> >                 return -ENOMEM;
> >
> > -       tc->con_in->used_mask =3D n_trig_mask;
> > -       tc->con_out->used_mask =3D n_trig_mask;
> > +       bitmap_fill(tc->con_in->used_mask, n_trigs);
> > +       bitmap_fill(tc->con_out->used_mask, n_trigs);
> > +
> >         ret =3D cti_add_connection_entry(dev, drvdata, tc, NULL, "defau=
lt");
> >         return ret;
> >  }
> > @@ -339,7 +400,6 @@ int cti_channel_trig_op(struct device *dev, enum ct=
i_chan_op op,
> >  {
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cti_config *config =3D &drvdata->config;
> > -       u32 trig_bitmask;
> >         u32 chan_bitmask;
> >         u32 reg_value;
> >         int reg_offset;
> > @@ -349,25 +409,23 @@ int cti_channel_trig_op(struct device *dev, enum =
cti_chan_op op,
> >            (trigger_idx >=3D config->nr_trig_max))
> >                 return -EINVAL;
> >
> > -       trig_bitmask =3D BIT(trigger_idx);
> > -
> >         /* ensure registered triggers and not out filtered */
> >         if (direction =3D=3D CTI_TRIG_IN)   {
> > -               if (!(trig_bitmask & config->trig_in_use))
> > +               if (!(test_bit(trigger_idx, config->trig_in_use)))
> >                         return -EINVAL;
> >         } else {
> > -               if (!(trig_bitmask & config->trig_out_use))
> > +               if (!(test_bit(trigger_idx, config->trig_out_use)))
> >                         return -EINVAL;
> >
> >                 if ((config->trig_filter_enable) &&
> > -                   (config->trig_out_filter & trig_bitmask))
> > +                   test_bit(trigger_idx, config->trig_out_filter))
> >                         return -EINVAL;
> >         }
> >
> >         /* update the local register values */
> >         chan_bitmask =3D BIT(channel_idx);
> > -       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? CTIINEN(trigger_=
idx) :
> > -                     CTIOUTEN(trigger_idx));
> > +       reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? cti_offset(drvda=
ta, CTIINEN, trigger_idx) :
> > +                       cti_offset(drvdata, CTIOUTEN, trigger_idx));
> >
> >         raw_spin_lock(&drvdata->spinlock);
> >
> > @@ -451,19 +509,19 @@ int cti_channel_setop(struct device *dev, enum ct=
i_chan_set_op op,
> >         case CTI_CHAN_SET:
> >                 config->ctiappset |=3D chan_bitmask;
> >                 reg_value  =3D config->ctiappset;
> > -               reg_offset =3D CTIAPPSET;
> > +               reg_offset =3D cti_offset(drvdata, CTIAPPSET, 0);
> >                 break;
> >
> >         case CTI_CHAN_CLR:
> >                 config->ctiappset &=3D ~chan_bitmask;
> >                 reg_value =3D chan_bitmask;
> > -               reg_offset =3D CTIAPPCLEAR;
> > +               reg_offset =3D cti_offset(drvdata, CTIAPPCLEAR, 0);
> >                 break;
> >
> >         case CTI_CHAN_PULSE:
> >                 config->ctiappset &=3D ~chan_bitmask;
> >                 reg_value =3D chan_bitmask;
> > -               reg_offset =3D CTIAPPPULSE;
> > +               reg_offset =3D cti_offset(drvdata, CTIAPPPULSE, 0);
> >                 break;
> >
> >         default:
> > @@ -857,6 +915,19 @@ static void cti_remove(struct amba_device *adev)
> >         coresight_unregister(drvdata->csdev);
> >  }
> >
> > +static bool of_is_extended_cti(struct device *dev)
> > +{
> > +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > +
> > +       if (is_of_node(fwnode)) {
> > +               if (of_device_is_compatible(to_of_node(fwnode),
> > +                                           CTI_EXTENDED))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static int cti_probe(struct amba_device *adev, const struct amba_id *i=
d)
> >  {
> >         int ret =3D 0;
> > @@ -950,9 +1021,11 @@ static int cti_probe(struct amba_device *adev, co=
nst struct amba_id *id)
> >         drvdata->csdev_release =3D drvdata->csdev->dev.release;
> >         drvdata->csdev->dev.release =3D cti_device_release;
> >
> > +       drvdata->is_extended_cti =3D of_is_extended_cti(dev);
>
> Better as drvdata->cti_subtype - see comments below.
> > +
> >         /* all done - dec pm refcount */
> >         pm_runtime_put(&adev->dev);
> > -       dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> > +       dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata-=
>is_extended_cti);
> >         return 0;
> >
> >  pm_release:
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/dri=
vers/hwtracing/coresight/coresight-cti-platform.c
> > index d0ae10bf6128..4bef860a0484 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> > @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct=
 device *dev,
> >                 goto create_v8_etm_out;
> >
> >         /* build connection data */
> > -       tc->con_in->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> > -       tc->con_out->used_mask =3D 0xF0; /* sigs <4,5,6,7> */
> > +       bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> > +       bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
> >
> >         /*
> >          * The EXTOUT type signals from the ETM are connected to a set =
of input
> > @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct =
device *dev,
> >                 goto of_create_v8_out;
> >
> >         /* Set the v8 PE CTI connection data */
> > -       tc->con_in->used_mask =3D 0x3; /* sigs <0 1> */
> > +       bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
> >         tc->con_in->sig_types[0] =3D PE_DBGTRIGGER;
> >         tc->con_in->sig_types[1] =3D PE_PMUIRQ;
> > -       tc->con_out->used_mask =3D 0x7; /* sigs <0 1 2 > */
> > +       bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
> >         tc->con_out->sig_types[0] =3D PE_EDBGREQ;
> >         tc->con_out->sig_types[1] =3D PE_DBGRESTART;
> >         tc->con_out->sig_types[2] =3D PE_CTIIRQ;
> > @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct de=
vice *dev,
> >                 goto of_create_v8_out;
> >
> >         /* filter pe_edbgreq - PE trigout sig <0> */
> > -       drvdata->config.trig_out_filter |=3D 0x1;
> > +       set_bit(0, drvdata->config.trig_out_filter);
> >
> >  of_create_v8_out:
> >         return ret;
> > @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig=
_grp *tgrp,
> >         if (!err) {
> >                 /* set the signal usage mask */
> >                 for (idx =3D 0; idx < tgrp->nr_sigs; idx++)
> > -                       tgrp->used_mask |=3D BIT(values[idx]);
> > +                       set_bit(values[idx], tgrp->used_mask);
> >         }
> >
> >         kfree(values);
> > @@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_=
drvdata *drvdata,
> >
> >         err =3D cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_=
SIGS);
> >         if (!err)
> > -               drvdata->config.trig_out_filter |=3D tg->used_mask;
> > +               bitmap_or(drvdata->config.trig_out_filter,
> > +                         drvdata->config.trig_out_filter,
> > +                         tg->used_mask, drvdata->config.nr_trig_max);
> >
> >         kfree(tg);
> >         return err;
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/driver=
s/hwtracing/coresight/coresight-cti-sysfs.c
> > index 572b80ee96fb..cc680a4b900a 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] =3D =
{
> >
> >  /* register based attributes */
> >
> > -/* Read registers with power check only (no enable check). */
> > -static ssize_t coresight_cti_reg_show(struct device *dev,
> > -                          struct device_attribute *attr, char *buf)
> > +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> > +                                          struct device_attribute *att=
r, char *buf)
> >  {
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cs_off_attribute *cti_attr =3D container_of(attr, struct=
 cs_off_attribute, attr);
> > @@ -189,6 +188,53 @@ static ssize_t coresight_cti_reg_show(struct devic=
e *dev,
> >         return sysfs_emit(buf, "0x%x\n", val);
> >  }
> >
> > +/* Read registers with power check only (no enable check). */
> > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > +                                     struct device_attribute *attr, ch=
ar *buf)
> > +{
> > +       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +       struct cs_off_attribute *cti_attr =3D container_of(attr, struct=
 cs_off_attribute, attr);
> > +       struct cti_config *cfg =3D &drvdata->config;
> > +       u32 val =3D 0;
> > +       int i, num;
> > +       ssize_t size =3D 0;
> > +
> > +       pm_runtime_get_sync(dev->parent);
> > +       raw_spin_lock(&drvdata->spinlock);
> > +       if (drvdata->config.hw_powered) {
> > +               switch (cti_attr->off) {
> > +               case CTICHINSTATUS:
> > +               case CTICHOUTSTATUS:
> > +               case ITCHINACK:
> > +               case ITCHOUT:
> > +               case ITCHOUTACK:
> > +               case ITCHIN:
> > +                       val =3D readl_relaxed(drvdata->base + cti_offse=
t(drvdata, cti_attr->off, 0));
> > +                       size +=3D sysfs_emit(buf, "0x%x\n", val);
> > +                       break;
> > +
> > +               case CTITRIGINSTATUS:
> > +               case CTITRIGOUTSTATUS:
> > +               case ITTRIGINACK:
> > +               case ITTRIGOUT:
> > +               case ITTRIGOUTACK:
> > +               case ITTRIGIN:
> > +                       num =3D (cfg->nr_trig_max - 1) / 32;
> > +                       for (i =3D 0; i <=3D num; i++) {
> > +                               val =3D readl_relaxed(drvdata->base +
> > +                                               cti_offset(drvdata, cti=
_attr->off, i));
> > +                               size +=3D sysfs_emit_at(buf, size, "0x%=
x ", val);
> > +                       }
> > +                       if (size > 0)
> > +                               buf[size - 1] =3D '\n';
> > +                       break;
> > +               }
> > +       }
> > +       raw_spin_unlock(&drvdata->spinlock);
> > +       pm_runtime_put_sync(dev->parent);
> > +       return size;
> > +}
> > +
> >  /* Write registers with power check only (no enable check). */
> >  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *d=
ev,
> >                                                       struct device_att=
ribute *attr,
> > @@ -197,19 +243,45 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cs_off_attribute *cti_attr =3D container_of(attr, struct=
 cs_off_attribute, attr);
> >         unsigned long val =3D 0;
> > +       int num, i;
> >
> >         if (kstrtoul(buf, 0, &val))
> >                 return -EINVAL;
> >
> >         pm_runtime_get_sync(dev->parent);
> >         raw_spin_lock(&drvdata->spinlock);
> > -       if (drvdata->config.hw_powered)
> > -               cti_write_single_reg(drvdata, cti_attr->off, val);
> > +       if (drvdata->config.hw_powered) {
> > +               switch (cti_attr->off) {
> > +               case ITCHINACK:
> > +               case ITCHOUT:
> > +                       cti_write_single_reg(drvdata, cti_offset(drvdat=
a, cti_attr->off, 0), val);
> > +                       break;
> > +
> > +               case ITTRIGINACK:
> > +               case ITTRIGOUT:
> > +               case ITTRIGOUTACK:
> > +                       num =3D val / 32;
>
> Why?
>
> > +                       i =3D val % 32;
>
> Why? - "val" is the 32 bit value you want ot put into a 32 bit register.
>
> > +                       for (i =3D 0; i <=3D num; i++)
> > +                               cti_write_single_reg(drvdata,
> > +                                                    cti_offset(drvdata=
, cti_attr->off, i), BIT(i));
>
> I cannot understand what this code is trying to do. Why is this
> attempting to write to multiple registers with some BIT(i) value
> rather than the input "val"
> e.g. The complete 32biut value "val" should be written to ITTRIGOUT -
> which is what the original code did. This breaks the original
> functionality
>
> Has this code been tested?
>
> > +                       break;
> > +               }
> > +       }
> > +
> >         raw_spin_unlock(&drvdata->spinlock);
> >         pm_runtime_put_sync(dev->parent);
> >         return size;
> >  }
> >
> > +#define coresight_cti_mgmt_reg(name, offset)                          =
         \
> > +       (&((struct cs_off_attribute[]) {                               =
 \
> > +          {                                                           =
 \
> > +               __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL), =
 \
> > +               offset                                                 =
 \
> > +          }                                                           =
 \
> > +       })[0].attr.attr)
> > +
> >  #define coresight_cti_reg(name, offset)                               =
         \
> >         (&((struct cs_off_attribute[]) {                               =
 \
> >            {                                                           =
 \
> > @@ -237,17 +309,17 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >
> >  /* coresight management registers */
> >  static struct attribute *coresight_cti_mgmt_attrs[] =3D {
> > -       coresight_cti_reg(devaff0, CTIDEVAFF0),
> > -       coresight_cti_reg(devaff1, CTIDEVAFF1),
> > -       coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > -       coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> > -       coresight_cti_reg(devid, CORESIGHT_DEVID),
> > -       coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> > -       coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > -       coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > -       coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > -       coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > -       coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> > +       coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> > +       coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> > +       coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > +       coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> > +       coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> > +       coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> > +       coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > +       coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > +       coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > +       coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > +       coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
> >         NULL,
> >  };
> >
> > @@ -284,11 +356,12 @@ static ssize_t cti_reg32_show(struct device *dev,=
 char *buf,
> >   * if reg_offset >=3D 0 then write through if enabled.
> >   */
> >  static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> > -                              size_t size, u32 *pcached_val, int reg_o=
ffset)
> > +                              size_t size, u32 *pcached_val, int index=
)
> >  {
> >         unsigned long val;
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cti_config *config =3D &drvdata->config;
> > +       int reg_offset;
> >
> >         if (kstrtoul(buf, 0, &val))
> >                 return -EINVAL;
> > @@ -298,6 +371,7 @@ static ssize_t cti_reg32_store(struct device *dev, =
const char *buf,
> >         if (pcached_val)
> >                 *pcached_val =3D (u32)val;
> >
> > +       reg_offset =3D cti_offset(drvdata, index, 0);
> >         /* write through if offset and enabled */
> >         if ((reg_offset >=3D 0) && cti_active(config))
> >                 cti_write_single_reg(drvdata, reg_offset, val);
> > @@ -306,14 +380,14 @@ static ssize_t cti_reg32_store(struct device *dev=
, const char *buf,
> >  }
> >
> >  /* Standard macro for simple rw cti config registers */
> > -#define cti_config_reg32_rw(name, cfgname, offset)                    =
 \
> > +#define cti_config_reg32_rw(name, cfgname, index)                     =
 \
>
> Why the pointless change of a parameter name in a macro?
>
> >  static ssize_t name##_show(struct device *dev,                        =
 \
> >                            struct device_attribute *attr,              =
 \
> >                            char *buf)                                  =
 \
> >  {                                                                     =
 \
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);  =
   \
> >         return cti_reg32_show(dev, buf,                                =
 \
> > -                             &drvdata->config.cfgname, offset);       =
 \
> > +                             &drvdata->config.cfgname, index);        =
 \
> >  }                                                                     =
 \
> >                                                                        =
 \
> >  static ssize_t name##_store(struct device *dev,                       =
         \
> > @@ -322,7 +396,7 @@ static ssize_t name##_store(struct device *dev,    =
                         \
> >  {                                                                     =
 \
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);  =
   \
> >         return cti_reg32_store(dev, buf, size,                         =
 \
> > -                              &drvdata->config.cfgname, offset);      =
 \
> > +                              &drvdata->config.cfgname, index);       =
 \
> >  }                                                                     =
 \
> >  static DEVICE_ATTR_RW(name)
> >
> > @@ -389,7 +463,7 @@ static ssize_t inen_store(struct device *dev,
> >
> >         /* write through if enabled */
> >         if (cti_active(config))
> > -               cti_write_single_reg(drvdata, CTIINEN(index), val);
> > +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIIN=
EN, index), val);
> >         raw_spin_unlock(&drvdata->spinlock);
> >         return size;
> >  }
> > @@ -428,7 +502,7 @@ static ssize_t outen_store(struct device *dev,
> >
> >         /* write through if enabled */
> >         if (cti_active(config))
> > -               cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> > +               cti_write_single_reg(drvdata, cti_offset(drvdata, CTIOU=
TEN, index), val);
> >         raw_spin_unlock(&drvdata->spinlock);
> >         return size;
> >  }
> > @@ -711,10 +785,8 @@ static ssize_t trigout_filtered_show(struct device=
 *dev,
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cti_config *cfg =3D &drvdata->config;
> >         int size =3D 0, nr_trig_max =3D cfg->nr_trig_max;
> > -       unsigned long mask =3D cfg->trig_out_filter;
> >
> > -       if (mask)
> > -               size =3D bitmap_print_to_pagebuf(true, buf, &mask, nr_t=
rig_max);
> > +       size =3D bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filte=
r, nr_trig_max);
> >         return size;
> >  }
> >  static DEVICE_ATTR_RO(trigout_filtered);
> > @@ -926,9 +998,8 @@ static ssize_t trigin_sig_show(struct device *dev,
> >         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->v=
ar;
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cti_config *cfg =3D &drvdata->config;
> > -       unsigned long mask =3D con->con_in->used_mask;
> >
> > -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_m=
ax);
> > +       return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mas=
k, cfg->nr_trig_max);
> >  }
> >
> >  static ssize_t trigout_sig_show(struct device *dev,
> > @@ -940,9 +1011,8 @@ static ssize_t trigout_sig_show(struct device *dev=
,
> >         struct cti_trig_con *con =3D (struct cti_trig_con *)ext_attr->v=
ar;
> >         struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >         struct cti_config *cfg =3D &drvdata->config;
> > -       unsigned long mask =3D con->con_out->used_mask;
> >
> > -       return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_m=
ax);
> > +       return bitmap_print_to_pagebuf(true, buf, con->con_out->used_ma=
sk, cfg->nr_trig_max);
> >  }
> >
> >  /* convert a sig type id to a name */
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtr=
acing/coresight/coresight-cti.h
> > index 8362a47c939c..7d052e76d116 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.h
> > +++ b/drivers/hwtracing/coresight/coresight-cti.h
> > @@ -18,46 +18,42 @@
> >
> >  struct fwnode_handle;
> >
> > -/*
> > - * Device registers
> > - * 0x000 - 0x144: CTI programming and status
> > - * 0xEDC - 0xEF8: CTI integration test.
> > - * 0xF00 - 0xFFC: Coresight management registers.
> > - */
> > -/* CTI programming registers */
> > -#define CTICONTROL             0x000
> > -#define CTIINTACK              0x010
> > -#define CTIAPPSET              0x014
> > -#define CTIAPPCLEAR            0x018
> > -#define CTIAPPPULSE            0x01C
> > -#define CTIINEN(n)             (0x020 + (4 * n))
> > -#define CTIOUTEN(n)            (0x0A0 + (4 * n))
> > -#define CTITRIGINSTATUS                0x130
> > -#define CTITRIGOUTSTATUS       0x134
> > -#define CTICHINSTATUS          0x138
> > -#define CTICHOUTSTATUS         0x13C
> > -#define CTIGATE                        0x140
> > -#define ASICCTL                        0x144
> > -/* Integration test registers */
> > -#define ITCHINACK              0xEDC /* WO CTI CSSoc 400 only*/
> > -#define ITTRIGINACK            0xEE0 /* WO CTI CSSoc 400 only*/
> > -#define ITCHOUT                        0xEE4 /* WO RW-600 */
> > -#define ITTRIGOUT              0xEE8 /* WO RW-600 */
> > -#define ITCHOUTACK             0xEEC /* RO CTI CSSoc 400 only*/
> > -#define ITTRIGOUTACK           0xEF0 /* RO CTI CSSoc 400 only*/
> > -#define ITCHIN                 0xEF4 /* RO */
> > -#define ITTRIGIN               0xEF8 /* RO */
> > -/* management registers */
> > -#define CTIDEVAFF0             0xFA8
> > -#define CTIDEVAFF1             0xFAC
> > -
>
> Do not remove these from this file. Use them in the .c file to
> populate the offset array. See above comments
>
>
> >  /*
> >   * CTI CSSoc 600 has a max of 32 trigger signals per direction.
> >   * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> >   * Max of in and out defined in the DEVID register.
> >   * - pick up actual number used from .dts parameters if present.
> >   */
> > -#define CTIINOUTEN_MAX         32
> > +#define CTIINOUTEN_MAX         128
> > +
> > +#define CTICONTROL             0x000
> > +
> > +/* management registers */
> > +#define CTIDEVAFF0             0xFA8
> > +#define CTIDEVAFF1             0xFAC
> > +
> > +enum cti_offset_index {
> > +       CTIINTACK,
> > +       CTIAPPSET,
> > +       CTIAPPCLEAR,
> > +       CTIAPPPULSE,
> > +       CTIINEN,
> > +       CTIOUTEN,
> > +       CTITRIGINSTATUS,
> > +       CTITRIGOUTSTATUS,
> > +       CTICHINSTATUS,
> > +       CTICHOUTSTATUS,
> > +       CTIGATE,
> > +       ASICCTL,
> > +       ITCHINACK,
> > +       ITTRIGINACK,
> > +       ITCHOUT,
> > +       ITTRIGOUT,
> > +       ITCHOUTACK,
> > +       ITTRIGOUTACK,
> > +       ITCHIN,
> > +       ITTRIGIN,
> > +};
> >
> >  /**
> >   * Group of related trigger signals
> > @@ -68,7 +64,7 @@ struct fwnode_handle;
> >   */
> >  struct cti_trig_grp {
> >         int nr_sigs;
> > -       u32 used_mask;
> > +       DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
> >         int sig_types[];
> >  };
> >
> > @@ -147,9 +143,10 @@ struct cti_config {
> >         bool hw_powered;
> >
> >         /* registered triggers and filtering */
> > -       u32 trig_in_use;
> > -       u32 trig_out_use;
> > -       u32 trig_out_filter;
> > +       DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
> > +       DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
> > +       DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
> > +
> >         bool trig_filter_enable;
> >         u8 xtrig_rchan_sel;
> >
> > @@ -180,6 +177,7 @@ struct cti_drvdata {
> >         struct cti_config config;
> >         struct list_head node;
> >         void (*csdev_release)(struct device *dev);
> > +       bool is_extended_cti;
>
> use an enum type here - e.g. enum cti_subtype {  ARM_STD_CTI, QCOM_CTI };
>
>
> >  };
> >
> >  /*
> > @@ -232,6 +230,7 @@ int cti_create_cons_sysfs(struct device *dev, struc=
t cti_drvdata *drvdata);
> >  struct coresight_platform_data *
> >  coresight_cti_get_platform_data(struct device *dev);
> >  const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
> > +u32 cti_offset(struct cti_drvdata *drvdata, int index, int num);
> >
> >  /* cti powered and enabled */
> >  static inline bool cti_active(struct cti_config *cfg)
> > --
> > 2.25.1
> >
>
> Regards
>
> Mike
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

Further to the ID regs issues, we also have the following clarificaiton :-

" The CIDRn registers I expect to be common across all CoreSight
components. However it's the PIDRn registers that really matter
because that's where the designer+partnum are indicated.

  - CIDRn values are the same for all CoreSight compliant components

  - DEVARCH needs to be different between Arm CTI and QC CTI because
the programmers model is different between the 2 CTIs.

  - DEVTYPE I don't care much for (DEVARCH is more useful).

  - PIDRn needs to indicate this is a QC designed part with a
QC-allocated part number."

Regards

Mike



--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


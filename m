Return-Path: <linux-arm-msm+bounces-79848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7DC245BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C3AC34EC4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F473358D3;
	Fri, 31 Oct 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkPXHqOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B733555C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761905345; cv=none; b=cbNOd+fU37QakkQGJh1gBlc5MD17bzT37tNGbCyedDy1nBoovDJUHiqlcm1FCGKkip3n9vGNJR53IJ8aGBKTwKdBR9zHxxBpgqeNUL0jsYNhylHZ0NAMIiRL9ll4gPNLEfRhxR9MRT1c2tImR7p2G4KyDYIq6ZhX7AwkErJEwXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761905345; c=relaxed/simple;
	bh=Xzd51xlJaSmQgl9Tj3pF/RhCkZgXAzz3k3XtQoaryYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZFD7wzAr7TixOB56P0fiFUB0Jhyb1ejZ/dI9bsoYaT40wOJC53fhj/LueQgkmj5jIKLZpyEr8bOUf7S9EvP6bgzX1cEOytK7VLFN/+Pzm+yY9L6EW0ZMJ4CK3HntHqTO5oo2vWEB/UiClRX4rpRPBwHLoPD0KkXr5uA5pxAOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkPXHqOY; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8a84ba42abbso231118685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761905339; x=1762510139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oKJ419SphFn3v5dZbVHdxqKQCZyJC9rV+gwaL7KSwk=;
        b=FkPXHqOYn02BSAR3ODqc0hLNaXA+Bkw9zvewgtcw/59k9yvbJSH4ZhXLyxqkDgU8CZ
         bPvt6nNCBPkT8uLTSZ7+uo/glueSZUO4MMY69ntPSNlj+Ps5NpenO0Wm8ncg2qSKC0Md
         F8nnaWcVhxbz86TKSR709Mb1vCjbn82nxJ0/GEZKTU6jhUf+dnTscrveenn0QS48judo
         UVc92tDZnGAR/xNVQP+twSLslKbzXlH1+PlmNh8EpEYZGFhF+vILJJeVsz0lqI14LvwJ
         Twlhai8bOdESJ99AjzevPfJ+G1F1nCEzPNIRwagVMViHhzaVzUfhffZpvp4NW9gLaW7j
         3pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905339; x=1762510139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oKJ419SphFn3v5dZbVHdxqKQCZyJC9rV+gwaL7KSwk=;
        b=KLAl7TYvappvTAVdQICfpxVFCngdFPWGQ6n0Qb3wzpjE/0KSFw6uW36VlGiF1e5Cua
         /5in3E+rTDm+RIfOmdwOPV1RBpQpWNVMD3pNb5FmZLhEZEcwMAI/RQ8FyBGq8f7TKrol
         k1SyJK903xCQ8XnSrxrYfyeJ2AGdKuiPB5IqJfickM/+rmtXel0+KJsc8mZ8dsxQigYG
         8bGPoOOmRX6seRMo4vu7A3nwdgMEk0x3qR+9JtxIgsBjnUC/Jmm+CEfYx3Axn4rt2rQ2
         njDEYspXWIRuf+4+9a2PGsIuVkso8VHQEBvrVPzKdh8PukemEyKVJn1bsk1uTFQKrSQQ
         5yKw==
X-Forwarded-Encrypted: i=1; AJvYcCXC/1eYJQ2FaN/OGhHu2wsz75Gy7thb86YQ3Z8YKSVUxzDAFtXhtBwaF4yTANdNjc5SANDBpPokGYosAw5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ACMbMzu27g8FoPK/4GArUFQ9zHYuOmUtS9wo2cPDKAimju5g
	yTBAfXJj8NhL7v09SMuGoCXerrU6bplXNriSyPzELTSrvIjOFRrhmEGc5PAfHDw5OVmPHyAsWOL
	3uRAOT/IuKZ6aAmdi6SRfumsXij9o5cZj1iTFp23W7Q==
X-Gm-Gg: ASbGnctowxxTcU1S9SMo6bmyHcDnElTotQKu2/GrT1+o9lbc9gau/TK8yntGofYSSKQ
	np4UNWov1Aa7LTIRQIEmO+z/bvQEuIJhtQg89ZlLVL/2RSHr9Vp+Pxhbnx3ZVemdMhslvS0es2G
	/lgJiyaV4/Vy4Gvb6CGJSJOIVaLtexqDy0iEJM0u1JlpmrerVPVBXPRc56gCk7GzlPV3R9w85od
	jr8hLkHv2klD+A2t+5yb9K2rO9/HxZb1YAe9iTMTtZBx2Brvsz9hNYqkfwp/IBcJMF62NSjK/ui
	piY8UwJCH+GSPhL3GKDQ+6S5hezs
X-Google-Smtp-Source: AGHT+IEmP8aVaz2sfeTrbPkLGNIsPSIFhj92Z5T0sISr8h5sMZI1UqjrNOGnVMEgrjLe+r3jIvWYyy9A8fpdQVBxHQY=
X-Received: by 2002:a05:620a:448a:b0:8a1:d55f:8c9c with SMTP id
 af79cd13be357-8ab9b59c446mr314553585a.71.1761905338746; Fri, 31 Oct 2025
 03:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com> <20251020-extended_cti-v5-2-6f193da2d467@oss.qualcomm.com>
In-Reply-To: <20251020-extended_cti-v5-2-6f193da2d467@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 31 Oct 2025 10:08:47 +0000
X-Gm-Features: AWmQ_bkscdZnWplmDTFS-aZJ3ATPsS00beiTQaxBA3zj7WHAy8xd0-BTe-jL-uk
Message-ID: <CAJ9a7VhRcVFc3ejXeUZTBAqmyqtuSyub_X0yk7JDinUJzmgMEQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Jinlong Mao <jinglong.mao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


On Mon, 20 Oct 2025 at 08:12, Yingchao Deng
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
>
> Signed-off-by: Jinlong Mao <jinglong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c  |  86 +++++++++--
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c | 174 ++++++++++++++++=
+-----
>  drivers/hwtracing/coresight/coresight-cti.h       |  43 +++++-
>  drivers/hwtracing/coresight/qcom-cti.h            |  29 ++++
>  4 files changed, 281 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/h=
wtracing/coresight/coresight-cti-core.c
> index 8c9cec832898..5330db7eecf1 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,6 +21,55 @@
>
>  #include "coresight-priv.h"
>  #include "coresight-cti.h"
> +#include "qcom-cti.h"
> +
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
>
>  /*
>   * CTI devices can be associated with a PE, or be connected to CoreSight
> @@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvda=
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
> @@ -214,6 +264,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>  /* DEVID[19:16] - number of CTM channels */
>  #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19)=
)
>
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, =
31))
> +
>  static int cti_set_default_config(struct device *dev,
>                                   struct cti_drvdata *drvdata)
>  {
> @@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_=
chan_op op,
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
> @@ -479,19 +532,19 @@ int cti_channel_setop(struct device *dev, enum cti_=
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
> @@ -894,6 +947,7 @@ static int cti_probe(struct amba_device *adev, const =
struct amba_id *id)
>         struct coresight_desc cti_desc;
>         struct coresight_platform_data *pdata =3D NULL;
>         struct resource *res =3D &adev->res;
> +       u32 devarch;
>
>         /* driver data*/
>         drvdata =3D devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -980,9 +1034,19 @@ static int cti_probe(struct amba_device *adev, cons=
t struct amba_id *id)
>         drvdata->csdev_release =3D drvdata->csdev->dev.release;
>         drvdata->csdev->dev.release =3D cti_device_release;
>
> +       /* qcom_cti*/

perhaps this comment could be "check architect value"?

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

Here extend string to "CTI Intialized; subtype=3D%d\n"
>         return 0;
>
>  pm_release:
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/=
hwtracing/coresight/coresight-cti-sysfs.c
> index a9df77215141..88fd1c9c0101 100644
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

This needs to be inside the spin lock

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

this needs to be inside the spinlock

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

All the other selection indexes are of the form xxx_sel - this should
be something along the lines of "ext_reg_sel" for consistency

Additionally this information needs to appear as an entry in the
documentation file
Documentation/ABI/testing/sysfs-bus-coresight-devices-cti so users are
aware of which registers this select relates to.

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

see above - cheange to ..._sel

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
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtrac=
ing/coresight/coresight-cti.h
> index 0bd71407ef34..034d6fd1590b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -57,7 +57,38 @@ struct fwnode_handle;
>   * Max of in and out defined in the DEVID register.
>   * - pick up actual number used from .dts parameters if present.
>   */
> -#define CTIINOUTEN_MAX         32
> +#define CTIINOUTEN_MAX         128
> +
> +/* Qcom CTI supports up to 128 triggers*/
> +enum cti_subtype {
> +       ARM_STD_CTI,
> +       QCOM_CTI,
> +};
> +
> +/* These registers are remapped in Qcom CTI*/
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
>  /**
>   * Group of related trigger signals
> @@ -149,6 +180,9 @@ struct cti_config {
>         bool trig_filter_enable;
>         u8 xtrig_rchan_sel;
>
> +       /* qcom_cti regs' index */
> +       u8 regs_idx;

rename to ..._sel as per comments above.

This value also needs to be reset in the chan_xtrigs_reset_store()
function in coresight-cti-sysfs.c

> +
>         /* cti cross trig programmable regs */
>         u8 ctiinout_sel;
>         u32 ctiappset;
> @@ -181,6 +215,8 @@ struct cti_drvdata {
>         struct cti_config config;
>         struct list_head node;
>         void (*csdev_release)(struct device *dev);
> +       enum cti_subtype subtype;
> +       const u32 *offsets;
>  };
>
>  /*
> @@ -234,6 +270,11 @@ struct coresight_platform_data *
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
> index 000000000000..eaa551ff118a
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#define ARCHITECT_QCOM 0x477
> +

This value which is an 11 bit value, in bits 31:21 of the DEVARCH
register,  is co-incidentally the same as the top 12 bits 31:20 of the
ARM DEVARCH register for standard ARM component.

Bit 20 of DEVARCH is 1'b1 for present - the 11 bits 31:21 make the
archiitect value. ARMs assigned JEDEC architect value 11h'23B which
when shifted left by one and  ORed with bit 20
gives a value of 12h'477 for bits 31:20.

Assuming that your 11 bit JEDEC architect value is 0x477 then the top
12 bits of the qcom devarch register must be 12h'8EF

I'd like to be sure that no errors have been made, please confim that
bits 31:20 in your DEVARCH register are 0x8EF, and this patch has been
tested as working on your system.

Thanks and Regards

Mike

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
>
> --
> 2.43.0
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


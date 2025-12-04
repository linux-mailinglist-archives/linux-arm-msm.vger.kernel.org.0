Return-Path: <linux-arm-msm+bounces-84323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE4CA2EB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5338D30046FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E011E313E34;
	Thu,  4 Dec 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umqq70Sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C82F7AD4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839290; cv=none; b=oi2Ec1/KlARYMk/8eEki1aYqRYnIeHJjV8qMa1uUaBN00rlGdlkQ3IjdaoZsPUAXWKI/cfcXcM5b+Kc4iDpgvzs8EzXMb2h2vr6mxsMVonqPIso494suYrWFpw4YI8et6dQpxVRJngrEJYgYa3W3yA/jW5tjqs0MdaIn+ZQu4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839290; c=relaxed/simple;
	bh=qHLeMxM+H5tTatToPBSL5naqHUOhGcSfxb0nU4fYjFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODTkp09eYWkm5ICPl+COwZwp+CD3ihJq7ENEe/ug6iGAw++FpW59AbzpVotD3ln03zair/th+TeQgvQqyWrsfndhBeSC1tG+bdzTh7eUsQLDWkW/+EI65NkoFHKpL72YQRK6RvAD3VFRIFZCnwEXZ8AxrMMx9cNblgnkkREEjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umqq70Sm; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b22b1d3e7fso61927385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764839287; x=1765444087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqw+EebIwHp46cQfn/N8sGyh7QJ3WgTvVo/7sX+WXxA=;
        b=umqq70SmOJ9+n+lk1LmlYM3ZAoeGvcNyKXWQhc7B0EPUnMSL2lbOWWdN9N86lFG7I0
         lXsjdy/6OBOF986/y2Xh8xRFMq70BSPxOkrR1mzisuXXSSzB/qrM9+a+KPYeA3voL5Ze
         cSz1SaXBTKQFsI3l1ZIlob4za+4YFFUwb9V+gRKxcjLXMPCHbdricwX5bhzm6qBvr2Zs
         xQWzSTavj6EAQm59QoZ3317OEh3qodT6QmV61vrYViJGshazPPeOkzH6jFDQTbkvBOIf
         PRmbWbWK2MRYDPgEemgGfat/sZVqC894V29D07rJhkFhe38qiZ4sJ42dbXB1oFb7FkUn
         HWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839287; x=1765444087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sqw+EebIwHp46cQfn/N8sGyh7QJ3WgTvVo/7sX+WXxA=;
        b=RuHXHGTXExroKuRwXJFJRUmSEzH1R+29i7/c6qNkBaYxjE/XozXQJkdUid4HDBpHvG
         Ng+Uwi7BuyOsugB8J+OT1ucLEZbhd2lAduF7QCwRl5PuLxrczhIg+a1P3VENyErXPhaH
         xRRe2mvPtI6MFOAPGjS8Xg23p/hFvmqrniMWdJ8W9jyy0uLWno1oX6HxCQAbQ403kxbi
         FTlsK5V1smM6E9pcRJ/5eidw6E2vJ0mV5hJ+cEXEf6O0QJKc4W+J3uKkDMaoMdEanmOw
         uXZVGodsve5YeLseb8R3dQBUwVHSw7RxmDr8UYKrxBhBaEhv9SdbneSa+eDpv6pITXk9
         V86A==
X-Forwarded-Encrypted: i=1; AJvYcCUbfJRwdhfARCz3ykaqWgGsRX/8r2opQN8AIVdYOaCEPDsYtm5y4Khe7zWp/ZAA2Pq+b0jlzbIto/j+JXBB@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzcrQzYG263zvkLsdmSwp1U6q7Tz9fR5NYMAtNdYT12fZr6Bh
	LWwtM+jTSTThR7csfUWMKMruBRkGfFopY4xyYihVxLqaDnSgcNPCeL9DYfMqMrts+zqvRgBqULQ
	DwOy4zrqm1zo1pxoajju6/dj/5CzTgcfInbRw3CT/DQ==
X-Gm-Gg: ASbGncuhYj4gpRtDT6x2QEJeR44xLKMLc2vfxiOZp+diCCFTmse5LHZd6O8+gha259Y
	zd9cMBuLPfOMbigUPIRsUOxdr/W+ZSvHnYmnYZoINDpQzR/Jus8+k2RodoELI6XDAH2brsXogUt
	yYMBadNyE7Y6WC2fPFyBMUg2VeDJ7XpqgH9EZOXKVmN3zU0jCYbUlhUjW2eKKNrEVrAfz55XM6u
	6tjuPE6tjl1U31NvtHqQTAm+HMu3JpQvOpvvc9smad13Tx2Naq0PABEILmglmU7hPrvT+8ZzmWY
	rPdSyrROAuyqt3SCM/9Ww/FF6RPE
X-Google-Smtp-Source: AGHT+IE9J+bOQdFX1vMwn4fdSL2pnOXzcAuJ3OKNmZ6eUr+QFD4b99YSmQ+nbeCFM7/1kgizeTqGr2Ah5sVAU4Q7+8c=
X-Received: by 2002:a05:620a:45a6:b0:8b2:a3a9:f770 with SMTP id
 af79cd13be357-8b5e763d5fbmr739318585a.83.1764839287280; Thu, 04 Dec 2025
 01:08:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com> <20251203182944.GG724103@e132581.arm.com>
In-Reply-To: <20251203182944.GG724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 09:07:56 +0000
X-Gm-Features: AWmQ_bl6ZfAKDXx8EUDBO_mc3-_9slRhN7NYgBfyrNb1p1e_w6dSZcWNAtPxVe0
Message-ID: <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 3 Dec 2025 at 18:29, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Dec 02, 2025 at 02:42:21PM +0800, Yingchao Deng wrote:
> > The QCOM extended CTI is a heavily parameterized version of ARM=E2=80=
=99s CSCTI.
> > It allows a debugger to send to trigger events to a processor or to sen=
d
> > a trigger event to one or more processors when a trigger event occurs
> > on another processor on the same SoC, or even between SoCs. Qualcomm CT=
I
> > implementation differs from the standard CTI in the following aspects:
> >
> > 1. The number of supported triggers is extended to 128.
> > 2. Several register offsets differ from the CoreSight specification.
>
> I apologize for my late review of this series.  For easier maintenance
> later, I have several comments for register access.
>
> [...]
>
> > +static const u32 cti_normal_offset[] =3D {
> > +     [INDEX_CTIINTACK]               =3D CTIINTACK,
> > +     [INDEX_CTIAPPSET]               =3D CTIAPPSET,
> > +     [INDEX_CTIAPPCLEAR]             =3D CTIAPPCLEAR,
> > +     [INDEX_CTIAPPPULSE]             =3D CTIAPPPULSE,
> > +     [INDEX_CTIINEN]                 =3D CTIINEN(0),
> > +     [INDEX_CTIOUTEN]                =3D CTIOUTEN(0),
>
> I prefer to update the these two macros to CTIINENn and CTIOUTENn, as
> later we will not use CTIINEN(n) and CTIOUTEN(n) anymore.
>
> > +     [INDEX_CTITRIGINSTATUS]         =3D CTITRIGINSTATUS,
> > +     [INDEX_CTITRIGOUTSTATUS]        =3D CTITRIGOUTSTATUS,
> > +     [INDEX_CTICHINSTATUS]           =3D CTICHINSTATUS,
> > +     [INDEX_CTICHOUTSTATUS]          =3D CTICHOUTSTATUS,
> > +     [INDEX_CTIGATE]                 =3D CTIGATE,
> > +     [INDEX_ASICCTL]                 =3D ASICCTL,
> > +     [INDEX_ITCHINACK]               =3D ITCHINACK,
> > +     [INDEX_ITTRIGINACK]             =3D ITTRIGINACK,
> > +     [INDEX_ITCHOUT]                 =3D ITCHOUT,
> > +     [INDEX_ITTRIGOUT]               =3D ITTRIGOUT,
> > +     [INDEX_ITCHOUTACK]              =3D ITCHOUTACK,
> > +     [INDEX_ITTRIGOUTACK]            =3D ITTRIGOUTACK,
> > +     [INDEX_ITCHIN]                  =3D ITCHIN,
> > +     [INDEX_ITTRIGIN]                =3D ITTRIGIN,
> > +     [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> > +};
> > +
> > +static const u32 cti_extended_offset[] =3D {
> > +     [INDEX_CTIINTACK]               =3D QCOM_CTIINTACK,
> > +     [INDEX_CTIAPPSET]               =3D QCOM_CTIAPPSET,
> > +     [INDEX_CTIAPPCLEAR]             =3D QCOM_CTIAPPCLEAR,
> > +     [INDEX_CTIAPPPULSE]             =3D QCOM_CTIAPPPULSE,
> > +     [INDEX_CTIINEN]                 =3D QCOM_CTIINEN,
> > +     [INDEX_CTIOUTEN]                =3D QCOM_CTIOUTEN,
> > +     [INDEX_CTITRIGINSTATUS]         =3D QCOM_CTITRIGINSTATUS,
> > +     [INDEX_CTITRIGOUTSTATUS]        =3D QCOM_CTITRIGOUTSTATUS,
> > +     [INDEX_CTICHINSTATUS]           =3D QCOM_CTICHINSTATUS,
> > +     [INDEX_CTICHOUTSTATUS]          =3D QCOM_CTICHOUTSTATUS,
> > +     [INDEX_CTIGATE]                 =3D QCOM_CTIGATE,
> > +     [INDEX_ASICCTL]                 =3D QCOM_ASICCTL,
> > +     [INDEX_ITCHINACK]               =3D QCOM_ITCHINACK,
> > +     [INDEX_ITTRIGINACK]             =3D QCOM_ITTRIGINACK,
> > +     [INDEX_ITCHOUT]                 =3D QCOM_ITCHOUT,
> > +     [INDEX_ITTRIGOUT]               =3D QCOM_ITTRIGOUT,
> > +     [INDEX_ITCHOUTACK]              =3D QCOM_ITCHOUTACK,
> > +     [INDEX_ITTRIGOUTACK]            =3D QCOM_ITTRIGOUTACK,
> > +     [INDEX_ITCHIN]                  =3D QCOM_ITCHIN,
> > +     [INDEX_ITTRIGIN]                =3D QCOM_ITTRIGIN,
> > +     [INDEX_ITCTRL]                  =3D CORESIGHT_ITCTRL,
> > +};
>
> I saw CTI registers are within 4KiB (0x1000), we can don't convert
> standard regiserts and only convert to QCOM register based on the
> standard ones.  So you can drop the cti_normal_offset strucuture and
> only have a cti_reg_qcom_offset[] struct:
>
>   static const u32 cti_extended_offset[] =3D {
>         [CTIINTACK]             =3D QCOM_CTIINTACK,
>         [CTIAPPSET]             =3D QCOM_CTIAPPSET,
>         [CTIAPPCLEAR]           =3D QCOM_CTIAPPCLEAR,
>         [CTIAPPPULSE]           =3D QCOM_CTIAPPPULSE,
>         [CTIINEN]               =3D QCOM_CTIINEN,
>         ...
>   };
>

I suggested the dual offset approach a couple of patchset revisions
ago as it actually simplifies the code & makes it more efficient. The
offset array in use is set during probe and the remaining code is then
common to both without lots of "if qcom else " occurences.

Regards

Mike

> Then you could create two helpers for register address:
>
>     static void __iomem *cti_reg_addr_with_nr(struct cti_drvdata *drvdata=
,
>                                               u32 reg, u32 nr)
>     {
>         /* convert to qcom specific offset */
>         if (unlikely(drvdata->is_qcom_cti))
>             reg =3D cti_extended_offset[reg];
>
>         return drvdata->base + reg + sizeof(u32) * nr;
>     }
>
>     static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 re=
g)
>     {
>         return cti_reg_addr_with_nr(drvdata, reg, 0);
>     }
>
> >  /*
> >   * CTI devices can be associated with a PE, or be connected to CoreSig=
ht
> > @@ -70,15 +119,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drv=
data)
> >
> >       /* write the CTI trigger registers */
> >       for (i =3D 0; i < config->nr_trig_max; i++) {
> > -             writel_relaxed(config->ctiinen[i], drvdata->base + CTIINE=
N(i));
> > +             writel_relaxed(config->ctiinen[i],
> > +                            drvdata->base + cti_offset(drvdata, INDEX_=
CTIINEN, i));
>
> writel_relaxed(config->ctiinen[i],
>                cti_reg_addr_with_nr(drvdata, CTIINENn, i));
>
> And apply for the same cases below.
>
> >       /* other regs */
> > -     writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> > -     writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> > -     writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> > +     writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdat=
a, INDEX_CTIGATE, 0));
>
> writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
>
> And apply for the same cases below.
>
> [...]
>
> > @@ -394,8 +447,8 @@ int cti_channel_trig_op(struct device *dev, enum ct=
i_chan_op op,
> >
> >       /* update the local register values */
> >       chan_bitmask =3D BIT(channel_idx);
> > -     reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? CTIINEN(trigger_id=
x) :
> > -                   CTIOUTEN(trigger_idx));
> > +     reg_offset =3D (direction =3D=3D CTI_TRIG_IN ? cti_offset(drvdata=
, INDEX_CTIINEN, trigger_idx) :
> > +                     cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx))=
;
>
> For readable, we can improve a bit with code alignment:
>
>   reg_offset =3D (direction =3D=3D CTI_TRIG_IN) ? cti_reg_addr_with_nr(dr=
vdata, CTIINENn, trigger_idx) :
>                                             cti_reg_addr_with_nr(drvdata,=
 CTIOUTENn, trigger_idx);
>
> [...]
>
> > @@ -981,9 +1035,28 @@ static int cti_probe(struct amba_device *adev, co=
nst struct amba_id *id)
> >       drvdata->csdev_release =3D drvdata->csdev->dev.release;
> >       drvdata->csdev->dev.release =3D cti_device_release;
> >
> > +     /* check architect value*/
> > +     devarch =3D readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> > +     if (CTI_DEVARCH_ARCHITECT(devarch) =3D=3D ARCHITECT_QCOM) {
> > +             drvdata->subtype =3D QCOM_CTI;
> > +             drvdata->offsets =3D cti_extended_offset;
>
> As a result, we can only set the is_qcom_cti flag:
>
>   drvdata->is_qcom_cti =3D true;
>
> > +             /*
> > +              * QCOM CTI does not implement Claimtag functionality as
> > +              * per CoreSight specification, but its CLAIMSET register
> > +              * is incorrectly initialized to 0xF. This can mislead
> > +              * tools or drivers into thinking the component is claime=
d.
> > +              *
> > +              * Reset CLAIMSET to 0 to reflect that no claims are acti=
ve.
> > +              */
> > +             writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
>
> I am confused for this.  If QCOM CTI does not implement claim tag,
> then what is the designed register at the offset CORESIGHT_CLAIMSET?
>
> Should you bypass all claim tag related operations for QCOM CTI case?
> (I don't see you touch anything for claim and declaim tags).
>
> > +     } else {
> > +             drvdata->subtype =3D ARM_STD_CTI;
> > +             drvdata->offsets =3D cti_normal_offset;
> > +     }
> > +
> >       /* all done - dec pm refcount */
> >       pm_runtime_put(&adev->dev);
> > -     dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> > +     dev_info(&drvdata->csdev->dev, "CTI initialized; subtype=3D%d\n",=
 drvdata->subtype);
>
> dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
>          drvdata->is_qcom_cti ? "QCOM" : "");
>
> >       return 0;
> >
> >  pm_release:
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/driver=
s/hwtracing/coresight/coresight-cti-sysfs.c
> > index a9df77215141..12a495382999 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > @@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] =3D =
{
> >
> >  /* register based attributes */
> >
> > -/* Read registers with power check only (no enable check). */
> > -static ssize_t coresight_cti_reg_show(struct device *dev,
> > -                        struct device_attribute *attr, char *buf)
> > +static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
> > +                                        struct device_attribute *attr,=
 char *buf)
> >  {
> >       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> > @@ -189,6 +188,40 @@ static ssize_t coresight_cti_reg_show(struct devic=
e *dev,
> >       return sysfs_emit(buf, "0x%x\n", val);
> >  }
> >
> > +/* Read registers with power check only (no enable check). */
> > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > +                                   struct device_attribute *attr, char=
 *buf)
> > +{
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +     struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> > +     u32 idx, val =3D 0;
> > +
> > +     pm_runtime_get_sync(dev->parent);
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     idx =3D drvdata->config.ext_reg_sel;
> > +     if (drvdata->config.hw_powered) {
> > +             switch (cti_attr->off) {
> > +             case INDEX_CTITRIGINSTATUS:
> > +             case INDEX_CTITRIGOUTSTATUS:
> > +             case INDEX_ITTRIGINACK:
> > +             case INDEX_ITTRIGOUT:
> > +             case INDEX_ITTRIGOUTACK:
> > +             case INDEX_ITTRIGIN:
> > +                     val =3D readl_relaxed(drvdata->base +
> > +                                         cti_offset(drvdata, cti_attr-=
>off, idx));
> > +                     break;
> > +
> > +             default:
> > +                     val =3D readl_relaxed(drvdata->base + cti_offset(=
drvdata, cti_attr->off, 0));
> > +                     break;
> > +             }
> > +     }
> > +
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     pm_runtime_put_sync(dev->parent);
> > +     return sysfs_emit(buf, "0x%x\n", val);
> > +}
> > +
> >  /* Write registers with power check only (no enable check). */
> >  static __maybe_unused ssize_t coresight_cti_reg_store(struct device *d=
ev,
> >                                                     struct device_attri=
bute *attr,
> > @@ -197,19 +230,39 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >       struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> >       struct cs_off_attribute *cti_attr =3D container_of(attr, struct c=
s_off_attribute, attr);
> >       unsigned long val =3D 0;
> > +     u32 idx;
> >
> >       if (kstrtoul(buf, 0, &val))
> >               return -EINVAL;
> >
> >       pm_runtime_get_sync(dev->parent);
> >       raw_spin_lock(&drvdata->spinlock);
> > -     if (drvdata->config.hw_powered)
> > -             cti_write_single_reg(drvdata, cti_attr->off, val);
> > +     idx =3D drvdata->config.ext_reg_sel;
> > +     if (drvdata->config.hw_powered) {
> > +             switch (cti_attr->off) {
> > +             case INDEX_ITTRIGINACK:
> > +             case INDEX_ITTRIGOUT:
> > +                     cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, idx), val);
> > +                     break;
> > +
> > +             default:
> > +                     cti_write_single_reg(drvdata, cti_offset(drvdata,=
 cti_attr->off, 0), val);
> > +                     break;
> > +             }
> > +     }
>
> For both coresight_cti_reg_show() and coresight_cti_reg_store(), can
> we always use "cti_attr->off" as the offset for regitser access?  I
> mean we don't need the extra config.ext_reg_sel, eventually any
> register we can calculate a offset for it.
>
> >       raw_spin_unlock(&drvdata->spinlock);
> >       pm_runtime_put_sync(dev->parent);
> >       return size;
> >  }
> >
> > +#define coresight_cti_mgmt_reg(name, offset)                         \
> > +     (&((struct cs_off_attribute[]) {                                \
> > +        {                                                            \
> > +             __ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),  \
> > +             offset                                                  \
> > +        }                                                            \
> > +     })[0].attr.attr)
> > +
> >  #define coresight_cti_reg(name, offset)                               =
       \
> >       (&((struct cs_off_attribute[]) {                                \
> >          {                                                            \
> > @@ -237,17 +290,17 @@ static __maybe_unused ssize_t coresight_cti_reg_s=
tore(struct device *dev,
> >
> >  /* coresight management registers */
> >  static struct attribute *coresight_cti_mgmt_attrs[] =3D {
> > -     coresight_cti_reg(devaff0, CTIDEVAFF0),
> > -     coresight_cti_reg(devaff1, CTIDEVAFF1),
> > -     coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > -     coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
> > -     coresight_cti_reg(devid, CORESIGHT_DEVID),
> > -     coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
> > -     coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > -     coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > -     coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > -     coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > -     coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
> > +     coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
> > +     coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
> > +     coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
> > +     coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
> > +     coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
> > +     coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
> > +     coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
> > +     coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
> > +     coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
> > +     coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
> > +     coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
>
> I don't see any benefit for updating from coresight_cti_reg() to
> coresight_cti_mgmt_reg().  If really want to do this, should remove
> the macro coresight_cti_reg()?
>
> >       NULL,
> >  };
> >
> > @@ -258,13 +311,15 @@ static struct attribute *coresight_cti_mgmt_attrs=
[] =3D {
> >   * If inaccessible & pcached_val not NULL then show cached value.
> >   */
> >  static ssize_t cti_reg32_show(struct device *dev, char *buf,
> > -                           u32 *pcached_val, int reg_offset)
> > +                           u32 *pcached_val, int index)
>
> We don't need to change anything for this.  The passed "reg_offset"
> should be always a final offset, no matter for standard CTI or QCOM
> case, the driver directly uses the offset for register access.
>
> [...]
>
> > +/*
> > + * QCOM CTI supports up to 128 triggers, there are 6 registers need to=
 be
> > + * expanded to up to 4 instances, and ext_reg_sel can be used to indic=
ate
> > + * which one is in use.
> > + * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
> > + * ITTRIGIN, ITTRIGOUT,
> > + * ITTRIGINACK, ITTRIGOUTACK.
> > + */
> > +static ssize_t ext_reg_sel_show(struct device *dev,
> > +                             struct device_attribute *attr,
> > +                             char *buf)
> > +{
> > +     u32 val;
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     val =3D drvdata->config.ext_reg_sel;
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     return sprintf(buf, "%d\n", val);
> > +}
> > +
> > +static ssize_t ext_reg_sel_store(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              const char *buf, size_t size)
> > +{
> > +     unsigned long val;
> > +     struct cti_drvdata *drvdata =3D dev_get_drvdata(dev->parent);
> > +
> > +     if (kstrtoul(buf, 0, &val))
> > +             return -EINVAL;
> > +     if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
> > +             return -EINVAL;
> > +
> > +     raw_spin_lock(&drvdata->spinlock);
> > +     drvdata->config.ext_reg_sel =3D val;
> > +     raw_spin_unlock(&drvdata->spinlock);
> > +     return size;
> > +}
>
> As said, I don't think the trigger register is any different from
> other register access.  So the existed APIs would be sufficient.
>
> As a result, we don't need to add two above functions.
>
> Thanks,
> Leo



--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


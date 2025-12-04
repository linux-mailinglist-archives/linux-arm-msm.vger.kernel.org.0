Return-Path: <linux-arm-msm+bounces-84321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC47CA2E6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0F7430847A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C462EC090;
	Thu,  4 Dec 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJnEZcFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DB34CDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839056; cv=none; b=sOBe6NfNch4FOiJ7biMN57OHwfAu6i/hXNEYU7783z3ALfVMZ1WKVTiW5E9c0Ve7AM0O6yz/xMOYfwOhKGOZHEoaZ7rWJ+HJnhSO98yAa7E4vffuIvai3C0PctfXiH3rKxmYS5z26/Qmk5gTVXDV6BqOyior9E+gd4V4phU/kuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839056; c=relaxed/simple;
	bh=FOTBr4uwLu6qUeGRr5ZvumQV0EDRBfMk6TIFt5HGSdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bioz9L7gGDreHuid9PQ9gLLqLvhDmS/liCT28mVrnyBQ+H74AQAsPbggD6GtM8EsjnfTkVgLHKEuxIIF6GjptxDrmhGzF0cjiyTiDHRnFnfqQ+GhgG51k0+8dwtMqxtzAH6PvbhBvdROatYJwimjYI3AehWd0UYE9C8fZv4EzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJnEZcFx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b5c81bd953so59021985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764839054; x=1765443854; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AVHCpHtQVW7oVknV3GXOrLI7oUUH5Agyd8+pzjccO1Q=;
        b=wJnEZcFxFL0ffL8f86QptJHSN+r+pczD2k/4h67W2eeeklpjIlwwD79jcBoVpbyWMy
         aOi6yefDK9pDvN4x+WXuKFBAZrX8zLa8Tq9OBTbR73+OazONKFfsTvna73roqqpa/dSR
         MxjEfGm3D4o5u3hRvi8wW5/xhX+yxQAZK/yFJ+rHswN2urNmHO+G/q5q9gZbGo7rw9+L
         tVBn0ul5xkXTqCau9nwN8DCl+F5nQs/xwyAY8LxwJPikXKbSTU5c8oPcbMuS9+OxicGg
         1NS59u1Zg9Yah+qbE+Y7lXNQEQHG9fYSFwdjVC5WI/OvmtMXUps5xGZg+FlVjeUM5iG7
         Qkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839054; x=1765443854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVHCpHtQVW7oVknV3GXOrLI7oUUH5Agyd8+pzjccO1Q=;
        b=t6a/YurF8eJJOvwDpOsrtLMM0so7kncnRWwPdl0lhe8MK++aPmOMwR+vfCwQUupp3Q
         yq7rWEr8QjKn5yAXSSYTv78BH0fRkt/ioNgDeGFFzf3TQPjYCTW6rsfsamwkgD4DxWJL
         2noJXH1vzhUukxYUIwRx9gkmitN2CxBouyGOqJR9CsZ0gLao5a9MNbNk7FFKbMkmMitD
         SlhhIbHEMV+YcXpKoELIE3FI+fViuBgq/onuXuyo6tyd8xEpYGPF4RdAtyf11UQvpsVB
         tnYODGPa+QzgGxY2M92HRX/reLhUwT1p/06L3l/4qr/JzEIXmiIYNL2FV4kT4MakTzbr
         rSKw==
X-Forwarded-Encrypted: i=1; AJvYcCUELvdokH16zj/flZmutSOj/leqZhm5rPfyedEL6HXGUIdUqZElZOp1/3exM06uu5Z7nXtTizRY3P0KW2eu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VKT6R44KhTZC2mFEvmdicl3e2M6CAWa2/2dNUAqVZ0yui5K+
	5vydFeEizkTO8rJ3bFdB5s/HBFF71ofaHogyTjTWa2q/Igu6siCLjbR9jkqHpeHbEIsDAyZRMHc
	+hwxmtvnZSYn3CzHi4qfDD8RQ2OJE2xfDji8Pyut1kg==
X-Gm-Gg: ASbGncsMoZe8R61eNYLJCee2mDZTsLeoZLi3+laOQN5tX2DHo3Qvv9DN5nVhx/wHEks
	EOX2s6mphWr4eq2VecBz2CaEI6OPSqhw5Ebrpl1wLbh6XHjpImmUP70Lp1SytbnIWvqht93oUXx
	EeRX8nRHDhCY40VtBjIAjAu+yyWTFAnFrUQNpzJT56KBNfQJLJ5WEijVGFphu6eLtizfWqFI+a1
	A8/qCrV9CwwUdqvRSH4riaBBUGzPzh91f1YHwcRFYLFS0emeuh/y3puDxTaFKeyOoDSH0QuL3H1
	kEQVdTwtyzQONYHtYU03HXbZw1tx
X-Google-Smtp-Source: AGHT+IHAefwJNrPXIdvcD0VC8H+/6pCL2G+K3lmWUTMCJWZonyOLlPRSIG/rYZOBua+bNHZe4bQwsh7kr7hshZa3Yug=
X-Received: by 2002:a05:620a:472c:b0:8b1:7c0c:e292 with SMTP id
 af79cd13be357-8b61817298cmr291244285a.38.1764839053919; Thu, 04 Dec 2025
 01:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <20251204083802.GI724103@e132581.arm.com>
In-Reply-To: <20251204083802.GI724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 09:04:03 +0000
X-Gm-Features: AWmQ_bk3JsrCv_qVCQKeYV3ob7uzVgQRApMkr_SYTS_68B4wgVQYuo_3fUOblcg
Message-ID: <CAJ9a7VhNW6cQt_O6NX+99LXfo-t3mFTejzdNjWcyssbMrXR4OQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 4 Dec 2025 at 08:38, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Dec 03, 2025 at 06:29:44PM +0000, Coresight ML wrote:
>
> [...]
>
> > > +/* Read registers with power check only (no enable check). */
> > > +static ssize_t coresight_cti_reg_show(struct device *dev,
> > > +                                 struct device_attribute *attr, char *buf)
> > > +{
> > > +   struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > +   struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
> > > +   u32 idx, val = 0;
> > > +
> > > +   pm_runtime_get_sync(dev->parent);
> > > +   raw_spin_lock(&drvdata->spinlock);
> > > +   idx = drvdata->config.ext_reg_sel;
> > > +   if (drvdata->config.hw_powered) {
> > > +           switch (cti_attr->off) {
> > > +           case INDEX_CTITRIGINSTATUS:
> > > +           case INDEX_CTITRIGOUTSTATUS:
> > > +           case INDEX_ITTRIGINACK:
> > > +           case INDEX_ITTRIGOUT:
> > > +           case INDEX_ITTRIGOUTACK:
> > > +           case INDEX_ITTRIGIN:
>
> I read again and now I understand why you need "config.ext_reg_sel"
> as an index for these expending registers.
>

Having this index for these extended registers matches what we do for
the INEN and OUTEN registers. This gives the user a consistent
approach. We do not want the unnecessary attributes as  it will
increase the memory footprint for all cti instances, not just the qcom
ones.

The first patch in this series works to reduce the memory footprint by
only allocating resource based on the actual configuration. For
example for an ARM designed CTI with 8 trigger registers, we no longer
declare static 128 x 32 bit arrays for each of INEN and OUTEN which
were required by the original design.

Given that there can be 10s or 100s of CTIs in a large multicore
system, reducing the footprint to match the actual configuration, and
offering a level of compression by using an index + single file to
access a set of registers improves the efficiency of the driver.

Regards

Mike

> I think you should extend attrs for the new adding registers:
>
>   static struct attribute *coresight_cti_regs_attrs[] = {
>       ...
>       coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>       /* Qcom CTI only for triginstatus1/2/3 */
>       coresight_cti_reg(triginstatus1, CTITRIGINSTATUS + 0x4),
>       coresight_cti_reg(triginstatus2, CTITRIGINSTATUS + 0x8),
>       coresight_cti_reg(triginstatus3, CTITRIGINSTATUS + 0xc),
>       ...
>   }
>
> Then, you can add a is_visible() in coresight_cti_regs_group:
>
>   static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>                   struct attribute *attr, int n)
>   {
>           struct device *dev = container_of(kobj, struct device, kobj);
>           struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>           /* Mute QCOM CTI registers for standard CTI module */
>           if (!drvdata->is_qcom_cti) {
>               if (attr == &triginstatus1.attr ||
>                   attr == &triginstatus2.attr ||
>                   attr == &triginstatus3.attr)
>                   return 0;
>           }
>
>           return attr->mode;
>   }
>
>   static const struct attribute_group coresight_cti_regs_group = {
>           .attrs = coresight_cti_regs_attrs,
>           .name = "regs",
>           .is_visible = coresight_cti_regs_is_visible,
>   };
>
> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


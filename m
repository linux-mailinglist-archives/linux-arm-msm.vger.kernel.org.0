Return-Path: <linux-arm-msm+bounces-50374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CADA50308
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 16:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE18A16471D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB1924EAB2;
	Wed,  5 Mar 2025 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFMjqooi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8C24C073
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186727; cv=none; b=lQLVGrPiLfQyB72Pc0HEJaETfYaKFrSlCpWNDMUWZMGImzqut23ASiYfWKTODWM1mRx/wGg9UxoJsZono6z2NfO+TCju5B+zwWrG5qtpOxiQW0eUi5ZRCbIvuscPGkCOLb3HS/kkBtewhykur/i6qTWIdMl43sDWWw9pUtPZwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186727; c=relaxed/simple;
	bh=dJdBbkMM9ohkYe/OjEMHI0hoTw1r7wScB2ib/zta5i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozDfZFReKsO5KG5MPHbhUSsNzFndJUo5ohx11Ri5FgtkwQ+1ABymXv5L0TgPdncbykchjLSWsgOniOSoYWHI9dzias7BYeRvnxKHnhklDk2878lr36vB7ydQ+s4o+Mo3jISBqW+KQ43quBlJfP3mdACOea5PQqXyrm/YtigHBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFMjqooi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22185cddbffso16448045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186724; x=1741791524; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiyY4Jfkws2+Yh7A+5Ni8F0WDul36wTv6mtXeiT3z1I=;
        b=mFMjqooiKEi4BLN52WrXRALQTtC1M1Ka8l1p8mzcPTNaaIVkIMIH2s4JbXBmAdd7V/
         dSgPHsF5H5UcWeWFkIlTAk/L4EIHiAaJvAEWFXd1k6vglwr1Ab6ZwtZ4p1KoEYuF4k3C
         VSR+tynCNYFk+xOrXS9IPhKAHGTncLFF49ThAEeuWQ/1mY5objYCx9UTfehtv1HThJQG
         RbAOhmXvzm8gjRFNHhqtxKFw5F4y/T0ByGkt0Om4P9EY0fDlk9+g8TA3Jse17irfZ4Bd
         /5qcK7quwkD3DEYU733W1oRi/pmMGtUjkxhZddTGbqp4d7dnXwTMDDl3GwfNGGZj+aov
         yRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186724; x=1741791524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiyY4Jfkws2+Yh7A+5Ni8F0WDul36wTv6mtXeiT3z1I=;
        b=E61clCzFaGusWwi4iPPNkQKWVMEWFl6pSSJr1UV38eSrY+yxoxwMUqjEUMl8zqmAUP
         JCD+d+G5iPOY3qoIyFl73AfILR71wRQ1b8xJFTEOUCPhDx3M5M4XiZwj2FLgBQ+Fk50i
         oWVY2qWIN/ylBkjHnFo+rxnh5z7SfwOvPdbXnrHojEhsC59T6EMMpRuCNxR6oVM/V4mV
         PwML6DsFg5tTPvP17cVtDmXnX2lXzchvWc4LYUlL0uQaIebEKB3b3ZmFOx2mJ5kRdKNO
         X6fPDdYn3dyqJi785ky6gGWHQd/elJMnNhOLi/m9ccXk6VT4HqdLZzrLiqq99UgEWYBb
         qzuA==
X-Forwarded-Encrypted: i=1; AJvYcCXMGHOv3XvtYo59sAhaVB80gQNx1fT+i2dayxXAEG0tzNx0wGmJIt+0YcEbQOHEjrROdwX9pOiz1OL4igdf@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXMc8tvZAqoK/OwFatoWie0pYVDoOPgNkiDDFjtlMRL2LFMFm
	yfgFPItm1+oD3cXxnISObzwwT34MNUMsj5wXKtg/IPFsFq5d6Loqk0elJjdU3nVL207AXDry8xh
	AMMaQVUG/IiF8/luHEpz4CKCWLSRXYDV/tqBByQ==
X-Gm-Gg: ASbGncsCkUEWnDJxPzdkUfb9LIcLb1Fg4x2ImIptjNg5Ax3mC6r3utRQJXynCp7od8E
	GMaZTezU29HRN8y5x+10y9oGqIPzn2XKyeq9N1oVfhuzeeomrBbqPuRdH3GldAcsEWYDR5/6NWS
	UhYjsiaFJkduuOOu/EDCpxzH29n0Lb8inqesdue0rZRnzFGZoEgUAJUrmgsvk=
X-Google-Smtp-Source: AGHT+IF1hnn2H/pxvEMc/EjcD/ghIoVxFnVVgaEyIEjvBPxjwsVke/s5RkBWrSAm+hl8gp4lko2BStWZK+UW1NMcAhI=
X-Received: by 2002:a05:6a00:2381:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-73681de7f50mr5223947b3a.3.1741186724113; Wed, 05 Mar 2025
 06:58:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-3-quic_jiegan@quicinc.com> <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
 <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
In-Reply-To: <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 5 Mar 2025 14:58:31 +0000
X-Gm-Features: AQ5f1JqatIExzGnuaYLCoDTpPZMObEF4Hoa_g5f0yvOuR5hw69A2z3IKabeu33g
Message-ID: <CAJ9a7Vhx293H6r6HGwVOQ46PDu+sQ8LPONvAbwAtxGFt0ad+Ww@mail.gmail.com>
Subject: Re: [PATCH v15 02/10] Coresight: Add trace_id function to retrieving
 the trace ID
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi Jie

On Wed, 5 Mar 2025 at 13:27, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 3/5/2025 7:07 PM, Mike Leach wrote:
> > Hi,
> >
> > On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
> >>
> >> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
> >> the device's trace ID.
> >>
> >> Co-developed-by: James Clark <james.clark@linaro.org>
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >> Reviewed-by: James Clark <james.clark@linaro.org>
> >> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> >> ---
> >>   drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
> >>   drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
> >>   .../coresight/coresight-etm3x-core.c          |  1 +
> >>   .../coresight/coresight-etm4x-core.c          |  1 +
> >>   drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
> >>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
> >>   include/linux/coresight.h                     |  5 ++++
> >>   7 files changed, 71 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> >> index ab55e10d4b79..32aa07f4f8c1 100644
> >> --- a/drivers/hwtracing/coresight/coresight-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-core.c
> >> @@ -24,6 +24,7 @@
> >>   #include "coresight-etm-perf.h"
> >>   #include "coresight-priv.h"
> >>   #include "coresight-syscfg.h"
> >> +#include "coresight-trace-id.h"
> >>
> >>   /*
> >>    * Mutex used to lock all sysfs enable and disable actions and loading and
> >> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
> >>   }
> >>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
> >>
> >> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> >> +                              struct coresight_device *sink)
> >> +{
> >> +       int trace_id;
> >> +       int cpu = source_ops(csdev)->cpu_id(csdev);
> >> +
> >
> > This is a global funciton so need to check that this csdev is a
> > source,. and does provide a cpu  function before calling it.
> >
>
> Hi Mike,
>
> I put this function here because it's required by etm3x and etm4x. It's
> intended to be called only by ETM devices, which are definitely source
> devices and have a cpu function.
>

I fully understand the intent, but for a function that can be accessed
from anywhere, it is safer to validate input rather than assume any
caller will always respect the input conditions.
Lots of other places in the coresight drivers check that these
functions exist before calling them.

Regards

Mike

> Jie
>
> >> +       switch (mode) {
> >> +       case CS_MODE_SYSFS:
> >> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
> >> +               break;
> >> +       case CS_MODE_PERF:
> >> +               if (WARN_ON(!sink))
> >> +                       return -EINVAL;
> >> +
> >> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> >> +               break;
> >> +       default:
> >> +               trace_id = -EINVAL;
> >> +               break;
> >> +       }
> >> +
> >> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
> >> +               dev_err(&csdev->dev,
> >> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
> >> +
> >> +       return trace_id;
> >> +}
> >> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
> >> +
> >>   MODULE_LICENSE("GPL v2");
> >>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
> >>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
> >> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> >> index 9be53be8964b..b5692ba358c1 100644
> >> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> >> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> >> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
> >>          dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
> >>   }
> >>
> >> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                                __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct dummy_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->traceid;
> >> +}
> >> +
> >>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
> >>                                  void *data)
> >>   {
> >> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops dummy_source_cs_ops = {
> >> -       .source_ops = &dummy_source_ops,
> >> +       .trace_id       = dummy_source_trace_id,
> >> +       .source_ops     = &dummy_source_ops,
> >>   };
> >>
> >>   static const struct coresight_ops_sink dummy_sink_ops = {
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> index c103f4c70f5d..c1dda4bc4a2f 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> >> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops etm_cs_ops = {
> >> +       .trace_id       = coresight_etm_get_trace_id,
> >>          .source_ops     = &etm_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> index 2c1a60577728..cfd116b87460 100644
> >> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> >> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
> >>   };
> >>
> >>   static const struct coresight_ops etm4_cs_ops = {
> >> +       .trace_id       = coresight_etm_get_trace_id,
> >>          .source_ops     = &etm4_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> >> index b581a30a1cd9..aca25b5e3be2 100644
> >> --- a/drivers/hwtracing/coresight/coresight-stm.c
> >> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> >> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
> >>          }
> >>   }
> >>
> >> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                       __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct stm_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->traceid;
> >> +}
> >> +
> >>   static const struct coresight_ops_source stm_source_ops = {
> >>          .enable         = stm_enable,
> >>          .disable        = stm_disable,
> >>   };
> >>
> >>   static const struct coresight_ops stm_cs_ops = {
> >> +       .trace_id       = stm_trace_id,
> >>          .source_ops     = &stm_source_ops,
> >>   };
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> >> index 573da8427428..94c2201fc8d3 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> >> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
> >>          dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
> >>   }
> >>
> >> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> >> +                        __maybe_unused struct coresight_device *sink)
> >> +{
> >> +       struct tpda_drvdata *drvdata;
> >> +
> >> +       drvdata = dev_get_drvdata(csdev->dev.parent);
> >> +
> >> +       return drvdata->atid;
> >> +}
> >> +
> >>   static const struct coresight_ops_link tpda_link_ops = {
> >>          .enable         = tpda_enable,
> >>          .disable        = tpda_disable,
> >>   };
> >>
> >>   static const struct coresight_ops tpda_cs_ops = {
> >> +       .trace_id       = tpda_trace_id,
> >>          .link_ops       = &tpda_link_ops,
> >>   };
> >>
> >> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >> index c7cd5886c908..ce9a5e71b261 100644
> >> --- a/include/linux/coresight.h
> >> +++ b/include/linux/coresight.h
> >> @@ -335,6 +335,7 @@ enum cs_mode {
> >>          CS_MODE_PERF,
> >>   };
> >>
> >> +#define coresight_ops(csdev)   csdev->ops
> >>   #define source_ops(csdev)      csdev->ops->source_ops
> >>   #define sink_ops(csdev)                csdev->ops->sink_ops
> >>   #define link_ops(csdev)                csdev->ops->link_ops
> >> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
> >>   };
> >>
> >>   struct coresight_ops {
> >> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
> >> +                       struct coresight_device *sink);
> >>          const struct coresight_ops_sink *sink_ops;
> >>          const struct coresight_ops_link *link_ops;
> >>          const struct coresight_ops_source *source_ops;
> >> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
> >>
> >>   void coresight_remove_driver(struct amba_driver *amba_drv,
> >>                               struct platform_driver *pdev_drv);
> >> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
> >> +                              struct coresight_device *sink);
> >>   #endif         /* _LINUX_COREISGHT_H */
> >> --
> >> 2.34.1
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


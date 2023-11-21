Return-Path: <linux-arm-msm+bounces-1317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4A7F28E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92F9E1F22A97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A653B7AC;
	Tue, 21 Nov 2023 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BfDyY4/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A731739
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:26:03 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5ca5afb453aso17856287b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700558762; x=1701163562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aAmGxGkbN4emVuxJ9V8j1fYzlqaJg99Z9eieGlDghe8=;
        b=BfDyY4/EyX2h1Puuik3SLhv79IUgQYhpzy+txcVo8lSmuthjjhNs/5rvPIi0vSlUL5
         fFEp++QTUmv0yRG+ZFXJTFBuFs9Yhm3rdrbTSzxFwkC9/K2I5IUPLCizPJS6Rue3UhQM
         ZEatsbxch23cRmmEGmTRZAVxRz/1rfknu/saumvYHSgLcDntlUZPs/XmvpCIFCE/mLA4
         pcQOVZYCXUNaXXrzINTGZ88qD5hEpI5qPSYa9A7MErbhyjKc+kH9Vucg0A6ByWDUAbYe
         QY0YhFIMmsYHH+Zt+FKkikDX8Ai4IMVYDSybunfvCqQpx17wdj8ViDScTvK6Owco7890
         Im6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700558762; x=1701163562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAmGxGkbN4emVuxJ9V8j1fYzlqaJg99Z9eieGlDghe8=;
        b=RAkfXIJFzZt3dBLZI6Be/AuX6we/th3/0brL58BW5L7c03pkoHeomHFjqk26g6DMxP
         hEAM1jv1xo+0e8LPP7xQlcoVMrh6/CWvh1P71skjBgSduqwZ21L0CP+g6ZnvthtcRiiR
         u29nU78YD+FBn46/D6K1VS4V3oJaoY8Ekp19RgBEaXb7ZUtjSjhYFv7CIIMSXFmKCegj
         ijhWlUpKDWeOZ6Q0Z2Ge7QTBTE7f7X0bmZkDxCBOSllc0NPWzfnKnuj0xHSi/BacAdLC
         bFpwOFsnQfwuzxEk8eufkOb+EPe+6NzNLOiOLo6Dc3t+AGwcnAfcK7jJKCCrKjeTUYCP
         CVEA==
X-Gm-Message-State: AOJu0YwWyukb3+h9x2os2aQc/BJZceg2orvV6BZiwFV7zFz+YzjLfeEB
	6Q0rPqxWVhwznqRU74DelKevnmObKVCrpgZuE708wA==
X-Google-Smtp-Source: AGHT+IGDpZOujTVErxg8YRP1eiMChk1yVTqch6viH8ATBRlzMnxRNt6WwTrGQpK1/d7L0Ilf7fXU1J53n5NPS6xRjqo=
X-Received: by 2002:a81:5fc2:0:b0:5c6:9488:4c99 with SMTP id
 t185-20020a815fc2000000b005c694884c99mr8361218ywb.18.1700558762286; Tue, 21
 Nov 2023 01:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120132118.30473-1-brgl@bgdev.pl> <20231120132118.30473-3-brgl@bgdev.pl>
 <6e189833-b76b-030f-482e-d13e0d6d131a@quicinc.com>
In-Reply-To: <6e189833-b76b-030f-482e-d13e0d6d131a@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 21 Nov 2023 10:25:51 +0100
Message-ID: <CACMJSesJhkmLdoS0F3t+B-WMXRky0mHp=_2ho_Lb_GvfdJ7y9g@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 02/12] firmware: qcom: scm: enable the TZ mem allocator
To: Prasad Sodagudi <quic_psodagud@quicinc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Nov 2023 at 07:35, Prasad Sodagudi <quic_psodagud@quicinc.com> wrote:
>
>
> On 11/20/2023 5:21 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Select the TrustZone memory allocator in Kconfig and create a pool of
> > memory shareable with the TrustZone when probing the SCM driver.
> >
> > This will allow a gradual conversion of all relevant SCM calls to using
> > the dedicated allocator.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
> > ---
> >   drivers/firmware/qcom/Kconfig    |  1 +
> >   drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++++++
> >   2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> > index b80269a28224..237da40de832 100644
> > --- a/drivers/firmware/qcom/Kconfig
> > +++ b/drivers/firmware/qcom/Kconfig
> > @@ -7,6 +7,7 @@
> >   menu "Qualcomm firmware drivers"
> >
> >   config QCOM_SCM
> > +     select QCOM_TZMEM
> >       tristate
> >
> >   config QCOM_TZMEM
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 520de9b5633a..0d4c028be0c1 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -8,8 +8,10 @@
> >   #include <linux/completion.h>
> >   #include <linux/cpumask.h>
> >   #include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> >   #include <linux/export.h>
> >   #include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/firmware/qcom/qcom_tzmem.h>
> >   #include <linux/init.h>
> >   #include <linux/interconnect.h>
> >   #include <linux/interrupt.h>
> > @@ -20,9 +22,11 @@
> >   #include <linux/of_platform.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/reset-controller.h>
> > +#include <linux/sizes.h>
> >   #include <linux/types.h>
> >
> >   #include "qcom_scm.h"
> > +#include "qcom_tzmem.h"
> >
> >   static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
> >   module_param(download_mode, bool, 0);
> > @@ -41,6 +45,8 @@ struct qcom_scm {
> >       int scm_vote_count;
> >
> >       u64 dload_mode_addr;
> > +
> > +     struct qcom_tzmem_pool *mempool;
> >   };
> >
> >   struct qcom_scm_current_perm_info {
> > @@ -1887,6 +1893,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >       if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
> >               qcom_scm_disable_sdi();
> >
> > +     ret = qcom_tzmem_enable(__scm->dev);
> > +     if (ret)
> > +             return dev_err_probe(__scm->dev, ret,
> > +                                  "Failed to enable the TrustZone memory allocator\n");
>
> Based on my knowledge shmbridge is supported from sm8250 SoC in the
> firmware.
>
> sdm845 and couple of other targets may not have support shmbridge
> support and probe will be fail for these targets right?
>

We check the availability of the SHM Bridge calls on the platform at
run-time before enabling it. We'll simply fall-back to not using SHM
bridge in this case.

Bart

> > +
> > +     __scm->mempool = devm_qcom_tzmem_pool_new(__scm->dev, SZ_256K);
> > +     if (IS_ERR(__scm->mempool))
> > +             return dev_err_probe(__scm->dev, PTR_ERR(__scm->mempool),
> > +                                  "Failed to create the SCM memory pool\n");
> > +
> >       /*
> >        * Initialize the QSEECOM interface.
> >        *


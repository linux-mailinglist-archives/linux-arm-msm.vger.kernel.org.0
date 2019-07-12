Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF2266B9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 13:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfGLL3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 07:29:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39990 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfGLL3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 07:29:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 492CB60E7A; Fri, 12 Jul 2019 11:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562930982;
        bh=dlKEgVZ2/VEXZWtIBg+WViP5XwGI5ccigZZLFWyus8I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KsdqWnAhmjfNUwG5gbrA1kacEyiuocEEMkNNnPTEbS4udAk2JeLWeiMkyX/spyS/Y
         lZd3wYU3+lCZe+7dMXbR8B6o6NtlM1vGg77hyxiWOSOITvRwqW8M0v2GBdUhpq6tNu
         XnBY2LsxWqUF8WuMDjOwmQ09vYkxhHLjH7mk6HCA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4871A6030E;
        Fri, 12 Jul 2019 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562930981;
        bh=dlKEgVZ2/VEXZWtIBg+WViP5XwGI5ccigZZLFWyus8I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KvrDS3ETy+nEOlQ0tjLsR7MuHzv9SRbBj2+mVR8JmGEbUU5ZyGjbtPxWV8T9vZaCw
         TWSRF4KLkjNlg/xrWexjfzl252p9ZdJMEBr7FPTAt9yMSxASlSskyh3yCYC9sS67pS
         GkxhHLd62Xzblm3/9uD6InyXIfKof+mh6dRB4wPk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4871A6030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f51.google.com with SMTP id r12so8898396edo.5;
        Fri, 12 Jul 2019 04:29:41 -0700 (PDT)
X-Gm-Message-State: APjAAAXR3E0XvPWJay/5gki6+XSKwqhiNsWxGKxCQIn16r89a26kfuY/
        o9BZzDkvHq83qP+kh9UJPGAp78McXnG6VSOSIqU=
X-Google-Smtp-Source: APXvYqyCfHG1+UOqftVIO8VLRfpL/QnPOpFb2MjMy7NvnZFofL0QM1DgyXDNVgh84YWGrRUzNUQxMW/SJQjoBmvnngg=
X-Received: by 2002:a17:906:a39a:: with SMTP id k26mr7660426ejz.82.1562930979975;
 Fri, 12 Jul 2019 04:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190711110340.16672-1-vivek.gautam@codeaurora.org>
 <20190711110340.16672-2-vivek.gautam@codeaurora.org> <20190711160032.GR7234@tuxbook-pro>
In-Reply-To: <20190711160032.GR7234@tuxbook-pro>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Fri, 12 Jul 2019 16:59:28 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGXMYC5T3kNc1pXh4pkr_uxKOc5OLHWL+6HcwXvnJf_qA@mail.gmail.com>
Message-ID: <CAFp+6iGXMYC5T3kNc1pXh4pkr_uxKOc5OLHWL+6HcwXvnJf_qA@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: llcc-plat: Make the driver more generic
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        rishabhb@codeaurora.org, vnkgutta@codeaurora.org,
        Evan Green <evgreen@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,


Thanks for the review.

On Thu, Jul 11, 2019 at 9:29 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 11 Jul 04:03 PDT 2019, Vivek Gautam wrote:
>
> > - Remove 'sdm845' from names, and use 'plat' instead.
> > - Move SCT_ENTRY macro to header file.
> > - Create a new config structure to asssign to of-match-data.
> >
>
> I interpret the intention of these two patches as that you want to add
> some new platform without having to create one llcc-xyz.c per platform.

That's right. The intention is to avoid creating a new platform specific file.

>
> If that's the case then the only user of this macro would be in plat.c,
> so I don't see a reason for moving it to the header file.

Alright. Better to keep it in the driver file itself.

>
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > ---
> >  drivers/soc/qcom/llcc-plat.c       | 77 ++++++++++++--------------------------
> >  include/linux/soc/qcom/llcc-qcom.h | 45 ++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-plat.c b/drivers/soc/qcom/llcc-plat.c
> > index 86600d97c36d..31cff0f75b53 100644
> > --- a/drivers/soc/qcom/llcc-plat.c
> > +++ b/drivers/soc/qcom/llcc-plat.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> >   *
> >   */
> >
> > @@ -10,47 +10,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/soc/qcom/llcc-qcom.h>
> >
> > -/*
> > - * SCT(System Cache Table) entry contains of the following members:
>
> Should have caught this during previous review, but this comment simply
> duplicates the kerneldoc for struct llcc_slice_config.

Ok, i noticed it now. Will clean it up. I can remove this comment, and update
the one for struct llcc_slice_config.

>
> > - * usecase_id: Unique id for the client's use case
> > - * slice_id: llcc slice id for each client
> > - * max_cap: The maximum capacity of the cache slice provided in KB
> > - * priority: Priority of the client used to select victim line for replacement
> > - * fixed_size: Boolean indicating if the slice has a fixed capacity
> > - * bonus_ways: Bonus ways are additional ways to be used for any slice,
> > - *           if client ends up using more than reserved cache ways. Bonus
> > - *           ways are allocated only if they are not reserved for some
> > - *           other client.
> > - * res_ways: Reserved ways for the cache slice, the reserved ways cannot
> > - *           be used by any other client than the one its assigned to.
> > - * cache_mode: Each slice operates as a cache, this controls the mode of the
> > - *             slice: normal or TCM(Tightly Coupled Memory)
> > - * probe_target_ways: Determines what ways to probe for access hit. When
> > - *                    configured to 1 only bonus and reserved ways are probed.
> > - *                    When configured to 0 all ways in llcc are probed.
> > - * dis_cap_alloc: Disable capacity based allocation for a client
> > - * retain_on_pc: If this bit is set and client has maintained active vote
> > - *               then the ways assigned to this client are not flushed on power
> > - *               collapse.
> > - * activate_on_init: Activate the slice immediately after the SCT is programmed
> > - */
> > -#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
>
> This simply maps macro arguments 1:1 to struct members, there's no need
> for a macro for this.

Sure, will remove the macro.

>
> > -     {                                       \
> > -             .usecase_id = uid,              \
> > -             .slice_id = sid,                \
> > -             .max_cap = mc,                  \
> > -             .priority = p,                  \
> > -             .fixed_size = fs,               \
> > -             .bonus_ways = bway,             \
> > -             .res_ways = rway,               \
> > -             .cache_mode = cmod,             \
> > -             .probe_target_ways = ptw,       \
> > -             .dis_cap_alloc = dca,           \
> > -             .retain_on_pc = rp,             \
> > -             .activate_on_init = a,          \
> > -     }
> > -
> > -static struct llcc_slice_config sdm845_data[] =  {
> > +static const struct llcc_slice_config sdm845_data[] =  {
> >       SCT_ENTRY(LLCC_CPUSS,    1,  2816, 1, 0, 0xffc, 0x2,   0, 0, 1, 1, 1),
> >       SCT_ENTRY(LLCC_VIDSC0,   2,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
> >       SCT_ENTRY(LLCC_VIDSC1,   3,  512,  2, 1, 0x0,   0x0f0, 0, 0, 1, 1, 0),
> > @@ -71,30 +31,39 @@ static struct llcc_slice_config sdm845_data[] =  {
> >       SCT_ENTRY(LLCC_AUDHW,    22, 1024, 1, 1, 0xffc, 0x2,   0, 0, 1, 1, 0),
> >  };
> >
> > -static int sdm845_qcom_llcc_remove(struct platform_device *pdev)
> > +static const struct qcom_llcc_config sdm845_cfg = {
> > +     .sct_data       = sdm845_data,
> > +     .size           = ARRAY_SIZE(sdm845_data),
> > +};
> > +
> > +static int qcom_plat_llcc_remove(struct platform_device *pdev)
> >  {
> >       return qcom_llcc_remove(pdev);
> >  }
> >
> > -static int sdm845_qcom_llcc_probe(struct platform_device *pdev)
> > +static int qcom_plat_llcc_probe(struct platform_device *pdev)
> >  {
> > -     return qcom_llcc_probe(pdev, sdm845_data, ARRAY_SIZE(sdm845_data));
> > +     const struct qcom_llcc_config *cfg;
> > +
> > +     cfg = of_device_get_match_data(&pdev->dev);
> > +
> > +     return qcom_llcc_probe(pdev, cfg->sct_data, cfg->size);
> >  }
> >
> > -static const struct of_device_id sdm845_qcom_llcc_of_match[] = {
> > -     { .compatible = "qcom,sdm845-llcc", },
> > +static const struct of_device_id qcom_plat_llcc_of_match[] = {
> > +     { .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
> >       { }
> >  };
> >
> > -static struct platform_driver sdm845_qcom_llcc_driver = {
> > +static struct platform_driver qcom_plat_llcc_driver = {
> >       .driver = {
> > -             .name = "sdm845-llcc",
> > -             .of_match_table = sdm845_qcom_llcc_of_match,
> > +             .name = "qcom-plat-llcc",
>
> With this being the "one and only llcc driver", why not making it
> "qcom_llcc"?

Sure, will make it just "qcom_llcc" driver.

>
> > +             .of_match_table = qcom_plat_llcc_of_match,
> >       },
> > -     .probe = sdm845_qcom_llcc_probe,
> > -     .remove = sdm845_qcom_llcc_remove,
> > +     .probe = qcom_plat_llcc_probe,
> > +     .remove = qcom_plat_llcc_remove,
> >  };
> > -module_platform_driver(sdm845_qcom_llcc_driver);
> > +module_platform_driver(qcom_plat_llcc_driver);
> >
> > -MODULE_DESCRIPTION("QCOM sdm845 LLCC driver");
> > +MODULE_DESCRIPTION("QCOM platform LLCC driver");
> >  MODULE_LICENSE("GPL v2");
> > diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
>
> This file should be describing the public interface to the llcc, the
> private pieces is better kept in drivers/soc/qcom/llcc.h

Yes. I will split the things in two separate files as suggested.

>
> But this patch makes me wonder if there's a need to split llcc-slice and
> llcc-plat (and have a header file to describe API between them) instead
> of just having one file.

Nice opportunity to merge the two files? :)

Best regards
Vivek
>
> Regards,
> Bjorn
>
> > index eb71a50b8afc..8776bb5d3891 100644
> > --- a/include/linux/soc/qcom/llcc-qcom.h
> > +++ b/include/linux/soc/qcom/llcc-qcom.h
> > @@ -27,6 +27,46 @@
> >  #define LLCC_MDMPNG      21
> >  #define LLCC_AUDHW       22
> >
> > +/*
> > + * SCT(System Cache Table) entry contains of the following members:
> > + * usecase_id: Unique id for the client's use case
> > + * slice_id: llcc slice id for each client
> > + * max_cap: The maximum capacity of the cache slice provided in KB
> > + * priority: Priority of the client used to select victim line for replacement
> > + * fixed_size: Boolean indicating if the slice has a fixed capacity
> > + * bonus_ways: Bonus ways are additional ways to be used for any slice,
> > + *           if client ends up using more than reserved cache ways. Bonus
> > + *           ways are allocated only if they are not reserved for some
> > + *           other client.
> > + * res_ways: Reserved ways for the cache slice, the reserved ways cannot
> > + *           be used by any other client than the one its assigned to.
> > + * cache_mode: Each slice operates as a cache, this controls the mode of the
> > + *             slice: normal or TCM(Tightly Coupled Memory)
> > + * probe_target_ways: Determines what ways to probe for access hit. When
> > + *                    configured to 1 only bonus and reserved ways are probed.
> > + *                    When configured to 0 all ways in llcc are probed.
> > + * dis_cap_alloc: Disable capacity based allocation for a client
> > + * retain_on_pc: If this bit is set and client has maintained active vote
> > + *               then the ways assigned to this client are not flushed on power
> > + *               collapse.
> > + * activate_on_init: Activate the slice immediately after the SCT is programmed
> > + */
> > +#define SCT_ENTRY(uid, sid, mc, p, fs, bway, rway, cmod, ptw, dca, rp, a) \
> > +     {                                       \
> > +             .usecase_id = uid,              \
> > +             .slice_id = sid,                \
> > +             .max_cap = mc,                  \
> > +             .priority = p,                  \
> > +             .fixed_size = fs,               \
> > +             .bonus_ways = bway,             \
> > +             .res_ways = rway,               \
> > +             .cache_mode = cmod,             \
> > +             .probe_target_ways = ptw,       \
> > +             .dis_cap_alloc = dca,           \
> > +             .retain_on_pc = rp,             \
> > +             .activate_on_init = a,          \
> > +     }
> > +
> >  /**
> >   * llcc_slice_desc - Cache slice descriptor
> >   * @slice_id: llcc slice id
> > @@ -67,6 +107,11 @@ struct llcc_slice_config {
> >       bool activate_on_init;
> >  };
> >
> > +struct qcom_llcc_config {
> > +     const struct llcc_slice_config *sct_data;
> > +     int size;
> > +};
> > +
> >  /**
> >   * llcc_drv_data - Data associated with the llcc driver
> >   * @regmap: regmap associated with the llcc device
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
> >



--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461FA9E64D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 13:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfH0LCF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 07:02:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47916 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfH0LCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 07:02:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6F69861B92; Tue, 27 Aug 2019 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566903723;
        bh=HBOH1XABa0OlbCN7UErs6f15J5xizk15eoDOXzYC0F8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OX/7aKsoQCto2kTIG3zypyJrHO15lwl3VcsUWo0rBHKtRhZZXApS3wAS4wBXPyhTI
         U/dQ+vSbA9oAMNeNUuR0c2BpZ47ozQCvhOerWoINdmTb8SEsNFbBInFgbGAX/rOEnu
         qkIw26+HuKbr4r7+h0TABboK3Jqil9Y9cvsWbAU8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F383661B73;
        Tue, 27 Aug 2019 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566903710;
        bh=HBOH1XABa0OlbCN7UErs6f15J5xizk15eoDOXzYC0F8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k+vLdchK6dL8EXnEyeSf6RMcWDpNznu2Il7v1crfcK/9CSSJDjLYazhdD6M9DkGW4
         CTCgO3arWsWij4gOke/uzmoD4YTWKZz5/N9RruEooiqmXDyCZ54C0rY2g6Ooe8ZRE4
         wDszipVswMlsn1UzQ8l3u1raIxd50lB+9b9LkW4k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F383661B73
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f41.google.com with SMTP id g24so3511451edu.3;
        Tue, 27 Aug 2019 04:01:49 -0700 (PDT)
X-Gm-Message-State: APjAAAV+OPL864JMdbfTft3NIVp0W6SQnNYF4QBd8uqvCTGnRIUbjeI1
        8e5sp53eT8eSyPSA6VKksEU0h4mZ5/DkwNsvvvc=
X-Google-Smtp-Source: APXvYqygiRM4MxL2WPdv7UpRhp6QYvBk0IZYLUl6NwzaXdl6K30D2aLg8Brqrm8t7RzK8+J/RN9F6TOprM9nBp0qNzI=
X-Received: by 2002:a50:9ac3:: with SMTP id p61mr23675967edb.2.1566903708566;
 Tue, 27 Aug 2019 04:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org> <CAFp+6iE7224G4k8XE6Oz1S82iMgSza-n_zMN-ppOUWnuz+hFLQ@mail.gmail.com>
In-Reply-To: <CAFp+6iE7224G4k8XE6Oz1S82iMgSza-n_zMN-ppOUWnuz+hFLQ@mail.gmail.com>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Tue, 27 Aug 2019 16:31:37 +0530
X-Gmail-Original-Message-ID: <CAFp+6iE6zwrOUoCoOJO0mgYJGrWj+wUjXQ7RnxSPsV34ndYGbw@mail.gmail.com>
Message-ID: <CAFp+6iE6zwrOUoCoOJO0mgYJGrWj+wUjXQ7RnxSPsV34ndYGbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: qcom: llcc cleanups
To:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>, rishabhb@codeaurora.org,
        Evan Green <evgreen@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 2, 2019 at 11:43 AM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> On Thu, Jul 18, 2019 at 6:33 PM Vivek Gautam
> <vivek.gautam@codeaurora.org> wrote:
> >
> > To better support future versions of llcc, consolidating the
> > driver to llcc-qcom driver file, and taking care of the dependencies.
> > v1 series is availale at:
> > https://lore.kernel.org/patchwork/patch/1099573/
> >
> > Changes since v1:
> > Addressing Bjorn's comments -
> >  * Not using llcc-plat as the platform driver rather using a single
> >    driver file now - llcc-qcom.
> >  * Removed SCT_ENTRY macro.
> >  * Moved few structure definitions from include/linux path to llcc-qcom
> >    driver as they are not exposed to other subsystems.
>
> Hi Bjorn,
>
> How does this cleanup look now? Let me know if there are any
> improvements to make here.
>

Hi Bjorn,

Are you planning to pull this series in the next merge window?
There's a dt patch as well for llcc on sdm845 [1] that has been lying around.

Let me know if you have concerns with this series. I will be happy to
incorporate the suggestions.

[1] https://lore.kernel.org/patchwork/patch/1099318/

Thanks & Regards
Vivek

> Best Regards
> Vivek
> >
> > Vivek Gautam (3):
> >   soc: qcom: llcc cleanup to get rid of sdm845 specific driver file
> >   soc: qcom: Rename llcc-slice to llcc-qcom
> >   soc: qcom: Make llcc-qcom a generic driver
> >
> >  drivers/soc/qcom/Kconfig                       |  14 +--
> >  drivers/soc/qcom/Makefile                      |   3 +-
> >  drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} | 155 +++++++++++++++++++++++--
> >  drivers/soc/qcom/llcc-sdm845.c                 | 100 ----------------
> >  include/linux/soc/qcom/llcc-qcom.h             | 104 -----------------
> >  5 files changed, 152 insertions(+), 224 deletions(-)
> >  rename drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} (64%)
> >  delete mode 100644 drivers/soc/qcom/llcc-sdm845.c
> >



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

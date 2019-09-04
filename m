Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74894A7D19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 09:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfIDHyH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 03:54:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57088 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfIDHyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 03:54:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1EF366013C; Wed,  4 Sep 2019 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567583646;
        bh=ZfLR1YEu1X4rVSuz+01cnPj1qh9JDAVads5Zz46yCig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YjCi67RRtgDJe8H4UIOaoB9SGUBhvwToiUrifxdUZN8EpnpZznXJbezdYocsHfU3V
         YqOl8/QrBTWJjRwjpAczhLBP3gsBA/McnAptixvz0yL8GkfrEIVXTHLlrYieCgLge7
         FwG5grEIjXhVx3GWNNvSzdntRhP/uSyCIY4HF09g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A29A6085C;
        Wed,  4 Sep 2019 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567583645;
        bh=ZfLR1YEu1X4rVSuz+01cnPj1qh9JDAVads5Zz46yCig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PSn84YQkYRqzlbB6ARnPmvWPVF+kGw+uNfoaoE/PAvF29VRrd+lMdJYWoF2PpVpgT
         tvxEXlrBxGQtRwn9lqw2XiJgIqgZplK0ZvEwU/MTk4b9nbhqBOatbrVcnptx+KvJay
         kUfziTeNgHrNTMa/U7mKX+EGmYgm4Ptf7nparABc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A29A6085C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f50.google.com with SMTP id r12so21514460edo.5;
        Wed, 04 Sep 2019 00:54:05 -0700 (PDT)
X-Gm-Message-State: APjAAAVRig2ab+MKoA6P+OGQkZGiULmXqsW4OkLSwKZzyPP65uZvVmeI
        iXed13YFzhNDgdAS1KhyCLlFpIibVI0R0ib/NrU=
X-Google-Smtp-Source: APXvYqxl16lDYkKjVb/zuHMs0WdKDQs5m8eyKUOOqaqa4GkxbpgQ8vAEd4fbQhpLi3sa3E/4pr2Gjy23NyDUzjn4Sig=
X-Received: by 2002:aa7:ca42:: with SMTP id j2mr26782407edt.197.1567583643945;
 Wed, 04 Sep 2019 00:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190718130238.11324-1-vivek.gautam@codeaurora.org>
 <CAFp+6iE7224G4k8XE6Oz1S82iMgSza-n_zMN-ppOUWnuz+hFLQ@mail.gmail.com>
 <CAFp+6iE6zwrOUoCoOJO0mgYJGrWj+wUjXQ7RnxSPsV34ndYGbw@mail.gmail.com> <20190904044252.GD3081@tuxbook-pro>
In-Reply-To: <20190904044252.GD3081@tuxbook-pro>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Wed, 4 Sep 2019 13:23:52 +0530
X-Gmail-Original-Message-ID: <CAFp+6iGTG6mBerAHSQesJyHO=yn2QHKR1TWuQQDduaPWusqPvg@mail.gmail.com>
Message-ID: <CAFp+6iGTG6mBerAHSQesJyHO=yn2QHKR1TWuQQDduaPWusqPvg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: qcom: llcc cleanups
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        rishabhb@codeaurora.org, Evan Green <evgreen@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 4, 2019 at 10:13 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 27 Aug 04:01 PDT 2019, Vivek Gautam wrote:
>
> > On Fri, Aug 2, 2019 at 11:43 AM Vivek Gautam
> > <vivek.gautam@codeaurora.org> wrote:
> > >
> > > On Thu, Jul 18, 2019 at 6:33 PM Vivek Gautam
> > > <vivek.gautam@codeaurora.org> wrote:
> > > >
> > > > To better support future versions of llcc, consolidating the
> > > > driver to llcc-qcom driver file, and taking care of the dependencies.
> > > > v1 series is availale at:
> > > > https://lore.kernel.org/patchwork/patch/1099573/
> > > >
> > > > Changes since v1:
> > > > Addressing Bjorn's comments -
> > > >  * Not using llcc-plat as the platform driver rather using a single
> > > >    driver file now - llcc-qcom.
> > > >  * Removed SCT_ENTRY macro.
> > > >  * Moved few structure definitions from include/linux path to llcc-qcom
> > > >    driver as they are not exposed to other subsystems.
> > >
> > > Hi Bjorn,
> > >
> > > How does this cleanup look now? Let me know if there are any
> > > improvements to make here.
> > >
> >
> > Hi Bjorn,
> >
> > Are you planning to pull this series in the next merge window?
> > There's a dt patch as well for llcc on sdm845 [1] that has been lying around.
> >
> > Let me know if you have concerns with this series. I will be happy to
> > incorporate the suggestions.
> >
>
> No concerns, this is exactly what we discussed before. Sorry for missing
> it. I've picked the patches now.
>
> > [1] https://lore.kernel.org/patchwork/patch/1099318/
> >
>
> This is part of the v5.4 pull request.

Thanks a lot Bjorn.

Best regards
Vivek

>
> Thanks,
> Bjorn
>
> > Thanks & Regards
> > Vivek
> >
> > > Best Regards
> > > Vivek
> > > >
> > > > Vivek Gautam (3):
> > > >   soc: qcom: llcc cleanup to get rid of sdm845 specific driver file
> > > >   soc: qcom: Rename llcc-slice to llcc-qcom
> > > >   soc: qcom: Make llcc-qcom a generic driver
> > > >
> > > >  drivers/soc/qcom/Kconfig                       |  14 +--
> > > >  drivers/soc/qcom/Makefile                      |   3 +-
> > > >  drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} | 155 +++++++++++++++++++++++--
> > > >  drivers/soc/qcom/llcc-sdm845.c                 | 100 ----------------
> > > >  include/linux/soc/qcom/llcc-qcom.h             | 104 -----------------
> > > >  5 files changed, 152 insertions(+), 224 deletions(-)
> > > >  rename drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} (64%)
> > > >  delete mode 100644 drivers/soc/qcom/llcc-sdm845.c
> > > >
> >
> >
> >
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

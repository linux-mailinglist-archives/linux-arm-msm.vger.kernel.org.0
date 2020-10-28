Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8763729D958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgJ1Wwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389660AbgJ1WwJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:52:09 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E2DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:52:08 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id o18so1208394edq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZhjeIVE20A01faSTkSkIK60VFjLSoytoTo0XKrz+6B4=;
        b=zu8OkdgvEeQB5FHxzaWvI2AP3L0lWAa9WeW+xXlDJ6+2pWLtNcXQ5wNIfCU4nVPyZv
         sEX7S/Ni9gTmlZamKn0bW05wkV15F01qn6zniIAn7u9/60jhKJEgvNUnO9U4kHhNY/Cn
         zbIVJOxbQkM1QvAYEs+hCssyigeioz7fnlnXpjOH6ZkLR+w5TfgG6MTITaep4Ty4/8g1
         fY0KyBGgCtJe2nHb842duBifxaRzc/WF2lCINQ/181ahWtSpOlpKssnt8k5ySkQ5WlL+
         46QBaO7okEHX78Jlyrm0lIxH/CFNiDyGNJmFnbaN1iQmilA2lpQlZrSXHOP0LX9Rv9Yf
         8gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhjeIVE20A01faSTkSkIK60VFjLSoytoTo0XKrz+6B4=;
        b=KILncalCMq8SdhOCV54YXbJVed06JN7P8rxS6/ugLm+2AWePCytT2d7bPjIZCNuWsy
         Udr00mCYwZn0QPnwQ18MTAATbHlWmvsSsOcq4139SOVjjFDkojrqSdUWDNyO3Yvolu6M
         5TGv6HkDr3j9jcqC/xL1htfBxRlvJbODM2IEgRFI1zlzCV6FpQW1yjo9iyLx1ad5R17j
         tohUBjPxS26JLcDDcFGmpa5zpm3ng6Ig6rJdCeJ36Mq9+tpMl18cqy2e5YoFkyoU6227
         RwWQj/7ywdoj+CxtxVrs45KIVWJX+DtYtC/m6owTBupkI3KdfQOkqu2+SPd8X7BXeGlA
         Aw4Q==
X-Gm-Message-State: AOAM533i98FRtBMCC0ZBag2ifq64FoftUt9g8Kut6TtvuvXjxyxutWvH
        6bFObem6gYYQGBvyrCO48wGfuUfKe2IIiMTDSar/LoIss6jpfKLa
X-Google-Smtp-Source: ABdhPJwSQkD6mafcdYyymrwBIsfD/N0YGAX8rdtfY3Ffnid6SuSqbtYCE2OHtfi22H2ousjzURn4kfC/HdDb1CQZ7Ic=
X-Received: by 2002:a2e:8986:: with SMTP id c6mr3020719lji.29.1603878212020;
 Wed, 28 Oct 2020 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201027111422.4008114-1-anders.roxell@linaro.org> <20201027211536.GB19979@codeaurora.org>
In-Reply-To: <20201027211536.GB19979@codeaurora.org>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 28 Oct 2020 10:43:21 +0100
Message-ID: <CADYN=9LP1p9Kg0BJRHs5JMgfWKB-vHxVkr=DdFt3Uyb5Ka0=UQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: QCOM_RPMH fix build with modular QCOM_RPMH
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        mkshah@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Oct 2020 at 22:15, Lina Iyer <ilina@codeaurora.org> wrote:
>
> Hi Anders,
>
> On Tue, Oct 27 2020 at 05:14 -0600, Anders Roxell wrote:
> >When building allmodconfig leading to the following link error with
> >CONFIG_QCOM_RPMH=y and CONFIG_QCOM_COMMAND_DB=m:
> >
> >aarch64-linux-gnu-ld: drivers/clk/qcom/clk-rpmh.o: in function `clk_rpmh_probe':
> >  drivers/clk/qcom/clk-rpmh.c:474: undefined reference to `cmd_db_read_addr'
> >  drivers/clk/qcom/clk-rpmh.c:474:(.text+0x254): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `cmd_db_read_addr'
> >
> >Fix this by adding a Kconfig depenency and forcing QCOM_RPMH to be a
> >module when QCOM_COMMAND_DB is a module. Also removing the dependency on
> >'ARCH_QCOM || COMPILE_TEST' since that is already a dependency for
> >QCOM_COMMAND_DB.
> >
> >Fixes: 778279f4f5e4 ("soc: qcom: cmd-db: allow loading as a module")
> >Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> >---
> > drivers/soc/qcom/Kconfig | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> >index 9b4ae9c16ba7..3bdd1604f78f 100644
> >--- a/drivers/soc/qcom/Kconfig
> >+++ b/drivers/soc/qcom/Kconfig
> >@@ -109,7 +109,7 @@ config QCOM_RMTFS_MEM
> >
> > config QCOM_RPMH
> >       tristate "Qualcomm RPM-Hardened (RPMH) Communication"
> >-      depends on ARCH_QCOM || COMPILE_TEST
> >+      depends on QCOM_COMMAND_DB
> A solution was posted in the mailing list alredy -
> https://lore.kernel.org/linux-arm-msm/20201008040907.7036-1-ilina@codeaurora.org/

I missed that one, thanks.

>
> If you get a chance, please give that a shot to see if that works for
> you.

That will work too, but the "depends on ARCH_QCOM || COMPILE_TEST"
isn't needed since that is already the dependency for QCOM_COMMAND_DB.
So that should be met here too or am I missing something?

Cheers,
Anders

>
> Thanks,
> Lina
>
> >       help
> >         Support for communication with the hardened-RPM blocks in
> >         Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
> >--
> >2.28.0
> >

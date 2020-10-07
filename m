Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A8B28570A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 05:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgJGDZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 23:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgJGDZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 23:25:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCC0C0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 20:25:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e22so867091ejr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 20:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGNIkBjCwZhok5mPSCK5w7G0Va0huJHsTjdQPHjMKCw=;
        b=AR7Q7D2pALfKaMElX8HzYqK822G592BniOoE8ob2u6rXz2ni+SvFqN5LuRDHHXjSPA
         1gSk+SSYSNbr0NbmxtX2vYqfzINjeZvAWM8bD5rL8DAn+9P6omdSGDQUn1vS5mmRcWJT
         tjLhulRhKqF8VPFvZzjswhva/2DvIeQXOwhG4ifcEOkyMTz4ilw6+t4/Qwm2emobnumQ
         jLsrrEraiiHOWdQQ8y/hRmJNvCuJofDCD1AWV8jJXb3rXKEb8u8Z7iVTEHUwo9e6EADM
         6m/2J+kcoYbEHToVp9Mq11MEqDL+bcJR50SdZgyTD68fy8Oh/cGs8OgGyzBXpuM0jm9F
         Xytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGNIkBjCwZhok5mPSCK5w7G0Va0huJHsTjdQPHjMKCw=;
        b=l7bAn+10CQRVVpTk+0gdiXv5zsLg8mzd4kH2r3SGM0Fkg7wO2GpsIfsInIamdMyGI7
         7aIeqGMZ4i/z1L4SYC2Knv4/xuBAXZu/Oia5+1psMnNT9aXJYY8os1tZgkRkJTlH29L+
         rgmFp76KSKxKEaZqb1Gujzv9hiIOzmprR8emBRK6X7KeXh1KZ+klY/PeDdq3MK46mypk
         L7++1T6LVd4AKZbAZMiHa/qERu52Wx8Ms1J2jexJkgmzn5u12c+QZqZgkc/38NxMqtBh
         7o+33exzxwPAFNUe3g08iFH9ULFFcmQ5B7acfWQvaEwYVbYP7OW87Vxpx4ek0YcC7fYd
         IS/Q==
X-Gm-Message-State: AOAM530tGKi3+sFHh+wH4wEY8rUs2J19mADVW4/n1It+wxFTeV7mkDHV
        PJvsL/rcZ3aPQIG6zSuctysL74yonGCTL3eIkPH34w==
X-Google-Smtp-Source: ABdhPJymgP1Lkxf4YCedXGKWEC2ZiinATCWqv2nhO6YSSHj2KtlyXsk4wjttSz7cncbQDFkfEoIgDrPVnNGIDtYCPK0=
X-Received: by 2002:a17:906:4cc2:: with SMTP id q2mr1306170ejt.422.1602041103377;
 Tue, 06 Oct 2020 20:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200930081645.3434-1-jun.nie@linaro.org> <20200930081645.3434-2-jun.nie@linaro.org>
 <104955668ed768682adf1757e79022117460d268.camel@mailoo.org>
In-Reply-To: <104955668ed768682adf1757e79022117460d268.camel@mailoo.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 7 Oct 2020 11:24:52 +0800
Message-ID: <CABymUCM_HdeTTPymuVD4fguJs-rK8G=0Dbjk_WnGGWHJ4f208w@mail.gmail.com>
Subject: Re: [PATCH 1/5] interconnect: qcom: Consolidate interconnect RPM support
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     devicetree@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> >  obj-$(CONFIG_INTERCONNECT_QCOM_SMD_RPM) += icc-smd-rpm.o
> > +obj-$(CONFIG_INTERCONNECT_QCOM_SMD_RPM) += icc-smd-rpm.o
>
> Duplicate ?
>
> Thanks for msm8939 work, please Cc: me on any related patch :-)
>
>
OK, will CC you on next version. This issue should be a typo in vim.
Thanks for reminder.

Regards,
Jun

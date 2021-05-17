Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD97382A29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 12:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236538AbhEQKuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 06:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbhEQKuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 06:50:10 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DDBC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 03:48:54 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id n40so5315092ioz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MfNJDWbvDasEDyltN5nF+mBEbLf5r1gXweNdB3AxYHk=;
        b=NvC9NVOGb7gcWuttAUiYoW0O7H+RUEhA1kcDUh9HB2e3Rm73BZAoa6AQOMYf1GGJNU
         HmnIcxv1VygZBq7nKCswt4+3AlrP1PSMbydeJC5dRuzFEfiZNLiv80FtPLNis59O5LJ4
         j0nY8aHu9MK0ArO0/QF8hCqG78Y5BZ/HrLQypxzLyb7l01Qu9fr42wXQZG8K3kAA0JZe
         8Ai79cjmSVlZ7M97O7g1NtL06z7tSSAO4JO+AlHU68+DlkS6QKIgmizgU4K5s9tMDQ+4
         xzUdantEJuVKMMoaBBuv5H+xM/lfI/k0JXvFs5Jqv0mjlw/eodnBPq4CHpEQWki/Cfxr
         nMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfNJDWbvDasEDyltN5nF+mBEbLf5r1gXweNdB3AxYHk=;
        b=t4+Il0vIiqiqoyHElrOur+VGPuHMmR85tXxBZxR8pirNMtnWaRaNBwlPAFAyQdemrM
         xIrypN0Edefk0ZSt8yzemkfD9zhFcfC4ul1KAOI+AzWWWOwqopNpqVSjZ1vQWyZ0++5u
         zuj8qoVJLMilabQCtVQuNeO14UPknm8O8AfZ+A5hdftn0MjASj4DHbVj4RUcn1hJKd5u
         ZufkC4aHf8hjcTCV2qptgJpsCn6RvL7ROesB0TLPNVkjwgxSXyI06F1qx7aSfbfp9HQa
         U5FXSWgP8tgNHum8RolIogeUIqPA0gHqm39oBjFDEvQxwqrkNIleU6HQZIGtQKb37GvR
         /kSg==
X-Gm-Message-State: AOAM530YmxnyuNmv3oCdU1qnmDK7OseJSiICtsiRC5qw0Is2SfF2Y6V8
        ZUwhG/Oj+1c3L+pbbPJur/4tbLaCgBIXYdkZzK+QSw==
X-Google-Smtp-Source: ABdhPJyvYS3AvWBcifGaM9dVug2M9VRVkeWJUFEkHuPEJ3rYFWoTC8lXGQXFjT1qks6eN7j3dV0meMeR/IlnjWiXuik=
X-Received: by 2002:a05:6602:189:: with SMTP id m9mr1635409ioo.88.1621248533502;
 Mon, 17 May 2021 03:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210504114826.64376-1-robert.marko@sartura.hr> <0870f5c7cadf86d102747ec4f3d1b77e@codeaurora.org>
In-Reply-To: <0870f5c7cadf86d102747ec4f3d1b77e@codeaurora.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 17 May 2021 12:48:42 +0200
Message-ID: <CA+HBbNEqr2AxvUNm_kVC2n5i2qvJipDZJWbCRFNQZCnM8+RuGg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add remaining IPQ6018 family ID-s
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 12:46 PM Kathiravan T <kathirav@codeaurora.org> wrote:
>
> On 2021-05-04 17:18, Robert Marko wrote:
> > ID for IPQ6018 was previously added, but ID-s for rest of the
> > family are missing.
> > So, lets add those based on downstream driver.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> Reviewed-by: Kathiravan T <kathirav@codeaurora.org>
>
> Nit: May be you can add the IPQ6005(453) variant as well? or you want to
> add it later on need basis?
Hi, I completely missed that one.
I will send a v2 with it then.

Regards,
Robert
>
> > ---
> >  drivers/soc/qcom/socinfo.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > index f6cfb79338f0..28bbc7a9227e 100644
> > --- a/drivers/soc/qcom/socinfo.c
> > +++ b/drivers/soc/qcom/socinfo.c
> > @@ -255,6 +255,9 @@ static const struct soc_id soc_id[] = {
> >       { 351, "SDA450" },
> >       { 356, "SM8250" },
> >       { 402, "IPQ6018" },
> > +     { 403, "IPQ6028" },
> > +     { 421, "IPQ6000" },
> > +     { 422, "IPQ6010" },
> >       { 425, "SC7180" },
> >       { 455, "QRB5165" },
> >  };
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of Code Aurora Forum, hosted by The Linux Foundation



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

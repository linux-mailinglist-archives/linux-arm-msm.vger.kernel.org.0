Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB124A9772
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355309AbiBDKFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 05:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243358AbiBDKFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 05:05:47 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089EFC061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 02:05:47 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o64so5045769pjo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrnvJctaf5CaGI0+Id3QS0IefiR7Kqw7sZwGS5Mb1a0=;
        b=RvK9oll/uuAupJuX1xwYdGyYW7UeOuDvliXyc9jkPQ+aB7jWnt6OVDlB+OhWKcvO8W
         k2UTyRgCiVFO5EnwdqmNaA0aAWul96rLWXh/Ewa0HbgFscRQ7CDUkz48YqFAlm+k66fy
         UhA6gUQ/ecqvHApP2AWod/xmJvFhlFxTY0uQ0XZneHFPvs299Mk4v18ysm4tgXU1QMoV
         fIDMyS99Lw//fJZOmDIWLscU6JymELVOlnk5+l9Jyk8DocJR5+O4c2sHRkJu/CgKarBg
         rAOyJM0+Pwpqh92A962u7xBIFgzTMt2OwZ6ukhAmwpeoGQ9u3ruSDeihpsArQJPr4QR+
         M2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrnvJctaf5CaGI0+Id3QS0IefiR7Kqw7sZwGS5Mb1a0=;
        b=hzIFSP5OzuaB1cOgrfOiJOz5lGjzCX0Mf0CK5Y9JtVRuVjrv7K72w4uHF6o3Na9QSI
         cpWed1YIqu8K65GpeVcjqNmJablQId11Q5LjOAcjDN8qQvdoNp7Od8GUcTm79UfvUuE3
         XXBHFyUayNza4jPsZHtZs90QoU72YhdAF4RReakmLPOpy/ABQdrUZWIVTyUDUil72o3C
         PLHfit+kDmfvQn55POlql29mlZMflw/PlKtM2Cn1zyjzKi2uHwtAEg+pDTVgj7e2A+gB
         B+lb712eF7/QxjhNjbjiAoNO3BOYkMjWKUyHu/rF2jY0HrfV9ysQ/rYD77I31qyVbieS
         iDYQ==
X-Gm-Message-State: AOAM532cR4Tbbcy+SiibWThdMX/USZ9XPO3EHHqT9h9KC6HGyVjMd5aV
        bTUCy2R8dbsUPL+nsABb+W4kpd8wqzBGSULPfW5dbw==
X-Google-Smtp-Source: ABdhPJz+5gXsNx67AS719F91ey6VWY/P7GPWswdf6MADDY0D32joFoxDOVAcNb9nUxjpehzPw7RL8P5b6yYhBhorx+8=
X-Received: by 2002:a17:90b:4a86:: with SMTP id lp6mr2297281pjb.152.1643969146488;
 Fri, 04 Feb 2022 02:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 11:05:35 +0100
Message-ID: <CAG3jFyseuJjnUVEqBh8UwwkB21M99_F1osbprL6hvrgmmaO8mw@mail.gmail.com>
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Vladimir,

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
> controller, on error path i2c_del_adapter() is still called.
>
> Fortunately there is a sanity check in the I2C core, so the only
> visible implication is a printed debug level message:
>
>     i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]
>
> Nevertheless it would be reasonable to correct the probe error path.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index c1de8eb66169..fd4260d18577 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
>         return 0;
>
>  error_i2c:
> -       for (; i >= 0; i--) {
> +       for (--i ; i >= 0; i--) {
>                 if (cci->master[i].cci)
>                         i2c_del_adapter(&cci->master[i].adap);
>         }
> --
> 2.33.0
>


This chunk of code seems to be re-worked later in the series too. But
explicitly fixing the issue still makes sense in this case.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

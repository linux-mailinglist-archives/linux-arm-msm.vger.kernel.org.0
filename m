Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5623D3CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 17:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbhGWPFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 11:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhGWPFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 11:05:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94ECC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 08:45:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d17so2886217lfv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GvAXOXhERIFR7lj2ShQ2Stgdwb2QaVlP0niSxQOcbrQ=;
        b=mK+7226Fz687r/Nn9T07Az1MI3wnxIfZLhRcAWCLqQ4ND61PmRHYsMDTLcO9I0GR6a
         eHQ3Qz8YyEMeYYq0wzZydM1vtrJ/ZlRaUzJR7dWU2EI4RrISOFZNPwwUQZyvCE5SRz7k
         qn8oNodlZNwtp0Drmbpx4WI6kK4dPm+dVkkILCdizj5N+qatl1xqwK/pbK0vjKn4MV9n
         6LByGxEp66l4IXaISCY3TzQ8kfD/OTCYXPTu5uAYco6rDXcvjJYdQFMbziUPW8L2xipz
         dMaUIG6dSa0vPyxuzhPYHLVqeoZB7k6aoOYqueNB01LfzAi6BWnUuiXhfADf5LzlY1RG
         8pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GvAXOXhERIFR7lj2ShQ2Stgdwb2QaVlP0niSxQOcbrQ=;
        b=RJG3wRdSh940E0I8B/VTtUH+CKPCudS7Gysh+dxG6TYXwH2kmQbfh2Izzu/za5Ebad
         pkgNHTvX2SChYwv8/kAu1SDkFQb3N3jvDIHHysCqBx8opMzFN/ABx+IJEmXVW4qJAJON
         GbMqG0IwQocFqawawhyPdmC+IpYBTtGEFbdTCIcUzdC9/i4NFjvxvg5rBBq32hc2HJSu
         xu4p17CdXycduSlRS68JqWAZGfBvmTLRfT2ENsxwtpbp+ohpRtDqK+0ipLJDC8hhKhtO
         ffgSlrjCGG5Q5KWjO7WITSnysCEg65oiQ1dRdS51tJdN88pTPfDG4/2GBzYyXoaBje6M
         5RuA==
X-Gm-Message-State: AOAM530T32qiAoCovRZqMnvY8GgtgQuXFEjY0J4oegWXfoPmzjgvy5tx
        ix2pU9JRs6szKI7Vo8vRTs8Bj/wHgfZCflbupqOfMg==
X-Google-Smtp-Source: ABdhPJzgYGWvpxX1KZqSptUUyR70nnvRpc5qqg3N8PkcKpCxHDL5PgGdL/kppRgpMzW27kImhprl27rgPNOXLk+hGH8=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr3400945lfk.157.1627055140061;
 Fri, 23 Jul 2021 08:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210624191743.617073-1-konrad.dybcio@somainline.org> <20210624191743.617073-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210624191743.617073-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:45:29 +0200
Message-ID: <CACRpkdbySWhcxL_YeYr1R6Tn=3fDZCvqQFvmEULSW8dg=421fw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MDM9607 pinctrl driver
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 9:17 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> Add a pinctrl driver to allow for managing SoC pins.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij

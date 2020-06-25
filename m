Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B013320A283
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 18:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390006AbgFYQAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 12:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389860AbgFYQAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 12:00:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29181C08C5C1;
        Thu, 25 Jun 2020 09:00:47 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bh7so2964179plb.11;
        Thu, 25 Jun 2020 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5w59ck/cH1FAJZ42RivxaXn688BtBAJs6J4Ya3HN1Qw=;
        b=PqHfCRSxDkaRCbGBtGLdnvIolCsibOKD7MY6DVgeSvng1V2WrWUTDbkHujzdi5qgy4
         ml73r78cp015/2xMJwf1ZNja0q07upDyxHMQBctGxwl6l6M81Xamxo6ofZad/IG2jHp/
         yS0fpWzpqmQbg8VX4Xnk2ZvBkus4F98I8g5a7d9HcbbWcUaJAAUTadG51gVuQU7dX0eE
         4E6U2nbDwlQT7S+/3PZyBx4phuRMrRhdA0xEAT1WpJWYWatqHfuMMGXiZIWoEiliBCEV
         L7DtfrEuQ9eJYNbeUJdOWof6CVrsHcozsz4wHmcOs/DXXFuWLk6HBTa44d/H991f2yyK
         eZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5w59ck/cH1FAJZ42RivxaXn688BtBAJs6J4Ya3HN1Qw=;
        b=T1v50GwCL67jm/mBKIW9yspRZpN3985+2OYjpmyELDMOt0BzMuqm0etZk/xttYnSs4
         +dKRSV5i2avhNSyTdZe6pFB9TGv+10F7fN01N2D7XMd6VGcEEheTYuIzFDnZ5CqBAc4p
         1WlK8p18M48pcQY5cX4iMIoAT+6ktISq+0s1Ir9ThsbxHLPwxxeLy/Anu+Ke9uyznJox
         n0e11O7ZlNWFrkWSNtMPo+CE6d8GtTsR3rgIqoBEXT+zDPwk9FkVR3dtsTy2TdSWBcFn
         wuEedL86A5Iwp/PRRYWOZCiVbp57tQ41cJfNJI71M8SjVW/D0lTivwhRpRbiHw58ACLy
         wWZg==
X-Gm-Message-State: AOAM531bIkCU96yVpCXwHUWtl+CTmI012Sh4WB4SqHLTZ4X3Vxu4bbqA
        PnoOOVi0QwMC8LAfMa2w3c0=
X-Google-Smtp-Source: ABdhPJxAWCmsiR3RKb80608NUxeQICNr5EwYEHeNdxUY/50Z0PPLb4tDNhiIyH2+/kThehS6leprLw==
X-Received: by 2002:a17:902:b60c:: with SMTP id b12mr6609567pls.96.1593100846414;
        Thu, 25 Jun 2020 09:00:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u23sm14286077pgn.26.2020.06.25.09.00.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:00:44 -0700 (PDT)
Date:   Thu, 25 Jun 2020 09:00:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 0/2] Convert QCOM watchdog timer bindings to YAML
Message-ID: <20200625160042.GC149301@roeck-us.net>
References: <cover.1581459151.git.saiprakash.ranjan@codeaurora.org>
 <c2b8fabcf82b27c7334482bd53ebba62@codeaurora.org>
 <20200621073320.GI128451@builder.lan>
 <ce4c2b44cb15af12b04c09f1786a6c1a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce4c2b44cb15af12b04c09f1786a6c1a@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 11:50:52AM +0530, Sai Prakash Ranjan wrote:
> On 2020-06-21 13:03, Bjorn Andersson wrote:
> > On Tue 16 Jun 23:56 PDT 2020, Sai Prakash Ranjan wrote:
> > 
> > > Hi Bjorn,
> > > 
> > 
> > Hi Sai,
> > 
> > > On 2020-02-12 03:54, Sai Prakash Ranjan wrote:
> > > > This series converts QCOM watchdog timer bindings to YAML. Also
> > > > it adds the missing SoC-specific compatible for QCS404, SC7180,
> > > > SDM845 and SM8150 SoCs.
> > > >
> > > > v1:
> > > > https://lore.kernel.org/lkml/cover.1576211720.git.saiprakash.ranjan@codeaurora.org/
> > > > v2:
> > > > https://lore.kernel.org/lkml/cover.1580570160.git.saiprakash.ranjan@codeaurora.org/
> > > >
> > > > Changes since v2:
> > > >  * Add missing compatibles to enum.
> > > >
> > > > Changes since v1:
> > > >  As per Rob's suggestion:
> > > >   * Replaced oneOf+const with enum.
> > > >   * Removed timeout-sec and included watchdog.yaml.
> > > >   * Removed repeated use of const:qcom,kpss-wdt and made use of enum.
> > > >
> > > > Sai Prakash Ranjan (2):
> > > >   dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
> > > >   dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845,
> > > >     SM8150
> > > >
> > > >  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
> > > >  .../bindings/watchdog/qcom-wdt.yaml           | 48 +++++++++++++++++++
> > > >  2 files changed, 48 insertions(+), 28 deletions(-)
> > > >  delete mode 100644
> > > > Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> > > 
> > > 
> > > Gentle ping!
> > > 
> > 
> > This should better go through the watchdog tree, so I believe Guenter
> > would be the one to pick this up.
> > 
> 
> Ah right, then a gentle ping for Guenter.
> 
I don't think the watchdog mailing list has been copied on this series,
meaning I don't have a copy that I could apply if I wanted to. I also see
no evidence for a Reviewed-by: tag from Rob or any other DT maintainer.

Guenter

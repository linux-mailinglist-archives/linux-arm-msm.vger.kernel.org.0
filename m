Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F4C3B39D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 01:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbhFXXrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 19:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhFXXrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 19:47:18 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5617FC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 16:44:58 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id b17-20020a4aba110000b029024c219a3d83so913149oop.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/IZo+xMlntd1OPotYsAVSJXAdOf8XBCFm8hpgOD3AFg=;
        b=AfbC8GUOrGiQ8wmQ44iEw4DbrAILKvySD0JZd8pYtbCZY+ekpRhYJmeY9a9vlLZO0W
         TLhSAmN2KJ0v5+kL3d5oSjkPIhRsBHoa5yjedwB/iE2GW3V5jiQR5yQTNGNKt45aj0IX
         RhaZfVSTvkWIPxrDVNYG0iuatUSYpf8ZEfSyLoo7rxPEMXkex0D6LI/ZKthaqXsZ7T9/
         iAS5EbMp+vVOVpPSd6pjrYRihgMaPAc6kP1kZX/LgKh/6YwUa+U4+neU88eOL72zNn30
         BUMICqoJfoLnHIxAXKooFmy5UK1eIMFjMLE6EdXkN91pao8KfVTcPkfQNE6Dq/wlPjyl
         i6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/IZo+xMlntd1OPotYsAVSJXAdOf8XBCFm8hpgOD3AFg=;
        b=GeXMvN2IYjbwd75H0+iGZPWlNoiB3xGwRgd7hcNtPqe6RdcAXxbdXbGIkqLAxG2HQn
         T9V6vhdrI8Mz7wXIFTYaVhXBmOvD7dAMSKQatF/ovAdZgDmDmgND5JlXBcucDDEu9c6P
         dkcflfCb9LXtKylBM5kw9Esr+dbdGnzBlQfwEVM8lZxAyUK0nRtJoMbz02IHf6ZTmlxC
         epLuglkG+Fuf20H7xbztspxFlzaM/B7NCJOvxbnfrwSrvdSnkcQYfquAtA6+74pn8UEJ
         /hPKwmhR4/+mx8wP81JUzhYyrFkv0KWqeVEkdV94bw+pcuMeYEMJt3IeZDa5TYZ36xD1
         J47A==
X-Gm-Message-State: AOAM531dw2cF/4+z7D6Zyy/sayZpzhPdjvWFufrEe/DPJQgXCz9IEyuL
        ZsgvSdYdGYJGItEPngKnMRb5Sw==
X-Google-Smtp-Source: ABdhPJwMXtC7tWjEChYW9HirB1ul2n/Er3ur/GzHXRcQfV3ZScePSyTVNBRmWl7SHAjdME54L0HrIA==
X-Received: by 2002:a4a:cb06:: with SMTP id r6mr6597797ooq.15.1624578297522;
        Thu, 24 Jun 2021 16:44:57 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 35sm980557oti.65.2021.06.24.16.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 16:44:57 -0700 (PDT)
Date:   Thu, 24 Jun 2021 18:44:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: leds: Add Qualcomm Light Pulse
 Generator binding
Message-ID: <YNUY9ncs34E6aJMe@yoga>
References: <20210623035039.772660-1-bjorn.andersson@linaro.org>
 <20210625011932.6354e397@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625011932.6354e397@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Jun 18:19 CDT 2021, Marek Behun wrote:

> On Tue, 22 Jun 2021 20:50:38 -0700
> Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> 
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> 
> The file name should be based on one of the compatible strings, for
> example the first one:
>   qcom,pm8150b-lpg.yaml
> 

The majority of the files in leds/ are named leds-*.yaml, is this a new
scheme for LED bindings?

> > +      led@1 {
> > +        reg = <1>;
> > +        label = "green:user1";
> > +      };
> 
> `label` is deprecated,

Sorry, I missed the comment in the middle of the description about this.
Is there any particular reason why this isn't marked deprecated: true?

> please don't use in new bindings in examples.
> Instead use color, function and function-enumerator, i.e.
> 
>   color = <LED_COLOR_ID_GREEN>;
>   function = LED_FUNCTION_xxx;
>   function-enumerator = <N>;
> 

Can you point me to something helping me regarding what "function" to
use?

For this particular devboard that the example comes from I have 4 LEDs
that are named "user1", "user2", "user3" and "user4" in the board
documentation. I can make up whatever for the example, but I would like
to get the following dts additions follow the expected guidelines.

Regards,
Bjorn

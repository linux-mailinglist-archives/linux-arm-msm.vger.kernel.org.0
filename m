Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8943FEF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 17:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhJ2PGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 11:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhJ2PGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 11:06:06 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7D2C061570;
        Fri, 29 Oct 2021 08:03:38 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f8so18111247edy.4;
        Fri, 29 Oct 2021 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZ2JoPc61pW3Rmd/WsSop2qi3/BURl9gxonuittJKcg=;
        b=W21oGbrQpKIF8CLDvcmanquJAYXdHSAwH2e4DN44DdmfEzAigYim6gg+bp2dKwxAJS
         GatP/D/TzWC41teRXW2GQsVXq2wcpnIQFiUowno1UU9mkhotfDcorCm3rOM+3E9THIZC
         hZogV3JqOfbncgm0uADJ8QSsrALPPPiGw3HYKLUMN12F3V7b8P5C8aZ/rhu2VJ38VCLa
         Ci08W3N0Xjf5CjH7CvqouRmQB4geyflse/V87opDwbt5uzJl/J1iIrLGzdDYyWZg25Wf
         5luGjsGvOhgT3hTJidkkjlGQHV7VzI2Fdk4EmpwON1+JhCaD3246uVzPfrA7KTeykX0+
         qmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZ2JoPc61pW3Rmd/WsSop2qi3/BURl9gxonuittJKcg=;
        b=ypgavHh1kuuCjFZtzMMial6pnlwxTIgxm7/ZVowIShREa3sq5YwkscEGQYJsw1MVz6
         YiW3r1FeE+oWcyxjngkrCHrKv/I4/D/huPZXoohjwgJin26/TLaoyigbLCFk/swvxfaC
         PaOiGECZNwWvIQ+/oRoGF6DJPSbMO6mVNLuLUc/tR7BIFocVhHsuGnUkIvb6Pmg5p+Gf
         U4xRjWmS9we4Wh4C1NfQUt7gxZVxyuQG7i2eaTeM/6UACvPp8Xlg1axGD3U7JUFYY5Bo
         L8nQgrzh+rlrbTpUSn8miwo0Tatop3IVKZe+DZu9JvLisiosHl9bFggZJV+e+Rb4OguV
         /QXQ==
X-Gm-Message-State: AOAM533qxGQeq/qv1mchEu3f6KqYCIAuCVUkXHeYZDa6RLSxYtx03qdq
        NNJasiyAGhYYXUDdF8uZmokNR7PzIemkAuqYx1h+xN8eoG0ykg==
X-Google-Smtp-Source: ABdhPJwUFWZ5CxeFaIiyB52WmMz+sP4mbkwFwr7p5Kr930TJmRHZGeG1jt5yAG4QkZeD6SufOQK9l/eYxapyM+dIkcU=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr14155084ejc.567.1635519815159;
 Fri, 29 Oct 2021 08:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com> <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
 <87fsskqvvc.fsf@kernel.org> <CAHp75VdHpHMp7X=8WcVbSUaT3pfxo-ZOTQ0BwdQqD09bJ2ddKg@mail.gmail.com>
 <877ddwqaas.fsf@kernel.org> <CAHp75VcwbVh7K=UMgiJ1QpaeB_f_==K4Ewzjt5OwYcOAXqiyUw@mail.gmail.com>
 <875ytgt1lm.fsf@kernel.org>
In-Reply-To: <875ytgt1lm.fsf@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Oct 2021 18:02:58 +0300
Message-ID: <CAHp75Vda4io2cvq-GOvWCPiEHPUpBofGqj=7EJr2maWhSLfDOw@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 29, 2021 at 4:14 PM Felipe Balbi <balbi@kernel.org> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> Take a breather Andy, you need it. Winter sure is coming

Indeed.

-- 
With Best Regards,
Andy Shevchenko

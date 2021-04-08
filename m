Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CD635797A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 03:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDHBRS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 21:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhDHBRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 21:17:17 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26C3C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 18:17:06 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id o5so699703qkb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RponVH/n0pFWeAldVZ4sD08GNccWTnm59ZDslhoHoI8=;
        b=iBGVFBxiMIY/WHY9U2+dk0mL9hmKnaVjUbryQlNgHHXCc+cZftQLQgTW3+vtrfj4cc
         FI9ICgXJ2YllVjB/zIujnGYD5u7ODgjWg4R5yTb+IeFhu+IhdjKMRkE3+oECw8umIwLZ
         2nuGUk7MJV8+Wsszk2EwJrPqUgrZkCri0TDtRN23nFN5NMvbjqocAQWhaguBejQJZptK
         Vett4vHV07sEi1iEVMH52KkWcrjVcynhfnpDHgnr/HGaNbOXMb7ecxnUkbIEXS/LILee
         IgdKLfOtZVk4toehA4Swe1AdlfPC3nBjsl5gOlR/ivUtEjvQIb4QrMdqeh97x9/OoyOU
         HiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RponVH/n0pFWeAldVZ4sD08GNccWTnm59ZDslhoHoI8=;
        b=Sc0DzQgsx4WuYKlXzuxzsrJBDL5AcVBrDZdJhYoMNR205bJmA5gWfd+0iUveXjrE/X
         15d0CJYSYrTBj+/SQGgXR2Fy6daCcalpxyel526qeudJxtSSGHyfjdzNlGAwNuxMpiEx
         emf9X4kxh2Nw8+kgHOUbt172kzm2R/eedusk/HDKU5RbV8HWoxxdgS1A5K/52SWT47ev
         0JV3ejzeGSKcPLUmzRGXp6ObAjmppWN/exVxQN63s/lHf7k4j09AoTOhB7m+W0fKRwG3
         CaNefEqdDFGdom924HRijvor5tR7xToxILhQ/fZ4IqAKbW2xblXPWonaHOYmcda3RJmI
         9U0w==
X-Gm-Message-State: AOAM533r27ylAWV+l3hWJIDnr0tqbQ5+04v59wMaHG3mpZ8i9cKXC1t0
        mkiNvNOwgvCth17WP9DtqIGVoRf5sD8AMkxjJqbChw==
X-Google-Smtp-Source: ABdhPJz3UZBfJjNTlP+uGEGfQYh2yVI4kGW+LUjXTJj1Heanc3aJJRzfi/+eypiUVBdXr/0LZzRlJHcikVMKUlbnY/8=
X-Received: by 2002:ae9:f312:: with SMTP id p18mr6207469qkg.162.1617844625938;
 Wed, 07 Apr 2021 18:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org>
 <20210406231909.3035267-2-dmitry.baryshkov@linaro.org> <161784119850.3790633.17698180700358661431@swboyd.mtv.corp.google.com>
 <CAA8EJpqVJgj0eBm5m91MNqiBZg0y1v=iMAuLpW8H-i3ut8-q0A@mail.gmail.com> <161784413353.3790633.12158005058384470922@swboyd.mtv.corp.google.com>
In-Reply-To: <161784413353.3790633.12158005058384470922@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 04:16:54 +0300
Message-ID: <CAA8EJprRt=mx5k6cGO91nmH8e1QkKTAnPasveFY7kVhgBBb42w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: separate SDM845 GCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRM DRIVER FOR MSM ADRENO GPU 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, open list:COMMON CLK FRAMEWORK" 
        <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Apr 2021 at 04:08, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-07 17:38:06)
> > Hello,
> >
> > On Thu, 8 Apr 2021 at 03:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2021-04-06 16:19:06)
> > > > Separate qcom,gcc-sdm845 clock bindings, adding required clocks and
> > > > clock-names properties.
> > >
> > > Yes, but why?
> >
> > Why separate or why add required clocks? Consider the rest of
>
> Why separate the binding from the overall gcc one.
>
> > bindings, where qcom,gcc.yaml defines older bindings, which do not use
> > clocks/clock-names and for newer bindings we have one file per binding
> > (qcom,gcc-apq8064.yaml, qcom,gcc-qcs404.yaml, qcom,gcc-sdx55.yaml,
> > qcom,gcc-sm8150.yaml, etc).
> >
> > Do you suggest merging all of them back into a single yaml file?
>
> No. Please add the "why" part to the commit text. The "how" and "what"
> should be clear from the patch itself. I guess "so we can add required
> clocks and clock-names properties to the binding" should be sufficient.

Ah, got you. Sorry for the confusion. Will send v3 shortly.

-- 
With best wishes
Dmitry

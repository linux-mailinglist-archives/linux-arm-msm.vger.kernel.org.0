Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF651FD37D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 19:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgFQR2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 13:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgFQR2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 13:28:40 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934F8C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:28:40 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 190so1852687vsr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UWll59MdN+ez6rWdnCElUjlRL1alI73PEwi04U04HAI=;
        b=CvnTOWt81baGdhjQChJpjeoBAJiA931fOK8jDOKIWzJx1WjRaeTmgcPKQ4GL8/VAnF
         CBPWQHyMTNs23BL/btIg4GSiZYTRy7ApJShGSsKJQ3Jmk61PA1L5zC6owRPNNDAkzFiU
         R7uHZ9DL3iZnfWBtoC9Mb9tZYMgBB1+aIBo7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UWll59MdN+ez6rWdnCElUjlRL1alI73PEwi04U04HAI=;
        b=a56aB8phMIGPEDkKolgWvbp8YDd5dWZpq2+6wnf/Hb898XmR1jwTWX3K8L1XEzEjQ8
         K1DSIjB0xxpL7NeIBLDCuxW16ww8rXK2hETYcIpij+u7P4wmzlYLSTzQq+VFHs+qGwQo
         WFxW9FcQouUkhV+cq6NjvpTTrZQtkb4VLgZdrTXqHdX8V0s3Op/G2f3+pzfX26JB6/6Z
         y6Tx1jWPzXkQLU77aJ+UDgqzgFQfrUUXyOYrK7dEQEY4se1s1iaMxiIQNnfnxlkOXk5c
         CyW3MQC8T4mcVTy8MEpflCem1eV98e3sPYPuWZC2kAJugVyfoDs895xg0KVXN/hRkaa8
         nw6w==
X-Gm-Message-State: AOAM530qZsnjomBnDNWFgXRIG7XeH6gk68y9kUHUjE9O3pTynlOhvhh+
        NuJWD09+G2aVi2B8AkmirVa+QvNVoCM=
X-Google-Smtp-Source: ABdhPJyegZ21adTJ34ah2y4Zshw764l2RHFekKUipj4KU/1RcGfvysb16E6CeejDNpCH2IKWp2d+Cg==
X-Received: by 2002:a67:8881:: with SMTP id k123mr205037vsd.198.1592414919313;
        Wed, 17 Jun 2020 10:28:39 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id z77sm50504vsz.31.2020.06.17.10.28.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 10:28:38 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id v6so1029531uam.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 10:28:37 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr55758uah.22.1592414917295;
 Wed, 17 Jun 2020 10:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
 <ed6d22a1-0d38-9874-d5cc-efe39f360baa@linaro.org> <0181cfe3-6627-e599-8f2f-1f433d9e0596@codeaurora.org>
In-Reply-To: <0181cfe3-6627-e599-8f2f-1f433d9e0596@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Jun 2020 10:28:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJeWudDDp79pZepX3o7yXUqEojy9_VM6ER4z-u=LK9eA@mail.gmail.com>
Message-ID: <CAD=FV=WJeWudDDp79pZepX3o7yXUqEojy9_VM6ER4z-u=LK9eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
To:     "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 17, 2020 at 9:26 AM Ravi Kumar Bokka (Temp)
<rbokka@codeaurora.org> wrote:
>
>
>
> On 6/17/2020 8:48 PM, Srinivas Kandagatla wrote:
> >
> >
> > On 17/06/2020 15:51, Douglas Anderson wrote:
> >> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >>
> >> This switches the bindings over from txt to yaml.
> >>
> >> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>
> >> Changes in v3:
> >> - Split conversion to yaml into separate patch new in v3.
> >> - Use 'const' for compatible instead of a 1-entry enum.
> >> - Changed filename to match compatible string.
> >> - Add #address-cells and #size-cells to list of properties.
> >> - Fixed up example.
> >>
> >>   .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
> >>   .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
> >>   2 files changed, 45 insertions(+), 35 deletions(-)
> >>   create mode 100644
> >> Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> new file mode 100644
> >> index 000000000000..5efa5e7c4d81
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> @@ -0,0 +1,45 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> >> +
> >> +maintainers:
> >> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> >> +
> >
> > Am not sure this was intentional, but the old maintainer name is totally
> > lost in this patch!
> >
> > Please fix this!
> >
>
> Hi Srinivas,
> The existed qfprom dt-bindings in .txt format.
> I will make it as it is to merge whole content in .yaml format once
> confirm all the parameters with this new driver changes.

Ah, right.  It makes more sense to set you as the maintainer since you
were listed as the maintainer for the Linux driver and also the author
of the old bindings.  I'll change it to you then.

Unless I hear otherwise, I'll plan to send out a v4 tomorrow with
feedback I've gotten today.

-Doug

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94444386C85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 23:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238360AbhEQVr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 17:47:27 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:46812 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 17:47:26 -0400
Received: by mail-ot1-f46.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso6829668otb.13;
        Mon, 17 May 2021 14:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2c29vC0qKcM3TMfW1PZOPvZHvtSH+6wwOr2TASgq6MI=;
        b=bE0fvRDZL9bxM7RTuzThM7sQpEavuiXjoNu6PpaYfmjpMqlzXASfnZ1+gNe7zYLOiW
         pdTXE7JfJmplOLQyzxuKyss1wGAD24zSJ2KSDbqw+Q5fkHd3ihp4HLWf/ideeVZkRymN
         ZBdWQMC3reg+0tUTUn3sbsHpv65zpuK/Ef3ww4FjtcMfBystpsUYzjeDv4ci90LMMP3b
         Phu3XeaOQwbRdFnSApzmk0PSo1cU2tFTt1+xc8AKjwMaLf0L2TcxbS8GNfDRG2d5+nvT
         GAD7AFp/FricvnoKOuJQe8vf59bap5T5JEgO+CJQ7HMWgnUQCohCIqBH0uRf7mRDzmzJ
         sM3Q==
X-Gm-Message-State: AOAM531Ocd6b/lPn7IqYZ0KjqkkCu9Azd4aq4v+aSOfO7pzvxDmzyDH7
        GVX4M9qT3yeBGeMJNBNSjQ==
X-Google-Smtp-Source: ABdhPJzu5K79pO87mnJ6hivClDDk5leBpMurj+pcIgh2s/97ouyz2PJUEJiqBLhW7sAC/lDGwGNjSw==
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr1283245otp.333.1621287969428;
        Mon, 17 May 2021 14:46:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 2sm3408945ota.67.2021.05.17.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:46:08 -0700 (PDT)
Received: (nullmailer pid 3258346 invoked by uid 1000);
        Mon, 17 May 2021 21:46:07 -0000
Date:   Mon, 17 May 2021 16:46:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        sbillaka@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Introduce Qualcomm eDP/DP PHY
 binding
Message-ID: <20210517214607.GA3253863@robh.at.kernel.org>
References: <20210511041930.592483-1-bjorn.andersson@linaro.org>
 <CAE-0n53CxUfHerU68ShKiDPGRSfB-2Cwbt+aHrQsyF6XSMc=CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53CxUfHerU68ShKiDPGRSfB-2Cwbt+aHrQsyF6XSMc=CA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 11, 2021 at 10:24:06AM -0700, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-05-10 21:19:29)
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > new file mode 100644
> > index 000000000000..c258e4f7e332
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm DP/eDP PHY
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  The Qualcomm DP/eDP PHY is found in a number of Qualcomm platform and
> > +  provides the physical interface for DisplayPort and Embedded Display Port.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sc8180x-dp-phy
> > +      - qcom,sc8180x-edp-phy

Is there a difference in DP and eDP?

> > +
> > +  reg:
> > +    items:
> > +      - description: PHY base register block
> > +      - description: tx0 register block
> > +      - description: tx1 register block
> > +      - description: PLL register block
> > +
> > +  clocks:
> > +    maxItems: 2
> 
> Can this be items: - const: again? I think having maxItems means you can
> have one or two items, which wouldn't match the number of clock-names
> then.

No, it's implicitly 'minItems: 2'. But you can have 'items' if a 
description of each clock is useful.

> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aux
> > +      - const: cfg_ahb
> > +

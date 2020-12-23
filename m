Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E26A2E202F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 18:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgLWRsu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Dec 2020 12:48:50 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:42890 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgLWRst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Dec 2020 12:48:49 -0500
Received: by mail-ot1-f47.google.com with SMTP id 11so15674556oty.9;
        Wed, 23 Dec 2020 09:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NBaB9OjMijuFYsb2tvjMMoxL90yaFegnbgOp9iG8S6M=;
        b=EEC55hmKR8zvfCBu2Bc7VE+QJzzJkp91+YrFILyqdvTVe7O+tSJXuL0MogdmouWrra
         D7UsDlvrD1tPKQ1QnfZpi3a6OqB7GGpDYoX1TP4XuYdo0oECVSiL+63dcHl4pL1diqDl
         jD0JA8Y6XhpVoJTNI/zCCQPfvNEFsQPjOQ4KcQxpRXJeu94uc9sQgCt7dKR32xqdGCSn
         UZGbSWx701nUVEzJg+iJJZZvwS5k1rvINPPSm2XGOl5hguX5Shc2pqA3RFe4VKfhQByW
         Y4fWDtRz8d5MfgDKUrlxJ+ahRR7YlrTB4XzPbr3LMO7WFtoNrkD2DIwi8LVqbVEnq/Vx
         I36Q==
X-Gm-Message-State: AOAM530MjHG4nUmuXZ5+1ZTZBPx+IvuNpEzRds976/M54Iib0lNIsNg6
        PYDMgOOByJy1uB+h8Dzuv8jl6/AMGw==
X-Google-Smtp-Source: ABdhPJxoWwcQacwQfDzYmYHALN0inf1lF38zJ2gBpVT5+u1qnAmMGIgV8+VGj0Yi7/asyEjmU3iMxA==
X-Received: by 2002:a9d:39c8:: with SMTP id y66mr15195298otb.68.1608745688762;
        Wed, 23 Dec 2020 09:48:08 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a15sm5434563oii.50.2020.12.23.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 09:48:07 -0800 (PST)
Received: (nullmailer pid 762426 invoked by uid 1000);
        Wed, 23 Dec 2020 17:47:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: spmi: document binding for the Mediatek SPMI controller
Date:   Wed, 23 Dec 2020 10:47:58 -0700
Message-Id: <1608745678.796615.762425.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 23 Dec 2020 10:44:27 +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1419576

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71105419424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 14:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhI0MZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 08:25:03 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:37870 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbhI0MZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 08:25:02 -0400
Received: by mail-oi1-f177.google.com with SMTP id w206so25364742oiw.4;
        Mon, 27 Sep 2021 05:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=2FOjpTM0F8xEU8mS0E5tOeoZE2kq70fSbscAVWi7m/M=;
        b=8SNIpqcsTpwfT6yus3lOM28Hlok1nfNPQDnmcDyV4AQgWvQl3wAwAwDh1GApzTYSB7
         bztcFSso6WHALcSiJeCrXRozLfPDvB7G4zdJ2yItOkRwz7TuR4V3oZEhcBSpxTKiGAB+
         t42oXYq5L53VIQyYhs6qcTgzWtaq7RcM8/ixV0k5du6Kl/z/8D75p0foOvsOPTtglheE
         GGmlZaMXa8+OXWwQdsXmWZSdI1o06DZZ/GTK56H/ax4CPrMPhCZSuAX01XK8DHXgCK0T
         aIpqT8NRaqRhdlebQHekLtnrro09YKiv9WTswyG2PHCODvHqZglCZ94sxT9zXbmOZYOi
         0+Rw==
X-Gm-Message-State: AOAM533XbXa/piXezmDO3y1RoiAlv42DXk8v3ei9LargCSkjngjDo8WY
        CUR4SoGeCErcbHmsWbtZtg==
X-Google-Smtp-Source: ABdhPJzAyWHfcy6Itaqvn8xBgYCq3A1CQXQnAw/QYF83umPvAPC9IBhN4BKD53X/0roppKfMVqvcFQ==
X-Received: by 2002:a05:6808:543:: with SMTP id i3mr11912240oig.46.1632745404285;
        Mon, 27 Sep 2021 05:23:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w14sm3965493oth.5.2021.09.27.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 05:23:23 -0700 (PDT)
Received: (nullmailer pid 3097155 invoked by uid 1000);
        Mon, 27 Sep 2021 12:23:19 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210927044824.30246-2-shawn.guo@linaro.org>
References: <20210927044824.30246-1-shawn.guo@linaro.org> <20210927044824.30246-2-shawn.guo@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qusb2: Add missing vdd-supply
Date:   Mon, 27 Sep 2021 07:23:19 -0500
Message-Id: <1632745399.271628.3097154.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Sep 2021 12:48:22 +0800, Shawn Guo wrote:
> Besides vdda-pll and vdda-phy-dpdm, vdd-supply is a required supply for
> PHY digital circuit operation.  Add it for correctness and completeness.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.example.dt.yaml: phy@7411000: 'vdd-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533177

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


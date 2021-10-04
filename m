Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A09E4216C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238831AbhJDSpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 14:45:03 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:45782 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238827AbhJDSpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 14:45:02 -0400
Received: by mail-oo1-f43.google.com with SMTP id y16-20020a4ade10000000b002b5dd6f4c8dso5662745oot.12;
        Mon, 04 Oct 2021 11:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F0wSL+i1Am4WOOv5bsuo1wbEnLjPgSwhJ/skurOdhOQ=;
        b=xFfWs0vuclcSF7RsCBA11sUEcmCuSXP2v97IEFMXV55bJBaVGl4vJeTAgwzulwwUQ8
         G5vAw2TjWjd+kJ1IIvQgNBOUAWCDyEoWbm0S77kwHZOZzxQpOpyGUiNiIHGIrffqtzUP
         cub9w+s5DroEn2bz2X3N3KDaYkkbfIIAgw1WzG9peoNzsPSmZJ67urdED8mRoI58YYv2
         BA9SEnGnOBan2cGNvmOEAEcEpfIGyWlvVQCkY1eHE1hAbx/v5YXHWLQ3+6FARheU5u5n
         g2338S/Pf3W7A7LtCf99poiyb+40CE6OpU2lZzxlwgZTiGp5jGMF/iZn/nGkpa1AEH7u
         7cig==
X-Gm-Message-State: AOAM531M9JOa4oqB2WdLl5E47E0fuGNZkUfFUag1nBC0Xc5BGlLb5xCz
        bDjU9lQk91HQC6eO2Os/Pg==
X-Google-Smtp-Source: ABdhPJxYX9baerLy4+YMrPbdb0uJ1lqI3hJaaC0hE8rDcEjVRmjPkHqt4iv4O0A5oS1raThW2ox4zQ==
X-Received: by 2002:a05:6820:3c9:: with SMTP id s9mr10196913ooj.81.1633372993057;
        Mon, 04 Oct 2021 11:43:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w7sm2813692oic.12.2021.10.04.11.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:43:12 -0700 (PDT)
Received: (nullmailer pid 1635638 invoked by uid 1000);
        Mon, 04 Oct 2021 18:43:11 -0000
Date:   Mon, 4 Oct 2021 13:43:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and IPQ8074
 PCIe PHY require no supply
Message-ID: <YVtLP7fGsClZQwRC@robh.at.kernel.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
 <20210929034253.24570-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929034253.24570-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Sep 2021 11:42:45 +0800, Shawn Guo wrote:
> The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> bindings to reflect it.
> 
> While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.
> And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> bindings.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 52 ++++++++++---------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

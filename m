Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB8B17E86D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgCIT3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:29:25 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35854 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgCIT3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:29:24 -0400
Received: by mail-pj1-f66.google.com with SMTP id l41so334841pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PjCahE7HDbhWso9X6d1lzPSE1/CDEaSUn45Mvn78hrg=;
        b=xRFA/xvQUxQ/6xcy+vthbrS8cMcvOJqFPfY+MOOQuO3UiIaxHA7QmLD2cXfq70ORvt
         4YhDNRrAODTMYmGfjYzmYu+XJybODGw/rvX3F6BtSYPX/8tIicTuBNq65Hyp3qa18/XQ
         dUmRnBBvrkGbjWXQbEwml0DRlZ3fRnI0jYtrufclmOfpOOvRh5NrOzXgBy+lE+YfVIqe
         HQ/8W+P+YGcbgOOr5JzrVm4d12Y0Ms3Nze795sGA0ltPWoQVNc5+QLZdV9J/HZxfY3/J
         Qinwu8ZFLQlg0NW5RpI6nCuaKZ5f1C6nngBuyuw+aR6ARGZwhzl1r2FqNzEE/Dz4u49z
         oAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PjCahE7HDbhWso9X6d1lzPSE1/CDEaSUn45Mvn78hrg=;
        b=CdKeGr9yz1wp4jzo/m4Mg5kurYQBP5HmRuUfOfZJIWz1VSGY64elW80CQLg7qOKTNW
         q2VH16Eh3mYgM+1Zss5y8c0KpwUz21GZ6378iVkbFsk8lhNc6NLx4mbxOpl+fZCCx5IK
         OmDDgBrxk7NdPPp14lf56Qq38vjZJmLFT0bpFmPEWLXDggYa9N6xuFRM/4hFo2LN44wa
         ujKYmA94N2j1Zl4kxGBsrFlSjxYR037dcndWfFWvBVYc80WaZvXMdBGtWOVF4CpiDP2U
         I5SJ/b9ckKKqWcbhNA35ffDR1P8mync05fLr2MOoSAe5lBze44lM/BkBiy58H5k7uXI1
         FP7w==
X-Gm-Message-State: ANhLgQ162ni9Mx1FyfjTdnejl4hnYk4qVkWiLdhhLQbwGN601bVvFxxt
        amypNAsMSBGPMhm6H6TggE78Jw==
X-Google-Smtp-Source: ADFU+vuecIUzxw+F0r5oweE7mmL21uOUoxea3p5BAhmf7NogmqrAB9MM2idoTRwQXH0m8Xl/9Kc1Lg==
X-Received: by 2002:a17:902:342:: with SMTP id 60mr16526200pld.206.1583782162073;
        Mon, 09 Mar 2020 12:29:22 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u19sm31438770pgf.11.2020.03.09.12.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:29:21 -0700 (PDT)
Date:   Mon, 9 Mar 2020 12:29:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 0/9] Add QUSB2 PHY support for SC7180
Message-ID: <20200309192919.GE1098305@builder>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Mar 02:53 PDT 2020, Sandeep Maheswaram wrote:

Kishon, let me know if/when you're picking up patch 1-6 and I can pick
the dts patches through the qcom soc tree.

Regards,
Bjorn

> Converting dt binding to yaml.
> Adding compatible for SC7180 in dt bindings.
> Added generic QUSB2 V2 PHY support and using the same SC7180 and SDM845.
> 
> Changes in v5:
> *Added the dt bindings which are applicable only to QUSB2 V2 PHY in 
>  separate block as per comments from Matthias in patch 1/9 and patch 4/9
>  and addressed Rob's comment in patch 1/9.
> *Separated the patch for new override params and added a local variable
>  to access overrides as per comments from Matthias patch 5/9 and 6/9.
> 
> Changes in v4:
> *Addressed Rob Herrings comments in dt bindings.
> *Added new structure for all the overriding tuning params.
> *Removed the sc7180 and sdm845 compatible from driver and added qusb2 v2 phy. 
> *Added the qusb2 v2 phy compatible in device tree for sc7180 and sdm845. 
> 
> Changes in v3:
> *Using the generic phy cfg table for QUSB2 V2 phy.
> *Added support for overriding tuning parameters in QUSB2 V2 PHY
> from device tree.
> 
> Changes in v2:
> Sorted the compatible in driver.
> Converted dt binding to yaml.
> Added compatible in yaml.
> 
> Sandeep Maheswaram (9):
>   dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
>   dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and
>     SC7180
>   phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
>   dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
>     parameters
>   phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
>     V2 PHY
>   phy: qcom-qusb2: Add new overriding tuning parameters in QUSB2 V2 PHY
>   arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
>   arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
>   arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP
>     device
> 
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 187 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +-
>  drivers/phy/qualcomm/phy-qcom-qusb2.c              | 144 +++++++++++-----
>  6 files changed, 297 insertions(+), 114 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CE11724BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 18:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729673AbgB0RO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 12:14:29 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35446 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgB0RO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 12:14:29 -0500
Received: by mail-ot1-f67.google.com with SMTP id r16so3663463otd.2;
        Thu, 27 Feb 2020 09:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xWFj6s6w7bzVI/mGXtzyUCX5BmjDePSa1uqHf99vqCI=;
        b=KD0iw3+yKHhD8i+SQ8mlvcw6V/N2KqumGMU5e/AdB71x1t1KoCPPS4hRbbn/WGmSyr
         GrZNJ1HAn6iSv3eiCencIc839Xoo9bnbJX5YuiXsHTi3yi637WzHdTThUBZ48Inb4dvz
         3iMRfBVuQ4OPfzuY/bjrgI01UTG2Ag7TMy/dwK5Qrwnenj/ACCkbPrUsRhZADntGX9YD
         vcnvdiRCg9jXRnwbLXRd+rANdT3xXO/5n45Mtq0/atEI6dmrpBldBnbgUMoUChEk3rOV
         okYPbGLtlEfB1fmwSP7zPQ5OfZSzAYFYwH9fibAhDj4LjZoSqQUIuW6bx1r6lzXHAOXD
         Q5Pg==
X-Gm-Message-State: APjAAAXje96oWksElU148Y6QJQnuNiLGy3SN68nE4mwpFEwYn77lVwCI
        kse7JR5wTKRUUcr/pIuMIw==
X-Google-Smtp-Source: APXvYqwTG+xn4o2LpWGhvd4hqOiDLF81SPIXSvpynmWA8pJrvjrriOR+yhStFXxxalEncjTTMJPOTw==
X-Received: by 2002:a05:6830:1385:: with SMTP id d5mr634228otq.61.1582823666913;
        Thu, 27 Feb 2020 09:14:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm2116210oij.19.2020.02.27.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 09:14:26 -0800 (PST)
Received: (nullmailer pid 10578 invoked by uid 1000);
        Thu, 27 Feb 2020 17:14:25 -0000
Date:   Thu, 27 Feb 2020 11:14:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
Message-ID: <20200227171425.GA4211@bogus>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Feb 2020 15:25:17 +0530, Sivaprakash Murugesan wrote:
> add dt-binding for ipq6018 apss clock controller
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Documentation/devicetree/bindings/clock/qcom,apsscc.example.dts:17:10: fatal error: dt-bindings/clock/qcom,gcc-ipq6018.h: No such file or directory
 #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,apsscc.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/clock/qcom,apsscc.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1245691
Please check and re-submit.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F28638CD93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 20:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbhEUSjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 14:39:19 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:36714 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235978AbhEUSjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 14:39:18 -0400
Received: by mail-oi1-f170.google.com with SMTP id t24so5029109oiw.3;
        Fri, 21 May 2021 11:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EcrkVcsgqQ0ZrJZJ5NdVvHpUDgnz1xVwfcl1R/5LgFk=;
        b=SU+K6Ty3uRLHt00KqZm2663d2Ae9Od0yur7yGtEA6apaL1XCKSVMJxeRAX0RqTTr4u
         6xqTxl5pztCfSjbwTAuJcvsBQXJm7jwmt/BiHsa3g++IsYHmg1NlcLw3BVCtSueLCdmP
         XciwAvuPfb4J51Ay+ZSMGBe3e8sfwYAgxfhNbCg+Pw5WfjdjABghrMg4wJfq4gWKUmId
         vPh7F7BvislW2skSyerJ6EfTbAdlHHc0TovUxcnCkQZ65tjJKjztc+lODJwxD98JG1Zz
         9MR0hvjAlb+eaS3jxuhdXhzG5BVBJCt9tT6FDuzNbDYyNc1Xw7AWU1XSgtV5H9Dk3cun
         pApg==
X-Gm-Message-State: AOAM530CxIgU2sNWKy6+7eHjKInxYA4HNpwM+5f/alctmNVdjwfgbRlB
        RXgaxfSfVcbFlIgmDlKFWg==
X-Google-Smtp-Source: ABdhPJyGW8FC1t+HJJPb75LnLdqG2Dy4aj9s50YmFM5qVud7SCTQuy/B3kAEP23VC/Vscifzd5SzJw==
X-Received: by 2002:aca:2b16:: with SMTP id i22mr3182531oik.121.1621622274420;
        Fri, 21 May 2021 11:37:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a7sm1356744ooo.9.2021.05.21.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 11:37:53 -0700 (PDT)
Received: (nullmailer pid 178646 invoked by uid 1000);
        Fri, 21 May 2021 18:37:52 -0000
Date:   Fri, 21 May 2021 13:37:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
        vinod.koul@linaro.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        tanmay@codeaurora.org, kalyan_t@codeaurora.org,
        Vara Reddy <varar@codeaurora.org>, bjorn.andersson@linaro.org,
        abhinavk@codeaurora.org, khsieh@codeaurora.org
Subject: Re: [PATCH v17 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
Message-ID: <20210521183752.GA178583@robh.at.kernel.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 May 2021 15:57:24 +0530, Krishna Manikandan wrote:
> Add bindings for Snapdragon DisplayPort controller driver.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in V2:
> -Provide details about sel-gpio
> 
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
> 
> Changes in V5:
> -moved dp.txt to yaml file
> 
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
> 
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
> 
> Changes in v8:
> - Add MDSS AHB clock in bindings
> 
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
> 
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
> 
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
> 
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
> 
> Changes in v13:
> - add assigned-clocks
> - add assigned-clock-parents
> 
> Changes in v14:
> - add reference for ports (Rob Herring)
> 
> Changes in v15:
> - drop common properties from ports (Rob Herring)
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

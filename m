Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDC01443FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 19:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgAUSEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 13:04:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38555 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgAUSEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 13:04:38 -0500
Received: by mail-oi1-f194.google.com with SMTP id l9so3444652oii.5;
        Tue, 21 Jan 2020 10:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5AOc1fVDSObIakXLqV48NhVm6z9cVbBEAMQpRuKiW50=;
        b=mu0BSfSIm7zEE2Lc55hQxXG3Q60EEz3iM4Kxy5Vij9LAMf9KOBcfld2nlbTCheKGJA
         x3yRkM44/ifHS1F0nr+EagFu9nINrVltIcNpcLdRvTtQkI1CZa35BpV9BvIfxHCMemJ8
         yDE9AMdfMIiCR00geQZ3oW97FPQyS//AyNkc7+IRWU5tHbcoX73/jTaJmcTfE3G08u87
         cPOkcBVsM/DSfLMm17DK3hfxP4AkpbteHWLPN5xlm2Ifz+2vcAtUH1mYvC5SITTX+aA/
         A/k09na8six6Ieu4khiLvakNwAJNvAAWFcAdA2KG8XNkDRrpCCzrVPuNaKScI3r0yFUj
         Rm2Q==
X-Gm-Message-State: APjAAAXm4WEXWtk2Ez307aVqq59/XhZMEpoyQvi0zOqF4f6da7yKkLcW
        YkZ2md0JAnxfqyCAAA1hSF10zTI=
X-Google-Smtp-Source: APXvYqxJ2H+vZyDN3gmn4pC4D+ZcrNIsyxhR4/L25BmvN4Dqt/xngylC9DS3CsGIERCxiizPEYHg3w==
X-Received: by 2002:aca:503:: with SMTP id 3mr3791581oif.24.1579629877653;
        Tue, 21 Jan 2020 10:04:37 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l17sm6793267otj.21.2020.01.21.10.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 10:04:37 -0800 (PST)
Received: (nullmailer pid 7135 invoked by uid 1000);
        Tue, 21 Jan 2020 18:04:36 -0000
Date:   Tue, 21 Jan 2020 12:04:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20200121180436.GA6701@bogus>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
 <20200120163116.1197682-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120163116.1197682-5-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jan 2020 16:31:01 +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
> controller embedded in QCS404.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> definitions.
> 
> [bod: converted to yaml format]
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-ss.example.dt.yaml: usb3-phy@78000: clock-names:2: 'sleep' was expected

See https://patchwork.ozlabs.org/patch/1226060
Please check and re-submit.

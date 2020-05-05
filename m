Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2AE1C570B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 15:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgEENeN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 09:34:13 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41106 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgEENeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 09:34:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id c3so1599227otp.8;
        Tue, 05 May 2020 06:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PsjcTsG/gjBsqBJgHVlid+3Mm782eXV4Fl6ucMTeSJY=;
        b=g0DMiLC3oTqOfJAIRYjC5H6I4dpZseKlwHFxXx/qUXM9eMOYjrpBfMmmKOQRILvIVV
         9JnrAYWMF1E+RZRoum9jAsJ2ZwCxZgPBOkYbL1c3u6SNxHchdp517rBXpuEq/vYxaTLm
         LXlfxlp98IqA5rJ1w5p+uaD7hkFdQg6GLuzBEcscfQOaj5pSynf/G8pN+SXfZoOA7Xrc
         o32fHqnsqX+1uok/Kw0i9JhvCU1CYNvk/EFVTwM9Q2e8ev0D8665TfY064Tlydi/1kpD
         VNBkHAHJLPA1xLMhvvtc+l+tPMjQAgakzPQTkkqLCtFAWbJf1jVEeXixl0o7/YCX+hV7
         I9pg==
X-Gm-Message-State: AGi0PubUjx4xseRr97MK/y/52Qg42/de0XMF+7+N2WT5RYuqQtNprB+c
        X+Rj5JltFscZBAcPD2eEdA==
X-Google-Smtp-Source: APiQypJhIFWNLw18Q+hIiasPVcWn91Fm5B/gR5rb3vMJKDZknTfScGx82vRxm9AubbYYAxYJ7/23iw==
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr2068968ote.141.1588685650099;
        Tue, 05 May 2020 06:34:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e91sm610862otb.40.2020.05.05.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:34:09 -0700 (PDT)
Received: (nullmailer pid 25501 invoked by uid 1000);
        Tue, 05 May 2020 13:34:08 -0000
Date:   Tue, 5 May 2020 08:34:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, vkoul@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH v8 1/5] dt-bindings: phy: Add binding for
 qcom,usb-snps-femto-v2
Message-ID: <20200505133408.GA24731@bogus>
References: <1588636467-23409-1-git-send-email-wcheng@codeaurora.org>
 <1588636467-23409-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588636467-23409-2-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  4 May 2020 16:54:23 -0700, Wesley Cheng wrote:
> This binding shows the descriptions and properties for the
> Synopsis Femto USB PHY V2 used on QCOM platforms.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda-pll-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda18-supply' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda33-supply' is a required property

See https://patchwork.ozlabs.org/patch/1283143

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

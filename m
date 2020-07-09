Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E82B21A8E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGIUZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:25:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41307 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGIUZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:25:36 -0400
Received: by mail-io1-f65.google.com with SMTP id o5so3688495iow.8;
        Thu, 09 Jul 2020 13:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gB+TJBo4jwSPKnuZ4I54QRWbT+GZvVYToFIo0A59PEk=;
        b=Iv0ZpZSsG4Ve90G0Iag+NdHzXqYb6N+OyT/xO639DtCvKIjtNdSTBUK4AE+WcRwUk7
         l1h8Lm5TxmsWadkB8ZAaq4IMtlUKLiHOzxZuO+2PHfGAT0YaGZz5FH6REkG4OggJ7mh2
         TZFGF+17jZdBBZWvbvdzOa5dz6MukCUfD/InhcFUHMFsjeqP5GDl8t+hlgWkVsmr+7Wu
         F+BNjPOnGWtRe2GmlUtS3/2FABCfVpHqfmwoFnBUphZTfvJ0WPirhA+Mj2H2FYz7dXqP
         ZR+KMIsgbsaB8pooCjvMYjh+fdIyh2PakhicFhTLwPrwR21qFgL3/9Tp6lmR2kwfllvd
         8U/w==
X-Gm-Message-State: AOAM5323N1bMjv9czSNhjTjCG10zyVVzAA6DO9HklrGyQU8gt+XUCge+
        u7PPBG+GyciETyOwgq5+xg==
X-Google-Smtp-Source: ABdhPJywySDNWQF8EEE70975VZPQ+l79RtOSVMqnNVbgPGiWjw8WBfjhfCfRyEEqFWiv7B1J1X2bVA==
X-Received: by 2002:a05:6638:1511:: with SMTP id b17mr66676337jat.113.1594326335459;
        Thu, 09 Jul 2020 13:25:35 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id k1sm2328118ilr.35.2020.07.09.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:25:34 -0700 (PDT)
Received: (nullmailer pid 829870 invoked by uid 1000);
        Thu, 09 Jul 2020 20:25:33 -0000
Date:   Thu, 9 Jul 2020 14:25:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RESEND PATCH v7 2/2] devicetree: bindings: phy: Document
 ipq806x dwc3 qcom phy
Message-ID: <20200709202533.GA829809@bogus>
References: <20200615205333.20747-1-ansuelsmth@gmail.com>
 <20200615205333.20747-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615205333.20747-2-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Jun 2020 22:53:27 +0200, Ansuel Smith wrote:
> Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> inizialize and use usb on ipq806x SoC.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v7:
> * Drop useless AllOf
> v6:
> * Add maximum value
> v5:
> * Fix dt_binding_check error
> v4:
> * Add qcom to specific bindings
> v3:
> * Use explicit reg instead of regmap
> 
>  .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 55 ++++++++++++++
>  .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 73 +++++++++++++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

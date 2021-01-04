Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5733F2E9D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 19:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbhADSh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 13:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbhADSh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 13:37:56 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08241C061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 10:37:10 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id l207so33179589oib.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D0br3wkGScF5qbNK3FSimsSwz8m6L15tNlHZCr/gQ1E=;
        b=xeWdQz/PuaexWTTzQl1bJT9cuC98+rdp2YshmMf1IvsDTs6pnBX6F4tzfHjYe2G51P
         pEG3RHn129a1qPg9bUri2XChBaA9earXdW2YUEkiaqeAUjB1gzfreu6YQ1D+drImPoMZ
         LrnO+KOCiGVmVsiZHwOExgOhDXirFn722+up51qABGixHpgVI83r+vZI7tdkVFLSE6z4
         7yOcBIJU5lj+atKfj3iZ5otp+DZgf5a2NLsrwiav4qx1EwlujRyUmMr8F+KpUTuXpdsY
         NDMwIf5SERQ1jM1HzL2xjSydXRuB8TAyocpRbDlHNmeAHRRHVVUgfB+3SibCUkOFhFg+
         6C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D0br3wkGScF5qbNK3FSimsSwz8m6L15tNlHZCr/gQ1E=;
        b=MW88fyd/RDOKO7M1QZnH6qsWsInGfNb5+TWu3BrZPyqwU9ucj43O4+7A6821xHglpR
         4Cn/vz40bJ/yNV7HjeS9xoO0bb9FBcOH3JI5mkBeXABwyBG67wQhM8H4/cguLqU7/gST
         aInftmuzI6XiCij3yRpcIZ5FdV1f+o7PSogUnfSxgQAiM2FCsX709t34jvmrcMaz0fQ8
         PWZ4nAQP4irjhSGGGJVFg/h9MMwIqwtzjRYdqdaVw3LNH5VDGNSZsoex3u8b9zEMVUrY
         vYHbxZK5DsQ3UQeCyszGOHgzNIR507JrDg2FZEVQPdQVA35KW7p+AJwCiwgwZObrCiTd
         7pNg==
X-Gm-Message-State: AOAM533PEqb1kx88Xrb1VxPjhu9eTj3BvC6M5HkCrB4KQclQfQ3gbGF9
        CjslVXDwtxMHI6ELOJYPjZxaRw==
X-Google-Smtp-Source: ABdhPJwk5OyQVNrEWQj2HcRNSEsj5SteHD+WK+zbUk8xyIFouWIvjIDbz7gsJCyn0Xc5QcGcJCOIgg==
X-Received: by 2002:a05:6808:7d0:: with SMTP id f16mr160921oij.109.1609785429256;
        Mon, 04 Jan 2021 10:37:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g3sm12866008ooi.28.2021.01.04.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 10:37:08 -0800 (PST)
Date:   Mon, 4 Jan 2021 12:37:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <X/NgUp/pm9T0JlTw@builder.lan>
References: <20201208085748.3684670-1-vkoul@kernel.org>
 <20201210135253.GA2405508@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210135253.GA2405508@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Dec 07:52 CST 2020, Rob Herring wrote:

> On Tue, Dec 08, 2020 at 02:27:47PM +0530, Vinod Koul wrote:
> > Add device tree binding Documentation details for Qualcomm SM8350
> > pinctrl driver.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > 
> > Changes since v1:
> >   - Fix pins pattern
> >   - Fix example indent
> > 
> >  .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 151 ++++++++++++++++++
> >  1 file changed, 151 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..8ddb347c43da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> > @@ -0,0 +1,151 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> > +
> > +maintainers:
> > +  - Vinod Koul <vkoul@kernel.org>
> > +
> > +description: |
> > +  This binding describes the Top Level Mode Multiplexer block found in the
> > +  SM8350 platform.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm8350-pinctrl
> 
> If this block is called TLMM, then I'd expect that to be in the 
> compatible string. But I guess this is consistent with the others.
> 

This is my mistake 7 years ago and it bothers me every time we write a
new one of these - in particular since we now support a few different
"Qualcomm pinctrl" blocks.

It would be ugly for a while, but I'm in favor of naming these
"qcom,<platform>-tlmm" going forward.

PS. And we can solve the ugliness by introducing the "proper" naming
(and keeping the old one for backwards compatibility) as we migrate the
binding documents to yaml.

Regards,
Bjorn

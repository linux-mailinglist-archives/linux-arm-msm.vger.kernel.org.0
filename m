Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032CE25C67C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 18:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgICQQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 12:16:02 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42084 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgICQQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 12:16:01 -0400
Received: by mail-io1-f67.google.com with SMTP id g13so3431484ioo.9;
        Thu, 03 Sep 2020 09:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aRpXw0UbRTPbhJ/yLHPK1gcSS9wZa5nlQ57yNuPlD2w=;
        b=OD62LRGU6l+PfbXUWMGjRWUIq2gJh4DmUDOP4M1fnCe0JH4ViL7DzW9Qx6zjFHVWnZ
         2HXe3ZsQSCUYAbRNwlwGc5XIwU+ZiXftp8r29d5V58C60SKjNCh5nkflbymXvQ+Mxqxr
         z7yDObr6wIFiBo2fCKqh8+ARlxlK3jhrD4gY75PaLO9tm1hj/59SZer1rpoJxMsExNrN
         PMw23oTzEHqpyJr37vtUG26917zIUGd4JSFjJCzpvlpWyuwiVOUMnIU3SFEOc4XEzQPa
         Pz9/FcBEEtCZPfTSOL8DpFHzT13Q11xPZ3HGQ31+TkRPQ8bzMLXSADGvjKhfEqusmCuz
         h9dg==
X-Gm-Message-State: AOAM531AXEw6SyXH5brY2uUTaCshcUmeLEMSwhNJgCS01Oz6i/r6t1FK
        xbFarI2gh8qpIp5dNTLQBQ==
X-Google-Smtp-Source: ABdhPJwdxVwN2yKmnkzzjPDJiU7NfowwP3seclbUfSK6U54i5UqJvI9YZhaeiy0N2DFoPmoY75/WBA==
X-Received: by 2002:a05:6602:22d3:: with SMTP id e19mr3646125ioe.197.1599149760551;
        Thu, 03 Sep 2020 09:16:00 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id l2sm1699320ilt.2.2020.09.03.09.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:16:00 -0700 (PDT)
Received: (nullmailer pid 2878544 invoked by uid 1000);
        Thu, 03 Sep 2020 16:15:59 -0000
Date:   Thu, 3 Sep 2020 10:15:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: clock: sdm845-dispcc: same name for
 dp_phy clocks as sc7180
Message-ID: <20200903161559.GA2877650@bogus>
References: <20200902183852.14510-1-jonathan@marek.ca>
 <20200902183852.14510-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902183852.14510-2-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 02 Sep 2020 14:38:41 -0400, Jonathan Marek wrote:
> This makes it easier to combine dt bindings for sdm845/sc7180 dispcc.
> 
> Note: nothing upstream provides these clocks and the sdm845 dispcc driver
> hasn't switched to using .fw_name for these clocks (these properties are
> ignored), so changing this shouldn't be a problem.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/clock/qcom,sdm845-dispcc.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.example.dt.yaml: clock-controller@af00000: clock-names:7: 'dp_phy_pll_link_clk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.example.dt.yaml: clock-controller@af00000: clock-names:8: 'dp_phy_pll_vco_div_clk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml


See https://patchwork.ozlabs.org/patch/1356040

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


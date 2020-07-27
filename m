Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7D622F77B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 20:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbgG0SOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 14:14:00 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42153 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731250AbgG0SN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 14:13:59 -0400
Received: by mail-il1-f196.google.com with SMTP id i138so8006560ild.9;
        Mon, 27 Jul 2020 11:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qphSXwUDbDL/STSwZyNfj+0kNYsQNz0+uZs8OU4m+yA=;
        b=qvBpVHSwS/omHvl2saFmqdD9UELRonQdpK3bPLQIxOezLda6RPWbCdDBLqpSQCXuUS
         vJ/aE6yYLdYyBKidQ2RxfyKNhhE9rso0VwY4lvd8S6jh5mn8CovBiDX++hA68ZgcKFuq
         0jxkKVaHUPwfN8uFzEiAMVaAAz9mXJhx3QPOfrQyRnORhllbokFDYh30mnCgGU3kGF0O
         6Gg05a59kw99PVuVM9fFP1WCj7PoEnnY/N/K8/5ziHE3Pn7StQ9a2YKGhVUaDNQz+BuF
         U3/R1KZ0/52Mj6BrNsOsKKB0uyXsv1YsmN7rEFw4BdPCYk0rYMztNiIOsAJfAoxV3dOE
         XpwQ==
X-Gm-Message-State: AOAM531ylHtovtu6XLArMXS3l7VlMASx5cuJO7/WeoXaTgW0/14AYbF3
        ePUXRa1+KWsvmhsBSQ51mQ==
X-Google-Smtp-Source: ABdhPJxgiypIQYIODHYWAN1gC3+lDaAHwErFKahF6Ut43xD7/abYM0/1Z1iU78NrtHLEqfkyGnVtBQ==
X-Received: by 2002:a05:6e02:1213:: with SMTP id a19mr3107446ilq.129.1595873638096;
        Mon, 27 Jul 2020 11:13:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z68sm1237830ilf.25.2020.07.27.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 11:13:57 -0700 (PDT)
Received: (nullmailer pid 638572 invoked by uid 1000);
        Mon, 27 Jul 2020 18:13:52 -0000
Date:   Mon, 27 Jul 2020 12:13:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Wilczynski <kw@linux.com>,
        Vinod Koul <vkoul@kernel.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Sean Paul <sean@poorly.run>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        zhengbin <zhengbin13@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, martin.botka1@gmail.com,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200727181352.GB634850@bogus>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-10-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-10-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Jul 2020 13:12:06 +0200, Konrad Dybcio wrote:
> From: Xiaozhe Shi <xiaozhes@codeaurora.org>
> 
> Add the REVID device driver. The REVID driver will print out the PMIC
> revision at probe time.
> 
> Signed-off-by: Xiaozhe Shi <xiaozhes@codeaurora.org>
> [konradybcio@gmail.com: Fast-forward the driver from kernel 4.14 to 5.8,
> convert binding to yaml]
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../bindings/soc/qcom/qcom,qpnp-revid.yaml    |  38 ++
>  drivers/soc/qcom/Kconfig                      |   9 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
>  include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
>  5 files changed, 705 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
>  create mode 100644 drivers/soc/qcom/qpnp-revid.c
>  create mode 100644 include/linux/qpnp/qpnp-revid.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml:  while scanning a block scalar
  in "<unicode string>", line 22, column 18
found a tab character where an indentation space is expected
  in "<unicode string>", line 24, column 1
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1336467

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


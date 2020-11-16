Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03712B4969
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 16:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730646AbgKPPcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 10:32:07 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46109 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730309AbgKPPcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 10:32:05 -0500
Received: by mail-ot1-f65.google.com with SMTP id g19so16336289otp.13;
        Mon, 16 Nov 2020 07:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wixeaOXGt4VS5H1X/I4umvvniIQSQv3LBR9erOlmCDg=;
        b=ZK/9QBLL0dWF4IxjL0B6v3H6UswXUiWPDSGiT4UXbWKH2lNyaeWYyWv7qypmbCiEhb
         pR88/NpU1NZTuer/jGYxkkNBHIwOmt43v7twfOV4a8i+Bw779jQ2QKSNb18JMdKZJI3n
         5jw+TaYvwJih7OTGV+cBAwzF04MUy7jFTBZ6bGqNdJAQ0kUE9zvKxrNJ8hjHhlhPjr1y
         tbUlgjqvM0JkuWLtsQsh9jjzI4+t7LGaIHEqCkkarHoL5pmn7ZO49N3JBDVP0q7HWZiH
         F+4iaQMEPNhuu8Zu4t2WQSHjMMwQE1h0U5qnYgMWSIJ8OjQ7C5+6lnz4C7TQ7/a7880x
         MjSg==
X-Gm-Message-State: AOAM531CoTV0IOFIfgn8cqOcPu1cvh7w8j67DFTt6bO9b+wnTkClyira
        WHb9KYHZ4y+H9AlPo4IN7A==
X-Google-Smtp-Source: ABdhPJxGhcMJL/DOYks58mO9JJMSpwwlGx6zJQaXkutaB4fNQpZUlOZri1r+ZjQNCziItAYEQLnZQA==
X-Received: by 2002:a9d:470c:: with SMTP id a12mr11470030otf.161.1605540724371;
        Mon, 16 Nov 2020 07:32:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t19sm4730619otp.51.2020.11.16.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:32:03 -0800 (PST)
Received: (nullmailer pid 1685415 invoked by uid 1000);
        Mon, 16 Nov 2020 15:32:02 -0000
Date:   Mon, 16 Nov 2020 09:32:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>, mauro.chehab@huawei.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mayulong <mayulong1@huawei.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devel@driverdev.osuosl.org
Subject: Re: [PATCH 2/8] spmi: hi6421-spmi-pmic: move driver from staging
Message-ID: <20201116153202.GA1685169@bogus>
References: <cover.1605530560.git.mchehab+huawei@kernel.org>
 <7e01d84b31d561fa4df1d42369e4222f4a41a8d3.1605530560.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e01d84b31d561fa4df1d42369e4222f4a41a8d3.1605530560.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Nov 2020 13:59:28 +0100, Mauro Carvalho Chehab wrote:
> The Hisilicon 6421v600 SPMI driver is ready for mainstream.
> 
> So, move it from staging.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  62 +++
>  MAINTAINERS                                   |   7 +
>  drivers/spmi/Kconfig                          |   9 +
>  drivers/spmi/Makefile                         |   1 +
>  drivers/spmi/hisi-spmi-controller.c           | 358 ++++++++++++++++++
>  drivers/staging/hikey9xx/Kconfig              |  11 -
>  drivers/staging/hikey9xx/Makefile             |   1 -
>  .../staging/hikey9xx/hisi-spmi-controller.c   | 358 ------------------
>  .../hisilicon,hisi-spmi-controller.yaml       |  62 ---
>  9 files changed, 437 insertions(+), 432 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
>  create mode 100644 drivers/spmi/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
>  delete mode 100644 drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml:34:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dts:29.20-31.15: Warning (unit_address_vs_reg): /example-0/bus/spmi@fff24000/pmic@0: node has a unit name, but no reg or ranges property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: spmi@fff24000: pmic@0: 'reg' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml


See https://patchwork.ozlabs.org/patch/1400897

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


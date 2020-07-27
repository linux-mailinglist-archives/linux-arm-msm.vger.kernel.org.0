Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAB222F76C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 20:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbgG0SNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 14:13:52 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36087 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgG0SNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 14:13:52 -0400
Received: by mail-il1-f194.google.com with SMTP id z3so3673526ilh.3;
        Mon, 27 Jul 2020 11:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FezFginUTy2nglTrBQrbccgUu3m/rgDlVyShBQFXbuM=;
        b=HfzXlKqcU5oWxENTYnB2cM0h/mDjkeheLT5qiOyyLv0UV5kzbx2wyw/Q/0Pi8tb9BH
         kjtl+RIFEHVJ6J473PunNXxQuk5hJvoijHnyXsYcTiRhr9W69qb+pN0WevFXd1PJuq6V
         0KDZ8FLpiogNRXDNAY8AYntD3xi9hrIRsMWYLAyKWoatfteE3Yk1br9Q3FzyOu1o5fJV
         66bQRlQHriOvMkFigq+rRZCP3neNgaPK1GVBrmRF4/z+B3WQiuZoJn+w9QgPysMCeyv4
         FwyQrf3FI4zEo16Lrif2i3rq99zOnvMBm0XNIODx6qaq8Owb6fP/Ea8GRgbboBTq1KLd
         ZBRw==
X-Gm-Message-State: AOAM530IK2lFEHVwffUu3GpyutQswwfdKRFlE05ez9GIWqkoBPpNScL1
        zpWkQOxWx2W6JPrpYWHDtQ==
X-Google-Smtp-Source: ABdhPJxcTZ1wWiZQBj6GSHPIlQHm9ClLpwRYBVSWGAnLwaItX6R/lSkREMbAFXVOnxUjPhxCOFMv7g==
X-Received: by 2002:a05:6e02:8e4:: with SMTP id n4mr16683067ilt.96.1595873631429;
        Mon, 27 Jul 2020 11:13:51 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c67sm9202464iof.16.2020.07.27.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 11:13:50 -0700 (PDT)
Received: (nullmailer pid 638435 invoked by uid 1000);
        Mon, 27 Jul 2020 18:13:46 -0000
Date:   Mon, 27 Jul 2020 12:13:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 9/9] soc/qcom: Add REVID driver
Message-ID: <20200727181346.GA634850@bogus>
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

On Sun, Jul 26, 2020 at 01:12:06PM +0200, Konrad Dybcio wrote:
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

Bindings should be a separate patch. checkpatch.pl will tell you this.

>  drivers/soc/qcom/Kconfig                      |   9 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/qpnp-revid.c                 | 288 ++++++++++++++
>  include/linux/qpnp/qpnp-revid.h               | 369 ++++++++++++++++++
>  5 files changed, 705 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,qpnp-revid.yaml
>  create mode 100644 drivers/soc/qcom/qpnp-revid.c
>  create mode 100644 include/linux/qpnp/qpnp-revid.h

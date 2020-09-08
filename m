Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E0A26233E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 00:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIHWwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 18:52:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45708 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgIHWwk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 18:52:40 -0400
Received: by mail-io1-f67.google.com with SMTP id u126so1103827iod.12;
        Tue, 08 Sep 2020 15:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DUYMnk7PRl3sB9Bca/Be0LywxiUDpv8Bgnx3Ft4Wtmo=;
        b=TNv9MDaEkWbznO0oTupeD1itQZB601AF49VxjF+AzVeicPj3M0g74Kh7+ApdVfJEP3
         zq9ztXfUZSKCfdmqFMtHDypJYGwerHEPh65imoztmKHKdiVgvWwJjbYZEWFQ+8lqlNkb
         T+9Klxezd3PbFth9F4mpPZo0Hvd2aV7cDPhSmmJHY/GjMBjxNuD9qsORMsYm2Bgp8gig
         mXaR27nF6wP/oYA7MiSwvPqxy4HQDgcn9UKGtrIjhxc7/Nxtet4DOUo2cjl4znhDDoKg
         uZlD4kdzapW0D6xRjqnlXWR6s5FspHERkrrqJWKrWdxndCQYSxNoC121LOJEQuShP0Jg
         0T/w==
X-Gm-Message-State: AOAM533iHBRQhHDZp+mkFgbV2uznBNIr/jxjSt8ec/UAuqwYjliW28HM
        VC+kd+CdMGbUrjiW/nPQVIMcPollJ77Z
X-Google-Smtp-Source: ABdhPJyLN1DM+y0pUvY2QC8gx3izn1RfXVEGuNZM0Hvtj4/2y0eMlPyTtpv68XKJRfspgZdLudDhvQ==
X-Received: by 2002:a05:6638:3ea:: with SMTP id s10mr1302143jaq.2.1599605558989;
        Tue, 08 Sep 2020 15:52:38 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id 137sm394681ioc.20.2020.09.08.15.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:52:38 -0700 (PDT)
Received: (nullmailer pid 1088092 invoked by uid 1000);
        Tue, 08 Sep 2020 22:52:34 -0000
Date:   Tue, 8 Sep 2020 16:52:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Josh Cartwright <joshc@codeaurora.org>,
        mauro.chehab@huawei.com, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxarm@huawei.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: convert spmi.txt to spmi.yaml
Message-ID: <20200908225234.GA1088015@bogus>
References: <20200826061150.3eb96ab3@coco.lan>
 <ee4c4ca9f29a39f6af772b3a526a996176499da3.1598415179.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee4c4ca9f29a39f6af772b3a526a996176499da3.1598415179.git.mchehab+huawei@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Aug 2020 06:36:49 +0200, Mauro Carvalho Chehab wrote:
> Convert the SPMI bus documentation to JSON/yaml.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> v2:
> - addressed issues pointed by Rob;
> - made clear that group ID is a future extension, that it is not
>   currently supported.
> 
>  .../bindings/mfd/qcom,spmi-pmic.txt           |  2 +-
>  .../bindings/spmi/qcom,spmi-pmic-arb.txt      |  4 +-
>  .../devicetree/bindings/spmi/spmi.txt         | 41 ----------
>  .../devicetree/bindings/spmi/spmi.yaml        | 75 +++++++++++++++++++
>  4 files changed, 78 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spmi/spmi.txt
>  create mode 100644 Documentation/devicetree/bindings/spmi/spmi.yaml
> 

Applied, thanks!

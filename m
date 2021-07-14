Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858C83C9261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhGNUtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:49:42 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:38572 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhGNUtl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:49:41 -0400
Received: by mail-il1-f171.google.com with SMTP id e2so2933377ilu.5;
        Wed, 14 Jul 2021 13:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bgvj/SJ/AqigmGZ6fxs5N5l8G6izL9YxC3iPTOMdD6s=;
        b=SVA9CX9rAtY8KuE1kpMG4f0GGznAOcvHYY6Kq2WMBAA/AMtTxk4kj+iR15WaqTooke
         TtVgCcuUYBkdtNgu9aGVqq2mOtdEGW5dzb6WzN/pUi1bdvxofpFZFY7yvKiauCeqSA2k
         h9vD7VSbeWzDtIAvQ6dGQlAaOSd70LK2Qt4dGdGVsiCxdcvdMC2AFh5hWCy33c6AaRAf
         v9cFfo+E+loZzAkaSR8Y0BH6WwzFQpZ1O+dWvaXF6AmpaOyV+grWjtdWT5n2yOjOX0sv
         eyfe9a37p6Paln9GI5fZq+90TPeSvwEoHza9et4aUrfw3CwZYAVuQHm53iMHfgllxyGl
         ZtVg==
X-Gm-Message-State: AOAM5305DUo3g15sumRXf+jqPdj2crYrSHcU8dMtu01KfaDBYBUL8ksi
        JrqAEX1dxzrtVV/RZBfkWQ==
X-Google-Smtp-Source: ABdhPJyuEc2hl418Ur5eqpgXhulnn/slL25AuA2kwT0+WKbjntZFyl4jzNA/MF3uxvxiked/D64mQQ==
X-Received: by 2002:a92:d083:: with SMTP id h3mr7978120ilh.157.1626295608626;
        Wed, 14 Jul 2021 13:46:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11sm1680021ilc.40.2021.07.14.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:46:48 -0700 (PDT)
Received: (nullmailer pid 3492030 invoked by uid 1000);
        Wed, 14 Jul 2021 20:46:46 -0000
Date:   Wed, 14 Jul 2021 14:46:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: qcom: gcc-sm6115: Document
 SM6115 GCC
Message-ID: <20210714204646.GA3491973@robh.at.kernel.org>
References: <20210627185538.690277-1-iskren.chernev@gmail.com>
 <20210627185538.690277-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185538.690277-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 27 Jun 2021 21:55:37 +0300, Iskren Chernev wrote:
> Add device tree bindings for global clock controller on SM6115 and
> SM4250 SoCs (pin and software compatible).
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/clock/qcom,gcc-sm6115.yaml       |  72 +++++++
>  include/dt-bindings/clock/qcom,gcc-sm6115.h   | 201 ++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm6115.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

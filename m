Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3AB325C647
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 18:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgICQMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 12:12:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35489 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728785AbgICQMK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 12:12:10 -0400
Received: by mail-io1-f66.google.com with SMTP id r9so3463156ioa.2;
        Thu, 03 Sep 2020 09:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TlpFiepc9Ynwjc6xGAJisewT6pwxS6JuNyL5tQB2plM=;
        b=cQRCgkYb8FmLo45NAtKfE3aoXX3jt9w0qSVuM0wExpif9/k2JlMUWv3i2ee38S6GWr
         1/D8xS9wKo4uYnAj5X/DXZS1x29W9+dQnf9zBdZhbNd4CrSyDcVYUoLGVOJCAPsl9uwR
         qZUifGSrOFw3wsXw4XeMcI1cL2fG3+4TH0veiJsxwMiFZ2IEyRif/K1jiogK25reUHtS
         61WvXCGwRl4vO1juYN6jhEabsFPAAYu3aHL+XFqkohNKF6Bi2qa7kOjd40Dh4rIFptec
         2ivTCCf2j5NkV4igXNus6jewwRpXvSX2y+/uLx9EAFEr+NDuX7dwkm/hLE81t6mdqC3v
         Cb/w==
X-Gm-Message-State: AOAM531lUvImJ++guuavX/s6gMr2vE8Wiv0QXWho+1BkTMn1dcqN0kiP
        CGZNse63J4ARU3CJCO3snw==
X-Google-Smtp-Source: ABdhPJzQ3LNWA9ZflTyEX/1kw9gdOJKdy1KFoCctyMUt3S1Gmlzl1FjHI2/WhdQqsk9kk6VE9qBvlQ==
X-Received: by 2002:a02:ce8c:: with SMTP id y12mr4081741jaq.53.1599149529183;
        Thu, 03 Sep 2020 09:12:09 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id p3sm1651437ilq.59.2020.09.03.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:12:08 -0700 (PDT)
Received: (nullmailer pid 2873323 invoked by uid 1000);
        Thu, 03 Sep 2020 16:12:07 -0000
Date:   Thu, 3 Sep 2020 10:12:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: clock: add SM8250 QCOM video clock
 bindings
Message-ID: <20200903161207.GA2872956@bogus>
References: <20200902031359.6703-1-jonathan@marek.ca>
 <20200902031359.6703-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902031359.6703-4-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 01 Sep 2020 23:13:53 -0400, Jonathan Marek wrote:
> Add device tree bindings for video clock controller for SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,videocc.yaml          |  6 ++-
>  .../dt-bindings/clock/qcom,videocc-sm8250.h   | 42 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,videocc.example.dt.yaml: clock-controller@ab00000: clocks: [[4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,videocc.example.dt.yaml: clock-controller@ab00000: clock-names: ['bi_tcxo'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,videocc.yaml


See https://patchwork.ozlabs.org/patch/1355500

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


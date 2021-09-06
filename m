Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14303401D8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 17:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232701AbhIFPWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 11:22:20 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:38789 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhIFPWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 11:22:19 -0400
Received: by mail-oi1-f182.google.com with SMTP id bd1so7228419oib.5;
        Mon, 06 Sep 2021 08:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NhVMAnFWkEDHp3N7s9/kE4AIdpYmEdoiHRWavP3wKGw=;
        b=Xu8XVf/xh7NvAlTN9QDsWYKS32IQMzO8PrELaP/6/Mtc14q6rxT6HuzujsFyr1FIj7
         0N0PBpdGRb36TzBKPpTzsiMEzu4gZnPf0qqmb+BZjTN96UGrErZAk9ImXSWT9nG2tXMD
         DFXYKnoAZMnIQFHTqlH0E4wY9FINZFWAPRAYM6wKjgWJVa/xrbpwMLFZUGFrn8KNug0b
         Patoqq0FcE7M2467Aftf43T9vYsD9R/9TV/PxHD3ue+dFck+IggwZda0zur+5plbG1+h
         Am5ypzoGpefKXcD1hEushSv6fzb3Ktx+QOrAzy0+LoxDRw6rZlrxqEGdt/r5vtxkCeIs
         dyWA==
X-Gm-Message-State: AOAM532oS020ySBC1BlNh0USzb1pSScoLUlZvYeJxQ+oX43vCckJWm8E
        q8yzIPKGO9fS68iTtEUJKA==
X-Google-Smtp-Source: ABdhPJy+l0D7FCPnNx9xIWA4YBi4231EcFQBebEZd1SUGrrTsRR5+JmSQg0LpQh8wlddCVj7KpH+0g==
X-Received: by 2002:aca:5f03:: with SMTP id t3mr9075263oib.54.1630941674391;
        Mon, 06 Sep 2021 08:21:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v10sm1824088otp.25.2021.09.06.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 08:21:13 -0700 (PDT)
Received: (nullmailer pid 1057762 invoked by uid 1000);
        Mon, 06 Sep 2021 15:21:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
        martin.botka@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        marijn.suijten@somainline.org, devicetree@vger.kernel.org,
        jamipkettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210904183014.43528-1-konrad.dybcio@somainline.org>
References: <20210904183014.43528-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Mon, 06 Sep 2021 10:21:12 -0500
Message-Id: <1630941672.493430.1057761.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 04 Sep 2021 20:30:05 +0200, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> 
> - Dropped second dt-binding part for the weird SD card clock configuration
> - Fix up many mistakes, including maintainers, license and order
> - I still have no idea why I get a pinctrl regex error.. need help here!
> 
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.example.dt.yaml: clock-controller@300000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1524636

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


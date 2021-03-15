Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D701233BC61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 15:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhCOOYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 10:24:40 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:42282 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238307AbhCOOXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 10:23:03 -0400
Received: by mail-io1-f47.google.com with SMTP id u20so33498271iot.9;
        Mon, 15 Mar 2021 07:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jtOjK/yVIrhXL/xW575oDiM7h/H0bOFpaPlOXq3Do8w=;
        b=YrUllD4gZoQdQ+Ade9OUszfHDKKtnH8kcKjEwfcr6pDYL1Gzm9mCgRdgb98CTmyXBS
         yNwnnWWl9f9kQXSt9L0PVf+Dj81LbXFli7gthphE6mrgpGNxmFAXIBXWzKmx2OGLpGsW
         PVLU0cxjy6zQmQMkvDrzprAIbBi21lweE/2tNyiHIpI4cP8Mh0e/5083+s24gtZQA/Ve
         PUvAN7pgZ0BxGLk6IoIZuMjpSxp/RqKmdGzI0uPGuzatIeo8rJGhYskHk2Dg7pKi555E
         hYTb2z7gfhX/qE8Ih5XoI9/RF4ZiXGYLn8nwaxSjolJWvsSEn+LzUn1ibBWMHKJiAsGr
         7XfA==
X-Gm-Message-State: AOAM531yOBk7ja8zGd8TsCvWZM+1Xq93WbCX2F5h2yfffsyIbLrSekfx
        4t577UkSABxjIazBoWWgyQ==
X-Google-Smtp-Source: ABdhPJwn1Fv7x7iGPJSGzU1MGvRkFcp/LDq89Rw4wRJiIIOGgM0dy5d9euzb1nxTA/nDIZ8Nv1ZJ7Q==
X-Received: by 2002:a05:6638:1653:: with SMTP id a19mr9638692jat.113.1615818183036;
        Mon, 15 Mar 2021 07:23:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r12sm7756710ile.59.2021.03.15.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 07:23:02 -0700 (PDT)
Received: (nullmailer pid 876372 invoked by uid 1000);
        Mon, 15 Mar 2021 14:22:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        marijn.suijten@somainline.org, Taniya Das <tdas@codeaurora.org>,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        martin.botka@somainline.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
Date:   Mon, 15 Mar 2021 08:22:57 -0600
Message-Id: <1615818177.181337.876371.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 Mar 2021 03:19:10 +0100, Konrad Dybcio wrote:
> Add documentation for the MSM8994 GCC driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.example.dt.yaml: clock-controller@300000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,gcc.yaml

See https://patchwork.ozlabs.org/patch/1452446

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


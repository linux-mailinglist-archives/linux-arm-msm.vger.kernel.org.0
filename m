Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C182D6AF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 00:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393022AbgLJWbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 17:31:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:58736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405109AbgLJWXk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 17:23:40 -0500
X-Gm-Message-State: AOAM5333XXc4mJ1s3oO3InQLQ4I6XSbXCt1JLOXLc3ahLhbvKSyrZePD
        Z/+yIRhc1/dk7BM+WLU7tFuMHQkdaN0KuYsY1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607638961;
        bh=WkLH2bdTDY3/fxpmYYMTFPjoMSZGUGXQxTbS+OUKe18=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KybCF2S9+omEmoF7yJ0T5vdUIvBwvCuYiSEPT35UgDQhurpPhgJyusVwrsux8gfOJ
         1kvbLOnPp/g/H/1XAeQRkP3cOLpbb5q3LiWC9hjJ+GJfbyVo10Vjq/YlYknpNt7wug
         6a+sWuWoaHUGu9FaI4ggbhwmlPEpEctojkvQvzPv3fNRwxDQZ+Sq/qRO5MMe05TArt
         JcLzlkdHtkjLEoL+V+clZK+b7w20N2AntcbTDeWgu508uL6xVkvHXoBDXfxfH1/+ZY
         /YVzjOrF/CGF3Fxgu3IOZBDd1zbellMUQpJSd99AkBtPVcj4klpA38mlQoPmY2qdlR
         UUAcPC/oxingw==
X-Google-Smtp-Source: ABdhPJxv1kPCZ9CBXJfBEyq4u8SqUNggy/b6Tk7/bXFbP8eWAL3klQdkcIyJ9WP1Y7mohhgoZidkAxIZ1lQIIBVB4Ks=
X-Received: by 2002:a17:907:2111:: with SMTP id qn17mr8077684ejb.525.1607638959301;
 Thu, 10 Dec 2020 14:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20201204022401.1054122-1-dmitry.baryshkov@linaro.org>
 <20201207164342.GA411695@robh.at.kernel.org> <CAA8EJpqA13ncpAvpzUa8igaDTmbJgjBzF-jFWf3Z8T+7MRgkWw@mail.gmail.com>
In-Reply-To: <CAA8EJpqA13ncpAvpzUa8igaDTmbJgjBzF-jFWf3Z8T+7MRgkWw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 10 Dec 2020 16:22:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKp1FCAY1PRp84T+s+LAvV-6r3Y8z-d=a3a3=xn3iuKnQ@mail.gmail.com>
Message-ID: <CAL_JsqKp1FCAY1PRp84T+s+LAvV-6r3Y8z-d=a3a3=xn3iuKnQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 10, 2020 at 5:38 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 7 Dec 2020 at 19:43, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 04 Dec 2020 05:24:01 +0300, Dmitry Baryshkov wrote:
> > > Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
> > >  .../bindings/soc/qcom/qcom,smem.yaml          | 73 +++++++++++++++++++
> > >  2 files changed, 73 insertions(+), 57 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> > >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.example.dt.yaml: memory@fc428000: 'device_type' is a required property
> >         From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/memory.yaml
>
> Rob, Bjorn, this opens a question for me: do we have to specify
> device_type for the following device node? Or is it a false positive?

Well, 'memory' nodes should be 'main memory' that the OS manages. This
looks more like onchip SRAM, so 'sram@fc428000' perhaps.

Rob

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F305F2D5960
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 12:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgLJLjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 06:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgLJLjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 06:39:23 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D47C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 03:38:43 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id x16so5383167oic.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Su3KHi+u+I4LTxTYYvjzy6BB9kTgHwzAqGZ/gvLG2cI=;
        b=spJISVV8kLyo6G0klI/9AU3qXYaRzuRPEFPG4l8hTSXxibbISjh99PTo9nLWtaQKis
         1VlwaWK5BmMjktAsJ39E6POkoVkAJiecXHvu50MeEpFJsyhXMZL4NtIeksf18ISIklAq
         RDUeqYjfeJ9+Muh6OnL2AyBClx2awku0SDh+y/7zh8eQjFTnrdS65O9QyPT/cGjeFNFk
         L3Hd4vzIH2n+7GktJahI8eA+SGjEsty3lz8zGNzx/xT9rYI+xhGbBLlK8oWJ8uCgpT2K
         +WwUky7tBqWr1aoz/SaeqEgMjjpDC2ER4ed+VI6+VGbbwjlV6ejKmrfUHuA3qaDyhssN
         FexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Su3KHi+u+I4LTxTYYvjzy6BB9kTgHwzAqGZ/gvLG2cI=;
        b=hBs0hESm/JmI1TvUwZFZiNH4yWTeXPdV+Ovs3G+rLVqBnQgEV6ODfiyzTIZy1tn8EI
         OPZEhr49OSiVrDG/zMdzUB68cno/gA9u4xzM8MU/XEj0boXyvvSHewoSaxhDUbUgWWtp
         HIUI5JpaQcIXQfgRJ+yEcNKGQTAOc0axYski/NXT9yoLlPREyiY3pOtN3G85a8DXaZDc
         nDVHPWMHGvB5ig3CztLCLVR6dzzzbb5mO74U/bOqN9Ome+AjBFKJZBzo/iImJQTDyxKS
         kT29RfrNrhn7Etix5DRzVqWGsCXyt6G3GXjCv+GOaW0AFwoeo6rq4FFC0X/IGKlhfp/f
         dWFg==
X-Gm-Message-State: AOAM5334mmjQX+0vTQaWK4jlwJRpRozrA5T3y7nWvOELm807EeQnlJM0
        1Q+PV3+0PnaFQXpGGx9xQiXDAUXe++i42SJyhpoEBg==
X-Google-Smtp-Source: ABdhPJwz8k2qoy6s+7b27jeR1qDUCwmCEa4k6szPC2INm3iH8mkeF+xrR3lEUe4Wj8C9fp4l2p31RU2kIfVAaK5uTNE=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr5179525oig.18.1607600322881;
 Thu, 10 Dec 2020 03:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20201204022401.1054122-1-dmitry.baryshkov@linaro.org> <20201207164342.GA411695@robh.at.kernel.org>
In-Reply-To: <20201207164342.GA411695@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Dec 2020 14:38:31 +0300
Message-ID: <CAA8EJpqA13ncpAvpzUa8igaDTmbJgjBzF-jFWf3Z8T+7MRgkWw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom: convert qcom,smem bindings to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 7 Dec 2020 at 19:43, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 04 Dec 2020 05:24:01 +0300, Dmitry Baryshkov wrote:
> > Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
> >  .../bindings/soc/qcom/qcom,smem.yaml          | 73 +++++++++++++++++++
> >  2 files changed, 73 insertions(+), 57 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,smem.example.dt.yaml: memory@fc428000: 'device_type' is a required property
>         From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/memory.yaml

Rob, Bjorn, this opens a question for me: do we have to specify
device_type for the following device node? Or is it a false positive?

/ {
    soc {
        #address-cells = <1>;
        #size-cells = <1>;
        ranges;

        rpm_msg_ram: memory@fc428000 {
            compatible = "qcom,rpm-msg-ram";
            reg = <0xfc428000 0x4000>;
        };
    };
};


-- 
With best wishes
Dmitry

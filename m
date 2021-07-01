Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C773B92B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 16:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhGAOFw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 10:05:52 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:39923 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbhGAOFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 10:05:51 -0400
Received: by mail-il1-f179.google.com with SMTP id o10so6467492ils.6;
        Thu, 01 Jul 2021 07:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=t8d1gcUlkdCXseQek+o634xSmPXntZjtCKz3FnexeyQ=;
        b=c2PRPJImYb/gkLykWLdMEk7gxT5ScxSO4KKdMS/TzfM+lLpsJJv9g0+nQK3sOsx7p5
         Ap+FIr/wpBBytqOm7clQymF+nymbJTxOUF1Dh5+qvH0886USgogxYT3LnZJVIj8P1cKD
         zFvYz0tx2i0QiWoE91y5WPZVrpvgE4dZJxZUJRS0ip5y87GhG6gQAAteCRF7/Wm6doU1
         c1MxEnJFEbvE1LPXwcarlhlvVGfEIiAoJNsoAoxec1o8EzO+9YUfehqzpMS2+FwCJQh8
         Xyy0H3x1zzY5nXPkaZv8k/nQAkAuzR9DQsMFFVHE0NUNyS7w5lFcEsq2Y7nCWebv8ahi
         yZ0Q==
X-Gm-Message-State: AOAM530rsmdFoRLOcXIl7/Xh3i4mHYN8fLCyvc2P6p2fMZ+Yjx5H22yp
        MHDfg0xYCuzR1mf/ynUe2g==
X-Google-Smtp-Source: ABdhPJxV8xbMlaPrFfpHEtqKQsveMeqjRFaWu+Wlt5mRgO20OeOD7p8AGoZ4knggGO4SFvX56InEig==
X-Received: by 2002:a05:6e02:118b:: with SMTP id y11mr4748859ili.3.1625148200775;
        Thu, 01 Jul 2021 07:03:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h10sm30489ili.27.2021.07.01.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:20 -0700 (PDT)
Received: (nullmailer pid 2278712 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        jeffrey.l.hugo@gmail.com, agross@kernel.org,
        martin.botka@somainline.org, paul.bouchara@somainline.org,
        marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, phone-devel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        jami.kettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20210701105441.319572-3-angelogioacchino.delregno@somainline.org>
References: <20210701105441.319572-1-angelogioacchino.delregno@somainline.org> <20210701105441.319572-3-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: avs: cpr: Convert binding to YAML schema
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.600524.2278711.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 01 Jul 2021 12:54:37 +0200, AngeloGioacchino Del Regno wrote:
> Convert the qcom,cpr.txt document to YAML schema and place it in the
> appropriate directory, since this driver was moved from power/avs
> to soc/qcom, but forgets to move the documentation.
> 
> Fixes: a7305e684fcf ("PM: AVS: qcom-cpr: Move the driver to the qcom specific drivers")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/power/avs/qcom,cpr.txt           | 131 +-------------
>  .../bindings/soc/qcom/qcom,cpr.yaml           | 167 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 169 insertions(+), 131 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/qcom/qcom,cpr.example.dt.yaml:0:0: /example-0/cpu-opp-table: failed to match any schema with compatible: ['operating-points-v2-kryo-cpu']
Documentation/devicetree/bindings/soc/qcom/qcom,cpr.example.dt.yaml:0:0: /example-0/cpr-opp-table: failed to match any schema with compatible: ['operating-points-v2-qcom-level']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1499494

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


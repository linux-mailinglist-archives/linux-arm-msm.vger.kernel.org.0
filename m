Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594A4659A90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 17:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbiL3Qev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 11:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbiL3Qer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 11:34:47 -0500
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26911C413;
        Fri, 30 Dec 2022 08:34:41 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id y2so11533196ily.5;
        Fri, 30 Dec 2022 08:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+v7wd3dT3eh8vuF26/+yKiLrnBmKfWIUiJDjsHaDWM=;
        b=y5oQuNN6JUcZHx7crVlWBdvWZRdlMl1ziKpwXO4giSGbxnSppBWJJ1Q4un07JW9E/e
         TH8qqbNkS5vVVdx1fzu2zStA/OFARmtv2AXLvSUzg2Z3BwQUNYdH9XL2M3ju4mbWXB7t
         yQcNpwGbVmcKRVoZdseGDYWgweb4RtDbwUIBgaWsLm22nNxB4XpbBmEU3mrXF4O3A3Ht
         x1oX7bJs2v4os5+HApGS1eCfpoUTdXVcmzgSBdjcXz3DOho0/2gcY3qaGVyB72IlbppG
         EDtP36AZLMEPg/5fOV3yu3EjF9J+bqK1N5iQEVq3DMclwbS0ksQCIds9dwZMAi2hBHmG
         S6ig==
X-Gm-Message-State: AFqh2kr/RjA8fuRYiYJ8MrqEYnsEJ4qhTNvCimOWWqnft67wIHmiPd+j
        WNnPy9a9zVKANJUuIDjNIg==
X-Google-Smtp-Source: AMrXdXv3fY9Kz2DtRRLLOs8xLxNlA7/NakEv6wgyqMVFh8rk68CwW73iliRhxeL44HyFvDdLWHICrg==
X-Received: by 2002:a05:6e02:112:b0:30c:3204:5fbd with SMTP id t18-20020a056e02011200b0030c32045fbdmr1770681ilm.31.1672418080549;
        Fri, 30 Dec 2022 08:34:40 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w5-20020a029685000000b003758390c97esm6925751jai.83.2022.12.30.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:34:40 -0800 (PST)
Received: (nullmailer pid 1935059 invoked by uid 1000);
        Fri, 30 Dec 2022 16:34:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@kernel.org>
In-Reply-To: <20221229115932.3312318-2-dmitry.baryshkov@linaro.org>
References: <20221229115932.3312318-1-dmitry.baryshkov@linaro.org>
 <20221229115932.3312318-2-dmitry.baryshkov@linaro.org>
Message-Id: <167241774332.1928179.4447846135439331544.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,pcie2-phy: convert to YAML format
Date:   Fri, 30 Dec 2022 10:34:28 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 29 Dec 2022 13:59:31 +0200, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,pcie2-phy.yaml          | 86 +++++++++++++++++++
>  .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
>  2 files changed, 86 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221229115932.3312318-2-dmitry.baryshkov@linaro.org


phy@7786000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb
	arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb


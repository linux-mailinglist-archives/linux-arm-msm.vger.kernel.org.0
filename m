Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FA9656554
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 23:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiLZWfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Dec 2022 17:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbiLZWfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Dec 2022 17:35:43 -0500
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F9929A;
        Mon, 26 Dec 2022 14:35:42 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id p17-20020a9d6951000000b00678306ceb94so7301959oto.5;
        Mon, 26 Dec 2022 14:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FIVtgOfoetx2+iKjQWRO7oUwO0rmk0bglLRwll9VtM=;
        b=4cFaHLFbRsrHcL+WQpo413ubZue6WVYIXlgQbWf2jW0l/YpXzVnYui7vbvbxAckNS8
         akFOw5StPhyNGPSfMLJwS/co1dpger39xT+41jK7P5Y2iA41GIh4PkriSzypwWxatWIZ
         UOK1tXoIgTqgYYMJ8t+21qsLBGbh+hK9oaf7eOOY2sWMrAJWrcrxH1RtDN5Zj5am3Nc4
         +ozYxkBQRpgzvpneVmG06IkhzB7RXZtRzRA6johhnzbGLYuGiN/y5BujWOcXaJ4FbNxZ
         Rkv9uaz8oszDo39Rf1+8xnJ0yo4ZbhN5jkgM9kOj9NIZIvPldUoE4rzX/1hkLAVrMpBl
         Nfqw==
X-Gm-Message-State: AFqh2kqYFq80J2rwPXqHkaOJRqpAHtx2GkQ15d0WNwqSyy19if+HqADw
        TdVZyFRP+8Wz3tiHIx765EehZuWE2A==
X-Google-Smtp-Source: AMrXdXvW8LHvAfj4KWoIrHhR3c7GcbuIfhPNCrI4jgr57c45UOhD9Gt6Ew/A0Z9zVBuKEFXogiBVkA==
X-Received: by 2002:a9d:7a86:0:b0:677:9d4e:14a5 with SMTP id l6-20020a9d7a86000000b006779d4e14a5mr10384764otn.35.1672094141970;
        Mon, 26 Dec 2022 14:35:41 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e8:2792:eb0e:539f:f657:547b])
        by smtp.gmail.com with ESMTPSA id e21-20020a9d0195000000b00670523bf1cfsm5967666ote.47.2022.12.26.14.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 14:35:41 -0800 (PST)
Received: (nullmailer pid 72471 invoked by uid 1000);
        Mon, 26 Dec 2022 21:57:57 -0000
Date:   Mon, 26 Dec 2022 15:57:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,pcie2-phy: convert to YAML
 format
Message-ID: <167209187655.72399.4038954760167968816.robh@kernel.org>
References: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
 <20221226031059.2563165-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226031059.2563165-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 26 Dec 2022 05:10:57 +0200, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,pcie2-phy.yaml          | 87 +++++++++++++++++++
>  .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
>  2 files changed, 87 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

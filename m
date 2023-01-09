Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC12662892
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 15:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjAIOau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 09:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjAIOaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 09:30:46 -0500
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CC914020;
        Mon,  9 Jan 2023 06:30:41 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id k7-20020a056830168700b0067832816190so5260766otr.1;
        Mon, 09 Jan 2023 06:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UE++8EdSaegTLJvzSEIrReUrSk6uUX3CF0ejl5VTJTI=;
        b=ZPCr4kwXJPBysOnTuiZnQMPQGUVyZrKRjAihj7qBG+z+JX+Zm28xSVbsoA3tsZjcRb
         ptb0obdtCxpCvJoBrNTlJjSNiEEGXk/L5w5T24uiGhiOoybGegmfu25cZ+KojYcQqfQe
         XVUOqDUlG7BcTaIq5ZGG4lNgJKjW1JTzoEfi5BLikjmu7vibj0u8UcFmoMcKuegFiA7Q
         LFe7qlhpM4h8XJ9UW8i3FOtKhgHFB525JqAS+0jH1ZyXbiU5rNDLRLnPU8EyygEPsf/K
         E/FaXN9FrTdFdBJd0zn3YqWTxUkzDDIy7O7Bh43sXyD10LCwSEg0wLDPzewMsJfWQo03
         eccA==
X-Gm-Message-State: AFqh2krYhdyWUeSASOQUXJIXRoSnNg3ZGSX4+u/MnceOTxzmMfI1bWqq
        Xx3P5Q8nSVDIFMQ0HMuYhw==
X-Google-Smtp-Source: AMrXdXsMx6Hp7QO+rlvaMC7V61ifGq2ozMwS7h1TMz+wwTEzEqLkxvI56aVPEgKY0QSPaC7YYZhgzg==
X-Received: by 2002:a05:6830:1da6:b0:670:a09e:c7d2 with SMTP id z6-20020a0568301da600b00670a09ec7d2mr41532583oti.30.1673274641141;
        Mon, 09 Jan 2023 06:30:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l21-20020a9d7a95000000b0067c87f23476sm4554359otn.57.2023.01.09.06.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:30:39 -0800 (PST)
Received: (nullmailer pid 237527 invoked by uid 1000);
        Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>
In-Reply-To: <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
Message-Id: <167327380589.69610.9769499605356993935.robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Date:   Mon, 09 Jan 2023 08:30:36 -0600
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 07:01:49 +0200, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230109050152.316606-2-dmitry.baryshkov@linaro.org


mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb


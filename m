Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB6768C40E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 17:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjBFQ76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 11:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBFQ75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 11:59:57 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30FF298DA;
        Mon,  6 Feb 2023 08:59:56 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so3364652otj.4;
        Mon, 06 Feb 2023 08:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWK0RCI2c9XCQOLVOEExMr3jmCL7DBxo8zA9Z9kn5Ag=;
        b=TykBsuQSz7Y7BGZQYIKLONvoK0w0b0ymqgR/wylSG7Ta34FFHxKpuVf7f6bzyoRshr
         NP4h6u1Vkjrnxvb4yxopQWKlqhqY/Pw0SXAqzO6wlx4MxfNRWPs2xF6LFflDK2lGipuJ
         kdKGPQJ0QsEkCU+F8g48woXn/5XbvzwQaOP9kh1aTnqsDpHRm+MICU9m19RR9XOssk66
         7ERyb7jm/qrN8qNfQHeEdCCMFm9IMddHGNhk0DyYVriNXtjo0684P6PlDdd+kLg1pB30
         Z2AMfjrBNfPjUPME4vG5KOizz9xQOoLzT2CBuTU0ve8eShMdat/UxfFtslSCX1u4MGcP
         fF1w==
X-Gm-Message-State: AO0yUKWV8gDFQ46SREwfiZDCGUr615DuKjC/O4fe7DzyJHfg33YgilNz
        Lhrj/2OPhyfK9ZvTxEdzBTXLQf7BQg==
X-Google-Smtp-Source: AK7set+XQrYkk7RAD6BXw1EcNpzL9QdntLhl7DipkBZC75I4/eFBpxanK/9FuQ3Xv7ABN9tYcoDv3Q==
X-Received: by 2002:a05:6830:6483:b0:68d:51fe:7b6b with SMTP id ck3-20020a056830648300b0068d51fe7b6bmr153666otb.8.1675702796198;
        Mon, 06 Feb 2023 08:59:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r5-20020a9d7cc5000000b0068bcd200247sm5132312otn.75.2023.02.06.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:59:55 -0800 (PST)
Received: (nullmailer pid 224852 invoked by uid 1000);
        Mon, 06 Feb 2023 16:59:54 -0000
Date:   Mon, 6 Feb 2023 10:59:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        David Airlie <airlied@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into
 qcom,gpucc.yaml
Message-ID: <167570279425.224789.8066014720500178753.robh@kernel.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 06 Feb 2023 02:27:27 +0200, Dmitry Baryshkov wrote:
> The GPU clock controller bindings for the Qualcomm sm8350 platform are
> not correct. The driver uses .fw_name instead of using indices to bind
> parent clocks, thus demanding the clock-names usage. With the proper
> clock-names in place, the bindings becomes equal to the bindings defined
> by qcom,gpucc.yaml, so it is impractical to keep them in a separate
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
>  2 files changed, 2 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>


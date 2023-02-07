Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF7468E210
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 21:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBGUld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 15:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBGUlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 15:41:09 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851863A5BD;
        Tue,  7 Feb 2023 12:40:55 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id g21-20020a9d6495000000b0068bb336141dso4608640otl.11;
        Tue, 07 Feb 2023 12:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VTa7BOK0RGbDUdbwHDssuk11doisGgMTd26GS9ZN/k=;
        b=0GYUevbygndN95dhy9kVKeoYyxq3bRNVoUVaOWq2v0XKDBhELU0VFNAdAh5mtyl2JM
         pCYP6hoIlhg+tv3wjDHwPIvPXul0rnMThncAx5mGiYpIavWPdBNB0mYGgaXg3MmwVUBv
         ctMOoyM/cAGst2p2Pt0NdG29/vryd2eud3Z2ETVCFsW9paUFFL1HQXQelHV6K3pv4Gbc
         y7qg6vR7jZiw6Mi45WXABhzkR1gEDwueV04T4sAxtNcKpQrsHbiX7XNPk0QIsd+tVFpl
         BIjyhCAJlVdv4JAQAUGDa8nS1lIwMqXSPjT+C5isTdVic7RbG18Nc+nsBnfzhIgiCJz6
         zBcA==
X-Gm-Message-State: AO0yUKVXjWkJVOcW9yRHv/rRH43Ro7ZoZ4bM4YTBfG59AfPq7n7LbU8o
        QNlzYPDopuf9bucBF6dd9Q==
X-Google-Smtp-Source: AK7set+HkyW9Hc3hWn26BhUdyJq8BIOVGjQyzpdrWQDGylxdn5msvGvfvq/OEieGD00dsYnNZ8LJkw==
X-Received: by 2002:a9d:4e06:0:b0:68b:d889:8b78 with SMTP id p6-20020a9d4e06000000b0068bd8898b78mr2336052otf.32.1675802454808;
        Tue, 07 Feb 2023 12:40:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cy22-20020a056830699600b0066b9a6bf3bcsm7081447otb.12.2023.02.07.12.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:40:54 -0800 (PST)
Received: (nullmailer pid 4118999 invoked by uid 1000);
        Tue, 07 Feb 2023 20:40:53 -0000
Date:   Tue, 7 Feb 2023 14:40:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into
 qcom,gpucc.yaml
Message-ID: <167580245306.4118943.6938671659588578951.robh@kernel.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145707.122937-2-dmitry.baryshkov@linaro.org>
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


On Mon, 06 Feb 2023 16:57:00 +0200, Dmitry Baryshkov wrote:
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


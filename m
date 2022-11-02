Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A4A61640C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 14:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbiKBNrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 09:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiKBNrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 09:47:22 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14252AC7F;
        Wed,  2 Nov 2022 06:47:19 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id p127so19202681oih.9;
        Wed, 02 Nov 2022 06:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRJCGMY0czLPXWUKSvJT4HO+5iDHt9FD5Lzz55vRgWw=;
        b=RZPH0ktVA2LmyfCSrxIr4GJrWkke2ITvwtOi0RpRqZMuEGrlZZ9pKUrdH5xb9aInxE
         AoYklv1jiKWMPOXGyzTsLVoZmks7arS3fBD+Zzy36D85vvTeWHJiUeBd9kZxF03NuZ//
         b7s7Ig0F+1JcejguqpgwedjgbWTQ/14uFXpX7CQbGbMHRNIpRqKEys/pJ3yLsK+tMnAu
         WmWvs2b5gnkAJdfoqebZzFyjzfBJUNGtfjczIOB0ey9pFGmJ0RJZQWhkJbHerV2l6Y6g
         oEvj+vkNGPYXssQVObPhUwOxp68asN5c6VrCK/eyq9xW12RA+o4cGV0n8Ms79Ck5cdF7
         gkXg==
X-Gm-Message-State: ACrzQf2ygqLQ6T3FAAqwZHWXWa5pYt2M/QQ2CGlYZ3H0/hOm4nE7WE9G
        krqnyZ49c5WW2mHvzAr4RQ==
X-Google-Smtp-Source: AMsMyM5hfkbuIMshcxeF+abrI0/QcS8KVZhCEBLc0a89QkhjjutY1aCziut1NUqk8G99dskvFPlitw==
X-Received: by 2002:a54:450c:0:b0:359:fcaf:e78a with SMTP id l12-20020a54450c000000b00359fcafe78amr10303996oil.74.1667396838819;
        Wed, 02 Nov 2022 06:47:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g13-20020a056870d20d00b0012c21a64a76sm5973105oac.24.2022.11.02.06.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:47:18 -0700 (PDT)
Received: (nullmailer pid 3704030 invoked by uid 1000);
        Wed, 02 Nov 2022 13:47:20 -0000
Date:   Wed, 2 Nov 2022 08:47:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: clock: split
 qcom,gcc-msm8974,-msm8226 to the separate file
Message-ID: <166739683962.3703965.16756743381542937216.robh@kernel.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
 <20221030155520.91629-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030155520.91629-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 30 Oct 2022 18:55:10 +0300, Dmitry Baryshkov wrote:
> Move schema for the GCC on MSM8974 and MSM8226 platforms to a separate
> file to be able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8974.yaml      | 64 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  9 +--
>  2 files changed, 65 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

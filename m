Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73FE68E20D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 21:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBGUld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 15:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBGUlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 15:41:20 -0500
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F037D3A5B9;
        Tue,  7 Feb 2023 12:41:19 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id dt8so13767372oib.0;
        Tue, 07 Feb 2023 12:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FZ+1P8WzhPm5R/qji+G1l7GfRk18RmqyDa6li0PrvI=;
        b=EluD7qIzB0TYQBLvWOcG4T8GuwodfvDgBFETYT0r1/VW0f98bkq/qfzsLKwd8oFlu2
         CaYeaC//0bH6QrpQbb2wlDXV2KaKHlDu9CZyNKQhBiN87Ys8hFd9hOk+8qRwJprpDDX7
         kRSyHFDvY4zNE2z651YYTNe+3oLV9Vy4Cfz+iUYnMuNyLLrifqsXw/r88s8mau2Vu8rd
         1ipfaiSjaBPcCx/upguZykuiaNMEQDYGwjEczbLySwbsmX69irko5IPrAUc3JLqvuHcE
         OpztIqc5wLsFjL+2OF7ZYOJO1o5RkZ+nA1rxRcyQ97t0TyyCKKOs+KRv/GryochZWZOS
         2yYQ==
X-Gm-Message-State: AO0yUKWaPYa3D/nLE5zLY1hzex5i9wIv63Ww/6/+i7XByLj1nlfNC7Ui
        pVWdO9m3uko4abD5+6GZSQ==
X-Google-Smtp-Source: AK7set/ZzBfymzxPQ055ZgBNzCiGcWb2cKP1NDmXCNwf0UoZo2iTaxzmNRYE6FiS7CgQUUBIy2gS1g==
X-Received: by 2002:a54:468e:0:b0:371:fe1:8943 with SMTP id k14-20020a54468e000000b003710fe18943mr106451oic.6.1675802479102;
        Tue, 07 Feb 2023 12:41:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg12-20020a056808178c00b0035c21f1a570sm6128570oib.6.2023.02.07.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 12:41:18 -0800 (PST)
Received: (nullmailer pid 4119955 invoked by uid 1000);
        Tue, 07 Feb 2023 20:41:17 -0000
Date:   Tue, 7 Feb 2023 14:41:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-clk@vger.kernel.org, David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm/gmu: add Adreno 660
 support
Message-ID: <167580246437.4119306.9328093352336418931.robh@kernel.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 06 Feb 2023 16:57:02 +0200, Dmitry Baryshkov wrote:
> Add Adreno A660 to the A635 clause to define all version-specific
> properties. There is no need to add it to the top-level clause, since
> top-level compatible uses pattern to define compatible strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


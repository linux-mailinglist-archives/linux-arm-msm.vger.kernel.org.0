Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 886436723D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjARQoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjARQn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:43:26 -0500
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0986A23105;
        Wed, 18 Jan 2023 08:43:23 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id g2-20020a9d6b02000000b006864bf5e658so2767896otp.1;
        Wed, 18 Jan 2023 08:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExV51LRKxSAfszSznfMkdCY4p5XYR1eAwLcuflAXfzM=;
        b=FNKlBARkVT11t6QlbJt++DfhnuxBN/lTk9R6A6qYyCL4PzF7bEULLM9Y8lbqQZuB5m
         5bkd0nRyngMqXfSmm0D9Q9+Ft2pvFhuHJcw54gcO+lQTmTy0h2NFRQ3PAx4w2veA1Qvv
         4yeuWOFl88tpYt1tF6+/zkNGqZkmu9ylC6d4hdwft9Uyu6LaEY6f1dPYq6RWLYCiRIss
         et4HExcojO7/N2H+ttOu/+JbdZJMvk4mhlXwZ5odD2+XimPyDXue9G+JLY80fjkzPnYO
         5fSpqMATfSee7OIAlrM09oc53s6PyZC15qvMiq9bVkqHYVv5R9HLWrpLopAwpl6tKcWm
         wS7Q==
X-Gm-Message-State: AFqh2kp0rrb22f05Io3NLIrtRwY08hupCUOhAoH0IP41fsfE7HEp5+hF
        QPupxY/aD9SUtxDejeTjUw==
X-Google-Smtp-Source: AMrXdXtupd2qdij/8GDAp9D/q94uWH1RoHb3vxZY7KCP70YaeSd4XIvdEVydTbRXgGGGq+MIANQ4jg==
X-Received: by 2002:a05:6830:1086:b0:66e:40bd:436c with SMTP id y6-20020a056830108600b0066e40bd436cmr3937187oto.15.1674060202672;
        Wed, 18 Jan 2023 08:43:22 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id p8-20020a9d6948000000b00684152e9ff2sm2365769oto.0.2023.01.18.08.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:43:22 -0800 (PST)
Received: (nullmailer pid 140766 invoked by uid 1000);
        Wed, 18 Jan 2023 16:43:21 -0000
Date:   Wed, 18 Jan 2023 10:43:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 03/11] dt-bindings: display/msm: add core clock to the
 mdss bindings
Message-ID: <167406020100.140733.1559118899199486603.robh@kernel.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
 <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 06:12:35 +0200, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access hardware registers before MDP driver probes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 32 +++++++++++++------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

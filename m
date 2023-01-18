Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5416667239B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjARQkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjARQjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:39:37 -0500
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B237402F6;
        Wed, 18 Jan 2023 08:39:11 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id k1-20020a056830150100b006864d1cb279so2647463otp.5;
        Wed, 18 Jan 2023 08:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LIN2pCgiEqpzEppt5R/k/8ZARlzAK3/w8Uxd8kz5AY=;
        b=W5We204megmCQA1CYzf1YJ8g/18t0GRLyXiIs2e98ZqA++05SkNlb1v4sG4DZgltB2
         YDW7HZfUmkKEPvL8JYN/hRDy79Wv99dTAi/qtaNlhUYm+R6vlX6P8oIeCK51REyZXtue
         BOeHHBO0WjUvqN+N6nQm5kV2g61R9SqJ4qHXomW7gQnGw1QqUmbc30eK+i9IJqW2Plov
         wOu/+TSbwNQPzktRc/ur0lD/yHJOnJsh8LSzXG3KZxUVKLZBV55RK5YKtJujDyJTVhQX
         yFlAvVA2rWTMrSkMqdMHDVD9wUgTgFqIXGc0msCnEzVeRgY5nOyNM1A+Vj6B7hRWpAfd
         TemA==
X-Gm-Message-State: AFqh2krex8hqc1kN16CItJ/oeLoJA3RWzBQhYv/KT8H5oB+jADPYzEyb
        MkLSAQO9KnctSeO9ZhdFYw==
X-Google-Smtp-Source: AMrXdXsFPNs+/L2oeSD8CarId/6QwbzGw9mR31SKjD/iKEhEkuaMEZazpJZos257w2NMkXj2ZJ/ENA==
X-Received: by 2002:a9d:5c10:0:b0:670:88fe:6613 with SMTP id o16-20020a9d5c10000000b0067088fe6613mr3486011otk.0.1674059950561;
        Wed, 18 Jan 2023 08:39:10 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id r10-20020a9d5cca000000b0068657984c22sm1028510oti.32.2023.01.18.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:39:10 -0800 (PST)
Received: (nullmailer pid 134856 invoked by uid 1000);
        Wed, 18 Jan 2023 16:39:09 -0000
Date:   Wed, 18 Jan 2023 10:39:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: qcom,sc8280xp-mdss: add DP
 / eDP child nodes
Message-ID: <167405994883.134798.3210451257318456033.robh@kernel.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
 <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 05:17:16 +0200, Dmitry Baryshkov wrote:
> Describe DP and eDP devices as subdevices to the MDSS on SC8280XP
> platform.
> 
> Fixes: 45af56bf2d74 ("dt-bindings: display/msm: Add binding for SC8280XP MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc8280xp-mdss.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9AB6723B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjARQmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjARQmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:42:23 -0500
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18B75829C;
        Wed, 18 Jan 2023 08:41:01 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id d16-20020a4a5210000000b004f23d1aea58so5127358oob.3;
        Wed, 18 Jan 2023 08:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wKMQGGFU1eDeX8/jjd9sz0V6MAyY1fPhZwcj43WxgQ=;
        b=tkz/uS4jclYykvLyTlvTmxTQRfgVMdP15xjjRCA1FR+/TA6tCv7Rny8YueeuAAeZhs
         AHQGi1dbRAvuyexZ4mYUywsBpSnwT7avW5k26YX27W2IgSZ0u5OPmnrskASDXCbQkABV
         q2ofSKyk8jXvXTAlBs0SvjrCCDB8Fj3w7zdbYxtlY9i5DTe80OTyt6wYeFEzmqH7MjQj
         JktMT1h3dz+LEN1xZVJQAiJYEBZZe+tn3T0CImGmJZX0Wgq3ZF5Gt6X+DMto3PBJAhaY
         ajBA/ZVhgplcjz28LH6Qg+Pkt39IOUmJ5DpRyqe+M247GlAwHa36BUJRCgJanY508p0o
         zEfg==
X-Gm-Message-State: AFqh2kqwiS9Bq5ZUlcuM4DJ3h/TswVRHMj85bCsvXKFv6RnPM3P1geSe
        yqR+QuCEahbV/uMatQSpNg==
X-Google-Smtp-Source: AMrXdXv21zuVYxlMQ03/7MY98M38etX9IZNwquD4snNv+52kcYs0MYyLe7bGSngYF2QI5Pp3Ghb1pA==
X-Received: by 2002:a05:6820:171:b0:4f1:f5ae:6b5f with SMTP id k17-20020a056820017100b004f1f5ae6b5fmr3373188ood.2.1674060060828;
        Wed, 18 Jan 2023 08:41:00 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id s23-20020a4ae557000000b0049f5ce88583sm16728716oot.7.2023.01.18.08.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:41:00 -0800 (PST)
Received: (nullmailer pid 137661 invoked by uid 1000);
        Wed, 18 Jan 2023 16:40:59 -0000
Date:   Wed, 18 Jan 2023 10:40:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add
 missing supplies
Message-ID: <167406005824.137582.10336637561777246237.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 05:24:32 +0200, Dmitry Baryshkov wrote:
> Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
> (vcca-supply).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

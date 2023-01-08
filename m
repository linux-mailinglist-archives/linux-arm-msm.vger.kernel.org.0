Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524F8661837
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 19:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbjAHSlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 13:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjAHSlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 13:41:51 -0500
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BE2D2CC;
        Sun,  8 Jan 2023 10:41:50 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id o13so3853510ilc.7;
        Sun, 08 Jan 2023 10:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJwSsdN78Mw/74fCf2IAdNqU5RKJJMT26secV+Cj7Jo=;
        b=vqwa3DxC5EmhDa9EhyqKKmRCX/JnWwC/nZVMm6WZBWs9oMJ8Gsvsd5B+kCoMAPhdP5
         TMcmcUZIfma+6GvIRaRntMbZiisWTAQMeFX8pBwH0UKprCSpTGDxkE3h/VPogWSth29U
         +nUbaXeytpMKHvVTy63OWdrkwhdQabK/IpXUl5JJj0ijoPgJm3gxbGy+euYPUe7ARVCj
         /cq1ZGg0eC+b8s5q0Ol1yZtq56z0+DSQNBmASHNne1895DqFtljCQAdD/fB9FyIBKfQw
         TKTPfA1heTDYVjkolM8VgPe38YcwIOOpyDHtnuMgcnO0Tl6YCY1p6vDQWcUgpRGOKvZE
         OEDQ==
X-Gm-Message-State: AFqh2kpER0S+YfnqZvLZ0ouoXJe81BRVA4DxUoavrVraDlXKP49ml1Mw
        Ji6sZfXC2/T5lrq1kIBe1w==
X-Google-Smtp-Source: AMrXdXspwZ2mLgkCWVegw1f2MHlYfn3soxwbwdp9FqgJXfuiubLWO3mZt9Z4CWmZySB4ynG/BFClEQ==
X-Received: by 2002:a92:cec4:0:b0:30b:e957:1e78 with SMTP id z4-20020a92cec4000000b0030be9571e78mr40237996ilq.29.1673203309380;
        Sun, 08 Jan 2023 10:41:49 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id g93-20020a028566000000b003781331d909sm2130451jai.9.2023.01.08.10.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 10:41:48 -0800 (PST)
Received: (nullmailer pid 188886 invoked by uid 1000);
        Sun, 08 Jan 2023 18:41:46 -0000
Date:   Sun, 8 Jan 2023 12:41:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: qcom,gcc-msm8998: drop
 core_bi_pll_test_se
Message-ID: <167320330549.188812.3791526731906955387.robh@kernel.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
 <20221228185237.3111988-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228185237.3111988-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 28 Dec 2022 20:52:22 +0200, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-msm8998.yaml         | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

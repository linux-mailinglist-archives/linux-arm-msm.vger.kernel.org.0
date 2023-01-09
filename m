Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845B96635BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbjAIXos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbjAIXoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:15 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF923FCAD
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:11 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bx6so10696968ljb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
        b=Bdicgaim+S/x4FRXmy4dvtoyZ5XlMAiqWJMSxdpDJmRjbbuU7qUnJkuH/s6IgRjFSq
         7643o6RWE2bvpoNHiwhtjw04KtUzRl9MoZ1Cl3JCsGFfIwPps3E6SqhBMOH4YZZpESI+
         nPjAFN7cLoOZ8GA0lDL1676Lr5vEk1oEpymLEvpgQgzAxvcnGKav2tFPw1MJNEvRd7Yl
         q1mXHgNsJX1Zjz6PYApcpxZUE7EaWPjI8nNzByOhHrlpCLPITn6w5cHeSEVW2xamNdzq
         MjcpBbzWt2i9o0RfbWYraQPzlfaP+fWFCx3KNJlG7VGJ/kbIS5yH2W+Lv1J7Z9Ywj4Al
         QUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
        b=N5siBVF/MzIzmxq3ziTA4i69A73lTR9S2YyQyV1yKj1rgvnnqQBd/li0UhId4nmAvd
         jI8NEUub6J6pKYAbymAe6Gmw+NR6zMdBidYK+j4kCmKy8wKNszRVjdUjHe7WIMrR5jN9
         UAyzDLIlHhuGGPpDstYfXGdRoyA8bOrdki0LgttknrsUQRJP+3JJZ+odagfCntM/bE7i
         Ckh9RPJez7dF82SkVxhHete+vt4GeKspnJVaiNrxxkQoLD5onSeXr/LvwFa1QL7l7D7X
         lDXtl5BCeESmWfLbV/uiD0TqQkdH0ZjGllGUtArGUroNuoCV/sTYuarKc/3LzBFtn/y/
         0B0Q==
X-Gm-Message-State: AFqh2kpymHufxa5LEv38nJ2YES/7ntqE5ct4uzRP9NP8xHItmIf512y+
        Y4DMbu8DKATujaL+iZYpO/kzjA==
X-Google-Smtp-Source: AMrXdXsOZpU28l3y37H94lhmr2bHmsNIH3dfotXZC47cIqYW2uFHrdZqwV0CAZijlaKuKbtiKnjuRQ==
X-Received: by 2002:a05:651c:32d:b0:27f:ee19:c8b6 with SMTP id b13-20020a05651c032d00b0027fee19c8b6mr7538577ljp.25.1673307849603;
        Mon, 09 Jan 2023 15:44:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Date:   Tue, 10 Jan 2023 01:43:54 +0200
Message-Id: <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
> 
> This patchset is based on the SM8450 display support serie at [1].
> 
> In order to work, the following patchsets are required:
> - PM8550 LDO fix at [2]
> - DISPCC driver at [3]
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71917f654bae
[2/7] dt-bindings: display/msm: document DPU on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/602082368233
[3/7] dt-bindings: display/msm: document MDSS on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cb8eacfb528
[4/7] drm/msm/dpu: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c3cc4e88efb0
[5/7] drm/msm: mdss: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f96cca5ed719
[6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd17f93661d
[7/7] drm/msm/dsi: add support for DSI 2.7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d797ca161b87

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

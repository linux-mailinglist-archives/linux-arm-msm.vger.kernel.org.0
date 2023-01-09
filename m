Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A53B6635CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237984AbjAIXov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbjAIXoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:16 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF00A120BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:13 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s22so10680690ljp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
        b=zifUNGptKz27VGg9E7uDxzXmXek04O+3q/M5NdTQV8HrpLPFUOrhO/GjfX04zs6H+0
         9xDX5b7FziGPKY4wnEIxyCq59ia73G4eMOpU1RXlKZ1fHzrV9ognLXz8Z+t3UTmqQh41
         5DolwGqjBT3unDGZMQ15LUFKeiHvQ7Fzwl+wdmesZgdj6FnVu83JdJXumSkkEoxdtNW3
         Y1kO78TEpQPi0PK5tJsICDR1URHMrhHmwWwoynAgt7DKRcDT5yguaQAHciPtmEdIdrI0
         yX8ctcW8kkTboBANA3up/lo7PKU2AKytfdW3QyFtPBdwKN7Yct65Jj9q0NNQ2uHYfjGi
         IaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
        b=RRNBj6iv1xgkmO2J8ylXTdZ1yck1Yj/qhrJyZ7jVOk4vA5whqYK8CggqgURRHPmZRi
         Aa1IGnQHf1bqwqzT4PnqE1MssnPGtlYo0vOvNqE4EqFaZWxcUStH+RsceFZEWuslidAE
         +UIajtTdRCcl+6YDPX+jO/1lNp9UGSD0iS3UUQ81luJdk8IH1tuT9KPCQ9CkB0tGq/8E
         YDFjBOjxPl2/KbXwHYf5dygBk6mUILSwuEVPeXtgwU032bVw6cXWV7nWb44VqvC0hWBS
         cSp+hKnGPaaLIZhH4tk7drp/xw9vHKJUZAYas1xDAKIW4JHwE5YU0WU0+Ndgt58zOKgM
         9DUg==
X-Gm-Message-State: AFqh2kpDevxPaET7TjzT+PDGo6nG3LZk9vL4mE2Mhzis10LvwFGvHEpl
        Ny4QgpaNLbMgKLOQvUfZthFizQ==
X-Google-Smtp-Source: AMrXdXtNygkNrwsR7+LJt6BNVO2zpRRKS/ZMCvdl7t4EZo57sWU7hxoGy0Q+wbZA4mCbIcvFX2qXpQ==
X-Received: by 2002:a05:651c:1242:b0:282:55b0:d8d6 with SMTP id h2-20020a05651c124200b0028255b0d8d6mr4256425ljh.11.1673307852284;
        Mon, 09 Jan 2023 15:44:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, airlied@gmail.com,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 0/5] Add data-lanes and link-frequencies to dp_out endpoint
Date:   Tue, 10 Jan 2023 01:43:57 +0200
Message-Id: <167330408780.609993.2871958303249366717.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 27 Dec 2022 09:44:58 -0800, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>   arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>     endpoint
>   dt-bindings: msm/dp: add data-lanes and link-frequencies property
>   drm/msm/dp: parse data-lanes as property of dp_out endpoint
>   Add capability to parser and retrieve max DP link supported rate from
>        link-frequencies property of dp_out endpoint.
>   drm/msm/dp: add support of max dp link rate
> 
> [...]

Applied, thanks!

[2/5] dt-bindings: msm/dp: add data-lanes and link-frequencies property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/123f12555074
[3/5] drm/msm/dp: parse data-lanes as property of dp_out endpoint
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d25cfeeec064
[4/5] Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint.
      https://gitlab.freedesktop.org/lumag/msm/-/commit/381518a1677c
[5/5] drm/msm/dp: add support of max dp link rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e7f270591a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

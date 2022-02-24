Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD764C3715
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbiBXUyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbiBXUyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:54:43 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1C71C6EDE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:13 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id g6-20020a9d6486000000b005acf9a0b644so2188231otl.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/N1WrL28Utrh8BfXfn+pcRHI8/UBv9HnnB4a8HQcyiw=;
        b=zEWcpsx4YK1p6lsZYtNPdZ/Oe4+gXRXMusfIP437eLHzQ7CCfoDc2Lm7PcpnUvFi5R
         yNvWUDEFzEqIRAXVAOb+I24Sd2lpGQU2BC2f6I7Q8lrAT3xBBT+g+F+YWWPE2iKJXzFP
         2/uWLSJKfFyXLVwnxEFF2eUJa8oitfk7ZG+s3c0pnOxSjFNZ++6AX+tf/gvvW2ej1PGt
         /cI1ddKQSmwpwJOAThJDRL0N4bYiBoL+eIWaazIbh31FGrp1175sOC/rDLCC2Hn1D0/S
         0Hv4Eoq+1AkZdNGlSR5NxwsTEyX5t/aERagrouAr5+b0S4h88saQk1X5AJwtgirETPNS
         2M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/N1WrL28Utrh8BfXfn+pcRHI8/UBv9HnnB4a8HQcyiw=;
        b=hqkD0iwhLHDzQF9ZY1TkDc7Ae1yQs0+Gt/IG42L/rFZKMV9UNa1aRjwCqKtz0cTczX
         aMgpm8R30FSr+Dsd6M+m3jV1hFX96OsmejBuKKjhFqrvjqzztVKKOPl6x/KNcsrlrli2
         b0LX+ZecPSMIdGnqvfjTr85rDt3TW1Kb6wOnHL8z4tsiDMVsJG3+fql2pgCGzgFZa3MX
         bTTbEmyLs2UlUgRurs8tdY5mBNDwv/aEeUOB8mTFs9YHgm3aBV7Jg+Bqv6UB2L1FkvPA
         Ul1SRPrpJ+tuFTUvWoQotcI/0O7SGs75ExMWybMuaxC04Qw/9N0i/IjYBNBG+6grPa0g
         fXWg==
X-Gm-Message-State: AOAM532iXINlVACpWZ/qjAtfnPPXOnM2bCFjgQgDPFcPOyEbgzQ8NRtL
        JrMBGJosqm5so3IktrSO2z0Osg==
X-Google-Smtp-Source: ABdhPJxeAhHUZN7EK8ykF7DhK96G6gvD71eTymo8p6+778tRD/eZ3mqu8lZX3c23p1LuyQtrYnFMLQ==
X-Received: by 2002:a05:6830:4119:b0:5af:143c:76ad with SMTP id w25-20020a056830411900b005af143c76admr1649645ott.183.1645736052418;
        Thu, 24 Feb 2022 12:54:12 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:11 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] sdm845 and msm8996 clock updates
Date:   Thu, 24 Feb 2022 14:53:59 -0600
Message-Id: <164573604161.1471031.18366594019169463270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 15 Feb 2022 23:15:34 +0300, Dmitry Baryshkov wrote:
> This is a dts (and bindings) counterpart for the
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=601612
> 
> sdm845.dtsi (camcc) and msm8996.dtsi (gcc) are updated to
> use DT clock bindings rather than global clock output names.
> 
> Dmitry Baryshkov (5):
>   dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
>   dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
>   arm64: dts: qcom: sdm845: add bi_tcxo to camcc
>   arm64: dts: qcom: msm8996: add cxo and sleep-clk to gcc node
>   arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clocks: convert SDM845 Camera CC bindings to YAML
      commit: a0d61d02c102d93e8c8f653cbfdc3bf485d45aaf
[2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
      commit: 2564aa7544f493c64b397e02a2b477591016aa24

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

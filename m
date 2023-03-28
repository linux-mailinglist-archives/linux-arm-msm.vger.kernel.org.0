Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E156CCD6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjC1Wi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjC1WiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:15 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5512726
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id e21so14180542ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuKyg736nkIuL3P7k6oLEYaG5s7VO0i2HZ07gXW95rw=;
        b=Wys+GzszTQsg61rxXqP9WQabYCGt55+c1mTFBE27TmWqKn0/sWE+YT9gr1gCp/pHFc
         AwPFaGLhnneLAVW2RiAKXOz3Ba6Mmc2JEUIy4jYipcy2oSnrFp24dGqCcw11LuvwpR1f
         +D1U6F1P/sSepExR3RqeSWLCvEEcre8hUKzhLVw4QyNq8rPYuAapmG8Bqkj/xr7fxoHO
         eY00cZgQgg0qZQ9EH56kfVgncq4Gxy2Xo+I9TujDKvwM/0R7TwReNAV92VtW+mskNxEx
         3Y0PaDUbhwmXuJtfaio+GLIlBxUd9e5v12enqeKsxc1c03aYv7YBLL79/BupOvOGqh6t
         bUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuKyg736nkIuL3P7k6oLEYaG5s7VO0i2HZ07gXW95rw=;
        b=N5Ioi02xxgH8p4ZjPkDjJ2qQZ5uVEIJF3GXP0R9au+MXVjaHZXvC1ktMpvORh+ft4N
         N58+aAEAb5jvmzLLEIE6xv1jxB8lNhTBNq4TTHijt3u7+kV1obt0CbmoAVBDe6BQcSLH
         ESGNmmRhLX95aH7Hlu4GHQ9KsSXR1TZCaqUz3B3V4a9dPWImTGfLLxBl0ryNEG1IsHyq
         /K/SiyAyTDgq1eIYkPobaAEWVmb/isl8MWoqnrst+CAPMwCor1Qh4709CyBVFvT/WC4e
         mCIwM4nXbMDYz+I4KsWYQUpETxyxbQmWezznsT/kHnAzGPYd1e1IXuTovBaOe5mtcNUj
         cd7g==
X-Gm-Message-State: AAQBX9dEDWhUjzCmEz1oQEDYZc6gem50RBggUUp/HHgvnCEXCcdhmM2l
        vBe+/QPGESuiYMaFgyz8778eCg==
X-Google-Smtp-Source: AKy350aYL6MLzYQtAiiFbxjvBEiB50JA6kEZC7HJ6Sp61UFsLlnTl9MhWY7M2PFqqdybnm9mI6bhtQ==
X-Received: by 2002:a2e:9d87:0:b0:28b:ad5b:578f with SMTP id c7-20020a2e9d87000000b0028bad5b578fmr5090533ljj.31.1680043090281;
        Tue, 28 Mar 2023 15:38:10 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: qcom: sm8450: bindings check cleanup
Date:   Wed, 29 Mar 2023 01:37:55 +0300
Message-Id: <168004255461.1060915.996594905396334205.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 24 Mar 2023 10:28:45 +0100, Neil Armstrong wrote:
> A few fixes to pass the DT bindings check successfully
> for sm8450 qrd & hdk DTs.
> 
> The following are still needed to pass all the checks:
> - https://lore.kernel.org/r/20230308082424.140224-3-manivannan.sadhasivam@linaro.org
> - https://lore.kernel.org/r/20230130-topic-sm8450-upstream-pmic-glink-v5-5-552f3b721f9e@linaro.org
> - https://lore.kernel.org/all/20230308075648.134119-1-manivannan.sadhasivam@linaro.org/
> - https://lore.kernel.org/r/20230306112129.3687744-1-dmitry.baryshkov@linaro.org
> - https://lore.kernel.org/all/20221209-dt-binding-ufs-v3-0-499dff23a03c@fairphone.com/
> - https://lore.kernel.org/all/20221118071849.25506-2-srinivas.kandagatla@linaro.org/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6ae1aa7703f8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

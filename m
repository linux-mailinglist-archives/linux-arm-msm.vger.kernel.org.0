Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63976694BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241324AbjAMKxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241322AbjAMKwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:52:02 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A840F76ED2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:40 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ss4so44132951ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d47r/MoWRmcwPTOT7VRFAMRPdoJv07YU3Mo2RQnBNBo=;
        b=lZLNWBUsEiFlIo0ER7jyfIoLKGIUwRUCkesHgtmMah0PFjMYcXD78/6kMJ137PHR6M
         f4q7kVmmIeQEjVpmy2z2p9PRkTk9yEJjXeqLS/iPqgk2T9FqkD8mkwYNWvUfQ118RnqT
         cMW/mGoaJZKR3+vOek8EA40un9c030kK+k8Dw6N1ZTPXejKusOvbRvaKDtUdi0AWAER/
         Tx0v7PCpnl4qGIwNcEmRYotM0Eg8TcPNmaX8y8Y/AKCF7H72peAs3G84vNaWMi+A6pCs
         LVD1+HYiTDVtX5eX3FctiOYW61stR1a2s/e0AJoxviBdhB5hhgiUZz44xBDsT455OSqg
         wq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d47r/MoWRmcwPTOT7VRFAMRPdoJv07YU3Mo2RQnBNBo=;
        b=W8vbVOnnUtr0TbWQ/gB6lzfYiLbJ969j/BNngI/tHLDbGspxT+3LalySuVkcI6rAYV
         kZvU5sowqByzxrbKx5m4o31rZJ9iW7Nj5y+hjGvN1HZgXFvoa0PcNwYkZ7+8WclLAFV4
         WQxFmBsZebfmotZuo54I/w5HZ3umzptNIUCPAphe4RbfmgBH7mMpDWUh9JBeNhhvvGVU
         pBruMzPYSyVXfCDpWeftI/Mh6ryymyyzsNHBnzgp2M+8uzy9DVqmXxOr4tGgU8uyv9jy
         LOm/HLCO88QzV5Pf5mhDVYJmiLyF2MngxkUEogehaOBMTLsu71pfghKqV4rMm59oSg9m
         hhGw==
X-Gm-Message-State: AFqh2kpwgj+cOh+2i+JkIE3lDv2s8jYBdWeHYmBVFe2QjIin+tt8Lndw
        gLpJjfv3B9xXT5UWb8msf45daQ==
X-Google-Smtp-Source: AMrXdXv4hpTE9Mfn53T1bd3kXP9DT18iNIEhI4hMDHSdGVZcFG5460RaYPBNRTrc9A6X8eUJZ2wJ5g==
X-Received: by 2002:a17:906:6a1a:b0:7b9:ee36:6153 with SMTP id qw26-20020a1709066a1a00b007b9ee366153mr89307110ejc.2.1673607039244;
        Fri, 13 Jan 2023 02:50:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b0077a8fa8ba55sm8348581ejf.210.2023.01.13.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:50:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 5/9] dt-bindings: pinctrl: qcom,sm6350-tlmm: correct pins pattern
Date:   Fri, 13 Jan 2023 11:50:16 +0100
Message-Id: <167360698783.32701.18278661779213920207.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-5-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org> <20221230135645.56401-5-krzysztof.kozlowski@linaro.org>
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

On Fri, 30 Dec 2022 14:56:41 +0100, Krzysztof Kozlowski wrote:
> SM6350 TLMM pin controller has GPIOs 0-155.
> 
> 

Applied, thanks!

[5/9] dt-bindings: pinctrl: qcom,sm6350-tlmm: correct pins pattern
      https://git.kernel.org/krzk/linux-dt/c/72283404c2bc82bd7f7196a58f0e14b948e77173

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

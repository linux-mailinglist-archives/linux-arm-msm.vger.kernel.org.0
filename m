Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F9E564489
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbiGCD6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiGCD5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:50 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FD8B85E
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:24 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10bd7fbc0ddso2841522fac.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xRhocNAhDvGNwbuuItnMrHDN2U1jOPRZlUplDvj9+fU=;
        b=B0FoFz3STbRhR+wfQKhQb8u6UNKQJDH2biXHjVyUR/rRXMJ5I4iNhaX6kA6vZu3T5u
         K1dQeJaTrdP7RB8ND4hzSw2gYvwC38RSeYCFywKeAI1G57dC9OsQZ41Hj+85ngxgu0Qp
         bKB92vtCe5+PANT8coIZnFQPSaoYIFyDYe5uO2LutofJ3TXE8HzSZ6ODQ4EisIWQDN2+
         Z9pJkdkahu4XjCIGlQTeE2GSpZeg6y0Xt3FWRQydpFNOzY3pzpVOjtFe05vs269L5lyn
         qT8Hr7BBBjg8XE834ETA3O18cUhYAugFAzKW+DfSxRRoI+YmMtjzpJ10GsEdts74S4+Y
         d7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xRhocNAhDvGNwbuuItnMrHDN2U1jOPRZlUplDvj9+fU=;
        b=zktGliACAlFy2c9D5u0G69vyKYvfnH7D5r9g2N+okm7z5LvhZCopO1/KvIiEu1s6Su
         UURdY72kgtt0FPPMJxoFqEIjTGjdgntHXILJN0V/yzH4JzQogaE8iLYjiQLZTz6kofGw
         GUeuoczQ67u904/G57g7VR+Qp4FDaTEKy+zALXGofkWSB8YPlSi0aU6na2GjtmamU3ga
         a3EY8BubqojIo1SYvFMWM7fEOVPY4nF0omOZ63morJdzD0eOpw/+qzrExlXz1FeH1zhS
         5pVmNZzqOpLb955mFaY46j8RsehQJMFQwWEaFApqkBP7/Cl564oY032F5j7+sWoh2YIN
         3mmQ==
X-Gm-Message-State: AJIora8UC32O1ScW6qwW9eL5H+JbYF+0b5G09sbFIRss+4GObCWDU+LP
        4OKr0mauAH3DUujyag9a0l5GKg==
X-Google-Smtp-Source: AGRyM1tzVHnXpUJwG3aHQGPDqY5g2l++X28JpJtExJQqRsISoTpveNiU5IL99YxtxfDYg2m/kjPLJA==
X-Received: by 2002:a05:6870:d6a3:b0:10b:df7d:8243 with SMTP id z35-20020a056870d6a300b0010bdf7d8243mr2077326oap.68.1656820644160;
        Sat, 02 Jul 2022 20:57:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: adjust whitespace around '='
Date:   Sat,  2 Jul 2022 22:56:20 -0500
Message-Id: <165682055968.445910.11189872964487810084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
References: <20220526204248.832139-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 26 May 2022 22:42:47 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: adjust whitespace around '='
      commit: 372cf591acbca3bd9a729742ea4c81d7f99f1b6e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

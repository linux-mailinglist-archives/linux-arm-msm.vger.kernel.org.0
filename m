Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B4B55D9F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbiF0JQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 05:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbiF0JQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 05:16:22 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B9860EE
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 02:16:20 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sb34so17709298ejc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t3b+jqU8GZl0EFABg0x/c17eyO7t957ugRR9BD9/610=;
        b=ClQbzClzPWCdY6KlKQ665ptjCuPobjuYbF5+PcFCTSWc8Y58h090V+C1srpISQOyU1
         sPJrDmbjuUDL+NYTY1Zxqus5iDpmAe0J9eYyV8H9uRO1fJfwPynKi7AUo+sT2Wkc3qA/
         +2XKnjINT1tBokbmhl8hVXAG6oXaKzq6e3qzv2yKgDrjeJolXV2bysPQiOL8S0Tc0gmK
         0TMHYj8jD0Ib/YplEsnPIQ1dtuKs3N+046uv7cKXSDYnijB0MbWhqm5wD6OGP1t7kTUp
         lbeWc7ffftR+zabFtI57XrwS1TLe7i40mh9AmpujJczAUWNRhTU6oLQt+PPtzfITWmvb
         oUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3b+jqU8GZl0EFABg0x/c17eyO7t957ugRR9BD9/610=;
        b=d1xKq5ckLASo9t+extAYYoh/E1CSTk/0rEi5XG8NnwXbiH6Pa1LhHH4hzyily41fRT
         Ev0LXuXAcMfeWMMOBKSaxqIbVQTqULobUAnReNbHxU/hg+YnmLfzK0mAC4RYYDsRXkyB
         rM4hi1GuSrKaUxBjM8YMRKiDkIltahkWxfZSDji16Ws/5xIwMpU0wnAO/wOBgJm1lU1W
         kqzCNkKwbbagaG8eWBkXcWd7r/rtR18Yzo52vu33M1aOSnCcoKWyX7rVVFukJgPjNTsb
         KvxfViq/QGl05PD5Wmef4cnYvp11VRp+LlalzZeuOmkIQa/KCXZYhlqiX48J7hojQU9J
         mG8Q==
X-Gm-Message-State: AJIora+ObnBb+ZZt3oaDB9Kl7Ul065cJTlrKvOlxqerJTYGKTLaN1ury
        HQi1R2brWXoGbiQ6RNMYdbcNlw==
X-Google-Smtp-Source: AGRyM1seK6am1qPGVlXKvE26Oe7a/3cikFyA5HjSozFlnKf4dp0lSN28TvTzTIbIHajj45li1fV+Dg==
X-Received: by 2002:a17:907:969f:b0:726:94a0:26fd with SMTP id hd31-20020a170907969f00b0072694a026fdmr8304630ejc.234.1656321379246;
        Mon, 27 Jun 2022 02:16:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        arm@kernel.org, robh+dt@kernel.org, olof@lixom.net,
        bjorn.andersson@linaro.org
Subject: Re: (subset) [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date:   Mon, 27 Jun 2022 11:15:53 +0200
Message-Id: <165632135505.81841.3584331837885550426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
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

On Wed, 15 Jun 2022 17:53:16 -0700, Krzysztof Kozlowski wrote:
> Nodes do not need explicit status=okay.
> 
> 

Applied, thanks!

[23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        https://git.kernel.org/krzk/linux/c/aa30ba37ebb4c66c9d0e6b6bddbeda7f84ac806e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

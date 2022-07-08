Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D804456C219
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbiGHWTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 18:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiGHWTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 18:19:07 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBFEA2E58
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 15:19:06 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so175161otk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q7GsjyD5ZIUuB9wkT8wQatMbGivKt7bFeoH+S+1Drso=;
        b=aQtiASxaGDbA6G15nNaIcGm1nMi8rRXy0dSuIoQgU4z5AiPD9Sqidya8BPCcd2J2JR
         9Hv1FTkQebDPiYBpYIho1CN8H4fKL7q7hnVY/NJzymXqR29FGfgDg4nxVqArokyhs3aY
         wg9KAzzp/Y8a+393QEbnzdmQI9wi8zcLZj6HGBDcxQrzSrOSpja8WbOaIDlls+qmIlai
         T3BhabwJ6DDMWRovTDbzNWYYyoJ/56MWStmQIz4ElRwLtSgi4PpuzF+BN8MU9scf3BT1
         RLrV+z90lq8sSwZ/akcn1xmB/C0ix17gpY1BWM35vOTPc/ELPyqbNF/hkn4INQrBgPmO
         F9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q7GsjyD5ZIUuB9wkT8wQatMbGivKt7bFeoH+S+1Drso=;
        b=UlEsfUYjNY0DOwxHTKFRtlW1bnAWX23Fa3U+X92k0wnt9BqOn6AD6kiV2KEiDms1ev
         UZNIBKi2IP1tBV3QkXsavrJFkzcFZLFX7nzuyoFMaGRcUpBcFu9XKpNdyrUfKtX4ywVS
         Aj2uLRejya/uEYBJ2eb5wbkMAsOH4FeCAZgnYp1OenaBcqFqaNmN6WpNQTPy/gBrYOnX
         IpJnxTfjlS3W6yGbW6FGQiAuEWO9XyG1jGCY5ojqTMiG7QFuO12pXj63x7XnMlrFDj3k
         KcTqZzVlPxtj0Ha3g88QDOzlBFqhijnA8BBRYG0KfFQ+wRMMuqIh47ab2/0OHpqMuo5U
         OuGQ==
X-Gm-Message-State: AJIora8MC+ySXdCPyAbDhCLS8mQQh95MjNvlHKfkJx8Eytg7dON2XqZB
        enc1wln0KuFLx1MfJRv42CXw1w==
X-Google-Smtp-Source: AGRyM1vjNEAD9R+jnkAnxWGD+Mwyymetsx+lLSaxGkwW+QfmWQOFvT1NBkgnA6G9VOIpbVybaTaCVw==
X-Received: by 2002:a9d:2f42:0:b0:616:eb86:e8b4 with SMTP id h60-20020a9d2f42000000b00616eb86e8b4mr2588486otb.333.1657318745806;
        Fri, 08 Jul 2022 15:19:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y10-20020a9d518a000000b00616a2aa298asm48907otg.75.2022.07.08.15.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:19:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: fix PCIe clock reference
Date:   Fri,  8 Jul 2022 17:19:01 -0500
Message-Id: <165731872887.1018153.10612611844186430044.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707064222.15717-1-johan+linaro@kernel.org>
References: <20220707064222.15717-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jul 2022 08:42:22 +0200, Johan Hovold wrote:
> The recent commit that dropped the PCIe PHY clock index failed to update
> the PCIe node reference.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: fix PCIe clock reference
      commit: 330fc08dbdd913ac37a31f8aec1a88f68e39ae39

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

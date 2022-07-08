Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDFCA56C31F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236958AbiGHWTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 18:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiGHWTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 18:19:08 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E791A2E5D
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 15:19:07 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id r17-20020a056830449100b0061c1b3840a0so152767otv.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 15:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9Ki8kH0MaYR9B1B1eMqo83Dvn85AY+LXjVhqfA7f38=;
        b=ppPb4iwjhfCxSN2JWaotYlMM/YX2VYZjwuZc0J32CxvKPZ+JXtj9b7dD0r63W/lOEf
         v5o6TtM0p98iXy0EIn5pAWeXj1K1WK4IssePEqm6UKgQ4z49BYvqHksZODT+f/7JPjtu
         r9llW19+QcCouSM9Hoqi6tPNGNB6mUxyI2EQC1LFBxvhPrE0BuMfEwiiYrkWj7emTJoH
         pU5e6Lv3tu/2tEL3O0fdtr2PrVYcvfhPBZfJBj9jXLkpYYjbp6Pn356G8Btj6pChEPS3
         VZKAs4wWNPSKxo44bioACn8inEgOWxQBlf0f+dVvRt1est5BVkcSKpxakSAoHWg7HKOh
         AimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9Ki8kH0MaYR9B1B1eMqo83Dvn85AY+LXjVhqfA7f38=;
        b=CjqRjT1kxIfHcg16oqPFATVcnvfXWvhKJTPpxz+UBeUApdjhkPwsodXdbT849N2hvD
         YIasm6gNTxvr59/NzUZ1/SgU/UxuXWPuxdLAQ0+1OM0jtV+N3Xrph6ZWN2rG5VneSwYD
         OdU73vqeQwZsQhrMZBxyb2s6qb7E3eJfVaFjagmvs+C0GIc/sZVibH4u9+InPcm5rdhp
         nOY5AqGpLPQZ/d1t4b79Bde6sX9nLTuguz6lKnURx6H3f3mu7G2vD5GklK/le2Jo1UZ/
         dInu9OC0lBH9ioDfOTUMP2U3kx9fooa4s3cVquPxMf4PrQaADjWICMdqzvttMc5dVF3z
         CW7A==
X-Gm-Message-State: AJIora/vhgdntaJkdBpeZ3orNXFm4j5jCZMWQF9SdAQvVFhJ93klRMr+
        uogOputH9OLPqUKSM7Zdg8aEIg==
X-Google-Smtp-Source: AGRyM1t1/ItNQs24IPO08P8hmqBmPlF4m4Zyt/BXKl/SABvTzA4DKCiwaciFdavT7sFFme8fr/F6dA==
X-Received: by 2002:a05:6830:40c5:b0:60b:39c0:750b with SMTP id h5-20020a05683040c500b0060b39c0750bmr2500196otu.97.1657318746789;
        Fri, 08 Jul 2022 15:19:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y10-20020a9d518a000000b00616a2aa298asm48907otg.75.2022.07.08.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 15:19:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses
Date:   Fri,  8 Jul 2022 17:19:02 -0500
Message-Id: <165731872888.1018153.17061250329124504141.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220708072556.4687-1-johan+linaro@kernel.org>
References: <20220708072556.4687-1-johan+linaro@kernel.org>
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

On Fri, 8 Jul 2022 09:25:56 +0200, Johan Hovold wrote:
> Fix up the DP PHY node which had the wrong unit address.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: fix DP PHY node unit addresses
      commit: abf61f7e66c15e00f40ca7e10367f4149639bc57

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0326564400
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbiGCD6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiGCD5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:50 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071FBB857
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:23 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id b23-20020a9d7557000000b00616c7999865so5069502otl.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pacf1UOvQs76t6aByYKhRrOtJSG/fFrzkb000yR8bmo=;
        b=c34IaB0Qy33oT2TUDVRwF8d6clpbbOTmqzRRzXFhlee6tquRoHGCzRnCM6Rc/STmwr
         YlBF92VXhVpB7AIYQQRDwoXhWPIJI+89JuTpD9PSOzF+PIWubEfxdOrhI0pjYe2WrhkD
         s5P/LjmGT0/3YdVkflgIgEcT6AzvGtFbFeN2GtvF/ph6mMIKnO8DZKgIxXK8evzASrIh
         788rlyv3lxKw+/fVMNluEMw7KO/fGSEPp26X6qlwnIRapaKMtgL8XmXpmLY1v9ZS8Gdw
         AigiozgKlpH4Hk2tlLwJAh+lD73C+rwiFCpv9kiXW/hRW2EfdMCR15QBTqQSLSDdnsIu
         U4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pacf1UOvQs76t6aByYKhRrOtJSG/fFrzkb000yR8bmo=;
        b=a1gSS9GsMwoU5ewHyM7z6Ti/8evZmHDV1EmKJ64KcNjG7Ny5wkpGeyCn0Gmu/spQ5g
         yDG3rXTpHLxcLKeBmFw/+4SOoo0ccghubBbaFDVLfIrA49mJEfgzDWjmO4B+Di19GQ/Z
         w0C1iennLBpMm8Fr0+aEr0LWYfkbmluZB/qsikjPHfbpJVQNnWsrndGFjPG6Zz/JHnGN
         RgJ2H0aCjvnsstXaM5rYJY6Jl36e39jzonYX9B8Q9LpOVVR+GnRIXN5eA4hsENCHlN7s
         p8Bry1XIekxitNEvrUZt/zvsYXRqEMAtoIuADHsxSM1jSMZNfKK4qqUNShv5WaIN0Cxm
         1w3w==
X-Gm-Message-State: AJIora/+q76MDTzRQ5ljH0IxMCaIBPyXMUu29QI+cSnNJGpWJvZwoxkB
        zr8j6ruw6aTqHFDipf3FJiD+zw==
X-Google-Smtp-Source: AGRyM1uRh6HZG1GQ7ZMsmm8SUDod2Vs/Uw1rBIee0Fdg1gJLNYEizbwivlyhQupLYRIxv5I41t9H4w==
X-Received: by 2002:a05:6830:d0d:b0:616:99da:1fb0 with SMTP id bu13-20020a0568300d0d00b0061699da1fb0mr9663014otb.109.1656820643140;
        Sat, 02 Jul 2022 20:57:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 12/12] arm64: dts: qcom: msm8998-mtp: correct board compatible
Date:   Sat,  2 Jul 2022 22:56:19 -0500
Message-Id: <165682055968.445910.6075951122172128588.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-12-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org> <20220521164550.91115-12-krzysztof.kozlowski@linaro.org>
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

On Sat, 21 May 2022 18:45:50 +0200, Krzysztof Kozlowski wrote:
> Add qcom,msm8998 SoC fallback to the board compatible.
> 
> 

Applied, thanks!

[12/12] arm64: dts: qcom: msm8998-mtp: correct board compatible
        commit: 6dfe4e195271a59f396d414c5fae299eefa5d3da

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

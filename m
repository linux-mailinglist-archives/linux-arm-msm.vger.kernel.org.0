Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1FE55EF3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiF1UV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbiF1UVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:30 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8E53CFD9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:19 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-101dc639636so18563535fac.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4j/VUuwpqAhpSmewB4QnlDQdKmoLMZa5xK7xdwSdiY=;
        b=fCceC5v0ighl7q4Q/LNtvixvAyZkLH98vCNJu7JsIt/odnS5zfkGFKbJQASWEXeraY
         W93TV/DY1qqNvu8mDFQlUkSauPmKLrC641yKZK3ybpEEWHfSRYX5n6rqn0G/JdFqUYZq
         PrwOsP1reyTu7JJVlKYMVsr7uDK1Qi2oW+/JnM/iOjxKd4KHqsoGdM1wWZE5ZAcR9rq/
         VGWL9Tli5HAO6vxgi6awDnwtyLF4uDFBdCUmzAMrJ6CFPp0cNDP97Iroxog/2rNBKIC3
         wAttVtcWIKpmvgAfc1AXeO+/MPtpDI3UOmAszgeMWdcz0dS0SpkxTzX6c3dMrPinRv5J
         13Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4j/VUuwpqAhpSmewB4QnlDQdKmoLMZa5xK7xdwSdiY=;
        b=YvH2i25bGfePmQZj/98epnTNiiwEZOMjYUAx1ymKGS0nUC18RASGv4aR6zPG0aQG7o
         o0Onrh0PIVaHWewrCqDKuUC2KRW8Uelp9UJA2EgsPECEPimKoGwRpY22C3vhM8WIOyGV
         UTljZ8Kv+FWl0vdwbIYg/jgUJskRwWMEKNIg5PYS+ih+w9IrnKy0XvUevaWpvmJngbm8
         AovuSPyY2UsABOrzf985R1yNLEKeDcvmEwIb2zSAvcowI+ePNFohT6us/EGcHzcsSK7r
         rJe0PQJNkKEoieW1YOy/uLbM4i5k73XgFo0LYKb+rVC9S9LFSce1avcZjxbUjSeffhsL
         EsYA==
X-Gm-Message-State: AJIora/doyqp7T4rWE3rnitLOJfzTZmQLCe3FOfN3hV/B80Ce6zE8IX2
        BMFJSFmV1wZcZuV2CjRWByTiYg==
X-Google-Smtp-Source: AGRyM1t174wUlHbxXOqM4bbDzzYwPcVUN1D9gm8KhN+pNVbPVi7JI8C5EOvMqDK7JeAwLThjphA2yQ==
X-Received: by 2002:a05:6870:3920:b0:101:d628:b053 with SMTP id b32-20020a056870392000b00101d628b053mr851287oap.111.1656447559505;
        Tue, 28 Jun 2022 13:19:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH v3] soc: qcom: cmd-db: replace strscpy_pad() with strncpy()
Date:   Tue, 28 Jun 2022 15:18:54 -0500
Message-Id: <165644753308.10525.5322214498477940111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628064301.v3.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
References: <20220628064301.v3.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
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

On Tue, 28 Jun 2022 06:43:13 -0700, Douglas Anderson wrote:
> Commit ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with
> strscpy_pad()") breaks booting on my sc7280-herobrine-herobrine
> device. From printouts I see that at bootup the function is called
> with an id of "lnbclka2" which is 8 bytes big.
> 
> Previously all 8 bytes of this string were copied to the
> destination. Now only 7 bytes will be copied since strscpy_pad() saves
> a byte for '\0' termination.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: cmd-db: replace strscpy_pad() with strncpy()
      commit: fe72f9bce137055fb744d4f8a91baa234ec07baa

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

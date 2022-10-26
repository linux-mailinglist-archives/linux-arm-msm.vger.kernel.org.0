Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205FC60E5F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 18:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbiJZQ6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 12:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234023AbiJZQ6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 12:58:00 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720D9AF181
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:57:59 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id x26so1120151qki.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDHp0LO4ebRzQFErfPNEMqx5O4CaTBDIkwZQBMq/Dg4=;
        b=ArijeelUJ4PnCB2tHC2NEtSYiuXym+iw0HWEI1W1dBOm7EXblIcG21uFbiGLvzrDL1
         rfJVmY+nvaFoZPQhr7Zs12QdvtEOelzAlDr277gLSNfTv9S4djxu+842lquiHvrwb4ht
         IH5PJvqvphEJ9nJPke9o2WCPponWeEuyzo9qWj9HfTG52pbGFTGYkVhIkIptjcxUS79Z
         a53cb1j2OE0FpAxO4hf0p4flfGoIhfoa2mERzDv1V0130kmsOETXwW0M1RVwYBgDcouq
         S5Zebg4VM0ErgLbTzhvMJSbH7sv5bfZCloMq2NaxKwbSnpy0WwjPaL9bV1myFew4LVZr
         iTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDHp0LO4ebRzQFErfPNEMqx5O4CaTBDIkwZQBMq/Dg4=;
        b=3hTPybQCewnRPWVbBYpRMTVcJyq9dVSDboc+QdcKtMtct3xYBsVL86UhIdnrGT2oR4
         iSuH59yqRurFvZ5j/pFqPEHyFDTI9V5jt2IYHWE0WcWOhhr0veqH23yDEC0OHynx0/0R
         sgNyaqiANjN71+IbUGSvrcWnEN0d6p4s4MwQeYYM+LJlLW+BSWq2oXR/5SGfC723kPUZ
         DNvTgTjiFV7XVVs54Ukl0P2Omll0iF0aZgkMIPFW47aYUgS3JENLrxdPSWXc0HMi/+2K
         KmyB0ElBLD/K7rdob3DHlTNL3oXPXkontbLyIKJbAnzd5CHH2jCHVwRaVsWYUWmralNV
         EO0g==
X-Gm-Message-State: ACrzQf36JMcbNiU65ob4uji6mk5Ey4LlUQnd4UK5EF3hR1T14bETg7yZ
        E6CWWCHHC9e8vbO3dUedqhtSXg==
X-Google-Smtp-Source: AMsMyM4L31N5v5Z/OJ+Ql1auenm0qxCUxsxrMOlHlUbzzY3cECrNBwFfxUJnIRShJRMOcirE+fzN4w==
X-Received: by 2002:a05:620a:2189:b0:6e9:856f:944a with SMTP id g9-20020a05620a218900b006e9856f944amr31425798qka.322.1666803478643;
        Wed, 26 Oct 2022 09:57:58 -0700 (PDT)
Received: from krzk-bin.. ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g21-20020a05620a40d500b006ee8874f5fasm4360759qko.53.2022.10.26.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:57:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: make compatible fallbacks specific
Date:   Wed, 26 Oct 2022 12:57:46 -0400
Message-Id: <166680346261.49767.16285909952987662463.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908080703.28643-1-krzysztof.kozlowski@linaro.org>
References: <20220908080703.28643-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Sep 2022 10:07:03 +0200, Krzysztof Kozlowski wrote:
> Instead of allowing compatibles followed by any fallback (for SPMI or
> SSBI PMICs), make the list specific.
> 
> 

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,pmic-mpp: make compatible fallbacks specific
      https://git.kernel.org/krzk/linux-dt/c/7ec006642590033e2b07eeccf57134751acea03e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

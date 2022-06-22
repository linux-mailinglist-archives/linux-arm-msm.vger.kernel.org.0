Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4AA5547DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354391AbiFVIgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354793AbiFVIgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE4638D9C
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id t5so110324eje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3StjZ2NWkaxmjTBx5S1Xrepsilctzd/Wb+GRJGm1YHU=;
        b=CMWoMJVAmkE5y8dJLdRAI8P4GBa0AQNWfPRlkJSmMM6W+B80tz53SP69YkeiEFsE3d
         2PR0jxYg5595HC1ZYNV5RVqFINVUC8W4QiUQuY1A4kRzllAzG64e8KZMuOt3HT7EKdx2
         pxjayD3rCWCtOK6FQ7gev7mmeRYEhw/2hhwyJQQhUIPNPI/x8alybGofM5hwZOR0Btm6
         If/Dgkqt/RxU6r0b9Sn5dngRUiBv0Knvqy/cudQggTl0WOfXCyMnsg3OrBUjWtKlb7GL
         atoB24gtHM4kOBvJGIzRi8zzbdhxQ0Ne0EqBHUju03uXseRugNJJ/UbknYLo2c7Qk1TF
         EQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3StjZ2NWkaxmjTBx5S1Xrepsilctzd/Wb+GRJGm1YHU=;
        b=kxI2HPunbshtDjMbZ9KEKRD70ox0OM+ba67KyfzT8kimWhIPZBfQIwH0kifqZ4ln9i
         1hGHI/NU9afA1paCPldjlbn1cAfNmc4bL1PPf38AQ9/cskcxc08ZKWgIT7hDbxrILv6j
         Lu92+D4oSOvmB5ftBjHckOnlEmGdEihIxBdrFcTfzvI+DY7A6ED5A8m8x2TpkAdOCFWo
         0ZQSdanmtVmeoOdn2BqQwJCYEGsBjS4m12Bu/snJLU4xHnu4rCbOg37Haq0qiIxuDgH7
         Mh5IC21MDeTcNVsccp7FdOwhgx4iR9w9NDKmp7IRySrILV5+eKK5yRxzpqPHhUWw8aHE
         vgHg==
X-Gm-Message-State: AJIora+2n1Wg9JyU04gfMdsAe5SpcxuYZhXBQGl1rkJAYFvk0ScUurF5
        mHCpGIwkELnqgOz1O3smzSMIVg==
X-Google-Smtp-Source: AGRyM1tvusng6ATUlwi0iXkUZNOsIXpZiDmzXc2zMjA93nWzQWEkQt2SQZlBoi6gjmbM4HEPrf38PA==
X-Received: by 2002:a17:906:8a44:b0:722:e858:c97 with SMTP id gx4-20020a1709068a4400b00722e8580c97mr2003299ejc.476.1655886955878;
        Wed, 22 Jun 2022 01:35:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH 6/6] arm64: dts: qcom: sdm630: correct QFPROM byte offsets
Date:   Wed, 22 Jun 2022 10:35:40 +0200
Message-Id: <165588692598.15720.7367676138170899411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505113802.243301-6-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org> <20220505113802.243301-6-krzysztof.kozlowski@linaro.org>
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

On Thu, 5 May 2022 13:38:02 +0200, Krzysztof Kozlowski wrote:
> The NVMEM bindings expect that 'bits' property holds offset and size of
> region within a byte, so it applies a constraint of <0, 7> for the
> offset.  Using 25 as HSTX trim offset is within 4-byte QFPROM word, but
> outside of the byte:
> 
>   sdm630-sony-xperia-nile-discovery.dtb: qfprom@780000: hstx-trim@240:bits:0:0: 25 is greater than the maximum of 7
>   sdm630-sony-xperia-nile-discovery.dtb: qfprom@780000: gpu-speed-bin@41a0:bits:0:0: 21 is greater than the maximum of 7
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sdm630: correct QFPROM byte offsets
      https://git.kernel.org/krzk/linux/c/b4e7bcc945c6b8f3131460b94e28ff4bed23f847

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

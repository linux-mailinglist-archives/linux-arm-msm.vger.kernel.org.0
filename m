Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7037D784398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbjHVOM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbjHVOMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:12:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B59BE50
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:12:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso44763715e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692713489; x=1693318289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lc+fgSXyIPeeEw3QfvVPK4rtiwKADV5dE1O0MM97k8Y=;
        b=iyUPc8T8/255kUzHJzwZAoq4JIb613fpVwjnWHmwpJjB1yIF8lSFm9gHCEFKPf12H6
         qRnD5EtW+YQ88TG6zrdfyjUcg4mYtkDc1sMxINWtepbZ1+mTqrHshgMa+PaX3a4P7UGG
         /kDEk/GWZhJP9piWelAWFV2Bb9vFL5esnKcptt39TNL2ClxfSU0vvrjOcLAt8MoOw0HN
         BFnSYyYFwoQh2eYXMOb+6ELJwNwJIuoaWur3+P377uQAond4xAFWXf6XmOLBVi9jVnv/
         kPRbyJA/W1JJcWISAQTLQLFhqaAGzOc2K6eufoLyY6ZYo27DxJSzXLfQ0/+aTTYs2Kli
         nqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692713489; x=1693318289;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lc+fgSXyIPeeEw3QfvVPK4rtiwKADV5dE1O0MM97k8Y=;
        b=ikdowM09OMA/McXz9Y5giRTuQy8juqI6VdwX6qN4vvaKeVgfSuHPzfGZf+dZL0DD9Y
         HKFDyXdYLANbdzcekA9ri1IcGfnZJpW7SODdj9IxiUYwVNHXXpKJ6IfoXDkjcTzOL1is
         Dd3srQ1yv+UOJ1UP/5HCKpzq27jHOjSlSsh3PS+dzrnrjWIAysmEl1PfJYZuqN47/Caa
         J+UABa673AqDjXu9eI4YTnmbH4DiFrs2m196Lzy/PeUWp7N0e0C6Y48ox7bpiOCgCKbn
         dB5zGBTid+a0dsFppiZ7VwxefFxEkfLLpeHRKujBcjkbJ0OhcMBfRT8HBXgewR3dGEn8
         GhKw==
X-Gm-Message-State: AOJu0Yx8h0Yh40yrTM5UrygcpQsOimwjmR6Yv+XswxImjN3juyxVwUxb
        u1ro0hBUY5qh2RsgatZjNiLEdA==
X-Google-Smtp-Source: AGHT+IEHGzoHf5HrGgdvoAFg952J6hFCMy8H6KeWzFa3DwG0dgqSmnVULrHjdJ1eNlwY3f56ZtaL/g==
X-Received: by 2002:a05:600c:2291:b0:3f9:b8df:26ae with SMTP id 17-20020a05600c229100b003f9b8df26aemr7137371wmf.34.1692713488924;
        Tue, 22 Aug 2023 07:11:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c280900b003fe539b83f2sm19587753wmb.42.2023.08.22.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 07:11:28 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: qcom: sm8550: enable RNG
Date:   Tue, 22 Aug 2023 16:11:23 +0200
Message-Id: <20230822-topic-sm8550-rng-v1-0-8e10055165d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvC5GQC/x3MQQqAIBBA0avErBuwsUi6SrQIm2oWqWhEIN49a
 fkW/2dIHIUTTE2GyI8k8a6iaxuw5+oORtmqgRRpZYjw9kEspssMg8LoDrRGdz2NRjMpqFmIvMv
 7L+ellA8U9dK1YgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gfBhaOfAkOY05OwjbWfxjq+q9zNLOxwJ+zdOp2usfWk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk5MIOAKBHacgxG2VqvSSbGYBTl8Dl8+Pjn+8bf3NJ
 UpkYWP2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZOTCDgAKCRB33NvayMhJ0e44EA
 DHzG4oKlbo86ME0cSjZytyAA0euTb44L/5VSTnR2knD/7bO/1HlAVkOXX4B3tnLoELuK3Nn3ZsoZYn
 QFEFkK0zUiy8YlkmRNtaYBPZYlqtWFixLpD2szSRiXbgZLG9AdicO+gQWgyOwDQsfyCoG2vyCtCOrb
 nSZTBMXXyMGbjXf6/0bjr8lXsCusT8GUqTzSZtDlYIdE7TEdgs5DGPu1o+fjKr0ZArd/bM9UQBicWN
 58iFHchc6te2x2PqfEDbKGss9EdsoU3DKvjOaa4kfhlehd54R5DCqmoSaRA8byKGWN3wTkIgqmwc7H
 KT/cbyRigSc1WVEMh6HKbF/KihFlogjNdpyYBY5dIqx4+fJg91fH8mUWQ/KUbdQ7f1RUQFv2QmGFlu
 DmA3yfpC3maGyGSgaA+SX6F/fQpyTYC2lzeqGwPca96k0OIx1ss8QCsL09qUJ64n72nKrLXe3G03iY
 pObi/OMsF8NKjYQhI6/sdGS3R6cvpEsqQpLZkMgVU8x3M7JnXHryLfVvfowVNOr8DLI9ZpAA3Y+818
 2ZWH24n6gDQg1jws7n9yIKeP1sEFhYJsHchtwyRGDOmpjw7v3ueiPgnZJ5XWHY1oKCzSkJnJT1qEl/
 WpGLbhOM9DGM90MPks0Zk1bnxfwGYhpFzd+Gp0SR6/tYMapkShJuglIEBclw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable RNG on SM8550.

Output of rngtest :

rngtest 6.15
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

rngtest: starting FIPS tests...
rngtest: bits received from input: 188260032
rngtest: FIPS 140-2 successes: 9405
rngtest: FIPS 140-2 failures: 8
rngtest: FIPS 140-2(2001-10-10) Monobit: 1
rngtest: FIPS 140-2(2001-10-10) Poker: 1
rngtest: FIPS 140-2(2001-10-10) Runs: 2
rngtest: FIPS 140-2(2001-10-10) Long run: 4
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=7.518; avg=50.591; max=19073.486)Mibits/s
rngtest: FIPS tests speed: (min=21.146; avg=27.867; max=160.281)Mibits/s
rngtest: Program run time: 10003649 microseconds
...

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: crypto: qcom,prng: document SM8550
      arm64: dts: qcom: sm8550: Add PRNG

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 8 ++++++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                    | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 28c736b0e92e11bfe2b9997688213dc43cb22182
change-id: 20230822-topic-sm8550-rng-c83142783e20

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


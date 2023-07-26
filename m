Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B92C76377A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 15:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbjGZN01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbjGZN00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 09:26:26 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6243EF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:26:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso10765925e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690377982; x=1690982782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9yUKgO7zKJYMgcYFPgPnTgcVnPYS9vz4JlLdoJUgN4=;
        b=Njl9CrBgAO7Rr5VrsMHnMrLdagHNqOSSpMGhNbK8LKS4tfwFBD9OvRLp9binQG7L20
         hVBdZjBJPj4yxpYiIzPriS2EzbHTvgEYS/g0Xz/84L4G0FB4y3jlRi6AoAFos0/TfRJn
         Cs3MKkkGXJ2S1F4gDF9bAk6HtFYiDBEvP6rDX5N5KyeghMiWEXziT4fVQkG5LxDKggTn
         UBGxfZgQMOi5I3QVvRcQJLqLb6wlWs/sHd0HHG8rOadkAnotSsJ0c9aB1TGwFcJt8OyO
         8XUo6P/1U1AxMpb4h6LyXtB1gqSoMwqAUZ/KOM8x3Tnvt6RAchcmQCkYnADW+Yoz8/6i
         k6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377982; x=1690982782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9yUKgO7zKJYMgcYFPgPnTgcVnPYS9vz4JlLdoJUgN4=;
        b=NkB4qI3fg2Xij5pXr4qk28GJjKsPRCYmqku5fg3839wle+LksKFVw3U3o5toPm/j6E
         jLR7OL7l6XmWjcf8dPdBWRJpgyJlFn74cjJvYtPfMCWsnkR1U6j414M16zo2YCuKBanw
         Ms6bQ2pp18amsgH15pGY8GIdV0unLfqL+LYksYfd5OFNSvX3+dC+TeRBTn7JU2QPKtaa
         L3KnzIv99ZY/acNKFCQQyY7zC12YgVtgWt/o6i91xZ0dmJwf/xnaHyBGnUFJ0jFV6e1y
         t6BxZCAOpo4nzh1nJF6+4YxcPjZKEDcJUckahXbgVs9GXB4zHfGcqJnmdgRkr9j/Zffb
         MKsw==
X-Gm-Message-State: ABy/qLY6V3Dp54cnVfXm74/A4W0NybP2xbOuFPVkYKoOez3KT7cyPw5Z
        2bTwWwfSMfGXPlEPUH74qlMQ0w==
X-Google-Smtp-Source: APBJJlH+kC6rd4R61LgSmhssguQXkIwdrZWO8+aCxP+Kf7NtYbY6SsJQ8uAmKMjyCbpanVwsBI1daQ==
X-Received: by 2002:a05:6512:3594:b0:4fc:4f3e:9cbf with SMTP id m20-20020a056512359400b004fc4f3e9cbfmr1266932lfr.50.1690377982608;
        Wed, 26 Jul 2023 06:26:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl59.neoplus.adsl.tpnet.pl. [83.9.31.59])
        by smtp.gmail.com with ESMTPSA id q20-20020ac24a74000000b004fe08e7dfbdsm742265lfp.44.2023.07.26.06.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 06:26:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Fix up qcom reset controller
Date:   Wed, 26 Jul 2023 15:26:18 +0200
Message-Id: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPoewWQC/x2N0QqDMAwAf0XyvEBXxbr9yhijZtkMuFYTNwTx3
 y17vIPjNjBWYYNrtYHyT0xyKnA+VUBDTG9GeRYG73ztgm9xyZMQzpQ/D2XjBZumCxdydReohZL
 10Rh7jYmGEqbvOBY5Kb9k/X9u930/AO6P51t3AAAA
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690377980; l=616;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JJt+Fx5O226avAjx6F2X4Jc0LTcX/nKTaSByt/k1+Xs=;
 b=p6z11iaQFY/T+4Sub7vRp5W9X18CTYVuqf2wMgbG/XwvZZ+woM4lZYAXdoqqVueQ9EHfoB1qx
 F1LjJg46SiLBEeFR12vFBE3esrs16e0zlHW3R2hpLzg57ITeLydE3rT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let the toggle include a bigger delay and make sure it's using the
correct function to achieve that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: reset: Increase max reset delay
      clk: qcom: reset: Use the correct type of sleep/delay based on length

 drivers/clk/qcom/reset.c | 8 +++++++-
 drivers/clk/qcom/reset.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 0ba5d07205771c50789fd9063950aa75e7f1183f
change-id: 20230726-topic-qcom_reset-44879c0387c6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


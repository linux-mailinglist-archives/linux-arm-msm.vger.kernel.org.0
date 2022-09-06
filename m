Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F695AF201
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbiIFRM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239352AbiIFRMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:12:42 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1D98C467
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:02:12 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id bp20so15927492wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RfjWKWch3TZGRYF8XV8JAlQ9Ww6so5roY5L+ZndATM4=;
        b=lJXdlhxW6U93FVDeXa8RVIjHuMH1turQUkNrRzWT2pYQUDBESyhOhPIxYZhghDyYWc
         zkDdLJyh25loRAME81bpbH/arwYWnVBPD2Bk3/Rpv+pLBzEqrmAak7Gfx2fT+f4gd0+/
         UeBjE5rSvFLN4vftUXVyFLhxUg+ffJgnnsMjRDYFTh4+n059vo7AXHjuMUZmj+GT36fE
         xhrrmTWxS+nNiV3OhOry6SNkB5Q0cKSo5vYmEXlu2Azyrm/Ek0oygBCa2fL/S4seXnGH
         mD9koNPhjkydkWBj1aEvS5ANZL+xK/cnrzoqQ7wm5006j8x9ZQa/d5r5xwZEfUJTk6WK
         OYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RfjWKWch3TZGRYF8XV8JAlQ9Ww6so5roY5L+ZndATM4=;
        b=nhd+cN4AYUaibVC7bN7SbLruAmDqOghIA1v2bGUWrWH1g2CuCl7rTfycvzW0DCJk1j
         qwh2m4s/ZS5fVsaOtLToeUP/RHTtNCGhFKJZwoxoFzNxetYeGuP4fu2DpJOX3juicZJF
         RJVjAhR+lecWmxSXT0ep3h7dHepSvMHqCZc5TjFsHy3f+ScrHiZzzARYVbsDck9zjxGF
         JAyLQbpfMZnbZcNc3C7LDjZlFZJYUOPoA3LoMF8y2CaTp7BtBQcCOP8fhwec8UbDllTv
         r6CV92qS9Sk1waEbtoBPYyTd/uVreKbsp8AUNTtlgOnl+lEJAJapgQvrVpvsKB7EKS8x
         /b7Q==
X-Gm-Message-State: ACgBeo0g61o92CPdDYFf9L/Z+OQJGEdOk6CH1X9k4bMEnQ2yCWp3R/8c
        9n+jQArHX18y2idJia1ACBavbQ==
X-Google-Smtp-Source: AA6agR7eQSNeL8sIxTrhMkrtcHCIRn1KrjURhDxY7bHZ7/kV0XSo6UDMgCiFpULXqE3e622OcReYag==
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id bt30-20020a056000081e00b00228a17f92f0mr5749091wrb.31.1662483731026;
        Tue, 06 Sep 2022 10:02:11 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:02:10 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 04/12] ASoC: codecs: tx-macro: fix active_decimator array
Date:   Tue,  6 Sep 2022 18:01:04 +0100
Message-Id: <20220906170112.1984-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
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

currently active_decimator[] is unsigned long however we store negative
values when there is no decimator setup -1.

This is first bug, and the second bug is that we do not check if the decimator
is valid before writing to register using decimator as offset in
CDC_TXn_TX_PATH_CTL()

Fix these both by making active_decimator as integer array and adding check
in tx_macro_digital_mute() before accessing CDC_TXn_TX_PATH_CTL() register.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index c19bb19b717b..5c03ef8d88b3 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -259,7 +259,7 @@ struct tx_macro {
 	struct tx_mute_work tx_mute_dwork[NUM_DECIMATORS];
 	unsigned long active_ch_mask[TX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
-	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
+	int active_decimator[TX_MACRO_MAX_DAIS];
 	struct regmap *regmap;
 	struct clk *mclk;
 	struct clk *npl;
@@ -1117,6 +1117,10 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 	u16 decimator;
 
+	/* active decimator not set yet */
+	if (tx->active_decimator[dai->id] == -1)
+		return 0;
+
 	decimator = tx->active_decimator[dai->id];
 
 	if (mute)
-- 
2.21.0


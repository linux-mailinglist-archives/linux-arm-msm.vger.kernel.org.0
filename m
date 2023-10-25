Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043007D6FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 16:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343695AbjJYOri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 10:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344370AbjJYOq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 10:46:27 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2680810C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 07:46:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31f71b25a99so3810551f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245173; x=1698849973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSOu9HyrCio0gozoTkpNTmqH+O6Zq1CFoJPsJwIyKFk=;
        b=ir03GcM4JjTGgpWml7lWgkgK2ckpwILqtIrTm9q4KhyRigpY898RqJJCNES4/vvdTv
         baHMS4Yxwjul9DkjWn7GdfzeGgzDh0QbHf+Hqs8k86kLI3kdjrpqlEWF4J1cWPCJsy3j
         OPI7wbOmGUNVKicb97ehJZEkwPH6YmIF0ge4UNNdalYrfEfLiPunPAgsTvyHqwG0whGb
         k3iUjKepO+B2Dn3jiBObOvy5rEvJIrrn8RSQbS6j+X4ZpTsBcU17smg10bQo4kK/ITbe
         g7cbBObGQNrfjOkf9YGvH1ODeR+x44gdv79owO56qrZr2hHhol52rIbrJACa7wNmP434
         wD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245173; x=1698849973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSOu9HyrCio0gozoTkpNTmqH+O6Zq1CFoJPsJwIyKFk=;
        b=Sweun3SgZIAXIbr29a3Jl/DqiXhM2qVufLeQajjprBNUa6IykfyTh/SGu7OerwpGl9
         4JpfHlC0hs7mfmJhoooAQ1vn1Q2GJWWoZPzJL90t93ErnhXwkt7Vbpm0pffDbk42XBwx
         qILg7FioEYswtyCzqRuZI4kWPdGl5/9AU9jYP5j58Iq+r+xWvf1gaO2gcQsgcSBJhCYt
         8gMqMDvhZw6xMXsK+a95fls/qpgfOb7pRkPiz67pqDlalUQZtM6qdZssjc9j7nDenk/Z
         KM5Xs+toIsJTA5K5Sd2YKEsJqM6ML5fTVWn4jCDvZe3PsuPJQ8aTXItuwz4QdZPq5lie
         rWUA==
X-Gm-Message-State: AOJu0YzB74KThs3Bw0Tz7zsq5cl1Fa4AnseA31MWd5YhUN91QKglLJC8
        nOjLPb/edVzKbcM2nNxwEmUEdw==
X-Google-Smtp-Source: AGHT+IEdhXacG3VtzhyUIJTLoFxeWnvtOMaJOeURJsu1+71zwQaYKeffXLMAW2rDPpUPUPrcyoQKDw==
X-Received: by 2002:adf:f711:0:b0:32d:b051:9a2b with SMTP id r17-20020adff711000000b0032db0519a2bmr11838769wrp.2.1698245172872;
        Wed, 25 Oct 2023 07:46:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600011c100b0032dcb08bf94sm12267138wrx.60.2023.10.25.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:46:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ASoC: codecs: wsa884x: check if set_stream is called for proper bus
Date:   Wed, 25 Oct 2023 16:46:01 +0200
Message-Id: <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

If multiple WSA8840 speakers, from two separate Soundwire buses, are
used in one codec DAI link, the set_stream() should ignore calls for
setting stream from other Soundwire controller.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index bee6e763c700..91205e8c96f1 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1775,6 +1775,12 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 			      void *stream, int direction)
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime = stream;
+	struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
+
+	/* Check if this belongs to same bus */
+	if (sdw->bus->dev != sruntime->dev)
+		return 0;
 
 	wsa884x->sruntime = stream;
 
-- 
2.34.1


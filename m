Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D43E68F926
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 21:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbjBHU5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 15:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjBHU5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 15:57:14 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3943865D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 12:57:09 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id l7so54763ilf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 12:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPfsCQfg7xuEhCC2eccAscY4Hh6knFHrvMv/YaXzBQI=;
        b=hVNjiwzkqjLOD7wHeIJbnnvO/+VO0Xn8814lLg0ZVkD9RhoH2Fxve/+2G8t+krA583
         xl0f0qLWCrrUnVVVKgZUQ3J0p4L46apoG6mjUnzFAmEcsEZeelZx7ibW03M6VWBv1BAM
         VgYzNijjZnajlbC60VINfGPRFDTViepbGA1mfl7924jaLjzsmd22VPssHEhnxykx8mIF
         0j8J97qa+8u3cp1ELosZHlG+GCUv1BNVoo/wKh55CXvEAYw9gydnHk9B+msQzMuosD+7
         NwHoomUyXSgu18tjF9v1PD7Aa2t5rw46qW5fT7en+2tiFlfP/0xV1sQH0pWUEMKYGROv
         BYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPfsCQfg7xuEhCC2eccAscY4Hh6knFHrvMv/YaXzBQI=;
        b=Qa1Szhg1fkxxLp+irEiZ1gWqQSkApWAmO2KoK2MUe1R9r16qhh4zlf8OwfVYO9JxWZ
         7tU3993WKmO224Hr6C77LejGkNrK59nDIPb0mN8+dgU+hXYQQPho/J0l8scpX9UJJkd4
         z7M938utWwa7aMAs3gwBQ4fogbNVbJiv1TaCb8cSf2/0bKwF2fsdjDAytjHyivgCfBH6
         C1AiFvLQ4UrFBET3fCC0m4jEIVC++XocrRE3D1nKI90y7xq4lfa6leUJGRotBcZxY/VH
         biKe0ZeXP2P+NG9JfkbyJc+kQXFljhMZ/ogSkwI3e7Stj9l40WDGqtOJPAAlEI6O0kne
         5gEw==
X-Gm-Message-State: AO0yUKXuqUgCrPORaWRaycGuv5E3QCxenjvoXKFmqANq4heK0ICiqzeO
        +rPucnwl5SkfyqW3xJ/f9roTxg==
X-Google-Smtp-Source: AK7set/OZmKV0Oc2zwR8ZgvKIFuLbOgd5A5Ee48HH4+3uI5L38z/Xw4Q7ua2v+i3b43vBSPvxTNmPg==
X-Received: by 2002:a05:6e02:1b09:b0:310:f912:5a68 with SMTP id i9-20020a056e021b0900b00310f9125a68mr2926016ilv.3.1675889829551;
        Wed, 08 Feb 2023 12:57:09 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id r6-20020a922a06000000b0031093e9c7fasm5236704ile.85.2023.02.08.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 12:57:06 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/9] net: ipa: generic command param fix
Date:   Wed,  8 Feb 2023 14:56:45 -0600
Message-Id: <20230208205653.177700-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208205653.177700-1-elder@linaro.org>
References: <20230208205653.177700-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starting at IPA v4.11, the GSI_GENERIC_COMMAND GSI register got a
new PARAMS field.  The code that encodes a value into that field
sets it unconditionally, which is wrong.

We currently only provide 0 as the field's value, so this error has
no real effect.  Still, it's a bug, so let's fix it.

Fix an (unrelated) incorrect comment as well.  Fields in the
ERROR_LOG GSI register actually *are* defined for IPA versions
prior to v3.5.1.

Fixes: fe68c43ce388 ("net: ipa: support enhanced channel flow control")
Signed-off-by: Alex Elder <elder@linaro.org>
---
Note:  This is sort of a non-bug, so I submitted it to net-next.

 drivers/net/ipa/gsi.c     | 3 ++-
 drivers/net/ipa/gsi_reg.h | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index bea2da1c4c51d..f1a3938294866 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1666,7 +1666,8 @@ static int gsi_generic_command(struct gsi *gsi, u32 channel_id,
 	val = u32_encode_bits(opcode, GENERIC_OPCODE_FMASK);
 	val |= u32_encode_bits(channel_id, GENERIC_CHID_FMASK);
 	val |= u32_encode_bits(GSI_EE_MODEM, GENERIC_EE_FMASK);
-	val |= u32_encode_bits(params, GENERIC_PARAMS_FMASK);
+	if (gsi->version >= IPA_VERSION_4_11)
+		val |= u32_encode_bits(params, GENERIC_PARAMS_FMASK);
 
 	timeout = !gsi_command(gsi, GSI_GENERIC_CMD_OFFSET, val);
 
diff --git a/drivers/net/ipa/gsi_reg.h b/drivers/net/ipa/gsi_reg.h
index 3763359f208f7..e65f2f055cfff 100644
--- a/drivers/net/ipa/gsi_reg.h
+++ b/drivers/net/ipa/gsi_reg.h
@@ -372,7 +372,6 @@ enum gsi_general_id {
 #define GSI_ERROR_LOG_OFFSET \
 			(0x0001f200 + 0x4000 * GSI_EE_AP)
 
-/* Fields below are present for IPA v3.5.1 and above */
 #define ERR_ARG3_FMASK			GENMASK(3, 0)
 #define ERR_ARG2_FMASK			GENMASK(7, 4)
 #define ERR_ARG1_FMASK			GENMASK(11, 8)
-- 
2.34.1


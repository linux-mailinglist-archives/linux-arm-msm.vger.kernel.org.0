Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4972B7855BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 12:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbjHWKpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 06:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbjHWKpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 06:45:14 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061ADE54
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 03:45:05 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so4567365f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692787504; x=1693392304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe5JYcez2RRncc8Tqs2BLW5VAL0PX0lvSGbsu+cCr/s=;
        b=pHyMbyMXJpCL6G9/+HUquyQCMDm2uzfU0shAIf2bHTJKUSPbsJbYhlNyTNnUvx0aoO
         VjVdJl+0JQ960X8r6OHzyf4ZWF5TpOQHPCYlVzNJJcwBcBuWcraOzlMn+bmS+MWcxgOq
         9pGYSxDH4mlXYYZMw8NzjhffOGB1TfcMMSsnw/w39Ne1TJ+68DN7aj52jolyjT7B8Nxr
         vEYXss5NzzHVPuhDBK6QoocAONS6c03XeFdUmWI6pD+5WDRmdDZv8LdxnzDdPvF74kYo
         JvOm2s9i6ejwas/Suvb7BJWpVSX9KdryVXC6fOMKfVW4l1v15LswbDS9ZFczOyPbmXg6
         cEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692787504; x=1693392304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe5JYcez2RRncc8Tqs2BLW5VAL0PX0lvSGbsu+cCr/s=;
        b=NGvICoqUbPd32ToOPzTpJJ0fqh7yNHI73kLu2uVYYB+BmbdGtfB4Tgh2vGCL3UlqKG
         gcjUAdrD2GbeAEHdz3rc5scsaoi9oNBMOXyEl8FBntDI+U88oU+TJYYba4W2oNXWdaRb
         RFggC9gCs+pQpGT1T5bbW+iLfDzVRAMcSCq6IUDlbJ6ehXOlDQUyveKrpch8dbWP/Jau
         bN2t98r7eGD33ns82O+gpTyzT845pGrctSUHp6c6siBQk3tVRLDQSOi/mMSWNcBoLUEW
         eyoH/iQZEjII5HKSL3FLOB7JBHAiLCIYcrjpTGEgurJXvsnTUb1d8pwSb+VLKRsUwKJr
         /hNA==
X-Gm-Message-State: AOJu0Yzz9wzl1LF0hdlkVoAPQNb5YpANHtbftVZ84ugCCh1+cRkqXIyN
        qWMmKttyGm5alhHdy6DEHHFtJQ==
X-Google-Smtp-Source: AGHT+IGFkufNrsnDmQgxqXPw2avuPrLJEuQEiNe0i4H618jsl9lNYUq5I9/P++9GKiRrnOLHdpTsBQ==
X-Received: by 2002:adf:ffcd:0:b0:319:7428:9ca0 with SMTP id x13-20020adfffcd000000b0031974289ca0mr7178505wrs.61.1692787504575;
        Wed, 23 Aug 2023 03:45:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4204000000b0031c5dda3aedsm6281213wrq.95.2023.08.23.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 03:45:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/15] media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
Date:   Wed, 23 Aug 2023 11:44:41 +0100
Message-ID: <20230823104444.1954663-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several of our upstream and soon-to-be upstream SoC CAMSS dtsi declare
csiphyX as opposed to the older clock name csiX_phy.

Right now the CAMSS code will fail to set the csiphyX clock even if we have
declared it in our list of clocks. For sdm845 and sm8250 we appear to "get
away" with this error, however on sc8280xp we don't.

The right approach here is to set the clock when it is declared. If a SoC
doesn't require or a SoC driver implementer doesn't think we need, then the
clock ought to simply be omitted from the clock list.

Include csiphyX in the set of permissible strings which will subsequently
lead to the csiphyX clock being set during csiphy_set_clock_rates() phase.

sdm845 and sm8250 will work with the code as-is so I've omitted this from a
suggested Fixes list.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index baf78c525fbfc..d9c751f457703 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -687,6 +687,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 				if (csiphy->rate_set[i])
 					break;
 			}
+
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+			if (csiphy->rate_set[i])
+				break;
 		}
 	}
 
-- 
2.41.0


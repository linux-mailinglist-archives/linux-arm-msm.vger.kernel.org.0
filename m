Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831DB79AFD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343616AbjIKVMF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237812AbjIKNOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 09:14:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC67BEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:29 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9a9cd066db5so563200166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694438068; x=1695042868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C0C50wtnGO2j7zZY3xq1VlSsU/DQL3UJPAoJpLYkHQ=;
        b=pzGKIms8wgCSiI86P6DJ3Aw2n4yC5ee2FD3FLfGyKUOizGDDWM38w75Vw1yRf95ddn
         p+L3JQB7k5BdCcBrg7zg/+Vk8m1b/LhPxJd2wr4IGHi8ipHvozfNAdGaW6Qar+jkU4w7
         Na6vWEfB3DF7+PeXotJwDCUTn/qLzBDFfJ1+Ou7mYjNDSKoKcu0YNsi770QUGjPyNc6X
         MiyYH1toYb+du8zOR47HQW8kKqi5vpa8vMlQj99OS5x8lNnBbxC9OWhbOey5CUu7NiuZ
         f+QxgLjCh5ZJkC4bcoxNymbjtCnaV3zes2BbpEZlCzojA3hSIlszvGZl9ZVuRiJNwCki
         snDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438068; x=1695042868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C0C50wtnGO2j7zZY3xq1VlSsU/DQL3UJPAoJpLYkHQ=;
        b=FO1p0OVL5J8utX7zmCLW/sl1voUY9fcdmmw1J/Wh6g6clTQxPSb5CettxOGZ6p4qG5
         bSor9KdD6u01OlE28IZIjW2qZVDRcWJuN3blcyLH4CykmJ+MUFwCo1/54JAvpKoUjwTy
         5u9FyXC5/2wytZtt4vGKaAkJOgh1yTxMpCHXNfAzBfcFt+yK+Zy4CIquYiTL1Y6k5njM
         JPNy3129aLtMBf8X0jNeKkvuD0a47IdNn4Ri4UgJQGkH/UsCKYDGvDHqN9szsRQLetbV
         dvl6KLR0i+QxsewlJXXR1iSlgasbnCXgCGh94ZUJoVHQebcUVQNw21p6jp9+tn4wyUtZ
         UjTQ==
X-Gm-Message-State: AOJu0Yx5ckIMSqRmRMg/drGdduGd95MS3g8ifU04tKUG1lZPZ97K5xK2
        xZ++dTYDiiVUJvkD659zFuOm7Q==
X-Google-Smtp-Source: AGHT+IFWAlUwXRLDYM6D+BavP9r0AWzrYZPKIIIHIkPACbQ4yyZ81/dH4aVv3WUbjrLDWfkfGX5EFA==
X-Received: by 2002:a17:906:3081:b0:9a5:d657:47e8 with SMTP id 1-20020a170906308100b009a5d65747e8mr8787799ejv.52.1694438068278;
        Mon, 11 Sep 2023 06:14:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b00988e953a586sm5313648ejb.61.2023.09.11.06.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/17] media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
Date:   Mon, 11 Sep 2023 14:14:07 +0100
Message-ID: <20230911131411.196033-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
References: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 87d6d65aa90cf..5202bfcdbc35a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -677,6 +677,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
2.42.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B591C72FF95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 15:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244865AbjFNNLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 09:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244816AbjFNNLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 09:11:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CCC2690
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 06:10:47 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f8c74af64fso5904485e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686748246; x=1689340246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRzG+HV9GN4lfJMfWqgxlfRDbNNuf4h9SVoZ/Ln+yfM=;
        b=Abt84zPG1mZC7LoNsgyS/gG+GrkwXO5EYd4Oyn762VvhrHxIk7SUotb1Ogslm71/I0
         ATLqAshTF7CDjww/zykZLRHWnCj5rVshi7dDPRp92TZaM2Qyo2G7LNyl1p4v8IEHyiX2
         4hBA/wC9ZdQMuN3UwYfRU6lia70FeBwcj2aYgPZFeAg0hzZKDsn/v6obhqLNPHbS0U2G
         WxH0CSDpjPE/pkJtBxJngH8RqGQn8GBq6Sg5uXbDShG/HU/mPaL6ORWMAzK3BvOyNtGM
         hnm43phqzmWoRJbDZA40KxAx0N0kFXSOk+QGK8QwlJeNLyKLvufe3lgs5TB+HRHv6fOM
         me5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748246; x=1689340246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRzG+HV9GN4lfJMfWqgxlfRDbNNuf4h9SVoZ/Ln+yfM=;
        b=JdBkqVtWwo99I627C5b15HlVtltnCEyiT/4Jc7xHNb9sqGHqDQbYrGIXpX4rZ1lvsp
         aZabwp/4pd9JQ4W7T1Pm64u4HaKPGD0Td80A0bfQ//16EwMv21EtG/djNOI3AzPmMhH7
         6YMCM3AGi+NcgO8DIILIKLAm06gIXukedrsOI9Q6c9TDVZQjij6u+RsACjGiOD5bfFrL
         kb5ezRCtiQ3Q+9SKFgiJlSOC9uJ9Of5iuOXbNLFzWcZKt7NKHDHkmgVBTP8FfG6S4b28
         DQ6sD/Omr71oA+Pt+Jthai/sMB4v4U7DdprTp5VMQAy9ISq3xG/1gHesBpkZXTr+P/px
         kUKA==
X-Gm-Message-State: AC+VfDztm0CswaSwTHZbhvaP8cqsl5uGek37dlws+5WB0TwfFrCK82ZB
        0dV3V44Cfft1TQSCTRMs4H2jXaUQo4X2zm4Gxf3JdQ==
X-Google-Smtp-Source: ACHHUZ7j42D1SG7rrT1Cld1gmzJEwnGxajVFXglzCpGYyHpVVCce1ptErw8HFvkeJ3zahOIhanxkOQ==
X-Received: by 2002:a7b:ce88:0:b0:3f7:34dc:ed0d with SMTP id q8-20020a7bce88000000b003f734dced0dmr11048944wmj.25.1686748246152;
        Wed, 14 Jun 2023 06:10:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c224700b003f60a9ccd34sm17548661wmm.37.2023.06.14.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:10:45 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 14 Jun 2023 15:10:41 +0200
Subject: [PATCH 3/3] usb: typec: fsa4480: add support for Audio Accessory
 Mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230614-topic-sm8550-upstream-type-c-audio-v1-3-15a92565146b@linaro.org>
References: <20230614-topic-sm8550-upstream-type-c-audio-v1-0-15a92565146b@linaro.org>
In-Reply-To: <20230614-topic-sm8550-upstream-type-c-audio-v1-0-15a92565146b@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=AmK9tGuhBzHU6OgDlD+wPAdxUZOMyPGmnDLrHwn/j/c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkibxSO3IckWWolI0nLUXzFCyCRUwuqC71q47oYIZ3
 SH4yGcyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIm8UgAKCRB33NvayMhJ0fUBD/
 4+WAQp8FuGaqCALfEFyB70ECb1yhUyo7bs4XJUARqa3sklwtH4oeb2nhWCJvcQKHKX510tvXmGMfmn
 ZNVpF7o9zHgYbSu9ICVa7CiROfCeNzYZ0BJR4dk1Lp9ua307BnoB57leUyaCR/QhacygzrGsJBoK2y
 4sWwdIXHXSVF1SXFFel2eHWuFuOCPBlx2g+nsF9iW/Jvwe4FNsoJLLMfq37u/j4BkkG91aDJ/L724x
 NMNJLZYuGhrtVWi1TW0qy2PTdgp3t1GLGdTlTPZEWqaB8ifSla4zbHALA/t7WyvXa2cs+4S6VO60nB
 cVCtBUxRdYaczIE4E4XMH60AXVanHmqk2leErKRG6UO4zYhFjKgaCrMIlJXTPuF7gi92ZEE/t9FeZT
 6OqrFwf/fxCcM5U5cZgyjTsYY0e7hbcGcT7Lkj+8XKGX9lyTNBLOnxOxzlGZB2wmri08aM2CjlOQvl
 TcpgOsruioWe++bQIhSwv0x28FDyMtsbTUr/OmwRx9uzCaHbVhLMY6pen4sSpaWnWaPDUFkznkAVWo
 ZNczyznmecSJdCkR2x5g54u2z5Avlhp1u0nf8XyXyZf4fOr3zkGL7QQhY32mZQ64dmxGE4/2FeANT9
 0g2KeO/o8bPb61OlVA70idWgqBCFcDqfU56csnUWRMvgBjIJjE8WBftgUNtA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The FSA4480 Type-C switch supports switching the Audio R/L,
AGND and MIC signals to the USB-C DP/DM and SBU1/2 to support
the Audio Accessory Mode.

The FSA4480 has an integrated Audio jack detection mechanism
to automatically mux the AGND, MIX and Sense to the correct
SBU lines to support 3 pole and both 4 pole TRRS pinouts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/mux/fsa4480.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index b2913594a58f..45f5683b7d81 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -25,15 +25,24 @@
 #define FSA4480_DELAY_L_MIC	0x0e
 #define FSA4480_DELAY_L_SENSE	0x0f
 #define FSA4480_DELAY_L_AGND	0x10
+#define FSA4480_FUNCTION_ENABLE	0x12
 #define FSA4480_RESET		0x1e
 #define FSA4480_MAX_REGISTER	0x1f
 
 #define FSA4480_ENABLE_DEVICE	BIT(7)
 #define FSA4480_ENABLE_SBU	GENMASK(6, 5)
 #define FSA4480_ENABLE_USB	GENMASK(4, 3)
+#define FSA4480_ENABLE_SENSE	BIT(2)
+#define FSA4480_ENABLE_MIC	BIT(1)
+#define FSA4480_ENABLE_AGND	BIT(0)
 
 #define FSA4480_SEL_SBU_REVERSE	GENMASK(6, 5)
 #define FSA4480_SEL_USB		GENMASK(4, 3)
+#define FSA4480_SEL_SENSE	BIT(2)
+#define FSA4480_SEL_MIC		BIT(1)
+#define FSA4480_SEL_AGND	BIT(0)
+
+#define FSA4480_ENABLE_AUTO_JACK_DETECT	BIT(0)
 
 struct fsa4480 {
 	struct i2c_client *client;
@@ -95,6 +104,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
 		default:
 			return -EOPNOTSUPP;
 		}
+	} else if (fsa->mode == TYPEC_MODE_AUDIO) {
+		/* Audio Accessory Mode, setup to auto Jack Detection */
+		enable |= FSA4480_ENABLE_USB | FSA4480_ENABLE_AGND;
 	} else
 		return -EOPNOTSUPP;
 
@@ -110,6 +122,11 @@ static int fsa4480_set(struct fsa4480 *fsa)
 	regmap_write(fsa->regmap, FSA4480_SWITCH_SELECT, sel);
 	regmap_write(fsa->regmap, FSA4480_SWITCH_ENABLE, enable);
 
+	/* Start AUDIO JACK DETECTION to setup MIC, AGND & Sense muxes */
+	if (enable & FSA4480_ENABLE_AGND)
+		regmap_write(fsa->regmap, FSA4480_FUNCTION_ENABLE,
+			     FSA4480_ENABLE_AUTO_JACK_DETECT);
+
 	if (enable & FSA4480_ENABLE_SBU) {
 		/* 15us to allow the SBU switch to turn on again */
 		usleep_range(15, 1000);

-- 
2.34.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B729A7DF15F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 12:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjKBLmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 07:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjKBLmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 07:42:16 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799971AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 04:42:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso10294741fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698925322; x=1699530122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCtyQ+lTDBrdwtq+TcgFqVgQ5Den1oj2NhFuV2sggCo=;
        b=w77L74RAWWOS7mK8xD5RkJDL0FUHcKlkjhZL1AogUKy5BhqzchsqHqkMMqEoIQYyE1
         P7wAs6ar1WsEOhsAmooYJzC450XdZKwrETPPi4xepcXvdMMYi8t9a4uMxj0QH9JPXlOh
         jCABinkJux5swY3A8D/9Sr3iQJI2/5T6qTb5cReDaMQtkDnvZ2Z+BSDeNxFw/8dyaqAB
         ikbGDFHeh2DhrYsGR2iMu68WK9V4QbbtypDasi0J6tzl0Ujz3m2lRwUVrKz/UTQzKxFv
         OxaS/IrrbEXtlG7MycNhzUOZPnvgiotDPoVgHhj+GmaRR6P5+Lnl6+T/+lWuefK93vi2
         4t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698925322; x=1699530122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCtyQ+lTDBrdwtq+TcgFqVgQ5Den1oj2NhFuV2sggCo=;
        b=mAvAtEcAspYBaCSRE4/muzPG94uyAryjOtQPcrvgO1w8pEop2nTpqOuaZKRMKaGYOR
         TEKOS6L0JlPfc0izWJPvuK5n/3oZAhg4s/mcmzuAyed5QjpJwvEBjajpqmxrRf5QLK3G
         y10TpWUyeGCMbWv1ot1vgDRZhxwJ8vEKwRTkPDdA6vZaM2dWomRz13R0Qnnj3gMsHJvO
         IlAKHAX7n3t5MG6DUPx6EuTg0Dy+XCwZRdv8v7FzcX1XbrasqR5IxitjRIvVundpPGUM
         6FvuIDYXX0sMylmbFrW10M3y2YrsDGbr2wRBYbkkRQYATxMtxY3BTm//7542iUR4EGDS
         Yqew==
X-Gm-Message-State: AOJu0Yz0gviARSO/Xn0IO9HigMoiofr72mtxmvqrxzGSjkzxD3S/f35w
        7h1EumH5prdei07O0IfNv1WBnA==
X-Google-Smtp-Source: AGHT+IGvZn2wtToDUNQMUZDjxqb0jF34/Ifj7WukTVEEEaWsUDutozvPwmmWaykYhSU53fWDPgvQtA==
X-Received: by 2002:a2e:8048:0:b0:2c5:b87:39bc with SMTP id p8-20020a2e8048000000b002c50b8739bcmr14078900ljg.1.1698925322284;
        Thu, 02 Nov 2023 04:42:02 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j41-20020a05600c1c2900b004060f0a0fdbsm2717720wms.41.2023.11.02.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 04:42:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Thu, 02 Nov 2023 11:41:55 +0000
Subject: [PATCH 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231102-b4-camss-sc8280xp-v1-2-9996f4bcb8f4@linaro.org>
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
In-Reply-To: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-83828
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index cd8186fe1797b..0c0e813d15799 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -76,6 +76,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0


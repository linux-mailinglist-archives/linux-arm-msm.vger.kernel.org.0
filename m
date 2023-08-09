Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9696E775E9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjHIMMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjHIMMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:12:30 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFDD1BF0
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:12:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5217ad95029so8777502a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691583148; x=1692187948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFvAA/v39L86qjDqi6cHkK3yiYvvs9Qa9ISV4luSpBA=;
        b=tdSvXZ+BdfkaUDDGp6yIk2M/QfK6VnQ7Wt/SxsMRWUGanoHRO6dFOEXzSJQ7qbn1wZ
         wy8U1H1KLw9ScmVHJ9g2H2jh9/nPKsMQfyBTw5/HBNYX4v5sCpf+38p7T49sp2iwii4Y
         luYrh5dQUtYkedH6wBL19GQBgaenwQAJu6etjxz9el5fSxhPeAE/wEIhI1nD59MzCGhO
         5TlslP2kEo9BZiYj3rnSO16mH0W3vAc7mg1UT6gBVQiGY5Dx49RAyI1poobAWA9sGBQN
         w1D+YkPz7WFEY/ciHErDC5h1LpLbO5A7t1MW/VXyX9mg0zVWPN54cDomBcNhKfTkyMHM
         irtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583148; x=1692187948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFvAA/v39L86qjDqi6cHkK3yiYvvs9Qa9ISV4luSpBA=;
        b=Co/GxuYQPqpEJkZZERegxiZXSPssmUiucibNM/mjzWf1lLj4Duz2lEUXpnbD00/fS3
         Ww2xPWyl21dLi0/aN1nS7lLj+8T8reUXFI+LthSNCC+EsHn+WipwzpILZcFTk4BItL+/
         TtxkBBDwp3fAPxZaVsgwCjz2TORotOArxP0VkHGsE6u5F582PGD7mXPCSfk4yWEQegh2
         SOAWxKIS4xIykU24fstBUM8mq5QGrfNX/nGZCgJy6TZ0EEUi+lPyd0DoyXmlk5uV6kex
         aezejoAFaYPJHGtTIoZkX1ioDWxhNrrzW9MGX3d3CXxHvyft2lyEa5Dp3l9c9BySHieK
         3LIg==
X-Gm-Message-State: AOJu0YxmryX1925OZNwTuBZ1Jaeh00/PVNwKmNbsNG55L0XwDihUjaBn
        DfoRhuWh1EGA0THoYopP5UPNlWk148HSz1H7gPE=
X-Google-Smtp-Source: AGHT+IFdMKH9L8wd2454RCyOpWWrJie6RwmaDWZQZMXoneh38svP9bLig4ymV9a7EA2LKFm1dKwF8g==
X-Received: by 2002:a05:600c:248b:b0:3fb:b530:a4e4 with SMTP id 11-20020a05600c248b00b003fbb530a4e4mr2033263wms.8.1691582678366;
        Wed, 09 Aug 2023 05:04:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b003fe1a96845bsm1808573wmi.2.2023.08.09.05.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:04:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/7] arm64: dts: qcom: apq8016-sbc: Fix ov5640 data-lanes declaration
Date:   Wed,  9 Aug 2023 13:04:27 +0100
Message-Id: <20230809120432.1036405-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The yaml constraint for data-lanes is [1, 2] not [0, 2]. The driver itself
doesn't do anything with the data-lanes declaration save count the number
of specified data-lanes and calculate the link rate so, this change doesn't
have any functional side-effects.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 75b4e5ff7c95c..0481a4a82090a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -291,7 +291,7 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				data-lanes = <0 2>;
+				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
-- 
2.39.2


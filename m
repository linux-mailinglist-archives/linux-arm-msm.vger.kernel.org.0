Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1640567BD45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 21:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236474AbjAYUqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 15:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236527AbjAYUp4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 15:45:56 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D095D922
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 12:45:54 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id e204so9024901iof.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 12:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO/DlijeKlIU6w5Axu0X1q3Z8gOHm4UH5Qr0chFaDYE=;
        b=xOIrFh2ybWVr5oX0yKbxF/vMXdmutKagcSVWcGSJEbIllZn/ol5s2OB7YhRaSUMCUL
         xrOCiVt6fb8d6xDh2/Ll4/hRPHqXV8Ed6Ii490FIE3+drwgs6CsFXXyI4V5cf5E/iY+4
         ofOjR0/1o0jk5YFyXd1eICud0VRURtQAi6Yk8eyF3EM/mC39xJ8ME0tdPwir8N6lC/in
         uyMVlAknI+qgLP8v0ZBkEYmo7sKDz+yCceYPanhHPxHbxkWTligbNgDfS5+KeOlfpqwH
         tOfir8KkaZHp8uEXdIbb1nDN6lUk/DaPiz41Or+8aNHHiIDNdYOW9hg0QrZfhkNZksFD
         CB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO/DlijeKlIU6w5Axu0X1q3Z8gOHm4UH5Qr0chFaDYE=;
        b=hgvv8EIPrXPPq6p1fnwaekVLetDKSTnTpTG3CWMa2sJIIjOliOUJ5S4O534gfviJ3d
         PTDiGHibR2vUxh7k6HYFJwWAmaPjHIoGJMSdNL8NXw//H6DSn/Ozd+jG6HPbTFpv8amW
         Jh/g4e7Teq9iagS0wFgpaYuFa5ztUGW8TtbDxvK6zAP5KLIdfFmPWqXoKNxleUhzNN2H
         JbQZI8F/CwY1/MMtTO21MVNAP84rKK23OviKdQ/6sHk4N+OmjSnG9Ta+HJxYgNLhxDsv
         NIwmEgq+t2Q7gDj8AY5c6KZPzUGx+X5rX43W/vkhDJAC5bquQTWB5EKC/1a0AMq5e7Q8
         c+oQ==
X-Gm-Message-State: AFqh2koXYwunM3OiH0X2WHpr279OaKxbzDgafdOpyMGINX8JlZSFSWu1
        e2I5KIG9ugNe6jiwAzzdOQ6vVA==
X-Google-Smtp-Source: AMrXdXs58SAFuh+dzcoSLgO4zcDzklAbXxGprE1mFbPsIaCzVgLVXLg0ybjfHGmAvjNbAtP1ogkL3A==
X-Received: by 2002:a05:6602:2588:b0:707:82c8:d45e with SMTP id p8-20020a056602258800b0070782c8d45emr15343876ioo.4.1674679553772;
        Wed, 25 Jan 2023 12:45:53 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id w14-20020a02968e000000b00389c2fe0f9dsm1960696jai.85.2023.01.25.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:45:53 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/8] net: ipa: rename the NAT enumerated type
Date:   Wed, 25 Jan 2023 14:45:41 -0600
Message-Id: <20230125204545.3788155-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125204545.3788155-1-elder@linaro.org>
References: <20230125204545.3788155-1-elder@linaro.org>
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

Rename the ipa_nat_en enumerated type to be ipa_nat_type, and rename
its symbols accordingly.  Add a comment indicating those values are
also used in the IPA status nat_type field.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c |  4 +++-
 drivers/net/ipa/ipa_reg.h      | 10 +++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 5cf3ac2b5c85a..178934f131be5 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -68,6 +68,8 @@ enum ipa_status_mask {
 	IPA_STATUS_MASK_BYTE_LIMIT		= BIT(15),
 };
 
+/** The IPA status nat_type field uses enum ipa_nat_type hardware values */
+
 /* Status element provided by hardware */
 struct ipa_status {
 	u8 opcode;		/* enum ipa_status_opcode */
@@ -570,7 +572,7 @@ static void ipa_endpoint_init_nat(struct ipa_endpoint *endpoint)
 		return;
 
 	reg = ipa_reg(ipa, ENDP_INIT_NAT);
-	val = ipa_reg_encode(reg, NAT_EN, IPA_NAT_BYPASS);
+	val = ipa_reg_encode(reg, NAT_EN, IPA_NAT_TYPE_BYPASS);
 
 	iowrite32(val, ipa->reg_virt + ipa_reg_n_offset(reg, endpoint_id));
 }
diff --git a/drivers/net/ipa/ipa_reg.h b/drivers/net/ipa/ipa_reg.h
index ff64b19a4df8b..b1a3c2c7e1674 100644
--- a/drivers/net/ipa/ipa_reg.h
+++ b/drivers/net/ipa/ipa_reg.h
@@ -382,11 +382,11 @@ enum ipa_reg_endp_init_nat_field_id {
 	NAT_EN,
 };
 
-/** enum ipa_nat_en - ENDP_INIT_NAT register NAT_EN field value */
-enum ipa_nat_en {
-	IPA_NAT_BYPASS				= 0x0,
-	IPA_NAT_SRC				= 0x1,
-	IPA_NAT_DST				= 0x2,
+/** enum ipa_nat_type - ENDP_INIT_NAT register NAT_EN field value */
+enum ipa_nat_type {
+	IPA_NAT_TYPE_BYPASS			= 0,
+	IPA_NAT_TYPE_SRC			= 1,
+	IPA_NAT_TYPE_DST			= 2,
 };
 
 /* ENDP_INIT_HDR register */
-- 
2.34.1


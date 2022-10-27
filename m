Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405C860F72B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235617AbiJ0M0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbiJ0M0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:26:45 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7717FFF23B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:26:44 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id b79so1267779iof.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh1EaQjT2Reomce8kVVBzGzrDBNIcwVObojZzaiEYwI=;
        b=Aoj+E+2QqQ3GfZknmX8bjYVVjTqTknVXBgtukTrN+IiQ4/sLUoSqr3DsM1gal3O6XR
         T6eGVNVcmHM0fV8NukcOgwGlPAyFjHwg3rKS7u+oR+8W5ouHPrWhVuzBeYc0iZrFrkH7
         +JYmZ27IfImAqHzt9l/Z1YdogztdX0IwCtYmf70OfcXy4DrvnC4ExQwaSDdr4XOqOdCc
         2uaUcxDg0OL7MSfaVGw7hOXCj/7KnPeVs0i16HOhpubwiJfSgGoF57+OZsmjKIuDZ+rU
         G+chfM0GPoN4ff1z1ufcy60NQNv2BGgNoKS3KQZMvyjwk7SUH3qKX3/qsrQLiM4NJYxS
         C+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh1EaQjT2Reomce8kVVBzGzrDBNIcwVObojZzaiEYwI=;
        b=YjypEBEF5S0pH92f5RODcnUjjzHflkf4LJ35Ej3YUm6CKC/nO6FIAujPAXMOq7fYOV
         NIITKkZgip9vecONnHypfoPsXXoeM21jz8G4W8FD9H0SJh0m/5oHxGfSZZcIXAqhsMVk
         OUCMSKZA/8uUIk8fJFBhZrU1RPrvfdB9QbwT71R9zfo/LMECtIU8q66azSl/eOC8UeaX
         CpnSW3rbk1N0A83gIkJKL7/6DzIpqAaul/bQ/FG5q4aXKfwBsnphbjFHurujaIWwubEN
         RTDGN/5gtu4iaZxNp2kH65j3cGOod2qH7L+ROT/lGzCLIChBcOZaY9UJomZjX40VBK1+
         eMKQ==
X-Gm-Message-State: ACrzQf2UdZBB02XKqvBU9CRW3gZBcPGh1s1JnDzGXIBZuO4EOKBg+r8m
        xu4UbJQQRjyfH3Rh/OoMToguWw==
X-Google-Smtp-Source: AMsMyM4fqCIVwfpp8JR3l3QjHc6SdWOigd6nFRNkyDpODhBKAwdNTUDyeG0MwO/3SIaj4r7JmL+ILw==
X-Received: by 2002:a05:6638:14cf:b0:365:c889:4285 with SMTP id l15-20020a05663814cf00b00365c8894285mr29372852jak.312.1666873604012;
        Thu, 27 Oct 2022 05:26:44 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id w24-20020a05663800d800b003566ff0eb13sm526528jao.34.2022.10.27.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:26:43 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/7] net: ipa: refactor endpoint loops
Date:   Thu, 27 Oct 2022 07:26:30 -0500
Message-Id: <20221027122632.488694-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027122632.488694-1-elder@linaro.org>
References: <20221027122632.488694-1-elder@linaro.org>
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

Change two functions that iterate over all endpoints to use while
loops, using "endpoint_id" as the index variables in both spots.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 6fc3cc6379fb0..740b2e4e0c50a 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -426,10 +426,10 @@ ipa_endpoint_program_suspend(struct ipa_endpoint *endpoint, bool enable)
  */
 void ipa_endpoint_modem_pause_all(struct ipa *ipa, bool enable)
 {
-	u32 endpoint_id;
+	u32 endpoint_id = 0;
 
-	for (endpoint_id = 0; endpoint_id < IPA_ENDPOINT_MAX; endpoint_id++) {
-		struct ipa_endpoint *endpoint = &ipa->endpoint[endpoint_id];
+	while (endpoint_id < IPA_ENDPOINT_MAX) {
+		struct ipa_endpoint *endpoint = &ipa->endpoint[endpoint_id++];
 
 		if (endpoint->ee_id != GSI_EE_MODEM)
 			continue;
@@ -1008,10 +1008,10 @@ static void ipa_endpoint_init_hol_block_disable(struct ipa_endpoint *endpoint)
 
 void ipa_endpoint_modem_hol_block_clear_all(struct ipa *ipa)
 {
-	u32 i;
+	u32 endpoint_id = 0;
 
-	for (i = 0; i < IPA_ENDPOINT_MAX; i++) {
-		struct ipa_endpoint *endpoint = &ipa->endpoint[i];
+	while (endpoint_id < IPA_ENDPOINT_MAX) {
+		struct ipa_endpoint *endpoint = &ipa->endpoint[endpoint_id++];
 
 		if (endpoint->toward_ipa || endpoint->ee_id != GSI_EE_MODEM)
 			continue;
-- 
2.34.1


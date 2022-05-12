Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339E25250E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 17:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355738AbiELPLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 11:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355736AbiELPKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 11:10:50 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58398DEC
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:10:41 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id z26so5629300iot.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+ifJblrQS6wsvVLJbCK4vZS+8eWu82qh+mj7lpTlPI=;
        b=BlhKvvEpQGUSQwb9tVfoCMFR+KbiPKGe70gOBDgljTA5DQUqQ9ZtT0kR7HeX0WWSOy
         SAXnIDDky6RlT0fx4cOJkqAVuo6GGxtjfFg2Y1o63whslEzsP1X7zkyvQ//Wj99oxnVE
         q/nSbzbflXX3HOTfe0stKMdncBYqvdAOkIsHHN0ezP/vZLF59z0/O0aadl383jhInwDM
         w/idkEqDx7g1z3yyLvsGLYppYWYJtcqcsLkqyw6hGmRVVGgcIiqWdnYgvvNvfvfpbChQ
         mzwQ9U03GQ3QsIV/wOTEeGf3wLy16CmUAJ52ENMM5yvGoY+TzZKlcMZZ5EDrAjkGBvyr
         LI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+ifJblrQS6wsvVLJbCK4vZS+8eWu82qh+mj7lpTlPI=;
        b=FKJd1OTyQsiyQsYZ3Mkz9URO8vc4o2PdQj5CYDEFoDUrFD+hTGuIFlj2fZ3Aw6RTHu
         AiH2gSkYYVLO0YVqzxdLoYgsORTDCiM9cweST3nmSkHoTSzvPe/fSYIccwGXzEWDjvXy
         M7okkyNl6OFddsGSoqDOvk9bnKbjudlv8RFjm4rUZAKQv9VUg3qA5xAxXs67xPS1ioEy
         p92M3wTIW9nfAFNOBSAeMthidalaH7voB+NdPzrc437uPY96x3xpThMdWzhuv57XJQy2
         tt/TSJYDetBI4DZX0NGmOw2IRM7ZNJ0HFy1UMMqYg2H247NGaHsIKLFJeAymmhqW2DtF
         p7/A==
X-Gm-Message-State: AOAM531rFQpkcL//6KV+ldPE8Ta22is4j9bEyfumkRYIpWDLXqMuZSZ/
        huY8ufS20/cgURGpeSPme9kKWA==
X-Google-Smtp-Source: ABdhPJxlGm6rc2dunPT/tr/IfzWzjshBamNU2Qi/F2jgUz/yyiEQIT+JLijC3K3aRzy2BvP1FxejlQ==
X-Received: by 2002:a05:6638:12d3:b0:32b:7235:6a08 with SMTP id v19-20020a05663812d300b0032b72356a08mr215122jas.27.1652368240573;
        Thu, 12 May 2022 08:10:40 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id p15-20020a6b8d0f000000b0065a47e16f3fsm18217iod.17.2022.05.12.08.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 08:10:40 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc:     lkp@intel.com, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: ipa: get rid of a duplicate initialization
Date:   Thu, 12 May 2022 10:10:33 -0500
Message-Id: <20220512151033.211592-4-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512151033.211592-1-elder@linaro.org>
References: <20220512151033.211592-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In ipa_qmi_ready(), the "ipa" local variable is set when
initialized, but then set again just before it's first used.
One or the other is enough, so get rid of the first one.

References: https://lore.kernel.org/lkml/200de1bd-0f01-c334-ca18-43eed783dfac@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 530f9216a953 ("soc: qcom: ipa: AP/modem communications")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index 90f3aec55b365..ec010cf2e816a 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -125,7 +125,7 @@ static void ipa_qmi_indication(struct ipa_qmi *ipa_qmi)
  */
 static void ipa_qmi_ready(struct ipa_qmi *ipa_qmi)
 {
-	struct ipa *ipa = container_of(ipa_qmi, struct ipa, qmi);
+	struct ipa *ipa;
 	int ret;
 
 	/* We aren't ready until the modem and microcontroller are */
-- 
2.32.0


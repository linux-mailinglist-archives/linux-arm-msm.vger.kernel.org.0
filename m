Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BE06BBD5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 20:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbjCOTgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 15:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjCOTgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 15:36:02 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4A48FBF2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:36:01 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d7so17408631qtr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678908960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM6PqEpDoYuItRnCoM9ACC1yo8IO9qbwassRTpRpyUE=;
        b=x64Vi1XlTqVBMESG/QoSugcbctTPG3L0iaMw3eAXEezzHsQT6myX/M05MGMEhXFgt6
         dM6sojav9dd2uglGN2BTX3Lr5zq4T0KVhePWJWOal1i1MtG0TBkrN+x6ayLTaCallH2P
         Atv96GM4sb+gsb5YIg/2Zu/7rRj5oDzieQRwSQNjZkOdFnNTEUPpAI++lPFt0yly/Ck0
         KG89V7e1lktkRMSo2DOpIXZZhkd6CX058zbaHwJbXUSg3webymtZF9YaStO/pzw1nFT4
         rNgJbzMPz6lyJ4IrvuwnGLbmsyCglkvurx5hEZthJEcy59sTQR7nLmj1qn8Tel8ZGBfy
         RvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678908960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM6PqEpDoYuItRnCoM9ACC1yo8IO9qbwassRTpRpyUE=;
        b=OmOu+AuRtpL3i9ZcOBy95vg7I0fCwOCVWTKFo7EWt0IlmGUzN9iq+GjhGiFV4xsruX
         yZYqqgzc4xBD6IGa7secoXqHYhhHpeU9+r4ZFFyUCPAFOlZylQyAbVDbl1hkdEwIzhb2
         tuzBYOmFBinS2yhhbvafS14sND8fH1Q1XK7eAjqOSO909vbHpMqiYinFLv4NTcx6UX4J
         o6xOvn2e8f/tEdNvSN+wr6+kmfPqhMibB8Jr1SNL9V1BwbzXf82e2Oe2pBwzc/eX/F3F
         7udzYuw3Zr0jqKuqnxbptBgWYIARxwxd1/wY1s0Ovn/1AsHqs1VGZRWhiN/pz6SxeW32
         9lgg==
X-Gm-Message-State: AO0yUKVmFDkpc+h/lcu7GDKiWjG1mQs5YIcDlGYkyyp96sPBWCuQnzB1
        ychNzDldDuBHmigjLgFltE+LNw==
X-Google-Smtp-Source: AK7set+V+XR6LUL/OKH/AUxnGqhmmizumRWjhbFW2SILS1IJRMAPhnNRyCH1P53MBYmBdFIrId725Q==
X-Received: by 2002:ac8:7dd5:0:b0:3d2:90b1:d161 with SMTP id c21-20020ac87dd5000000b003d290b1d161mr1773437qte.48.1678908960330;
        Wed, 15 Mar 2023 12:36:00 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a024900b0071eddd3bebbsm4369462qkn.81.2023.03.15.12.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:36:00 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/4] net: ipa: add two missing declarations
Date:   Wed, 15 Mar 2023 14:35:50 -0500
Message-Id: <20230315193552.1646892-3-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315193552.1646892-1-elder@linaro.org>
References: <20230315193552.1646892-1-elder@linaro.org>
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

When gsi_reg_init() got added, its declaration was added to
"gsi_reg.h" without declaring the two struct pointer types it uses.
Add these struct declarations to "gsi_reg.h".

Fixes: 3c506add35c7 ("net: ipa: introduce gsi_reg_init()")
Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: Correct the "Fixes" commit hash.

 drivers/net/ipa/gsi_reg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ipa/gsi_reg.h b/drivers/net/ipa/gsi_reg.h
index f62f0a5c653d1..48fde65fa2e8a 100644
--- a/drivers/net/ipa/gsi_reg.h
+++ b/drivers/net/ipa/gsi_reg.h
@@ -10,6 +10,10 @@
 
 #include <linux/bits.h>
 
+struct platform_device;
+
+struct gsi;
+
 /**
  * DOC: GSI Registers
  *
-- 
2.34.1


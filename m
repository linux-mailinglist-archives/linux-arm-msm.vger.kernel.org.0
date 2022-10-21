Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9262607ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiJUTNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 15:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJUTNs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 15:13:48 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B6615A8E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:13:46 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id l127so3099567iof.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjt6lwwJr+c+Of6ylCClx8YoFmO2MMnOutK8JcRmLRU=;
        b=bGVqa57u8nMCh9FP/fCjSQ5u0DVbCFa53mamal5/83aBa+kQ4NkoBJE6olw2xjl+iR
         88SryQ6n+YSObVt1oVhugpTLoql6ONsHN8dpbzuq6IKR0QnJ7VoGapzT5Dg+GUBCFUGc
         gmtNIL+EKGGpyw+bgryII70Zi0KZ3zq2Eb/HUmLmmTFfKerAva9QSrOxHZNz+Kq9nH7W
         eJ8yuXMNzoCh4d5FirqiFX/8Xd4QM9Bj8aa0FXlXStakz2/bJ6h50zSiSJ95faiwNa+A
         mMI2KXzgwpVhG4zav9XdEcFhfSt1x6A61lGgG56Xvye/5R2q0oCGW4GrpAlkV1ABJdx/
         wryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjt6lwwJr+c+Of6ylCClx8YoFmO2MMnOutK8JcRmLRU=;
        b=PxlN6S+iUXSAwbjJNe2RJpm8BU0cf+QsB9ODcx76AjcCcShWOXSPg1xJLYV90RSjkD
         90Q+r7kvdZrO1XJlFxRv2qB4U+7Mk4GNEOCkVlBiFsUnbifmPehOOMq1S4eYZQ8A6Ssm
         HCIpsBUiXe/DtVbOmxNrCE7lmw0B4xv8gOA0LeBpyuWgDJ+Clzt9W65F4BohXS+o142c
         yQMDtPHNSN5RdSCXcwS8OQIzDAd2kB6nJanAiLbsBLM/0IxaUfVEwxBR1dSK7h1ZbgQa
         KkFEGg/nof7m8MtgsHe8scR5220CmfYl0U3tTa+EL+c4/xLor32TGlcKWhmHzXo4i4Oi
         dhig==
X-Gm-Message-State: ACrzQf0kKCNUGM4tcdGW4dcxu0gT1a7DiV72VZ2U4X9Wv805odyi9htS
        O8Wev6+SvFjAJ2Y7NbrtxjJRhg==
X-Google-Smtp-Source: AMsMyM7BUmYksJr9ou+UVyvp6O//T7dgo/MKUqulI/OdMZOowW//SgEwim9zuZTl9K6T5h7qa4C25Q==
X-Received: by 2002:a05:6638:480c:b0:363:aed5:ed3c with SMTP id cp12-20020a056638480c00b00363aed5ed3cmr14275784jab.207.1666379626213;
        Fri, 21 Oct 2022 12:13:46 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id e3-20020a022103000000b00363c68aa348sm4439362jaa.72.2022.10.21.12.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:13:45 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/7] net: ipa: kill two constant symbols
Date:   Fri, 21 Oct 2022 14:13:34 -0500
Message-Id: <20221021191340.4187935-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021191340.4187935-1-elder@linaro.org>
References: <20221021191340.4187935-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The entries in each IPA routing table are divided between the modem
and the AP.  The modem always gets some number of entries located at
the base of the table; the AP gets all those that follow.

There's no reason to think the modem will use anything different
from the first entries in a routing table, so:
  - Get rid of IPA_ROUTE_MODEM_MIN (just assume it's 0)
  - Get rid of IPA_ROUTE_AP_MIN (just assume it's IPA_ROUTE_MODEM_COUNT)
And finally:
  - Open-code IPA_ROUTE_AP_COUNT and remove its definition

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_table.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
index 510ff2dc8999a..74d7082b3c5aa 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -106,12 +106,6 @@
  *                 ----------------------
  */
 
-/* Assignment of route table entries to the modem and AP */
-#define IPA_ROUTE_MODEM_MIN		0
-#define IPA_ROUTE_AP_MIN		IPA_ROUTE_MODEM_COUNT
-#define IPA_ROUTE_AP_COUNT \
-		(IPA_ROUTE_COUNT_MAX - IPA_ROUTE_MODEM_COUNT)
-
 /* Filter or route rules consist of a set of 32-bit values followed by a
  * 32-bit all-zero rule list terminator.  The "zero rule" is simply an
  * all-zero rule followed by the list terminator.
@@ -342,11 +336,11 @@ static int ipa_route_reset(struct ipa *ipa, bool modem)
 	}
 
 	if (modem) {
-		first = IPA_ROUTE_MODEM_MIN;
+		first = 0;
 		count = IPA_ROUTE_MODEM_COUNT;
 	} else {
-		first = IPA_ROUTE_AP_MIN;
-		count = IPA_ROUTE_AP_COUNT;
+		first = IPA_ROUTE_MODEM_COUNT;
+		count = IPA_ROUTE_COUNT_MAX - IPA_ROUTE_MODEM_COUNT;
 	}
 
 	ipa_table_reset_add(trans, false, first, count, IPA_MEM_V4_ROUTE);
@@ -561,8 +555,7 @@ static void ipa_filter_config(struct ipa *ipa, bool modem)
 
 static bool ipa_route_id_modem(u32 route_id)
 {
-	return route_id >= IPA_ROUTE_MODEM_MIN &&
-		route_id <= IPA_ROUTE_MODEM_MIN + IPA_ROUTE_MODEM_COUNT - 1;
+	return route_id < IPA_ROUTE_MODEM_COUNT;
 }
 
 /**
-- 
2.34.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C248B26CAB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 22:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgIPUMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 16:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgIPRdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:33:15 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6B1C061A2A;
        Wed, 16 Sep 2020 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254282;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=/uk5x5cuOd9BfLYMS8NjZsfqNf1HR3jWycgorOhho7A=;
        b=dJQ2vbyiSohEUtMLb7hckWuGm3Pu8+ISWmLsy92pMq0kVccJVSnKS2/n/jhqOzlKQ7
        p0+giaYinhJVncHhj8N8i31yqYPll2qd3/p+g/AOYfpVNTVzysO2ZoXLIbZFPxtdtqW1
        z8g8Ud1qBSBZWVjHqDRuOB1VZdnM17Mn/9qldARqdNK5bzlmWgVwfW7bh91+qixH6SZq
        rTZO7N/XI6FMSyMFtxtDzpgQ4UYi0jBBkngptl9b9tNKUXn4Ir8hUlxILrXdNsuz4bkz
        gf+kYx28IdKjJ9cDskepDOObkwajQi1+TPY2vrUldjMXBWsS0NsvT+LN6dcpursq/9Tv
        2O6w==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfozlO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 01/10] soc: qcom: rpmpd: Rename MAX_8996_RPMPD_STATE to MAX_CORNER_RPMPD_STATE
Date:   Wed, 16 Sep 2020 12:41:26 +0200
Message-Id: <20200916104135.25085-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Older SoCs like MSM8916, MSM8939, MSM8974, MSM8996, ...
use "voltage corners" instead of "voltage levels".
It seems like they all use exactly the same set of corner values,
a value from 0-6 where 6 is the maximum corner (super turbo).

In preparation to add the power domains for MSM8916, rename
MAX_8996_RPMPD_STATE to MAX_CORNER_RPMPD_STATE to make it clear
that this is the max_state to be used for all SoCs using corners.  -

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/rpmpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index f2168e4259b2..88eb458b13d0 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -35,7 +35,7 @@
 #define KEY_FLOOR_LEVEL		0x6c6676   /* vfl */
 #define KEY_LEVEL		0x6c766c76 /* vlvl */
 
-#define MAX_8996_RPMPD_STATE	6
+#define MAX_CORNER_RPMPD_STATE	6
 
 #define DEFINE_RPMPD_PAIR(_platform, _name, _active, r_type, r_key,	\
 			  r_id)						\
@@ -159,7 +159,7 @@ static struct rpmpd *msm8996_rpmpds[] = {
 static const struct rpmpd_desc msm8996_desc = {
 	.rpmpds = msm8996_rpmpds,
 	.num_pds = ARRAY_SIZE(msm8996_rpmpds),
-	.max_state = MAX_8996_RPMPD_STATE,
+	.max_state = MAX_CORNER_RPMPD_STATE,
 };
 
 /* msm8998 RPM Power domains */
-- 
2.28.0


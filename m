Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B94D65D1EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 12:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbjADL6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 06:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjADL6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 06:58:38 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CD81E7;
        Wed,  4 Jan 2023 03:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672833331;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=fxzeAoMH88pkeXICJ+qT1uXCLc9DtoA9sQqp6pHM/C8=;
    b=tU+dUuPlZe+pfQYvN48OjVOVXrEObXj0BXXkQRIQvoAtFwdyCFYnR//l+h1aOQ9qgd
    CDgRaCJn7DWpUyb3A/5sSP082UPH37sintycp2OsjtrzOfIzSlw8FZiije0Lj9aMkclC
    fgTpq56PP0686T/ns3Tb5pNSOM9vT5998rYc4GUl9UaHVOClfoqPgK7mf0iUJQfaPLUN
    WOU/5te1gYnke1z9eoIOf8mYvYZWDgTtdeZ5o9Ezipf+iw8ybvVnp2ZZTiPQxsvzZ1rZ
    CVuCS80XK0Apd+p3FXwCxs2kaf212sdJr8JIO+NBx51tRL8xPFMesXzkiIojf0RZ7+ip
    yDHQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo01
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z04BtUkzI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 4 Jan 2023 12:55:30 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] soc: qcom: socinfo: Fix soc_id order
Date:   Wed,  4 Jan 2023 12:53:45 +0100
Message-Id: <20230104115348.25046-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104115348.25046-1-stephan@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The soc_id array is mostly ordered by the numeric "msm-id" defined in
qcom,ids.h but some recent entries were added at the wrong place.

While it does not make a functional difference it does make it harder
to regenerate the entire array after adding a bunch of new IDs.

Fixes: de320c07da3d ("soc: qcom: socinfo: Add MSM8956/76 SoC IDs to the soc_id table")
Fixes: 147f6534b8ff ("soc: qcom: socinfo: Add SM8550 ID")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/socinfo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 10efdbcfdf05..7258527816b0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -257,8 +257,6 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(MSM8926) },
 	{ qcom_board_id(MSM8326) },
 	{ qcom_board_id(MSM8916) },
-	{ qcom_board_id(MSM8956) },
-	{ qcom_board_id(MSM8976) },
 	{ qcom_board_id(MSM8994) },
 	{ qcom_board_id_named(APQ8074PRO_AA, "APQ8074PRO-AA") },
 	{ qcom_board_id_named(APQ8074PRO_AB, "APQ8074PRO-AB") },
@@ -290,6 +288,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(MSM8616) },
 	{ qcom_board_id(MSM8992) },
 	{ qcom_board_id(APQ8094) },
+	{ qcom_board_id(MSM8956) },
+	{ qcom_board_id(MSM8976) },
 	{ qcom_board_id(MDM9607) },
 	{ qcom_board_id(APQ8096) },
 	{ qcom_board_id(MSM8998) },
@@ -348,7 +348,6 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ6005) },
 	{ qcom_board_id(QRB5165) },
 	{ qcom_board_id(SM8450) },
-	{ qcom_board_id(SM8550) },
 	{ qcom_board_id(SM7225) },
 	{ qcom_board_id(SA8295P) },
 	{ qcom_board_id(SA8540P) },
@@ -359,6 +358,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SC7280) },
 	{ qcom_board_id(SC7180P) },
 	{ qcom_board_id(SM6375) },
+	{ qcom_board_id(SM8550) },
 	{ qcom_board_id(QRU1000) },
 	{ qcom_board_id(QDU1000) },
 	{ qcom_board_id(QDU1010) },
-- 
2.39.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A044373181
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 22:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhEDUhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 16:37:36 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:44098 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhEDUhf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 16:37:35 -0400
Received: from localhost.localdomain (84-115-212-105.cable.dynamic.surfer.at [84.115.212.105])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 027D9C5BAA;
        Tue,  4 May 2021 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1620160598; bh=v7KS54rjbA7c8/lAm9fiEi2aczYGkzowPPL9lMfTfo0=;
        h=From:To:Cc:Subject:Date;
        b=FkylBnEvCXL5q8IDcQ+q4Jc9QoRSO4npwenCE+iIZaTo468GHhmeDS10jB1tL5Y9U
         /OlljZ7/0Ro35fDtEkpwo187gewaYVXulQQB4rNZXn2mCSG3nCh0bLcS26zPdUi3Hp
         0EZKp6DuM/LD0ehC8v+Ym19OnxXsEtQ58ZSnXvcw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add more IDs
Date:   Tue,  4 May 2021 22:36:13 +0200
Message-Id: <20210504203612.95056-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the IDs for the following families of chips: 8064, 8226, 8610, 8625Q

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/soc/qcom/socinfo.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index f6cfb79338f0..63f14a2a4ef2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -195,11 +195,30 @@ static const struct soc_id soc_id[] = {
 	{ 139, "APQ8060AB" },
 	{ 140, "MSM8260AB" },
 	{ 141, "MSM8660AB" },
+	{ 145, "MSM8626" },
+	{ 147, "MSM8610" },
+	{ 153, "APQ8064AB" },
+	{ 158, "MSM8226" },
+	{ 159, "MSM8526" },
+	{ 161, "MSM8110" },
+	{ 162, "MSM8210" },
+	{ 163, "MSM8810" },
+	{ 164, "MSM8212" },
+	{ 165, "MSM8612" },
+	{ 166, "MSM8112" },
+	{ 168, "MSM8225Q" },
+	{ 169, "MSM8625Q" },
+	{ 170, "MSM8125Q" },
+	{ 172, "APQ8064AA" },
 	{ 178, "APQ8084" },
 	{ 184, "APQ8074" },
 	{ 185, "MSM8274" },
 	{ 186, "MSM8674" },
 	{ 194, "MSM8974PRO" },
+	{ 198, "MSM8126" },
+	{ 199, "APQ8026" },
+	{ 200, "MSM8926" },
+	{ 205, "MSM8326" },
 	{ 206, "MSM8916" },
 	{ 207, "MSM8994" },
 	{ 208, "APQ8074-AA" },
@@ -213,6 +232,14 @@ static const struct soc_id soc_id[] = {
 	{ 216, "MSM8674PRO" },
 	{ 217, "MSM8974-AA" },
 	{ 218, "MSM8974-AB" },
+	{ 219, "APQ8028" },
+	{ 220, "MSM8128" },
+	{ 221, "MSM8228" },
+	{ 222, "MSM8528" },
+	{ 223, "MSM8628" },
+	{ 224, "MSM8928" },
+	{ 225, "MSM8510" },
+	{ 226, "MSM8512" },
 	{ 233, "MSM8936" },
 	{ 239, "MSM8939" },
 	{ 240, "APQ8036" },
-- 
2.31.1


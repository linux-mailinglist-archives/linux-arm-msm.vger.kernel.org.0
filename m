Return-Path: <linux-arm-msm+bounces-44081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0FA039A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C287B160467
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D0A19D8BE;
	Tue,  7 Jan 2025 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="DRMq6NmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D513B58F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237914; cv=none; b=OJU4UJjQKoMbfLBN6RzXhKQTWfrQwGoCaIzeugE/0D+K3wVBbaPpP5BpRP3siSPvT+XfY8yD8dIsxpH0pRrJZJow71uPzkUqxJe6ePA5ylQhwlvG+hITJDts0l8Lh315+D2NUqVB1MHMUYDIVk9OvDqE2ppN21J4zNPfxesQkOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237914; c=relaxed/simple;
	bh=HnNCh1Q3KlhmMeC8lNBlZ5CUCHbHo6jy1nhXGvRePvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cghxQdqiVjOQN74snMS0WqPHCGC4XVnfvgsdUUL5IVKQl8DW+0kOzG0/G455bhIViMSXQfzGixr60aSl2p2iq/6p4KASYoci3Q3fLXxKm31emkOITl2WdMbOvi7zpgT3uDijBaTW/hA8OHEC7BNnQhbHwLQaDHD1E9X8k+RXmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=DRMq6NmW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so22265589a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736237909; x=1736842709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZK/yTYx4bLOgM6eUDbsfeaqYkaot9y4hEnvLb1sHyg=;
        b=DRMq6NmW5Qf/CP/h44/s0ZiqBh89tWCimjnjkeI9j85XEmgg2PufHLnoCcJOLet3Y9
         BbX9j2i+/xMYYgVJxqBEx7DCLDgInq40ArfBDJwN51vVRBQ4DOaZVStTpTq1WFJXnMSF
         TSo4/HMH8960fjWKcvrRRD3o3fXwIYAspUkI00IlRXUefpRlQMXJv2lV+E9GRuhOqkOe
         XUGei/2QylgTqqgFB/T91/+IQcx1EerklzaChqQuNuBU3mqikZXxUrn7De5siQQjCqs1
         +EL4A4k3hORGxYoZ0fCNlBQxzVnuv/krDFB7TEhLHwctv2/xAiaN9cr9hXLmHDNQVXJL
         SUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237909; x=1736842709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZK/yTYx4bLOgM6eUDbsfeaqYkaot9y4hEnvLb1sHyg=;
        b=ZTD9wM25YYaWMDZxK+GUzArbEG4rSITK5QeRUvldu9VaKcRgUFbQXFpsyxnTuaz8bx
         2MIkD5K1KzF4W8/OaPKPNphwdYUEaj4y6sHa4lIkELCXV3EpWO+wh1AX2TNt8Vpvgm5C
         1PychPNTqYBT6Zm6ygXvKPTQy3Ae55xLZkopS5XBNDCV/SwHTQuh0UYP3HAok+zBj0oY
         Z4T03ZBwtwXd9FiAOOnP1Sty+h+HNKdC2Eu5xLX+7FThj8ARFvKFGS9mNF8QOkbhThx5
         1nfLjc7Ne1lKsQjAF3uurhC9dCaDjjP0lstaECmSyBnCSXGRTvPVSwgzrraEFKaoq2j4
         axQA==
X-Gm-Message-State: AOJu0Yy2P0LDCvazTfPXdH/cGaYSoQ8wiG9hD+qIdKm9YsNfk7DV2G9q
	8CWUpxeWEumdxFRiLrgh3AZ4Vy4jaYUFP6kcfGKOvqQlrgmcHAD9PSGa9YscflgasEgDTwwDd51
	L
X-Gm-Gg: ASbGncvpFlw8lAt2inRKwHNmMnf5qZ9PvqeEO9zpvyjtKOmQAI2OfbcEcljrkZNyCXe
	CI8ZeLHRdVSNkEBONpjvmAorO4pvr69BTIZgyuAxOb3+fjFBuYNhByXBEkMbXfIBz+cP4KvkPZv
	ZJ+GER2XQQgeogAx+Yn657SoQyqlhm2x6Xhbw7q13v6gC7xsgMx8he01/FdMWskeqeTAnTcbkDb
	oiOa2XzoG+TBYJkyps4JXUgt+9EKMeAWwXxTSYRmhKGhKeo4yoVnrlLwwdjEnqHn0f3AGbYaA9W
	lQsNMw7qgwqZPEIUKjj0uHWgSUlirSY04ce0H39R1Yk=
X-Google-Smtp-Source: AGHT+IE6nYaq+2Pc2AmvMPydzhnAp6cGlAbDnWzylaRTixQOTxjzjQteOGDfHRjoPoPgeKv89CF9EA==
X-Received: by 2002:a17:90a:f94d:b0:2ea:4a6b:79d1 with SMTP id 98e67ed59e1d1-2f452e149bbmr89385834a91.11.1736237909642;
        Tue, 07 Jan 2025 00:18:29 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5035sm304635065ad.180.2025.01.07.00.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:18:29 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rpmsg: qcom_smd: Fix an OF node leak inqcom_smd_register_edge()
Date: Tue,  7 Jan 2025 17:18:23 +0900
Message-Id: <20250107081823.1682549-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smd_register_edge() leaks an OF node reference when
qcom_smd_create_chrdev() fails, since qcom_smd_parse_edge() sets
of_node_get(node) to edge->of_node. Add of_node_put() calls to the error
path of qcom_smd_register_edge() and qcom_smd_unregister_edge().

This was found by an experimental verifier that I am developing. Due to
the lack of actual devices, no runtime test was able to be performed.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rpmsg/qcom_smd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40d386809d6b..6982015b218d 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1509,13 +1509,15 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 	ret = qcom_smd_create_chrdev(edge);
 	if (ret) {
 		dev_err(&edge->dev, "failed to register chrdev for edge\n");
-		goto unregister_dev;
+		goto put_node;
 	}
 
 	schedule_work(&edge->scan_work);
 
 	return edge;
 
+put_node:
+	of_node_put(node);
 unregister_dev:
 	if (!IS_ERR_OR_NULL(edge->mbox_chan))
 		mbox_free_channel(edge->mbox_chan);
@@ -1548,6 +1550,7 @@ void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 	if (ret)
 		dev_warn(&edge->dev, "can't remove smd device: %d\n", ret);
 
+	of_node_put(edge->of_node);
 	mbox_free_channel(edge->mbox_chan);
 	device_unregister(&edge->dev);
 }
-- 
2.34.1



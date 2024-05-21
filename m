Return-Path: <linux-arm-msm+bounces-20151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887A8CB407
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C76C31F23591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED20148857;
	Tue, 21 May 2024 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWoUZi6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE13142916;
	Tue, 21 May 2024 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318394; cv=none; b=KfazDQeYlZOF+9SA3fTewq9EeFIGwloMH6LWkUqM4yDRpO64EULS5qVrKpXhL5/OE4zxyl7m1oGnU0LLIxWhBZJalAiQeebT/zcLa2eXzVHzHmnmBYYyr0NwvEC6R24KPsP1UWnB2HB5t+MSz2sPjVr6jlWWk6zA+hQTTuKsyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318394; c=relaxed/simple;
	bh=jf3PoTCYyoGQlltkoN5drs/N/MbZHqPObDflP8b6Ij4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ESHMlzM7dxrx6GxlsQPkq2iZenVkE+xwg2F1D7yUrffkquWys6ifu7/gapcLsuKgKEKz1UuZoXyDouugKsS2avJ/3M33uKMwnqXBScfcqYG9yxwwh5PRhEeeKUwiFloIHTunePakA0LR5N4oGtIjlInuolHHFzgDPdMCygiVuKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWoUZi6L; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b432be5cc9so652824a91.3;
        Tue, 21 May 2024 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716318392; x=1716923192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCi2tgKaPoizRmS2HCm41p2WvP6QyyrMLgfX9gf4Sao=;
        b=VWoUZi6L6e6Mkx3aSJ+rQUx7g6lOr+AshA7ABLT0ykZidVXPZgDRcT003h/5z5437e
         0Xgdwfy/zk/Mv9AaFE0juK9saNBj75Sd4nkyz7NQWmfRlDf9J1cMQhDRf1KOeUG54Xqc
         8soCLcLN6f6JNZv1pFUP8auhEV89yFplfq0106Wq+4JtrepDaVZusevh4W1zZuCoxqiw
         XgX+jALqu/bC29baGjgxnMu9dBDGcKihNj2oRjvp4rrzG2Epx484DwAPJLd8XG/EOvqs
         Yv2Gqxk4+cYmQ7V1HW+gf/D7zIEB2B1AGmJuDxAdxRs6B2F8VxCeVmFlsjQlOFZJUvi4
         ln9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318392; x=1716923192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCi2tgKaPoizRmS2HCm41p2WvP6QyyrMLgfX9gf4Sao=;
        b=HLL4Q5Pc/aTyOHEvEQjoIcIEXCqmvLfhpd2RZDf4JDlf+rI8/jIAZ16ZMaLBSA/tuY
         YxwOZ5MUNVol2fI3fvdrPAQ70N2sCGBpUXnpiahT8pH1+5lwQQgsT79rff1q4Ym3nJmL
         zQRUG/VJjcXJpiC1eSMP8pKpj8PGZBN8zDCZEy9ZGCRKkfoT58W3SUqUtajsLX9n9i4S
         gzd8DrGp5B521rqHldgd5+7W59Gz4gPExM6yXinfeArKFoJbMyGKascuBVLQIIWytMdy
         nnxoUMKFbBGvmk73gtIHqZ49JgviOEpQNBfAIveJizdB4prI2LPcCBFkZtWgn+QdWPEA
         Pm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVn8IHDGZZN4ItKJEGLoUaSk+y9OzTLMAIX6tmHOYgN+6cTfMJxx/7RBx/sd9Te4XFzJgQ2/QHRSBDJZtZmRtF3gB8/qodhos6xEcd
X-Gm-Message-State: AOJu0Yw9znZUNO1qvHrwglJSFJUuNWWlaRixi7SOmf5hwdtroxZdh6+4
	ucB2Y+5VSMaqNqSaM+MqhItcw50/EWMEHwGrUyuofJ7Ry5S9xn2b
X-Google-Smtp-Source: AGHT+IEYGFDa0EL7fznkIwua/pLhml67HOs1OCiKfl5rty5U01lfBd3pLOVVWeBS2HgqE1CYrR0Dfg==
X-Received: by 2002:a17:90b:1485:b0:2bd:92da:23a0 with SMTP id 98e67ed59e1d1-2bd9f460769mr28984a91.25.1716318391936;
        Tue, 21 May 2024 12:06:31 -0700 (PDT)
Received: from localhost.localdomain ([27.7.152.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd94c3d18csm1495277a91.49.2024.05.21.12.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 12:06:31 -0700 (PDT)
From: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	javier.carrasco@wolfvision.net,
	skhan@linuxfoundation.org,
	Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
Subject: [PATCH next RESEND] drivers: soc: qcom: Auto cleanup using __free()
Date: Wed, 22 May 2024 00:36:24 +0530
Message-Id: <20240521190624.1087210-1-pvkumar5749404@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use automated cleanup to replace of_node_put() in
qcom_smem_resolve_mem().

Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
---
 drivers/soc/qcom/smem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f..ad1cf8dcc6ec 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
 				 struct smem_region *region)
 {
 	struct device *dev = smem->dev;
-	struct device_node *np;
 	struct resource r;
 	int ret;
+	struct device_node *np __free(device_node) = of_parse_phandle(dev->of_node, name, 0);
 
-	np = of_parse_phandle(dev->of_node, name, 0);
 	if (!np) {
 		dev_err(dev, "No %s specified\n", name);
 		return -EINVAL;
 	}
 
 	ret = of_address_to_resource(np, 0, &r);
-	of_node_put(np);
 	if (ret)
 		return ret;
 
-- 
2.34.1



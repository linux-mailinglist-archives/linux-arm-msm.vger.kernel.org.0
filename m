Return-Path: <linux-arm-msm+bounces-42246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC609F2158
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 23:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D8AE166002
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 22:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95C29CEF;
	Sat, 14 Dec 2024 22:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YgOz3rFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F41AF0A1
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734216732; cv=none; b=oc5WH1iyXhr/JSDR6fpX0qWucM+NzvlAq4VFxU6h42W8EiXCFCle45AnW2blBHYSaDs+RMWsL5GNZ2gHP+XXPIBgX5UyHSKyHOCoK2sp73+rCUCSPLY8d9qDMUTwI3kT11MhY+S+WTNwlX9nGy/4sR70qjMs0kSIQmowzGeLpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734216732; c=relaxed/simple;
	bh=/D/vj4XanEKHzbb5zMRfqXPQ8+ADXufv99FkOEAVtx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rzxjFdLxgxGwAM/qQIXhSaOBsMV6OrYTmUWZln+on6sXH9RCMh8WXYfqlK5SlxbT1BEQXdEfOl9EeQWF7wOZTImAzhSbOlbG3pIpOKdpSLhSKyvsX3dhRtsyzTzoPRlj9xg0c+q2iTeRC/kp+4IfzT5WCGNy5713XZva8wRV/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YgOz3rFe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso12396905e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 14:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734216729; x=1734821529; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L02UQRlh3qmNnFOiOhKbVlklLsrwrslECaPK4JYFGvM=;
        b=YgOz3rFe3Ln/pzB3VB3sP/waS0avRJUBhaioFDi3yAx90A5X28+7zg+kio8YJqx+nH
         QvckLiKIehS/fSBmhQgvFa8q2pn/D8+WdWb6ONMjd6rFX34tilaqIgrCe1qSXfqHkQg4
         hdblp9ebFL/3kW21d8u+yLBReop0yKVqbsD5rIhBeJh6XAv1gL5G8Ae3QlVyoh4H83gh
         78HpHpVZJi7hJxx5g4pGEuF8/E4qAtnTzZkXjvcwjLHURL4dSdsneInPIUZqjsmiCCYd
         9sq4+KUQ2p4vGvQymsZ6QSsppaovvvqt+Bi/UCBtRw0d2uk3/yFI4SN5L0Lt0chH32fq
         nH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734216729; x=1734821529;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L02UQRlh3qmNnFOiOhKbVlklLsrwrslECaPK4JYFGvM=;
        b=l85RKIejKjvO/CHh7UwvbQUjOtF0U2LUlm0f4+4zsbmdIiKp9gR0127qsaMFRR3I/T
         C315gsgagGKgxJhlHX1R3ZS2hrTDUzmffZsFhqkirPJ4bPRE+8wDkHopOccWaw0bpWIl
         PUWHOj3wiEFUYHh48TOFfUyrp4B7hxMbbV6u/Fnqf4FwGVtQJrPVUPxPwgHH2y4sVlQc
         jyXAC/UF4bImXoRQQbgK1XAYKZoXYzksMVx3UirD+CV0QgEjI1eSe84qH8XJnq+tkIjl
         hU4WQ5BiMQEtBOuqqsSil5Pk2rB14Gj3FUV5lsPMJ0p0qjKukK10qaTZL1cfNPzGi4oe
         NvIg==
X-Forwarded-Encrypted: i=1; AJvYcCXK8RRLfbSY5xvEgUWQVWG8XY/z2ZD2JN5z3zIiEDvKnwpyQv5HKGSWYzTwjS0vUtsT1rYs34IkA+2tKorc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsns9ItyoMmrnImnk6Af3EB8Od58u2Qk+yeGbbRk8OzTKEZLMy
	N/j5bwV5Zev4euh1WPuVasRQ9yu9xKMpZ6hPLzCf7SOmWI4pwnXSAfFYDhX7NNrqlAt2UkmDhfq
	B
X-Gm-Gg: ASbGncuo+aJc5e93TeiYX8NC2sBfKv/RxVI6JM4Nx6sNeYlQdwt0I5qOmWLx5ydAg8k
	J68i9hPbJyHDUeNjp4PQpNpHve//zJSUtjxfhlSQgQrssOasc9znFd7HwrU0w0Fn8eYnLyuQl+k
	IsMQHqznANJhYilqenrVN4JZanPmHYwo60thlMZk3FkC8A6m4tBqKKR1wQ39n/bNh1uN9T7d5SS
	gucaKnEZme5NN6H3Ays9FQ/4oz/6tcupWZHoj56+xU+Wpfb8pohL9m4DF0xU2kRAg==
X-Google-Smtp-Source: AGHT+IG7fJzmsRfOAoWZ0xtBW1irRd+OIJaddSdUEg+7EScA+wo3w5PtT+D0S/aXRhqHYmUjFI8g4w==
X-Received: by 2002:a05:600c:b9b:b0:434:fdf3:2c26 with SMTP id 5b1f17b1804b1-4362aa6805bmr62263685e9.19.1734216729211;
        Sat, 14 Dec 2024 14:52:09 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c457sm92719445e9.15.2024.12.14.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:52:08 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 14 Dec 2024 22:52:07 +0000
Subject: [PATCH] Revert "media: qcom: camss: Restructure
 camss_link_entities"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-b4-linux-next-revert-link-freq-v1-1-5e970d05dfcd@linaro.org>
X-B4-Tracking: v=1; b=H4sIABYMXmcC/x2N0QrCMAxFf2XkeYE2Rgr+iuxh1VSDUjXtRmHs3
 60+ngvnng2KmEqB07CByapFX7mDHwe43Od8E9RrZyBH7MkzRsan5qVhllaxK2L1tzwwmXww8By
 PiVI4OIJ+8jZJ2v6B87TvX2Lfg6lwAAAA
X-Change-ID: 20241214-b4-linux-next-revert-link-freq-74ab5f2f7302
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.

This commit has a basic flaw in that it relies on camss->res->csid_num as a
control to index the array camss->vfe[i].

Testing on a platform where csid_num > vfe_num showed this bug up.

camss->vfe should only be indexed by camss->res->vfe_num. Since this commit
is meant to make the code be more readable reverting will simply restore
the previous correct bounds checking.

We can make another pass at making camss_link_entities look prettier but,
for now we should zap the bug introduced.

Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure camss_link_entities")
---
Testing this commit out as I was adding in more CSID devices to my working
x1e tree I noticed a NULL pointer dereference in camss_link_entities.

Investigating I discovered the following indexing error:

> +    for (i = 0; i < camss->res->csid_num; i++) {
> +        if (camss->ispif)
> +            line_num = camss->ispif->line_num;
> +        else
> +            line_num = camss->vfe[i].res->line_num;

This statement is incorrect, you are indexing vfe[] with a control derived
from csid_num.

Below is the statement removed.

> -        for (i = 0; i < camss->res->csid_num; i++)
> -            for (k = 0; k < camss->res->vfe_num; k++)
> -                for (j = 0; j < camss->vfe[k].res->line_num; j++) {

As soon as csid_num > ARRAY_SIZE(vfe) the code breaks.

The commit is in linux-next but not yet in linux-stable so I'm not quite
sure what to do with a Fixes: tag nothing I think.

In any case we should revert this one before it hits stable.

Link: https://lore.kernel.org/linux-arm-msm/1a570c17-c501-4a29-a4f7-020f41563f3d@linaro.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 155 ++++++++++--------------------
 1 file changed, 52 insertions(+), 103 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 004a74f6b2f6ce7eef15765ad1eadc14a08a3908..a85e9df0f301a933d7e47e07b9fec535819aeb14 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2298,6 +2298,7 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
+ * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -2315,64 +2316,14 @@ inline void camss_link_err(struct camss *camss,
 }
 
 /*
- * camss_link_entities_csid - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities_csid(struct camss *camss)
-{
-	struct media_entity *src_entity;
-	struct media_entity *sink_entity;
-	int ret, line_num;
-	u16 sink_pad;
-	u16 src_pad;
-	int i, j;
-
-	for (i = 0; i < camss->res->csid_num; i++) {
-		if (camss->ispif)
-			line_num = camss->ispif->line_num;
-		else
-			line_num = camss->vfe[i].res->line_num;
-
-		src_entity = &camss->csid[i].subdev.entity;
-		for (j = 0; j < line_num; j++) {
-			if (camss->ispif) {
-				sink_entity = &camss->ispif->line[j].subdev.entity;
-				src_pad = MSM_CSID_PAD_SRC;
-				sink_pad = MSM_ISPIF_PAD_SINK;
-			} else {
-				sink_entity = &camss->vfe[i].line[j].subdev.entity;
-				src_pad = MSM_CSID_PAD_FIRST_SRC + j;
-				sink_pad = MSM_VFE_PAD_SINK;
-			}
-
-			ret = media_create_pad_link(src_entity,
-						    src_pad,
-						    sink_entity,
-						    sink_pad,
-						    0);
-			if (ret < 0) {
-				camss_link_err(camss, src_entity->name,
-					       sink_entity->name,
-					       ret);
-				return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
-/*
- * camss_link_entities_csiphy - Register subdev nodes and create links
+ * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_link_entities_csiphy(struct camss *camss)
+static int camss_link_entities(struct camss *camss)
 {
-	int i, j;
+	int i, j, k;
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
@@ -2392,68 +2343,66 @@ static int camss_link_entities_csiphy(struct camss *camss)
 		}
 	}
 
-	return 0;
-}
-
-/*
- * camss_link_entities_ispif - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities_ispif(struct camss *camss)
-{
-	int i, j, k;
-	int ret;
-
-	for (i = 0; i < camss->ispif->line_num; i++) {
-		for (k = 0; k < camss->res->vfe_num; k++) {
-			for (j = 0; j < camss->vfe[k].res->line_num; j++) {
-				struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
-				struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
-
-				ret = media_create_pad_link(&ispif->entity,
-							    MSM_ISPIF_PAD_SRC,
-							    &vfe->entity,
-							    MSM_VFE_PAD_SINK,
+	if (camss->ispif) {
+		for (i = 0; i < camss->res->csid_num; i++) {
+			for (j = 0; j < camss->ispif->line_num; j++) {
+				ret = media_create_pad_link(&camss->csid[i].subdev.entity,
+							    MSM_CSID_PAD_SRC,
+							    &camss->ispif->line[j].subdev.entity,
+							    MSM_ISPIF_PAD_SINK,
 							    0);
 				if (ret < 0) {
-					camss_link_err(camss, ispif->entity.name,
-						       vfe->entity.name,
+					camss_link_err(camss,
+						       camss->csid[i].subdev.entity.name,
+						       camss->ispif->line[j].subdev.entity.name,
 						       ret);
 					return ret;
 				}
 			}
 		}
+
+		for (i = 0; i < camss->ispif->line_num; i++)
+			for (k = 0; k < camss->res->vfe_num; k++)
+				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
+					struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
+					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
+
+					ret = media_create_pad_link(&ispif->entity,
+								    MSM_ISPIF_PAD_SRC,
+								    &vfe->entity,
+								    MSM_VFE_PAD_SINK,
+								    0);
+					if (ret < 0) {
+						camss_link_err(camss, ispif->entity.name,
+							       vfe->entity.name,
+							       ret);
+						return ret;
+					}
+				}
+	} else {
+		for (i = 0; i < camss->res->csid_num; i++)
+			for (k = 0; k < camss->res->vfe_num; k++)
+				for (j = 0; j < camss->vfe[k].res->line_num; j++) {
+					struct v4l2_subdev *csid = &camss->csid[i].subdev;
+					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
+
+					ret = media_create_pad_link(&csid->entity,
+								    MSM_CSID_PAD_FIRST_SRC + j,
+								    &vfe->entity,
+								    MSM_VFE_PAD_SINK,
+								    0);
+					if (ret < 0) {
+						camss_link_err(camss, csid->entity.name,
+							       vfe->entity.name,
+							       ret);
+						return ret;
+					}
+				}
 	}
 
 	return 0;
 }
 
-/*
- * camss_link_entities - Register subdev nodes and create links
- * @camss: CAMSS device
- *
- * Return 0 on success or a negative error code on failure
- */
-static int camss_link_entities(struct camss *camss)
-{
-	int ret;
-
-	ret = camss_link_entities_csiphy(camss);
-	if (ret < 0)
-		return ret;
-
-	ret = camss_link_entities_csid(camss);
-	if (ret < 0)
-		return ret;
-
-	if (camss->ispif)
-		ret = camss_link_entities_ispif(camss);
-
-	return ret;
-}
-
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device

---
base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
change-id: 20241214-b4-linux-next-revert-link-freq-74ab5f2f7302

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>



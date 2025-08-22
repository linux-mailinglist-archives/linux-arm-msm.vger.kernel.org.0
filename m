Return-Path: <linux-arm-msm+bounces-70345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F10B314A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2779616D053
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4036929DB6E;
	Fri, 22 Aug 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXbmBnsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914892D7DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755856856; cv=none; b=JwpeJ9/Nf91Ks6uSNgRFj1voAO/iCyZwdc0I5cfn8UWgmbLOLfp7x8SBpl9tz7GBr01JnKux2FgZ5kaDos0VJrFKtNTRsW6bThD2EjG3QIE6TwFjUnJbx1l4tnaVoDuWzcHG9MQXjOgm3duq09Viy9+OjEjtYe5D6wjRLIJO2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755856856; c=relaxed/simple;
	bh=pEetoVTDodelXBwJrt38dostCVJshVjnFzOU+XhTBjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTAKcuWcGRxoPoHHJ3lZb5eJmR6xKbNFMVnTr7vv3jJQ3KX4vYyrfHOjl+8A0fHMjbtbtTFQme9QOODq67NPJe7PT4RbmkyFNy51iD2pqMcF/H5rqAtpvxIKD8CKUw918CEXBWVN+Njrz4dCOuCAjAZvoxt20/shRQlcXNzacIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXbmBnsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UZDJ011707
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=seU5VyNwZ7P
	hzDSFhbvRs6XB3sWasRwy3GspI+Jm/Rs=; b=XXbmBnsfM/h5W2KrZFVAzKUJTZt
	Z1HMKDfhL73N9zmko0vHj4DE1/2uIFzyajQNaY7RJkexgDqKZEdsFUKTPKuhvwl3
	1/AEhJmtWvegV9k/5+aZGMENqlhZpy64KRB5DMW6ND7hZCogtvVl970NuOht1oy0
	v1qAfTosPJv0JFEkiEZjiEyUTJ+bY4CFgCktnLoq3f3xslGRIycWxok31ThipGaT
	8fpvK/MzZ71t6SxePnGQM2FnTISo0FEg9zpdoQfPBEQB+a3rlqLucSmi/oHagUuN
	LoFkWa3gdUAr2IN0NdPOcK5R7zQ6YWl2zHo1H2iE6frDXdvioiw738goV1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8em7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:00:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bc103bso46292221cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755856852; x=1756461652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seU5VyNwZ7PhzDSFhbvRs6XB3sWasRwy3GspI+Jm/Rs=;
        b=RrkwohWc7IF7ttlayg7jCyM+IIpwHSlW4Ix4lHUFjpWo18n4a+WAe33B9SsKleI9bF
         pQXt27ac9/HKOkQL0Zq5OjiqyT1Zhfav7oCZ9HyyodNL0b+fgV1y6PXEn95pDWBUuTmA
         PZGmqgS9OgqIx1KurLVrfSkYDCrrYo9z8/P421601DecS/5rAQTc7/UCVcsBM3ocnPt6
         uzP58tSA2f+q/TEhwX5IHiPyw0nb7QtndKxvfVQ4smyBQR4U36bDSLiAQ0hvxv4R+nYJ
         bCvy59C+RhDLQSW7Ien/1RGIafBAqKYSYB3okjqy0Oq9vo0awf0yTGzrRtnGXANtrvhS
         IJCw==
X-Forwarded-Encrypted: i=1; AJvYcCWgZbBQNDbqenUMuGxKcQ9O5UYh2wCBi6gXJyfkWHEwyqOtipu3OYqBfWy/SuJM/4nV/gtVHMvU+0V4GCLw@vger.kernel.org
X-Gm-Message-State: AOJu0YxkUt6nqKQxiUi0JCN5oxz23wzjNnx8gddvGSxnXsbVvQlZxZ/h
	OY6HWQBUykmlfTnujtSFlMS+GJkEupj5ofbqvanG0kLUX7hA3HdJGKkMvDh9LzUtMrGfWy+Atny
	hLYyNxGImwALXfFq/bmhlqbqZTQt6KlcryzoJv+d4sXENC/Gy6ebkraFM6v+TfnD8WRc5helwNj
	i2
X-Gm-Gg: ASbGncvxNJNoC6cxzHQjafKomANUBKNvxgGMsiWDYctYImna7QPq6csBuXOGEcUFloc
	BXtTfelmZ0UiwLxBkD9O8ThPXJ8bo+J2+ATQ4h3Tu1etM6gMX3LxtKZDi9gtXCutcGXFd/I9+2y
	G1dCIXcP4B+vWvN/lWo9W0vx3I9KPo+rV9QpT54BpawEZHSYimSEg4cPGK2j9sM3btKoTA5Ktv6
	U8G4ywv2sdlU/aJzzqG/aPMWhCkG0IL3EsB2rkzUNKSYBIuc3gsifZga+Xncn3jIRusbGw0w86k
	PqTtKGrWk3+eZsz3v8JJrIYfyIGfVf7k8pNw/MHoQEaMB4f/JS//Mw==
X-Received: by 2002:a05:622a:1cc9:b0:4b2:94a7:217b with SMTP id d75a77b69052e-4b2aaa599d7mr28342411cf.37.1755856852092;
        Fri, 22 Aug 2025 03:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTI6SJSLk1AF3i7MxH2gUf6ex3W/Wf5mKpRmzSeB4ddoFBiT2mWoh4+lF7VcoIx6vuIho8PA==
X-Received: by 2002:a05:622a:1cc9:b0:4b2:94a7:217b with SMTP id d75a77b69052e-4b2aaa599d7mr28341801cf.37.1755856851491;
        Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797a1sm14184608f8f.5.2025.08.22.03.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:00:51 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org, srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] rpmsg: glink_native: remove duplicate code for rpmsg device remove
Date: Fri, 22 Aug 2025 11:00:43 +0100
Message-ID: <20250822100043.2604794-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822100043.2604794-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX0DxshPJ60WrQ
 DRJYIDKFJsMh1tssHvNhj3TLczm0fDVGYGaj6BR+bE6mY/uchVU1PrALZMI0er14VdpMkNLSSdM
 YRvckDi3ZtDWHkYc72RJSNeRNuOwKcegYYPiEtBHKmnsNTIHxQN/HBAU9Pgb1sAD5mxHeVSEb+b
 YVtbCfD9/o5mroxXZG2k6KE0UAuxX8H42MdmgBbkVYpcYLx1WJtpojy/kqWUubOvLsUE1iujvoz
 lWvk6UxXYI1dx4DyRbEwf2tZ2O3fpSvjXr7EaR+pIYaR+IHQjJvykOLjRu8ZtegKk6Py4Eobszt
 UxcTyQ6DsBJOEY3XW3lMmDpB1ObXACzTqTLUt8D1ee3kneg3A3FzCLkOXGutvo6/t4Gjvyx/Vys
 GhzeFyZq2IYf9meFFSaVHK0Q4SbWaA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a83fd5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=9_ireLxDWfKNmGTEU-MA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3Xkp4k8mXl_9irg3XWXeWatXbxuVwQbE
X-Proofpoint-ORIG-GUID: 3Xkp4k8mXl_9irg3XWXeWatXbxuVwQbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

rpmsg device remove code is duplicated in at-least 2-3 places, add a
helper function to remove this duplicated code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 43 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 3a15d9d10808..5ea096acc858 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1395,11 +1395,23 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	return 0;
 }
 
+static void qcom_glink_remove_rpmsg_device(struct qcom_glink *glink, struct glink_channel *channel)
+{
+	struct rpmsg_channel_info chinfo;
+
+	if (channel->rpdev) {
+		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
+		chinfo.src = RPMSG_ADDR_ANY;
+		chinfo.dst = RPMSG_ADDR_ANY;
+		rpmsg_unregister_device(glink->dev, &chinfo);
+	}
+	channel->rpdev = NULL;
+}
+
 static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
 	struct qcom_glink *glink = channel->glink;
-	struct rpmsg_channel_info chinfo;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
@@ -1407,14 +1419,7 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
-	if (channel->rpdev) {
-		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	qcom_glink_send_close_req(glink, channel);
 }
@@ -1705,7 +1710,6 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 
 static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 {
-	struct rpmsg_channel_info chinfo;
 	struct glink_channel *channel;
 	unsigned long flags;
 
@@ -1721,14 +1725,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 	/* cancel pending rx_done work */
 	cancel_work_sync(&channel->intent_work);
 
-	if (channel->rpdev) {
-		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	qcom_glink_send_close_ack(glink, channel);
 
@@ -1742,7 +1739,6 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 
 static void qcom_glink_rx_close_ack(struct qcom_glink *glink, unsigned int lcid)
 {
-	struct rpmsg_channel_info chinfo;
 	struct glink_channel *channel;
 	unsigned long flags;
 
@@ -1764,14 +1760,7 @@ static void qcom_glink_rx_close_ack(struct qcom_glink *glink, unsigned int lcid)
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
 	/* Decouple the potential rpdev from the channel */
-	if (channel->rpdev) {
-		strscpy(chinfo.name, channel->name, sizeof(chinfo.name));
-		chinfo.src = RPMSG_ADDR_ANY;
-		chinfo.dst = RPMSG_ADDR_ANY;
-
-		rpmsg_unregister_device(glink->dev, &chinfo);
-	}
-	channel->rpdev = NULL;
+	qcom_glink_remove_rpmsg_device(glink, channel);
 
 	kref_put(&channel->refcount, qcom_glink_channel_release);
 }
-- 
2.50.0



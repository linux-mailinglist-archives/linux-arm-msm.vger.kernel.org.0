Return-Path: <linux-arm-msm+bounces-35317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274239A97B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46C451C217C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 04:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB81B126BE0;
	Tue, 22 Oct 2024 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEi3ogLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022F54FAD
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570646; cv=none; b=nFcGQdp1BPAz4FSK1+6AKrs+L8DpHvWKEbXC0ZfNUK4SKP8sz5GIFAJzC5vkhD/SJ4hytfJG7UOLgbdsJ4agJGZH0uEi/KCUYAiOed3IobClZamlfnmnD4VPY6oQEGGAcgqv3M+gz8RkP594j6HFSBSILYavRZnJX6u9Abnh77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570646; c=relaxed/simple;
	bh=/58otU+mAPd8jrtLUJ/LEJCMOq0Y8R9ln/E00PBpe04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nm3ghrVkVFsBNZczZSQfVg2o10/L8Ai2P5VtAr20K8Dummva1X0CNOicI7CcsNBWVUESJY0PkBlkYEB8ipkDP3+D/KjbnZjxzGPjm+D3on2D2kUvXmqf8xqbQG+/1Yfp9WIBDZqoZFAoLFHpia/Tb4k7KUFOpdCRBnMcz4tv4ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEi3ogLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJaUGv001162
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xKskZvo1JH0YHB5j6L+rhDgLQp1E+PifEVPToIxcdA=; b=EEi3ogLgfHlwN63T
	VT9zPpmvs/eMMScMDC1s6w7FZbw7TjuaxyCv6Hs+9h6M5W94fJQQKEVEsV5YkeoM
	5Ku7HTj+ysjru28cDGzDaltVe38MXi70JKeoY9uYofwacqJqyTR8FgmjhkusvmCo
	vqjiIfDaLQYS5k5DiBHBdSrfv+yuE3xrjl03UiVBLVzxmvwdlN40iHZfx7HwZLaa
	SDdAvu93MEF81/yA+sLbGLK2iJHqYeqmF2QITvBnXvNXyZzmXQzEfC0qLBavsAl1
	xaUi9+ocIaPmY9+sUXTiwIJ7rKH7LSEhPPd114rZ8xGxeGI+dxBnT0BORRZ9/d35
	qq/nzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmj12t30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:17:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-71e5a1eefeeso4428725b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729570637; x=1730175437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xKskZvo1JH0YHB5j6L+rhDgLQp1E+PifEVPToIxcdA=;
        b=o9yxdx0iIImgcYMvNQoKtw8EfherFpclgatIMj+kmwmcI4DgEW2miwIzy/L67aOwUK
         RpwD53Fr1NhYsd4tLiPLpNnoCwO7Uyd9HZ7L9Z7wlQgOvxIUlga3y2IM+/P2FF36rlno
         u0oCbdlXeuWjKWh1s2724Nwa1b57qRdpdxEGW9GYjuGOSr7RVXD3PndQEShHR99W/ErJ
         g2BD71G+Sbz/OqQIcdo/luS3fsaeJfRbzbOoOvP4AMBc7POUAvXKw5KYRzPgX9f2VYLW
         b9AcnCWJ45SLzd6cG0S0Z9n1QooTxCt+mdn1wacvgJTTIoTu5ubLQnUjTkpFxIKHk3rZ
         YpEA==
X-Gm-Message-State: AOJu0Yxzvto5FiUw1D52ai+YvDG/4ciMnNVYaWPXe4PThULUk1+sFHFB
	mekVBXzKorSUjguDlh6MmkjAI18oAw2cmeNU3tUDjzYAdaEzG9Gsz7WGbPB2j+zGxbIBwwrL2Vz
	d2PWLsgr7wCdumvx6hTZVYYeAb99pBRm3f9rUMKnMcwEOsc9INn10gijYZzzinsjg
X-Received: by 2002:a05:6a21:78d:b0:1d9:9b2:8c2a with SMTP id adf61e73a8af0-1d92c56dd3dmr17885242637.34.1729570636731;
        Mon, 21 Oct 2024 21:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78YH2hf1L82uustEvCpYYzLIPYCc25WObHjaFYC7/91IoiTJYQGN3QBS8OiZQL2iTOE4O9A==
X-Received: by 2002:a05:6a21:78d:b0:1d9:9b2:8c2a with SMTP id adf61e73a8af0-1d92c56dd3dmr17885224637.34.1729570636406;
        Mon, 21 Oct 2024 21:17:16 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb6dsm4836169a91.1.2024.10.21.21.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 21:17:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 22 Oct 2024 04:17:12 +0000
Subject: [PATCH 2/2] soc: qcom: pmic_glink: Handle GLINK intent allocation
 rejections
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-pmic-glink-ecancelled-v1-2-9e26fc74e0a3@oss.qualcomm.com>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
In-Reply-To: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729570634; l=2629;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=/58otU+mAPd8jrtLUJ/LEJCMOq0Y8R9ln/E00PBpe04=;
 b=M6z9243vFSnt4Z0ApB6ZfscKtvvptNe5YFen5SppKT1aQOu4RImpegyQ4k25IyQz4rf6KNRxa
 /ZYKK2MuDGuBQtLSHVdzPZBR1b3v+3HaMrrStXFySAM+BSkjyplaLIP
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: LNAS10sy5DBl1Ke1Zt2SrdOXPnaNAhbK
X-Proofpoint-ORIG-GUID: LNAS10sy5DBl1Ke1Zt2SrdOXPnaNAhbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220027

Some versions of the pmic_glink firmware does not allow dynamic GLINK
intent allocations, attempting to send a message before the firmware has
allocated its receive buffers and announced these intent allocations
will fail. When this happens something like this showns up in the log:

	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
	[    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
	[    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

GLINK has been updated to distinguish between the cases where the remote
is going down (-ECANCELLED) and the intent allocation being rejected
(-EAGAIN).

Retry the send until intent buffers becomes available, or an actual
error occur.

To avoid infinitely waiting for the firmware in the event that this
misbehaves and no intents arrive, an arbitrary 10 second timeout is
used.

This patch was developed with input from Chris Lew.

Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9606222993fd78e80d776ea299cad024a0197e91..221639f3da149da1f967dbc769a97d327ffd6c63 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -13,6 +13,8 @@
 #include <linux/soc/qcom/pmic_glink.h>
 #include <linux/spinlock.h>
 
+#define PMIC_GLINK_SEND_TIMEOUT (10*HZ)
+
 enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
@@ -112,13 +114,23 @@ EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
 	struct pmic_glink *pg = client->pg;
+	unsigned long start;
+	bool timeout_reached = false;
 	int ret;
 
 	mutex_lock(&pg->state_lock);
-	if (!pg->ept)
+	if (!pg->ept) {
 		ret = -ECONNRESET;
-	else
-		ret = rpmsg_send(pg->ept, data, len);
+	} else {
+		start = jiffies;
+		do {
+			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
+			ret = rpmsg_send(pg->ept, data, len);
+		} while (ret == -EAGAIN && !timeout_reached);
+
+		if (ret == -EAGAIN && timeout_reached)
+			ret = -ETIMEDOUT;
+	}
 	mutex_unlock(&pg->state_lock);
 
 	return ret;

-- 
2.43.0



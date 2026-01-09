Return-Path: <linux-arm-msm+bounces-88161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26CD06D12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9579305EFB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897D52777F3;
	Fri,  9 Jan 2026 02:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRopE8hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sja5EaqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6C26FD97
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924751; cv=none; b=P+Np9PAsXlykjXeKO3c3u7+AWJ3zyYjfHDpak7v1xsaOquZdj77dAfs1g5HEalk8ov9Sdoi1W3g3uGHefgybxHFfbVXFKqICAAjlJafTpoTPMqLtK0CmBte2YN5W6bfpGxDyKrnX5DHnyUTgbgyANNmGBtN+Khw14+bVvFJWBKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924751; c=relaxed/simple;
	bh=BgfnQBt4eis79ePg7a9KA9sFWLA0Wf6CSKp55vnkyls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E84BiitMx8NX8ioz/aoGOm5jotE0P8EYv+zFtYcTGnZcS7BTcNh/ZoxQyebprpQOrCt2Vm0HddUQGvvnqdHwkAD/NUhRYFTLEJ0un9cXEiQ8MyIYO3LRUzh2P20KEIlq46wVBHfVYS4WkbkktDhwaT1WVavFlippqgpCKXoP1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRopE8hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sja5EaqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Npje53727434
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UNj9IldgTww
	Hcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=; b=XRopE8huQ2mmSOHitPHwYKEPGIx
	uz7XH0kJd7/L7BH95n0PlXPjHq8ARD16uLC58gAfdXrvm5nseWKm+9HwSPSRwi53
	DBwQeEs7UgL2UwngiurCUvXdXeSAtrMttDl0wmR8v/u3zA6HAnoHnRQnC/RNa4Y1
	vEM8h8ggVHS4lrzWtilo8baMZ1amESQb1AM/RdrNrzoMvTTF+mCOsWCqFJMiLyDp
	evltOXvpSwy92JX/mE1yFCPQU15wTnJ6twIQEkuAeZfW/PCq4JuWzP8J9Wqhl20m
	dS0NKMn1p+4pHHHJLPpPaZnAh5pLlxEJakS0qDuBE+4RAEoN5CwGvJx9jWg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkg9kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:12:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae6ef97ac5so10626570eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924742; x=1768529542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNj9IldgTwwHcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=;
        b=Sja5EaqAtfkb9wloTP7aBK39Rqy73AqKzaht9IGhf6m1KkB/ONIqKZEU62MFYPZ+wm
         snd67ivc+Ei+ZZj5FgRSXha+jNEu4/HfffPc1XT3c0qlU9P6GMnVgtSPY9YMjygXtGxJ
         rU7ALV1LKEkDrlShkPu8EaOCLhh6LKcpic0ZMKlULL/7pmhDpJpydqgTyKVwxKNFlWBx
         pRN+hhLPPb/iOasDo1Rkrdx4er59SWOEtt/6gjrmbD2Ai52a8iDZqkABktt+aZUOQq6O
         V8Kn3CEewKvjYaDncNknuIjwEPMU7H8RvMCL0B9HzPtdqmkDG8NsnXiTx791Pf1Akx70
         3wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924742; x=1768529542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNj9IldgTwwHcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=;
        b=TrNFy3gOXr7WTeJIuEhgG48VO0cK6f4CRIFSc+vANAwLNchsJicI9UCGO6RYmnpnMo
         IXHUook9g2qlsBmgIf6mmLHBa73V+fiCYFgR17U5/bmlmidVlGnHqtC8wbHA4YP1AJur
         CWR9BZ8MBxhDe09sLPD2lSk/Z+NVai8vp8uXLsAsBqbScV2/ToRfkhtDHrea5sogT8Ad
         VUm8PQikq3uAMNboMAF8JZ1B2EKzOMfYpvLYPq7EFS5HJTD4gaLrGZi0/BGFwe2fTlFq
         02qAHLBfy1hozFFkGE0Tm9124JqaPprrWN4sDb88Ay6WGTxSz31PfhNYSHG/kIselbsO
         /nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXidcPATyLO5nl+uGaXu2uQlILMwHe3WwKfzJQcepjulzyPhTkt0reC1SFh5KiJWF1BLNO3wzBXTbzJC3DJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwLOfJ3nAGZjzMhl76Pj+jA/CKR/J8oHxTlRi3Veq6+qBvWeGKk
	vntUzWcfuA5WT+v/+DhxzVLbGHYDw1xFDCK0n0e2odd8+Nf3buNwkcxmWi15InQKDY0uqtLCGwp
	OELuV/i6ZVLr+9FH4li98T9XtijzGZ9hQeyaDBVHDGG+o1okyXZayKSLt92q5JG0Egh0e
X-Gm-Gg: AY/fxX6jMujys6NPghdrFfv+RJ9cKh9cc4quJtCJlt/YWYpWppAaSJ5CxikMmJlTG3H
	vfDo/8CAQd5QX63pb5Dnf/i0RecU6o4AxFLTmgrvFFoZIidjEZEeWi0aFQgFvhNeOKw0eXaGNoc
	bvb5F84ROa6jj0pVs4+Ha5JDmbbsZZd5D089WPIrOKXoZTkYW7suqQxmZR9D+1suXGQtsMKLhEM
	iEeTE/Fim5Y3V1F/irOQLJjE94kupJerSmr3pAb2QDYqaI4LQhizlv0MpgT3T6qMxGL0wrcADXL
	34Lgmkt/z24l4EstzA6zUKEZKHIdyN+PmsHv3evaLChSxc9rru2Yv5vNXmVZnlF8v/wOAxak0SF
	bMngzG2/p8A1uL6EZ7yz64UJNodXfUExxMF7XctDdGqA4J69iVhODBsnMxe10PSqK
X-Received: by 2002:a05:7301:5387:b0:2b0:5c02:7516 with SMTP id 5a478bee46e88-2b17d24d19amr5467611eec.15.1767924741881;
        Thu, 08 Jan 2026 18:12:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQfTti3+ws20Sqrv0AXLPG8dqfyhqRGOTHJYP7pS9+6hYpKG5AapDxym6UcH2zDfuYgG6C+Q==
X-Received: by 2002:a05:7301:5387:b0:2b0:5c02:7516 with SMTP id 5a478bee46e88-2b17d24d19amr5467591eec.15.1767924741341;
        Thu, 08 Jan 2026 18:12:21 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:20 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 7/7] qcom-tgu: Add reset node to initialize
Date: Thu,  8 Jan 2026 18:11:41 -0800
Message-Id: <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=69606406 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: dJxkLsyT0EnroG0N2J5IhMyDkzXjXhr8
X-Proofpoint-ORIG-GUID: dJxkLsyT0EnroG0N2J5IhMyDkzXjXhr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX9xK5Mr0IBjoq
 zJ8RKPkLPaeREjGl5zntnChj9N5th1V9aX1xLAMk5iDQxPuzpCRVEtEzD84i0n3jUIeu0vC64lX
 SsBSsxoXBmnOLu5QJOqEzilB9N+RBiUhX0zWiaNhT0A5/6DfPgaBhnlRGPuJLSyWg/5UQiGDAlF
 afWCBNTqDWs2knQdRbQtRDSKUO/NBtFSIQKs4ThNxKnfzNSqvG+urH9SV5BcBPjIs9lZnDY4Ahz
 VbV9/TJJr9NeYpOxoGepVvuavGiisVWUwnySJNxTGz3A9YhSomALionwEfgz8C6GIEO+B31Yorf
 mtB+UKd7kh+HY/dFgvabiIN8SJGkdk1QRXUjxHPr9Yjd7P8znmwz5SlQTVoPtPF0Eb//Z67GNCo
 0lX8eGCCy7mVTNJbHyyvVcxM5gqZcDlkEOHlvd9LImqAF+K2tEygU7tWNMLYX+koE3nta/xnLwS
 NSaWin8FUEvhwto9shw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090012

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 61b5a08bdee1..fa2618b31ab9 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index a3d9c3c4e28a..0a45ff78858b 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -424,8 +424,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	guard(spinlock)(&drvdata->lock);
+	TGU_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	TGU_LOCK(drvdata->base);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	drvdata->enable = false;
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1



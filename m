Return-Path: <linux-arm-msm+bounces-62158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A53AE5C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B50517B2DFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAE22566E8;
	Tue, 24 Jun 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejweXddL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C422550BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745131; cv=none; b=fw5BuBWARW1OOYGZhleiSFXjVQKFVla2zvUtdund1Moc2BMxsuzEmgp+jt2H0CD4iLLwnyPDPdO3/NxwniSutMJ4XO4JnBxS+itxEq5LTUpMoHNMfajXXIzo4zgs1PDpDyzYIc++u0w8IHumrXDdb8tcrEGeqcTowJh5jPH7dyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745131; c=relaxed/simple;
	bh=gbGSvUxtrQfj4wK9v01MzbTUWNeRHpvRuORydIUDJO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sjZ+geN54LocHNnnsoRQq2ekNjAkS0v3GpWlsGT2RPNw/QteGZzsinyMIqf9puZjUgjRBEMFlLMEd08oLATKgM4AHuh0WZ2eK47SKY1+//DdCj/RUwn1UotXft7SV7sYoU6455AI0UbCc4SbyO59OuW/zS+sAK0I1/15OgoG7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejweXddL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NNxWxS017387
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ViTNhJOtGjt
	6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=; b=ejweXddLN4cdGC90vxtxRWcRdLx
	RMM4f7qzZoQeV/H0MekdTNVpiYLf5SGw91kKougV3ZclEhoJ/gBJd8a8MssJINSN
	XbnSn8Xb+eR7OmOa4JHrv8hcoZfxKo+CqkAKYc/v2IPe4FutOPFHkjtQn/fbptUT
	1GhyjgUf830Bsyvelj+dw3K5/z+fe8M7VI2drwGZS928OdUbeZZWSvvaoGVu+lAG
	H2Q4yvvKWtbaLvt9YwdsO9Wot6yTOED0mZUpS5nopIFpwpcWj+a/AoSJWj5niwsK
	1f24fhNecJ6FIOUdMLF0/jRoXlOeIpMOhb968JBO9owi1cIWXwDYlrLq6Vw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgb0e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235089528a0so38743495ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745116; x=1751349916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViTNhJOtGjt6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=;
        b=bpTxCZdjhAbMQVtd7hEMZnQId3XY4toE7W6cHaPLMtKR5RzgKM7e8ovqKOnwRy32iE
         11EVQC0LxETlyjP/C4ZDMn6kcn2rwFpRDXvZQ3TJx45lxhm3eC6UYaG2dRrwngZAMXPo
         vXeFMrgGfuTjUwWChJc4ID131/IDqPJqMf1GT93hSUmQ4HOU9Ku2RTK73hVBoMgityo3
         swFaJeJgoQep5r69+X/+YsrMqXF8BNMK9asElX0/2eGImTXzMdgxV7wkjngu45msFNVH
         Cenp2uYNWlozln/256FP1+4JLn7Kb3CD8+6rFoQKW+nodjv6umZBUD2JQSjY4C4KdjA1
         zN3w==
X-Forwarded-Encrypted: i=1; AJvYcCW0gsXgZrPg9qPc4PqetwDMl0iOlYnBXt1Gj3hpalN8hk7zlLsvEEjaX+aN7uYGsKuCulPf9WYYlKm/mrDS@vger.kernel.org
X-Gm-Message-State: AOJu0YwNdv5QAV4AA4gttstWX2gSMQCBp7YGiiyFnd1Cdd/q+GMiO5kT
	5IcLzD/0xOApgDTo3Ba05XZdnCGziy+LVrhAnSWb9W86iBk/M4MfsEpOAXcYj5gBjPCi8rQDLnV
	RjTo1jqMBBIOtmheMlrtJgE3NEFj4itxW6veVe1HfvBxa40C46Lpr8cCENRH138visbeD
X-Gm-Gg: ASbGncumzsp7dtdumrcR13TCy4wWNGHOZhyazAO1egXiFx+ZhextMtHvkXylbH6yQGO
	XTtZNC8FD9x/aA7eHuMPeCX2Ki9xfN090hs+5mC6qS2csnYmXpMHgbiKpDKsps7sqJJA5djpE6o
	lpB0lFFkSlhLV2mJhRCR8hcJ80P0vGnWsDO3epJyTeu1VbrqphSGJj73JRfPgBQpbh0AB08V/jy
	ipNISmwjTwofPOMRzfFGYXqXFqN+CdthsNN6qQ6So7heJd+5rUWdFjMm3oTkJK43MExVJspuXWN
	AcNya92agQBgLTIioc5ry5BFcZ1fBk+LjxBy3iDcUNnoagqNn52wdOdbpugMLt4iNbohR0VIZyM
	6gA==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408595ad.11.1750745115977;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWPFCk1vGIK6OC6QmCXLMh+OHz10tmlUnDaYKRcbgjljEq4H6EvG36i6gTOPY5fL0FezOsw==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408275ad.11.1750745115520;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:14 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 07/10] coresight: tmc: add prepare/unprepare functions for byte-cntr
Date: Tue, 24 Jun 2025 14:04:35 +0800
Message-Id: <20250624060438.7469-8-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: E7N2RLEK9mTIi_Y0xeNe-b9GL1vse-61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX0UMWN1mnxMVw
 MFBq3pv3j7C9HMpoyoA7ozQz1uApV6XxmGM3byufTKYD/3P4kkWJa/Vnlpzn1BIZCj3PDP+Kvqu
 dMMOWFFN3v7+ecuAr33jaF962Bh8xB3cGot+gVEg4SLf8tnw7Myqtq9LrvBgTDeqlJ59WSopPQW
 pVDx1MW3k69fLHCi3/ggHtNWFgbtxt+6OWf+h3Mg5YshM1K6w+EqZECQBO8BDXADFGPj2SpKHCD
 7TjWxY3AZEOUyNGHWZlbBNFG+wb81puAgMm6UUV3MU3WutyVpq66DQ1i6OLrlzjUMz5FApF+Fbl
 wmI45IGBMRNohS2lE01ydre5J4/XX/tTYaeZQfUG/wniXFeX0JfXnBoXf9UxpbCh1QTE1cvZ9gL
 GfQ5STKXZbv41tco4n6O12vF5niXNq2AIAa+UXW8etkwcQl4hVPRfXt3cGWPDikVq5TWI4jz
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a4027 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xC7plfDI9GgKYcT3xssA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E7N2RLEK9mTIi_Y0xeNe-b9GL1vse-61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=797 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051

Prepare for byte-cntr reading. An additional sysfs_buf is required to
receive trace data, as byte-cntr always reads from the deactivated
and filled sysfs_buf.

The unprepare function releases the additional deactivated sysfs_buf
allocated during the prepare phase.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 38 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 79 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  8 ++
 3 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8531bac79211..40605310240d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -229,7 +229,11 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -237,7 +241,18 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_prepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -251,7 +266,11 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -259,7 +278,18 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_unprepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4609df80ae38..2b73bd8074bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -2032,6 +2032,85 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Insert current sysfs_buf into the list */
+	ret = tmc_create_etr_buf_node(drvdata, drvdata->sysfs_buf);
+	if (!ret) {
+		/*
+		 * Add one more sysfs_buf for byte-cntr function, byte-cntr always reads
+		 * the data from the buffer which has been synced. Switch the buffer when
+		 * the used buffer is nearly full. The used buffer will be synced and made
+		 * available for reading before switch.
+		 */
+		ret = tmc_create_etr_buf_node(drvdata, NULL);
+		if (ret) {
+			dev_err(&drvdata->csdev->dev, "Failed to create etr_buf_node\n");
+			tmc_delete_etr_buf_node(drvdata);
+			byte_cntr_data->reading = false;
+			goto out;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	enable_irq(byte_cntr_data->byte_cntr_irq);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->irq_num = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct device *dev = &drvdata->csdev->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	disable_irq(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->reading = false;
+	tmc_delete_etr_buf_node(drvdata);
+	dev_dbg(dev, "send data total size:%llu bytes, irq_cnt:%d\n",
+		byte_cntr_data->total_size, byte_cntr_data->irq_num);
+
+	return 0;
+}
+
 static const char *const buf_modes_str[] = {
 	[ETR_MODE_FLAT]		= "flat",
 	[ETR_MODE_ETR_SG]	= "tmc-sg",
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f6b05639aeca..f95df0a34ad6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -357,6 +359,12 @@ extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
 
+/* Byte-cntr functions */
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data);
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data);
+
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1



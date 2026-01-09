Return-Path: <linux-arm-msm+bounces-88159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D279DD06D21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D656A30486BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FFE26E70E;
	Fri,  9 Jan 2026 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MX2oC+At";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEfwbz9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEC2773C6
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924744; cv=none; b=TKMmLiT5iq+IrBdReI0CNdztSSmdUR5LKJ9uv0CvzgOBsqXN4FCsTQlPFGFDWCx6FxbLqh/1tHmj9js46Vx+KKzfWwAOUj1/2fgpXA6mKbzvFEe31Irf8j13cTLjLWXGtQcpCbXqP7TQ6j2gGQnbL6Q8/nbYskEQiVAtUgenBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924744; c=relaxed/simple;
	bh=2W0HlvZ4Kc5fyudXSSocWCz1uUDaBFXgLVleyOVI8do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lc2g+zmgXg6tlUkTLUgDES0JabXt9Ty+gQBNIPjZ22cKNGolkyUFwzzbp3EhIWgQKgQzHyJXYAXaGjshczo4p+kqhQ+lYhiruJwIPhssTM8rhXr5IGS6XmDQGaGoyPO0MbR6mmNHLyNkop6VFOrbvycUp7qhdoYy2ySFBXyum0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MX2oC+At; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEfwbz9Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608JFoA73019527
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+myu6Q3Uz3
	7abbv2+ZhB/G75uimUCatGO2AyT4TJwg=; b=MX2oC+AtAfwgmCPJG5xQWDNJ91i
	DIiDusEJrCumSG7XTZ83lSU9WwMbmX+dg2fawscZnIODTNVzdvoL5S3uupicvnph
	va1Bm7AshKUxaCmtRpjg3vc/NBI5A3coEouzILYh8MiEF73Fbdd0ya9DBbzXlxea
	aDbaQo1pBPhZ2g5QuOiVGQX2ijinuK/tELSGMvYPFW/HADyqsdcY0vdyk9tovaml
	bnx6iLk4nNIp20wPQwmY/TbqR2p9Omt2AQBIO/sfjUcxF8qXowA76NI0JdJk4Q0j
	c2YuSMbxSMMbLC8PkEwN9yiIj/RhFQnYfZNLM6PjJegnvHgu68Il7puh1tg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3gxth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:12:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae6ef97ac5so10626275eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924736; x=1768529536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+myu6Q3Uz37abbv2+ZhB/G75uimUCatGO2AyT4TJwg=;
        b=gEfwbz9ZFdjckW9r9UUCly3YonK3vdrsLzhDpHFPTXXG9fW8DEB8DaEVBDyKpFXUF5
         5X+Jffr8uM8Ci4mE4CeFMTmq1BLBHQ7EjFjqr2OV5wF5bv5ma3c9BhYI9cIH4D0j/xYq
         BRwFF40X70UhF1I5tMo2jke0kJZknsT4kuFRAk498LjQ6KvesMHBEzWPlECidGUfnlaE
         qFJCi4/Ygk7q7aNJFQ6Q3KWhluPjGW+GDSmEeDtJ5KSYrZM7JQIf+tg85ngJseSLK2IY
         Nnf3U3hjXe49L2+J2FHpdvrhxcWXILxQTTHsDl3w3GC4WIoupSycRtKnuKi/3Ip72ocA
         srow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924736; x=1768529536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+myu6Q3Uz37abbv2+ZhB/G75uimUCatGO2AyT4TJwg=;
        b=KuOpYj3cdw+Br8D6O8yAeePBFFnD6LrCFjjB4FfEAfHUd5wwi7yCgZF30CyJRCm03x
         kN6kDk7S2hS+tyysdtVLCECDpk9XIO13PnKF4+FqT+D3PbiRRNWWW/hNCqKWBSlHlSPx
         aj/GVYrQe+7Kyx0bIYc893mQYfxznoxxo/a8as0dqRTqOJvsDDR56+HEV+BQluCJR1fm
         hzmafwYbXdQsdtBtGdA2hZKojZ2Uq93ac2DcgWbgu97aUnennOwCFcB1Nd6xwMV0RjJ9
         sJuNQ9OYwCjbsKeIjXfQgbR8u3aflYLg/DnxNnUMg+TX0F+Tb+ajt/FaW4gbOoBukhCX
         aovw==
X-Forwarded-Encrypted: i=1; AJvYcCWSWrhl4KHTfPtgRT4aK0D/KKKzU8EhX1+ftJBO+3UTE6fwyAd8pxc14qd3TZqF8YeET/z4cESp0zQMvg5c@vger.kernel.org
X-Gm-Message-State: AOJu0YwavCeIUKY86UMGq7dWNzjqhlNS9v0MiCxXGZXAFIcMPuO0IT3n
	qByv1N2rpPOrxg0ORawovrPqbep/UVI3M2toAqaBK2mTD+y/dBkIIDmDBFR4C5K7JwkXdEVNJW5
	ubML/yOigKzsxU9YkjurlAEqGgmR0XcixGP4wMZjwL+C2ngyi4Fuihjas5wNcMwfw+1QD
X-Gm-Gg: AY/fxX5FlLZYaeHdzphlyWA8c0k5Bag6LUesh4+l7Y2SFBzxnTleXoASWVGHpo3dyEn
	Y36D+bz6UvN1M9LrJirLYkspCMgpg1bb4J3EZ0hbJgOQr4b8yqX5df6teSOMJJIB1dk49Qly1wj
	gyQlDJIpz4CdQmM+gCWUz490OztItUgcYFwCZLnDvDgs/Irwej/WvcKcvmlxnRXZafys4eTe58D
	au9yNzS1WkWUXTJTI1nzW6bFRme8SD/lQmAZvCAlirqwcUOc6uWvflk+BdC0P3iue7nnCPgV5f0
	Wkjjcop4+NbMfHrdx+8qrHnNUgmvf61mqqOZwE2UL5E/DWzpLmR9ImKl8482Q5tDB27iPB4BrwR
	vvShaSDHCx9JxI2WnpopGBZ91m8c9hjGfVlunwJgVCOigrvPHEPQayDLGR04+kwi0
X-Received: by 2002:a05:7301:3c0d:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b17d341ae8mr6720530eec.40.1767924735556;
        Thu, 08 Jan 2026 18:12:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKFgWsIT72dZ/Xuo5XHw8dLQ7t1LZ0LXIEV72FJw3uERtVeUXXDTK+zXUN1oaEW4j99yYURA==
X-Received: by 2002:a05:7301:3c0d:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b17d341ae8mr6720498eec.40.1767924734978;
        Thu, 08 Jan 2026 18:12:14 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:14 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
Date: Thu,  8 Jan 2026 18:11:39 -0800
Message-Id: <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ceNJezbu9p9-sq3K3NKPQxuEeKs1vzj7
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=69606400 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q9DP89o4N5N1XlnrPa8A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ceNJezbu9p9-sq3K3NKPQxuEeKs1vzj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX2hpNveHfEVnn
 GbA5C8PIlfLGAq2xG6b4VFqBSXlcGN+lRDKQs3wFyFUsP3DKAcIqYrcPOP6WEegGnBHc2rJ/CjZ
 T7Bm9tyOKa5yEc+RLp4tTwHjI0MzUtYdqfvfTf1KwEqx728gDYtky8bQgrszEs3uw9U93tmKK25
 M/2xGE489Kqx9OKCOPe8OpqfSnICFeDG4PVJ7KP38tmj/oKVjkMZ5w4BPMSW3VUV/Jlb9wzYvdI
 GUjh6YvxW9Dv4KCMhiFvCX9LTn3kGtF7CNaECuFXlEk3rzqQVbtI7eIQCnr8mwWZ6fBpbnW9jfD
 bCQB9By1EFrMV0a20RYnaK7WZQbcHmfoP+FkJQHYdCGAgLxPpHERfCayr0jm29QxRVNhwUawqdF
 /1Zu97TwgQka8l9qaBKQJkg8zRGhVdYDjgYsJITaYh6L1O2KqNemnKOJCSrrsGN6ZofYP2uD0H0
 Dt3Hq9AGcabIO24tj/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090012

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 57 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 27 +++++++++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 4efa36a11d8e..fffe65d3c0db 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 39301d35ee9d..e1a1f0f423ba 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -33,6 +33,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_decode) +
 			reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) +
+			reg_index;
+		break;
 	default:
 		break;
 	}
@@ -74,6 +78,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -115,6 +122,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -148,6 +159,15 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				drvdata->max_condition_decode) ?
 				attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num ==
+			    drvdata->max_condition_select - 1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_select) ?
+				attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -186,6 +206,19 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	size_t priority_size, condition_size;
-	unsigned int *priority, *condition;
+	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_decode = condition;
 
+	select_size = drvdata->max_condition_select * drvdata->max_step *
+		      sizeof(*(drvdata->value_table->condition_select));
+
+	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
+
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 0d058663aca5..8c92e88d7e2c 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -50,6 +50,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -61,6 +62,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -106,6 +113,15 @@
 	 NULL		    \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -120,12 +136,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Maximum priority that TGU supports */
@@ -141,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -171,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -186,6 +212,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-59318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246BAC3347
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976BF3A7716
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E981A072C;
	Sun, 25 May 2025 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjkCu8CT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC69B1E5B95
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163374; cv=none; b=jYAcuCiYnl2gCgyODNDUd3M1TB5iNDuFcBMyPYKm5VnV7UbBAdQh51oX1uN+CXdQ8KrtA0bOmeFffsLNFaWCwPNQwFWULme9S2E3U3kvOaaiQTUuSs3sH3DwOzZMPmSZlD8P8z6ZSzKoo5Op32+zWfajxHI24goI1ByzZsIhvpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163374; c=relaxed/simple;
	bh=AVtU54nc25opv8K+2tymcPJdIsSp8GMt9cZa3TIf5Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGwlj9if4/N5t9E7ooFvWG+l9apUbLZdnvxT/RstuXUUEcLQ9v7DBaQwfFY2RJJXfsv8c0VhdMEH/8kibiFmBTS9mlTlnSi+hOhJVe61A4iCDmKTHicqLjmNfo50a+RD5ar4e3axbuoRuDyVUdjJD4cBPeaxMk3SPY02U9gx1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjkCu8CT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P5U12g005273
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkOp7j3zXSAkYXiIHN6jRO+1RgVkkoDu+mIC7by/Wuk=; b=MjkCu8CTGBoEs2Ia
	laFNUmxpzwI6BGeIifZ0o+yQi2RT/PV4hl6JVa/Va+rgzyJnWjC+7J4kUPokK8lh
	A6eZHGx5Vu5MKJqzwAtssljHrXBEJJjqrAuY3/KTGtPpyvEJgtoPFoESYKVMufdb
	PkXjWVEY8rIFAQwjdFSkG9UsGp5Y1bxKBLJEpwLAeAQmZh87Vy/dD4rvSjdM3PFQ
	IiHJvj7+LYV9VdW1V6Zuxqj4+YeObTe6uzgsWAayJ7VntiJwWCVkQNUFebP8F5Ty
	AedmrH1WTxVHh3e14hxQ+aGwOR9ZrgVFegVHhoqJuRAXfBhEOTrfVDyl/X4MHqsA
	xIWMVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p1pju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2342ebb8a83so3280135ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 01:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163371; x=1748768171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkOp7j3zXSAkYXiIHN6jRO+1RgVkkoDu+mIC7by/Wuk=;
        b=XI/1Q6H0UlDpyWgfmcM83LrtCr0hbVLlTqz28FilGbuj4vB1BN+c7OhlYO3vNMT4B7
         qeL9aqLPWUkCBMMqAgnqtesyL6LAfWGG+4dDZFnX6TNkQoal+XS22DOk3fiYvVk47+d/
         H9ARSYasP2tzyZcDn7S1x4BZ0u7r6FkynkSxPYiGG/BX+LtlGaJdttB7guMVBiyIP9aG
         Q/k9Njqjph71uFrBvBVFZRUNWSOpx3qlXygQPtvT8PUZzmNcTIt7Mo1KTu7EVWJb+wdJ
         f5cLFFV/CeF9XLxPa4b9j0mwQKAzIfOUwV+yGKhpCkJL4fXH7bJ8CM0A0kYVK6COXklo
         Sqcw==
X-Gm-Message-State: AOJu0YyDnlpVs42j5XavQQC1zheBlSLGD97jjqZMroveGh9W/K9wXXWI
	CNTBT6a7oilLbRDVE/SDbmyAAutfFvWEqJyzT8a555sw4mz8W4RrBFXQa0ucl0zS79JXczTydLK
	nspe0va+1aFjufMD0Gn96dxUtsHgH24IJwlIkd244og7DpRPx+eht30ho+wkxiKVdvRMf
X-Gm-Gg: ASbGncumvf/AwjnPzBmVdjBYWFp0jD/VR9yp4yyyqfyUaoqbX1UwYZ5pgthGRxUDIa9
	N9/hxo05RYSQoa2iZsNjYvefo08WDM/IFJVvPByHaO2GisCvlCHjQdJd5zlQ33xh0OGsouSrnvk
	sBWGh+H7X4DNFyWLutpgiQjYSIDUEkN0umTiEeabEWogsquK6wfh+xrnm8E5V35ZbOYCBIS6raG
	4BQknHRN12MN2SB+c8B6H0WLUl7OYs7n/xcW1ISJMCh1GqKMsQqBg+e3YoSvXz1Ka3SLwuhygmm
	lWmw0H/UcsFHmwiX0cjil4wwWg==
X-Received: by 2002:a17:902:cf4b:b0:224:584:6eef with SMTP id d9443c01a7336-23414fb5404mr86308975ad.41.1748163371231;
        Sun, 25 May 2025 01:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqKEWMFK6USrz4We9Zy7uWd2Rz+ButRLFAqNJb1eOogDF7vmSPsDwTFWhh8Rhw0hDm6BUntA==
X-Received: by 2002:a17:902:cf4b:b0:224:584:6eef with SMTP id d9443c01a7336-23414fb5404mr86308765ad.41.1748163370834;
        Sun, 25 May 2025 01:56:10 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:10 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:58 +0530
Subject: [PATCH v3 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-2-49a3c1e42db7@oss.qualcomm.com>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
In-Reply-To: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=2878;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=AVtU54nc25opv8K+2tymcPJdIsSp8GMt9cZa3TIf5Xw=;
 b=3c7v81qedwuXioo4vYTXsR3wF4NVJMeZRwj26wnGGbr7w9rxRDIyNbC+T/fUJzrH9ez9Ncm6P
 lMySkzEof6YAKl0XB7NmY3PiYG1WPyYjh7H7uhBIRf0BrrLC+q19DzV
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: Dmho26s1y1i7UFpdtzp2I9Gr44MRUR8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfX0UiX1Wju7Byu
 4lgcxt+43RZRp35HZ7afNLoKkMpbV1eHtC9FpkK3Zb/CQnNFJPaTzu2ibh17Z7ch3yBBzl7kymc
 uZjoT5JedooV7t1pZxOapKGC8g40ZMMBkJ7K+sMe3htJDKNhuTTHEA1bi2jejYS1HicM+u8TSI2
 kEAQ1o/I6JWPu2dqb6rj2CxltiFOuuk18AD8JJTS0IHs//asf8dHXfh+MfChpWPHaYEgjRqlhZg
 mIdvtqCPD7HPMS2gW6n1ibiXpHbol3WBn+KJEkD6iiUmL3XDiy3l0QhQFZMZ7vsVMPl/tOPiPbz
 S9e3132cs5cFj/7OCAMNsRPgyoa7pf30HD4KmsMdMm2vtQdjw9Pvt9n52VTGqN61MxBd3trAEdz
 7a3PsGYUOKXpVYibSVIIWKSUihL2LZiVBOGzqpiOprturKopQrpUpDB9srdmE5JJkVJaEr4l
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6832db2c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BT90xxDHZu-g9S-RVkkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Dmho26s1y1i7UFpdtzp2I9Gr44MRUR8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250081

Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
ddr stats. The duration field of ddr stats will get populated only if QMP
command is sent.

Add support to send ddr stats freqsync QMP command.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 33fd2a1574464768bd07289e743fbb79ba415e84..7795f0bd18c63adeee93da2b9e07ab4944c1662d 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
+#include <linux/soc/qcom/qcom_aoss.h>
 #include <linux/soc/qcom/smem.h>
 #include <clocksource/arm_arch_timer.h>
 
@@ -37,6 +38,8 @@
 #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
 #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
 
+static struct qmp *qcom_stats_qmp;
+
 struct subsystem_data {
 	const char *name;
 	u32 smem_item;
@@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
 	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
 	void __iomem *reg = (void __iomem *)s->private;
 	u32 entry_count;
-	int i;
+	int i, ret;
 
 	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
 	if (entry_count > DDR_STATS_MAX_NUM_MODES)
 		return -EINVAL;
 
+	if (qcom_stats_qmp) {
+		/*
+		 * Recent SoCs (SM8450 onwards) do not have duration field
+		 * populated from boot up onwards for both DDR LPM Stats
+		 * and DDR Frequency Stats.
+		 *
+		 * Send QMP message to Always on processor which will
+		 * populate duration field into MSG RAM area.
+		 *
+		 * Sent every time to read latest data.
+		 */
+		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
+		if (ret)
+			return ret;
+	}
+
 	reg += DDR_STATS_ENTRY_START_ADDR;
 	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
 
@@ -310,6 +329,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
 	qcom_create_ddr_stat_files(root, reg, config);
+	/*
+	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
+	 * The prior SoCs do not need QMP handle as the required stats are already present
+	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
+	 */
+	qcom_stats_qmp = qmp_get(&pdev->dev);
+	if (IS_ERR(qcom_stats_qmp)) {
+		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* We assume any other error means it's not defined/needed */
+		qcom_stats_qmp = NULL;
+	}
 
 	platform_set_drvdata(pdev, root);
 

-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-88680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1CD17274
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD8C305D98F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3263A36BCE2;
	Tue, 13 Jan 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+dSf+5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbUNtj5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D030E0DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291287; cv=none; b=p1y3xtqGygRrXJ+VaHhQgVuErVmM/Eo+LK4u2vbJTSrcrnVG1A16xk17csnSAwWwq9Ruy4mEgJjJ7leVRwgVne2qieaXTXxEJRA5MK6CGxChsJRTjwDQ4oQTXEy+iLxxAaoV2YxUAygjPxUlFge3XxzOkSKw3ggVFhRpUjB5AUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291287; c=relaxed/simple;
	bh=n/olLfZ4nDPE0Fc/nYoIgrhjqAFOMhm0RkBbmAj4e+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f44MDOOFlss+xSTdhCiWLWH5wpSmnHJt3mLDSxhtDrDWoL1VgH5S+zdo5zMeHWQwtm0s+JlECB4rCN2WrBhVbXYFXDxGvsWARj6Znm4yv9v+vbBsc1+chuNeLcJrwlL1jZpYb81rcFxn2FTxmtxKjJmouXlSQ/EazFn3IZVSgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+dSf+5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbUNtj5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7ZF9h3301643
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaxEWXLeS4I
	QAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=; b=K+dSf+5kMXEU6yqUPkTm9tD0WQS
	UQu6ImKknCr9SpOgUouKobt+kkzPpNt25i/24JtW2LBq5YUE5AJvzhMbFimlf2lx
	SMZauPccTi6AXcFnx0HggaCxv0E2WOEs25rjP0IH2xGJjjQ3LeFhpsX+L6LeeH3W
	ZV7XFw9n4m6EFUe4D/370Za3cfJnH8pbCcmVsWrpt/YmpW98fURJOg2xcWH7sqYc
	FT4JlYaInOmPV8jYf1yEZlwvxHdepFrOlgdXHictYn6Szt2O4g5J3SwQUqg9Dwah
	D+V1RjJ4Q8cUhnDgwlYRhYXTufXTz5Bf+MVMhZbahWva195RaywnX63F2hg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jm9w4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so8279785a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291268; x=1768896068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=EbUNtj5s198iuFMVkx/YlPUAafHE+LTUjSBhbC8IJIgBpjdh3CtC11mY0Mi8Qeo0mx
         CrPq7ff1/CgNMq7UlffpMbMqFVybSENC/vQd3A5M60z6Yxdq11vVJyxhPz8TG5m1pZfE
         908m9S0e72XxnsRI8uh0Cf1nHQRhTgL6nd7n67GsbeyPf+sVzsCkwWGxWk/cdJh13PDX
         5EJ0eX01yEzOlbcMd7As/MU8mmlZglEoBg9LE1EfTPa+pF57ntI5gJv2ErB7zMH0TZGA
         kdnu/Im65Evfit5G1ISrACJDD2D+uJx6/1IShZli95Gv134pNm1/gxEx0FbxBMFm3wMq
         6vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291268; x=1768896068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YaxEWXLeS4IQAnQ85ZZDFxXJrHCM2rSQp1hb6FjV+/I=;
        b=NV0gat5/lJLpES4Bvoeu5/P+RI6RFDRBWr16oAZXFW8HZsOp/uh25aUGnurbmY1c1O
         1RPV9WAkTS7A6DbUT24cBSmZAvH9vz4Xp0dpifgbqqMs1UWUwrOPmiGuS44Bvfh8sv2t
         YYOn8SqrEdcwaBdUCUCjh9JBnmeN1q+AEDUs70pTR5mwzNCXRrLUVxfeQIc2CgVA5VEO
         DBVlvJZclarnwS9mpc06KWwbR5kgxQ13yEk3cEk6qYOv/h8c9CCl4WbL3kuwxCBOClTn
         PxccuGrVYoMdjoNnLOkjjNOrzcnQPHr4lH4rokxhfHddS/xYeA+dIYJHNTncXlGu411t
         LmIw==
X-Gm-Message-State: AOJu0YxJwx6GMXP7jCXzjE3tn/uz2RCelGik1FQGT+t32FfV21XgZ2OG
	YiFW7oeYHnLG/6yQZnyKXqrB55pPHsLGwBePc2g69elWRo40isDxwlxHSz6zKyUQsqdHOqFrwoW
	aqdt+NVUi766p1qD9hS27B6BQ9xbnCmwMvycTT4fplbltRuyVMZLQgrlszGwhxQKVtLca
X-Gm-Gg: AY/fxX5Ag+iYwu74w8TboeaN4z0DYVOnCTcHGs8U5Rkg8aY+ZFmPh+lIThM/OWpw0bj
	AHz3vxUdT0D/E5YCalduny1qAxG59XtfzhzKAXveOEgK01Mph/+E9ky1xtsxIeBUa7IVBVJ1bCM
	6rgFS2wgK+O+aFVSLKHQjq2zZmvbGus7Ncun25qrBhNm7FoBXjQ5uXpzXns65SymwjUl9UuL1sE
	C/iIlmLIHYSCUEsmJbnVFRja8ZKcvfeRb+Xhqy0KGJ7GBFAEgrSPF4lAMRmhgrfh3GA23jTWxAD
	EMaUZLr9D/X6Az5iwPhaxcxHXElv5M9SZBAiuvvr3ZyQwmBkReLPZYDjbhm38+A9UQV033XWtlq
	qjhWBQpK+iskgqtQ9FW83Jo+aa4nli6p8BCxm9TcW
X-Received: by 2002:a17:902:d58a:b0:29f:2b9:6cca with SMTP id d9443c01a7336-2a3ee4da381mr221003775ad.44.1768291268467;
        Tue, 13 Jan 2026 00:01:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXP9OsgiIaXkagh4wVTk+DADBkM11bBot0icm4O4mGX/wPGDsDAdA8XnbcgcDZVujpVRyS2Q==
X-Received: by 2002:a17:902:d58a:b0:29f:2b9:6cca with SMTP id d9443c01a7336-2a3ee4da381mr221003365ad.44.1768291267980;
        Tue, 13 Jan 2026 00:01:07 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c15sm191132725ad.27.2026.01.13.00.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:07 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V5 1/4] MAINTAINERS: broaden UFS Qualcomm binding file pattern
Date: Tue, 13 Jan 2026 13:30:43 +0530
Message-Id: <20260113080046.284089-2-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PJTeDHauM81Hv6X2tdSzMiydB56HJTx9
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=6965fbc5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=52jqHT57hFt4fz_33zkA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: PJTeDHauM81Hv6X2tdSzMiydB56HJTx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX4JfWTSVsd4OA
 pEE/bDAi0g7ZbMLWxzanv5cv86OGYPd+tsxJAIWDITi2SmD927Yy2MrR7m/f0NDSW92/PM0BppQ
 wD7jraKMzadpqICfj+sQHLiw0CjUN5wMMHkIuYGk9ax4iKLUzv3CnPYK0fNTo6XWThOZEn0rPUO
 MCR7MnyyMXOkCFbwLTmuHXLEV0RIlQDYwDRVtJ75/53KJZj4tA68DctlRrJW36MyMqmtjSNirAP
 DydHWiDkeJC+EkHzHetU4+y/NP5HXpSXzNXuVv6B++nc2YNTEulfBvhHG55eUMlzN3pHOi/bJHb
 D8LIiZI9yUc/JEW1WTA6GNwPf+x5VYNYHffMHQYmps1KjANOi7Ku8vlqQK3qAjyEszmttiFvzbC
 Dv5buPsW8u7L3Hk4jg54C9RW2jlPxFT2dQ7MRAPR1x8JWSApmgYaXarIfoJveKyXP3zVqn2Rakw
 1US6WZz9y8tE7VJhprw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130066

Update the file pattern for UFS Qualcomm devicetree bindings to match
all files under `Documentation/devicetree/bindings/ufs/qcom*` instead
of only `qcom,ufs.yaml`. This ensures maintainers are correctly
notified for any related binding changes.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1ed..70c43fc74401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26842,7 +26842,7 @@ M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+F:	Documentation/devicetree/bindings/ufs/qcom*
 F:	drivers/ufs/host/ufs-qcom*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER RENESAS HOOKS
-- 
2.34.1



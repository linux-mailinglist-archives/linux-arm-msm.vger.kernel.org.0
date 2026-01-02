Return-Path: <linux-arm-msm+bounces-87237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9ECEE94E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8C43032FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60403BA3F;
	Fri,  2 Jan 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRbCKQzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZwZLU/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76A1EB19B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358105; cv=none; b=g+42yZxIUMDrOSg+0CuJOgIQtHMsMso+2jDAEfsA4xG4a6x2YObq1mSXDvdzwd43oPhP/G+zWp4EBBG01yoQYEDHiO6eATEjAnTUp3cTPANByU3ZgSHMiKbSroDkDrMUwE4q05YO4uYIQj07JWMv7WVmxselpZr67C6aJVQqMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358105; c=relaxed/simple;
	bh=m4Ebb0B6SJXqk12yOEWhcSQQ7Iz9CjGsH5jNbzVd/YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfEUfAoqmLh+FtI+4T7/cOtUrtPa/+iVM7ktn8LN1WVuBlESCsPyLotOYnlA7M1neQyj5a4kb27nKr3L7Yps1baaXryNLAPrOCAVJNi0O2vMjhl+uqXAtq9gqR0ooc5xGGg3e9TG9pnGx8i1AzSbt2Wu8UNmt3qiby0Sm7xnuio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRbCKQzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZwZLU/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C00cu314483
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dv8lMQRYqyghvmIZNQRTaY9rYCUSunjajNm
	dg4knRSU=; b=HRbCKQznSpRJeJXL2roX3dNtBDVyDdY+TQx7OpR3mFzrPeTXB3V
	WLC0ZVK5qc92ja08eaDnNiCjLFoATkfFuoABSBfqm9WeH7LPQEb7yOH2DFYO6j+D
	6S3QgrCdPK9gpM08+b3RMD2lbzK6a1AKtrXgQced1mIijrVrPpuGGLnwrGBCDI4E
	eLO5QAAf+RixwRlmEDfCla/gLB8v3aq/jGasI5G/T03ZdcMFYtOEtv/udPnYV3fd
	VJ6kY5ryAGODd+OUVF/+lTY3NoaluQ+VxvhV/k+AsWeXr2pngZXVBBaV5ffOhMaE
	26olbO8XkT9Hl/e5qDQ37E0WkGfPwJbs+wQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxr2np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:48:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a92bf359so280743171cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358102; x=1767962902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dv8lMQRYqyghvmIZNQRTaY9rYCUSunjajNmdg4knRSU=;
        b=aZwZLU/6oGIIFXZrQpqbPDtgNdkw/Znxp9oJPszBBfj3K8zNQPK9Q3YRhnjKgUimmh
         lAarSFJG6B7dz0fkgCuGHsBO5ShEY+gk5GQLICTt6lG/Mgsa8uNQbhYiHzmmuBkQq9fr
         YKb7GKJiDCYM4sdSsSZNqSCbZWxIQxnDvBWNl/ZqPoiBR1VOjhzIX8gx031NX/8oIDNI
         XejKx8PuNNdwjrSoWyADCO0rQsDca342I8XHYF+zQWwiQdA+ZWE90C+a2Y71wCwCiCg3
         wrWwUqnYQ2CIBZ0PI8lCZPhKUMBR8QW1v/pGX08aaxfzGh37T1idYMemDZVCWLDo5p2K
         YKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358102; x=1767962902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv8lMQRYqyghvmIZNQRTaY9rYCUSunjajNmdg4knRSU=;
        b=VLrYfNfFhRhGSiOgpFoaxj22OdPk2WSQFzSYxl27xrBRkXHwpTbK2mpUwLTD5xrLX0
         O3e6FreKL5YsVxbK8MFQiGNEhoCN103Sv7XUR5bM+3CBmcddlLacYdKbgjMdspn3BDDO
         VWe/IKy3TXvvtl/CpJ3INI+9sc1Xyj5x+u8UXaJEZTSmUXERJZd8oHqMrAEEqY3cgVs5
         561/P27zbQ4X48RCjUtWY7Zo94K8Jui/LHeW8rmZZ4JlHME79FIa/e5GLvdQNWD3scul
         NmgDavs4MxB/vnvPfe3roEj+TAFKselM8G+Up81/WgCyfnCIxNMfTh9Y2s4LE9FBqeho
         +IDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTJF61HklWbnlSfZuhj3iDU7CVvwKbITHriSc2sNGZJhk2Nfaiprfn9GdEd0SdSlJweiMX2PjYRK27L/tq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/akEJW0wDkg/jLTzGzLIL77efYdKs628AqCAY06Y9JaRAYvr
	GMU5rw54U/hXTpaigeKNvak3HuCyB2lVfZ775Z3GfyMZ/rMl//Yk7wvitLO6WVe2wPaS7FBfzc9
	4kMo9fQtYiXZ0NlLehKBKqLASi6iY49t+eY9zjoj0lzZJOC+ao6SPSOQZothuOqJUAUEGderHhL
	r8
X-Gm-Gg: AY/fxX5dLstdFKfBsLbbfASenUiAVXpl5eiXWwFlvdEWZgelaSQa48qrkKa12iUTYs+
	qs7IlQarV7Nzi8VgrkWkGJFIFuX6otFsW2SIaVi/TXeAKC4kBRdnxUb+ypSyre1Ctx6wPPzhEo0
	vWU4oww9/+e05dpSzShHXSLnCB9d+Je7O5RCdbtgInP4j753IBhbXkjeejcOATKj0Gptc6LxVs5
	xD9Iv7+HqRzg8Jxrn7d1Jg5cNREpc9CJ0F1NLPquyumuXobKSSwce2a2cbXyjUZj/4uyvVAOI5k
	aVc7VuZQUkxP9sTG8cbtRFqwQzvCMWqA3WSNw64LqCwG/dhpmOFWRKqy1ljB+E/gpOVi/1+N+CL
	fflRbydyGTzm/98MQdJdZSGQ8Rg==
X-Received: by 2002:a05:622a:1e8e:b0:4f1:bdb8:b05 with SMTP id d75a77b69052e-4f4abdcbdbcmr605708331cf.72.1767358101890;
        Fri, 02 Jan 2026 04:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+MtvGNhHauwf6vk89nTtCz8887t5j703IXhAAv+XT9OqvEcd0NZy5mytjjYNccvzU1Te4+Q==
X-Received: by 2002:a05:622a:1e8e:b0:4f1:bdb8:b05 with SMTP id d75a77b69052e-4f4abdcbdbcmr605708151cf.72.1767358101484;
        Fri, 02 Jan 2026 04:48:21 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm817272175e9.8.2026.01.02.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] slimbus: qcom-ngd: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:09 +0100
Message-ID: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m4Ebb0B6SJXqk12yOEWhcSQQ7Iz9CjGsH5jNbzVd/YA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76IjTIIn10vyN+XjMBzYVMTIJWpQl3SK1XK6
 bzXLimKahaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+iAAKCRDBN2bmhouD
 1xmGD/96rhsnpkaOxxzceZRgN78/OiOL+2fA0Dg0DGRzt4yI++L9PRlC462IHUfUNWLi/ce+iIt
 BI3573b+4mmn4aoUDTMbLvXsx6lON5larrMUcoTyRH7aNsszw0CY0zqKzYx9S+Dru+ZgniMzZVx
 4p6xAdaG9Et5wO5XSHGwHNyPi26Jin573kNiBYjKvOeEldbAXqSLH7Ld5I5DrKBXEX/xe+UGEEE
 9OlM2auI7cGTOnEArJuzJQSIMcLyqyBgbQLzu8XVmGw7X+91I8LYSyK0Of/QsZqeltWfu7r1897
 tU/YQII4OmfsAVMFDf/P4c7QZrmUiFjluO8/4a6JxwGi+EFKTCMde2M/RwH3jxCi+rCgWxozAPn
 R8rmGMlUR4FeYYLiWB+rYSAo+JkxQ7njVlL+Dw70nI3bwjJvLPNllBZPWBFmIgmreJmBlhUvO4K
 aVebOPFzwMd5jxeM89lxrNXd9vE0Vg9gedrC2ezFdLvu0GmX/0H4Pm6sgzhg+o+9+3dh0qoW9Tw
 pwZOc15DcNYK/6TIfPDbLaI4spcRAQ4aIIPE8ZVfvbH5aidQ2mmSJuVc0oxVNo49nVKUDhk+peJ
 GMIe5Tb76CzZNJ5tJTDJL9z27qkb17MIhVV5ocHSLx+k6qxgyFsg6mnaMaiASJMHJktBGo98gUm n1D4VRs6gMDLY5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957be97 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX7i1eVT02aKuN
 bHJbtKvQNJU6cVqiRY2xhSF7W2aialR3gyC7vHZ//lpSuvUdz8jTBupQ5AJdXba2bOi7aiVdaN+
 klWLCc0LwItQfIjM0ONCJM7+97m0eKRzpdYmaYIL+OObi/qX6HNUunh2IRfuj01KNxvTNA/bsFZ
 MSrGuSOALvj/sEnmrG9x2WX5xSiXTYNl/TgbZDLrMlMj/hx6J4ZMolCkqwMzTCqcTB8Rly4i3JN
 5qP0sHlFQDDAeFChg5pdWDdKF9RU295C9AfUId6cbKXtuaFT4HSyrlY+J/FQKe7qwAztHnyRcy/
 yrByUj3YEzvjhDKSfIynqukzIuO5+LXP55/MaknxGKbkRdkJrCb32OzONMCtlyu0LptNmMaWal0
 Np7MbSPMKBh2xusDG6LDBc+19YmijAibSZAixrAi19hapUD+7PifZq2lLlPcbupKlDhC8NEqzDQ
 SsgkzhmHTGPrvJDe5gg==
X-Proofpoint-GUID: R-fcX7NSTlsQ9isnDwqQ5cUEGzpGVUYB
X-Proofpoint-ORIG-GUID: R-fcX7NSTlsQ9isnDwqQ5cUEGzpGVUYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ba3d80d12605..7338b38697d0 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1514,26 +1514,22 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 	const struct ngd_reg_offset_data *data;
 	struct qcom_slim_ngd *ngd;
 	const struct of_device_id *match;
-	struct device_node *node;
 	u32 id;
 	int ret;
 
 	match = of_match_node(qcom_slim_ngd_dt_match, parent->of_node);
 	data = match->data;
-	for_each_available_child_of_node(parent->of_node, node) {
+	for_each_available_child_of_node_scoped(parent->of_node, node) {
 		if (of_property_read_u32(node, "reg", &id))
 			continue;
 
 		ngd = kzalloc(sizeof(*ngd), GFP_KERNEL);
-		if (!ngd) {
-			of_node_put(node);
+		if (!ngd)
 			return -ENOMEM;
-		}
 
 		ngd->pdev = platform_device_alloc(QCOM_SLIM_NGD_DRV_NAME, id);
 		if (!ngd->pdev) {
 			kfree(ngd);
-			of_node_put(node);
 			return -ENOMEM;
 		}
 		ngd->id = id;
@@ -1546,7 +1542,6 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		if (ret) {
 			platform_device_put(ngd->pdev);
 			kfree(ngd);
-			of_node_put(node);
 			return ret;
 		}
 		ngd->pdev->dev.of_node = node;
@@ -1556,7 +1551,6 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		if (ret) {
 			platform_device_put(ngd->pdev);
 			kfree(ngd);
-			of_node_put(node);
 			return ret;
 		}
 		ngd->base = ctrl->base + ngd->id * data->offset +
-- 
2.51.0



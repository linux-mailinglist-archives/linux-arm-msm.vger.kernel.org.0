Return-Path: <linux-arm-msm+bounces-82019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAFC62578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A633ACD1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B014C31576D;
	Mon, 17 Nov 2025 04:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1XFrfD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beFRDLLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5F30E0C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355098; cv=none; b=gC56DGbXRbtbD+rybJRa2xbS8IBl3kKg/90mwROliLX0dV6VHsujro6QxMZqN2P+AIiIDdDK5CogqbNc6Z3G+x9hjLVH22mw1i6VwAPD527mG0u6TugvYZ4QqMiNJcdJtGzybX2NmiW87A4vm9NfQbm9fdzBMSNShBTLdhS9wPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355098; c=relaxed/simple;
	bh=6RWQg9GSkLqY63xfIKBiZWFcWQJRLyjRw4cPxznIAbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkyAYzBBOD61oShqOfFZIvul66/hqu3rEdGSwAHNNUhsNm3wYPGUUZd+QxXjF/mJ/8aKqKprwUPorDKC3SpasEPeBb4X37kV13oVmFdOJebE8SOO7U90iUuvHO27T3uCBaAogBZ8YiiGBzimW3hIaszapOstUS18Qbn4Y85NPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1XFrfD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beFRDLLO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oGbK2911347
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZq2WKt2QpHuL80l0MVseFQip+s8bPfr1R4+G0kYIuY=; b=i1XFrfD+STOqoEri
	bQGRG5sl+o5S1CYV8yWWJgGzCzW5pui5r+TnnKCvePp5ueq7lMRf1qLlA93XJM+J
	CznigDvB8KUc/RMrQTIa1sZNfgEnoh8hyH8ORAV3T+5oY0BP1fIhAeqcXNmd4uAm
	oNrkCca8+KIvtXQ6VRNsU8ZbvNONswEFXaDJ20kqKCrOmUq7QKzrIuyufzIRNbfS
	fLQMSLlLxvkltq96BzDvlbn6L4FMS8zV2pn/5KWb+P8VDrKTQS0RN+PG92SrvRxi
	YHz9uKB8s/GKEn4skcU1AUO0Lv8Iy8V444XYMOG1K/mLHCfd+wCNlT6TEu3EjIbp
	OtLGxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcbbk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295fbc7d4abso47373775ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355096; x=1763959896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZq2WKt2QpHuL80l0MVseFQip+s8bPfr1R4+G0kYIuY=;
        b=beFRDLLO8++/QmM+LzG58qSDOIcSVLfCpTksxpc83Y0kIdejjRGBkG98JojU2I1V9g
         MsxmucqCXf/TZx5mLZHWVjlUMw5KBl5vV7MICaAtAx9JEm5g5xIHwiHuEbSWRW0ZQdsK
         MQB8rylA/gcGTpX60lcSnrj4yN+S9PqHOIiYlyr7UTMuIJG+YDSryZP0vtihkAEIUF/F
         qH+f23oHEA+3f1uYE0MOCzovbJL386UD7igb9KCR0l2f6yL7iIxyFZ7QWO+ynrSoN9Zd
         yN0RGCa0UR7GJOFMaSZFMW/f0p8uFjlE+Dd98IhuzwqZLWnm9QtVQu3k6c9D522ksiEx
         hv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355096; x=1763959896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZq2WKt2QpHuL80l0MVseFQip+s8bPfr1R4+G0kYIuY=;
        b=GtlzO+l8fldk6QGM6T2/pE4glP0wr4DE4GTNxGw1eSRfuIbetYVbiVxoTtraBo5CrK
         Fi+pqnFOvaacf4tqaD7H7vlm/ibVqr3QT3jwAB8QAhQI/siCXS1oq9fokyaZGof6AhEX
         rdPjUQsbqQ7oFiU75XVsNcQkk2OgZw5h4N9VtjG4XoZ19LEMY9FqnxcyGEnjIRmecwso
         SH69Yxygc+U3hf1LCVmKpz3rBQDfHaaFBUwrXpnAuWDjhTKUZ+HizpEodBVbff2P8nMg
         UyUHR81s51J3VWySEkUy+VpzGOxbwt2nD05aamCT6yqfDS4eRTbYBh2/CmAXOVqy8xCv
         uLRw==
X-Gm-Message-State: AOJu0YwNUmDUUdH3SDLtmbLGbkfnmeNbyvix15mZsk8eYqSPqBdAN9wf
	kr/N87BZElKtHuAyPb/7+qsIQVVn0QbO8XwdUM8sm9IRG6VBzy4Qszhb3YrI5snTb9mk9uVBw/1
	du0lN4BHt0+fLwHWwE76DdM18eQK/aTptFjhZaX1lX4qy/scDIdvvvq3eamsyCNNnlfhe
X-Gm-Gg: ASbGncsIthZzdmEPfyRGbjoKp0B/QXLrv0qfcv4D14ieg2DIz4kz+0HjnC+ro0OhiV2
	e2Ntu42unHvXpgLmwYDBZilgHg0NmT0qlqnuy7IyftwM4+qxaJOkg11NA/YY49FXq1zqMKb0yFh
	HWRoDKwbkCS8vx0pmuxY7nFMVUFMpG39ElQBhQ8qBRhlTHEyZa9MgmrOnQd7KqStPGQankw9f7/
	dFIQXRbniFfMBBLjVIT58Q/VHw6hPl0xHQwv430Pe43kV35LZAqwwIw8Vcqr6HJG6/0fP8v2oQf
	VxH+wEpwn/1kHn9MYe+NdfTgDt53OPmgq4AT27IUrbJ4Ou3ziw1sfx8k3Nhrn7exPw4ub+iUHQo
	uQvCFFlHlMXt4WHiIwrxI2YD4vTejcCLMlpgXfIYo5ZMV3HikOYiYFJZRlVJxXQqPXY5vwnf9St
	tk021Ajd0Dz7TOPEsK+X3Rt7AHn2zeJUDTzDro+IFmx8eF
X-Received: by 2002:a17:902:d58f:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2986a6badc2mr132476145ad.6.1763355095689;
        Sun, 16 Nov 2025 20:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlc1oiE7AMb5bqSW42LfrvTapJgVkWvWRgJUgL6odPj2sBCYDK5pmD80vKEtSCIJMV6Dszxg==
X-Received: by 2002:a17:902:d58f:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2986a6badc2mr132475965ad.6.1763355095275;
        Sun, 16 Nov 2025 20:51:35 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:34 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:24 +0530
Subject: [PATCH 05/10] soc: qcom: rpm_master_stats: Use __cleanup() for
 device_node pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-5-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1238;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=6RWQg9GSkLqY63xfIKBiZWFcWQJRLyjRw4cPxznIAbg=;
 b=qhvRXKqSIK0PD16/sX729hXf3osVBFZbnppzjcF1ms52R0Wv0PrJVYDTF8HAuUBTPZOKuQlDY
 gHeEk0uI0VHDTfZVemi1rFx3MeK4bIijJZejJPRP/JTnyvlfOYBbo/J
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: XzM5AyAnTj7iMXAlfY84P3leBJLYH1j3
X-Proofpoint-GUID: XzM5AyAnTj7iMXAlfY84P3leBJLYH1j3
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691aa9d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wXAVELiR5_LrZfF6pPAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX58TVsBHk09BO
 oTdNn916EETpsFkf26Vtt1Oz5JXGTWdkKpDUMFJ34m2WZizxrKuLwWKNJLTo8TSDzVuNMQpeKyD
 bwkD4FBo/C0zsD6ixgwsDDenxumF6GyZ9+ISlPGXQxPFYemhVQc8su8HrLDRKzCxGzgmyxQ5PXt
 rSA1WthlhohxpjZNAy7Ye7Bk5OxZYQItkfny8f1oZ8x0pGfGcR1PyFSkzkWsjvTqQv+r5YOIUwf
 kStB3iApm0dz26rYNepAC9byB3bM87Ps+Ep13UzMq7XKBrrdDpgVzaOa9jlX1aQxVJA86uvb2Nt
 jvhb9Ubf4r4Pok1OBBdgUcmom3mDyoWjNv3ghVZ3va9Ds/jHvMcOXR5EKCpBVnpjf9v7MZOEmpj
 MCr34cV5DVR1Uz3mqB4Sn3kuGpR0cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/rpm_master_stats.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpm_master_stats.c b/drivers/soc/qcom/rpm_master_stats.c
index c7788337e1647da386e874bcb87313e8f07241df..06a1d3fe5e9b4295018b0e5cbcf738c0e9e83c3b 100644
--- a/drivers/soc/qcom/rpm_master_stats.c
+++ b/drivers/soc/qcom/rpm_master_stats.c
@@ -67,9 +67,9 @@ DEFINE_SHOW_ATTRIBUTE(master_stats);
 
 static int master_stats_probe(struct platform_device *pdev)
 {
+	struct device_node *msgram_np __free(device_node) = NULL;
 	struct device *dev = &pdev->dev;
 	struct master_stats_data *data;
-	struct device_node *msgram_np;
 	struct dentry *dent, *root;
 	struct resource res;
 	int count, i, ret;
@@ -98,7 +98,6 @@ static int master_stats_probe(struct platform_device *pdev)
 		 * shared resource.
 		 */
 		ret = of_address_to_resource(msgram_np, 0, &res);
-		of_node_put(msgram_np);
 		if (ret < 0) {
 			debugfs_remove_recursive(root);
 			return ret;

-- 
2.34.1



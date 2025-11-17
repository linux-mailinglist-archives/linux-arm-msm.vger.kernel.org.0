Return-Path: <linux-arm-msm+bounces-82018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E1C62575
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30663AB7AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DA8314D19;
	Mon, 17 Nov 2025 04:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4gT7Hzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5nEAIF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA30313E31
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355097; cv=none; b=l0S0obG6lf1J/w/lHSUQZx9oy7IZMsAJ+ymNegmchyZLZXE2UhxCcAaWT7qcGivZnJZQagfvzQ0Pq3TU4OtmES1z1rHpNO8c+leBDOZamnFhKq4A8mLMFlpZIi4TJ0cUJiGZKMEiyTTtw5Dkjxk1BCa/Ui6PfSzs6AMQULjK1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355097; c=relaxed/simple;
	bh=P5Lx7um8/lU+fqacuZWG3rALFV7T64rAKk1m83DbjW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjRid/US2NTAnCzkP1mmBAmhnhKbg1+8WuaashmOVBHJufx4tvPcxg7AFHdSpUZlnMlC4KWyRBegT2c1Drja2clR5RVGRNMUh2GH62WRi/SZofKABRl1QR1ilR/MhYVYAChWJFZtri+3chOn4UWz7f+Taz04G+uQDtoJs9RILvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4gT7Hzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5nEAIF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o4EO3040289
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6ddXyChCv7/hQfW6MG7BsSOcfcb+dKpCU9wAxJM/Ps=; b=o4gT7HzmXDlZHpCr
	Ucndq49ngzwOIh+4jiRTO750p2M1XlHDZXlmaaLRerJZaFg1kNnChC10CgpA1bn3
	knZWW/mdBTSGpjl3Bw+ojyjLDydFyOI/h48OVS5f9/uRoyxNli7pYO29tlAvf5Wb
	BcksRc+YCf+ht5KdlVa25fZ16iPmrFEpWoDqYet6+q3rFmCxuQjcCV+0apbFjY9R
	mRetfyCszr8WRJOhoNY1ePP83j2WnchBsK7Nhire1ihY3IKc560+mwA+D2NNjUzb
	sMyVUsIk6WTpuiUkavSlW9dYhnVqq/qlmorBTnaM6mM8tnAZAsYkXqj+/zvydvEZ
	/D7ubQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh03cjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343725e6243so5159350a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355094; x=1763959894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6ddXyChCv7/hQfW6MG7BsSOcfcb+dKpCU9wAxJM/Ps=;
        b=V5nEAIF5wJYClmbqDrYr8WynBEYonSof1vr05Z0Vi1Fx5boVy7merZhYjlyy6hxeS/
         YD0MdDRdSD72PS21DVONZzv9iISOqklL6KMkybe9EGvAdD0/JHBcPwY+PUx7LNli67g0
         8rubH76jAmUU+tivp6DFaNO3HaD+4enhX9aJvvk95v1TQ5v1OEOzEUnm4EHhHngC8zES
         BlJ+jJw956isCDWK80oorGjfuHk6aPL41H7vym2tapGugzfLXA/6pVWCNwnZDSqj8toU
         xe76JgqYudaFlkXeqFu5ovq/0b6zyw7eYSQE/ylE34DjMtK87PlokLHqOWcMO1cfN882
         3ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355094; x=1763959894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l6ddXyChCv7/hQfW6MG7BsSOcfcb+dKpCU9wAxJM/Ps=;
        b=RYWUqE1zuCVA3BYy7b2aONRvjcXTqaA+Qr+Im3W6w7A5ZxP6hjuwBVzVqBSuT4KBe4
         bHq0Yb0IRPJyV3pLAx7Qc2heTonQjgYlpNgE2lSF0BC9XbBdZ7wIQTK7FlcJBjWm1b4T
         Wd/1VGJw2NhhRyVya5mtHHX/kc2OEchelVbc5NL1usTJcOu+XSoytgvXerO5SJapHVwb
         0lgPZ3goE5YK01hCVuEitu+E1nqwJramuLDG4C2cKa8qqmPqz0gAOJK13jLWDrIP2n9C
         JmR0DUxHMAaR2IoXgphylfQc40QBu8RDyJ0BuUxu645ZXR2jM7WkC2fn06Ff63Tne8wR
         TuPA==
X-Gm-Message-State: AOJu0YxdLC1ofoQcQnzVGuhRS5q+4OXNn9yQD4ky+s2WpuGY30Hej1E6
	IEqgjPpJkLX4a5YRsBlxmAHR6+b/aF9ur/PRs3M1N3zTHGEOeUmYW3AckCgeMdp0AMNihaCQ+3M
	S0v4XKrC3X6nFfp5gU1DURCoIv38c8ND6OOqcolSIUkgsgjPr+jP6MIvj+kr/5QeLGXbw
X-Gm-Gg: ASbGncts7z/L7QnxKJG3zSUfNLZq/kb0Vu70DSJZKYqUHZ7SdUrWmwfUyMVPFveg1r5
	HVzP8W/IqAZ+Uu0CYyu6gjAfpT/Se39Oy3Daootcs9yn1zlQ442qr/8ToswYhHg0xcN+58FRKpl
	i2czLn50cUQ6kU51DkGVdIoFhMcfloKhcYxWpaLrPEhJ/0Wa/vfWjkAam8l4z6QWbvtzyec2PDT
	vQ7iS8fxwwRNK+v+P1jafiKz7xT2Mz2aNc4Ljzm5leDwNm/ZGWXeoMZ0llOrGJI1HD3AygZMRIB
	XJ+plK817X0kN92koJm0Sk9SFEiW2flZbMNuwWqj07iDLraH4CQ8OKCuaUCCIYrXEu0bkLeaEKK
	Qv3f7h6vJjUe2ir3ZxWY7soWUaV9h4GWW1k/+emwY1yDsmNUP/2oQTQXMFYWwg15EfPZo15FTRz
	yLO/jLkkQzRsMsm62MO/K4FaahLUXQmtM3nFeR81w7Y7i7
X-Received: by 2002:a17:903:2350:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-29867f96689mr141742205ad.14.1763355093607;
        Sun, 16 Nov 2025 20:51:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQhnVRutSlYHPWUl0WBcthzHeYvX9JnVGrFcYGzkJmu+9M/P33kVfnNpDP73C20+k3cQGcTA==
X-Received: by 2002:a17:903:2350:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-29867f96689mr141741985ad.14.1763355093115;
        Sun, 16 Nov 2025 20:51:33 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:32 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:23 +0530
Subject: [PATCH 04/10] soc: qcom: rpm-proc: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-4-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1108;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=P5Lx7um8/lU+fqacuZWG3rALFV7T64rAKk1m83DbjW0=;
 b=jXVPxBYUkXD8zqdJuql+iVCelqq/pM1HoyYf5jTaspO/qaqqHcz0RpH4CPFCN+cjig1ogYddX
 c5quUV1gMkjDDgSgtpIGzOc6tcE1zFv5TmhM2MkzReUOsPoW780w9S2
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691aa9d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=11ZdNUS6-GSHGNROAycA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: vI-AYszBsvqZPLIw-h8NuUUXdnY2w1Yh
X-Proofpoint-ORIG-GUID: vI-AYszBsvqZPLIw-h8NuUUXdnY2w1Yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX/PQcUG17MKu/
 gLTcZwjknMpNNTihPA0GmZKaTcbvqXpO53dqMu7JPqhSJD8Noysd7LEPGuwAIJ0qC/yMaQKJGVN
 yGRgOm+jpNOjt91frdCPcoFVpbi4PN1q+kQnV4mzujkNeU8MH37Kd56/7hX7ZtIkZcaPb4RrdXD
 Q82PF0+n5Ab4+568XjSmBQgmdJ0LV1URUGhDWqcFb0xol1M0mfr0i3uifYvo9kINd2FNiOEHYCm
 oAXWiVNBZSxfLi8oRHxex+4D/Sz+zB+DgN0uQHCpHNY90+h+8gKk2RV+xQIW5i5I4r37JXgMnfD
 XCPOi0s4MoMd00Qtl+m3c42+ZcD2gDLz/Bg6Q2lxBF6ZE7ploeUqchQaSuUonyk6v+9eksd+q6x
 0ufEb/O/9yhyj/cuTOa4R4QmlDM1yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/rpm-proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpm-proc.c b/drivers/soc/qcom/rpm-proc.c
index 2466d0400c2e9a539e0b1009ee1bfefc3bd1b589..6f0c9f2558b06323c1100caa4544872badc22599 100644
--- a/drivers/soc/qcom/rpm-proc.c
+++ b/drivers/soc/qcom/rpm-proc.c
@@ -9,15 +9,14 @@
 
 static int rpm_proc_probe(struct platform_device *pdev)
 {
+	struct device_node *edge_node __free(device_node) = NULL;
 	struct qcom_smd_edge *edge = NULL;
 	struct device *dev = &pdev->dev;
-	struct device_node *edge_node;
 	int ret;
 
 	edge_node = of_get_child_by_name(dev->of_node, "smd-edge");
 	if (edge_node) {
 		edge = qcom_smd_register_edge(dev, edge_node);
-		of_node_put(edge_node);
 		if (IS_ERR(edge))
 			return dev_err_probe(dev, PTR_ERR(edge),
 					     "Failed to register smd-edge\n");

-- 
2.34.1



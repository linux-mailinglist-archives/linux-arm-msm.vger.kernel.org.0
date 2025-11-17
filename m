Return-Path: <linux-arm-msm+bounces-82023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654FC62596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37BF1360CD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0853176E7;
	Mon, 17 Nov 2025 04:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpGv8cUa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW3lEmrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E13168EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355107; cv=none; b=q+s/x1ca7+ojrsH/PiAuaOl4ElnstTV7AMm41RaXooxSgAnGvlDrUoOkbkg+4jZA6OnFu3C+8cbZncVIZWwhiHSRorEijMm83HG2tmdZlxsfFOYnI5pw8HyQA2vi97vAyVNLORMJevebcNY2WqmST1OEloOw8OzD9BGW7mY00mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355107; c=relaxed/simple;
	bh=wKb5K5k6USgwLwVbb9UM6Piv59qXjpFAmJAZY/De31s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2YcfclXEQDImFI9x70jeaA3d/3nZKRP1UY/4f+TB3N+fSgN0mqDyaL598LIdve6Yg27iv5VJIvYu6E3y0SGzz7h6hikD51JcK4vxJsRUsCg1QAuSd+IbKFkn0xKlzbUQeyK6km1ULHwOjpjRcvI6osn8/oQLK7Jdqk34GOyJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpGv8cUa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW3lEmrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o2km2686359
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySmsL/gHmMmfbVURoHwkToobup8UUSvZgG3tHDIq39A=; b=YpGv8cUaSVlfN4fJ
	DfdFStHSycWTqG/wouWro7VdKhLLTq9sY1INIeQACkfwy/TYqtKoPdWiodDQeXzu
	cpVUSRmRmRsyZMOizd1BDTSpqR1hQ2sWwiEPaStRpSr2t2E6YeW9EP7cwfJCV5cJ
	vQ96borIAJ2yeATaSZL0GqhW//nJwW56JwHybq5QgHrwUXn18RZHQekJkj3/1qyD
	6s48+kXQIrmFN2EfuaUBO6nuU9n90mGmh6kNdzrkJjI+un6kMKEOdDwTA7gM2hbB
	bNtKdhoeB/pAwwPpm3P0yHYIB1obp4zNngG69mPVk5zCOJ5mhwu7DhvPD7hyOC9K
	TPSoMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejt5bb7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-298535ef0ccso45759245ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355104; x=1763959904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySmsL/gHmMmfbVURoHwkToobup8UUSvZgG3tHDIq39A=;
        b=DW3lEmrjqLA4PedX40RfZKrC8RUYOMCpeFMM6penlX7idsTPVPduO8LPMDdhmXpkD5
         vNtD73BzePV/1XDGgc5XpX2BMbZlvDLobusVPgVSMRzODyA3YIM2Mf9EkE86vZ98Ee1F
         f3nof+0WoYdlGzmvos4gf/l/jOzYZ90/fg8nEcOGO7Y3SBElOz1HFQk0gHQAs0foMNh1
         fzyKkrYIFjFiaEeXibqtRvPq1kX3XahmdMC9/Rc6vwdaICcX5zgmA0oQa7+8plWYaHdr
         M9IaKKxxNevKfqHU+13x5JPIZmhBOgJiMiyCCDBdYwN+v0wtEob4JFveBWeZENcNEX7r
         cU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355104; x=1763959904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ySmsL/gHmMmfbVURoHwkToobup8UUSvZgG3tHDIq39A=;
        b=hzWZg1L0P8kRMYRl9wNJm68aJ0tl65523lQj3ueYBNm56LAPw9YUpxdYcNiD1z6NrW
         YxJroEbEutpB+N02qVA1qrCNn+KM68gQfXF+AwHWqogImFXNHde6WFxRqNjH8H6rx9Oz
         dxRq2fB0IkU+KUZqBONhJ8MNToOSXCAFs7Kxla8MG1YFTps5FarGXJjVQSJwFHMH18bB
         EJtMLrICIYexYPJOWuhxUNbaNcizGpbxi9IrUAfUs5/L29G+kAAUQQmHujzG/Z+wZTve
         NSzDb48/dLpbE4IZtbf3B4LbHFudd4LdEwNmZH5RWkPuzlZiLvBArhp4naC3I2unN3pA
         Dgpw==
X-Gm-Message-State: AOJu0YzaWKx3FXqdgky0KN19neQB9LJuZ4tnDABDO+CturDHI2VujRex
	3G8ESenaQ1W+0kdrYGdv/eGJHbmdk3Luwn8pY1ovg3GAX0HtBmh+DeNaMmBvqde7vsiznzOSq78
	1SjsRfP4KswdNNSaXm3FBGjovPmKzbjyj5d4fbEnyzPkyBDetIDTlr8N0uJjVi/VJSKj+
X-Gm-Gg: ASbGncuBpl7+rMlZek/qdCK8b8uf9BiHbO3vRfh/UT4BJljubD6rmxbcUT5z1kGzmKm
	dFa3Tnvxc47P1ybNWSv+ioaPNVi5OsDbbU/o4+uoFWNzMTqaZkwfcPRW2OJnG0MGQOLpofcjeXo
	fwB5myn5nyFP1kRFO/17Sl9Q9dtwURlx0zwlTStWHqKCj46NQA9BqJEaEvkLD88KX9WZdihNJ3I
	47yHqMKF7I5p36Z/3QXMnVVBaO/KzaevwUbzh9KhxIv/VPUhbLuzLSkMkFKuZraQKTGUOjHzfrm
	lQuhuqFlOePx75vJDWHPEjZZxDZJm+4urtRhOc/wnSsHqC+01FTUCytf7vY2TzZhTGg8GO6weH9
	V5kPm7IdL03fJWZGYT3JHZK50JXZhlqjZDMGoI4Vh/KY86/+CgdK20XG1CSHUb8Tfk/ah2tBHSa
	UzBHKDRjJsEWl9gaMliwG3d6Op9aEdFoTd4HB+XBhIum0h
X-Received: by 2002:a17:902:fc86:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2986a73b764mr131296535ad.29.1763355104383;
        Sun, 16 Nov 2025 20:51:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDovWaGzdRDdUmKHAOKy1f3wcYg3jORL7K6wfQrt4Mo5r1oAazXey7KtPw3F3njo5UVfXmMA==
X-Received: by 2002:a17:902:fc86:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2986a73b764mr131296345ad.29.1763355103895;
        Sun, 16 Nov 2025 20:51:43 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:43 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:28 +0530
Subject: [PATCH 09/10] soc: qcom: spm: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-9-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1143;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wKb5K5k6USgwLwVbb9UM6Piv59qXjpFAmJAZY/De31s=;
 b=qRIVhCRFql57oXUWnH9m55KrlkAstuMvrwLcRyzufkt0YgsnbDpKLa6lceDfS2A3jGjTySvpE
 KJ//LylHOAJDirNOUT/cBlgho0E/Sw0sCAFqtN8DXnM0+zWP73XCA0b
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=LqmfC3dc c=1 sm=1 tr=0 ts=691aa9e1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C6rrOJtzpZzYG7erQkcA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 9I7CP5ftINsyNzwylGtt65-zAivnPJ8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX1Rsuj5j1D5mX
 uSM+1uSh0+CooW+FTNhT8hH6V1MCcaRykUIJDvqfNXmZlXbsWsKHoddjsOQUnkrR8Z8krYq/D9k
 vz7TtrE4OfIKPpcDH4pir4K8xxqfmTZ/yllLQL7LzXbaproqL8nD/eYR8IZUgtyDj9Nkm3dsSxC
 yrD7aYpM1DVQmozQZh/zRtBH2j8CVjqlOVNQjH2yIdjrv7xVqZ31UbzOJysFXxReVOPp2+Q/dIu
 eq5nPXRQZjSD1V1p1QQmJ3+5I3imlJfHATU7J7tpBxD+uKbTsK7uJ+zVCjAwhiymAiTyFgxPc73
 RNpwpSoRWohumyNP7nAfjQSeuMhFx6BoxZI+MWvCxnDGZhRD3sA57R7lBVAU2prWm8I93GN8+Wy
 RcIlPiJIBvD72FxrgWFRV8nXBKLoEQ==
X-Proofpoint-GUID: 9I7CP5ftINsyNzwylGtt65-zAivnPJ8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/spm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index f75659fff2874fb6a29c48ceee862b05b1ba5802..a87a8593a8b7fb2c62b14eaa9c96f46fc5eba877 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -391,7 +391,8 @@ static int spm_get_cpu(struct device *dev)
 	bool found;
 
 	for_each_possible_cpu(cpu) {
-		struct device_node *cpu_node, *saw_node;
+		struct device_node *cpu_node __free(device_node) = NULL;
+		struct device_node *saw_node __free(device_node) = NULL;
 
 		cpu_node = of_cpu_device_node_get(cpu);
 		if (!cpu_node)
@@ -399,8 +400,6 @@ static int spm_get_cpu(struct device *dev)
 
 		saw_node = of_parse_phandle(cpu_node, "qcom,saw", 0);
 		found = (saw_node == dev->of_node);
-		of_node_put(saw_node);
-		of_node_put(cpu_node);
 
 		if (found)
 			return cpu;

-- 
2.34.1



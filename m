Return-Path: <linux-arm-msm+bounces-86715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13554CE50C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0072B3026AE7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 13:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF782273D9F;
	Sun, 28 Dec 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwl+ucHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gi+gsUjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203AE25DD1E
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766929257; cv=none; b=B3lYN8lrkiCRy+l4UYPjuYfmtMjX41KnInT9PotSRSFK0B98QPSaFMjwyN+fI0SBQTEA2x0j59PasDuznDegpKpzNK3wAvZoaes1ZnlWRTdCyO/BupG4CRxZ29QNmkj3TpX0MwVcxWTCSqBKSSZg30vM1xvJuh/c0E6sTes1gPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766929257; c=relaxed/simple;
	bh=tJ0OhhU1TyvUwelPIODPcQ0pK+ThKb8rAGtvupaBgK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nv/VL+rklIhNW/4wyvd9FRYmi9dk5bdyVDW7wA4NJeJkUfLVT4izLgZfHaE3GO0Yyq2N1JyBbT0Yqojdpcxn5Mi6bTIrs1nVhJ3nZJL3UTCyCjKOY5tPCA3FsO9bsB9VDIR1MF07DwdfeSYG7AO3EwJEIM/dxwQNZkF5qinwKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwl+ucHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gi+gsUjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSBGYhJ2369369
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxFDoHWzZhwklxpJ3qKUCTwBDJrVUnpwUHIaeNpeqbU=; b=Rwl+ucHgUCCwupl5
	mYC6wGoTHIzyI4pvBCXGfpuAM3kbhvdUfR1Tevuo52REL0LDL73yFOvwQuK6hCrW
	SH1jCeKPt0shgqvCMWPqkniayWsK207bvhg/BWbWK9epZhDOpP+4BY8GHFWiY5a5
	vJqbW9kYBrs3aHv/eeMo9xYkFvyg7y2ShRQxNZI8oy73nezMidRfRHjuRgE96ccC
	20IarSqKdztsT6XPlLvsUCyxQDqaWLaYWsk5toNXfco18KSYPtAPgG92oHqdRHt3
	AA7DRIXqmdnIhK4L0dhibI1aw21GjNllkCEr1cEDBwk6IeDZnxovlFnXohzpwCbl
	gdkwhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1t8pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34abc9af332so2703788a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766929255; x=1767534055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxFDoHWzZhwklxpJ3qKUCTwBDJrVUnpwUHIaeNpeqbU=;
        b=Gi+gsUjWcBUOi42VPRE4kPvnd6aFZdz0Dp5w1pLMQ+F6IaG9Mr070HVDRXCt6BVtyF
         sRQBriRpDXtryWwHZwECOSoHXJZk9cmPiMVrkYrdFow941R7XnJ9dgAJzcw03gEIf+8Z
         NA59pe8Xam4vCmnF3Qv5LU42igV5zJW+Th/Dzy/L0xbKBhUyd9WlSTCGVU9ArqJUafuP
         ZWqRaZ87QtzvTgSAfwonS6F2mSq+bL9gAgTiYXgPH/6Dui6DWYHc7otqqvMUZB5TPMgt
         smVyD9coLo2U0geWedFMEjSmvyT1N4/34WAJuuGG7b2mThCDTVI/AI1sQBdbPb3pAepO
         TJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929255; x=1767534055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NxFDoHWzZhwklxpJ3qKUCTwBDJrVUnpwUHIaeNpeqbU=;
        b=sRcjSha391BU0IfVwPBUBOpFO1Luk8VnrizL/0EVvwu4/e2GsPxLiOkxuJJSDWq1nV
         rMYECuiyg1246EsE6a333AOvI8t/71OyvZLSaJHdVUfubXdbLIvJe7p7DIqrDRw5pRrq
         KzeNbr82ssp2pGJlpwX0yLaw/GsUvKAR5PHBJDgWtE0pKLGUQ6fHb0e4ebUfVBy5klRk
         0soTiiVlGIMzyFkbz0cTcI9prhLQe9dqUPyjOCcI8+YPI6h0YLCSU96kpBL8fawUu1JB
         ZQjz5NaM5hQgC6NbUATZHdRSmzfbC2dl5kMW0PQFqUDPaWXyQ5dZ0ixpsz6WxNE0QoxV
         5fcA==
X-Gm-Message-State: AOJu0YwnslRvj++UvOYZ0EbYMDkLPMPKgnH5xtT+L2VUTWi9RacuRSCt
	2w0PHvp/1wf5Jyteq45RobbK4Gho1qPIy3GqAMjuhAW6E5Tz8UuR7F91ouFfQ1xBODlOAckXY9Y
	DIJtxquxzDF4zyPYOnWTbEoXyIoex0idMBM0NZwh5E9iHGDUWQqsgC2fVaakOIlA9KNPM
X-Gm-Gg: AY/fxX6supssFbID+KVIZh5eUeP7xgCJbFpXciBRiyM/oxorT13m+JaeduNA6QhCNBV
	DIGy7kCJsM6/ujIk46XpNN2zH8fZE4aroEvqyq55w7ZvQnhIpZ/b11+EhJwPN9eNJeRfH4rvkt9
	mvfJwMfzYdTltuMMK+AXNMUy4FWlfvMKl5z0dcLJkjHT4lg8ufyfP+3Cquj9EFCk/JTofQg+iz2
	6fFi7bxSKQK5zfhN5pQXANoTvwuZNc50kXNma4zVnEASuBZPI7uJDWEviibJIbk+Rkca+MB+y4p
	fId/4VdR6MXWfXj3N7DAyG0YKg85DkegJOGhcUrh1CKyWMGQlWgtY0i0E5KjS7hlwU8d9anxUw2
	1zOjGXCeVfSYit2xupqrR4j5X0ljzMT2QmRP3HATWxuWP1KZKbeU96SWZN7/m8HH9D+03C2IL8X
	Qr3elltV8rMzLcWr+e3+979Zhty8Wfjw==
X-Received: by 2002:a17:90b:518d:b0:343:684c:f8b1 with SMTP id 98e67ed59e1d1-34e92119af8mr18063345a91.2.1766929254729;
        Sun, 28 Dec 2025 05:40:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGpILZ4XZH10oIqtQZLSgAftZ+jvO9KsdGdbywYn1Gp2cEbrxPjQa88kr3Osv3rRnNq9+ltw==
X-Received: by 2002:a17:90b:518d:b0:343:684c:f8b1 with SMTP id 98e67ed59e1d1-34e92119af8mr18063337a91.2.1766929254329;
        Sun, 28 Dec 2025 05:40:54 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c14747csm22981950a12.27.2025.12.28.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 05:40:53 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:10:39 +0530
Subject: [PATCH v3 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-lt8713sx-bridge-linux-for-next-v3-2-3f77ad84d7d1@oss.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766929244; l=843;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tJ0OhhU1TyvUwelPIODPcQ0pK+ThKb8rAGtvupaBgK0=;
 b=hSiaf+eSL+Hu1t6I5LOQ8zhI67jO5Zjx3A0kfHT+oDP8cucRncSakipPuY8MkwZAg5lX76Pvx
 bpbm+ARa7kuDwL8bqPcF3TmomrRGu6B/KCsmWzjLj6PleCdys9WujyN
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: BDctq1rcHfH8usKmebEr5shTusjB4CIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEyNiBTYWx0ZWRfXxDv+qcSJeKK/
 37sAbE+K5umaqIaeWjs3O+CvN73/gj6igOTijQ+xUY68nwOiL1ElM17TmKWP/1WaXVoKLVJJwIt
 i1jDbrMzHSIGaeGHfd1XXnQ/tP8sR4/9lV3M+8QepUZb7Q7dbsD08AWjdeMNlRLKPMiNGdIXmgc
 AtK4uiIhteV0ul0Mk544YvqNblH5BiWG6Iz9UywHb44Tp/mJWZO9l8xcZ9nFAANxxTd7brIKZM0
 NXBwrlS60FkvoRhA4RMHFq2anRgeLf8U0+tvZxgk0OTFfZ3vO3RgPJfF9AszjtxwbIg9WbvQ2sV
 YWhdRpeyNuApeWhj58kozn1bJ2ThKxkhtd/xhOmmWCGXVAt08hovcTgZMMiQjN2kP92BKZQsvn/
 xg0z09ofaqT8VXXzyj+oGpqH7884JaaZB77Uws/RJwjSSJquJHuuFTyOil9YRtr/gHSEC00tEKU
 0bLSe/RMNzcl0Id79Wg==
X-Proofpoint-GUID: BDctq1rcHfH8usKmebEr5shTusjB4CIA
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=69513367 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mes9G_zLd8qmkOzsJuYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280126

Lontium LT8713sx DP bridge hub can be found on a Qualcomm
Monaco EVK board for converting 1 DP to 3 DP output.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 00d15233a72b..5f21bbdca902 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,7 @@ CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
+CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.34.1



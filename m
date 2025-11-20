Return-Path: <linux-arm-msm+bounces-82664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB6C739A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3D74349905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF55272E45;
	Thu, 20 Nov 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abWSZUqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPnwXxIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F348732ED5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636359; cv=none; b=Kcsz44oy0hnhYIldqH8lXEUGsWWAs1x1QohYEWkeKqcbQQhxNfqwcpRFv70phhv5uAc3BFvuQ4li0lN8UObR4Wrq7HsyCeSKjcp60H3QFYcoUCY3jLOWkaC3ioUwCSQ031JaV4FPQQVX3RjHzEUo7d6RiK/uCNbjPrtCizry584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636359; c=relaxed/simple;
	bh=z63TrOSv3PL45GArLId8ue4PUSViP76Jktat5/zKEHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgccZGZVtePk8MGK8ijxdcL3RITf1bbTRw26UQqIGoIARszEMrZFigZPbNqg/81NVX1JklNG08K24ieb80U4Fiubp4gXEGAAeSwC6mevgBldPfUBiwt/4LZG/DLT+CIa+NlI22/xiYZ/cPqUHxyJ81kL4L9yKjuBs3Hg0T6Frbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abWSZUqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPnwXxIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pd9t3543813
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgCoec/JlOBSAvGs40nHskVlZ7sS4qnVVw5hYxeulyI=; b=abWSZUqY5hLiztcZ
	Ae91xFWIfnrvaNY3tX5kMklgZ4I2dxlYLoHePLpgSavTJTWrR41u/sc0wpa46N7l
	EDkh+fjxGARf8BJqlgyPaGzetDhhCET5eVqPRmyx/XZOv/89aQtueoyE1RZmchuM
	TqbOe9TyQaVRbDBPdhKZ6XHXKkecQG3OM0ONw9En9rmYG/E7mG0oMZpJtvJPLpd4
	BTX0tA4uetjIvK9WQmkPd08t03Gx2UUWq2gxbLZoLwGVBj74D0LgpwPQs3PyKs4W
	TU/ZhMsZeWJNdvGgC0T9yK6o+eGaARy5sNhSfo+iZCTWYfJ4FKgRCNEXnselcpEm
	xKW68Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t33ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:59:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2986704a337so2331535ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763636356; x=1764241156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgCoec/JlOBSAvGs40nHskVlZ7sS4qnVVw5hYxeulyI=;
        b=FPnwXxIfV+ujsV4IVJxnCv4fNMazpjGSdD+ZLx5/ShVGU8TgbsaNYwwb/GJdDyWhdN
         opCYAwcxogUMaPovACRmaMwA3bywCHH3R+kInqPYDfxIPtCCVjzXOehS999jL5duKV25
         S/YLjRJfsdIKupr4C1kh00H9xtqw7tnt6ZJTF22JCOgrQvmqKprpRAsMBu2NjH5oKvkJ
         MrwF9v6w65vqDt9g+Z9we5pWCN5quaJTc47evWpNAv3+I3AhahEPhuVmMa+pPfRKDpUD
         WH+lVWWgPI6vGltp/ycCghh2Az2itOl6xqgZ5Dk6Vgucbqz+DHYljTI3uKYbmIxQiqPK
         WUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763636356; x=1764241156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgCoec/JlOBSAvGs40nHskVlZ7sS4qnVVw5hYxeulyI=;
        b=u0Yjga27rrlMXacf+VfpJzPOI2xEZiYvZV5erysujrL/5dV34tvQhv4qHAXyf5z4AQ
         Ng6QfnToxGrci8/9hkbMqnagp/fThZW77TmeFQFr/4RvYZCTFUdcxw6cLYX9GmEe/SGH
         j+/2eYEBI6r8ZITtxvxf6kOCtfaMHkGapmKy5/cuypOAQLvck9QdkgmzqEnH68rg9H51
         AzQc9wvhWc2EKaEEyRAXROYWNtcpuNMCMW5u/ihWL3SrU/IUX7fLv1gA8QviroRYXzAq
         3NnsKaWqgGnvTgcBrl4LRtGWfy8Y9CxSfGx+rlMhUL0npK7q/MWF64KhXlHYtBzH5/X6
         efLQ==
X-Gm-Message-State: AOJu0YylQHjlanh8FBXlWA+w2YskiKREs7TjUbit4M5TNSkMYns9zyfu
	5KTqEe55EYG+DMuONn9O+AnO/APv3ABcgZJRDU0b7m7NLDs6Ar9akELAy1CKqHHYMBgTuU8svu4
	894kaEmj094oHkTnp+/PXgsd2FMlUaIiwxBT4T+Bzt+HhUYBn2bRtF+k6qOU1Nnat+gbY
X-Gm-Gg: ASbGncvi/o4/zTklQCTUoXvGpbzjAeE/XfsL14Xh4ZHCqn8U9heybVBh4p4X1FHQ7mP
	jwZFVYUkwu0Hisc/frTQ6HxpNIgzXznr/XWAjS3W6jjof+HbSAIVei0IBPO+Yf+kq7yhxa9gAvj
	TmKkhhUtSFRD/3wlowVfcS8iIRrPAmr3IHuSWptUwCSp71iZelNuZ8GGRbtuvEB8ip6kXzLvH/R
	uWW8BDams9dn2pJf6KKMIZcxXqjtT+y2A9Io+dAGKRk+VZhAWP09I6vliPIzgQfxTkgBgHNLa2u
	DnRVwBSO89kgL6aKoa49g7gquOqNUX22OiTZGwFiafxdccBK4VVGJ3U7r0u+bJQy1i20guLmgKX
	HW7GFeYwLZgD+td9SIJuNuF29U/KwmSsrmDVoR/RgaadwTQCKUS0qWiJwoqa51BDuN1u3OrnwKo
	cV6/1YTR+JjO+6QUoQtOiTDMAf0UzT8w==
X-Received: by 2002:a17:90b:1d85:b0:341:8ae4:2a8f with SMTP id 98e67ed59e1d1-34727ea78c2mr1766686a91.8.1763636356595;
        Thu, 20 Nov 2025 02:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/beTLxTQcUAY5ts53m32B2c5gLBaMIJVPEYQPAccnQfIDTbI/D6+Z8yRbfY+haMzQUMiiRQ==
X-Received: by 2002:a17:90b:1d85:b0:341:8ae4:2a8f with SMTP id 98e67ed59e1d1-34727ea78c2mr1766658a91.8.1763636356078;
        Thu, 20 Nov 2025 02:59:16 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm2248944a91.9.2025.11.20.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:59:15 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:28:06 +0530
Subject: [PATCH 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-lt8713sx-bridge-linux-for-next-v1-2-2246fc5fb490@qti.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
In-Reply-To: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763636345; l=826;
 i=vishsain@qti.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=z63TrOSv3PL45GArLId8ue4PUSViP76Jktat5/zKEHA=;
 b=3w/mRTjnjxvtPuc4E5+N/9ELnFD6s/GXbcE2YGHi8lJtv7CFYchvUOwVqw0yE1V2zdh/WsjSk
 Ue+qFaw2aB2DNHfRRa8agEYwft9f5OC9/cJT6XESXv2rAnEHPGpktba
X-Developer-Key: i=vishsain@qti.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ef485 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1KdTzgYz02F4bmJjgj8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Yeg7BsbmURlO7PhtTP5NNvCIEvoYR_ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2NyBTYWx0ZWRfX6VJ9ClxopL9Z
 0qVLvbOh+ruFE0PwPG6xz69UBnNDG2p4nDCXwcU3zusDfcUINU8LzAmu4Az1uQQbh3a8Q4GNWgi
 qYHQvrgZXqDFWhLm6oscs8MQ++buGHeuAOIvR6Iaa5cC4qJUh6gZ+nOcnDCLcd1Xv1BZKViecGL
 AlwgN1yHHCmEJfYPqWZwYjkOysJFeiuk6OuMWObBc/Ii1cFEm4Y49RaafCmA8gkK1gYTBb6FP3i
 be7v3nqrnShuIRh5yQ4PSpCBajqoKx1IBykDv8NK15XvIiigixaaskEpuIldRFJaFgdGqUnBv7Q
 ZoIVADPlTPFlxdEMSj8sizM+t2IEKUkDS5zwzqNc3Lj3gc/KWQkXM/ximSbXEUGZ7k6PA1yKxJ9
 y6k5kj4YZoXvAsS5EH0okmJ09ruN5A==
X-Proofpoint-ORIG-GUID: Yeg7BsbmURlO7PhtTP5NNvCIEvoYR_ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200067

Lontium LT8713sx DP bridge hub can be found in monaco-evk
for converting 1 DP to 3 DP output.

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



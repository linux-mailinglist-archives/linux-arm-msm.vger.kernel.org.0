Return-Path: <linux-arm-msm+bounces-74721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD3B9C816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2203B4A46BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7968629D27E;
	Wed, 24 Sep 2025 23:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pliUjvMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B829D277
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755887; cv=none; b=Ij045iuCOH+l4qIfPzhbJ3SuvthNZca2syuYYanh6dpI6OO3eRl20LtvYGqCKLWiz1KcfqXizpsJ/OVcHUY38r82OF5j7dnI8gPkW5PJPhJMlf7H+jM2sQhQEctL4NtICUf2hMn8U9ifCSGZN5XJcML+Sgi4AVP/Hs3Z/qYX/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755887; c=relaxed/simple;
	bh=P6AXEUovjelcMpdRLAsDPVjZOskIoYD55lWsBJZnkA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dBFkyYVPEBlO1WmS503Df9DkB1RFJQO9W36DpUJzVec05t+jjOIK76E78G7vz94j0k2+mIzWFsuKVwoukxZo60Xwe/q0pPTTFtoD6bIBkJAQmryMK4rabyrZ2cX+g6hrNe0wr3Ft+JcD9Aa+Z3DaXAa7pGrfK3YzUSXhXjONXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pliUjvMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODb2A6019952
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kOzDHRFaT0midnTDgk3Xix
	Iv1b2jJlohJ2hcb2gOtjI=; b=pliUjvMVKkr+cc/LurJEFUiPp7rOUvGgeGwfmZ
	iTWl7xN8VOskQwEH/7sVWqEz/O/y45xT3zZzH1Bpgm5wFLZnwYc/rlwi5O7i218D
	vKHA89rbscJApiy/Sp+2OFpBuEycvJczGBzN93nEE8UrxHzqACNB+afMc/P5kmvF
	U8NjXvIcFRENrppC3iYeMvIfzwaYgozm10TrOJtoncNtZHpyWwyW2bhOwHhMi5pM
	FDq8I+hoc0cQ6dvWOa+XJ1UaHnANpu1WGVgf0RK2hkoe+dENUYZWRJ2kkxfLXmZ3
	HigFn69H3AvdCvHs5V8WGH8vV52V6cn9gOfuXFa4s5xGWrMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy7q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:18:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445806b18aso2947225ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755884; x=1759360684;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOzDHRFaT0midnTDgk3XixIv1b2jJlohJ2hcb2gOtjI=;
        b=G5TFgqcAAcVGFM9SGw51WCB5FcQaJKnbCIjo4M8XjqMkuQrD2GWPFqIpAdlznEqYoz
         A7a67uR6SqGdoq1blZZE8rW/7Rfa4bz14tEQs10ODVqRU4PqxEsyFJYuJ7Wdee12Phd/
         JCFRXlqccpnc71RNckFCbnjOG6CLGXmw8R0Cv6zpL9KU3ZCivw03Xwxq8JQpeyn0Lr64
         7zY0cJf0yiKdVWbHHexQ2/fQWA9AH9pBUECzR1m8RCZGHxXS0ee2rgj4L4E+5AUIXWgW
         BVJpR7561CpiGhF+yEnQZtew6+o3bllckpBu7wTC85M3aWMVI5EQHaXvSvw7dO7Cs66/
         IMvw==
X-Gm-Message-State: AOJu0YytvrcQAwhoG/3V8+M50Xwrv0ty+HMdEze7vRCKj7TLMGGbWA9Q
	TeMAos88fXZ+i/wo5oqz8k81O76UV40kAu7kCctcZKho2+hbM6cEizI6s40JRyb2Mjb7yj5cRiQ
	EWJhb9fH2jnq63LpXMRjL6pk2Pb6bvP0jt4LjqYh96sUhYplAMjLZOKEyGwLLfx5004Nf
X-Gm-Gg: ASbGncthUDV3etr0JDr+gZdk6HUoqGPYUenpY4WPYq3qtumcXvf/kAvuH95lWchHPOn
	mbR+ooaiWuSKAr+H8fLi4RqBSovhFBs/2bGHGCBDyglUc27a7kQaH3UX0Oa/rIE7HnUL1LywrnX
	meyt9EI69vSw2kfKmZBMbLC5W5Jo1Y+Kv/fTW59ntHMsgK/EE6K0sCx1sZ5cfjdO1xQum8HBIpA
	SH4ufA8k3sZqF4ioi1dssV5+WW5gdIOlD9E9c6srtbuUJyUd4+aplCRRW8urchqgzv6lB6IKbt9
	Y1F9HF2Jl7njrKOtCYTKXcUFSV1DGh+96Ve1ZPxLhemtL1nGxxV/8xzVqc8ZgDKRnhPmXkftx0k
	ZlEltU1xZPpqCdWI=
X-Received: by 2002:a17:902:e5cf:b0:24b:164d:4e61 with SMTP id d9443c01a7336-27ed49d0775mr13252815ad.13.1758755884144;
        Wed, 24 Sep 2025 16:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG69RWSfsU8xQba5OXZo1Jgnzy7tY9QZgxSf523NT/+wl9+n2c15dD6eIcX76OrUzuJIJoeHg==
X-Received: by 2002:a17:902:e5cf:b0:24b:164d:4e61 with SMTP id d9443c01a7336-27ed49d0775mr13252585ad.13.1758755883648;
        Wed, 24 Sep 2025 16:18:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm4321385ad.25.2025.09.24.16.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:18:03 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm SM8850 socinfo
Date: Wed, 24 Sep 2025 16:17:45 -0700
Message-Id: <20250924-knp-socid-v1-0-fad059c60e71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl81GgC/x3M0QqDMAxA0V+RPC/QinN0vzL2ENt0BrFKIiKI/
 75ujwcu9wRjFTZ4Nico72KylAp/ayCOVD6Mkqqhde3dBf/AqaxoS5SEOfTZdxT6ziWo/aqc5fi
 /Xu/qgYxxUCpx/B1mso0VrusLZ4eoWHQAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755882; l=517;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=P6AXEUovjelcMpdRLAsDPVjZOskIoYD55lWsBJZnkA0=;
 b=IMtStwtT6lWe09AN9ji6KK8Q6jx3xg9YIdQU5ADGt0w/2nYTotYNyFKoV+qkS/cbuqeAQgqWV
 dMoiCY5oa1OBFU/8Alu8Asfnc6qzRfBkG8eU8wjesJ3W7xtUf3/W9Su
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: ToqF2QMT7YPJPTZQT50fZrvWdqiXlYd5
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47c2d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=18LhJySMsoz4s2Uj1UYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ToqF2QMT7YPJPTZQT50fZrvWdqiXlYd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX2XEzvHR8Yc9a
 CBC+FgRDGfQqS3c8NF+EGWgRurtJBsIuUWsRMAUgaHbAni3SOyVyIMH1sIBReqJHe36nWZmQMvj
 Qa3TIyr6u6PVcVQy76/RU4YyLabk1p/hvpkfZ0/FSa+W6OPUydNDdLr2CDHiF49s8B+RTlmyZCQ
 AZDNlyyZ/hboNaFfLut3OZ259e6Re9UubDlYm4RndW9K7/A2xKlOZurD2A85HiwDZfatjXO1N1r
 6InSLUyiIYhZWFHjv3Dshczr+MVfx376RYWnA9wkSge+UjlewY6yWuEwzyhCAyAcmai/OVKvFoX
 26g7r1+hy4VvZEhSReLgPsVzuIVjG2NCCIpw6kILO5/x6FUvqWWr9AG0cxo84Y9c0HH4ey03b4k
 BvbyXDpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Add socinfo for Qualcomm SM8850 SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SM8850
      soc: qcom: socinfo: add SM8850 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-socid-f96f14a9640d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>



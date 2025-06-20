Return-Path: <linux-arm-msm+bounces-61863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73048AE144C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 08:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347FC3ABBCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 06:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63ACD224AEE;
	Fri, 20 Jun 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGTRMjbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6736224B12
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402497; cv=none; b=qsLOWjgIk2QUouQFsi9anSnCOPPcLbM7yDDCtyiHT+a+sqJ+p6ELAlaweX9nK5EncmFEnUFC4mRDrXyyl0Lw9oOgUqvwsVg2R3jWmsc+zWQ+YHJspihUJsTcZo/J+MWpqQU3rAr2elYNrLVEqnlxzwxa1xhXEJhSHPd3Ro+9RDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402497; c=relaxed/simple;
	bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T9kyHNNYtO1QLOcqcArCoahD5IHupuIqEkG5F4sThikjvvW+9blEdwkEJgOg5bHNw9qo4ZsZ8ewIcIBm+Oljn5xWx/SRJAn61zhWvRdFGdx8RPrT1djjlksEA/x69lVUPlp9JOK/ElSASbdATkAZMQ/gDgSAeAz0q5IFoftQqn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGTRMjbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4FTA4017925
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ScyFz0DOvxXgWzbjqqOuOf
	3WOA+3QVWgFuzW42VFYnA=; b=TGTRMjbLx0KFwUzJWzDTmsEJoLwa9VEIFuwp5j
	jsU7zWmJ/IhoDXWw9THQo4l6FfivNaSyWcXVb1KPs2wCdQiDcpN3iBlD5OqvGZg4
	aIoRsLDP9x/izQqFTQ7qdL5i7yem8oNf55B/s+dJH3g3Ugl0B76miQTXN6XTcLMo
	1UmPUYm0O8a21CsYVxPJKOkra/1p+Z6J4Voocsx8gIhXE/gzYYCFTU1ccdYZuIcR
	eNOvRfdOks3Qq3lNkFQsi9keoRVyL0G5jhL2seOKhtDFvqZSWb0196EieY0Myhpb
	OP8O8dSmTtbzFCb29jAyduopU8Mhk1avUI6gN02ECVyrb9Vw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdae34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:54:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313f702d37fso1245398a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 23:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402494; x=1751007294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScyFz0DOvxXgWzbjqqOuOf3WOA+3QVWgFuzW42VFYnA=;
        b=nJxHsF0pwFb1XrhmvOwjVhSMR9H7quu5V83131Uka34XMhLid3mvcUF3tqzN4PvD8w
         xWYEZMQx3GNLy0Yrav6/CRbviwa5SzoASgguBqGP4MUbwkbPc9+yfwbXgv8pUI+67RZ5
         bwBT/PqjAW4DQ7xSJD1ec6QOCPv0PCy4DB0rd085rYH3UsWk1kC1yRuOZOPdaSw4BrU+
         Tu5hZFdrDmf8wcJZgNzSjINv+Di/1WHYbwh3OkgZpqr0zVjxkbT5D/xx2+MqoFHXPAZy
         7hvUu0bO27nZglFlFXLW2c+e2eYlA8rlgZs2B74EOj04+52nsyBQ13AI/ZQLO3056YTz
         4ZRw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5vfmqHgrfetNSGMKC1S8SgK+vVTMtRTS95KkNtZoTY7lItDB4N5ZguA5kjB+rFw00q/PWzIpGuhmOo/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88rt5vkFcFjq4WLjJeKtadtc8GGb9prvgkaC2Vrrc7BFc73Vq
	fTi3lPv4sZNhefoG2NVwSq34OQe0I3QAPmIVi8UeSdYLwrNuzNvaOlZdopyZPgE+OBCCngp72Y0
	n4mErQws2QF9nBTO0iRXOV+PfBU2OAaAQ8acnb8Uo4Jrh9Itxw4wn3DBq5/aPb5RhoNC6MapBU3
	6i
X-Gm-Gg: ASbGncsB0gGo9LBDq0/6hNOGlToiQ7oebA2uryDnvJmnFgVTG+niAan6a71GSYmWcC3
	dQFv+QZZS54UNSsYBQ4nrdIPbftlMIZp81ZzVeo2sePl/NwhYIGtUOEd460c1/NUa8mJqvNwMj+
	AOTScR2HSsLdVjaxHiwwXYtdS2or6qeL2AHDpb3VFmCshSSE0eUdPjKkMn12qxO3E598UkdJSVd
	ZTQjMl923n3nUkG/1F7vnAHjH5BnuGGfzz6rDsgE6Ro8FW6g3Uqj/iu2SFFeYFV81o/2pJKmgnL
	s1/HpVM37spuOEKAgLWSWQwIGq1DnAI3
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22386225ad.8.1750402493803;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIYHi1UT3lT3VJ7eStgc3F3RXk7Q+Nga2d2//COTAVYVplhFGtVV1Et8O4RY+Oflc3Ja1aQ==
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22385985ad.8.1750402493406;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Support for Adreno X1-45 GPU
Date: Fri, 20 Jun 2025 12:24:27 +0530
Message-Id: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMFVWgC/23OzQ6CMAwH8FchOzuyDgTk5HsYD/soskQYbrhgC
 O/uBA+YeGnyb9pfOxOPzqAndTITh8F4Y/sYskNCVCv6G1KjYyac8SMrWEYnGKjQDntLOZy04I3
 OlchJXBgcNmZasct1yw4fz2iOW5NI4ZEq23VmrJNQpFBQp4B8hlvjR+te6yMB1unvzXJ/MwBlV
 FQoKtZkEip5tt6nj6e4f9g0llULfCcA/Ag8CkdW5idWSpRS/xGWZXkDHmfOqRoBAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1837;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
 b=knES3iwBctiGuUKxjFzfjxdZPB02hxoct8ZdKICWABwsiJgsGhwDdTtm4RUIyGwuSVqA3bB2J
 4tIPAmjr4/MA/8qi0hRBvUAC9WXYylb9dY1lGiiUKJYTd7f6Oj3TKpk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfXyveHhgNeuJY+
 eD1F8wBKPe2Nj/Alzy34tUCUbHvbMDTiU3gUud/XgkbKlkUP0l/sYZG7mtMQls/6f7t+Oqe3J3n
 tx5vqwBkRvfyEOVqnboDy/HH/JGGlxZCQuiD79UItkyBvL5IRv37tye1ilD/U5ieJeyC78VdyOo
 YOldnwAtladVlOzjEm/jLL6ITw+sQk5Ge9+S1mXVqTIIYIWTcIwqh2+AyIZd9rBSPOIKKxCL/b7
 dPQB7ROD8cYPjeuaQAqeuFwo+1xNMmp1FHPn/oJcx4nxhMvRHMlrAg+VtxNsLroieWY+NzVUlyN
 lVwtwWbGsFM0EomgwKJbjtbrtr7XB0v6wDYq5O/+hKQWq0WmVZaAPNRNd2B3AupqanecCsPCjeX
 fElssrojRbdMRIH4AvycupS45O6Go0pJ4SVMPdNv3c62Plrpb74R7TFMeX3Am8zJuAPJ/k/t
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685505be cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FLG5TEe6YmQySltxF7x_Gjt8yHsQDfq4
X-Proofpoint-GUID: FLG5TEe6YmQySltxF7x_Gjt8yHsQDfq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200050

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hypen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>



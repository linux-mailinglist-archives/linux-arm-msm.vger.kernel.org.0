Return-Path: <linux-arm-msm+bounces-73644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CBEB58FBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1786C520607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E03928152D;
	Tue, 16 Sep 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYUckXNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FA928137A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009518; cv=none; b=OLkLe8CcB5MwsOXTzACQhkmo/yrJ/a65epyw3ZP/q3x9SLy1av0jSdpYqbzlYv2yjJAbU0+GlVRD6YE3w5TB+7HUjyIH/vSm6A2nS/RIOqFSZmUVa1eD6sLxKTVXsewoZE8GrFY7ynQ8QGz+MPNMfZKl26k6Lq0uV7UcY9+y3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009518; c=relaxed/simple;
	bh=BiL+OBvPwleymFUg266zEWHST/v/EWFTNg7dbQHSFNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BSd7/FREKd2dNljumBgB1PLf9gSXLBFodsewIoKxNY9JaAUMCRBmOknN43Mj45NqUFUXtB0mRexhSc/i8SxxpCC2hyfRMY1jZ1If7uOxFvwxlw3KkO1bGqsKga9QA+1oH6xw7MrUhzMebck3n7u/42CIqA+fHPv2i7DeGvL0Am4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYUckXNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pglp010521
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q0tLXPQAF6tLix1Ta3Oa+U
	AIwisBAHhhdVTGTaT/RjM=; b=fYUckXNg+UBcvRLnzgp/41cmFOvolADy54vaJF
	Htnl3wA4bHB78ROJmblk3gkvVGna6Hu2gKE/cqTV5k1dXxgw1XNRqxTgud/5tWTM
	e7MaMWfU4KmUV4TEAc/QytuiFXBVZEf1Pjnmdu5y0G1kjMnM7TFxYHX+W2WBc/JB
	XhFiv6x8tZN/Ao7rAg2djbjznKbbbY9SKcAyzB2Fd1jSsR+GBZitwimjSRelFIo4
	ghHXFAQDYf3FS19YRlEUG/siWjPtFmaqtF7wAfzcnrVkTffr+Ix0imBa3a/MOvrK
	2WwfkA5axFycBmLb6nbGqToONfBbEJ5+1CapidhbybX+jHGA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snqrut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7724688833bso4664870b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 00:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009515; x=1758614315;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0tLXPQAF6tLix1Ta3Oa+UAIwisBAHhhdVTGTaT/RjM=;
        b=GZUtcXWrcWRyfnSI5jSWlM7bp9NpavtCRpQDW72kvNEBYUPNWB/e+Bdto0BaZ96a20
         odzFD14M+xq83eUQT96q8b46VWdNs/zElvZGiYqLQsKFF6df8DeV3KACXqTbbKN3Tu60
         SQtmXeReRjvxapt3rLHIGBgU8VQDnmW5mO786/1pLmBiUMuJ+L3vy6+8dCYHFXhZugwp
         OH/m5dfNkycczVLbx39riY30kRgmHsH3cfwYwTTGSgjUTx54aA7LdqP8BHc/zpzQBUyI
         uYMTZmkEmauwQoDjlOq+q0CpHQV9F9+Vg31tccAVnya5KtuhUVdnPNe526SgTy/3U4Jf
         iDxg==
X-Gm-Message-State: AOJu0Yz+zt1GrTlmPVaUyo+jia4J0beQOIIoqW8I48pHw1W8ntcpO4cw
	ne46ZNbj9hN7ing2Te6z1frHgREaZsIxCWwJ+oXLQGrly2o2liS48pjZcG/DOzfG0Wz4mM8CIxT
	E9shd56laRzLMBj8RoxkO3Qt2i7BKRzcUKAy/94CRqkzn2Xbv/r5ygXTGP8Dkr0PGS2+d
X-Gm-Gg: ASbGnctFCxb6M5DMSTWkRWPLptfPGsa/HZ1KXFmB6sMlauuS6vm0CXSjnykxMhXoLhG
	lDI8BOuDF8uZNNrxFx5b+4jXIGTigY60hWlxvDv673Kq+6UlsNe18dQE6W4kyXeOk+ycV4YrDHa
	PjUMB9aDlW0vEaTso5W8BSlnJRX4pHow6VhnwjjObCsLACwcGA7y9uSYnBN5/6MNmJ0xIxsJOIr
	BAmXad1fQdQalZyjAB/S8xDrHhLhNjF+OWLUyh4TEBv4qW0gFPONFYHkCfMjEiXYekVWVezQJQs
	n4bYjqxK27K7g/ZX3NCYWETqEzlZQLtdWwMI47/YdwjQfHBmVCMlwRT5DJ49LZeTxYPSWYTcnzF
	OT692aKKXzhsG3qboLgEhpjKZbw==
X-Received: by 2002:a05:6a00:982:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7761216815amr21067005b3a.18.1758009514867;
        Tue, 16 Sep 2025 00:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Mw7Tpab5EgduaX9JXiImWjA12GetgNV6g7eSIsDmOtjjbFYy59QLratOGv/hg+mFDwd6aQ==
X-Received: by 2002:a05:6a00:982:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7761216815amr21066953b3a.18.1758009514410;
        Tue, 16 Sep 2025 00:58:34 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761af2e09dsm11292222b3a.76.2025.09.16.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:58:33 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/4] rpmh-regulators: Update rpmh-regulator driver and
 dt-bindings for Glymur
Date: Tue, 16 Sep 2025 13:28:14 +0530
Message-Id: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYYyWgC/x3MSQqEMBAF0KtIrS2II21fRVxIUh0LnPhRUcS7G
 3r5Nu+mIFAJ9E1ughwadJkjsjQhO/SzF1YXTbnJK9NkNfvxmnYw1mlgiN/HflvADnoI+GNsU5W
 Fda4WisUK+en579vueV5AE/1hbgAAAA==
X-Change-ID: 20250916-glymur-rpmh-regulator-driver-80c9543cdd6e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758009510; l=1091;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=BiL+OBvPwleymFUg266zEWHST/v/EWFTNg7dbQHSFNA=;
 b=ffBHPPZutmrccKpgs1c/bDh77Z41Pl4Z3A7hoGZOth9kAxx3eQ2px/mMcV7sgP4l5LqNb7+fy
 +jit9FeQpv5CLZhXobmBpTE2GyvS77BJGxzNbVuffQiuiB1rRCNaxxC
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c918ab cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rkQUlozyScZn5B7-rlcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: o1i0LS0lMHTf4eiMBX4REW_5hUdfUtwI
X-Proofpoint-GUID: o1i0LS0lMHTf4eiMBX4REW_5hUdfUtwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX2yTpLZ83+lWW
 0zx4ojYjbKH+KxX/I+r2mdroPfT1EpF2zql7Mi2pPfS+sAg4qYZ/XP8VH7EhXV2f9dQH7s3VG/L
 qWmzi5+5w9hzD4Rk7l7ZrS5qKfKH0RQOdZSCAtacxXjRilrVembxkVXeAwHdV+6mkgtmSowqF40
 ztA8nEh7JZiv+aRS9fCQYxWPQInBnHWf/azSBJo6W5DloTsf0vaSQZ+o90yKAOIqnaLc99akyoE
 t+1jul4onAEEMFdIYYrpTf+lqgL51C+lItXkGtI4UiWmiXz/E6WvkZGJHYJuX6Ll96Yn8ziDBJd
 afwhsrtOPkddUq/y6KUtxmMzJDEHgX+tSLhQItzihUUgquyn5HcJkwazTc+NyV4afNTHNj0Y0j+
 GKPoZn0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

This series contains patches to update rpmh-regulator driver and
dt-bindings for supporting the PMIC voltage regulators present on the
boards with Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted
separately after the official announcement of the Glymur SoC.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Kamal Wadhwa (4):
      dt-bindings: rpmh-regulator : Add compatibles for PMH01XX & PMCX0102
      dt-bindings: rpmh-regulator: Update pmic-id property info
      regulator: rpmh-regulator: Add support for new resource name format
      regulator: rpmh-regulator: Add RPMH regulator support for Glymur

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |   39 +-
 drivers/regulator/qcom-rpmh-regulator.c            | 1322 ++++++++++++--------
 2 files changed, 811 insertions(+), 550 deletions(-)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-glymur-rpmh-regulator-driver-80c9543cdd6e

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>



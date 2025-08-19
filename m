Return-Path: <linux-arm-msm+bounces-69653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C60B2B8BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D1785678CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FB930FF37;
	Tue, 19 Aug 2025 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAGhn60E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C020C461
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581701; cv=none; b=nP5QWac/l20H2S/4Dq4wVwuwOsHAwLhl9GDuDZixfUOPLktpKre235c3RPhNP6p9Y7g5jvZkOA0t5QlngU06OSR89QvCZrFiHKotje9VS+W5JrUwJLw/b4G4Vq4PmCQmaONsx2pqn9dCoCAhVex0FcqFCLeeQqWQo2ZWIiWhys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581701; c=relaxed/simple;
	bh=OIx1Iyga7xol/jnwq90PT1IW2G315NN22lx0c4JUQlw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P/pHsXbpyElOcNS6Fxi0Bzjy0+DjB+AQvP0eHaak/Z9tADw1wjkEJH2nvhkW2g6JWK8owhPfZiBhzrhcGYXbWiZEX3WfW9YOKT/NbGPaUxB4HGHK7V04buPhRVbPEhXKt+St8I1cE2I5q/BtXoVY+ng9IB8NTTKsxF9iTn6Rwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAGhn60E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0iJXm031717
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sVZk2H67L/WBxeFp1Wyf1S
	K0wuc0uW8l4sg8p00ph1Q=; b=TAGhn60EuII4yC12Jeu9v8hyXggTV8P0sUwp0I
	vwNBWsdQrwX//qyt532pLcs8pyqFIKJDApkqNY9iMgSuxHu7+8VBxYm9HMOVadwb
	TPZjTbIrr1uD/KqLw5jZ+nwjsLUA89e7M4RjiyZfy963XOkSIp1SnGSGTMTMG6+E
	zkLyyOZV1DxzBilj5JYgHqkae/c6X1UQCSKkXFwaMpZ17T260v497sCo1FzfJot9
	kGnoTpF6282xbaC7iwoXM7+XjQmQDfXztTihJ/Ol6kF0PM/m+mL20/j3VOVzeh+B
	9p4MWQvtE50aEqkZLnLEErlUQ9XwB9o7dQJTdbovILYqpajw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ufcbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:34:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so59105235ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581696; x=1756186496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVZk2H67L/WBxeFp1Wyf1SK0wuc0uW8l4sg8p00ph1Q=;
        b=siSKkFXgjY15O1vadNLvT6AKXz5qC9krmSn7VYZK0e9HHrOqEKZdbC3IlZpqY0DMPp
         Rs6ckRW1RhxKr3oOIwN+Dzve6ag4RGc5ZHLb9ucUc2uPJnD1FbxEVvNioJGVvvGf9kdZ
         EMy48HkPaJ4e2aU/2Mi1E1N0N30SdZKAcPZGpRc2Jrz5jRtu9u+wH/Ulf34yw58ZrXFR
         PC+cuH9tW1pfyfc6c6TtARZGrLJT25FXrK/btyT1knHQDCDAieZj4amHZuWqoNp06Gyc
         PicZpf4GEsOWOg7MdrqraJ7UMGxdVwaLMC9ivLRwB1MJccBcBsZrM9Gr+Df6SkIYbzuB
         pFsg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+wCddF21b512urSs8MDcaUAC0u+H0ZfeN1Fdzb7oug3NpaeQEy+YV/Uj+6t+NT5tfOOyXPDRFAGPHPyW@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDMtER9+anKl4HPcoSPHy8RVq6JHLHXEsbu8dFumjWf7crY2m
	gtkUMD9in2GBtstyiIn5Y+Mxvi1KbX8Q3KzkjV2L79QJ7/W7F277pOvRfq10jMKBftR3o4kqWzE
	V/i0gz6YnWR73fnxnD79zu3+uWS9DEWg3JH9BTLPdziO+GhGZu5fFD9TQGshhYgcRlJLz
X-Gm-Gg: ASbGncvOWZ2EANiAFFDkDyoNfTkHGh/MhvLff/Ta689Irj2fjUOaqYsOf9DCnb72fyX
	P9WbEIrbxQa+gkzafmmi/O1X2YjccOsffS6B/4IFFZnXJzKlxJOKrTUjoZJDO0zBuWf4j41GUeq
	t5ujfy3Jr9AKjbg72cqrQZlhfMs/DylBeVwJglIezcWC6M1k8NRj1S8sHAMYWWF521oEvbhjW3V
	HdQeXk3mntivi4EwgsQP6ETduUBEFiXzwaJEsy6gBK9NAsn4U5mCnGijWGYMPY/RTLY/ApXsRfw
	eLn1b11cHVFKccJY6io09yz8Nd9bxl8F4G+MTXOqN5HoQKRNbhLeTLpFB8QV6XVs1Mhpqn9QeYM
	=
X-Received: by 2002:a17:902:e943:b0:243:3c4:ccae with SMTP id d9443c01a7336-245e04daed6mr20517145ad.49.1755581695947;
        Mon, 18 Aug 2025 22:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5YDHiAEug4URrgHRdTWxQhKxSO/jr4WB7YjQEHWL09fZuEQUh2DeUWHL+iY+53aJtoaRPHg==
X-Received: by 2002:a17:902:e943:b0:243:3c4:ccae with SMTP id d9443c01a7336-245e04daed6mr20516675ad.49.1755581695476;
        Mon, 18 Aug 2025 22:34:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f710sm97004785ad.86.2025.08.18.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:34:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/3] OPP: Add support to find OPP for a set of keys
Date: Tue, 19 Aug 2025 11:04:41 +0530
Message-Id: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPIMpGgC/22MQQ6CMBBFr0K6tqRTKAVX3sMYA22RSYTWVhsN4
 e4WNrpgM8mb/PdmEoxHE8gxm4k3EQPaKUFxyIga2ulmKOrEhDMumARJrXNXp9BQ2RRQsY53AAV
 Jc+dNj+8tdb4kHjA8rf9s5QjrdycSgTKqtan6UnAhoTvZEPLHq70rO455OmRtRf7za6j/fJ78l
 BS81E3dVHLHX5blCwDYvZrnAAAA
X-Change-ID: 20250717-opp_pcie-793160b2b113
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755581690; l=1992;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=OIx1Iyga7xol/jnwq90PT1IW2G315NN22lx0c4JUQlw=;
 b=W2tUO+yuFOyuQQzlAiU6aTdVmNDccmjQW2ybg2rMLmNVV9fv8BkrkRBJAtL4lSdlXdX/H+XES
 PIOdHES99COBHlKljUzx+qf1rdMrwbc1GXFol29i1HcgS83xSTlSWoN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a40d01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=76l3OPsZB85xAofE:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RZHP3SvTWnTKgiXxB68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -X4AB6qsjUGoOhgwWcEIcSOiB9lZ2HCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfXzW0PMGlukeDg
 SYMSUXQXEEYHp9Q813qtNg19WZfgz0SjDr6zV7njwgkzVZhqFWo4WudieBnLUKCUcOvTLuqfwF3
 l7WXGfiWKeS+zTyEjynCjUzeqy/jUZEqy9ya9Kt1pHGmud2iOdmo5J+W8EqsSUqTlazuj3Ylm7f
 DRS7zXe4tsCDcQCKRjnRa1h2w2hFVlQ3FLWru+DN27U9u8OQMurcre0KT7d9fDt4q1smSmM2Bsf
 QHUrtTg2Hiy0ZAFzzWAqKk7wXeTh6Qz5tHUUHOK9RTqfeSHzgWbgvo5ShGFqwb3pdSVTR/UMUp2
 PU/rVdP44gl+4wRNCahTY6Fx+7Cw/OiatchZeL/TunxlARRFU46Ax1HebF95xpHekUXLTpXkLz5
 Ms5NPGW/
X-Proofpoint-GUID: -X4AB6qsjUGoOhgwWcEIcSOiB9lZ2HCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

The existing OPP table in the device tree for PCIe is shared across
different link configurations such as data rates 8GT/s x2 and 16GT/s x1.
These configurations often operate at the same frequency, allowing them
to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
different characteristics beyond frequency—such as RPMh votes in QCOM
case, which cannot be represented accurately when sharing a single OPP.

In such cases, frequency alone is not sufficient to uniquely identify
an OPP. To support these scenarios, introduce a new API
dev_pm_opp_find_key_exact() that allows OPP lookup for set of keys like
frequency, level & bandwidth.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Always check for frequency match unless user doesn't pass it (Viresh).
- Make dev_pm_opp_key public and let user pass the key (Viresh).
- Include bandwidth as part of dev_pm_opp_key (Viresh).
- Link to v2: https://lore.kernel.org/r/20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com

Changes in v2:
- Use opp-level to indentify data rate and use both frequency and level
  to identify the OPP. (Viresh)
- Link to v1: https://lore.kernel.org/r/20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      OPP: Add support to find OPP for a set of keys
      arm64: dts: qcom: sm8450: Add opp-level to indicate PCIe data rates
      PCI: qcom: Use frequency and level based OPP lookup

 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  41 +++++++++++---
 drivers/opp/core.c                     | 100 +++++++++++++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c |   6 +-
 include/linux/pm_opp.h                 |  23 ++++++++
 4 files changed, 160 insertions(+), 10 deletions(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250717-opp_pcie-793160b2b113

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



Return-Path: <linux-arm-msm+bounces-69503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0EB29BF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7B73BAEC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3AA3009CE;
	Mon, 18 Aug 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOLu68f4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D42797BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505392; cv=none; b=TEIFH2Y6tzM7DBUF43g/S9NKsGYkeFjz9ZEd6/4WNBWZFyQ7lIlZtctcC1GKAJdaMh+iE2NE56j7olbEAM2VaVrVddd4u9xovZH5KgJksZ0vGOcGLID81OwOyGtySAZDtbsTBG5x+fAnqYWNT0a5WwU1h2zNt7gDfQ7uSYHClgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505392; c=relaxed/simple;
	bh=GvZqiBCu+/F4OQDyTy9j/Xj81EpQEyqz/k2GQN1r4pU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cKbucZq3l2qgfZHXKnjjfwJKa7K8deP1/L3+O+nBap5QZ/4uKYKvFG6g4wvzaCt0vNMtzJkgpnxxT1qndbgx9UpP6eAs8tbP+XaSfT4bITh6n/idxjZJzgzrP/Runx7AEf6hhTs3O1AXib5R2fB4f4ovtRsgTWAIS4LDj+vuOVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOLu68f4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7xiWK004737
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSUvaZhK6DTL7YPkhrLfaa
	kOI/BNtncTWIEPa/JXSuY=; b=ZOLu68f4ADeXv3xg7FtI37VK4iO3X+qp2QpAQF
	CAYbZL37HMIKkX9nTC0X/OM0ccxUkkWu7HuwOXiV/+9s6oLcn3o1ZPPIFrMeg06O
	tWToNXAXDQJu4/Q5LVlIYezsLWZNn8Lu22dThoVy2Nw7BTU83Sb3C+KZ8gkNxXuy
	UZf+Dva3b7pooojTNMYkAQbILADnnLKPuJ1nh+SPPAreAbVEULa/7L6+kEsKC1HA
	EZptiA+kXDcSEnHH0yt6zmh5CeG5jfXTa9BP8W+eQqd3j3gS7yyDkuGi7TGfCvYW
	6aab6qubOERaoMvFlCzms1QoQAmJlqz7X2pob31zNX2SLnHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7uwgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:23:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582bc5e4so45876205ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505388; x=1756110188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSUvaZhK6DTL7YPkhrLfaakOI/BNtncTWIEPa/JXSuY=;
        b=K9ihJ5T+pPCwg6d60bTqOuci9FQJ/6JD2jsVF23u3f0c4rm809eGNeATnGXcIiaWhQ
         RjdZgL2I1V+MlUiyrmCrdxNY5CgDgPNtiA4TbT4g7Taw/UFXaYGhD2hTsys7DT8GFMha
         J5K6ETUlGdAJHPUSenCpEBo/XI+0XMEi4OduEQL+JkObBzsG+0ASovgibI7XZ+B+lQzm
         5uU0FP/B3J1zIYfSfhxKLJU6ffUG9Yg6HfhFUmMi4jcFoxF/psTgCFsB4CeYYEKniwA1
         e8DbfuvMBdu3tkvilwJ0Sjobq6PsKMzGCHTfGqESi1D/w7EjrPs+lxfHclDzcGUdw1EQ
         IUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZZota3gx6j7PWd22StoJKI431rzpipL0XJH566EJwZx5EZ+/ZOfHsaPkYOcip+bwGqIgzVWXIU1rb0VBi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl73hznRfWXYdKLWPbRo9xsYwNoblTU3SAibIU2vyiIDzLVp9n
	+v3JRUSXr/c3LoqNx18S4X+QbY8lR7EqxXbFE2AS4P34x+2doc0s5OA0yctjwPYU3laP8uRvTmq
	okBZXsG+XjB/yyiJcjorwYd/+hX43PT+WjUePboikxP60suGyATUnFI4bBFfuz3JPf6zT
X-Gm-Gg: ASbGncu58sr4b4wlkdvkMDj/k7Ma9YgoFFY2eseVDgkwnHClDO+tlR0fwyQIdz2TVwv
	PUPW2zhx5+4SYwDtshUfpJpqeRhZg401qG8EkVNUdFIxoUqO9635vw7kNkO3VWCFO1Yssb4HiDq
	Yp1T5MhAgm9s95hmgq/8WTnurBblPlRiLXG8KJJ7n7J21KDNEH8ToPu24cqQ+uZ9VXbqQ40iWEY
	jl777LEz7GbWBp9Ykdkb9pMGjbBjMVwd4oGqovy8q5UdbxkpVyP0rbDOyABqn7LmqVlY8NS6+YV
	zJILtswTCVFI4GlvVqwDgbAmPUBFL1gbTm2lbshlQBpNQlPZkN0xhYdK5drwzeZ3kIUBYmHCiVk
	=
X-Received: by 2002:a17:902:ce01:b0:242:9bc5:31a0 with SMTP id d9443c01a7336-2447900399emr125251375ad.56.1755505387688;
        Mon, 18 Aug 2025 01:23:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7UKH2BYH2s2muvdsSEjdw2nQNlCqECvUztT56wJ2uYOK4l3Qbze4nYGd1xgDsxqUBdiaTvw==
X-Received: by 2002:a17:902:ce01:b0:242:9bc5:31a0 with SMTP id d9443c01a7336-2447900399emr125250975ad.56.1755505387201;
        Mon, 18 Aug 2025 01:23:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5536c3sm73225155ad.137.2025.08.18.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:23:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/3] PM/OPP: Support to match OPP based on both
 frequency and level
Date: Mon, 18 Aug 2025 13:52:52 +0530
Message-Id: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANziomgC/22MQQ6CMBBFr0JmbUmnWBpdcQ9DDIVBJhFaW200h
 LtbWbv5yft5eStECkwRzsUKgRJHdksGdSign7rlRoKHzKCk0tKgEc77q++ZhDlVWEurLGIFWfe
 BRn7vqUubeeL4dOGzlxP+3j+RhEKKYaB6PGqlDdrGxVg+Xt29d/Nc5oF227Yvr0prO6cAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755505382; l=1749;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GvZqiBCu+/F4OQDyTy9j/Xj81EpQEyqz/k2GQN1r4pU=;
 b=NBAwXcG7xy7dEOrbbtrG0I6TLEChSDdpm/jiSfgUFG+NXMpWpkBgsbzHUSa7RZggxf6xaXxrI
 /u7NoIGLqCZA3C3wP9fsxYaiTdLowFRfO6L/1BBBvVojZVGkvBzT5mw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXw4T/ypZ/ik9v
 +9dRRJEFzovdZDC3MUD/YbtvZW7HkSzdFl5E1HPKORmGAP8jUe/Auv45UEybh5P6Iiv6eVwbuVf
 6CUu6c2aKq/4P8bOEe51tQt8OdiVpsBJbik4bK+ctfnEb4TozaDQle+mBmg2LUDEqnnepUCy6uB
 +QtaE6Q70V5yxZtL8Rhnq67pidw7la40iRE9mmgZ9GIpGgo/knVlT2tR/iUYeSOF3vBIJNoKuGg
 bAiNuUPD33T8g39Etfb0LJMBEmbnJviO2RN6R+GR4zIu491R+iBh9WMT8evJYUyn/trNEGMEDSI
 ZKXMVX0eFcLfajHaHImuxRDoxMk7rYPdD2oyNMkn4RpnNr7nbP2oMjiYvX27hUxa8wFQlOAgudB
 bmR2cQ2e
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2e2ec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qIbWdXD6M1inJYch3NYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oGvgBKgts_ShqFkp_iX-bclJpFTeAAcx
X-Proofpoint-ORIG-GUID: oGvgBKgts_ShqFkp_iX-bclJpFTeAAcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033

The existing OPP table in the device tree for PCIe is shared across
different link configurations such as data rates 8GT/s x2 and 16GT/s x1.
These configurations often operate at the same frequency, allowing them
to reuse the same OPP entries. However, 8GT/s and 16 GT/s may have
different characteristics beyond frequency—such as RPMh votes in QCOM
case, which cannot be represented accurately when sharing a single OPP.

In such cases, frequency alone is not sufficient to uniquely identify
an OPP. To support these scenarios, introduce a new API
dev_pm_opp_find_freq_level_exact() that allows OPP lookup using both
frequency and performance level.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Use opp-level to indentify data rate and use both frequency and level
  to identify the OPP. (Viresh)
- Link to v1: https://lore.kernel.org/r/20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      PM/OPP: Support to match OPP based on both frequency and level.
      arm64: dts: qcom: sm8450: Add opp-level to indicate PCIe data rates
      PCI: qcom: Use frequency and level based OPP lookup

 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  41 ++++++++++---
 drivers/opp/core.c                     | 103 +++++++++++++++++++++++++++++++++
 drivers/opp/opp.h                      |  13 +++++
 drivers/pci/controller/dwc/pcie-qcom.c |   3 +-
 include/linux/pm_opp.h                 |  13 +++++
 5 files changed, 163 insertions(+), 10 deletions(-)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250717-opp_pcie-793160b2b113

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



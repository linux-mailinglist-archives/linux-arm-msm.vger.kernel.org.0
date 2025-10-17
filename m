Return-Path: <linux-arm-msm+bounces-77764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B0EBE86FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 13:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA803A3D17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 11:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12F6332EBE;
	Fri, 17 Oct 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9+czvjN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E5332EB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701264; cv=none; b=GICPlMu1uQi3a1yLL1KYHhNSC9FWoRltIk9uFCFPq8l46S703fcnId3oFuo59O2shTSTeD2eXzFtAWUdEIQhSaAeuLWy+LA6ZevOmzCTR1a4XWcexmYlYywbpWHLntsYUSfj7U9koUPEFjHMHCjMkgDlH/Dw/IgUXFKj+/mUP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701264; c=relaxed/simple;
	bh=M6oHNRR5dlFPX5JEy37yFZ5TtRSAw19n5ny/DK3/HhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cyF7y0PnKnqYRsknNghIjuuQthmOYXDqOC5g8rMu32kfMV3avV7WN7/vfiEUIXMrz3akrWcFY18DanR6rGlX/POv0dyj2apJ4xgAOqCa+CHhx6aMhvlQxPLJWUJiq2MfbFsSa6/FJwS2MlWxccbS7eLEjYSWF5fww8TUzFPq4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9+czvjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7o6lU009689
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Dvs+F9iRc/LZxLL9MWhmX
	ciP9znGuKAC6w03W6C6Q4=; b=O9+czvjNiHlvcrEgno6XKkTdpRnRxVKL5XhIPk
	7UQdmGv99WqBP2pKyuWtExxV4d6DX8vAXFTPmYBVmJu4dlF/WF1OSAO+wPms8mki
	FaVlfM9MI9W3YF/jrJ60ZQk7bexgq9co/tkurwpyFzMallKPj5faKlUOkiY8y3GR
	OzDMz1Cmn7/0cAmfZfbCjX5mTCaiU0o2A37/JR8k1lHKaZGLNpUG5fPkCU+vEE4b
	Ov3dd+ZWT4zb2xRMqh5XAOdQLTweffa8HGzTEY53nXEySrt6Fas8WdA786G8Nu40
	zHGTWWUkwunbGCkw/OP+KOpT3o5/P40pv9bI5iNLYGWc3clw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbwpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 11:41:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28c58e009d1so35772845ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 04:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760701261; x=1761306061;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Dvs+F9iRc/LZxLL9MWhmXciP9znGuKAC6w03W6C6Q4=;
        b=b48npMLczpEPrroo0K9Uj8Y02dHhbNKna4j7QG2f94xuk+GEqSBj/IbYVPKJ+ShSiW
         9SXWM4r28YJlZx/9/o/8FCDoXuaQhpwCvqB+r8FFEzHooqF43qwso4r96iJOjsmZAwKE
         Mmhc2IO73x90Qg7/ktg7q9ktrurx9JxtvGlL1gEkzln4JiDls9LO/XaDjEXKUCSJ5w9V
         ZUTBBokWM3Dzx4f5Rk2rFexnrDC3pqBb36y0ywlzuKmxKopaJepmhh0/S/0qzX18K+h3
         Z7AB0Kq4vMWI1u9FYOCjGVvOtUMx4PrdEoIcUa6Vlo33emSIKJYEdtIcC8MUR+oBKR8p
         Ging==
X-Forwarded-Encrypted: i=1; AJvYcCW7lqy2wF40AtZOLsZUaPrWomkWZlgA7sa9YXDiQISHs4ixFFx3EDGx8QmkuNhJG/D5W+L/lz7ylGRaNNHy@vger.kernel.org
X-Gm-Message-State: AOJu0YyOqclVq45Tju9TZru1qV/IltUUtduJ/ftQH4W7rLDOlZgx011S
	cCqqFiqWzgyUodMamvfFBkMAoNNE5xOsAhTeYs4oyjfgtAHUKPtyTjFvgUbReA++HEyYWdhGUJK
	RmSwcq39xQkFRaP8JiTSX2AqF8slI1Rrj1J78k4KOZTnSuCz4fg3zk/1P9Mq3Fm6P/wG3
X-Gm-Gg: ASbGncsgH/NYwGXc3bKROmnpaHGeel41NnTA8+pgr8b/up+gOXvg+3Cw4Pw32lsu2yn
	6wrdWkt2RK2Yuchcx0+MxwABfawACDcM8zzdiOzEdKasJUIzmPmqJIdprIU1qQ3kJB3syUr/XNa
	p9wwaddufY4J/6pTf6jCsp/qs78w3UvZ0644V9DQyC8suf7yKsbUJDDd2F5/2IG1pr7VQnTKokT
	ZmJu/sE2YAZjtTovzlGdK6tPOkiU9iOxJuLu8uK2w+CXTBVi6bSTwVH6g6jAyHssAC+AUIniDS+
	EEBrAtxCIf+auP+YLCi4Cx5V9O9v0MTRxGHrbPi9DEGOfr2ZV9BZDcdx1xt5K6kbIl08RWNLZEA
	d2Iq0VNgKwiQLOnP7912UsSVA201FBKEKgg==
X-Received: by 2002:a17:903:19c3:b0:267:44e6:11d3 with SMTP id d9443c01a7336-290c9d36c03mr39709495ad.21.1760701261427;
        Fri, 17 Oct 2025 04:41:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4oDHAXVAXNMRAmy5dRggblbTIjjpbkAOgElQ9q/OQj2LXAR7K1mSO62iOIN0oWbcWoxYnPQ==
X-Received: by 2002:a17:903:19c3:b0:267:44e6:11d3 with SMTP id d9443c01a7336-290c9d36c03mr39709205ad.21.1760701261008;
        Fri, 17 Oct 2025 04:41:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7de45sm61489675ad.54.2025.10.17.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:41:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Fix ECAM enablement when used with vendor
 drivers
Date: Fri, 17 Oct 2025 17:10:52 +0530
Message-Id: <20251017-ecam_fix-v1-0-f6faa3d0edf3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUr8mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0NT3dTkxNz4tMwKXTMTwxTDFNPUFHPDFCWg8oKiVKAw2Kjo2NpaAPj
 iweZaAAAA
X-Change-ID: 20251015-ecam_fix-641d1d5ed71d
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Ron Economos <re@w6rz.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760701257; l=1150;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=M6oHNRR5dlFPX5JEy37yFZ5TtRSAw19n5ny/DK3/HhE=;
 b=zejePTE4BD0Qu4XAYU3th9wsZhWU9YwDBrfTsCJDr69zR4jht8IGoD0vpvmz/5lBALq8YWqID
 GBYvCIYqzMJDkaeQyjzZvWOFMxy/HpcMPyb1Ufuy1WkNOw6M6561Ps7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: KQHjwRsdI2jAeLV9oQEB7YO-b7HQz-8t
X-Proofpoint-ORIG-GUID: KQHjwRsdI2jAeLV9oQEB7YO-b7HQz-8t
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f22b4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KRKipztoQesxEaMeAmMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3JN7ohCU4nKw
 BsrkyiOnm24OvBGAs2hwLR3jXM3d83tXyla2GI8/EupDNYb3OhwazCZ1lGf+pJWablYov/bijOK
 uX1ofFAHZCG8fEyO6enLt3nT2QHZv36NL7DYxCquhpraZ8dgWrBVqpHPcc5JPvkzuFUhwnclU6H
 grq/LQOIfGQU/8g+N++HpZVa4cicZDnpHTNp9GTtElSpushLFEb4hLBThAnrwAV5mScPPgq6uOb
 +LGjyB/IGEX0ruoFvCyLKaUEQ2l9/oH8qguJSqYuEsUTCqoW1f95pQl7q2g5SIm6Tu+BNLjrndV
 XmE7o90Rr6r65OiQ29iJa5HdICHr42QsoN/mPeDFiR/HumZ802hjD5dG9PY0DzjHnpOEQOejVWb
 en4kF7RzkVaZneaDmZxmtrNKISMFAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

This series addresses issues with ECAM enablement in the DesignWare PCIe
host controller when used with vendor drivers that rely on the DBI base
for internal accesses.

The first patch fixes the ECAM logic by introducing a custom PCI ops
implementation that avoids overwriting the DBI base, ensuring compatibility
with vendor drivers that expect a stable DBI address.

The second patch reverts Qualcomm-specific ECAM preparation logic that
is no longer needed due to the updated design.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (2):
      PCI: dwc: Fix ECAM enablement when used with vendor drivers
      PCI: dwc: qcom: Revert "PCI: qcom: Prepare for the DWC ECAM enablement"

 drivers/pci/controller/dwc/pcie-designware-host.c | 28 ++++++++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 68 -----------------------
 2 files changed, 24 insertions(+), 72 deletions(-)
---
base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
change-id: 20251015-ecam_fix-641d1d5ed71d

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



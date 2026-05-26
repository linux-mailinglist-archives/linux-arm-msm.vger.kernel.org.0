Return-Path: <linux-arm-msm+bounces-109756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FrYLvtjFWo9UwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:12:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A6B5D3106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 430B93032384
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE17F3D411A;
	Tue, 26 May 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USZUTzBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kN7ni1Xe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D37351C1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786618; cv=none; b=d8DwhHo9fpfEIfvahxTlfEfowoWLvfICKiFynM5mcSjoCzIPbO31z9PzObvxYNTRSwtVd+IsemKU3TdWJbhou7BvgWhw5Y2SjynJQ4oIptrGEn99w5BYN54p4epGmQcjI0MSHQISCUJ3IIl/dB+GrfrAjYmVDsh5MwUYWc66QYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786618; c=relaxed/simple;
	bh=Jh4GLxB6Rml7ZWF9Pmj+De43LcnXHClRiwWLaGtJ/UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=edfUIbdF5+b9XK0/zn53DrWjRsoiUVk/dhaQe3OoCjVL2kC8rxbhHC2eiRq/0U0K3tafOlss4IhT2rJTf8rxZAclC3w4xkUlu1zakPLy3UmyVe1eVHPBQf5hBCnoQXt9YabUL3ZCqHskIp3ml5m7fhfjSqHt3t2SVvodEzFAmKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USZUTzBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kN7ni1Xe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60dFF1763329
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNN
	durUkg00=; b=USZUTzBg4njH+5H/R99S3hfvmuV1x5rFLxsREzth4h4en8DAcwb
	PFfU31E6QSzZbxRMa7nXVE65qBYIco+UgZlVNp7NLAef1zxXb4SJ/9PvGPfK7MvP
	6R4xlIackLmYwSJ2yqCK3qHsHrXC4edEVwGK+dc25YuAAhH0eOfizcquCH6qw4zK
	4+SUwXzX6cH/ooTohGOU8ddRf4xObEakPTJu/j/8pjeJOH6IzAWYltPnUyMuBwEJ
	rGBL/uuDM7ciXD4TEGwFRdz02sysfCdcQiDkzkb8lYd97jXel7hWKlVRyTD5EaaN
	DrjvKFZL1MrnJIjFhvD6txpTibGSdtyfEwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggrp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso104704885ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 02:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786613; x=1780391413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNNdurUkg00=;
        b=kN7ni1XexcbzHcN/UG1QMsng2QQkgkoJ+EtZRl12xhFg8ej4txINfEw5zD00APnvg3
         FIYz42CB5umCp877THr240hQVtNdK+20vJZC6ObRNhDgeQ5pF0SxsOf9X4wJKn5LFv2R
         NNS5vv4lBT8Dnd3tr0FE4kGva3KK/qJMqXCrQsa/e4c2qabSOZhwIErxcQxikgYvuW0E
         jMQn9FHgVuS0Ur6Ds2hBHBXJOhWWqYTcoY6/FBe3mfRtrpZfwQI4llHMhd3cyfcEHUDp
         hD2Kcv904mCl6U5sHTo6PwcNNV6MKIbDUkyjL6LBi6x73nCkndvoTwB0yID1uZhj/jWf
         0yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786613; x=1780391413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4Lq8YbuP0exEB+3/26cPn4yY9bT/1N5VNNdurUkg00=;
        b=fWbPpKN4V0gLkxKgDbvHMEwPoDTKvURIVVA5GzImyyamard6bws47zSwu7IjlDCCVh
         DdLxq9CHhLaYUDxyZ++MlvF86/haXNuIb+MPoIEmjblxJtHvDKhcJCpdP5Bb6CeGCy1x
         p3c7HWFj+D4fJxUwp8oNjObst2S9kv4i9phi1+I3/L2/+gPmn0mRcari1UqJlLBRML3e
         iSSyqegMn93DcSlvLXOCvq/onygbSe214J4FdADRhgRRUiqTDFRRg0pXknR6rAgiNKBb
         49bHnR4qvhkku3ThU8QCHV1ke1aZ0EvQ8juOFDKhRv/G/h/hLbL77gGO9UBxpiTxOgzd
         0FMg==
X-Gm-Message-State: AOJu0YzZGU9sKw0KcTeRCyxAi8QFJ1pbNubitkTC3fLNU2yn6mDGo80n
	IV52mR3r1e/hVYDhzZuH3Yj2VWMx0+gz12FRvu840A4mADD5ln7ebSfX4iVs7xxQRt3zqee/MMy
	GYj8hKKVTRlw/8p8EB90VD8ugXhjmlSQpUleU2DuMfIyd52SHx19qihGtU9FWU9QBL1uV
X-Gm-Gg: Acq92OH7OVgyRpgz8poGNb+FYrh/BJOH60V5XYmIwCJ+SGjAlPMiiX8cyEeumC6T0q+
	Y5Q+SZhVs/cPxxX2Z3jjdpzh1hf2i4/dwcAXXH7MKR/NRdW/AcscgNNouwWpHYh8Wq3kXW9ds/o
	kZJfYjnh1VZx4LMeZNxXN1vrZWCSmZNf9iMyalx49yngmT9NYmxRF3rOCF+AJpmxfZxym70gJPW
	D1iJcWHJh9oBulthwOx2KAOqUCxNl45aCMRlXqOiIRZeYr8LIYRsTS8VB61BUDtyHxYMCSiJoSw
	at6teoq7uOCcevRJKCPAUn32BygJXvO7RrigBglZumUWNGdLh07sxNIMbWCveC7lV4n/PeNBi1t
	+2PuBhaRc/Radv2XkFtx4S3P4uL3AeshR00bt9gF17l9+nFVgBgVYwA==
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr206020635ad.27.1779786612603;
        Tue, 26 May 2026 02:10:12 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2beb06a63c6mr206019725ad.27.1779786611626;
        Tue, 26 May 2026 02:10:11 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:10 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add Hawi UFS PHY and Controller support
Date: Tue, 26 May 2026 14:39:53 +0530
Message-Id: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a156375 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TKnaYtv_j-ekGf-2yHXoola8_Q4hli0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfX6gv8+gqHV46G
 NzXl66by8QJpL9e7fbygAFCqnrdF5gp3K3droWlyFJBqS1dO+62ThJj2U3eF98Qzv6imDcpNbCM
 JDcb1H83HX6/Mnr83ByucU1TQ/UcD5B1PdKqdSTBsMe+I0zdwREOoJz0fvHI/XDOsp8UFKyj8Kf
 fBTX2+IdPou7NsFYerUKBwaKI6p6D69CdIBB+VVHnnbNmA9jyXcRhPoToVrW1GVv/tXpna2IM0C
 GRSyOG21X6eIDhQBpYg7+3/FZrP3xs7SXXJ4/zU+0g+iJnAstDPeBIdl4ZyHsi1kxeIrl/HFXn1
 +tbpkOpmUIgm8Nc0KgKI2oOnKmPKSCgVVfYzwt5XTO8lvxE/0mlkYEzIlgkaIa1Kfot6SGESffW
 aSZfGSMD7OShR5+0GeZWREKBrGuJH0oeUHks4PvF/V78B53VdxgZceti9BKHcoWTn2bkO+47TAe
 OCNakiMdFZOe6j9vbkw==
X-Proofpoint-GUID: TKnaYtv_j-ekGf-2yHXoola8_Q4hli0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260079
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109756-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34A6B5D3106
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

changes from V2
1) Addressed Dmitry's comments to remove whitespace and stray line.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 5 files changed, 204 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-78284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73745BFAB08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4AA42562D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A692F5328;
	Wed, 22 Oct 2025 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZMVnFny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C0D2FD673
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119534; cv=none; b=Ow84fAQsQcRCLsB30PjBCYc6C36O/HAmI9w5hz0czVp77y1TQ/AAicLLVDXdUouxXrsAra5FyQIbQt6MuS9dU2/LYbzD+azhuM6CTYZRS0IjmrttHM2nb7z+Cbl058RrwsiBMTaE8a4/BFwaWsE3Rfi3bdn+y3zcZQCjIl0NvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119534; c=relaxed/simple;
	bh=J/90TQbFdCgoh5WWkO3h6Le1FNJsf9C3aI6j07Us/Zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXKA490EPhnfiGhmRBui47iQ1LBu+RdVLkItFRTPzd6cmW1DxYImicKLVp4lHv6NxRviGBHZDVTcy+AKPCWNnMFo5dRMbSVIIgeIIxQrtCEIHwKcIHiH5VoVxB2BHT+nteEVpwXkg0hHOwqm/K420Kp1AvjVFXrqlOMaXFc0IMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZMVnFny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2Jfwi004550
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DPmvEIE8FlpuHaMWc6yWJW
	SlobjKsCAmEGxrwVOFSo0=; b=KZMVnFnyFxXDany6UgqO8LmgciO10tFG//aHNw
	9AOw68AQgmsfgYjOeObdzI/u6NO96Zr8f2fehgHN0wrlHzRmlbPRjYANaNSu5Hqz
	EWrEn6//gbVeb47fUuB3/+iY7O26Q1noU8tGO5+CTXLYcciDZhpXxkovMhEYaQZA
	VUkzK6zl35gviEsKCrs3iRG+NgsB2gp7inJskrr3WXO3bx2BTYfbE67X2y5Yc/oG
	ZaMwN8A+IyrYDlSR+v7cSty+BVgOy8BOmzLGQHNf/7NtfwHF52LHFhamDad6efft
	2O6QnSV/y6mcqspqvmGS5VEDJ67u3yu9nOkT/OXqOjd1DYGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfkq4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:52:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290b13c5877so131667625ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761119531; x=1761724331;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPmvEIE8FlpuHaMWc6yWJWSlobjKsCAmEGxrwVOFSo0=;
        b=YsvXO01icno1tfow5Z//ZKRZK3L0fSPOwmzrDig66X4nj5NgGx1s8XOgV1G5OoRfMd
         EhoAR0GGJb3JgES72WOSYXLLQoGwIj9DWPKXXdCLlrh4dIqmrSlzd9DbkSjzfY7tlZ/O
         vxNkbx3OF8hqHL414QhVQZlgUPk2F5+Dh4eePVJWnJ5V7B9/a1dqIh6LdRz9qLD9+yKo
         xMDrnC5pXolH2NAmeAp3TScMQNzFfPcJAFdqw+q8SxU+8uUbiZoozEpn87Fs2D0W2S6l
         qeIJ20Nkmb742N/sdyBSOipfNl5v26DhugRNRvrbFpCPQ0isy/CuUnimMj6VW0Ld6fiU
         OrYA==
X-Forwarded-Encrypted: i=1; AJvYcCVRtTGSfSuZufv7x3fKggTx6ThBSsDzZL7OByFLC9lE0Vb3QgoCOfxrjf8eupYh+xSlG3BNL6r+0lUc7aXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPiB6k/WxWhA4VFf5Bkc84jx/7bFdzW2/bM7kSjQ8vVOWhNwZO
	8B8WjSBlf2J0UOxSV7NxsG/lHdls0UMuphCvYoS0S8ITBMRH8cY3v/H7uFPa3wgfzSa4xpEnpeL
	s9u93JMyiOOd9dAqOOlxHQNFTtJ36sZYm16EuYedOy1iyNqBJwlUwiMJa8la5nmI2R/vsUJLY1K
	wQ
X-Gm-Gg: ASbGnctKAyqRafz4IKACrtTtvHfhAROClQM/DD9GOYbHh/XZnSHH4aXINl3tl7mpvFY
	yXcxVsFfbREj30BfVJNp4hqu22qDxeOut+Eo4IlQrf3zJmwNyczzrLFx69/vn669wzAs44JchgW
	01MFAJ74YuvMjSb2LUVNz7bNQPm+ozA+XX17rd9V6MFMh26qBcpz3w8Q8WAgP72H60mOVI5lfkG
	ipZn+wmehLdgkFASdA0+ox5zaf8DlEZGJGUa/WZCt7kNrC6VZFE+sUhqUgRE+0Qu1NDlvBLoe+l
	eRlw4H8TeY/qICkiSXkiDAdPnf/KJkhdQ2TTyP4oQMCaj6E1PEOKsF+RyAT71OgftF47Z/AKO+P
	xMpfqB3u51QBMUiyVUV9MKKyaY0PeaPgoeA==
X-Received: by 2002:a17:902:ec87:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-290cb65c5a6mr230159865ad.45.1761119531220;
        Wed, 22 Oct 2025 00:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4K8gARg09FJVPfkVnVqfI6o1el0oPDHVpa0x9imn1Oorz714MewTKuS4CSpiq726izRzsJg==
X-Received: by 2002:a17:902:ec87:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-290cb65c5a6mr230159685ad.45.1761119530739;
        Wed, 22 Oct 2025 00:52:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe2c2sm130962275ad.79.2025.10.22.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:52:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: dwc: Fix ECAM enablement when used with vendor
 drivers
Date: Wed, 22 Oct 2025 13:21:59 +0530
Message-Id: <20251022-ecam_fix-v2-0-e293b9d07262@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+N+GgC/0WMQQrCMBBFr1JmbUomNS248h5SJGQmNmAbTTQoJ
 Xc3FsTNh/f4vBUSR88JDs0KkbNPPiwV1K4BO5nlwsJTZVBSaZSoBVszn51/iX6PhKSZBiSo91v
 kqrfUaaw8+fQI8b2VM37tLzL8IxmFFK53xnQkmVx3DCm196e52jDPbR0YSykfVCVdpacAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761119527; l=1313;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=J/90TQbFdCgoh5WWkO3h6Le1FNJsf9C3aI6j07Us/Zw=;
 b=vo34Dz7sxlIswBIIP74F0bWqldDvPxdaL8dMP3smt5FIhASG9kExka7DTZX35BoMortsAmyQJ
 qf+N0V9qlR+AJOx1rVcvDZOnLGc/MX6KevnRq9tFQu+O8eFHCbfKJzF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Sd-mtr8PwFAQN2u4hu2rF26WP-AlFgZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX0i6iBns+SWBO
 LsGY8Oev1yplUeAocTIkmlwmzl7WsGYax9D3itgk7iNyEOH22CHpkB21cpZ6vMuJzlMBV4iIb5I
 oH9wu3xzaz8WsySVpevIIjdqn1zVx2Gr6D4ujirJlfNXU5YK/0TeBtip+6urGL/YL8kY6CxvUtx
 /Uq7Q9VcyjQFAgDHuQ17ihOd8hkDNM7ryYUQsooFADvirBBc/KOpvVMyRo8dQOW5eTJIbaz+fJm
 vZFADF8ZJ7c+qs1eP78L0mjwmYDV+AA1CZo1QE998dL77x9Py300TW/+Ak7IAjgBan3O3NanWOM
 W7kqGqdCiBduPL0NqNuPjuBgVyrabqRgCO87Idt26MC6CHJ8Klt2kkhfzgvSZ23B+t284oYWHAu
 plNN0NygQJ1Ej8RkqDZWjhFRnLSZcg==
X-Proofpoint-GUID: Sd-mtr8PwFAQN2u4hu2rF26WP-AlFgZK
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f88d2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qIbWdXD6M1inJYch3NYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

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
Changes in v2:
- remove bus0 is for root port always(Bjorn)
- Link to v1: https://lore.kernel.org/r/20251017-ecam_fix-v1-0-f6faa3d0edf3@oss.qualcomm.com

---
Krishna Chaitanya Chundru (2):
      PCI: dwc: Fix ECAM enablement when used with vendor drivers
      PCI: dwc: qcom: Revert "PCI: qcom: Prepare for the DWC ECAM enablement"

 drivers/pci/controller/dwc/pcie-designware-host.c | 28 ++++++++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 68 -----------------------
 2 files changed, 24 insertions(+), 72 deletions(-)
---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251015-ecam_fix-641d1d5ed71d

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



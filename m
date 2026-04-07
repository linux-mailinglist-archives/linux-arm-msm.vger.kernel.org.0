Return-Path: <linux-arm-msm+bounces-102160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC2nErsA1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:03:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C18983AECC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1182430372E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A963B6C00;
	Tue,  7 Apr 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H22OXZ5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pl6F8mjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2ED39EF1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567004; cv=none; b=sHDKXeOtKmKk0q8Y2Xe4OJp2uXDqRY8MExh/z2WNe7LWt7QpX8XC6Q/Gqnsiw5p7OhPejVp/40bMcWxju7/KqZKyQaRsSJ7br436xZUjsuMYRYYeCHCNAcb4arZOdceE7K6l+Q7cIfuUQ1oZOeu+xmz7ljF6+LeGSS0w96aiJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567004; c=relaxed/simple;
	bh=bbZHPBwF0Y3DBIKbxtiScwcSKdeSgmMbid936OxbnBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pkHRI64HfIAk3va8U/HzJrhQkci7hh1vcGtrEa/NFwMXjWojgDxDzn1SPlyF1k2d8ukHnzuT6/pGB+CTLPhUywzb0tLhuc+4i4whbQEXmwu8rLSw1+JCzWmRF0488BTbFuelfBb6VMZrJ49NoqSMghrIgOjl1GNJnEwxeLloytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H22OXZ5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pl6F8mjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CCVjW492547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EWfiOTUoMlsU2KnUtPmDzh
	DH5pQC5b/7NcEX/ql4yZI=; b=H22OXZ5ddH0SJQY6Os/LiT+625TJYyTYzyuCUF
	TZYWDMdjkRSss8plmfoBBM6Ng0i4A5guCSGs+sa4gSNwDhOFAu+3JiMniPXH3UTh
	bsBbSFTvJ3CR5jFXLQoSwtbnauWHZC/PQufPKl20d5fyCs4taQXytVpy1hsoJQsq
	RrmI7M340+JMnJwSk7L1gpveK7m9JWIiLA3xqwFNN1MU60G91y/iNuFfQcS6QVCq
	CPQM3puRQiVGnTzq2uRTkcSQei1fTW7H577bcuLYgOAbq+btq9S6fmFwz2uT4fMy
	DptwRqFxYGK39BkfcD26NhnNMAwvM4uCnfvgQdyTy4BlP+qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8trk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:03:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso60983405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567001; x=1776171801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWfiOTUoMlsU2KnUtPmDzhDH5pQC5b/7NcEX/ql4yZI=;
        b=Pl6F8mjM5It+LLzKP/hXPSmky/0JW1PY9B0nYQ+dqiljHBExdmWIH7t/dsGNxXF3O0
         1xD5SfEIkIBGqwUCrqBJ0iHV7GnKBN0EZs3J5tdoZ6WHt1v0x6kTkTyW4qdKrqNXVzxW
         hR9DYnkvQtpxW+SvQl406c11EAXnaBHjk8YRv9OY9n1G2PqcplwUy02VbpWE/O/xKst/
         RdpEm17fdDHXjAEwajpm5mzVB8lz7u3A55Kpzn18JnwhvHJYerd5Xkkpe18aKH6I6N0f
         WEAbu5jeC61uX8Ujp+Vkl6aGiUfbt9XtSHoVF+RreyqQmUGKL1vPy2SzJW2CI8ILTlF9
         Yo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567001; x=1776171801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWfiOTUoMlsU2KnUtPmDzhDH5pQC5b/7NcEX/ql4yZI=;
        b=DM9aJGxDTu2yADbi9lT4xuZVrHsf/83dO8LO77Peh1tdXDQdc3I32rDP3mIJGQX9LF
         /ct9GZTQGoB72oLuNNi6IRjKEcv37J2Cx7cqovzweTZ8xv7V1QDHjCwGYgCulOn+FyAg
         6/2wBvdR+VN2om2AEbkhdwaRkqpV489bYFh2UM65hGihnR+59Y86nOhoG1sMMXz+qn61
         O6tVaKVzY8GycBeuBz8tBIUbm1nxWfFs1PY0YIIR/+QCMik/6q0aIChMalIx/VdnNTaO
         f9Qm1/zCMXwEk3hitEEpninDyjB4YdVdZpGLuMjy21AK8LW9iZvqWZ80qYla8S0FZaBa
         UMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVPvvuBuq5sySa+LwcGBWlcDALHXcfIu2wnBGdizn5ng8tY3XDg4rtIC+VT/I9AD2D4qBksH5kyUbnLT7i9@vger.kernel.org
X-Gm-Message-State: AOJu0YybPzCS6A+vnUaBvrQGBOFL79Kw+yrU4Kcbaub/4EF8F2bNPFvB
	kJQxwPGMMmg+AQ3lfzKytjYK7k40zOA8WUYGKm3gWeDR7VRubEyo1gpHEpb8wgeF3G+AuhACey9
	KJ5W0DtUueojwcxv0pUWQvw+U7r/i+FssWTo2r/t8Vpl+eSOIsd5NDYquFN2BgACx9bJD
X-Gm-Gg: AeBDievmtGza//z6OsfHgW7nYT5HmLXL1lK6OX1EAz2AudkHpU2DekPGPxAFmleZ25a
	M7p7pJ0lMJLzzzMiJf1sHYdm5pYfBBe3Yg7u3XXqlfvoEa/VI6sAX8wWTeFO1guJD/m87fggxqR
	AC8Rta0R17eAaKGotyjwp8ewlsoHHua7JtqKBgmGIDiN3e5LbAjwlYcM9OrzNGgkOLDucRnuc2R
	CC17lmCjNCbGCwibzBT8bTGzIOHttMbu1e2tBeHg3VeawPan2AoNjG9KDK7aO3as2LZ3sDe/r5Z
	jPbVavetNCcqYHk5PDXyhXaXOPak8Gfy26G9AaH1HS9hjj8l7KJZOoq0ngM990ymccuLvoQ1WJ6
	OoLBLzC0x0NMwzeKA0Z+Z0/7fjqCR+pw/VjYqKa522eTfvzltNPAzLO1A
X-Received: by 2002:a17:903:1b2e:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b28164b6a8mr163831765ad.9.1775567001076;
        Tue, 07 Apr 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b2e:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b28164b6a8mr163830075ad.9.1775566999609;
        Tue, 07 Apr 2026 06:03:19 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:19 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/5] PCI: qcom: Add D3cold support
Date: Tue, 07 Apr 2026 18:33:07 +0530
Message-Id: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIsA1WkC/3XM3w6CIBiH4VtxHIeDD1ToqPtoHci/ZFMpKVdz3
 nvolp7UCduPfc87oWgHbyM6ZhMa7OijD30a/JAh3dT91WJv0kZAoKAAEhumQ2uwclJKoLIkSqF
 0fBus8681dL6k3fj4CMN77Y50+V0SJaEgvomRYoKNEY45oq0Afgox5vdn3erQdXl60FIaYddAq
 01D0kIqBiBKTjj7o9muGaWbZklzIwqjKw2lLH7oeZ4/GYnYOx8BAAA=
X-Change-ID: 20251229-d3cold-bf99921960bb
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566994; l=4316;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bbZHPBwF0Y3DBIKbxtiScwcSKdeSgmMbid936OxbnBU=;
 b=qB71aTfgISqqMCT6mCJwX0p5orSaap73x00G+PAaNBw94RsyjSLRYSvbPHid5mkc7BTNk2a1a
 GsosDzP4BIOArgbVzPjURXPk3AYKV286hmCaS8667ujUbbc2zZlgn5c
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Dp9XIaEhbKS6HSLh0h1eBhOgbhCxgUJT
X-Proofpoint-ORIG-GUID: Dp9XIaEhbKS6HSLh0h1eBhOgbhCxgUJT
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d50099 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z0v7mYVB04eUNMBhXUoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXx2ZGO83TxkEf
 LI0g4WHLlQN0uKUDmMW7L6oHtU/yK2sG4S7zh5KUyOGUmxVIuatDc5cuO9Gj29aJe0qZUzK4L9C
 9nuK4f/w4wSY8ipipcz4fgZiMpX6h90e7Kju3vpN0dDCXCICwC1QFzOnvCfnk296CuMsxfqWgWS
 1dYdduwiZEkI9oBXisl738Pr3lY2Jv2TbmxrOCPRrRxoK6vxTLFtVgTn322HBddKnGnvh/heysV
 52wUtO0ZnXLQxpQWJu3bOnyQ1kuw+4nDtsCZ9sZBEl07FiQWWGF8Ty3WfXL3Km+i3Mh87vZnMoj
 lh4r9oOwN002h2jUh6HclAqLtY+k4QTPfCh0ZBD2+Y5bO7dKhe6cP3Ohu2plhvDPYHWwV0l1B4Z
 2h0DW93xRK2EEb5x2lgh2tTNcghEBb4eyiBkPqMVxGeHv+qv1NGoCt+6fFglu9YwiBKwzO05xUp
 NK2f7ZgIw2nnef9gknQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C18983AECC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for putting Qualcomm PCIe host bridges into D3cold
when downstream conditions allow it, and introduces a small common helper
to determine D3cold eligibility based on endpoint state.

On Qualcomm platforms, PCIe host controllers are currently kept powered
even when there are no active endpoints (i.e. all endpoints are already in
PCI_D3hot). This prevents the SoC from entering deeper low‑power states
such as CXPC.

While PCIe D3cold support exists in the PCI core, host controller drivers
lack a common mechanism to determine whether it is safe to power off the
host bridge without breaking active devices or wakeup functionality.
As a result, controllers either avoid entering D3cold or depend on rough,
driver‑specific workarounds.

This series addresses that gap.

1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
   whether a host bridge may enter D3cold based on downstream PCIe endpoint
   state. The helper permits D3cold only when all *active* endpoints are
   already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
   from D3cold.

2. Updates the Designware PCIe host driver to use this helper in the
   suspend_noirq() path, replacing the existing heuristic that blocked
   D3cold whenever L1 ASPM was enabled.

3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
   the DesignWare common suspend/resume flow and explicitly powering down
   controller resources when all endpoints are in D3hot.

The immediate outcome of this series is that Qualcomm PCIe host bridges can
enter D3cold when all endpoints are in D3hot.

This is a necessary but not sufficient step toward unblocking CXPC. With
this series applied, CXPC can be achieved on systems with no attached NVMe
devices. Support for NVMe‑attached systems requires additional changes
in NVMe driver, which are being worked on separately.

Tested on:
  - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

Validation steps:
  - Boot without NVMe attach:
      * PCIe host enters D3cold during suspend
      * SoC is able to reach CXPC provided other drivers also remove
	their votes as part of suspend.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v4:
- Added new argument to the API to know if there is any device with
  wakeup enabled and pme can be generated in D3cold. we need this info
  to decide to turn off power to device or not.
- Couple of nits in commit text (Mani).
- Link to v3: https://lore.kernel.org/r/20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com

Changes in v3:
- Changed the function name from pci_host_common_can_enter_d3cold() to
  pci_host_common_d3cold_possible() (Mani).
- Couple of nits for commit text, newlines etc(Mani).
- Removed -ETIMEDOUT check and added -ENODEV & -EIO(Mani).
- Link to v2: https://lore.kernel.org/r/20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com

Changes in v2:
- Updated the cover letter (Bjorn Andersson)
- Add get_ltssm helper function to read LTSSM state from parf.
- Allow D3cold if there is no driver enabled for a endpoint.
- Added a seperate patch to make phy down in deinit part to avoid power
  leakage.
- Revert icc bw voting if resume fails(Bjorn Andersson).
- Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |  11 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 194 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  63 +++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 5 files changed, 204 insertions(+), 67 deletions(-)
---
base-commit: 3aae9383f42f687221c011d7ee87529398e826b3
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



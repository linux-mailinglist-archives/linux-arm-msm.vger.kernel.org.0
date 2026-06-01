Return-Path: <linux-arm-msm+bounces-110653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEqBJNXBHWrPdQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:31:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB362340E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 19:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55E64301C907
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 17:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42952C08BB;
	Mon,  1 Jun 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoHcs2Ak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KszhFwwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC2730E0DC
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335051; cv=none; b=X21uLIebIMijUEXyCoM9XJZR/edUPyVjIRtNnMJaZqgs0ATPFi6goT9T2Ok8BQ4NSkxZf8tUHjsOG046hBULT7cZUH3T2Gc+Xmt4buTvvyium84yCdVbz5jhJXWZIey7zCxBEqeZ65dTQ53UCktP5VBr89VTnKsE1ahVG8T9/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335051; c=relaxed/simple;
	bh=dTxWkC9D/nQhAvkCNBylGPNDKnNQFBcLRIV4F8qd8OE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YD6bZs12kezR0kFqJXl9puoxOb4hi9GUvDI12svBlNOKTsY/gxEmARz4cJBpJk9I9EUpfDx7znps5hQ/QMcR2A/JGc67vMqCLX9dD7pTToncwc8TEm5qyj3GNE+Os4YjGitKenoWN6RLXuy2pWU9BXV2aCUuNJbeY2PEnh24fXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoHcs2Ak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KszhFwwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Exrv71257502
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 17:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1sUnhF+L9/rWjdKJJ0odJH
	7BcvEADzaujue7QqNbFpk=; b=NoHcs2AkVINkHBMo1UxnXo9Lg21KG+lmgeXhjx
	tNcuv0fZep+lpCwWlxhXFAI81g1efigyLZJxZ7NipfWBjxfi7/7UdOYdiNNHg+cu
	RNMpA6EvETSWSA9Za0RCsuZJvWCdooXHcdSuF682Bd+HIZmL/W5CXrbvCoWyFrT0
	CARIfVCsaxvKsXIh8y21xLATKfMVOpXsBzRlYtZ3OrQQMP9XEEgSCpiNJn9d1bWq
	IqGHAiormyNZ8KiHu4FvVQhuIJxggo+2NgGrHRhoOvhubZL6yb+hjlMdwl0l/HMx
	wGe74B88mAn7bCfxkkeHLA09U+9KEckPfHkdswrtg2sFP6MQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sst76r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 17:30:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8576bc9254so3667076a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780335049; x=1780939849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sUnhF+L9/rWjdKJJ0odJH7BcvEADzaujue7QqNbFpk=;
        b=KszhFwwVxj4XJ9KZY1tSDKTtk9CnlhtxsD9BVb8z3ta0UFRpzyu8KN20I3zp2wAQyV
         UcrAkeTuwivSYzaVjMSQ0RtTaDE/x/7xWmVKqZikCZIBptqh66yhHkEscuMJklFjS5FN
         ljV1dPz4mWNQHD5EKoGF3QdgSOQT7PT0KmXa1pq67tRw8n6oQY3/81or6GceaRZUcYdr
         +DIj+RoQ7YQnw3B4EYVrCvLvgUXJ/sLWDXJ4FiJsAxZ14pPcmRrAdOgDrjb6FFV+lW7m
         tYY9FcgxHv5S2T0KmhTlUuR+HB/f1EDIUKFRPFQwVV+xygkz07Mr6K8iClDMB9wz8qZ9
         a6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335049; x=1780939849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sUnhF+L9/rWjdKJJ0odJH7BcvEADzaujue7QqNbFpk=;
        b=lpvPfoMR6PAz07s/BfbfIxhYIPlCxqpCqyN+q8vP5IKoUN1w5T40+4pZkqyxgUzGuX
         GQMD12xlaWO9SaH9gMmDpMaM+s3zhiGDaN+mjtVhLGvM6N27eD2cylafxDCnhYNM2y/g
         KWfiDqvMzv2Rxdmv90d0S4qDCdH9UT5zUakOinhn1O1kRP71ToP8eBp1910Q+xJzHdag
         /N5/N0NcqKcdkAUE7cb1s/YETkrruRsKrocB37an4X/pFCNW1wlUcGmqv3Df7L13a7aR
         fR9sBPle+M4TM34FbCyi+jd4dXq4MuXMkpkTnt1ih9+Os5e/ZU8TR0KR3wMyF9agT8Er
         mFJg==
X-Gm-Message-State: AOJu0YzO3zxVGIle6C0rIMKyEPgMCoXOSy+IwquRm4yxM9CtJKLBKruu
	LdxWvCCfi4DeUrs0LnKQrUKep9fga3hKPsO2pXAf6NNl02HirFUDQsfIaNRj1tIXZHkEYZTyhTc
	AkJrNnEtPOnPSei72iwI/whYZR7QynuIliHHKBofzbJD7CdMCdxA+JlV5cxKBDa4kiwbn
X-Gm-Gg: Acq92OE8bGpmDVQdQt6MaagR93b0Waptbkk1LoT+++x8ARnOcGeyI0muQtzwlg58vbu
	Mn8rDLrcHQb9dCy+3arTAx2R29f856vBzOZCdiJJ8mSJOdO/O0VuoLYF4bPV7MWwpWH1ouSPtdH
	dZqB6KlOP4ZYhzoEdQeuyMHvXobHLZKxYHo72R8Oj51KCDUKK4+gc7fmFk785hy/R7scjUKNUYh
	SIaNg+Ay958r24EYn9FX4Q6bcPeO9W1U60+tzmKBc+UMYhROuUTAWhWUlJLDKu/LDriNESxdrTm
	Yt8WuUhFtQ/7eWiRmeiw5G0nJzLSzVZJrRzjI5np49rWwwirZwJbf0itnkkpj5g4k5WD9Cyb+4c
	VANW8aTLYU8srKPNZpkPGgfxp6+vBh6e9HtngV0ejF/bLmnTItymt2Dh6l0cxAwpEXFM=
X-Received: by 2002:a17:903:1905:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bf367aa885mr142466435ad.9.1780335048870;
        Mon, 01 Jun 2026 10:30:48 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bf367aa885mr142466035ad.9.1780335048449;
        Mon, 01 Jun 2026 10:30:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm149136085ad.41.2026.06.01.10.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:30:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/3] PCI: qcom: Add support for Eliza
Date: Mon, 01 Jun 2026 22:59:43 +0530
Message-Id: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfBHWoC/y2NQQ6CMBBFr0JmbQktVsCV9zAsShllDFDtAFEJd
 7eAm0le8v6bGRg9IcM5msHjREyuD6AOEdjG9HcUVAcGlahTclSZwJa+RqBOpdYG81xJCO7T443
 eW+da7sxj9UA7rOPVaIgH5z/bo0mu3t7USv6bkxSJKDJbVyGb5kV9cczxazStdV0XhwPlsiw/N
 XXKzrMAAAA=
X-Change-ID: 20260427-eliza-e53155ae8821
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780335042; l=1634;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dTxWkC9D/nQhAvkCNBylGPNDKnNQFBcLRIV4F8qd8OE=;
 b=i817uyArXAMMqslAv/+8fL2dnAFE1MVeVBOaxSzivu9AVo2CwzvvglB3MKVuJQfu3fpQc2QR7
 xvCY2FF/gswBAD/2k2XNLQ5erDIcvuEmPuV9CJy6s0L/gAw/nXLQ9L2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 6EsFkV_Ztk73XW6CA-ZbQYi82tA1-TAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE3MyBTYWx0ZWRfX8g6ptnH2h38Y
 z5WNA0hCoeKBpEWvHEGFwjv4YgpFOxL8k5Pph3Gfz+bi5t6FF5bjbUPGBZQ2lKhQR/XFMVEkkZJ
 PBSybFjMDPPj93gmqqBxRvGGhJAxJWzYxCt8zVM3ZYnjX0/QVmm6WhmsARo9848MbEZqxova2tL
 RebUtjLrv5h5JrS6Q4+W4rM0eBHonHccixGUc7IVXIpamVQqlZnWu970nE2cXszu3+gbqAb33em
 U0HPhK+adSgajtTYpJAzTMmXaDAQhwA16zB7hkWzvbUZHQugrytdrM2xAkyFZJ+21lGpBor+AkW
 hQNblxq5Wgtz7cCrXLwanQyxyYnm1xKd73quTA43rFKd5Jx8nSZHQgQYRef/yUf8m0WaG8a6tZs
 CdIKirPJakqq0Jwg1Ef7T6P/MfQXaBf91nrBlf0xhJ2wAKVt5BbMW/+uRCSGTZw6mJto55g/JPK
 +/ryd9vimJBPvZ5XW6Q==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dc1c9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=qIbWdXD6M1inJYch3NYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6EsFkV_Ztk73XW6CA-ZbQYi82tA1-TAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010173
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110653-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FBB362340E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.

The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
Eliza-specific initialization tables, and reuses the existing SM8550
Gen3x2 configuration for the x2 PHY instance.

The series consists of:
- dt-bindings for the Eliza PCIe QMP PHY
- dt-bindings schema for the Eliza PCIe controller
- Driver entry in the Qcom PCIe controller for Eliza
- QMP PCIe PHY initialization tables and configuration for Eliza

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Remove the driver patch and instead use compatible of sm8550 just like
  kaanapali (Krzysztof)
- Move all the phy settings to lowercase (Dimitry).
- Link to v1: https://patch.msgid.link/20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza compatible
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza

 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  |   1 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 139 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   1 +
 4 files changed, 147 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-eliza-e53155ae8821

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



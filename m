Return-Path: <linux-arm-msm+bounces-104911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPhdFXl28GkMTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:57:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A47480B60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B400F3060697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74B736EAA6;
	Tue, 28 Apr 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4E2VkR4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieaSO7Pi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FA3D8916
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365450; cv=none; b=Cf7szvJS6gNsnRTKFNEgAwYS+xlAAdLL6lI3uWn47gX2VT1ptCij/xOiNjQ9c+d5IA09U6z9LpUe8pMhHcTmxzQuQacoMF2hbNcgR5tVnw5o09rNDJPuSW5dKzKAP5UDPHz2+tNQngV/Yo5jMZwP9n0//GgW81uEF/pgF18oG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365450; c=relaxed/simple;
	bh=wXhxA72/6Ld66K/KfOL/i5XxZJ6shIPA05fxN6UAC4Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFhL/oB3Z3owUeV206Zip7ZVuE6EbLyKiq0XxG8Ml3mGI7CBrZ7t2ssEtlJFcIs3EhQ2UE9rzhzhD23Aew8ybtp+Di/TtBwm4yi6pEUTpbWgl2NkhcSyR9Cxtvop6pTG+5Prjklsk3XZSIpNOAFSNf/Nj61g9ftIo66xyRwHwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4E2VkR4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieaSO7Pi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7uu3K3968092
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=63VPpUpA/ihOw1FTUsmcas
	0LmSMy79Uu3DRMXzrc+RA=; b=J4E2VkR4EzvKZ4FFJUy/HCty1q80Hs/pNcnvJZ
	p8/ByN0AgiLwxN9cgNqELBibc4sYobS0qpCmAzN6b2rMb/jXxZx+3fe7ROR27LI3
	LqMtPtdxoDaz8Hm7JKGtkqJgMDKYWydl5oWgbjXNNQ5oG0l9lWJIEADp4j7t/wP4
	ifjRIpS05cSQVMwAd2V2L+fdG+WHCCq+iD0x1dJgxNZvIultiYmC7iRnsSg4OW/y
	r84R6Syt2YVM/P15CHRc/DIxupZWvh9qjYd7pG3YTArRcOUZ1u1KW0J1dDt87Rqg
	4eE8Th2KuFfrNU1SpWI1Sh2VWPMp9H6abNSGY9ixcueaawGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0g532-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:37:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so121206425ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365447; x=1777970247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63VPpUpA/ihOw1FTUsmcas0LmSMy79Uu3DRMXzrc+RA=;
        b=ieaSO7PifdwVRt5FFVAd/o/KuJtz17FKMmMVIsoChzyol3I2K4Khau2SgQE3IO61Hb
         AKPA78LyVkIj3qFzy28M3fAkTGtecehxSHcH8PzrDwbJBbeqI4ZkXEdz/eWyy1/bJzWT
         L0jg3rE/KmkpAAqBgjJ25YMaH/jEHN7aUuqTxuHRnnf4u0AlzHODN8Eb4SUa69KA/4eM
         eqVM6NABuXDATP2KYfP9pDV6UVpWZlHj/J6LrozS2zerhT9acLGDjaSDbdRyab27kFfq
         8vkQ+/5u6RcJzMB9f6ar+ihLRtQ3S7vgkj3gVu7oW2LE2BBBCpK6pMrg9kuJ2nd3JlYz
         wSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365447; x=1777970247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63VPpUpA/ihOw1FTUsmcas0LmSMy79Uu3DRMXzrc+RA=;
        b=HN6BD+Tj6m9gpRS8UL+ptZJ8bjytCdwgkW/DxvNnfj5fIAkjr1euepB9VzB1OEo5Yn
         YFYLUp1ffLBpR4/puavV/pSb5Cvqz84CNZmC6VtZrt2qWwq0/ZkCFaNz/+mXyxzRjznX
         Jv/oAK5HJaZM4lVd4O22elbLeotPh5a8Gnhqx4Qkdbu6h227uwh3fZF3Q2+Ou59cieya
         wRvf1i1FtXVp9ZclrooH3+/PkH2YFAmXH9rAhXbYB8/rswn4E/sYtYGcwvu6vzmYN5y6
         DQIunq78RNdNy9+S0Zjx1uWo7bR1SEA2FZ4GuVsuZ9Q58aqOFF5v6SaagTBKGiO6qCdf
         770w==
X-Forwarded-Encrypted: i=1; AFNElJ8B7LtgJlxgngzmIWmyiA3wLVWO9FaBxFzYU/fLWRMXS4mN98dTKPKCSxK5J9mjlOfw6Dd/W3xw6hAguyTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mppQyuVK5UVo5SwZFy+FHV7AW63p3AzYx6MhrmaT6apeK2iV
	ayfKVJy9hmOZCKbNG8yrt+0H18WjzmcE8yMg1GIfkfBugNkUx9D0faFHW7ZEAovi3o2XLUc0jQO
	OPdZ7JSv7m389KE5OtvA/TaHhfX2P8yjoPCNa96FM3GgwEBJomI8XPlcDaJGbNvZPo/vd
X-Gm-Gg: AeBDievKXYutN0Y6qQncPgjXu7h2n0SVLe/oSbfsPBTd1iw0sXX2GlwHyqZI1gFNo0Q
	0SyjGBxrMQZwk2NEKoyl/wNPTSCYdmLNy+eQo2BhHvfI8ZO49tfQm4lEc35MTgFo5teBkbAnFNz
	xGywrA+yY7OxUN0bTHT5nwcWzO2ArSBVShjaru4mMCNIVh72EFdj9nRCoHFuLPLc9N4mHuJMx83
	+IBmf9PJSzTKK47u7Dxg3fW98IQAC1AZIm64m/K5nO4qIiTsvHQIk0pgoxRyrdIlMV8Lswg5GUc
	wyE0kxMNsNIYi6qhiNGrcntVgB3Cb5KEjfgsWtdboxRIZoQ+tkSeTPavYHXc3RrmwpmWfjTGuMm
	7D2jIkD3wu49qZdi1JPhjC5nen786Q91hmS0YSkzl2H6gz57SeOv2hgE7dY6FhjWUauI=
X-Received: by 2002:a17:902:9887:b0:2b4:6022:bf8c with SMTP id d9443c01a7336-2b97c461eecmr16924005ad.22.1777365447012;
        Tue, 28 Apr 2026 01:37:27 -0700 (PDT)
X-Received: by 2002:a17:902:9887:b0:2b4:6022:bf8c with SMTP id d9443c01a7336-2b97c461eecmr16923805ad.22.1777365446478;
        Tue, 28 Apr 2026 01:37:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm21645315ad.84.2026.04.28.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:37:26 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/3] PCI: qcom: Program T_POWER_ON value for L1.2 exit
 timing
Date: Tue, 28 Apr 2026 14:07:14 +0530
Message-Id: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALtx8GkC/3XPQQrCMBAF0KtI1qZkJmliXHkPkWLTRAPaaKJVk
 d7dtCBdaDcDf+A/Zt4k2ehtIuvFm0Tb+eRDm0O5XBBz3LcHS32TM0GGJQAT9FZdwsPGKrSVuz+
 pYo2RK66UFkBy6RKt888R3O5yPvp0C/E1+h0M21mqAwrU1qUGaYVyjdqElIrrfX8y4Xwu8iCD2
 OFXkQyR/yhIGUVmNAJKVEzPKHxSOMCPwrOia3DQMG2k4zOKmBTx5yMx3LLSwDWAUk78Ufq+/wB
 KE8lXhQEAAA==
X-Change-ID: 20251104-t_power_on_fux-70dc68377941
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777365442; l=3469;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wXhxA72/6Ld66K/KfOL/i5XxZJ6shIPA05fxN6UAC4Q=;
 b=tWGrEv2tB5pw9iHEmovC108r0+9mTrwl7muAR9VjtpOp4TcvFVd9LlGZF87A8EpmIBIUrL488
 1xKKaM/DijYCVzVbNrE5CVS6q1TRQ3eqT1Ph+lSZYBgw0atwFsxgy20
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f071c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=h7GK-HNMy1QVH8K1SrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: r4IMer0DU1hrNFdyquLWpsX-Zmm6VUtG
X-Proofpoint-ORIG-GUID: r4IMer0DU1hrNFdyquLWpsX-Zmm6VUtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfX6cq5G0+95Wyh
 h4aq8EMZvgDZh+9JN+nGllcRzOsw6qvhMVLQdn8p/A612rsJPAqURy42NQduPvCuFyeokhaKCMP
 Cs2SjOjGZEwWX0dkXKzN5QTpk0AZ/1vT899uRsFdxfqhG0R7Em3Jx08wGRtJcVsnbEy1UQ99pGV
 5BjW1C3Owz7ys0U46fLPeUYNuYLcjznJteH1VhNGFOPgORgnAanxC+bSQR4MObDea29UAvyG1nG
 rkBE5hB+7CxAff54/fUAKagm879MIdorCFAazO2Zyx2L7Z3xcYIZYA2VO1lCmqwGD2ZLNBa3dxf
 e4T/51mzvRFHTZ2FeFk4QWi6q1k3ffYW17J9tm+r0Z5R3Urd6XNKxcHIAUtBEs3FXrhzZt6LQUS
 Bs0T3zukuLxSGP8fsG/0VbaHzyFQWk39dMAeHVTmrbvPngXeDiwx5OYBzf8DxIWtkMa+ehs/9hE
 O22SmJz1+kajMmDPWVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280079
X-Rspamd-Queue-Id: 63A47480B60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The T_POWER_ON indicates the time (in μs) that a Port requires the port
on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
asserted before actively driving the interface. This value is used by
the ASPM driver to compute the LTR_L1.2_THRESHOLD.

Currently, qcom root port exposes T_POWER_ON value of zero in the L1SS
capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
which can result in improper L1.2 exit behavior and can trigger AER's.

In this series, qcom controller drivers read the devicetree property
"t-power-on" which got merged recently[1], and use that value to over
write default/wrong value.

To convert T_POWER_ON in to T_POWER_ON_SCALE & T_POWER_ON_VALUE created
a pcie_encode_t_power_on() helper in aspm.c and also created
dw_pcie_program_t_power_on() helper for other drivers to use these
helpers.

Link [1]: https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v5:
- Initialize *scale & *value to zero incase of ASPM is disabled pointed
  by sashiko.
- Use dwc readl & writel API's instead of direct readl & writel pointed
  by sashiko
- couple of nits (Mani).
- Link to v4: https://lore.kernel.org/r/20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com

Changes in v4:
- calculate maxv from PCI_L1SS_CTL2_T_PWR_ON_VALUE to PCI_L1SS_CAP_P_PWR_ON_VALUE (Mani).
- added a todo to move the reading the devicetree from qcom driver to
  dwc once multi root port parsing support is added (Mani).
- Link to v3: https://lore.kernel.org/r/20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com

Changes in v3:
- move pcie_encode_t_power_on() include/linux/pci.h to
  drivers/pci/pci.h (Bjorn).
- couple of changes in commit text and variable name like t_power_on (Bjorn).
- remove return 0 from qcom_pcie_configure_ports (Bjorn).
- used FIELD_MODIFY instead of FIELD_PREP (Bjorn).
- Link to v2: https://lore.kernel.org/r/20260223-t_power_on_fux-v2-0-20c921262709@oss.qualcomm.com

Changes in v2:
- Instead of hard coding the values in the driver, created a devicetree
  property "t-power-on" to program it (Bjorn & Mani).
- Link to v1: https://lore.kernel.org/r/20251104-t_power_on_fux-v1-1-eb5916e47fd7@oss.qualcomm.com

To: Bjorn Helgaas <bhelgaas@google.com>
To: Jingoo Han <jingoohan1@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Krishna Chaitanya Chundru (3):
      PCI/ASPM: Add helper to encode L1SS T_POWER_ON fields
      PCI: dwc: Add helper to Program T_POWER_ON
      PCI: qcom: Program T_POWER_ON

 drivers/pci/controller/dwc/pcie-designware.c | 28 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 14 ++++++++++
 drivers/pci/pci.h                            |  6 +++++
 drivers/pci/pcie/aspm.c                      | 40 ++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)
---
base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
change-id: 20251104-t_power_on_fux-70dc68377941

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



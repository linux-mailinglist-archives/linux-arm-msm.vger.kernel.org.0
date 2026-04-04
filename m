Return-Path: <linux-arm-msm+bounces-101751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOjKHWbJ0GmfAAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:18:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D060E39A61C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 10:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C99B3034DCA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 08:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0373A4525;
	Sat,  4 Apr 2026 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF7xY7+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eK9sRvDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260CC37187C
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290650; cv=none; b=O1QKsRz2y4wXBePOusQ0S+NCzcqNvwups9KSg1yrFy0MPhwTQS/5qthIzu/xK9nEqIbzKyoD5H05RWWSeNrLGRyfFHXLcQGJcWyIdJr3koWbGl1sPA+m/t7NkH472QoOggQuAcelfLvRo38RJ2XZ+n//fPSXKrHtCul/sUHv3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290650; c=relaxed/simple;
	bh=qdnUNga94uLcJe/gNdftrxaAv+ogb/QdF4r+eQglgdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NXl//G11RDHqEzClTCmulOqp/RJg2hK8k27zK7FQ/SsC3JyepmBwqODgmPNSk4mkf1Q5QXQ/QoU7GLzxOEh2wt8LD0Dxok74NqqbzfnwU6dvYDgUffOPJUyIY4/TtATzH1PaddWYQxkFR4qw0cl+1CoFkEPz2yVAuKOPco43Cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF7xY7+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eK9sRvDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340K2gM1309852
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 08:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E0FV6e2v+ZOZtHenrGTq02
	JA87NDx4JFU/cHYtMUrU0=; b=SF7xY7+j2QMKoMEhvuzR/PrW8tNAO7IufJrjGT
	ybeesYK0kQmTvbgnaYtVUz12eQnoPD2ORMVGxH6wXbzoMyNE1TJs3rEURv4XNh9j
	pEV8kbkwu1y7B9GDqbsia7k6g2XxkYfBg/Z9IdJII6iLyNkrjMj/LIu4haargLGR
	lfYD/IecUqeKMhGcDGrVLOd2MYSfR/YxJcp9qM3+F4GbfJy0zqscKIOb+pyfiuyu
	+U+SYMeA7hQaEqLAWNhx2ALsyfa5i+3hcw/SV61BHDqQPM3RDtm/gtjxN1HzH+cp
	qsIfAls6H5aJRZyge/wobxVozX9lKcHJWzEVFKsfR1yHiAKg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mgqkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 08:17:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso1130136a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 01:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775290647; x=1775895447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E0FV6e2v+ZOZtHenrGTq02JA87NDx4JFU/cHYtMUrU0=;
        b=eK9sRvDllvciS36vFWQMgDNVbE2cB2ZdSvR4OlTqiFQ1TGOn/p0QTpZxJR+R5fmNSq
         QeQgbhcAreFUC7UG0QBb52m0Bw9b4ySNInCZ8nCVouE7KATv8KFuPUjqH3y6jOvVo7vm
         UE1Mffp5lx4WRtlDQQ1HrevDLafYnuvmeDUAzYo8ZtkEG+nJcVCJXzovsZKtkDBlZZaG
         a/BroKD9DLA5je9az1HkxUhaFBJXr6mwDFoMGBn2NOSeWf7EgSBYb7nVId4oV7AWb7HV
         WuUquLUdNsm0+8qihpZq8xZaycfWHdeS9j6YoIcZYby8K4FK0Vk3C/GUiYeEFNxDUidK
         6r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775290647; x=1775895447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0FV6e2v+ZOZtHenrGTq02JA87NDx4JFU/cHYtMUrU0=;
        b=EXrENZThrEsFp6ACcap9R22agQvN1z7XEQ6WSb83M26JZJgavNO+jrgYPBEE8LL3uw
         hXrjPdps9mcoLYehpm3gYxa4msVqdBviW+d9+xOUWem3+GVzCwjAAon8RcioCFxBfvyQ
         tRS4U6LiV08ZL8Waqr3DQQKI0ytFK10cER9E4ngDz2q5kUV9al0+NmZaAgSJnHxXnYTP
         oFVmw00wppxHSJrmg4G1ftwBT57BDWq5qLn0RGIqCQlcSTI4cbGDPd/4yCX9n0lQXH7s
         rMr0QJQSTPKbbWYrDdz96KupofNbjpBl/QB+SY+0xodk9k+WlmbIxmviIFZr9XQBPgbX
         12SA==
X-Forwarded-Encrypted: i=1; AJvYcCVAhYylTu87OO4Q5gLc0vnpeZfwu5QtpPTdkFL2XyP2B5+43D4sZ2udlfCbhKXZLLrAB6gT21KOAgGn1oTB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+shZSVxoocK6GvCJ9gOskSZZJWAk2XNr9sESnUB+QdeL/lLlZ
	nF/ei0OrM9EeS5eT93ApWeFmurfLAtXWSQgeJlmxmw7o2vq2Va2scjlR+5y5SQs4PFWBgUMHGrb
	mPB67oqvJyhkgVuXyCXrW+wulxwZ9umjD3n/AkbjiWLRXPlU9H+iKyvHVFKTfuAn/Kcgg
X-Gm-Gg: AeBDies7GyFIoz2RT9TricjsXmjcEfKikmaAEnl8734+ab8P69suKmtkE4k0NnPiakV
	VSAfQddoQpzdOL+bnWO5Z0yNN3Hnf1LdsTiESRjSaP0asp1dsNWPf37j6lXEzIBaxa6vPK9xap+
	/Iq8j01UQaNfSk9sMB1Qk1UH35VX5spmiHpTmNgHFhXFDlie6WHJsaN82ZESICqOQRNcDPp/egc
	Xz/7qauoBbguEV+238gtX+ZBYvmXgMyZvCWmHiCf72CTnJbje6ZRkMMrSRdz90tDA/y7l/Reug6
	6zoCCuUl07dJg4ZATOkpGv3eN6JE9pb+zqllZul8hE9VcPvYGPJVrRs+kIPnS2tSRE5u4oo8e5I
	l+0dsRbQrubsIyQ2ZxOQskO2iYt92iVfXpk8DGkBqwnueNrcoxWv7kJSE
X-Received: by 2002:a05:6a20:7d9d:b0:39b:e789:7d0b with SMTP id adf61e73a8af0-39f2f174eb5mr5580705637.52.1775290646731;
        Sat, 04 Apr 2026 01:17:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9d:b0:39b:e789:7d0b with SMTP id adf61e73a8af0-39f2f174eb5mr5580664637.52.1775290646228;
        Sat, 04 Apr 2026 01:17:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm6786408a12.24.2026.04.04.01.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 01:17:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/3] PCI: qcom: Program T_POWER_ON value for L1.2 exit
 timing
Date: Sat, 04 Apr 2026 13:47:17 +0530
Message-Id: <20260404-t_power_on_fux-v4-0-2891391177f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA3J0GkC/3XM0QrCIBTG8VcJr3N4jptmV71HxFhOS6i5dFuL2
 LvnBtFFdXPgf+D7PUk0wZlItqsnCWZw0fkmRb5eEX2umpOhrk5NkGEBwHLala2/m1D6prT9SCW
 rtdhwKVUOJI3aYKwbF3B/SH12sfPhsfgDzN+/1AAUqDkWCoTJpa3lzseY3frqov31mqVDZnHAt
 yIYIv9SkDKKTCsEFCiZ+qPwj8IBvhSeFHUECzVTWlj+Q5mm6QW7UbCDPwEAAA==
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775290641; l=2785;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qdnUNga94uLcJe/gNdftrxaAv+ogb/QdF4r+eQglgdQ=;
 b=JI+Ew2L2ICtllEYmUY4chUJtRoaYvl+O1EM5DBsPbqNJfNAE1mfaqrrutoR/rNwACTrmW2c7k
 6wjUi3QwBSYACWTORG6JR0+jW7GqehdLZsf0DsEdkLF0MyJO4iGnYA/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: qnHI0Pb-h9zpGrZh1gi7gW1cCt_3kwBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA3MiBTYWx0ZWRfXzftcwsDSezku
 7/1Y9r5uyaf0oS3fHOSHnSgFDajAXOniCpcdeFrlVj93X1EnJ327eIigciAmOT7dQkxlhEBeqQ3
 q6fUeYpqWzTHjVAIOl3xYpIGPPszgiMZfwbuOt1tcAE+Sm7d72Nuze1A0o8RHNWoJU1Ewp4h7g+
 aXdE81H0akTx9ZMCmt/3axbqlspcPc3A0mIpChtAOske9KBgUqa+Q4Y809gSj1UY2Lo0AVHLlSe
 JG+4pAjc09ngGmJqqTj0+xF3les1mNHLP9R25iPFP547wBWCgffXIYKB0Jm3jVDuUlh1NfIWSYC
 +YldCKv4REP0ch9jJkn3RQgOqXT3DW1rg0cHGAQCLH2mtHVVcfx5U43oCyYecsd0yQUcIby5KIj
 T7NoIlZ1z7KOAsd2+N3W5yHXF554qBGXxQSn8+cCYY+UWKv2MaccuTxHuGCHZ8tME1iQ2qGzK8d
 HruZnO980iP2hjEd8+g==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d0c917 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8_GxwEYHqknyFer8HbIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: qnHI0Pb-h9zpGrZh1gi7gW1cCt_3kwBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D060E39A61C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

---
Krishna Chaitanya Chundru (3):
      PCI/ASPM: Add helper to encode L1SS T_POWER_ON fields
      PCI: dwc: Add helper to Program T_POWER_ON
      PCI: qcom: Program T_POWER_ON

 drivers/pci/controller/dwc/pcie-designware.c | 28 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 14 ++++++++++
 drivers/pci/pci.h                            |  2 ++
 drivers/pci/pcie/aspm.c                      | 40 ++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
---
base-commit: 7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
change-id: 20251104-t_power_on_fux-70dc68377941

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



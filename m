Return-Path: <linux-arm-msm+bounces-90336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOtOBFRgc2kCvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:49:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A30C7560C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34F88302F693
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6B02E8B94;
	Fri, 23 Jan 2026 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAPWVJWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvBB+Fz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812027FB34
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168788; cv=none; b=c/SbXkDs2wMBCs5BiokDkQdrScFzIgGAU6LiME/QZyCpJTInKZbqnFH8MrnTDGpc/otQj08vK0F2ppxJJUymXw8LB4gsk8LsgQbH8LM3dbFBravdaBwTHx5QzgaZzuUWgtbgfsT29XbMVDhTyUixSg1qFJpBLG8tpYzPzmcOLJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168788; c=relaxed/simple;
	bh=t7gay3eiWOPDY0JXpqFO72lJbz0dWJRavau/NMQ3H6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hnAn7HufHvDlvsG2FZxb0J055Qw/1OBYwRKi5SNSX5JVyvr/aIB3e7b81ivdIB4wrqBwObSQPGMwbCZT8gb0lUDqUeKdcyPrgvx8fbX7tK66Zb1j1zCff72aeIxm+KJR4oXC1HxH9qtiASeTezI1aLnkuRUKO3tp7L3DM2vnpIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAPWVJWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvBB+Fz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAhGvL3126957
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAjh8StLopmEfidnduSQuc
	PIbLKeTcswSu2bpKkM0ms=; b=FAPWVJWNiBtBBjs5P/pmbmsUSdnyufstXou1P9
	+V0sqJqTz1INNBr+ZV8u7v9+eZttct5zRt7yBc+fGrPXjsHDPnYsrOCMwwT0Mwm3
	S8DYkBoEanabZxSy3o4b8d5CLlIjMHDG4RyHW2ldsTqdnXnVkaj+ezYw9Vs2nc5o
	Fp6G8m5SMG1ED65PxEb9pP5JJiW5i62D9S2WSXpT73r3mAychboigDJkORdh7tei
	jLq53wx5IN2ZYQVzrqYMYMXd95Oly/neKeHa1WQ8clTCqB/38gFjEJEGin/FmbJr
	f71mcTXnnLot0byIwgU4PBYfdUndWwlFsSkq9yO9yW5w3zgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdu1v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:46:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso5704186a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769168786; x=1769773586; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAjh8StLopmEfidnduSQucPIbLKeTcswSu2bpKkM0ms=;
        b=gvBB+Fz8UtMDT4P9vmv8YAweOxtKI1G1fnMP8Wl3Wf7HzXiUbuM152w+0JG9nt2GnN
         0vR8xyUIzW+76VBcs8e/o3neDjRKLBtWrgDoYoTXRiOPTWa08klRnUgWMwKoPRNXhH8S
         auGNkoeyA5e93dar6SQrEN/qzrkTd1jMGh6APQJ/e9KMKqupKeLMgVICNrtMcOIy1GK+
         NWSGFgJ5i3yzmWNXIjHVW+uyEVkDk/X7s9IUA/+J7hVL7W5l3mKFGsigbE33gVlFrsTS
         S7mMHPlz8HUc62BCr6sNXIm5Ojt3VNgyJDh1PG0+GJbEGy3+BDdeHsg64Amoy3ltN4w6
         dD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168786; x=1769773586;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAjh8StLopmEfidnduSQucPIbLKeTcswSu2bpKkM0ms=;
        b=Zgrsiwny6/WK6vW0qMZophl+tmDvtjzG66WWAuPWFfvZPVpB2sPw6/VoCHMYJWo+A6
         HGRIGltmmLk+BvGci9qb7D8Ya8GJsHYeElHrsOVTp1K7V9W1y29FWcftKt07HaJCO6GR
         QFZSIW0cKZBLnkv0EUBrAiEYWoHFJjg5rStLG96NwCu0oQiNmgSQXBg7lsfjXjNV/Ez1
         wMgQf4XU/jAHJ7rmmhOZE/KM8rnZlk2r5vivrRgn+ttREBpVOhXOGVpHXeCRr3F48WFs
         23dgG+xaoKIP7S+w5qM/sTSbfK/Kn4H3FawNYPNCYv+U9etgCFTEJyFWWaY+sxa0S58A
         Otdw==
X-Forwarded-Encrypted: i=1; AJvYcCXc64paBYscVs7pX2VjEMPC9Mo9FSXjRI5Ld5F8UPheAW/iooeduk+ECCZUzwOKNZdRhvXG1ICZqs3nIhxB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/qSx98S69w4Z7A6K/WboCSiBCjogMPW7sN2huZLb76zB4PRY
	VkCrychVMgl/Xmx+EZg5gsJyZBYqEry4jHGHrjsAOXXXPvgF/nVrNJvwN/BOG8fCnDEEMEHKdQ3
	iaTX3E4NfKJWyNj6KpE0dPT2g1snDr2hFy6e68/I9NKTSfCSeXD/k6iFofeob64geSPVURRfkAE
	H+
X-Gm-Gg: AZuq6aJkVrQl9OnZMJ96x3GCQIS6rhX+gFwuJqUangnXn+juiAlnBZYgh+/tUfeKg0M
	Vx6XaojSLVWjfBoI0NnVuMyTpAY64abKCY0dm0C0BAQ+SXa5QiK2YsEusXsiKp/R+o2B4NOq0MU
	gkOiFw0I6SzM//SBSFRtDCGxfaBbNRIaQqKLaqjBINmtyLhr4k9eSM3KMRxlHvJzq5Ta/bf54db
	cBW+nXhHQ6tlqxsOCBGGwuqnP1AYYhDK0WTmVztReHbmdatPNXI++AAqykVLE6Ts2GOHAD34FB3
	gx4PtEfyFrxvK//vy3KprUIAfeZO7WHYSaCneuBVxU+xLrPPI5HFzLMs6KmDMviGwKW2PeK2U9D
	3dR+tjYUYh8VpdvS/Qte1GcH2CrWaWYxDTm7qtvg8qNN7
X-Received: by 2002:a17:903:1aa3:b0:2a7:b646:54d0 with SMTP id d9443c01a7336-2a7fe733e05mr26436865ad.41.1769168785717;
        Fri, 23 Jan 2026 03:46:25 -0800 (PST)
X-Received: by 2002:a17:903:1aa3:b0:2a7:b646:54d0 with SMTP id d9443c01a7336-2a7fe733e05mr26436615ad.41.1769168785213;
        Fri, 23 Jan 2026 03:46:25 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm18199205ad.47.2026.01.23.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 03:46:24 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:16:17 +0530
Subject: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIhfc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3dyMzPjilApjU11L82RL00RTU8vEFEsloPqCotS0zAqwWdGxtbU
 ACOiMU1sAAAA=
X-Change-ID: 20260123-mhi_sdx35-97c95a559ad9
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769168783; l=1947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=t7gay3eiWOPDY0JXpqFO72lJbz0dWJRavau/NMQ3H6M=;
 b=fdeBLN2Bkg8AjzqaqmCvKZPGUq31YlWgcvvQQWgmC7NGYPymQ5qWUv+pGm3Jgy7hZPGX0CZhv
 P1iT25/cK6yBkmASAo455Aol6sIIGdMgFXx25FzDXXTIEfvBIzUyS/x
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5NSBTYWx0ZWRfX6R6B1ZzAtIc1
 YDYG/R5QhQkTRH1lxgIlkMRMoNmdzqqwwOImZdW1+zYP5SG+PBsraJ4+NWpDUxXw5l79MYNsqQk
 aT5/jKVZYPAEI3sGcWE+WRZjhW0n8qT8K5+0HqOE/pwyPrpp+JbQv/RHHPGTUZlj4GeRI4qljmX
 M8H742SlKNtxDynkw/KyZqGlv3/RcvzaHzG4B/VeVqOeGt5bcq78BuHgeFkfLRSwlh/p58oKqw6
 LjlOgQyBcl+eQu4gPaJ7ZygFU6CreLZSxKnPUXsw4ozzk/AAqIH2NAspmvTbizvU+bGPc2sVi5E
 iY3v3x+ml9cInERj0J5SxmWP49+uI0huB5OAB4Tbg9CqcvEEyPse2t+N1ciF7u511LosQnt2WAi
 1gkRPTqfF2ZuYqSItRGX2a3xo7Y1azUnCtqFyRfQYY38EsRHgSowdsW9/ZjesBz/MARl6E73dc1
 hpQlKtbqY2zQeEYhLlA==
X-Proofpoint-ORIG-GUID: rROyNYZodqhldBr_KW8RY1-xrgzIoRUd
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=69735f92 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: rROyNYZodqhldBr_KW8RY1-xrgzIoRUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-90336-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A30C7560C
X-Rspamd-Action: no action

Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
transition to ready during power up, so use modem_qcom_v2_mhiv_config
configurations.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
            Subsystem: Qualcomm Device 011a

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..138ab21d9685f234f1de39668a9821cc449b74b1 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -423,6 +423,16 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_sdx35_info = {
+	.name = "qcom-sdx35m",
+	.config = &modem_qcom_v2_mhiv_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.name = "qcom-sdx24",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -925,6 +935,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-mhi_sdx35-97c95a559ad9

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>



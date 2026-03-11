Return-Path: <linux-arm-msm+bounces-96964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEwPHgljsWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4876263B93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA183113633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04C12E7BB6;
	Wed, 11 Mar 2026 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJ32Qw32";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+9+ivS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86B359A96
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232853; cv=none; b=fUF3OkBbv4W/8XB2aMZf47kZQrdg9IEzOYgGM5FwpkHpFFFKh7MuuAxmNgZkw01UqAPPgKowk8AJlm3lSg2TYnBbnDH4+n3wFfHIpKfkri8XBt0a0UPWDj27l28/XX2jm6emHea/hsW97EdIKmMpHrHXggqQ7Vg7M+Iw8vkxecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232853; c=relaxed/simple;
	bh=Pt9eBf3q+rpnIa6pxHeLVY+V7c9hYTChfRhtMtFrFEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HORUKO2PHD1naEN64rx0huONDwhb5TuckH6EbmZwh2uGTmgSXNAxAZCIdaGLPS+oA7UXyLZzACnHuOqz0kSvltZKeOt07HcrQRFmAXVfKn+78OxJO4OoF6cQuWqiuPvj4zv1oOkfXj63zhFyIkLOxeu9sxczznm6JiXsVDJt7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJ32Qw32; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+9+ivS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5dXO294270
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9kf1xOyGVR0LAsUb0gr+ewuAw5uTpNXsIwgYg+g+ZE=; b=OJ32Qw32ctj0+/nS
	LGe0nGO7eL4P6V3LWjYIz3bQzZau5OWQR3O5s+BdVwVcxjBOgcTgBFlCxYVMszVP
	cpoWuDsiAH9/wc/FxtT8duiS8/l4d+forxE5mHuPL4IgvyVUbutlUxgVKgyikYT2
	ogkCznQtwCw6LeqYSiC8y9N9XPKtUenBVc7OPVFLvVCPDpWyJ3FoxaRzoK+C6FHY
	JQ0+BVtI7E85/WXNJuyVnZVClPbJKUAB7dw3/dHzWGOnZm4+IfkvukPhZpocnHx5
	RePK2QifTvx7hNcnktLfEI83UE75FdcDJ2jcSpYMdrkA9k50v6GHA8s+rOFscRHq
	sBo1GA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb8gg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:40:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae669a8ff1so435423545ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232850; x=1773837650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9kf1xOyGVR0LAsUb0gr+ewuAw5uTpNXsIwgYg+g+ZE=;
        b=e+9+ivS1rFaSFnAFs/wYTWgTzGPopcaGKbRF23VgZLwdjF4UQB9OxhPThBOUuEzkZc
         RzNucE9+XEpRx+4RFBRkP++oT12yxFItzJjNJUFmkI7NflS4ur5HgA1f0bk3OPyClYvm
         H0jcpmPIx71kNBj9UhBLVhfuRphryqDNrJ0MtfpUEhpYy5jU3g9otazboWOl9vUYzl1e
         rb1P2/PZu3HFKqkD3BhCjqYe/pPI3HTylxlG6CvpIiujHUP84Kc1i5Ka1FJVxj2Zerv1
         VXXobIay4wqvkQzNn4pwA8HD+i0A+5e9YmTlon8xbmF14P6FOYGOKCuDLMsO6mvaWLyg
         LmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232850; x=1773837650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B9kf1xOyGVR0LAsUb0gr+ewuAw5uTpNXsIwgYg+g+ZE=;
        b=JW57KHCUSFffwYyqHvwh00+oE+qNqynRfnyaGzomxikY45c/4JQGRBkeqprvo85hze
         ZuT9cw1W+niFHBjJvzQTnEH4kKAOhzPjd8baWkrCCR017wfbrFXgDXXXSt2Dq2sk7D+S
         i8tdHHRebYAg4pPH0oO7s3rOz0irrY+YxUFmE19RM/0BNLLEGkPRoQBF0cohJClhq0lE
         NIfdAINo011nR9/3W5iQAEtSg5MhwdnS3ZekEkpbIrw8SEfEYzLqfV+zMkE66LwSQgAH
         J/9t3uAU3bdp8oBbnvJrozDmgGIPrvdxK++icR+kealGF9UpTrFfWf24e3QspDEKCluK
         CiFw==
X-Forwarded-Encrypted: i=1; AJvYcCUSI6blj/7URB2MuOr3Kvd/8JBpgIYZ2gwrSEtbVf7waKGS2nUF+rhPsp61FpqTn61wTAlMHjIuQ8hQRpQY@vger.kernel.org
X-Gm-Message-State: AOJu0YwA9ss4ltoP8LjqnYJK9+YCkdH+2VECVszoXGcGfdCn+kBdGIsT
	6gNJU9BzSdHvsiA72/p9D8K1AEF+0HkBDIXR4oVWII/eGRjuonxWQUimJk2hO8x3gwmzpUaF4vC
	MlddXmnHLpzODCdSKldj8uboZAvxGyu1t9QKsZSySeJEdItXqDOE/yluYMpC64tdVpMok
X-Gm-Gg: ATEYQzzsMt1IH0ZQtfIxT8nJW2quy3vXumuNf50BkdY/nKBbs9EpsOLg9J3KSvWedDP
	lkjlBeIVDXfW03JOlakpTUbv0nRz0GvJvcLJvnT8R1lgDf3jYsiJeu+xFeraOi8jRsLGf/jYDb9
	q3rqiKG+x2VJ1VxGYIdHo9kMZU9aouZ3TeqjjwklfSyJJdwcldACTOJOpI6XZtVMI4rjF28WyVl
	W/iPozk5S3/P72yArgoxH1OuIqe0RWPbrPpbz6l5XsZZzqq5K7hMVjqE6K4F2rXN+C6nr7XilNp
	12aP2/CE59wpPSwlQHqG14fBdHWNbXtooGHRZsfrQljuUi2njqjlgZdFQ6U5bh7GDT+OAQDkr9+
	zczXFfwlx2YlEgimWhlBhx2gEt0iVZfGtLqa4FCJ+77OaAwy4e8ysCswe
X-Received: by 2002:a17:903:2349:b0:2ae:7f49:dba6 with SMTP id d9443c01a7336-2aeae7b9c7amr25539425ad.17.1773232849678;
        Wed, 11 Mar 2026 05:40:49 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2ae:7f49:dba6 with SMTP id d9443c01a7336-2aeae7b9c7amr25539125ad.17.1773232849154;
        Wed, 11 Mar 2026 05:40:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2466a7sm23304385ad.20.2026.03.11.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:40:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:10:38 +0530
Subject: [PATCH v3 1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON
 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-t_power_on_fux-v3-1-9b1f1d09c6f3@oss.qualcomm.com>
References: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
In-Reply-To: <20260311-t_power_on_fux-v3-0-9b1f1d09c6f3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773232841; l=3724;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Pt9eBf3q+rpnIa6pxHeLVY+V7c9hYTChfRhtMtFrFEg=;
 b=KHFAs89LsMBYL5fHydYgDFo5VhcbamTST8VkKk6b6M5RUp5TA02BRoJOjr6mcp2jkNH/UfEUM
 TQ1Ze34FsL5AWnmVpEQtv+Mk28RFPYk+oK2Mjtv34ACfbkFvMGqs3VK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: TQi_z5rggAmfjtZHojeOnIZ3bgT5zz3H
X-Proofpoint-GUID: TQi_z5rggAmfjtZHojeOnIZ3bgT5zz3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX4sGRFj0oDrD5
 fiHbd+a4nRTekJ7EpG3+hswAT+qcGDbmoLryKRBrTMISolRrjIfW+rrpPGxCWSOR49cuDHXqGmE
 ds9/tQpMYeUb/k7UsLratFW8UKPiIqklWA+5b/YemB+2UO/hjGX9Xt8vWoxRwXDCRKjCtiaew2q
 5zINM4bEaDCO7h9bfbUmgJ+c9bXRq9AQWrSdb8HUl9Nu4N6EQO5fmZ6xEIrUTFp9+Lfd7PlkT+S
 JVTT91/d7WYWas3AaRWMHLAZ12JcRx68l1hW4KIPg5MYLNpDaOv/yfy9UKLeNshBND3NOBbSXG8
 aPfw/kMG2peTIniEDGihEjlrb18mC4/Or1LLjbB2SyGGr9iTqB5gWCJPDhaSrho0E9YF80McLzd
 EqZ1eKP6rPSb4SL4uIluZtTI8AMKv/L/AIxLbq0BhUGXB/j2EmFn2snOChCk4w3ay4/UWJ+SBGg
 vtMKGOK2CEtuejB7OzQ==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b162d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j3416i00YO8nPnzCGbIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: D4876263B93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a shared helper to encode the PCIe L1 PM Substates T_POWER_ON
parameter into the T_POWER_ON_Scale and T_POWER_ON_Value fields.

This helper can be used by the controller drivers to change the
default/wrong value of T_POWER_ON in L1ss capability register to
avoid incorrect calculation of LTR_L1.2_THRESHOLD value.

The helper converts a T_POWER_ON time specified in microseconds into
the appropriate scale/value encoding defined by the PCIe spec r7.0,
sec 7.8.3.2. Values that exceed the maximum encodable range are clamped
to the largest representable encoding.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pci.h       |  2 ++
 drivers/pci/pcie/aspm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..48964602d802e114a6a2481df3fb75d9e178a31b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1105,6 +1105,7 @@ void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
 void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
 void pci_configure_ltr(struct pci_dev *pdev);
 void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value);
 #else
 static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
 static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
@@ -1113,6 +1114,7 @@ static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked)
 static inline void pcie_aspm_powersave_config_link(struct pci_dev *pdev) { }
 static inline void pci_configure_ltr(struct pci_dev *pdev) { }
 static inline void pci_bridge_reconfigure_ltr(struct pci_dev *pdev) { }
+static inline void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value) { }
 #endif
 
 #ifdef CONFIG_PCIE_ECRC
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 21f5d23e0b61bd7e1163cc869fe9356d1ab87b34..d7f9ae9e48c25dbc2d9b4887e2f74623688098e0 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -525,6 +525,49 @@ static u32 calc_l12_pwron(struct pci_dev *pdev, u32 scale, u32 val)
 	return 0;
 }
 
+/**
+ * pcie_encode_t_power_on - Encode T_POWER_ON into scale and value fields
+ * @t_power_on_us: T_POWER_ON time in microseconds
+ * @scale: Encoded T_POWER_ON_Scale (0..2)
+ * @value: Encoded T_POWER_ON_Value
+ *
+ * T_POWER_ON is encoded as:
+ *   T_POWER_ON(us) = scale_unit(us) * value
+ *
+ * where scale_unit is selected by @scale:
+ *   0: 2us
+ *   1: 10us
+ *   2: 100us
+ *
+ * If @t_power_on_us exceeds the maximum representable value, the result
+ * is clamped to the largest encodable T_POWER_ON.
+ *
+ * See PCIe r7.0, sec 7.8.3.2.
+ */
+void pcie_encode_t_power_on(u16 t_power_on_us, u8 *scale, u8 *value)
+{
+	u8 maxv = FIELD_MAX(PCI_L1SS_CTL2_T_PWR_ON_VALUE);
+
+	/*
+	 * T_POWER_ON_Value ("value") is a 5-bit field with max
+	 * value of 31.
+	 */
+	if (t_power_on_us <= 2 * maxv) {
+		*scale = 0; /* Value times 2us */
+		*value = DIV_ROUND_UP(t_power_on_us, 2);
+	} else if (t_power_on_us <= 10 * maxv) {
+		*scale = 1; /* Value times 10us */
+		*value = DIV_ROUND_UP(t_power_on_us, 10);
+	} else if (t_power_on_us <= 100 * maxv) {
+		*scale = 2; /* value times 100us */
+		*value = DIV_ROUND_UP(t_power_on_us, 100);
+	} else {
+		*scale = 2;
+		*value = maxv;
+	}
+}
+EXPORT_SYMBOL(pcie_encode_t_power_on);
+
 /*
  * Encode an LTR_L1.2_THRESHOLD value for the L1 PM Substates Control 1
  * register.  Ports enter L1.2 when the most recent LTR value is greater

-- 
2.34.1



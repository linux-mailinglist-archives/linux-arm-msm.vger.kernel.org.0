Return-Path: <linux-arm-msm+bounces-102165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC1TIF8B1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:06:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80C3AED6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ECB73074A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D526B3B7753;
	Tue,  7 Apr 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCnvo+02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBPvjqDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611893B6C16
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567031; cv=none; b=DSb8NFokc/3zJ61q6OjJudyUGdZwJZ0ltaQPsvoA5eMHreXTzut2incFTff+1YnLL3+m+x6knwWdVgjzxikstV4oEtCF5ZszYjmO92tT9VaRoH1AZhDesgZ5NxioHPlf8CKtWNVfVTEKCI3RGP0yfVY4lUq7khiaBSJGvY1T0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567031; c=relaxed/simple;
	bh=W1OhNcEspfBwAlfmZve2ZqD5tZvvm1E8mVApzAXXGuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WP8BXYHiqsOTqaIXTUxM/APCqyqlMptqMSrUGKQR07W1rsKhd/SAkaZXXGi3jiLg2LsrC2lFEo2By7c0egVznwXj2aZrJ1HBh7MtvW2w/C6S21dO3XC/ysLfyRU6vIGLLTCz4qMcx/FL1T+RJ50VouLP55WIhK6gHQ/iYknrhvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCnvo+02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBPvjqDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CZ42h2328000
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=; b=bCnvo+02LZ73oC4a
	eqaGfX+dMblgz/tmkFLmUryVC8AsbKahxJw3KkHa49PXG2aIEFG4pyZQBGTAQNqk
	54RqPlyHWxE+hWnEP07Gz6MBvzGaTWbyreMmBdoPVRjVSs1NonS/wvoiK1vZjQFi
	DFcDlMeD+SnxH5B+ZOTLHjfxAqca00CboKsTjcW4f6VDpEerqFRFcuHKosXPQA2+
	se4Gzic4JU8h7qKl7kCiLKes/msnmiIkMHgllj4+F4tEHDw/rd371UB6vnxoYwag
	mtfyotCOoZ9kBllaT3KB9tkG190fFMhiikAAWZ19JT7ZWCNxDI4rvfWTPSgTJzhR
	c0QwHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tsue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:03:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b256ed2cc8so54940035ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567029; x=1776171829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=;
        b=SBPvjqDHoMwSnVxcv6XOLh4kIhI8YZZroVKIiSz4fTgoqAhd+EIP7GLf8ha3jggtvO
         3ovQDtFDH/YxdfO01x4vBJPh7HUG/8dQ0BvFEi6gWAS5r08AR9d8qUV2YLE65sz+70Q+
         lMgrwToICoaSGTJ5rdvb41lGCrLs6vt1G1HbMTgm+DcFbZ8WR+mjBvuHdMu3OBwsAokq
         fn8w9Is012qT3Hb2tC7vivi1pB5LGOG+tO3XXbaL6wRVa/GMJif3UD8CFp8/yGfyr+9P
         pYY63tb4u6vrWLCJJBFPIULuYL0U/KCPcWUhs8uMjkbAvNi4KrPi5MHJF8D72bBPT6nu
         bVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567029; x=1776171829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=;
        b=heUk8VSMO7QGBnAcOFQtTl3IwESZObyj0lG3KCcvFxowC/B+3EQ4zjt50eZ1IE6MfN
         pi5EVp18vjjyjFi7gnevXbw2mMjqIA+jnnZvXJ3Rqs7tMdoBQP/ZDIhbzy5CC7Qx1GP2
         LJqFeVckbjjQcWP42TUfaOG2kC4FnS2Ps6w8GRWsmhBDSFxtfl+0PRrn8rBuQ8aGzNKj
         py+ip1gD/eBMcb6znSpJmMqvkERHzFUHNl3JJCiONcIjkCea7dLyW2sRw57Zd/z1q89p
         8YUyjD24HIw1gzQdNmlZg27kj6KyDJdk0gfrQA5Uhenh3LtLvr+hWSpQzqWczY3d2JZX
         T38w==
X-Forwarded-Encrypted: i=1; AJvYcCWKA5cnGLlzrOUH5i01y4kN5pRlPrTm267iTOffUl1H0vWfd/quCDZ0BoeCw7s6ipoVro3ArfO/XcOnf54M@vger.kernel.org
X-Gm-Message-State: AOJu0YwxsM0TjGL3Zd0vR1Gn9Ls7COw6fpTHTze7eN2vnM/FLEowG23c
	5KsgfVd7mj/2WfKKxQiykmIm/vyq2Dc2VMFU+r2wDttwaz+b9oCo4uDWjgbO6UFCdnvDnLIalq/
	ZBYbSbj5maAC1kQc6XkKhqBgrJk8OrNaQp+kH9ErDNEjdobG0yuiAHIxmQYAtfJobRjWd
X-Gm-Gg: AeBDiesg2abzUIk5exOV5s4MyCXoftGDDBZYfnxR1KbqV5Z27/HOWfEh49L3z2btW/S
	K1PN2VuEiL8IVHGHwqCDyRq9o065S8iMB8HMAczm13o4JO9I7iNgPZeBEt3vFlVAa/kofMz1QMW
	wMV6UuSra9YRT7Z2G91ftoDln5FB7WGjRk7qv2UIr0GcJELH0cJXnyEBF84KF9PxHcIf1bbsYk6
	qj+CYBX8XH09oqjj/ZLk90gNTGEOdwyQj1lq7TmguAs2GgcwGruFpzVoMtoOtfKz2ifD8PJTFTE
	WPa3cnDfHSXAMjOSv8y6zhM+IDbO+6JNmn1l7SU3wgOxneZKcEz0rHIoSHREjrMJ8EV6wbTI4EC
	6Ji5UXRCLDzUYevrtBZrVfQvOJuxwha5TUqJzLE19/RDIXwbz6XzW4KJ5
X-Received: by 2002:a17:903:185:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b2819180c5mr167577615ad.43.1775567028594;
        Tue, 07 Apr 2026 06:03:48 -0700 (PDT)
X-Received: by 2002:a17:903:185:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b2819180c5mr167577015ad.43.1775567027939;
        Tue, 07 Apr 2026 06:03:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:12 +0530
Subject: [PATCH v4 5/5] PCI: qcom: Add D3cold support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-5-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=7930;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W1OhNcEspfBwAlfmZve2ZqD5tZvvm1E8mVApzAXXGuI=;
 b=o5n5mzRCb1hInEwIP9Lo/mkqs1V+NaPD+q4D06Qd+qeyiIvLq3qU775agBpWtloe/QTme7jjR
 nCXcRkr1zXNBKMFJTclv0uXBflgy6ODXlnpBwnYuu/TuB08Ps/73MqU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfX0SM21uSYNdw/
 BiddajeSnfQ5qxtWRilNhT/hU7kRKlUqu/IN9lCYEK8DOPDoYZKcNrW2Fo9Hto8gBKCeMJndnsu
 UUS3cWnYaCuEd0r89m47dGyjl9cF4L0V8qbD0GGnOYwr41B65wQinZjq8Wp+zNORuKfwaiaOfBP
 0Sjpa8Pm2vhCy8R5wPecIDtFa8P6y1ut0p0f07jsGVrxmd1HYl0UB82QUvBWbpyzu1U7YSCxba9
 razjWrLF8DnTHGolWgSb7T/DUb6+/rzf6UKV0oMQwVnFlC3eT5GUvuRuqwOpI20aVlWlGewe0DC
 MXS7MYGKnf2+JKI5XvFcrj//xcNo4/nZChaWidXDA7uqeNVRldrv6zJGAGAnjjG/64vI+kZ1xHo
 5qP3Eh3z/C9vKIN9+tKuGi6gyYmrXcsd0GKpwqjqEe/l29E3EP07OOy7xo8uc2YusY0nHd/LkNC
 x1H6UWrDveC2KiTO2Xg==
X-Proofpoint-ORIG-GUID: M1A65t3Rl6KYFq251fCRK3tRp2JjDTas
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d500b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3yJ-4rlz3SFKGY1FFUMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: M1A65t3Rl6KYFq251fCRK3tRp2JjDTas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
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
	TAGGED_FROM(0.00)[bounces-102165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: ED80C3AED6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for transitioning PCIe endpoints under host bridge into
D3cold by integrating with the DWC core suspend/resume helpers.

Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
into the DWC host operations so the controller follows the standard
PME_TurnOff-based power-down sequence before entering D3cold.

When the device is suspended into D3cold, fully tear down interconnect
bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
by keeping the required interconnect and OPP votes.

Use dw_pcie::skip_pwrctrl_off to avoid powering off devices during suspend
to preseve wakeup capability of the devices and also not to power on the
devices in the init path.

Drop the qcom_pcie::suspended flag and rely on the existing
dw_pcie::suspended state, which now drives both the power-management
flow and the interconnect/OPP handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 150 ++++++++++++++++++++-------------
 1 file changed, 92 insertions(+), 58 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c14c3eb70f356b6ad8a2ffe48b107327d2babf77..e8d109c44dd270610272906244d1afeec3664f41 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -145,6 +145,7 @@
 
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
+#define ELBI_SYS_CTRL_PME_TURNOFF_MSG		BIT(4)
 
 /* AXI_MSTR_RESP_COMP_CTRL0 register fields */
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_2K	0x4
@@ -283,7 +284,6 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
-	bool suspended;
 	bool use_pm_opp;
 };
 
@@ -1336,13 +1336,17 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_deinit;
 
-	ret = pci_pwrctrl_create_devices(pci->dev);
-	if (ret)
-		goto err_disable_phy;
+	if (!pci->suspended) {
+		ret = pci_pwrctrl_create_devices(pci->dev);
+		if (ret)
+			goto err_disable_phy;
+	}
 
-	ret = pci_pwrctrl_power_on_devices(pci->dev);
-	if (ret)
-		goto err_pwrctrl_destroy;
+	if (!pp->skip_pwrctrl_off) {
+		ret = pci_pwrctrl_power_on_devices(pci->dev);
+		if (ret)
+			goto err_pwrctrl_destroy;
+	}
 
 	if (pcie->cfg->ops->post_init) {
 		ret = pcie->cfg->ops->post_init(pcie);
@@ -1386,11 +1390,14 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_assert(pcie);
 
-	/*
-	 * No need to destroy pwrctrl devices as this function only gets called
-	 * during system suspend as of now.
-	 */
-	pci_pwrctrl_power_off_devices(pci->dev);
+	if (!pci->pp.skip_pwrctrl_off) {
+		/*
+		 * No need to destroy pwrctrl devices as this function only gets called
+		 * during system suspend as of now.
+		 */
+		pci_pwrctrl_power_off_devices(pci->dev);
+	}
+
 	qcom_pcie_phy_power_off(pcie);
 	pcie->cfg->ops->deinit(pcie);
 }
@@ -1404,10 +1411,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static void qcom_pcie_host_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	writel(ELBI_SYS_CTRL_PME_TURNOFF_MSG, pci->elbi_base + ELBI_SYS_CTRL);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
 	.post_init	= qcom_pcie_host_post_init,
+	.pme_turn_off	= qcom_pcie_host_pme_turn_off,
 };
 
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
@@ -2072,53 +2087,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	/*
-	 * Set minimum bandwidth required to keep data path functional during
-	 * suspend.
-	 */
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
-		if (ret) {
-			dev_err(dev,
-				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-			return ret;
-		}
-	}
+	ret = dw_pcie_suspend_noirq(pcie->pci);
+	if (ret)
+		return ret;
 
-	/*
-	 * Turn OFF the resources only for controllers without active PCIe
-	 * devices. For controllers with active devices, the resources are kept
-	 * ON and the link is expected to be in L0/L1 (sub)states.
-	 *
-	 * Turning OFF the resources for controllers with active PCIe devices
-	 * will trigger access violation during the end of the suspend cycle,
-	 * as kernel tries to access the PCIe devices config space for masking
-	 * MSIs.
-	 *
-	 * Also, it is not desirable to put the link into L2/L3 state as that
-	 * implies VDD supply will be removed and the devices may go into
-	 * powerdown state. This will affect the lifetime of the storage devices
-	 * like NVMe.
-	 */
-	if (!dw_pcie_link_up(pcie->pci)) {
-		qcom_pcie_host_deinit(&pcie->pci->pp);
-		pcie->suspended = true;
-	}
+	if (pcie->pci->suspended) {
+		ret = icc_disable(pcie->icc_mem);
+		if (ret)
+			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
 
-	/*
-	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
-	 * Because on some platforms, DBI access can happen very late during the
-	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
-	 * error.
-	 */
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
 		ret = icc_disable(pcie->icc_cpu);
 		if (ret)
 			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+	} else {
+		/*
+		 * Set minimum bandwidth required to keep data path functional during
+		 * suspend.
+		 */
+		if (pcie->icc_mem) {
+			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
+			if (ret) {
+				dev_err(dev,
+					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		/*
+		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
+		 * Because on some platforms, DBI access can happen very late during the
+		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
+		 * error.
+		 */
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_disable(pcie->icc_cpu);
+			if (ret)
+				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
+					ret);
+
+			if (pcie->use_pm_opp)
+				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+		}
 	}
 	return ret;
 }
@@ -2132,25 +2145,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+	if (pcie->pci->suspended) {
 		ret = icc_enable(pcie->icc_cpu);
 		if (ret) {
 			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
 			return ret;
 		}
-	}
 
-	if (pcie->suspended) {
-		ret = qcom_pcie_host_init(&pcie->pci->pp);
-		if (ret)
-			return ret;
+		ret = icc_enable(pcie->icc_mem);
+		if (ret) {
+			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
+			goto disable_icc_cpu;
+		}
 
-		pcie->suspended = false;
+		/*
+		 * Ignore -ENODEV & -EIO here since it is expected when no endpoint is
+		 * connected to the PCIe link.
+		 */
+		ret = dw_pcie_resume_noirq(pcie->pci);
+		if (ret && ret != -ENODEV && ret != -EIO)
+			goto disable_icc_mem;
+	} else {
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_enable(pcie->icc_cpu);
+			if (ret) {
+				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
 	}
 
 	qcom_pcie_icc_opp_update(pcie);
 
 	return 0;
+disable_icc_mem:
+	icc_disable(pcie->icc_mem);
+disable_icc_cpu:
+	icc_disable(pcie->icc_cpu);
+
+	return ret;
 }
 
 static const struct of_device_id qcom_pcie_match[] = {

-- 
2.34.1



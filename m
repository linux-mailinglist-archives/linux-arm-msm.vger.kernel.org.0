Return-Path: <linux-arm-msm+bounces-77094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EFBD7843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1334318A7AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2730DEB0;
	Tue, 14 Oct 2025 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHQhrPiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2D30DEB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421884; cv=none; b=NvKySp90WLDQ4jzV20ueaDQHd6xpOIbhXqkxyPa4MlJTqZYxkKgJAXRsyi3d0JhXlXcaGf/8tEVrLO8abDHx7lRu9b7/tzTFKa1E7btSqD71lLjlODHAMnUcr/E57FXdvIesBXzRGK+U/MfJxECqx9c1HjCwmxE9fYhCmITdmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421884; c=relaxed/simple;
	bh=+ic5AihcIegAradhwux+QLsSKjrjS2y32uAShcvRa2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4ch4wZJxcKsXV79Q8MM8ySiGIi0cFfLgfyRu/nN6occ0uda7w/n0SlS4YWQaK2XEPDcr9ovOnzfCf7VqRHZKT2Lcse/6H6Jme7UOHMW0yBo2vsP0sHUi0qIxVyqI6Sq8cwtH1ADlRu3NKhIuYWdDUNuIrBj5yXMPlDhxf58TWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHQhrPiB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9Ui008100
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tDnjiEFQvmj
	6QEflrGl3a0N01kBNbGPHWb9PIOiOQ2s=; b=aHQhrPiBSlcPJpMDCb4S8oq9H/z
	6vWvsWxknKCM8gFKElfXxKcq/bfHGw59tTu7aIEkwSEogNk5CirdKkLsX5PjFF/8
	HAuKQznIwur65GcbOoTuYIds5EoGvQ1ruinDQcR2RXQXdgJaB1iIWGof1Ucxkcg1
	VpgR2z+XvGKGXxnlfpT4pRCKR9upQA4IFHvcsWL1gLMASm6foLb81i9UHOMjEEs/
	kU1iJauzGDcKnw6BH/v3goWxEje4ZKEFq384jrHXsTBSr54y50G9AoUoozO8oLyN
	MxZnlYScquc67hvDonlkRCGlhj6xfc6x0FFXeDj3TUp+YEBMwS05MjV1tKA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt44p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b63038a6350so8215881a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421879; x=1761026679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDnjiEFQvmj6QEflrGl3a0N01kBNbGPHWb9PIOiOQ2s=;
        b=Y9ae69Ltkr/m3qArkPg0A9chtf5YBKshS7B0KvDASbFX8IAAsaVIRPJadutlz0Cb3N
         Wv7kgxxWR5c7bqmY69YG4lSwTWBJs03DDQpUtazexqTdtu0CYdjh2LcCDhYqDyr8kkTS
         kRniyH1zjqKnLwYgEOPO2KS764Uh16ZMqCRuDk0iG3FqAVEDgGnnVorzqShyh9/lKwg2
         N9SlQcFbAT2I+06z5krvCXzVceyFQjHXXjgiss1bUE3TTWqYxTB+0SrjG43vtLOp3ZOu
         GTRM1tfXMu2XdpS3TaGg4iN8XU3uZA4d7c/iEmqlEhoGB9tDM3VOSqF47jkdd4NwEkyk
         MF0A==
X-Gm-Message-State: AOJu0YwRdk3sAzxfunIGtHiERggqRafPeS2NJ4NL6wMBAnqWAAeAqALV
	OzYIazTBRw9qJCgNY3e222OhoL/unPRaOyguUBUCNAqVrOUpNZl1E54F0Vjo/6GRYKUBDeCqBAD
	pRg/s4rbLTT1oG9AzEvbStCEkkDQbAqSkVl/2cZboe58uTIwm8uiqkygXakjMleLUiRol
X-Gm-Gg: ASbGnctn0o1v2/Nzcs5r5LBTBqbswXQ/xo2cRIcofjI03lPjjUYX+ZcPXdkZLpeAaBd
	hzonyO3jpYUoAh6X8kUsX+QFTSms19+n6rsbYm3ABVjSBi2IpMiNqYtHEFyi+2wabZVYKgB/m7b
	T3yhI0aFbGfBzy7mt3Jf7wo6L8qxpgenSlcP6Z+UXRq1dTzm3mf6KXw40/qhjPpqrtGyNcsDd4z
	pT1pHiurEqzx258/SVXDycj3uFoaQxRSTknVV4wG/nEAEiUNx+xF/zGFNEdfqkwjWTeNoyUVO/d
	Eiy2dkR+gklM2mFlvTEG9gpGpehrq3c6A/3+IyQY7UNoJZWNsUx6/gWeLXjLik1BiHlO7Gns
X-Received: by 2002:a05:6a20:a128:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-32da8df32d3mr30176138637.2.1760421878966;
        Mon, 13 Oct 2025 23:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYbnXuM+iOSZX3hz/0dhkllzDFS6YwugLjRnZ5256l5aV2JKlrgvuY1ArMl3v0AvxE39tuXQ==
X-Received: by 2002:a05:6a20:a128:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-32da8df32d3mr30176096637.2.1760421878470;
        Mon, 13 Oct 2025 23:04:38 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0604cfsm13946024b3a.9.2025.10.13.23.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:04:38 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, peter.griffin@linaro.org, krzk@kernel.org,
        peter.wang@mediatek.com, beanhuo@micron.com, quic_nguyenb@quicinc.com,
        adrian.hunter@intel.com, ebiggers@kernel.org,
        neil.armstrong@linaro.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update to prevent race in MCQ mode
Date: Tue, 14 Oct 2025 11:34:06 +0530
Message-Id: <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5j05G3aFmvm4_5lWvilFb10M-yWtboVH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX1Aa79z4OhOto
 ky2Zg3uFCKk2fbj0GxFr3JfurVhH2/K3VvP7zsykvy45BZVXwMqigbgYfffw1Ipiu/y5qKA6rd2
 JweRRP2xJPCD3t/AqlGTSf3B50Bq3Y1WVSo6AjMHHdeDj0sE/0Vodwusw2eDQ5fEDfjFiRn/pJB
 ezWhuEtEPtz9IqOkbRK1NeWQqxK3jBnv8oCOFbwDZURth5IMf53FgJyFVaIqlRapJEqu5ptZtGq
 CXIxdxonbnhNvo+2P7qullrt8hneTMjLqPgU/3jX7in0XQXhfGDeVjq3bQ8UCajV0u3/YC02tel
 s+SNeRe/IQL0uvhZww3RXe5mKUQpGlRondp0fJ2jysbOAzydzdty6k/pDw2Dfa2fExVLTxoPygJ
 mAZt7TSaRnXThcvLooHQxPS966ffIA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ede7f8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qjqbbBDWswgaW-2ywKgA:9 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5j05G3aFmvm4_5lWvilFb10M-yWtboVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

From: Can Guo <quic_cang@quicinc.com>

In MCQ mode, a race condition can occur on QCOM UFSHC V6 when the
Auto-Hibernate Idle Timer (AHIT) is close to expiring. If a data
command and a hibernate command are issued simultaneously to the
UniPro layer, the data command may be dropped.

To prevent this, AHIT is disabled by reprogramming it to 0 before
updating the SQ tail pointer. Once there are no active commands in
the UFS host controller, the timer is re-enabled.

This change ensures reliable command delivery in MCQ mode by
avoiding timing conflicts between data and hibernate operations.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 89a3328a7a75..f31239f4fc50 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1286,6 +1286,39 @@ static int ufs_qcom_icc_init(struct ufs_qcom_host *host)
 	return 0;
 }
 
+static void ufs_qcom_send_command(struct ufs_hba *hba,
+				  struct ufshcd_lrb *lrbp)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned long flags;
+
+	if ((host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
+	     host->hw_ver.step == 0) && hba->mcq_enabled) {
+		spin_lock_irqsave(hba->host->host_lock, flags);
+		if ((++host->active_cmds) == 1)
+			/* Stop the auto-hiberate idle timer */
+			ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+	}
+}
+
+static void ufs_qcom_compl_command(struct ufs_hba *hba,
+				   struct ufshcd_lrb *lrbp)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned long flags;
+
+	if ((host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
+	     host->hw_ver.step == 0) && hba->mcq_enabled) {
+		spin_lock_irqsave(hba->host->host_lock, flags);
+		if ((--host->active_cmds) == 0)
+			/* Activate the auto-hiberate idle timer */
+			ufshcd_writel(hba, hba->ahit,
+				      REG_AUTO_HIBERNATE_IDLE_TIMER);
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+	}
+}
+
 /**
  * ufs_qcom_init - bind phy with controller
  * @hba: host controller instance
@@ -2194,6 +2227,8 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_ufs_hci_version	= ufs_qcom_get_ufs_hci_version,
 	.clk_scale_notify	= ufs_qcom_clk_scale_notify,
 	.setup_clocks           = ufs_qcom_setup_clocks,
+	.setup_xfer_req         = ufs_qcom_send_command,
+	.compl_command          = ufs_qcom_compl_command,
 	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 380d02333d38..a97da99361a8 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -308,6 +308,7 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+	unsigned long active_cmds;
 };
 
 struct ufs_qcom_drvdata {
-- 
2.34.1



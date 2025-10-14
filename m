Return-Path: <linux-arm-msm+bounces-77093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC7BD782E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B211407435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E4730B504;
	Tue, 14 Oct 2025 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGqf4dUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671E2253A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421873; cv=none; b=n6xCITwsEgbBK3O3eWzxRkkUwonaIR+faEtAQ2tocCvHAuvsvc3X2Z8DA2r4tZ0axg+meJJ0jrABniShW2d2AhYP9cIZ8fKOAYAgX92othwSkhfFHqn2ByCjMHFhokfgLviO64X4Y1qQdfVsJlic3LXFHEa+z5eJQVtOGX3Jtn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421873; c=relaxed/simple;
	bh=sG4YcFPqULxpiO6jk4SnmPt855dNmwjEUSYMSQEfyaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RvzCh0rsT6g3RAlLyV4RlDqDoPNA4mx+Xc8sKcSHv6NaS0Ua8IAGE4XGva6lilOIqBhDFbDovpz+h6mVA/IRdtqmQhCKNdmqUx6WkLziaZFnZXHGHy5soqW8Zdtp5X+6OtNjBGGWU/61k3Bo5DVyqtJ4oS8KC/uE8izceUoEOTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGqf4dUQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9t3005642
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zMPUSJunhaD
	fhK9Gz/rT4F4i0rAWTDEoYWH8yvRVirU=; b=DGqf4dUQUmhLgIf73TcWxNgehnu
	EzpLDyIAM91JEVXOzvE+Ot+D61KUtU7jbuT5tBjYUCNerq2wcIU7xhkdZ7EYCG9+
	5tK/6y4eYHuA9eXWzZ2TfreTsVb5gwxfcNJx1an/PSUqHxfARjGEtZGzxM0YMRYM
	McW7iNw4xjQFZFWGPP/f/vOqo5GKCZ2P6uc1WY2AxdNcumqYrwqjcmRDjAQ7kr1k
	ZkQ78Z7NY2VpokwBK+dNSCFeCinr2ZDKqjAsGbOOrOnMyrJfZ09dTWwsWGXHgyfK
	xiB4voq1+a2szMITkWkw8Kw9580APQevE6c24Kxfwbho7CRDyQhjw06Gstw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87bd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 06:04:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78108268ea3so8974579b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421869; x=1761026669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMPUSJunhaDfhK9Gz/rT4F4i0rAWTDEoYWH8yvRVirU=;
        b=OPFpRxl7ze3RevaZrGZtSNdP8XasegG03IiXE30RHRp/Ki0sssIMxCv2NHsykSFnkb
         plCdD8dvWiKF6FFDOg/wvwRO87LRPXkQMJxVFthya6ZgA7tEq3Rkp0ICZfLu3RsVBG8G
         UTmqLTVjPfnsonM9ZVRbMspkxZdxBgOlC6ItTEUphkjETKk3XVJgrr49afrK+Q1VGY17
         mgxk2OUSw12ynZJfPfBWlZPY/jGxWkTfd200mbY4MpOoATJbx7BCRuqhG81xiFViPRTz
         +Bgvl/OeddbD5iX/sXxNNfnNgu84y+wfpogMYmlCkuFBL94kB11Wfe9+2bh4CEIK4wY8
         HIlA==
X-Gm-Message-State: AOJu0Yw+KOqoG0jbbpVl4HVPZFJonK1Nl2x8eBnHDy5IcLi3OCBdm9E1
	0XBfvCdB7tZns4wfi1NhZ3ifF/6aMXAm/sEQ5eZar0sBe2QsIpqAH31v6bOZhNpAEEN/tUgq+Dk
	Mwu3qvI2aLBRLFwCV1dydYIJnYHJA2P3L3HAS2/sOFCTMtH7INQsxOyKBxe6zykc+MTY1
X-Gm-Gg: ASbGncukVAqP3uPRyFFpN4DoYdwY+DD2B1JWmuu36GVCJV8bu64KgF/WeazkRe32y3K
	sVDaHKlBfs7ZSYmgAmqgc5Y7NUbTMcfI5/nJ0kgYNMvSSy7F4zZNUQq7g1qJt9dGs0z5JfUHRJl
	JgfDg8qjIYrRE6D6NSGgRJeerm0uJAF5TqCKMuL3YBeZrjOURvbDxTxW2YOkVS6oaYZqdTNLBFR
	nUXybV1J/TFnC4xWxWQ2vjBDNeBjA8qMoCHoTXo6JoHq7iwNGJnpKK1RQDOpDO7CvFMPJFSBpS9
	aAv03dgxkhUTNQSvjNXKdNrYPOvC5bvYnosTC5dHiRwh2jSOFz+aPrvWz0GpOVl5+sQZQzXa
X-Received: by 2002:a05:6a00:3d51:b0:77f:3826:3472 with SMTP id d2e1a72fcca58-79397924911mr28190357b3a.6.1760421869359;
        Mon, 13 Oct 2025 23:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwMcocoLQ72iCYUYIIvWMNhyDUjxN82rfxBDl9IFZAS/hghDGDfVHM+Dk+s0hTKSUzFfkB2g==
X-Received: by 2002:a05:6a00:3d51:b0:77f:3826:3472 with SMTP id d2e1a72fcca58-79397924911mr28190297b3a.6.1760421868520;
        Mon, 13 Oct 2025 23:04:28 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b0604cfsm13946024b3a.9.2025.10.13.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:04:28 -0700 (PDT)
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
Subject: [PATCH V1 1/2] ufs: core:Add vendor-specific callbacks and update setup_xfer_req interface
Date: Tue, 14 Oct 2025 11:34:05 +0530
Message-Id: <20251014060406.1420475-2-palash.kambar@oss.qualcomm.com>
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
X-Proofpoint-GUID: ieG736wfJSl2At-wQcnOPFh4Fd9_4pZj
X-Proofpoint-ORIG-GUID: ieG736wfJSl2At-wQcnOPFh4Fd9_4pZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX0SBvGHB1cjpu
 hA4UMiL1yvWq/ZIOiUTUuprucs1ZMXcxQJMhrtKAV/X6hXo1ViV19fsxC95hBEsxJflLd3lPKSK
 qJ+PNRIAAnwJamBmatQKPsn/UILHMp+2f3hzEW7FLBdn5yRpigInDimp9uIqslJqv/4nBMGjfQs
 T0W5Sbs9Didhq9vU8ckkTdoW2kE4Miy80nFHfbR8SRywXsa9b38Z/Z2+NUFU5tnoYcjAceohIvY
 F0cwQhQK5JjOGxib8n19Cz0ZHk8bKJCli439dRasMSlkukRqzU5F3OoSz0+zr5ljrEhSnKR6fIq
 Z/ssvmSmRPI1WMsFsPU/S5JSJriJBr+z8W5Wumy5n/ShysUQkP/7cDOUAaRBMgoM4WfT6FE76KA
 vdcym91/JDD7tZMCztnTeQiGgcUrAQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ede7ee cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Nzu2oylm7KG0C_1tlNEA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

On QCOM UFSHC V6 in MCQ mode, a race condition exists where simultaneous
data and hibernate commands can cause data commands to be dropped when
the Auto-Hibernate Idle Timer (AHIT) is near expiration.

To mitigate this, AHIT is disabled before updating the SQ tail pointer,
and re-enabled only when no active commands remain. This prevents
conflicting command sequences from reaching the UniPro layer during
critical timing windows.

To support this:
- Introduce a new vendor operation `compl_command` to allow vendors to
  handle command completion in a customized manner.
- Update the argument list for the existing `setup_xfer_req` vendor
  operation to align with the updated UFS core interface.
- Modify the Exynos-specific `setup_xfer_req` implementation to match
  the new interface and support the AHIT handling logic.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c     | 6 ++++--
 drivers/ufs/host/ufs-exynos.c | 6 +++++-
 include/ufs/ufshcd.h          | 5 +++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 568a449e7331..fd771d6c315e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2383,11 +2383,11 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag,
 		memcpy(dest, src, utrd_size);
 		ufshcd_inc_sq_tail(hwq);
 		spin_unlock(&hwq->sq_lock);
+		hba->vops->setup_xfer_req(hba, lrbp);
 	} else {
 		spin_lock_irqsave(&hba->outstanding_lock, flags);
 		if (hba->vops && hba->vops->setup_xfer_req)
-			hba->vops->setup_xfer_req(hba, lrbp->task_tag,
-						  !!lrbp->cmd);
+			hba->vops->setup_xfer_req(hba, lrbp);
 		__set_bit(lrbp->task_tag, &hba->outstanding_reqs);
 		ufshcd_writel(hba, 1 << lrbp->task_tag,
 			      REG_UTP_TRANSFER_REQ_DOOR_BELL);
@@ -5637,6 +5637,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 	}
 	cmd = lrbp->cmd;
 	if (cmd) {
+		hba->vops->compl_command(hba, lrbp);
 		if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
 			ufshcd_update_monitor(hba, lrbp);
 		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
@@ -5645,6 +5646,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 		/* Do not touch lrbp after scsi done */
 		scsi_done(cmd);
 	} else {
+		hba->vops->compl_command(hba, lrbp);
 		if (cqe) {
 			ocs = le32_to_cpu(cqe->status) & MASK_OCS;
 			lrbp->utr_descriptor_ptr->header.ocs = ocs;
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 70d195179eba..d87276f45e01 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -910,11 +910,15 @@ static int exynos_ufs_post_pwr_mode(struct ufs_hba *hba,
 }
 
 static void exynos_ufs_specify_nexus_t_xfer_req(struct ufs_hba *hba,
-						int tag, bool is_scsi_cmd)
+						struct ufshcd_lrb *lrbp)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	u32 type;
+	int tag;
+	bool is_scsi_cmd;
 
+	tag = lrbp->task_tag;
+	is_scsi_cmd = !!lrbp->cmd;
 	type =  hci_readl(ufs, HCI_UTRL_NEXUS_TYPE);
 
 	if (is_scsi_cmd)
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index ea0021f067c9..845f0df34281 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -356,8 +356,9 @@ struct ufs_hba_variant_ops {
 			enum ufs_notify_change_status status,
 			const struct ufs_pa_layer_attr *desired_pwr_mode,
 			struct ufs_pa_layer_attr *final_params);
-	void	(*setup_xfer_req)(struct ufs_hba *hba, int tag,
-				  bool is_scsi_cmd);
+	void	(*setup_xfer_req)(struct ufs_hba *hba, struct ufshcd_lrb *lrbp);
+	void	(*compl_command)(struct ufs_hba *hba,
+				 struct ufshcd_lrb *lrbp);
 	void	(*setup_task_mgmt)(struct ufs_hba *, int, u8);
 	void    (*hibern8_notify)(struct ufs_hba *, enum uic_cmd_dme,
 					enum ufs_notify_change_status);
-- 
2.34.1



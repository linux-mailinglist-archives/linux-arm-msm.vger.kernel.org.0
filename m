Return-Path: <linux-arm-msm+bounces-104286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEsrGrbz6WmepQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:25:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA5450A24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B59C3062D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F9139526F;
	Thu, 23 Apr 2026 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSH2+rP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIsWI9UH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB9277007
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939643; cv=none; b=cvBbJkmur2iae7O3OcTuNMJdbAKDTxLWqzDcKCkQNA1HbFvhw5kTGeYXEK/oS4e4rtZDbQtDf1MK4lsM/YbaND3KGQiQo9sesmB53mKaEquWN+8c7hFMKbluo57jolGWx2c8FISZm9JyY/Sj3mOlI6kV94nkDgj3+QPCF5JipI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939643; c=relaxed/simple;
	bh=CQVFJ4wMQF0hgf5u2ec7VO1+/3jUN5TRf8lbubOO8vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jjkwANQTmAP79/+3CkYrrb4iT8tDGvNQ2YBibbu2rI2WSXlt2P7gIGz1KKBnDS0E2hFwtV5QWyPyIHNo23WFPA7GFs7LVdcnIvVDRcxshholzVQs7t1ePqX1lhs0S1tiDUR8GbWCDCEdBTiE9r3jTKXFiWiwqtxM0qUHfSl+Z2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSH2+rP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIsWI9UH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2vR366195
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K2aCxihMjpa
	uQgN1WTh46/Nuz1bB7Gm7H4WECMbk68w=; b=cSH2+rP8CtzI+Nu2o7nGcTYa5W4
	YLRhl9mtZ39Q6SONJq4hZPaj3obAxR1Rv8yNahrFulx0V59fBfGu6709kmwicPc7
	NSBMWVx1Ikeu5yzO7IUw18yrXQgHeMzScLXua+K1w250mYFBW36VfCrgxkRl0bkm
	kN+QzZSkAYZZO0lzlnuHITWal2n8g3o742EToQhs9ii5zIqE8XCGtfa25ifhLeEd
	wgHkPEpjIsseOHVWGRhLExZkCK19y+ru23uJtheMivuIseWcsKRksqGPVLB7RcYl
	3PGJIKiM/5BdT9JZDG6m8Uouc8l4vUtxPKfzZDTGz1AQ9p3Fyw9DOpYkdWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rb00m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3568090851aso15745366a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939640; x=1777544440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2aCxihMjpauQgN1WTh46/Nuz1bB7Gm7H4WECMbk68w=;
        b=bIsWI9UHknfM2IOfKRbsYXL770SpH1MBKMqasnZ7Qtj+lDvgc27COWzhAMNJmJ8vgP
         5f/vJ3FRTFcQ72DjqWvWmfyulcuQ45FzXMIlLTt9RgKIZan396ypysk4G06+7zGbPLOX
         sdPIXmpZwajI8ywx24YQvDUm+7wE9VD+6rzV4y3EOQrCrzlF3tgCstmlE1leOC2yq295
         lycRCoECMyQb0Cl0qbYdACuXdA7ssRkCVdepnB1T2iMTCZikeMFbt+/HPZiO85G93Xct
         kkWduq+GysKc7SCYJBsSIu2KUSPqnJKqXY+rGmyxKidnk8QcX7Qv2gYWOsW9wlmbTmpe
         Pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939640; x=1777544440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2aCxihMjpauQgN1WTh46/Nuz1bB7Gm7H4WECMbk68w=;
        b=tIstOHJZNMdATaU0iq+HIDI7D3VLmgvn/IkzoYxOX0dJdbOkkYfgmKmVPSN3ZflOiw
         epYisLbnmjIEXiOnI9Lx6WOtRWd4SD/SGtvOv4Om7g5q3bZ6ww3/jRBqUyhCpIxrcCaU
         5QorBjZNgh9Q51HDkZ27THQVTHOW+57YMuZFvO/Dtgsv0XYSafv57UIpDolbPJYkkdKy
         6LMr3dwYhCnFLHSnrxJ2lzpXbuv5fHAcJmt7ifPPSArTpDIGmz3zAn+sWsIIfxctI8Ad
         SWLrVjdhXcELGeUG7+X2zT/dnZBV4ZXewWaAuPbtHk+C+LQkArEPDGLVzw4QBrf9WsaF
         Jy6Q==
X-Gm-Message-State: AOJu0YyTIGYzt6niUC8t7Uvj8iPENN/BR2bgdmQDmET/3l9FH4Sa+96U
	je6OhUzlUki9ADUqeW18BXki+e6b5R8PSB8eWu5XpCZgo23iyFEsVJXB0tn9nBevQsy3zHGv0pZ
	DDgJlRPunmATb17UPrDHQYOtUqOCVmQaIYf4nuMBuVrArTn/THvWZzOeg6LWH3fgFnQZP
X-Gm-Gg: AeBDieu6PZUy2a3B9CG7ajuyZS/5ES9WeDwVQeSFSEQR6G67u+PgKypNt52P9FyAKmX
	480CQ5Ux0I8qOWjU2mhuEep5EuSosL+b7czXx8Y+wGgS5KP620dHR5mVh4JuPJHpc+pMAwgq4fC
	iPoBlWWX13vf3fKXWXsQDxRyxNhYrDQqzk7Bk+xaT6Mz/Lo4CgFz2cWAnwQzyHpuCLzZybETERN
	80/ha8Anw1V0VCGfMerFf4fMjVlXW6O5cEgTyLrsdDNi23PHvATzBIFZfYK6g8//weev8py+MUD
	7CM9acjhiLjiY+vMY0xliHVFkId6Sy/i3uMzR4MtFynnt1l8QriCMtX9NMexAP37Qq4gF0cC7vw
	Zcfew6KUBXWxaC3SWI641HrUJEnniFByN8p46B4EKgdcCjhJmHeo2TF2pTgH/BPbd
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr23785774a91.16.1776939639920;
        Thu, 23 Apr 2026 03:20:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr23785738a91.16.1776939639432;
        Thu, 23 Apr 2026 03:20:39 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f92183sm13944461a12.3.2026.04.23.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:20:38 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V7 1/2] ufs: core: Configure only active lanes during link
Date: Thu, 23 Apr 2026 15:50:22 +0530
Message-Id: <20260423102023.3779489-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
References: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfX6/HifBBCGFam
 iy6EDhJe98HcwDFCQo/j+iLOCYwr23M+MiodSwsQauOgOZrQdK62YJePplVnNrExbKsFe0HCujW
 Iwj8YkSR6rk5hvvVfjPj/iK/nXhgYv8QbwB1ScHi+IB/3TmaN7mcuV2einOAz7bqn4/RfXIDWs0
 O5JxGccgBerplBOikWtDquEFGy6svHwHl2LTRZhr/l2Oc2rQVCxPYoH4cVbRFyvvdBT2cv0oYx1
 55IZwusv1hw80Hs8XKH0qRGzjHif4vWHtml5rHBcjzblwSKq441+0P0i5W/rKKCUL0e7HigR7LD
 HXxtFY/gqDqh4D969t46TcX9KgVTSP4jX2TB17b/xw9u0mESl5CIeZUk17tMgiVN5H7xT+DpiOi
 8nlxVYRAuwJ4yuEm3RVKV45ZI+RprEE8qoT1CAg4OdmcgsRq5+igaHJmZjmd5uCoCaO4Oeq02EU
 Q/s+Q6TVJBOr8WsVuCw==
X-Proofpoint-ORIG-GUID: fj-v6owfkxiuXqtLuDAvtwSyVdIa-FKj
X-Proofpoint-GUID: fj-v6owfkxiuXqtLuDAvtwSyVdIa-FKj
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9f278 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=N54-gffFAAAA:8 a=s8YR1HE3AAAA:8 a=VwQbUJbxAAAA:8 a=Z8YMyZzXpU5RQDwMThsA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230102
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104286-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,rock-chips.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18AA5450A24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

The number of connected lanes detected during UFS link startup can be
fewer than the lanes specified in the device tree. The current driver
logic attempts to configure all lanes defined in the device tree,
regardless of their actual availability. This mismatch may cause
failures during power mode changes.

Hence, Add a check during link startup to ensure that only the lanes
actually discovered are considered valid. If a mismatch is detected,
fail the initialization early, preventing the driver from entering
an unsupported configuration that could cause power mode transition
failures.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..81a71616230a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,35 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int ret, val;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
+			     &val);
+	if (ret)
+		return ret;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		return -ENOLINK;
+	}
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
+			     &val);
+	if (ret)
+		return ret;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		return -ENOLINK;
+	}
+
+	return 0;
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5137,10 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 			goto out;
 	}
 
+	ret = ufshcd_validate_link_params(hba);
+	if (ret)
+		goto out;
+
 	/* Include any host controller configuration via UIC commands */
 	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
 	if (ret)
-- 
2.34.1



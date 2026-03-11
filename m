Return-Path: <linux-arm-msm+bounces-96875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGwrJmcHsWnhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:10:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B825CB05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F60131D3EC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E37C2F4A05;
	Wed, 11 Mar 2026 06:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNdKlW4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyV1Uz7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F834753B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209368; cv=none; b=gAAwtSCIdBdr1KhpgsyCbff3SF2XzYycaQJYrmVF9RrpVw+M3AOzAIrSxx5SCyDPtRWk57a/C47FaEqan5FCE+fIuV5swUr//NzpQslXPDXUcPBkN4HdEBS7wJpAO4/aBo/5mKhXDX6rulOtXyVlBPwwmtlKKpYtD49uzNX5hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209368; c=relaxed/simple;
	bh=9sccUKaZSr8ywssnVFM1RdHmOQ7XGxUmVBnmL132DMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u+IpgDGRLXGYWYYyz0jDiaCXDGZNZ2V/sTx55m7E2Nq/YTyztnUHWN1RyFJdYvpxagYrePS6NSijRDVcNBcps2xTj3iQOtvTxNB7IsMR34kmzFStgLlrp+NwUWPCPoeLJ59JOZMcQBUB6ovwUHgBvcHqpYNdyACmye0K8OyGqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNdKlW4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyV1Uz7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3egpm3760404
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SV8YcDYDzpo
	HRabnVJC4LyUMveC1weMJBeT5vJRXZ6M=; b=JNdKlW4icpULbagCyHC3FTHEB0k
	F1ISbD5BgkmAjVlMe16gyWMjFp/Bldx1Xemy3WMRvFt6mc9kuHAFHQYDlT9PmUrW
	SDUm7nAki5qFvcUi73TCK7gl6zFDRucPMRWfOCqT0vTnB31zfwShnfV4jVmSH8Ea
	lx4VCk4H0yLnWR1ffQ36UBSS6ppAFrS8Fe/61ybD3X5nDUYPahuBYmYmcSv6Zw5S
	HDNFnjjjsCYojNwz38oLhUWvlRoyem7m+BjVS7pAk+ZUZ18OQA2KAkz6pBsZThHE
	GblZu1iWIw6zcFwlatxo4Pv/9iS17UACK6ubTODyQ7mGeghkXAv1OII0q2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ukeg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso126137195ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773209365; x=1773814165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV8YcDYDzpoHRabnVJC4LyUMveC1weMJBeT5vJRXZ6M=;
        b=jyV1Uz7/TjoZPAtFs/hRVmIjl4Z/hC0H7yP28/oWiF49LRE/83Pel1QxYVv9WGvJJ8
         dXVgcB7e+4GykXwCp37hnoY4oLa5FAx3C0iSz9nJH2T50IiU80Xu8Yivj5OuZai996xJ
         q4+/BjKDRicbTwEddPlrAUZvvU6I+RZ2Io35URvqSK/bNNoLjZNQY/2kI0d+KiJnaXxm
         qOZhSuA5/LQ9yymyO1DhqzAKiSTUpEVthwpB2Mq3qAKWk4J7riGB8hC83kIYOhvamJz9
         6FjFehe4iJvQa/IyY0YFl1rYhd2RvRq3jk9S59pdsHOzIxgUY8QhG5G0ZDZh2fy8GcJn
         uXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209365; x=1773814165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SV8YcDYDzpoHRabnVJC4LyUMveC1weMJBeT5vJRXZ6M=;
        b=moH0xIjqvNDtkCo+nxEOQeIovDcbpdCyGJ62p+7n7rVYJij269JVF2fJony6l6QEO5
         YEQMAPoeW23QpCCT3ew2cAxgLDKjVPSfdjE7itXqTKM36P+m910SMXXYqiFV0JSibYq2
         SANO9J3O7V7GYi86esuZ7IFRPsSbpGThTUhKZ4sFUsFaUka5AxFibzXEIlic8ibpviOZ
         y/9+P+JJewgQFRKpom+TFaxJuwyogiH/NPpTUB5gey+K2Ak3G2VT9CC56FCQ0BKI41Ab
         7tQqPTIk5VC8c0gwMkYhWk6wUzL2xNd6PkMCCNdFJ7JMLfZ+xtlBNN6gQ+q2unsdHMMS
         b5uw==
X-Gm-Message-State: AOJu0Ywo/4xgvlxNq1bsmLCaDoyubAX6Snx6txsF7N1/XD/KxXXzq62c
	uI0f9Fga15a2tB1H6Y6r+1aWq5b1HhwTu4Ab+ZGglkicmDUHjW4gXPy2dNWnIVSBC8OC/k3gciU
	UrMkuva7kb0UYQcsdfccWWl32ulPomukNBb0buD36qic7plsac1aLDqMcAj26vZrCmoKi
X-Gm-Gg: ATEYQzxb3pLueRRIwgdCiyZvLgjquHepkOWHXSMb4xFWnZKDkZCyFXFV1Ld7NylHrwp
	mMsMvVCvJaRh3AhWnnb/GbSB2JHRbQhS83Ug/TUj05S5ZKUEcRIKT3BJuRAWiiNRUIBg2mBsx77
	77L72CDRPcvG8KaTzteUlxU2zJbKs9eexdqLeshjFhByYL5DJ5w1PX9XMuIQRE84kZk8oFaRv8e
	WpROOe7jTdKsnkPmNyQdCEayK4kDV9rInNwkpoGGEuwJndR6b5WrYIQnDpPjzd0OY55dzfW+GE8
	ouOaJZwtdZfm3Yw6LsLivltdTezghwUxb3ZUf/wXxRmnOpYaJ3kKi16UXViVVYP6lIB4rf11KCX
	tjH+a6gxJcXIkaFRy4i7MylcIQc+4JJu3bjAZzJfpVirbw3ltZ60ILw==
X-Received: by 2002:a17:903:3846:b0:2ae:47c9:68aa with SMTP id d9443c01a7336-2aeae92a03dmr16644645ad.52.1773209365201;
        Tue, 10 Mar 2026 23:09:25 -0700 (PDT)
X-Received: by 2002:a17:903:3846:b0:2ae:47c9:68aa with SMTP id d9443c01a7336-2aeae92a03dmr16644355ad.52.1773209364705;
        Tue, 10 Mar 2026 23:09:24 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246fe5sm12433265ad.28.2026.03.10.23.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:09:24 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ufs: core: Configure only active lanes during link
Date: Wed, 11 Mar 2026 11:39:11 +0530
Message-Id: <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
References: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Cs_hLp6IjwA1U_wrc3QNFu7x6ci53lk1
X-Proofpoint-GUID: Cs_hLp6IjwA1U_wrc3QNFu7x6ci53lk1
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b10715 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Z8YMyZzXpU5RQDwMThsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1MCBTYWx0ZWRfX5LP/DsX09NEc
 9R7rJo10OkoJCyQKbiiKLsqeMdOU2X8ppLKtPuegnKh/jcqDOfQ+3paNNCw7xJBpnxdL16tYZmm
 HWagkcgHkbfg5GCRWd2tKlBxEXukd5JmYprj9k4FmeatlEfDsV7gi9E1nHIYUWooXcXA9nelBYO
 yWnkWr/wHo+KpOYM7LtFKiZ1SP0QTu6/uhn8Ec9F77e1JiM17o16tjSu6/KtrDt6H6d2shR2xgF
 +9rSPn/8i29YyGuOETJY4HeW85ZxN5YpeJMzf5mw+GdLKypz4IO2wl1vDIxI3S9DydfeV/uhTWl
 KDc8kodaQxoqOJzz1KucwESOlq6t6Aa3oFiKSErQX5ICqpgrul5fsCWKKMhuS59d8xr9IfgmVbA
 5UYuaK2sPFecvhYU8VDSQnspCrQwSSVAB8Tqnyium42Ds6uLFRal1kCehYmbXjin1WCeGBtSlru
 Se30K9GEprHJqxtmxeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110050
X-Rspamd-Queue-Id: F19B825CB05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96875-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

The number of active lanes detected during UFS link startup can be
fewer than the lanes specified in the device tree. The current driver
logic attempts to configure all lanes defined in the device tree,
regardless of their actual availability. This mismatch may cause
failures during power mode changes.

Hence, add check to identify only the lanes that were successfully
discovered during link startup, to warn on power mode change errors
caused by mismatched lane counts.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..c956fab32932 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,42 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_get_connected_tx_lanes(struct ufs_hba *hba, u32 *tx_lanes)
+{
+	return ufshcd_dme_get(hba,
+			      UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), tx_lanes);
+}
+
+static int ufshcd_get_connected_rx_lanes(struct ufs_hba *hba, u32 *rx_lanes)
+{
+	return ufshcd_dme_get(hba,
+			      UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), rx_lanes);
+}
+
+static void ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int val = 0;
+
+	if (ufshcd_get_connected_tx_lanes(hba, &val))
+		return;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		return;
+	}
+
+	val = 0;
+
+	if (ufshcd_get_connected_rx_lanes(hba, &val))
+		return;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+	}
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5144,9 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 			goto out;
 	}
 
+	/* Check successfully detected lanes */
+	ufshcd_validate_link_params(hba);
+
 	/* Include any host controller configuration via UIC commands */
 	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
 	if (ret)
-- 
2.34.1



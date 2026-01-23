Return-Path: <linux-arm-msm+bounces-90286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLjFAf8fc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A422A71857
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0824E30488F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD6235D605;
	Fri, 23 Jan 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2U5j4y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKTxxSqX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AD3502B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152357; cv=none; b=fScyvtOsPSEWeCYIrXVj2/8wa2rPoAntVBkftyr2BGVlSHjBPoF0mGKn7pPFzSzs5Zzsbpg19lDEeJoxq9R8+fgyOCxu1sptpRhEW9w37SOjIcRtRQfcslpRb6reqFVSP2/VoLLQ6RDydrCLgVhKDqkyHhXpr0bMMhTGfWGlfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152357; c=relaxed/simple;
	bh=42Oia7LlBi+H523Rmn2IIOy7T1zt6E32yOR956DWeLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujEvqtVOyER/XRYGqqIOxi1nrPT3QyLmj9/X6vyA8iMGXQLhv9QbqpLt7Vy1c7zp1lcCfHqSCYJUGwIlQcgcPcnXikOF2yrhwA8zMPxtvqaqhroTxDAPN0ouMReJRnx/LILxzr33L1gr9rPWVBqfq1+gaatKNHs4jPrd6QJ1nVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2U5j4y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKTxxSqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N3MqE81117608
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=; b=i2U5j4y5e34Rp0p1
	VUJ9iK+HIcAXwReO4m2dQRbSimKcbiG6bEH5EBlzXAqWIldWftIbvde+7wSYWN/D
	tCZa6OhVDYDn1JO2Wi3/u67OcsR+QLMubkoRz35j0m94W9xm2FwRUExNfMfwwfSB
	yu36lIhENLqsEYXx4kybda3EOwpkFmW2hAgJkiUn6eT3tcSeY47BfEi9aOUJVnf8
	zkaVMwjCYkZaDyd7nQyRLWsYVczAcELUd/D4DRPm8O9n8cFN+vM3OfV62CHE5qJN
	1GC9KcpI9c8AnYzYvc0lnvWpXonU8/CcodZellwJGhd14tB9ug4ucRorvlsVgA1S
	i4jNzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1cah0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so21190125ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152354; x=1769757154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=;
        b=UKTxxSqXvtxL+VyQX30JU+SXD8eS1mgPAbGH+mapoGBNWMWDhEKjIu3Ctjn9lBtgcs
         FadXwyMjXhVCio5YHX6eh7ym4kxDbpqzySdBVuuUUZC4CY09GS47TRU+1b1FcA2le925
         oazP7oNqKgd3/jyxFg6Tnc4YILe505Sy0NvqIoHmQNJxh55RRzXu31k7qRg0P91lTzPI
         Idly6rd2E38td5k/GKNYMbJFSujTYzc5F2bMkhcTo0DiI/pvMT0qEEs/TMPRSeLDW4YO
         hStpsXZPpMXD07wlpA0ta4zjq7hjDuwdlkqYE7VByCAo8utk2XOrtl+6hL6qaUvGx94c
         h3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152354; x=1769757154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAqEF9ipkGXaLh8o6lQtStQbpT65DW2PvBWxy9J0Ebs=;
        b=bqls/5ZhyAq2Qmkp3i75FZ9ZduveeSFo9YiQ+catEC/puBGC0tAj4T5vgewHw+D/QD
         fSmuNoUlJld0RUtoDNIhRIEqHABL35IMukQnOohW8EJtGDOgwDC9ycgMAuFPRxOd1WMz
         kkDfBBGxXdcAJ10XM+ASGzhnxpxbCZ/GWB0X6Bw/qmfPY3X74CNq4YoSzkmgHl7yNOzN
         DVVUGCjXz7uHnuZG0pctGJBHUzE9ZtOD0VR75w2gY7nOoKUJ1PKEK4fLVgoBAmPo/Ld9
         KJ3juqilIrSJDc/OeESLPrgHR1/vK4wZXdYCCw/qXaU5D1fxC+Sdi1Mw9jZymANr+LIl
         8gcA==
X-Gm-Message-State: AOJu0YxBXAIGun2ZR25E4J+G4DicCqDUDm3E1/+62nGVHAv+4h0pMi4p
	liy5pT4eCBf3zKZy/9PqrcyrutYnMGl0Xoo2mXsiwqK1a4YkUtrOPjNAeO7gh3QAQdA3FbPhZHq
	OERbh1tXlpM+3bF7wv8HH05WKEKImj87hSDVOpaQCEPfjiGot0l4iRYEyI37wBU0lumX7
X-Gm-Gg: AZuq6aJbuHbqfYksxR1HkKPQmdXlpEN4n2Qr02idSvY1YBBd085Tt7J2Lf10ptAkCVz
	p9YqmdtfpxA+wqNeikdPt2dP2rb+6YpvlBrbOWJt+ysbTxKnB55U9MbhqG2jw3XuhsfxhcLHvn3
	PbIYUY6/4c23k3+RbNWYXaimu0NcjaLp7voId/yxCiKg1RmvT09f019EaUDUWlmU9gdRi9bRPut
	rsfXdv29M9xhGdLULDrgvNxc8KW7BpX9CGaN+1ZcAYSIU/bTM+F2z1InGR4vP9KRDw7drO5LeZ6
	1l9TE043qji+wofkmNoVd0KJ8djvLy94mmiarhn8DNGRgLbfJcgxOCGmjGEvnPD5nI+ySMyeF0L
	2tvAgSh1Ck9X//W8AsQJJhYyK2MvVKri3V+rcii3x65+AsSU=
X-Received: by 2002:a17:902:e94d:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a7fe75b8d7mr21800255ad.7.1769152354478;
        Thu, 22 Jan 2026 23:12:34 -0800 (PST)
X-Received: by 2002:a17:902:e94d:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a7fe75b8d7mr21800085ad.7.1769152353970;
        Thu, 22 Jan 2026 23:12:33 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978e0sm11336775ad.62.2026.01.22.23.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:33 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:42:13 +0530
Subject: [PATCH v3 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-enable-ufs-ice-clock-scaling-v3-2-d0d8532abd98@oss.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
In-Reply-To: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=69731f63 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lzHOrk3F_0XHYG_XrgYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6ZPMr_N1_vZEei89T6_YdtAfpQkqwVQy
X-Proofpoint-GUID: 6ZPMr_N1_vZEei89T6_YdtAfpQkqwVQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX+/1KeyDOYbu8
 FRUcDyjlLmEe1E5UDU3dO8pcf8RHwIjn5zozva6dzJ1cMBzB0QfdRl/Fymdsyc2l1rGbmxyfKWR
 EpX/iGw1VUEEsXfGG4t79NMFIF4k8LJqMYGKeBuIpRtfbAoOBj3iLEbda6jHihFVib71m0u5Fbw
 NVE9w2KrRi9Xq4SIXxH4zuVP+vzQSkeAavknT46gYFSVRzd7c+J6FIm2kME08/VkKL8HiSd05NH
 8RwwtxivO5hpUlzERWCpXXuohW7YRlxT3TgWyzYGc1fsgcVSLhhvX9/4k1d1YYzwoHIMyxw6DWg
 CR/KlOb9o8ldkYfMhfG4paJLpD6zTjYC0UHjgyiDSRc4kMIca69rn8wbLSgbS5TzYX4gweHKKZo
 h1ww1Gl+ak0qxqzqjH9IqHLOof2o6YQN57BBBZxfUOGyncD492lDnsBERgDpnrhZvX0OAhTYxEU
 7V8vh3NAPfOL3uaD42w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90286-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A422A71857
X-Rspamd-Action: no action

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8d119b3223cbdaa3297d2beabced0962a1a847d5..a60b60eb777a674fb4345fd393bde0eab3571a23 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -305,6 +305,14 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, scale_up);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -339,6 +347,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1646,6 +1659,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
+		if (!err)
+			err = ufs_qcom_ice_scale_clk(host, scale_up);
 
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);

-- 
2.34.1



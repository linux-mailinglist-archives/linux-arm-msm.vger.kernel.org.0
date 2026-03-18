Return-Path: <linux-arm-msm+bounces-98451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDYVJGSRumncYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE22BB15D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D300301D947
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544BF3D3497;
	Wed, 18 Mar 2026 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtZWAF1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKV7PKix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C23D3482
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834576; cv=none; b=M4ViL1gTql0EzN6zilKnOn10OEbMEvcKcP4BtS/s+s9A9eZl9oZOZfvqvI64Re+AwrB5Ru9qKo1NjR1oSoujDl5RQuB8iHQ1sDanwhzi6njtcWahqUWf+eYx0HsTSUJxbGnrDsSSsdQAcbp2juCuKPNG9jSt9dYdAT+ubOjeauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834576; c=relaxed/simple;
	bh=BrZuPlklCAo71qWA5RBbDtAMQZKPiERrhde+rkkQchE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HK1iEiHXQj05HudiL8HrM9qOkH5OL5NrKNyoCVEwZt5zKcN7haEYGcWvQqk4nTbNIQ6UT0TrrT5VP2CSx9tTYJHELGpICQsbPmuPHsW0/68mpgZ/2ka8TDaYjqrPgr4vykHbM01ZnZux15vwZAcnwWIaQNG8wWebWFZ2LXePZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtZWAF1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKV7PKix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZEoA2878100
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y6uekHplewyqgNPzHqkV6E
	5PzKA4fuWkkb//gMyMjmE=; b=VtZWAF1JfTCOn3kMg2k0rq91Fq0bQHN7l2YXIZ
	VkvoWcCA0EtypC5bR4XGydkZvClGmv+VQAnyOTFnmW/A5zXJ4PHun5d3euJE/t0j
	xlnxTh7xHRKEMLfODJPP+NkzRByZATeT5TGAUgL8eAjO2rQH5/T2uGLQqMehjTVC
	GaAn+jLMb2FM0yfNpCF8dNP/N3uHv10nF/f+gCGt3X8loNa7sbE18i5KlnNYOs/V
	G1PXGHch1rfd+x6z7POk1EKyw7ZWF8JHlKi7EeF5mE+K8Ete3pZmkvX77ElR5kYd
	wLxVMYbqXE8NQ7CMxmRYJj5reAn04K1juru3C5gcSQmeHXdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr1aqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:49:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so6829489a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834574; x=1774439374; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6uekHplewyqgNPzHqkV6E5PzKA4fuWkkb//gMyMjmE=;
        b=CKV7PKixJhWVPKWgF4Ice+F8y5meSF000jEVI0+0/U3V12R9dioo8a3ja7pKjwTAQ0
         IraCB2EymAO6VUSwkmRnLxwxtqc6aBqOkV0uQq06kcmyY5iQ0HltdPd3N6p1FR+i58Wc
         eqv4Q38OWi8UQ9i4LishQ6czIjgaff4uiY8L1daK/+66i+m+T88QScYDn94sd6qPFjnW
         q9b9wQ77hNnSDC6ZLFcSLun5ryoChsusqcrOCPiCbtfjC2+wgbmHF3MqH82WpgMCzfsG
         ahshr3TaFnIlqRl52iQ14QYkTjAExY7QfoiZrhXf1WT6LnpPL9Wr5/o5CxYwH7G61jGA
         V+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834574; x=1774439374;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6uekHplewyqgNPzHqkV6E5PzKA4fuWkkb//gMyMjmE=;
        b=BbKV11B+Ebozi3oNbZM3CMGJau8FC6oYFoU0MZVclFtOWomol9RU45KrrfTzrjgg6L
         15mS2eL977ws6yd2v/l+ATHg51/hJlelM7tMCgvPXMZw2gAIwhIui3kMnS18dZ2qUEpB
         +SOTZ8UqOYDizzJF3X7doNZ1/UNsvfwY94D0ko0ukll6FrbsMQ72yAiZ20FM05HoqGyW
         9WISFEGh0rw9WJQAe50ARYH17hUVE76qX+5rbmZNMYX8xKUwIBeNuh3W/+bcfOrCVk86
         h5qMFVb6FPkXbmbbaUDgn4Cecf6p+H5Ss9TfZfqxBOsRRwjqV5wwhxRs4y6WlcmiPVBh
         bJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxktAzHQwMPdWCIVcIuOSCYFFa2Y+hnPTc3cG9Uhlo5/2nXNUfGAS15CrrvfXuoBkDH0+oYaaScKoEmtOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhb5nDyo23b2QjZXFDX0VrVo7qzTCGa2Xhy+k2vKnZ3ChI6fpw
	Dg+oXVT/EOwqJdH/xjBOGqAUmEBJUqC/53pWayOf+DPFVll3W0sW5ecAu806VhMbffqEyC0gnpS
	tf3Y7tybO1X9EO5g+wNEgfi+jvAszrVG8+rLcY+g8XC2UIMRQKUpRUcuRzd2cCXVxI5Wb
X-Gm-Gg: ATEYQzw1O4dCgkEneCSAAFJ6VGWuVUoXPWW1vRxWNAvgP3hQkRtSE1p6FUTIcnwc/we
	QIBuH9XGib1/hFFnSN/3ronVol82Pn48P+dVk7h0cz+Fy9wfQXs2/1rdsNruZg+IFhLzxOJbOsW
	6WeGqu9l9aRjjhfRQhq5XovHX+VE4989OOei3/osB9tyznFA2lTmXLiABfF3MB5x37hBWWQhc2u
	AMq4ZJ75hOxguKOSobkaFWg6mJAS8ZVEE4JobjR39h6zPMI8rGKmAMP63aJsD/kAJ7h3gAnWjow
	33wsiFstyKevvh70ywFHDqv+zWbRnmN5SRIQKRjATOSSzL8rFSpRkxj8ZYEILyL67QtgW4w7BXq
	d9dS9Yh1ZhVvqH2VuQ0ipq9kqLQ5dy8GmKqZrtcemb1eQdEFSxA==
X-Received: by 2002:a17:90b:47:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35bb9f2e18emr2458668a91.18.1773834573666;
        Wed, 18 Mar 2026 04:49:33 -0700 (PDT)
X-Received: by 2002:a17:90b:47:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35bb9f2e18emr2458641a91.18.1773834573169;
        Wed, 18 Mar 2026 04:49:33 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e543579sm2351542a12.16.2026.03.18.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:49:32 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:19:16 +0530
Subject: [PATCH v2] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-rproc-memleak-v2-1-ade70ab858f2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADuRumkC/3XMQQ6CMBCF4auQWVvCFK3IynsYFqUOMpFSbLXRk
 N7dyt7NJP8k71shkGcK0BYreIoc2M055K4AM+r5RoKvuUFWUlU1KuEX74ywZCfSd1GrIw0NoVb
 7HvJm8TTwe/MuXe6Rw9P5z8ZH/H3/SREFipPq8YCNzh6eXQjl46Un46wt84EupfQFSLEQybEAA
 AA=
X-Change-ID: 20260316-rproc-memleak-367ef8e1a64b
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Gurbir Arora <gurbaror@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773834569; l=2218;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=BrZuPlklCAo71qWA5RBbDtAMQZKPiERrhde+rkkQchE=;
 b=lyyyjlH5zeW1Pqi+u+EtZk3SE7wbtbfu/CEk5yxYGfMcTz56GvcJtHglpaJjOyvZU03w8GYkt
 X8s8qrAv6y7D4Oxx71HpQMUN2+RVVosLqaMYApOuiXs+YbU5+uRTKXL
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba914e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BdrfqlbclRokfh3ynYUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: KOMPAun4KKWXIydCSjE1NN7isDqMxxJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX4d7Yfpgvcv81
 wSCiVPJmXAfyFHKGWBhzsuYjLnkxYlsccOCklVcqnuKXhgTX0b/2+gKBDlGS4xA34YoCePFdJJu
 NqGalHgQEvO3RQ5XuPAAehzpS421zBtgr+kQ1F5YpqUlUpIe3yrKixR19b94MtbAUyeX2aJKSaJ
 iOeoyCpN9FacRCRPTdlfC/HCs8GQn4RUQLxRc+QHFKM9alDDpfODQs21xq7wsXyxC3jt/Mllb5/
 juMp081c59QrfDt4VhUVZmFpmYHNOaGDiNg870AqMMyPeOWPMWOS0vIcptu0EFQETYI9TpIcVN/
 sULLL2xfTgGhE0keuKcsfLDUzzJUMKGlnS3nhPnF/80UE5jS2NEMe2X31QOaFss3bZLtO6m5CZT
 JamtzIOqS33BFxOlYlbMB7cPxmLMfbzvDxNdnNA9rvzbpgoucfK3uX3IjQsB7xJzR/NVK9kta3A
 eydcSzEyCPWc5VrykeA==
X-Proofpoint-GUID: KOMPAun4KKWXIydCSjE1NN7isDqMxxJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98451-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wasim.nazir@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19AE22BB15D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Free allocated minidump_region 'name' in qcom_add_minidump_segments()
when failing before adding the region to 'dump_segments'. Otherwise,
the 'name' is not tracked and is never freed by qcom_minidump_cleanup().

Return error when adding to 'dump_segments' fails.

Cc: stable@vger.kernel.org # v5.11
Fixes: 8ed8485c4f05 ("remoteproc: qcom: Add capability to collect minidumps")
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
Changes in v2:
- Add fixes tag in commit.
- Add stable mailing list in cc.
- Link to v1: https://lore.kernel.org/r/20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com
---
 drivers/remoteproc/qcom_common.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..aa93d3324561 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -110,6 +110,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 	struct minidump_region __iomem *ptr;
 	struct minidump_region region;
 	int seg_cnt, i;
+	int ret = 0;
 	dma_addr_t da;
 	size_t size;
 	char *name;
@@ -130,17 +131,22 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
 		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
 			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
 			if (!name) {
-				iounmap(ptr);
-				return -ENOMEM;
+				ret = -ENOMEM;
+				break;
 			}
 			da = le64_to_cpu(region.address);
 			size = le64_to_cpu(region.size);
-			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
+			ret = rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t,
+								name);
+			if (ret) {
+				kfree(name);
+				break;
+			}
 		}
 	}
 
 	iounmap(ptr);
-	return 0;
+	return ret;
 }
 
 void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rproc-memleak-367ef8e1a64b

Best regards,
-- 
Wasim Nazir <wasim.nazir@oss.qualcomm.com>



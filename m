Return-Path: <linux-arm-msm+bounces-103450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE48Mq4A4Wk7oQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:30:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E68410D50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C7CE3023341
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AB93D412C;
	Thu, 16 Apr 2026 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4QzDrHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJYt2u4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CBE37BE7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776353233; cv=none; b=FfXJ9vwenWujzQCLRi0CNuFlcvB1RlKnl9MwC1v4ZT/VneFqfWBhk8Z5UykeEERVEPB1BxG5JgawKpBiIdr5Qq8nHmUL2W341nxi37mwClhyAzZBxwFIVEq6WZiLBc/tNCoOmVAi5rnNzgvhRiSpnR6vtP39n8eMDODMNTxjGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776353233; c=relaxed/simple;
	bh=/Hupkil2w1jlzYAGedFt2dhGhNfRNZcsPfGhYANNwHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=msQoA/Nr29KHFs+kpr2CDx+N/R2Cr4DOOejAOPY18uKiOd9/yIavVOg1vsr3bEii9mGyFs6ilNf4G24gh4pvM4s8s4TbPC8IMZ1V0VOg5qnaFKShEAFSJJF44hPeAkaKKJlCPKCieNfhpRFPKY1cdf/JlbPeJPz0qWM0VwAmOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4QzDrHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJYt2u4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GEZnZp3089111
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=crb4nz8XNPGc0Lk5gNyVfV3JEg5cl6V/wbi
	uybD5Maw=; b=N4QzDrHJKu34XK8XQOl29ESk+b9/sCgDRkJsMLbxhkK1JW8oo3E
	jLouCvR5GI+GWII7tVlXZwc8200ZqKKsqgWnmJNKiFn6WGgoerOQoo22EcH3zc4Q
	kRgx2e4U7s8l3nIzHDSvcQepEj5tZShrWlrSstwFaso9ZTADKS3+Hjgg2isJ9AaR
	Bauf+DqyBdeenLXc4YTVFBbh4FRkuwN4mpKvvxCLlY6t1Uz+PF9dSi+u4CT56ONe
	hYc3etwaGxSksWUrsddRfTdjKlJJXR547QHQtYbt4QCyB8O7hAu+SXYoNqGGEjUQ
	Ut4HIXCQLWBK2s9iRbvh+imVLSvp4eY5KPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djp6aaqve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 15:27:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2de07c12745so744291eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776353231; x=1776958031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crb4nz8XNPGc0Lk5gNyVfV3JEg5cl6V/wbiuybD5Maw=;
        b=LJYt2u4DaStOZDlf9KrUGxxNIWXANfxRQv1JfdBjD36uERjGPNzFNP/8fDYyfwU9aw
         0x1xxTijyNJUYavwQO8Q24jPxmf1gNOf0O0TiwqgwbG6y6DJZyGfzxvry6iB7mzHUyBc
         f/DGJ4eER7Mj9+1usvynvKYxUnd9xZXUFJaV4tn3+J1imGEu3337gvOEurI9oyBss0kW
         h+nXv3EJd+UqG9ywS8fCrx725XNhmAgEZmRec153l75FV329A/Z2SrQdXmq13nSoSBNB
         bZ1oPgPW7c7MpQw0//HhJxPkQuJRsR4w6RfBnNL4VVktmRgEjn7x0iLHn248xY6oG2BC
         NE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353231; x=1776958031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crb4nz8XNPGc0Lk5gNyVfV3JEg5cl6V/wbiuybD5Maw=;
        b=OEkvCLjkLPE/OQqLX6WCK7m1AO0M43jokzJCll2hJBwEH8NEcTTN4EhmrVu96nxjvE
         R+0Ez+dVgndfKD4kwdt/AHR1W1pjtFcQObgfTV7iU3qDzsc914KHUhbWUr4y+po+a1gg
         tclmQvX4jMB0CSOIfdSqDWQL36x/RHsLVinnEgdee+5omR8/WSeK9aUWN3OnIaYmlnS6
         Dw02+a1cTUjdgdl1yiij3UXbJQIyRcIWRqmQItFYVkfv6QxSUl8Wet0iFhKyUf//ZdxT
         97Mg2pYEfDMKfiCKMHJsAKAjtEZbi+MhDrTstz+M5oAV9UJszA3FMDiaNbeUxRjzLVlo
         QS3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9xv8/8DfeJkNElJTcafL5Lv9DhU7f6HlC0fxfmu8c/5pzSMHEJufGA4q7RTImJOH42dmD712OjLk2fPcRn@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLImciJdNiNUNavBlKT7zyTPYuUdWPEE3WUn+2MeHC9+ay5Jk
	BFSJmJ12jleo7lzNF3jPksHMMPyxRtufKkA05Es9uTHIHT9tovUFPLqzU+TYD4gA5d5PBDxUz29
	XCYtzL6zors8xs7RhT8f4tChMhaw1E0iGoAo0FmAwsRryyQr0iHhzXNvbiwPKl69Yehid
X-Gm-Gg: AeBDieuUqxPqxym5C1DD/rcWatrXS/SLXOdtoDqUgrj4zwAZ4rSBxFfdDYpapS5qm6p
	gK2kQ9FSNVH1FvDUm0lANZ4+L75mv1KRSk/Zr6TUiMbMZrxkRYo+3tuNbvqjCkLXkcLpXAtMcD4
	u+J+R201iQs9wyaYXqZDOBCwZxRL/fIeXY1juka5ErsA45myG0/YSfNKimtG0pr9h8+AU/8DqIF
	fPaSYBx4l4x8KO2mcwWcPtbMojAivWSb9hv5SmYTuHQ1lQowj2yPwMx0k6cS5ktxfqltRV5YGPE
	xTXMRmatHOcOhxmtHKMHCpqtvgSIeV/TTB7QXMVr48JH572BfwkN+2InWyH0jWS+AZcQcolmnfh
	u66hAfb108YsrS/NBO+q9jbfgfGBExnuKZ3Cd85pwUtsXyrD2O14ng8H/WbYMsqs4QQUPmBdFNX
	kQZL7LOQ==
X-Received: by 2002:a05:7300:8292:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2d932c83617mr7912758eec.28.1776353230727;
        Thu, 16 Apr 2026 08:27:10 -0700 (PDT)
X-Received: by 2002:a05:7300:8292:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2d932c83617mr7912728eec.28.1776353230005;
        Thu, 16 Apr 2026 08:27:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c016198sm7623545eec.1.2026.04.16.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:27:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible in ACTLR client match table
Date: Thu, 16 Apr 2026 23:26:52 +0800
Message-ID: <20260416152652.958229-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xVgIcPxsDS2OWbTH-0znRfQZZv4Pof_q
X-Authority-Analysis: v=2.4 cv=NuvhtcdJ c=1 sm=1 tr=0 ts=69e0ffcf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5nrg6hOtCwBaqtHYvE8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: xVgIcPxsDS2OWbTH-0znRfQZZv4Pof_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE0NyBTYWx0ZWRfX+APTwF5VSotW
 jDPDxHBmloNJno9EUMNooFTmcuFH4roiY7iq1lD/DiL0PRw+6lGWg0hphyspdrPTTYZQB86OZdk
 m2jplHTBiIOIwWXE5hKF+MtQU3fCSv5z7PsONrmgA5STDgLgFLJkO7Q2wf98nz6rvADu/mLM7mm
 j7vEJbZgQC5s9zR0XvkvF4ZPrApx8SvOxChk9guDJg+/VgbdVuYVYbID1KI8CzubJlq1+wKiil+
 grG23tg63kphWRxv7tJIDhuxfllmQFNbUw4dGW4xdIFoXbeylwhTLEfogo/qZIthidxx4JnKihT
 tyxdT6Qhh0zx1ftHDPAr2t76SnjUt6L+PH7RGh5I+5N599JO7jXGoUf9PUy+zh7fVC94Nq9CHTm
 LxNnyWXxZQ/rvzFUKcbHjEOElOTQTUQj7btdKLqQadIVQ/85s8raUoSuYtsb2wqcqOGqaI6T2M5
 YCUzAwYt76BDXpmEaRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160147
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103450-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36E68410D50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The qcom_smmu_actlr_client_of_match table used "qcom,fastrpc" as the
compatible to configure ACTLR for fastrpc SMMU clients.  However, the
"qcom,fastrpc" compatible identifies the fastrpc transport (glink)
device, which does not have an iommus property and thus never attaches
to the SMMU directly.

The actual SMMU clients are the per-channel compute context bank (CB)
devices, which use the "qcom,fastrpc-compute-cb" compatible and each
carry their own iommus property.  Replace the compatible string so that
ACTLR prefetch and caching settings are applied to the right devices.

Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..2d006049dd61 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -39,7 +39,7 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
-	{ .compatible = "qcom,fastrpc",
+	{ .compatible = "qcom,fastrpc-compute-cb",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
-- 
2.43.0



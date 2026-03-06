Return-Path: <linux-arm-msm+bounces-95900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KPlFM0Fq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3222576A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5027303BA21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634564657E8;
	Fri,  6 Mar 2026 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaJH+McP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLiytFuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55484611C2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815677; cv=none; b=oHJO8QYSkFEsryj/SwfPWKt06QuROf2SWbtWT4wp0OnfiAO4PzJsunAExmipNFykY+L3teBisonTBgrjeR+BmKcK2MoD/LwNL3mzH+cE8qiNRTHqMwQo+v1jumEOyeS6x+5kvhAgdd/r1k/3bbYrUeBlau1m+wYUUVw9hQ+HGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815677; c=relaxed/simple;
	bh=/BbDUKCz/O5KmFNyRz0+9nN5/pGmPXixxn1sr+yj/UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmeHrgED7HNW4Eu+1IPxHCh3l39aMfV2It9IBxOzqKp/3xdhu4z97UmOFDLoeNKBYNyJuyF6O8SQEhfFbfpmcJsRMm9yigVfBe0p/YdWMbqqqUi03tIedVT5s4mCPTU/oDo3caTcdWDBM1tEp4jFIDIC+vfsZmLUs2ezbutcdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaJH+McP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLiytFuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr27T550043
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=; b=RaJH+McPRDZR3nFP
	oUP+Ye6Ookspvrk3Ou42479ZpuB+v7sBAWJ98SpTgkS2eEkWngJk51d1Hh36k9Wv
	fXw24IiEHBa5Wdh1sdRDiUkM6jESruR4YhSlp2Kc+4JKI0shqMNrmd3RHiFFhtNZ
	Xi39uxYuOX/1BuoXes/lXA2kM+1V/X03L6qRI+GZtfnJKXTmHsoLZebP9qMX656i
	ZLzuTlmwu+WgcXqIN3gMlJh4joq0uRO2PEPw7XDwdZSseLoxXcJcEB/DF1ZYES5b
	+xE/aE4vYZ+2NqRJ2r6xdHghiulCWz9EkTq7tVUWgQBpDsF3udgyiARA4kNOdbE4
	E7v6ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka6aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd722c1a69so171400085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815673; x=1773420473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=;
        b=iLiytFuNazyeU9HP3ErdBKR0uqstycN1T05nau57hk/HVkjV4wSxMPvuo5Dp36LaDf
         kdHLqI2LIahfaSkCIeUJ4so1CzbdwEjiyNbhoZLuW+HFyyHDZdtvv3U/704AkKfb0aj5
         n3eHp+Kt/tO5ziyR/sB9P7YZzuGsJfwgdrR2VQUPOYkpaQmtA0bDfPv+reMatF9oawgT
         syPsAlly6IrlxmKT0efNm18sLRDRuXHyqycdwqwgDWM4QgCJ0v4BnEBY9vSBn6HOJpPA
         IxZMXSFUsR/+jib/DdRP3Ukbjgj5oZRuLu86U0K33T4SNjGuOcxbDSiBXfwds93ZRXXN
         DIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815673; x=1773420473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=;
        b=Fmvfhjb7XeOGHuezaXqvfz0MWsNe8BeVMlwnNs7dUCijmq8FvFWm5TmBOgkkxRDAMA
         9gximWHMvBMljqPnVgW1UWP12i4b3Sg/KXYC0AZLcXhfPXhmLKcZhUrE+EkUlJ8Zn3e+
         QI62Bztgptt4MWE+c1HlgmWfRstuzl5sx1PT/UyU3njMHjQRotXOUZzulTUumATUET3l
         U4SW7ZVMcKnb6ccY19anKX8Ju6JleXbSPisZS5pP/oy+dwX+lpq6IK+OuGsOwcPxR8Gi
         pcy2bhqCivFz9b5gSgQ36zcj5zCUYfp+be7r5nGZQqzNFCCl4v0zEn7fuH0h+qweJN0H
         MJAw==
X-Gm-Message-State: AOJu0YxNOHwoAKOLipDBHuTZYGXte7zq1VhCVHOQIY5de+ToveYfNype
	zb1aCAXBJR9dHfgtznXx2wnxdQB+lNJf+EIOfvKsTld8Jromwr6XMdZDzX8baY//JC/Yl8KmJvY
	IQlA0dJcKzxEBFbBHy4EwHGIy6n4yThChpkEIky3Nim/GL2XiwoUtnJym3W+ooIhisRLV
X-Gm-Gg: ATEYQzxVCd6J8Ufro0ik8XKal293GvR8SAsK2OOgRTm6yn0dDhEsqyHjms7imuJPwxn
	xFpkE1rDP/k3T0CLuSagM5gKS0KtqhKpxhWlifZYuEkq97671lGztIN2XP6S7kPbih1FBxlMjIA
	oKA/gJKAK040bvAqhk81rZKqUnEfEK+pFCu0mApCcUBUN0f37VVY8Q+gvSdYS99tpzVep9YXKAI
	iEJ4Qmnm5NmM8lL+eCvbEJKJA4CFtXWJ+yAari1PvCbEsqqoF9NA2yRN1aLZaz/gDGXYa273rWx
	sGbejI24XFk4Qd7dshQXf3qUcPVn8l1Fch65AIU2M3Mu8ssGU3UbjTwLUW62nUOSNSDY24lHsCK
	cU4PweGB422+VEfHQPB8SV/XugYyW1KFGi5sqITsfg+hPicQrD+Rvu7gk0mN40McK9x9NSGI9fm
	5GGEJIVYCGMr+Bx3lgRIXmv49eti0x5HBQrsY=
X-Received: by 2002:a05:620a:25cc:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cd6d4a8e8amr359972385a.73.1772815673027;
        Fri, 06 Mar 2026 08:47:53 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cd6d4a8e8amr359968385a.73.1772815672532;
        Fri, 06 Mar 2026 08:47:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:30 +0200
Subject: [PATCH 24/24] soc: qcom: ubwc: deduplicate UBWC configuration data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-24-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/BbDUKCz/O5KmFNyRz0+9nN5/pGmPXixxn1sr+yj/UM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUQ/tteObGEMjsi7b2r8xJL56ZQfGZyKnIDh
 2aBbGt7G7aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFEAAKCRCLPIo+Aiko
 1X3pB/sF4Dh+COqQRMpVibvjeOIpX3Uo1z1aJukR266gLx4TmlUr70Ww+iioMG2y8oznCbLTc5A
 UP5D/w+z0fVI5Pc++uhwsdgPOkv5EFjZ2i+ttXtXYz7mIeNjKJ0CgwXe8rJYS9hZshT8PTXl7IP
 xfvAsCJ3l83KET6tD+JnwsQluN7wak3sjLrrhGOLqm4ezVMpJd2hY1KvhdYUkR4Wm/Gd5UEL6aP
 yWaeqfyECHIOOYo3uLbWYVyAXJJ3Yl+6zgCTvTDDl4jGqweeT4+MGarIy1+zFtignwdOavE6McJ
 Q6Lt8b97wUzK6QQ4HMCY44I8SF3hdsyWwgstKaRxHFCXXe5r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX8d8IMH4B4kbV
 /QIgWDOB5QkSC2C/+EfxmwMpD3QRM+JqAB0VNCRTSbJURTpZQ9fHGdlvlig3HhDYYpF7uU+avPn
 A0jU0T5C1Wv20uz0NeLowrwYhzDuQoXb5tUgpKavFew7WzpAF5I3bd8PeU9ahP7zSAObkRWAlzY
 G5m/l95Z3hMzcNf3LTgSDciheEKzopqtsQnkNbYpzANaUMttQ1Tt/s5GKGPpHskDjiH27y38+AP
 AuYL4ztXTavOuNaP8mWGf6wffoNkF+iowXbWuM4d4UL+QPeN4pFhv9331lMzzc3pwK7IRzSW5LR
 bRbLbrhWQfXHkc9vBvHE4VloBa5K9PvdzBtMNdJlDRoc93jY1Df9zIFCTRdFawv4PSv0I2yxpJD
 0CY3OH7ku6cvwlxEqx6IRIS/G00Ga+9KdBdZL1zo19zFb5yRw7I+o7QtHi1aZ5D+3OWlxMb7HXD
 MnMu+69tnYqYcqoG8aw==
X-Proofpoint-ORIG-GUID: YvOC5Z1grzugRZOFHdZkg8BODJmVMJ3o
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0539 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=f57iFBScQPT45aafJKQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YvOC5Z1grzugRZOFHdZkg8BODJmVMJ3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: DFD3222576A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.929];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

After removing all extra entries from the UBWC database it is easy to
define generic entries, common for all machine classes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 189 +++++++++++++++--------------------------
 1 file changed, 70 insertions(+), 119 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index ccee20913115..2ee40a26ec68 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,119 +16,70 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
-static const struct qcom_ubwc_cfg_data kaanapali_data = {
-	.ubwc_enc_version = UBWC_6_0,
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data ubwc_0_0_hbb15 = {
+	/* no UBWC */
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data msm8937_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb14 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data msm8998_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb15 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data qcm2290_data = {
-	/* no UBWC */
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sa8775p_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sc7180_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb14 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sc8280xp_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sdm670_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sdm845_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb15 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6115_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sm6125_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb15 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb16 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm6350_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb13 = {
+	.ubwc_enc_version = UBWC_3_1,
+	.highest_bank_bit = 13,
 };
 
-static const struct qcom_ubwc_cfg_data sm7150_data = {
-	.ubwc_enc_version = UBWC_2_0,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb14  = {
+	.ubwc_enc_version = UBWC_3_1,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm8150_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sm8250_data = {
+static const struct qcom_ubwc_cfg_data ubwc_4_0_hbb16 = {
 	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8350_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_5_0_hbb16 = {
+	.ubwc_enc_version = UBWC_5_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8550_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_6_0_hbb16 = {
+	.ubwc_enc_version = UBWC_6_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8750_data = {
-	.ubwc_enc_version = UBWC_5_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
+	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -143,59 +94,59 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
-	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
-	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8937", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8953", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
-	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
-	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
-	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
-	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
-	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
+	{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sa8155p", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sa8540p", .data = &ubwc_4_0_hbb16, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
-	{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
-	{ .compatible = "qcom,sc7180", .data = &sc7180_data },
-	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
-	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
-	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sda660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm450", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm632", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
-	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
-	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
-	{ .compatible = "qcom,sm6150", .data = &sm6150_data, },
-	{ .compatible = "qcom,sm6350", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
-	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
-	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7325", .data = &sc7280_data, },
-	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
-	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
-	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8450", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
-	{ .compatible = "qcom,x1e80100", .data = &sm8550_data, },
-	{ .compatible = "qcom,x1p42100", .data = &sm8550_data, },
+	{ .compatible = "qcom,sar2130p", .data = &ubwc_3_1_hbb13 },
+	{ .compatible = "qcom,sc7180", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sc7280", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sc8180x", .data = &ubwc_3_0_hbb16, },
+	{ .compatible = "qcom,sc8280xp", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sda660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm450", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm630", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm632", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm636", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm670", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sdm845", .data = &ubwc_2_0_hbb15, },
+	{ .compatible = "qcom,sm4250", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6115", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6125", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6350", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6375", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8350", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8450", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8550", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8650", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8750", .data = &ubwc_5_0_hbb16, },
+	{ .compatible = "qcom,x1e80100", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,x1p42100", .data = &ubwc_4_0_hbb16, },
 	{ }
 };
 

-- 
2.47.3



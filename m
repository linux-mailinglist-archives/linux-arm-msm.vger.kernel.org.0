Return-Path: <linux-arm-msm+bounces-78219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC30BF8E78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABBA19C1136
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 21:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60961287265;
	Tue, 21 Oct 2025 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hh+G2pAE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD82882BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080956; cv=none; b=L9Z3K7QmkkvMqU+Qp0HalZSPb10fTc43nIMlYiTRmjHU7ccC7ipWDWaxE4rFbNHzXH+k4EODe/msx3SiSDs9A9KhigUmvnqLjujbN5QpGwr1D/joHhB+niLm5//TQFzdZ9B0y6yhBBqH+PbKCfIeQEZOz4/TiipMBtmGI8CzEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080956; c=relaxed/simple;
	bh=QNvlniIPRRmC+7hzmYy/77uxWdyoOFIOrKIrPOzfp44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8iMgFESPbICXUAxzOvqqCq05WcnRl4RbAig3KW0o43d8bJGMJxvdX63+mJMYwF6r4zH559TP5j5QXUKD/VcBV0KBQhdSTIQpa31BC+GI6rQbqWBR55woUhHgtzEAao2gYpr4xyJVfmElz25u1YjcelPrEZOjrAl35BiVFMqMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hh+G2pAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEmi2C031052
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAALojfa9D3YOG9vqJaxSjRtqnXPbgz0Npkm+sxU7tY=; b=Hh+G2pAEmJ3AR9Cu
	8BgjjVnlB4kFt/846t7FI3dL8WwgOi+z19kkrww5nwl/Cv9bFPNoJefnt7W2xC4A
	RtSA8MubZwtcpUMzRDfmaUq2hE3cklZK9NytC9le1wCp4kI2+0WNMri/8sBCLsSO
	EfGHHQ+AriyiIRXbEeGF1VUmmyG0AHROwMIhFWErffa+dRa1ojzroMxGayPKba8m
	xQDuldSdIDvUVMQppilR0X7IErGcR05QmvwvX05ZQYOwWgdQ+tT0m8PErKznPVJV
	wx5uUmur9vJryRX5EKuCh1mMgfE1a7z15amNBKIMIhpRb2Yoiy+RsLyZ0hByVoXr
	NSGKjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42ka2t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33be4db19cfso9633334a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080953; x=1761685753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAALojfa9D3YOG9vqJaxSjRtqnXPbgz0Npkm+sxU7tY=;
        b=QA8xfTSkuQ/JxmLi7ZZHPvwBzfEj/qcU35XWna/fNGBw0+c4/maT1Xrn3XbMFd4qvB
         aBKjGgigPzCIyk9N3Q6h+tqVkPUxKI5+IjpLg6egGGIR3xuVqijsUHcPkw5+DU9zB2h5
         aQzJuDpJDEoONzMq8UInMEHD4uIUsuvKz8wfrcXAMZE5TzaIep4k7SDHUPFxDfdiHIpk
         P3YS8nXfkvSwHBNTjKud9Vpoc+wzDUwcN3D2amo87DV4rQYUQpj//7p1XsBJT3cdqi7F
         IBFIOPBZY8bgtQnLC1SjdddfrcMs6zXAKAwCGXWWrVc5itTgs90okTXkmvaK2uOvOi5t
         ZEog==
X-Gm-Message-State: AOJu0YzPjnSXpiCSWdokQjECG/SVVDjHEQYEnqGa1BhvxQBAoZOjyQz/
	5MkzE64htgBfkKfy4Iye/aYTT4p5efqp7JqMilD//RWsDJSlCHHCFa40rE+qX+pfwh/TdtvjMRc
	xqZONIUx/JqTLXYhHvnSecqoT3EdEJmdYIRo6zhA5ZAsnADmdMHTQtQnD8LS8tYGq3BXH
X-Gm-Gg: ASbGncsHwNtBtIT8P8Dguaz0f+LY8bDEQyKELtvqM9YAnEfRNqnEdKfsaYt5ydhdeY3
	6M9ypEUqjgJOU1LMrSIqrnf50U4sSgESrJBevoyfYh+hATdMdsvLaQIL96PEYV1HZsWC6tEVBUq
	RFJ1fBj7asygI8fzDjTpWjyiCVEm0CdQ3HbGUNBBkcIio5rxQjeMjbp5uubpsCXj+6pNHsRbLgZ
	hp7JbBlopQlR6PRnuHZ96uibU6O3hSsBCUXj7wIP+HvEn2uDug7R+oydryRMnYMO9OEaVsM/3gj
	qjKkZl8CqMgoQypM4uc9lWg5fImGsLPtq37qKg8pnzU4Iqz9RI2LQ1o2DWMJ5XQ0jvjALJGdPcQ
	BnO1g3K7iYPROLm38FMbWUhN8soZ6yVqOfIqRsMUBWwsUaN8Nxnm0A090hlN+
X-Received: by 2002:a17:90b:35ce:b0:32e:32e4:9789 with SMTP id 98e67ed59e1d1-33bcf84e176mr21316826a91.3.1761080953165;
        Tue, 21 Oct 2025 14:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMpbS44IxkY7rp0ciZyWybKD9zdWqN+g8eCr9evFoO6q8WEg17R5Ttb5DQ0qQyfb8I4IpyEA==
X-Received: by 2002:a17:90b:35ce:b0:32e:32e4:9789 with SMTP id 98e67ed59e1d1-33bcf84e176mr21316799a91.3.1761080952712;
        Tue, 21 Oct 2025 14:09:12 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c813fsm489833a91.4.2025.10.21.14.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 14:09:12 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 02:38:56 +0530
Subject: [PATCH v2 4/4] regulators: qcom-rpmh-regulator: Fix coding style
 issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-add-rpmh-read-support-v2-4-5c7a8e4df601@oss.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
In-Reply-To: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761080935; l=1302;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=QNvlniIPRRmC+7hzmYy/77uxWdyoOFIOrKIrPOzfp44=;
 b=5UlbwWUZKgBli2eyjUgKM7AA8obLevlo8qUFii1yVNx/DPePcuttzmnMHl5bzY3kc+H7FcJwN
 mkbLakw8LMcCnumNA9UMb7LPP/eEF2cE3ygIqkuW62C0kO8ECmfzyXa
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: fckwLzkQ6iqWh6BqHM4QAwuR45nSUxb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX5owU460Qq6gM
 k8QKpVYlXaBH24ZmeZbeDdBx1jgBx+VKjTAPqKChL/BM9T/Ni+QLQZOwWw+bTmR7+7nRpHs5hgE
 BR/JbCAqaY9eR4m6rX/8tFLJ9k4KotTvPRa6d0kWwc6+pYB1vZoZHaVofSDSQKO3IyZMGGOZWeO
 9/uUk7GKdkS+1Z/dQ3LOtTwgyZwhWmFkDir4vpb5xvtL+k11eCH5718n2llySq6Hw4+LQtlYy29
 oQkgIaarWdWkDV+gtzouiDLhkgloR47ZzQzaC8hUU6AwNZnub25PIpok4uDHk8QoPhigLcbAbT6
 AoGZzato0cet6GNDKA8UWerRG3ldX1LSA4bKFbEfoxLMAtZ8iCdw4YfOX0lfBpJ/lArAodOtrSk
 E8fmz8Hj/u46uk0rfJTKcWhXBwhb7A==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f7f67a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TeyyAU4cBfKQF1pE9E4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fckwLzkQ6iqWh6BqHM4QAwuR45nSUxb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

Fix the code style/format issues reported by checkpatch.pl
script.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 9f693043cb87aa77a7a529b5b973323450db80be..6a36ef967d5d9e32c005e79a12099ebef824842f 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -109,7 +109,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  *				regulator
  * @ops:			Pointer to regulator ops callback structure
  * @voltage_ranges:		The possible ranges of voltages supported by this
- * 				PMIC regulator type
+ *				PMIC regulator type
  * @n_linear_ranges:		Number of entries in voltage_ranges
  * @n_voltages:			The number of unique voltage set points defined
  *				by voltage_ranges
@@ -387,7 +387,7 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 		return pmic_mode;
 
 	if (bypassed) {
-		if(!vreg->hw_data->bypass_supported)
+		if (!vreg->hw_data->bypass_supported)
 			return -EINVAL;
 		cmd.data = vreg->hw_data->pmic_bypass_mode;
 	} else {

-- 
2.25.1



Return-Path: <linux-arm-msm+bounces-102019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI26E+kw1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA63A7CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5870E3083FDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BCB39E16B;
	Mon,  6 Apr 2026 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY6Fynk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwNSfB/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BFE39D6FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513735; cv=none; b=odG9eAy7eovLWZSamEirwyVDHX09p3aH246D5G8NADCVvw/9pRQG86Xt676ruMPjrYzUlTuOZ6vsBHSdavr3qphQZn17hxT1YcS9KNaJSo42yEuvDEms/MEvvGuWOkH7x91M1p+Vrkm4dF3/+hldo7HLcDZe1LFSC4u/M7xhU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513735; c=relaxed/simple;
	bh=1YgVKodJDZ8iM/R/e5OEt67Xb1kzFcKpq6G+59ZkhJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlglK4MT/agHS147TjRtYmMJMSHvcQ/GVZ5PpW8FLAzST7iyRPgE0BZTlcNMU8dTgcQrkcjSO+Si1/3pM1FIEdSGaGKfTGJ/Z6A70FdOSvE5P7gcPCqrwA9oIVCHNsyihh50oT9uOQfSC1QK1DHQU7q7mDtFCQOodD2mE7QzTsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY6Fynk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwNSfB/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LT3BH2580473
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=; b=iY6Fynk/5hbzh4WJ
	eNgter3gq9mr/8nqvuIiC4q2iy4ncNh0/gXd/HhPvRDg4NDSsg1AtFCs+P8QEN0y
	qamNbUEBndUmvlekhW4TUBHlXr01iAB+MsazJOcev7RwvErWN59MyTOiuyPovJPP
	KZ2ng4x3h14A3cuerxkAB2pjqHQTFXwnnS7xfO9E5nef4XU845amUxzoDAstGBoT
	gEU3ILyc4YhpCP6RcXXs7BxPB6PqG9AASuwVPIUWrTXURfbKICWa9dfSTupltRnJ
	gmdp0T6XP/SQ2arC6icX/jQ4s2GOgNJH2OVNRisoiuAACJAg9g52aEv9ArzEDRRt
	+qiaNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf0343-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:15:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so4445591a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513732; x=1776118532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=;
        b=HwNSfB/2z5bbe8ZLW7luhRvMMW16JEVAUOQyZbUST1YG6rV+qiEuAb/J9pNnqdX0te
         jEwOXJJLO05ICktVD4SSnBNZV5pTtl58FrQy3/UPuopFg3vgmJPuq5zHnrGUJA4RQMIQ
         xpFvS5lrtcs772odh/tQ3lzjRaiHmXOmlQHv3LJbZXrqfxpXXRpjighUvs0Kux41Cbe+
         sexyhPMHajKcUgiTH/G1TZXrz86qmcRhfvHT3VCE6/rU0NJrNaPWw640U9MnYuR8+nYf
         uYYEX6gl4LnzELpOMl+OqbaLgsylZp95i0dW6Sad5mhCQtSNZy2eic++GTqenp2pWEZE
         IL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513732; x=1776118532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKUudFy5GoN8EsapexJf1THKoHxcD0tb+86k8TrzqJg=;
        b=AHq5Xu7rtPQXuNtc8NlaIcMxvhv3neN+0igPjty0WCmWhyT6MlTb0SNfULLklE9aBi
         ZBX8R7OURne736patwpjJSz6/Zf3gD/XPzY9pt/Aj6DFVeQgPBXtctP9JPe511h67VDi
         FkLMQB4uvv82x8tt11/wWp1RGXRfQOFy54Thxc7T5NUx6vwPmIE1T2eTQaM9y+X0RnEX
         0a3hyHCtctD526nhRwX7+AlY07YmI6nnMI7yBpQv5v9L2eoHVtIvN56AXf2r8d60jKey
         T8aIoz8LklNOjeJJr4y37Ang2NQlkGzIyYFPuBRuZhGKKEladHnzKvsA4NaqBov9iL+x
         tf5Q==
X-Gm-Message-State: AOJu0YzGTbjl1AAMx3exu/GQCyHTZldLjUtb2oOQ1OWHP/4c+PsU/W5b
	6Z+zop+BFHE1/O2Ns5Xp2NkoM1AbX1r8fiK4Eb8CATuCnUd6VuLvoJ2VDEY9R8ZJzLnWo7hUIDQ
	FCVf+UxG55sMQrhVPZEjsqaUE0op754+TI/96eGkE3tj4JfltRicCOR6rUE4SL3J2sGDD
X-Gm-Gg: AeBDieuBgvIU8Cx8mPeBdMMATvhkzhIkV2qwgkNR3r3lF3WyoYi8X7o+VO+gTw15kIF
	w8SCmN9u3IfGaAPl92K3OSV0ApOfPkQpCJw7tXBIXEohzWMvqpno1zgTcOBlXAM11jvc1dc9u00
	ivwCp+YOCRh7uhLKSNc8CLTg9eHpQNKv5PtKRHfJQMYQlIjGJbATzeelK4R5zRinuGIuYyiQzhJ
	5SCLxsyRnOg0TaW+lXhEHgkLkvRK/4s1otJsKsS5ZPPJMYTEe96VzdH0O/aBecI2a1LSh4/zXkv
	0uCoIoIgR+d6bvCZp8cyTl+zLQy8aaBh9LxNMIM7bl+TLoTB7cJSL/GKK8XIYS3k21HfuIWkp8s
	aRC4ZUqgonh/zXssQ3COTzEAGEforsmmmDgGD/s9cCpHpQt9giZ0=
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr9346417a91.1.1775513731934;
        Mon, 06 Apr 2026 15:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52c7:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35de591e934mr9346393a91.1.1775513731452;
        Mon, 06 Apr 2026 15:15:31 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm14447519a91.1.2026.04.06.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:31 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 03:45:01 +0530
Subject: [PATCH 4/4] regulator: qcom-rpmh: Fix coding style issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v1-4-27db2a56b13e@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775513714; l=999;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=1YgVKodJDZ8iM/R/e5OEt67Xb1kzFcKpq6G+59ZkhJQ=;
 b=DOBHACF0o826m17Mx0+5ibmfY/+/iRbsfs4UYVygRQ+hGag9Yly7S64I9SDWf0BCOshN5cx/0
 JtHZQ/hzfwDDKocdOxX/7cvROA8P319K5nlL51dkYr1C5BRnhMGOlUh
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX4e9zLRKHEVuz
 f5gFfQ91L5jiJa/K3dxCJQGSkerTrLpb0bA+pD2O5q7SYU2x+HgCPJUhJ1NOPhp1/CED8BHqvZB
 +eSOJxFyz9175pawlBPdPAzM7zf9+rcd8PrNwUmfyvo27yXplKqXJkjDs34H/DdIh5/Hnzq12yB
 aeTYX8GXunWvU471eHVSoFcyYDbLD7hSToIjPRDgD/Rb8ywXAjUoeDBO8cMNWEIB5TLLCIGH/fD
 hcfAQ9W9vDrDGFgzBfVVZNygtUAYL7XWaUlV1QeITPlXqUMTMG0FebzUwCJNXygYUcxM4idrv5d
 sulP2MMKv9/5gr3leJfopE2q8+fox1E5Gk15UfmiR+2ObI2LVJvmr6FNA+3lTNgx7LAu3pGg/RZ
 ElE/SAP4+QcuPV4zkYZn0xlAZOX//evCLkwquwuSTmDeV+801nifyfLuHhxFjBzREP7eOU2tiOV
 3cjMJUOCz2SFw6KjjoQ==
X-Proofpoint-ORIG-GUID: qlBxFTpBfM12poj_yxokwBBhuMMhQcat
X-Proofpoint-GUID: qlBxFTpBfM12poj_yxokwBBhuMMhQcat
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d43084 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A68ZeqOElA5rGN51AGUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102019-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3CA63A7CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the code style/format issues reported by checkpatch.pl
script.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 8e1c576b718b595bbbff7f5fa76de84d4e90f3bb..23ce4bce89d51a0fa5cb50adf37f38fe54ce5139 100644
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

-- 
2.25.1



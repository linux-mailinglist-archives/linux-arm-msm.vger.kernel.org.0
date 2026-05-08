Return-Path: <linux-arm-msm+bounces-106717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sByfAmsz/mmgnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:03:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4704FADBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 090C2308C352
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CB1402BBC;
	Fri,  8 May 2026 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsQqT+jJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjHj7C/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D133FD157
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266879; cv=none; b=f2IDlJUAWNSAO934hWXF2E5f524JoVuexrXI4+YOapXPr9xSe2j8/c61eSWML0lH8CmhbW8tHrpah6GgKwnJfoNrIYPJgx8dUzwozsVI6MNwLate9er6WFnCFXFk6duXhRXPVk41Yhv1Q9+6pikzT7QdGWiaHxOQlDqnBTLHM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266879; c=relaxed/simple;
	bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ+tnk5nftD2d4QmHpyDpSnxfU4a7rMvUiUuBhEgH+X+bWIMH5pylMs1vNbPLjnycHjbXJflWYCCt510VSsk7wV+mVf9AncxNnf25ZsLrLXk86dHa/PZ9FpUhN57scaWHVMMTlWYg5Gk5EDZeh3616ifAqhTaKUEGVxY/LzAJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsQqT+jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjHj7C/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGxqJ852373
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=; b=AsQqT+jJK7OarVWi
	ZhySwme7r59hDAWJcia8xqZu71PeYYkKLhiWLwB9iPEMnF/ZFHaRVI4twNgu4SyA
	amYtJjue/VI/DZ0JvSTX2WZqKrj/i/w3cRT7iO6umaUPa/e0Eg1YAO0d6lhvomlI
	I+KfGWGTqTSWQCoQuqiDKa47huf/lwtPSGmB8sj2pXb9u6fFjayKAnmj/s/Z9iyJ
	YNqXLMj0WQgloWGtFGOz/QYnbWhwx2yALtyrpzaDwwK8PyBzbZz24FZjE/6D1q8l
	UuknzV7/IRXcLNTdAMxtf8suuC1wqhwkiTPYLWP3mjZGTHqgw8eJJsWuGdOluEn/
	5YliUg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthk15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:01:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so2744391b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266876; x=1778871676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=PjHj7C/r7j8uBfGdhvkR+ZcT7lNrQULOPcqZ1SMVGoBbH3xqnVpRv6m5VuQwzfYayb
         8NK5M5vsDAtSw9Y1ezxjjy9/YGR+zTlD6r1KJYUcll5TSKs9o/T9mnIX6ZGZBLJfm6O/
         +oxTZL0LcJozNgc6JPl27krVbJau18N1vauTRcb+tTLWnoRj3z1oFBn+c6Rsc5sZtagh
         s81lFSI+SXwa1NOrsffwPN5J+6UlNkYMTxza8e0Zdbue37oXIFd/rpK7QRtOOuUtM5LE
         gOSLfhxoE7HxOZepNPL2v9kwpxNxcmt7Hh5BOJavs8jYA6aoCcH8TNL4cZ44EeyQgKrV
         zFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266876; x=1778871676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=ExS/6kxoBJJw3konQ18Yd0gd77u82T2/cPrTqv69EOssywINVTqGZ79VqDAp0YOuk5
         Mg5I9fjSBrQqtvGImJPPApCuJpStd+cSv+JHxsU/0C3cBhG35Au2mMpWBXahooVf0TxZ
         DCYVbqK3QNbzDBLNm8/1JF4y3M0dZwJbYzjmIiLX5CmwGYvyeib6WsNb6sS1WzSTBL2y
         HK0onGxQuzOwughA51yYhMzXvhfn3lbHgEKHE/ElyrxBuOwryG8AjPd1zLsNKnD635S3
         W3c+A06+OyOnbyN7MbMOnHquO7g9k1kcxioLwUWz+NAhh6TOVX1clD5zWpMvrddhKdgu
         MtWg==
X-Forwarded-Encrypted: i=1; AFNElJ90refH7LvzPlJFsdWZL5SUIwF04KSchK5G5K33lA2s9SD7njlv0tch2T+ytmjAtwNosNslQjU++FstczVW@vger.kernel.org
X-Gm-Message-State: AOJu0YzGS6YUhHk5G0ceSYfHTe2LGCiju9L4BqZl3eh1p4hUgB3ZgzGK
	L+ahWJ+WpBliiytxRAD+Zfc8HClGDRRHg4TRVBOa+Iyf6q5PLOtpmL7bhUwTLWKp3T6UfzI1wXt
	0it4rNzGRjK+u6ENFgRpDm++gydGk2DWtKIEUFm7T5rdvNBCpWCv/DWzjnEnR6BQT72Fb
X-Gm-Gg: AeBDies2CG8RnAmP0tJSITLskFXypIpmliL+J71M4dwyZwcD1SN3X2Fj4Z+uGpjewQV
	zXwGMey85hAhsnrD0CFlFYvxcDAocVoC0RNgg+52UFNAGbsX1jAeJnXLRQxwuyqNorkKi3a2jDi
	OrtQXJWbdaxnE2nmpKcjCOd0yUMwb1UHDR0OPVsYK8dVdoeHXJPxFtlHLQkFJMmze8bLCN9PDI2
	Uy5QI6C6+b2HcMZBETGov9L0l+v4LX3A4iQMZQRmvFs5hcb6mN0kRUhaCEFOaJoMGzER6XLfqdM
	aZCaCW9LouvMeFFwhhpeYOiNnDgTcBMM27ZLyetcTKBT4oFVRP2/1bRhTP9Pfqlc527Vei3KnDe
	/WE8qtyIP2P6CQBmrImGkmvnJs6V4QOP1+Qt0J0aqLsvWA/2swRUyUL8=
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628364b3a.25.1778266876134;
        Fri, 08 May 2026 12:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628308b3a.25.1778266875588;
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:52 +0530
Subject: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1360;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
 b=kW/HQT/jSDBpkCUfRBqp0A5Yj4nOp80+ZwEGYSAUFspkAjZt561MKLpQwFXZzmu/dKkzVWx+9
 B7Tjefd1OYNBH8QV/X9SfxHeKATLIdHunm8LdBeO6zpdPfvRF4/MdRn
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: dgBkyl_8ESdEmQPosMvln9IbKD856kuI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX88Is+8TCMDGC
 k3kWw8nSQl9L7f773pI/28bTgca0SXxYVVah110vfUNz0bJYIiS4ppsYgae5W0VFaN+l++xPQoS
 PaNgJ1LWGOD+EtBaqUwNZEDwM/sgqSZwxWoqkQ0c9Gzs6ZW8lSVnuWPhf6kaxtdy/n+BI4SlHCm
 albQRIkqgIcxl0eNA50+VO3BAJcUZELc0hSdvDkjVIbhgesEzq+n+8vFYvBEPE3TMq//9/3sSEl
 2Wj6I0gmu+/IRlyZx9NaJJ0nvCwqUUTnt9mRTn4xs+SvA5PdGJ6H/M/9vD+p6TCG8yD/Rl7pBES
 VdjX4bTQJXIvjAY4gBbr+JYAoJzSuXIHfWDUWMVBZaPEm9+gKdqbSs/QbDMbNsX8teJ9/WgjCsz
 5QA/Bga+yFQJ1zncmNfbIBH9yBj9PiYt+sTr0zEVpwMIkhQsBSxLGe3/Es837qOMHe0rCpDNCxk
 l/IAkJGKZC/nIIlou3w==
X-Proofpoint-GUID: dgBkyl_8ESdEmQPosMvln9IbKD856kuI
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe32fd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: BF4704FADBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106717-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..f1f9e04b7c31 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1



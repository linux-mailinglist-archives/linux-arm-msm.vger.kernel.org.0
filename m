Return-Path: <linux-arm-msm+bounces-105134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM9JLWu18WmjjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:38:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247C49091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F27C5302F5B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C103A5E75;
	Wed, 29 Apr 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0BUDfqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9xMxKvW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1223A5452
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448097; cv=none; b=PSyPEBAeH+CauLiHJGjhR63v7CfDdvgyCwClNaqjZ+7AUJWIQIPIORSCrpTGJAJfFrhRLSWt1ICGubhFtWo4BNQ5KkgCRILolEC5U/W2Y440kK6fmtjq7WmrL1CCTB1XRwBgfpPF9WcWL7QCR7oo5ANmTZ8qz0ZCc5dGC+cZ7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448097; c=relaxed/simple;
	bh=fQDyDBW2jp+KfIfU5HeBmlBOt1kcV4MTHkCrlopCM/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rg76JeYASrvRH2dzU+Eo8MteHW2Fl129/KALtzcsm92joX1VkzYnZDPoxAH4LsXCzTU2AJxdN3wGWceLDbqzSjR8W2SWeXCWuyjRydxCMTdRINulUqvyE9y06oIj3cAZNh2LOmoykL/pNL7VZe5ajFc705jTY2O5a+kJaC6ahV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0BUDfqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9xMxKvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2ggR43184197
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+z
	Bz52Z5/A=; b=O0BUDfqXb/ilrRxhFglqXWKwK7sB5nNi2RulnnjYsghUXI8RJru
	C5Tyjneg9QMMk2oJTxR1oIa5tUBUHXMFJPge3MFPRaeEtFdk12N0bCRqUtued1r8
	wPvCuudXfHtrKn2jLVOZJ6/lJfj1l1+IK6ADi/FiS9IIobU09wh532591+CHBPwu
	QqoQQC7iT57VYuCHTDFOFOuki3dW+H9G8IL1Bmdx8FeA3s/xDQNmfIccJiYf8pf5
	o/y6UZhyFA2Ftg3+RvOHJAnnE/rL08OE/dibEI/IPgvyBfTfUh30zPrBCFnwmSGo
	bjAv/tiPWGNvmWKBS3ZRtZ8rXTcp+6nebJg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em0xyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:34:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so131311265ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448094; x=1778052894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+zBz52Z5/A=;
        b=d9xMxKvWopVkoFwMsWuoEAervLTCmaMiDDSs11QzlgWPrn5dKOzo5RXSyeQgLlHzoE
         Fecq6KOXOPDhUlE7TUy4TmMm5shXprPjuA1Hnnj4MKZjrsyqN0Fw5iIiVEl9IrfCDSyI
         +mEh5jwU8QNBTW6D+HGF1vU7Js1OeKdzM7+rF1T4on4Ieu/DoBdhRA3oHJYSseGSrjdC
         YMFCC3/0Hij3jU1LkRw/ekmI9rk3F+sDVHgqhy4DMLClO2mfJ1dVhMaoXoFcsTXJIagy
         mrX9Hdq1BnbJzO7xVy8anonBj6tSucEHupvQxJyoihvltwuBx/7I1zwM4P/sXzUwT7Sw
         MiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448094; x=1778052894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqtGxNKfLuFxFRH+r4Z1QswRRNhsHKDis+zBz52Z5/A=;
        b=el4GewUnNPkz14yJJ4DPlWNm6rFIJDsws449Vj/iynPkVrYK5mu5zysIwJV+vhg5ec
         lIoKLSy2T9DWvWNR410KDC4QFcgplAq2PuZC3Willuf/HRcnkGBio3/ofpjLtkNxKeG3
         jhSksxJuupTF7fwik8RY3fQceeUwxK+r+D/dFrvExEF2UeE02AnO8Oh9yEew98MYr7Li
         pqRVCxADLm7gqSr49bBUdAlpT9vwct2+31pD+tL03Q3siUp19WuESgpZi1aa1KyotAcJ
         uScmv1Bn21oOwczR/aLZfotYwZJdkX332Q/7NcfkD245gGjHFhGQoOHPNFrAkt1tdXma
         k5Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/rqYPglRof2HOSx74PKnzWnt+/bHnvODas/2PJYnssLSDB9zSo1AtOTP54Q18hGHtb+NfFxLYiY/X4rIhp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz960gvq5alWhQ+PVuEbi15xDlWum5PkBJGo6ncFDCKZKP2weZH
	Bl20z3vercvokuKYIkubco2mg7upK81JsWG0doqc6myT2T5xbOCHZFu5NKgiy4ykImf3NuACeTG
	71j0pFnhk9uZOEj9dXubeNFE+XoKDulCK7zCUFs9JirQXH7Kq9KMUZxXsxhVeHi5ykwmx
X-Gm-Gg: AeBDietm/kJieqRWTdhr/CsWRdnrHbQCisWPJZptW1zQ8q0YKyFrsIGKcNB0ZeBkRJz
	xBFzvdwsTkvVYfOnOflErwkuIG/4clxJ9VzbQQjKeRi87+5H77o595Cq/Z56tLhO0t8D35M0tev
	aZ5lAARezAUvVokzMrzQvcRlOq6f+DKKj7gbKK5L+BxjN5dnsnQphAu2/oILXjL46rrFgk7hqSb
	0TmR+iCylmrnCFprVQ6TJCqZy8jVq3ty2wg3+AH+M7/P2hG6J65LpwUL9C5ff3dwsrI0KcB5TUR
	JLk9+WUbw7ScVBJMQB8f47rsCa1teB6U6WB82Iq1Cif9HzaSKLgMaCqFrMyzaAeCvnRT+3FvuE3
	5ijfebXPwp5cKX7LjU3ScgxqKysSAg9lOGp3wmjFan24a2U16NhLrEuUC4L9GBLvXqUROVzX6Mr
	Sgzx9Nn/Wf9u1Lps9eTZozztH611jU
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr67358555ad.13.1777448093978;
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b97c40028dmr67358275ad.13.1777448093502;
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98859f629sm13281425ad.0.2026.04.29.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:34:53 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v2] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
Date: Wed, 29 Apr 2026 15:34:43 +0800
Message-Id: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1b49e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iXbblyws4aYpK_2pIfUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: nnVQ9q73m4Yp-bt9pipEEC4eA_UWf2m0
X-Proofpoint-GUID: nnVQ9q73m4Yp-bt9pipEEC4eA_UWf2m0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NCBTYWx0ZWRfXwf77ewRx7Kih
 XqcFMj0wV8xgJYVbbyAlmY40gO1hlpYIsDbrjq4MGptiCe4UxBsPLEvxPdyXLe0q1sN4xmSmBy/
 Dpk3etajUT2aZEABdbSJ13KPFpb1R6K9KhqzN/KpisuHaA/HEalDEJwOWQKxK5b4qwxRy1y8BGx
 qv3QAe0d9MNd1yFqBdgO77UBR569Ec+zAPu7+5Z2c32nVPyjzRGrC5J7+5uh/SL/HqVM51rLbvT
 42fsrRxaEVPFZvV4V9/ZlRT1X+RlWJgJOD4ljVnO1KRJD0fTmmYYBjoqZtc74qf+ixxSbzPg4Zx
 EuEuXCeAjY5w75TOJZDN7JpmEfMT9j57NdTewgfoGF3ZChvcPIA2qqQKHFHIWmtGNvwOrfhS+wF
 JSgsv4O6N9Ux60A5mg0e0l6YaQJHd0MPmMpldrMqzTvJ8A1Uz8XdNM681TIAOtMFE5txzDUL8Oa
 EE1uBI4TEPRWpwqwpWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290074
X-Rspamd-Queue-Id: 5247C49091A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,9cb80000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9c900000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
reserved-memory region overlaps with firmware allocations (UEFI/EFI
runtime). The kernel then reports failure to reserve the region and
subsequent EFI runtime activity may trigger aborts.

The remote heap node was described as a fixed "no-map" region, which
turns it into a hard carveout. Replace it with a "shared-dma-pool"
reserved memory region with reusable CMA-backed allocation, specifying
alignment and size.

This avoids hard carveouts and reduces the chance of conflicting with
firmware memory maps while keeping an explicit pool for ADSP remote
heap usage.

Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch v1: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
Changes in v2:
  - Correct the value of alloc-ranges
---
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..4d46c7a62187 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
 
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
-			reg = <0x0 0x9cb80000 0x0 0x800000>;
-			no-map;
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
 		};
 	};
 
-- 
2.43.0



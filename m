Return-Path: <linux-arm-msm+bounces-58979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4588AC0189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980A34A7081
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 00:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E339F32C8B;
	Thu, 22 May 2025 00:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbInCwiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A92CCA5
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875024; cv=none; b=SWa1ozdc6oE62h0GrZyP+ltFbSGt/IzgLCun0j91nnB2jTaAB4vikc3pMlnfrI+D5u4QM1qlIwIYq8XuUjeR4G9BSZUYInbgEPKLcg7C1/KAALVrCFIbFVfQmNpnBtQpppo3bgxIFQCvQ9AXq+rrz6pQsIWfIpcBfWUA2kxCI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875024; c=relaxed/simple;
	bh=k3JhTZ4oyNVLHV3cW10MaQ8mQWndnZLQ9kcF1MbS1Ek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vqlu+R+0QAFVAVCU2DjbDsAky2DMoT/wVItdvH2KJBUgoOJ/5Ak8zOsm5rhzz5MK4wedOm9JDTXh6rL9FOpRN3vZMp+WmaJRIwQRgKam/4UZT9DRnpKy462wxbXr5mjxjHSBO4lPupNCGUEAxrax2nU2x09mKOdsSXqp8of8anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbInCwiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI9Po0029111
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kvRFDBllkI5WXFVFf+HSLljmJBeNY0/grsh
	Lfzg/HAk=; b=XbInCwiLaw5FbYuTgsfUO55FRgp7zLfXoNFGVnUPqMcgQBV+9RZ
	TIwb3zf2fBGt+GWQfxVVLOOu+NlMwQIAVFs3AV/w/3QKXnUS3Li6WGOivDex2PkO
	c1diajuWERm7EuFwxNbC18xzisWYBc98PhfTrOvUF672qijXYikL2EwI4s9B0HCP
	f8xgimnBDdSDNVzHlusV4ujGHIY3j0Vi2+9dVgsgGnANBeMs4jbK2WPlIYya357M
	MV5VHa+wg3jxJVOyBsnWGiOJDSypwSjh2mXBLmwvieTz/DFgNdI5oIAKw+hP1ASs
	WMBPiDno93xuSGStb6tbBrn785HPwx25CwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf44nmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:50:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e8ec895bso43487135ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 17:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747875021; x=1748479821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvRFDBllkI5WXFVFf+HSLljmJBeNY0/grshLfzg/HAk=;
        b=vqdYNa3FersCBD9r3f2zPTN0uqH2qkHuJb/eDlj4/vqfUfR2hg6VjkA3JhVvGNONIG
         h4bd7a/g4n3OgtsBLzJD52ONCtapRQYC3Etm/6QvBHmb4TqgX99HsWahMOOG1pVp+r+S
         XLivj/DuAzBKG9YMCrhLbFwaiTN71qUS6fNGsui4TpXHsdf58P84W7NgSvjo1Ls6cKB0
         BGH/uBg3SNiTv5tpZo73Q7ZN2jCstbkNUt4ynAVsIgLWkzbbh5kHoQVbHdtQwtRJ1qst
         urYbC7rNp5WC3CxIHud/oMxdBSVyhlersu2HyAobiIq3bChpmeFQaKWqSOpxtAFvBuWf
         lJ1A==
X-Gm-Message-State: AOJu0YyX4fJX4IEykwGwTuhrkeVORDIbv7cMenDze2COn7Uq2/Q1GgIK
	Tv+0489rF8eg95LP4DposXbT+l47SUID6+0Y3tu2iJ8wOrBJa2hnevxfSHtKCsUtDOSVn7Qqzbn
	1iWQ3M0nafhulfRwWGABhSfty+FfSKCGSIwoRtz7Ht36wiAuvtQ1i3cYdNlvQ0TsPIyOq
X-Gm-Gg: ASbGnctIbv26tS55WE8YsNtvj84cgxWGWphtwcozC3PXQV4A0M4rW+KQj1pnpdEVOrW
	mquI4t/GUfyUJfkiWsZdwomm3cnZFWsrHPkYRW0yT13kw5shsH3GkZyhV98aQ0A23DvEMNSZcRp
	LbRDIIoroJnjZPhqG/yDX3Tr685qCa5yoFxA5saP/ZYqhKbGE3zuDvv8JQBCB+eEo6rJQEf5oJk
	ISqxYbA9enldYoV18pajNwhwt3uLZOWal+skkZdTYU+/R/XxU9fOHDz43vqNI0JejGtnQnSYSgc
	kNB8TgDttErtPyAcKyl9uw7VVtfEbZXwp0cE+GL8kkTtOGwACIwF//mAzlUf31UCcvjH
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr286881405ad.37.1747875021534;
        Wed, 21 May 2025 17:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD+durvrDcArPX+SKuH0fS4pfVmA3tYTRltQovIt+W4dSZ7RwU718rsJer/fx40VKW6UJMpg==
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr286881155ad.37.1747875021141;
        Wed, 21 May 2025 17:50:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm98325955ad.89.2025.05.21.17.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:50:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by infinite loop for Coresight
Date: Thu, 22 May 2025 08:50:16 +0800
Message-Id: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwNSBTYWx0ZWRfX7z0rWFll/rt/
 lxK5Dw2EL5HZzewVqCo98VWuHTKC6xj4YJ6632lFvIpyU82VXi4XgHj2mxKOlu3ttjhmdSR8mFM
 HepTTANLPobDkVn2IP8WKDTDiR+FiP0ek5L7jmeqt1KX4TBn+cbh+vofxJfGjPPiifKs079I747
 dInC+0wZEqmsnn/B5QIViYNeZdFbCkQy9n8oOxmi2whU8w9ia8DzA4gmXCzC//U0iJ1fm/HNZnu
 lwD0QP4CqZhBX8P+tFzRdjIE1razYp3RA7wFHrEECE5MmsMY8W7E8aGHjQug6reuTEWGLlHA+Jx
 5k9sf7p/bbTvs2J7IDdYWoJQtuOVYfQuClUjoCPFv9XoXFc7GlO90EPIwsM83oFhcZR8W4xd/4p
 vb2D78z39UZbzHT94DciWrrm9D/bCicnFO+lmkB4yj/1kvyOlVieRVbBZOJ5md3n+dNxV3Ak
X-Proofpoint-GUID: hOC9XysxSemf2mXEIZz6bJ2Yt7Bm0Fd_
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682e74ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=435hUyIJdIdCWuEgtuoA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hOC9XysxSemf2mXEIZz6bJ2Yt7Bm0Fd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220005

An infinite loop has been created by the Coresight devices. When only a
source device is enabled, the coresight_find_activated_sysfs_sink function
is recursively invoked in an attempt to locate an active sink device,
ultimately leading to a stack overflow and system crash. Therefore, disable
the replicator1 to break the infinite loop and prevent a potential stack
overflow.

replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
     |                                                                     |
replicator1_in                                                     replicator_swao_in
     |                                                                     |
replicator0_out1                                                   replicator_swao_out0
     |                                                                     |
replicator0_in                                                     funnel_in1_in3
     |                                                                     |
tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out

[call trace]
   dump_backtrace+0x9c/0x128
   show_stack+0x20/0x38
   dump_stack_lvl+0x48/0x60
   dump_stack+0x18/0x28
   panic+0x340/0x3b0
   nmi_panic+0x94/0xa0
   panic_bad_stack+0x114/0x138
   handle_bad_stack+0x34/0xb8
   __bad_stack+0x78/0x80
   coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   ...
   coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
   coresight_enable_sysfs+0x80/0x2a0 [coresight]

side effect after the change:
Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.

Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f08ba09772f3..b67c1f8a1118 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1902,6 +1902,7 @@ replicator@604a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			status = "disabled";
 
 			in-ports {
 				port {
-- 
2.34.1



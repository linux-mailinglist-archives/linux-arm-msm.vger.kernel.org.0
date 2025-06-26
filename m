Return-Path: <linux-arm-msm+bounces-62611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D33AE9A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 624993B1541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CAB2D3ED3;
	Thu, 26 Jun 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mcvsw0NN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6C2D3A80;
	Thu, 26 Jun 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930253; cv=none; b=E5ITU/SslJFTPQaIFLtY4pvjLs8BRo4ZktMIb4qu36U5MbvkJmHu2uvlJb1l+LSn56IRIWJQChI7NIs0dnHEaufw9uQyAtcaV894u10czpF1i7pSNJVymaz6tgc8zRgWhocjwHKv/mZ8v7Br6KtnPytAy2B0wh2km1979zP4KmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930253; c=relaxed/simple;
	bh=T/BapR8VrPUhdzgTEiubVOtynqAKASrFAT5V8+X0ksg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QP52mVZhF+laxGoZ6LZBIp3Bh5CooaGF1hSv1jdFE8qn6IsRo0xrKyh9qaBFcMjBiVSkW51vO5vf/phbvKfzSV+PYKGpXn7xuXIP8bBIRyU4MlRHjHoMJ003gDDmXnGCIBBeyDJ9mBMDWYTag2hwCGYH1z9Q6mNFN4F8r9Fjfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mcvsw0NN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9TYEp021525;
	Thu, 26 Jun 2025 09:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lyj+kx3ysXar+B5uWk98MwNaaUr9bnNieXpVHAG45po=; b=mcvsw0NNQdMWYGba
	B8upNRD78E98uN3gLGY4YrmRqQHTGdtOs3dLS4V7TlTV37cYlhetJptmrGnwkjyi
	trchdhMNwU3QafsyEEBD5g0f/7uDidWJeaOud/LuUKfQkcVOReRNC67HyfXv5pMR
	1ztGcLmmyNNt1k3ZMmJyDihAUVXe5/gFZ4F/SOhHcwInrMgQbZ3OFVaV8yGjpdmB
	pzZ/YYL0+tEKobD9lX+gkqCwJQGRZ5Vr03md3EDpAoi7iwyP9JFsCLzgzmFbvJhT
	ykTcItSUwJ5Lhq0TFBa2vOXvp1SxUmG0K2IigJzhP1o/YD1MFBJy+ZVnLj7UO6qR
	ycMz1g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx13fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55Q9UlRT026380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:30:47 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 02:30:43 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7280: Add nsessions property for adsp
Date: Thu, 26 Jun 2025 14:59:52 +0530
Message-ID: <20250626092952.847393-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626092952.847393-1-quic_lxu5@quicinc.com>
References: <20250626092952.847393-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z0XWeD36KsKA1Zz244I9tkYEvanp4MBb
X-Proofpoint-ORIG-GUID: Z0XWeD36KsKA1Zz244I9tkYEvanp4MBb
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d1348 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=92LHXw4WN0ZY75pjLU0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3OCBTYWx0ZWRfX1XFIhZrxnaX4
 XQAi5qg9OLWHWdTTMLKsA+wcuvzYtoFN1XmTPmHYSX8rGnt8Q30nGDrcEm1GSwx8FsZUBC9SkM1
 Ef+ubruRhkKWLiGVzNr1054zXCpB005kAOxIPN+PodEuvcG4m7wL2M95n7U0PxDMXe+h3A9/oYg
 w2nW987KOPIOWnaVf8KxtPsSDQ0l51Z3oI2/HeIcIefXAD/RoGJ9mTsyaGifvSayXi80uvH6yEH
 kOskr0q8t9E34GpDE+MBHt0SzwK2kBXKyTF8dvA4TnNQOH/SKr9PkGdVpzlsgg1reH4X+orWcQc
 95SoHHwHBn6FEz2XCb/VYJJQnvL2N7CMF56hL5PTIpSvxtcmR4ygccAcURDYZSRwxfQjPifwM6G
 vdIltzSefpX8hlpm93hcZ/2wBZWe908iwzDfkuLeLjpRPexqXkIe6X4PIPVOgJaneSqVyWfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=671 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260078

Add nsessions property for adsp context bank to make sessions
available for ADSP offload.

Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 982f120511a0..9046a7b9a728 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3931,6 +3931,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 						dma-coherent;
 					};
 				};
-- 
2.34.1



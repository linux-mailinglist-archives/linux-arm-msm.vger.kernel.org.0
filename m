Return-Path: <linux-arm-msm+bounces-57786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48CAB6244
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 07:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBB88636B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 05:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446A21F9413;
	Wed, 14 May 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sp6E3hSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499F3EA98;
	Wed, 14 May 2025 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200231; cv=none; b=mrpUa0JMVUBHFuNaIg78leeiG0ceZthAXXfNzF1oCYbL/boPVdO8SbvyJWvH2b92shUtK0SrMiS7E13ZO7LJwMsKfwpYndIQbD40o+PmoP36uLONdNvm8njOJOi2cy6Mtc54DubBKpeIMD+XCILM2lzV4R75Pc3WwX59ihL31jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200231; c=relaxed/simple;
	bh=+yitgy4EkV8ph3uG8dumsNesdHeO4igQm/ECKBgbnCI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TF/7k0E6XQBV7vXkINAk6oD8aeMin/RRSsDVCjw3vZq6pJtTh8xN1fY/dvBbhSBcaDp8YtFlBmnxKFhTsgJQM1ibh4umSC9txgXyRv28f867et/tsn+HZzowsgoF0/PaNh+sMX3fcTx2RdSPXGwHpwHF8HvJ0Iso3KIZXPfOAak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sp6E3hSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E3KLus032632;
	Wed, 14 May 2025 05:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7mqBVSclFxHWHk5aKNpQa9JYbLg7qZDe1BTfp1GtWM=; b=Sp6E3hSRYtOieidX
	8mp5Wqp76BECeuWS0k3K90rXdSQQ1i7ImZW+I4DmVCPFXGdQK34ts/iyneOjlIiR
	kNu4NcgQ0xrHzBMt6aXTNIgjDj7zjUOfIrQ4l2Hpi24tasOSKWPkMyqAtsuOXTwN
	YqJCPFjOLcoik9w8HWZ/ixKYzmmmgDRQ9jB5b1iuflm327MVRZJxrKktRg0jdcf1
	wO9dZn9ec9fPGvb+mbocAonpetU5W/Zx6CWk+bPehGaBjs5CisncDh0g/p4JNrvW
	F3Et2LyBH9ETplT1OAUEDdYZEjPYiVp+6mskvvpeeNunWvy6TO7BXHQ801J5MbGG
	CI1vAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnsfcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54E5Njtd030446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 05:23:45 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 22:23:42 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: sc7280: Add nsessions property for adsp
Date: Wed, 14 May 2025 10:53:22 +0530
Message-ID: <20250514052323.3881600-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
References: <20250514052323.3881600-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gV13WX_4luubjeGHYnw506zEtBVctGCJ
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=682428e1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=xzk0jXLcH6ia1Ng78ZoA:9
 a=kph8uwvA8Js1ya5A:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA0NSBTYWx0ZWRfX2AyRZo5QxoxH
 7/LxFgqARtZhsjlAqP6gZYGC407Y0YlfzQUIvTbMZVMrmwHTZ/9BJZ2u9d22aeKCp9M83kPc4LF
 14XBKs3q6xXpb6ta7FBKjhhJvi0XUEvYwqX4HcaPe8xdSQ1wUX+qNtJHHOawpO16c3kb3hRFcsg
 SgdHT9UCUyyYY6FUAytcynqhaSM3MaCWXD8sGbJVeaiWIsHFgjKSIJCCKImSOeycyeNFgnijOEN
 JdVNoM1QJAHUrFkWNZURdNjOvBlKYSmFngcmoTmHAmlZXT56WCTkMMdZsnDL2yD7x9XTm81qLiA
 JFa0TNq+PcutBLcLwckjzF0w1lRTBR9QIDryBEZS7/KC2kVCwgCd5hyUI+wx4Vw37ERj26seTCa
 KvBOBBv7VgcWHpPT8yS15wK6uMXpXJoAjm7/iFqJiN72hWyOv31hRoSvv67xKfJUQS4cEJnh
X-Proofpoint-GUID: gV13WX_4luubjeGHYnw506zEtBVctGCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=762 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140045

Add nsessions property for adsp context bank to make sessions
available for ADSP offload.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 98c75b8428b0..8c04f3471554 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3892,6 +3892,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 					};
 				};
 			};
-- 
2.34.1



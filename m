Return-Path: <linux-arm-msm+bounces-63188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E36AEF515
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED21189F8F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875B12701B3;
	Tue,  1 Jul 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WjEwMZjf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392413AA53;
	Tue,  1 Jul 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365789; cv=none; b=CwMBfDx8ra/q3bwfHrOJSJClcYCErm/UVhL6t6RJO1A5GP+XOKuYsxaKgCgv6oS+KdG8TCk9g5lGidWnL3TUE17uRRtfwTtvKh3IzEn1z0osnvMXhFukSGNk/2r7vaUmjHPrSYS8mUvSh4N7tBLw76u4VRGvc5+zSxCuRvQYh9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365789; c=relaxed/simple;
	bh=z3DJ4BFZ7rfr7JLmQ7Te87VLv9YABKU2uNukBsMLpLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j0GCANDhaW20MJy1hemfpfzRv1MAzYUMDeZHRnpvK+WhdMAHGPCwpWg7wRY0bK2HKVLS69hjxyPVU10c9RjcaA3131PaMT8ys/eCRMjeD6tHdo7gK+KQw/eY78siFjOSj4LN8xzuIa/Jp4SrRhK/YIE29iamnOEcJiLxxU8tIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WjEwMZjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56170657029816;
	Tue, 1 Jul 2025 10:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=muSLFFlO86m
	x3Ci48klvmZExuKLfZcvmnDpb6V7LVuw=; b=WjEwMZjfGXgjZPvTON5ygkigYsw
	OpawSodMahx8yl4MOjnHo2q+HJ5SWKMYalmvAbfJj7cWEBVfbV9p1cFgRevlvpIQ
	eUNlfrxtjdztxTUaDW9zzXC1Ho+4ugtFDXEWmjrHKZ74OZxVxJVn6r1k7aPx9YHh
	kGuDpW0b4m8huV0sEx9WB+X3tE0j2AocNLVaKOjTkSJneea3CZxjzd/eiNyVcWBf
	gduaPAEzrxr58sFzb8qZfMJfM2MA5yWeiDhrVVoGa/Gnf5WIIcUEZXcHZflMJPPi
	ADf2JwIJn6Y9SWMSHQtF+/bWs3kKz4Bw1AegDQBW8ls6Bsg8hhLFyFlAjhA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v2gh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 561ATWa8030928;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47m1bxafd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 561ATWr9030911;
	Tue, 1 Jul 2025 10:29:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 561ATWFd030908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:29:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 443023CA; Tue,  1 Jul 2025 15:59:31 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8275 sound card
Date: Tue,  1 Jul 2025 15:59:14 +0530
Message-Id: <20250701102915.4016108-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
References: <20250701102915.4016108-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfXyWbOmNQt5vjg
 92sxgYMcqPCGuxOcuDSAwoUi1/2UxErG65RS57uHAcwXBHoOTaM4+Ob5UIWzvRwTIz40mDI27B/
 sIoBkXqbM/IBRWmRfwG4WWoKM+J19Uzf+/V44p9kikDL5lBUQ4Wivv0XSSJsmEory3CeZnSmam7
 Iu3kIJzLgg2PLqjxOP88mfMg5MPsUJFxmcx77bmTFpsNPcFysdLimWBhvF/oqJtezdDAKncZyH4
 a8cKCG2BroOgg2SGM+QNNeM5UwbVAg2DHy1RH17u3aDEidwOoMYs2vrHrKSLIbQ0LpGmvbH0H87
 tgjaivPjkKu9P1QKLDrhnzTF18iL34g+TwOxKfWrsvkGsu/H/OalZEEioYUCAZL5gZWwtmDct15
 Kp4YrfDsCNeVlBN5EY1Qaj8d0q2BejzDzTugVtgcNanBPIab64fn8DU+RHiya0Md5LBXxHw2
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=6863b891 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=xpcQ2GTLV9PjKMD3HQUA:9 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cVZm7Ffbeoo5U-R1Onvd90SbJ9RjGXQG
X-Proofpoint-ORIG-GUID: cVZm7Ffbeoo5U-R1Onvd90SbJ9RjGXQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010063

Add bindings for QCS8275 sound card, which looks fully
compatible with existing SM8250.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 590eb177f57a..6b4a8dbdaf61 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
-- 
2.34.1



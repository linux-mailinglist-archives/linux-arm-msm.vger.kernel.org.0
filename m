Return-Path: <linux-arm-msm+bounces-76689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0CBC98EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F0C94EB005
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7158E2EB875;
	Thu,  9 Oct 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iygGXXog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FBD2E285B;
	Thu,  9 Oct 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020777; cv=none; b=nvPp3fL/OEf8/U8JBfdGtg2npe2K2r4GmvX2gmuO8RIU0JguxAI5wjZiwD/WwUtvRef+0Q+fqlSa5ck7muf8BiPC6Eoj0Q2rkjRxwUZgmCBNgJXopaYULHRqnTofpYqICNl25QX8m8JKh2wqL+akd46PbRWmHwgC9a5TDzc8bOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020777; c=relaxed/simple;
	bh=uocBPxseiKMfnnMq0WDva/qvNhjnYWXDOvDFbhP/32A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hL3uGrt/+gNMlpsTJJsahID13MJn7jurYlylY8wBRqz8qsx5fzPy0Ai+te1Pvs/oAL/kIlSxLLipw0Xk2LN5gDOn1OubhxCk8b4FucB7vUXpjfTThl7ebxCdomL4bEXmffvLQeQff08xnEyVyk0oXkqZ4JR8ND6QjeIidt4HzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iygGXXog; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996ETWQ023705;
	Thu, 9 Oct 2025 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N6dnY37fbkK
	8ZpPVlk9tnPqdOK4GOSJD80v7SDlJ+5w=; b=iygGXXogHZlHbwE+HO9bMubO7sN
	bs2syr1ygDWkguu2Ix8l8gMFiDzqsDsqXdcNItlUqhbMgZwirWPdTo6g9FynNHeS
	7QA1o1TeuRGN2PIgsR049e2TcQdYv1g2sFd4ElLPhSh2GEsFk7K47yJ4h9j96lRu
	cEgQiMtxLggo5HXgBDJMk4VzIzW6fpOIxOyElzCse0z7/OWoaORtTdcIO8brP9ae
	95/6NcolITqCZKbXfxKUhiRoAgZddOnV7Nh+pDvqZYmN3J5Ua7TaRkbyIzuY+94X
	55qrifPVJ5nXceVUto2zfVmPrcyKNiAB8f0R0uLpdfyUxf/m6Cs9K5vEdWA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m37tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 599EdKQu012508;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmddpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 599EdK9h012482;
	Thu, 9 Oct 2025 14:39:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 599EdKWJ012474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 14:39:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 35AA65CD; Thu,  9 Oct 2025 20:09:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com, kernel@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/5] ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
Date: Thu,  9 Oct 2025 20:06:41 +0530
Message-Id: <20251009143644.3296208-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3cilvueSpNuL
 KaMZUn0kDazuv4n0hga4ldInfeORzVJhZMMgpNZLkdDweSeOby7HIyzmamzZY3D+NxbxTunX2O+
 kIoa82wpbJ+1UT1EhYkjO/swRzPE5Osz0177+R+PzscuuwGi9JcNbA2B1nhkV5Uge5IyCdG2Lle
 isJMY9nkBa0APkOsYMy8JafH+L9BFPUc+S7ThkLPzJmAnnYjJXUvb79xK57khrog0Xt9piFZazw
 Y97hk5Thc3LpALliLgMk6uuda0ULwfmniiEMrmCLEhVPO4EKbos8XW85I1l5VRVA/j7ha+vfSzB
 oI3I7zMrnl2GBRItHwNFKSd0SAw8lFv9COnwu9G2Z6+jXB4VFeUmKV92H6/ctU7YIwntjlT/LQa
 LyQa/wR8QDLZZ3Kcw9Flr8K3A6P8pg==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7c91d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=MCV5zX6qGx6s6p2FbZwA:9
 a=zgiPjhLxNE0A:10 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 6XMufLC11Y1lyyaQWKVHCeTh5X7kdZln
X-Proofpoint-ORIG-GUID: 6XMufLC11Y1lyyaQWKVHCeTh5X7kdZln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Add bindings for Kaanapali sound card, which looks fully
compatible with existing SM8450.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..708bae805403 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,7 @@ properties:
           - const: qcom,sdm845-sndcard
       - items:
           - enum:
+              - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
               - qcom,sm8750-sndcard
-- 
2.34.1



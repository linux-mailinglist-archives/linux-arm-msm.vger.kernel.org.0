Return-Path: <linux-arm-msm+bounces-44914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C868A0C36F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4407A18886BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4941EE009;
	Mon, 13 Jan 2025 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pEky6tQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B91D4339;
	Mon, 13 Jan 2025 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803001; cv=none; b=eGB4ilP64qWqUUhy8GkJiMx9VchkZUiASYXcVHc+PAXrSLCwOI0e8EI93L0+cB5m/AhOWFX0iTV3aQIIG0xgxte/xfAGsQrf7WkCWgtdtMSPySH4gBK32wZvUN/MImdL2cdRtZLK+C5nbnkZIcrFJfD+NfyBcj+YHSFS1qNV600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803001; c=relaxed/simple;
	bh=lAXQTnC8DPMljk7y0NwvsTpzLwc8jfIuOyoWpftuc8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TTNWNwUOpAGNF5T/HIoNnHb03hoA5KvJcCR3TJWztcTUnPfeJjTgYf8WsRMjvt3cLDuUvjRkEB3MSm9d6XK3N7DGkhcIblqTFn3eahVncqkJDofa0XWHg7rIFfRGLUksyxopxI9vAGVLpW9Hs/nQ4p+5319PprjFDbJYdl9BtrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pEky6tQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DIieSe007831;
	Mon, 13 Jan 2025 21:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM4Etg5NLFyABjmZU7bOq4ICFPiE2BhQoe3G2qFxvjk=; b=pEky6tQFVuQgmh7k
	nQY9yWilhKo6yYV7yPqo9ajKeA++FUoE4fuPihJwEGbDYTaq7UJbZ9Y1wYFY2Iba
	l1wiiMM2W8darIM9jFWOiABrbqbYbPmE2nWxsRyj3bJ8ystNG1oxG/EPK+VJQeSY
	5W17K3XK/PHfPu1ERgXn3JsQh3saz2FP68n6/+PejRT6D2N5OWKVaaU49KqZiMVn
	wgcYH+ATEx49eeP8KbQemfrvWRM4OO+lT1kVF/WWMAoVgojq/8OTrlkg4/agc1fE
	CRo5N049AOAZEaXjv9neQpcMXS+S3PZUGwHu4CUmInbK6bhW4YqBPc5CqkgjrUOO
	tL/PXQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458cn0ac5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLGW1c021487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:32 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:16:31 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:16:23 -0800
Subject: [PATCH 3/6] dt-bindings: crypto: qcom,prng: Document SM8750 RNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_crypto_master-v1-3-d8e265729848@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736802990; l=868;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=c2fAVBfOQ+aEHKpKfUTxWnhA0vJixkuXHqPSh9MkXeg=;
 b=DyNftHa7+m3an5cy1X03hWH2ZYyMEo3zDbMPW0AcO0ml5QPQO7aJKaVgkz9KTS399fQjHBEHl
 G7c5RDGeb1UAJsMfLHoIDTgG3t3Dj6KaUIWRuz8izs3ctT5HVQj7uey
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Aq5G7tkbZifTbOjcCmiR_LTEQTxVtiPv
X-Proofpoint-GUID: Aq5G7tkbZifTbOjcCmiR_LTEQTxVtiPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=983 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130169

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Document SM8750 compatible for the True Random Number Generator.

Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index d38e8d3b2f3a83dcb0e3559a7aaedb5d49df18f4..5e6f8b6425454d6440a8653567235380d934cc2c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng
+              - qcom,sm8750-trng
           - const: qcom,trng
 
   reg:

-- 
2.46.1



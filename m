Return-Path: <linux-arm-msm+bounces-72032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CAB43960
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 191B31C80402
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A272FC861;
	Thu,  4 Sep 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTiKcyTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD32FC87A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983414; cv=none; b=rNcJdHNeIMoceuNlZ75VAdPByZvnja7YGmN+0T3ElOdaAjt6l2sxIvEmFlo22EoMCum6FKdyjAOmHfQCgxdK/JSELFSdSpe5gvwxadBZ6pOKTWd8aWkWHeNd6l5enNlcvbIsFu4jh9moXXmZxuzCqllXkjeT9lBJ3pp/U6nmmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983414; c=relaxed/simple;
	bh=fD8gmiEfvHWqA/qKuJvc+eRI/STX56LOgZaEfMt7N+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSpfDgIoiisYs1+BMt0YHoVTypsnncAehaRtYxwfNlx0VBcX/DiyuZnJ01OtCn5ykF0SI7vEjRVDGss7o99TFl/f3BcvN7GDsLnqUKY8dMWFPI5MF0N4BfhotLtq0luttCmjwqp664lV8nl5wWBgBlhLzlSJdkOkJ3Ozd0x+ER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTiKcyTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9Tw007609
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bwb/aCh+px1
	clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=; b=HTiKcyTKwNBupUEpMVjNn49Cez7
	dRGhAGC8g9QncYVXjnLdd76Lf/YzS1KoLVfznPyiqYnMXyyborZczMj/JOYw/uo6
	sjUCIaaEoGX07kD2oVraz8j7q3B8YW79lRD6iOROCScLzAQ4jCVzJV/2uRCyEfyR
	ptnPIEVeOw1uWA0BN18wZAkvPoCTdVm0Jd1dN8InEHkKa8ykXwHzpo2edYfW7pGE
	LDeZU9VFtFTs4CLgOi1mvO9FckGP/4FPN9+v/YKSbQx58VdN1jrB83zkz4/XfVeU
	xM1Qaa2FrZIT+qaLK7r7UKR6DNGC+bd2D8vQPEcoy+9swHiIaqgZnDhR95Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8y450-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72023d1be83so21279976d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983411; x=1757588211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwb/aCh+px1clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=;
        b=eRP+LiEHub7d008p0EZzd2akwyYYeQND8iJ7a0uArm9Jja7iJM1eAba8xiu3yUn3Ps
         /CAUbtONPPv9sSivIFlD8IfAmzMQMyxAsRMK7pEJX0vMPJVXMLYqpB97iDbtQTRrrAPg
         HlO3MbD+0srQ/wi4X4zbOVbeXLFjQMwtvr4JWtIGTNlmCDCQDPlG815QmG4pRRktEu3d
         unGOFfToJoo4gpntIdZ6v7kW76YKpBzzY5iiOV5UNYSEeA7euf8aQjoYRvWAaZ41BvFk
         oHLTYnNy8DYVAHw/6i8to5wQqLS+simVoYkygiNAZCXJHMboFMlJVMr0UAmLXaXkw8Jt
         Naow==
X-Forwarded-Encrypted: i=1; AJvYcCWQVll87ronEce5jK5ItxxTDu2v8lTVP0yEVjAcqNRYCsymEyZHRYXSaB5JTGDnTwPeHviM1xdQH71eZhSc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SQSYlKk9xH/DP+dFkjVF4xhBU8RHGU7a9EfraxTCrlkzg8bt
	uBBtWToBTZKyY+kgR2RCNSsfj10PmPhwPc1pSCswdg69tDB5z3x82+qSi2VJdk8US1xujYigfcN
	VoiMN/a3+unZUVdGvs4Z1L+8csQiiqNF3CeQTXAUlDUnur2GVMs69P83TTCLCCf8w7nuU
X-Gm-Gg: ASbGncszSk7b23Ve89EK/DwdOYo09va9rPH0Vz2UQiv9eJDuS34zOF2lhtlTEWBD58r
	VmwNM+9GYiKyI4iPimoVko1CNEBBvhwY8FrVTPLqwcZwhJIFrS0MwP0HTlSmrxoHUPZXGs209nT
	8k0wVcarL8cAX7B8G+xPLak3/x41F6sQTf9obLu8ISPBpGqVegaquW2TLAVefQ8MkNev7bqyg/v
	LNstmQQAsWuKxcU1O+Eh6a2j87Y8fM3Q1dFw3VzU5Zh1m5d/wkOngwaeifu4EmQN5SIbhchrXBy
	Vnuavo6dkBCR0q+w2Ef2qmB1VYZ2cl6Y5cK0O8RgdEyYG4Wq3F1oLA==
X-Received: by 2002:ac8:7f0d:0:b0:4b3:eb8:f6a with SMTP id d75a77b69052e-4b31dd858aamr194624501cf.82.1756983411479;
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB7hdDpsknZLEtfa0eJTg4s5Li7VqEjjEr6dg75smCTU4fKnF4eoi4Bd/tkvBR/IpY7CBbMA==
X-Received: by 2002:ac8:7f0d:0:b0:4b3:eb8:f6a with SMTP id d75a77b69052e-4b31dd858aamr194624361cf.82.1756983410978;
        Thu, 04 Sep 2025 03:56:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Thu,  4 Sep 2025 11:56:15 +0100
Message-ID: <20250904105616.39178-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PXm4TLUHSyBOW4aOIMWmWLpWBkfWLfV5
X-Proofpoint-GUID: PXm4TLUHSyBOW4aOIMWmWLpWBkfWLfV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+XOhgcQFFQNp
 YWeHJq1phecm7bGUnNNTdG8QtcxV8C6hQ4vHhEv5iCWvodpodfJ0G17z9r0RRiNGdkBurI26MaA
 Yv+t7wknlmEg2AkcHtgOVV46aXuQjVChKHGfk2+E+gmsU8yL1zI2EPVjb5p67/b5qYseXdD1b2e
 FpkUQCzH8mMil5sGJoCGph0LMKj+W5cizLB3ISDDLGWQgZGG77uPqdSCkWojhCQFK6pMvRPexOX
 N49TxuVVp032U21YT8WS9DtHmbVYoT9MRBo43WxM4Oj5qghjK1Cre8hXKEmnoat9IsAh3frXDHJ
 YJ3OoW1t8ST0jzc2aSMeI21ReImG52pkpc99akqM6bH0MYpLl+ChsTt3hrH90xbJLi/pE4M4h6P
 DtNkzocZ
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b97074 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Add bindings for Soundwire controllers v3.1.0, which is available on
Qualcomm Glymur SoC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 7ea491f7e828..003023729fb8 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,soundwire-v1.6.0
           - qcom,soundwire-v1.7.0
           - qcom,soundwire-v2.0.0
+          - qcom,soundwire-v3.1.0
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
-- 
2.50.0



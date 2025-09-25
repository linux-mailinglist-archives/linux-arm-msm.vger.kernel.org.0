Return-Path: <linux-arm-msm+bounces-74803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA1B9CC52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9494D4A1048
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F353212548;
	Thu, 25 Sep 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvvhqSFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA3C22615
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758494; cv=none; b=II0p7ShWFZOh4zTFEEqs7euaGwnuEcufJnKNjraFtfVsdT0wkIa6pwB01ZTOP4Qf484aznFvgn+ud2rd8X0FMHaiADPP6erM+spPDWTCmUWwQZb3z/4kDu5r7N2eDt9Q9JicGom77jy/NgrdVhl3isCXUuKpW4j7EV0y3GRL+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758494; c=relaxed/simple;
	bh=Su9n4IWzFdYgbeyNcKf8HkcOSMRJH2fLIJ24DfS54sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLooDVx7Cmt6THU7vMk04gTRzoHzhRRLp14qe47+F0gPEIyLRZ3Me/gCB9VMJuG3Sg3ulyt0/V/WfUiho8HXcmOgbnPMgpFLAbkjv+G/0+Vd9A0NHOTeCnv3GyrJ4mY3bZpngnpH/EVJIsx2zPkhBxP5mzx0EN0Xfg4W+ykMFdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvvhqSFG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCDYD7002665
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+svYFEPeRE+GlBruHatPNgcWNOtS+5u/A2E9N88AYg=; b=LvvhqSFGDFTiTNjG
	xdHI9P1CN+ammYOtGcJdHjU/xlGbPeQGDyIPqBTSJY4hEl6rA+R49+3a+EZfj0sV
	FPgY6mRE6EU85cwr87OJ6rO6rp6KvHSRlLWibbGYoOYb66SZIsXeENXUWdy2V4aU
	BruMKkOqAmuv86jyZGslYOoQyNtxzqENiuIRpXD8aGqjn9Han/ObZ/S6SsiVSZBo
	/pUBzN5ax/PWDsq0ipnAspGqIk9ZBNAnQ9zXkduwLUPWCJ1ex9rFeFtQSnpXLFMx
	uw1KcoRCNzGy6Ia40s9wHw4V4/IEXac+XEqXJHXuh6lwhkwYmCzzJyz0ewSKwT4K
	HEHAGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0nmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso308584a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758491; x=1759363291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+svYFEPeRE+GlBruHatPNgcWNOtS+5u/A2E9N88AYg=;
        b=wVUJIh+9KruyZ9LToOT1RolzxWNMSd8dEkG8DjSw4s9lDlVzNtyf4UAw4Rh9BJxdTA
         Wtbkw8QlucnL9ud6ha1HF3JHle8vGfjW1tBMLDSPttDYburCyVuh33RFiaH00Tkff4LB
         4Xl/ekSF/KH2fxwSRGxyzHLP07ewl9yjSxw1O6xsvgRWEfCmu6c7A8bdnr5V331d/Lro
         aQB5Qd+C6nnJw7ky5HlQI5h+5ctiALugejgHY7efOiXuJZwQrTpZKXduvZbANRxJD4Nd
         jcOwJ4plCrn8BrY5y4m+PgayKXP+ULhXnCd/MforuZmvq1m0Jk24w3NKK12g7vO/3Lfg
         9zRA==
X-Forwarded-Encrypted: i=1; AJvYcCUXJgES//MtHJGPDgh4gbT6oBp88WSXa1o3kXS5a82+BRDLyJIDvkRTqPAAexFHf4Exb6aX9i/ixAhrhZbX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBIB5eZZYbTXKXNWNzoiyKSerPuCcKSoIeKoJ+45j7GbjK1P+P
	a6de6UBo/pkJCX7X/K2TOg5L3p1QaieQtTUa8Ft40yAQDH6U1xB/WPG7ifozB4Uo3gj8wLO2SSe
	S4RP1sOVdhWxUglSjjJDHZR9IDDsveu10KQ4zALhx3AFkgEhUiDXg7xeds37mupc0AULE
X-Gm-Gg: ASbGncsD33TIRzl1hBEYdSbQQKot7+PzoUsAv/Ocl2C7bizOA2ZVvsHEO/bdHOvlfTO
	0rYo5uEu3ZCqTFdVkTqYJQyk4HH8zVCGO9dKyWnsZ4TzRq3kZrv6NOhOVN6d2E53HM0RjlL9Uqe
	Ocer0efomfA9BOzX1njvo0njl+I35GeXyek4UF97bOkWCDFZCKzmKMy8AYySMYyYUUoY12W2/JW
	WKP/0YMqaPmYrwq/kvwZMqLIbmapGlIYjNaCwUEUiVdq8Mz9pkc3E8b57IBqICou4AarOHgwvRU
	8nnuKkvEJRS5gd7BC/fPaw9BhMS0ryje+pExByLx23YsO47SlHEsslxGHL3RmsfGNF9x7R1GmRA
	oUIdPXBYzl4d2+sg=
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-3342a24d0camr1338430a91.9.1758758490800;
        Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaV1MnX02TYD3BQLtGJWED8QeZxgBJarFFcQxN2XBHT2cM4XiHYw2bzJAwiOj3sSHfjRjeOQ==
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-3342a24d0camr1338372a91.9.1758758490079;
        Wed, 24 Sep 2025 17:01:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:29 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:01:18 -0700
Subject: [PATCH 4/5] dt-bindings: soundwire: qcom: Add SoundWire v2.2.0
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-audio-v1-4-5afa926b567c@oss.qualcomm.com>
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=969;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4kSso2MILnqK103U/1/KdVpFJnxXpd8qNZM4Ma3qnsU=;
 b=jZ8DysmahDdFKDbInq9PUpL8A3spyWaItze/o/MUBtwXAKE9U2+EmZx55b0hGZReEKvFfA9dD
 r5ne20KrobCBcl6vzWh0x0qcthQyQ7orKSPbCtTv4ihS3s3NI01P2Eu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: lD8I-r83w31V4EVjKkK4awQsxwtT5-Z9
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4865c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O9amS0TZr_c9kjyk9PUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX3n3iOBhbsWdW
 Mqlx87WdQgBrFEcKGya0r45BYftRhTJUPcW1hchaBsS2OPFMFMsF7NqvvZkQzJB5Y+lfGNckCgl
 oMThdeH0ACh5A8ciuRUy8r9YcY7i9Ulc65HDI0XFIM7Crutw/sy0Ua4LKiQs3UORKf092elqXGP
 XTElKhr96qQdNzpAd6fijO3/VUJ9NhRePXegEH6NiM75h8qQVpG95tcbVI99StaEd3NdgbTXIKv
 yDyQiexK5a4m5m+Gqkke1bXDfpNKfXl2nPr4fdUQrFK0teI0Dds85QF52v/+ykUcMuBg1YtQuUu
 J8GGmGJ3zHCQgLZ/sXXfAcLFX9xbtPDujOs/An/1KEQ5ylJOd3d1OYFd58T4VIi/4uwTwrd8gLj
 WY9+t64w
X-Proofpoint-ORIG-GUID: lD8I-r83w31V4EVjKkK4awQsxwtT5-Z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add qcom,soundwire-v2.2.0 to the list of supported Qualcomm
SoundWire controller versions. This version falls back to
qcom,soundwire-v2.0.0 if not explicitly handled by the driver.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..1c4b0bdbb044 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
+              - qcom,soundwire-v2.2.0
           - const: qcom,soundwire-v2.0.0
 
   reg:

-- 
2.25.1



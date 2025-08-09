Return-Path: <linux-arm-msm+bounces-68193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB4BB1F3ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 12:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADAF3725B7D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33761253939;
	Sat,  9 Aug 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puKuQImG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5BE25D21A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733591; cv=none; b=s7tTJn4PeNd2wxHiVwqB6jMytyquKvGsbFkz/Irw0uIKrHm8I7FV398upw/7v8OF0p/8V1K+735/ppfNZAiCytae6Z+SzM7gB1z9Ul9/S31N9mkSy0ifOqJAicm2Iln718nLpz6Fsn7KC7C0leMLYutP2PCcoFkXeL6G0oDY8c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733591; c=relaxed/simple;
	bh=R4uNQJTJ6TZ6UIRq4jvXRMv3opNeQTLyTEdp1tmrcFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mnae9hFBbg2DNO44NkJd/xh4MXS5Dqtl/ExO56EPRDw41EyTrbqoiadoVONaTfGIRuF6PfVQF9PuxhLItIZnxc/rIebf3TM4gxgzW3mtRbHiKvt8Y9j0lIbAmaH+v8h1dsuBB6Yvd9qJxNClesNHYXlVGnfvk8yst3sAARmJSac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puKuQImG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5799nftB026908
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 09:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBQ0e2SAV0/ngnuxIOs6ha4YTv6YdCMqfkqSUm1Uz4E=; b=puKuQImGkrw2xjYE
	KdY49eiqRNdnHwyRNr1zflmaFztoalO3ECQJMLsUzqks5MfKDWKlP6rYoX4TyS31
	rQ4Qh//C7FJ40AUzZty7lFrsw2Hgk4Am4WEe2jH3Bob/SO1huYT3D7i+GI2uc1oI
	q0HJqWhG9KEbaMyJvPpZ9dygy0aPx4SgTFPmhPVCnmWaEp6nWDSHei1PaFdTktev
	K609WAo1EHyj44tednHlNw3fJqFYkEPRvdeyCKyiGt6OdELbk7romPqTBeVZMVJ6
	LxbtO3AQQwjNp4chKo+en1ZeXmW6DVWnFn3vwFYSPcDvodM01f3aP8cUUaS9SNCS
	hJBVvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdurek9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 09:59:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so5010290a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754733587; x=1755338387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBQ0e2SAV0/ngnuxIOs6ha4YTv6YdCMqfkqSUm1Uz4E=;
        b=pP9uS6ECZmESx+ocfTcijnKkfWjCZmkFzyIC5o7fPm+z6jqTGiQ4whgnxulWrrSJZ9
         WCYT8+ZSyxpZ6HO1O1mQkLxIo2sqWl8MxhSXQceCGFuR8IezYrjgWfDCnDOuQDUxf9zC
         o+W9TVOPEuI0ZiS4JdC2TlBbvNQqbS22GxAN3bOiqJS8saIRFumuB5/xsmZJXXsCCObg
         HDBZMH94lNjrukTxWN6I423RThqwatX42XXZeR1hK8ZjbvF7OPryINtmt5lViJjsY21F
         c537OiGcxzVO3i1r8wJAJHHLeNESoK3wGJguUsAKR+mBqT7Fd7iEdzVvriS1t4ixoI+F
         yYNw==
X-Gm-Message-State: AOJu0YyV2UPv+k3UNbGig0YOrfJfPSESRx+i6sSQ95HYf2ORp5ZRBq7e
	0bCCXXV5uEzkN6Ajq6pKICXcy5Hb8OwlgNquGOXMgKFImJk/eJvhX+/yr7ezdxrTaux8knYQhz+
	/Iqy6iwZgjXY3eb4V1xvwplyBpJ8LB7IkYGoqmFMbt8hkNikb40I++zfzSSZFSODGug4s
X-Gm-Gg: ASbGncvxXjOymfi28CuHzvR74mphYBxCFrf67PopEyZ5vyHEe8ZLxTnZsnJwBF+/Y2r
	LNsopT0g6HH5jMkI3/9e3y2xaRJLkJP6gLgs1K0VHCyhzO+Ean801Xfs+8sIXDyM0AMMAuO+0fh
	GdjlSi8rrlyWdSpe+dlK2LbTxWEnvAh/DCYgfaUCx1+aMNx9mhx5TmrQ11p9gSWE4H1DCKPCHhd
	uZzPlfN1oeySPo41R4sMgrL58hbfedQ7u1xGlRtBO4MDMzAAviK1zlIdoqJeHBIx3XWJMSVsfvu
	qyew07lhbHy8ZTu8SMfA7GphnBXLOrV2hj6Nl89Xl2ym2xlZdS+Z43zeaV/bZX3zhuVuftsAh7w
	=
X-Received: by 2002:a17:902:d2c9:b0:240:1953:f9a with SMTP id d9443c01a7336-242c20703d5mr104333295ad.2.1754733587519;
        Sat, 09 Aug 2025 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4c/wiGzwRmWvFnGhbo7cmBsz+6nWkl5TgRx8Q2bsS4E4Vq6y5oGW9hWnJRcnT/BPcwMFLTw==
X-Received: by 2002:a17:902:d2c9:b0:240:1953:f9a with SMTP id d9443c01a7336-242c20703d5mr104333145ad.2.1754733587106;
        Sat, 09 Aug 2025 02:59:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b783sm225962845ad.133.2025.08.09.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:59:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 15:29:16 +0530
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document
 the SM8750 QMP PCIe PHY Gen3 x2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-pakala-v1-1-abf1c416dbaa@oss.qualcomm.com>
References: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
In-Reply-To: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754733575; l=1281;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=R4uNQJTJ6TZ6UIRq4jvXRMv3opNeQTLyTEdp1tmrcFg=;
 b=Pn44e4XwnwfvY73BZod/cOU+TNd9XbdK5DnaUkh10yJmXKf+BBVokgllhEO5swZK6AJvGflcQ
 3E3Jgc+ZT5JBvWhJhQOkMM5Ib7UJOT30HMRDM4dxwY/tg3q7YF12YGJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=68971c14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: VVpBbMDLe9MfbX5XblE-HqTaGPPsgvva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXy2Ii3VeKYeqG
 Pnmqw10nYjPGjlkrZ2uVrc67EXX4iyQ/K7mQdNiHi9819K8YPFEdOPxpbm8CAS242G3ANWoEVe2
 XJwyXKF2JC/3VF+fCY7eAedVPJaRAkQNmrmWNA6mJ9NGXqhqE4JiUocdiv+vj56ntGyxZ9oykwh
 jYCslaIkgDWJqnKQBgUGKdkO5IGtIy11UvPHPk6/W0dLYWjhE3GTAIxGfTaBCHcqQzzcwTAHnI4
 eGQTMb8eZ66n0z4SyvobFr+NlyGeQhFxRs/Fl3sR8ykoxO0Hrt1IKIu3lh/RncGgBhMyVHdz9/p
 o0kV5w/zjlqXVZyzhlv1v2Rl0N3HZF4NXl/5UX7UVqexjED14KV3wWD99T7Goh9iHETw1exMXmr
 3UGGU66o
X-Proofpoint-GUID: VVpBbMDLe9MfbX5XblE-HqTaGPPsgvva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Document the QMP PCIe PHY on the SM8750 platform.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index a1ae8c7988c891a11f6872e58d25e9d04abb41ce..cb706cf8219d015cc21c1c7ea1cae49b4bf0319f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -42,6 +42,7 @@ properties:
       - qcom,sm8550-qmp-gen4x2-pcie-phy
       - qcom,sm8650-qmp-gen3x2-pcie-phy
       - qcom,sm8650-qmp-gen4x2-pcie-phy
+      - qcom,sm8750-qmp-gen3x2-pcie-phy
       - qcom,x1e80100-qmp-gen3x2-pcie-phy
       - qcom,x1e80100-qmp-gen4x2-pcie-phy
       - qcom,x1e80100-qmp-gen4x4-pcie-phy
@@ -164,6 +165,7 @@ allOf:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen3x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,sm8750-qmp-gen3x2-pcie-phy
     then:
       properties:
         clocks:

-- 
2.34.1



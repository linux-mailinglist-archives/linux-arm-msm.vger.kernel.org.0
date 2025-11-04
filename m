Return-Path: <linux-arm-msm+bounces-80254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA13C2FBAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 034B934D13E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A779530AAB8;
	Tue,  4 Nov 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alQ8yu3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckrPo/BE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65B3101A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242992; cv=none; b=nwLVtqLNYBPYD9o/fcuVcMa83n8WdIxB6GpNuLGyHK9xmf+Xr/7RlgTZipK3ENl1frHT6agTEE3dnyWNgZJdeP1lst2IyKtMcB24+U8pAdYJrnkO2Wh4j0J9q9pg/FRuLrcOZaSN+hBPGa4eoeYEZ30d9d7HVChZBnKMFPf7Fa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242992; c=relaxed/simple;
	bh=bHp8KyfyTgywNWuOKhm3Dq5gP74cMZKfenoZcOODGik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4y6y5shFTQRvKw9owalXr6oTQisNIIWk+8fpS3ARBsv1R/92TAbvzYm8ln7LLS+pnT/HJbMKlWxoiVBlb4henSl1GdiLVmxzJRAxCgTf8xbN8igdnkoDvTWHRrufwbs+zE44FJN8vT7Bz4RlrdDSluLJWuNlwjVpHYL9GxfBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alQ8yu3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckrPo/BE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A433PI93667728
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoHRt+4t/c3tdwGEDl4fclkJI4Vp+4dj/2Y0zI28L2A=; b=alQ8yu3xJ3FjoQj+
	elCtwvIDJ3iUNC3PN/L/FeSABIfRNwwvn8bkmx7rfM1jfgRLupb8v+9BtyFUV2Tx
	vFTl0GTmiqhoZlIBm6rwRZ1t6d/BcKhqCd+Qa+4OkjVP3PhlNlmsMWljIvRKBLQB
	OqRnnRgHK9R5r2G7iy9G8HX8lO3wIlBXn14V+NZY6czmzNLow/8QHfqBUPUnL58S
	RvhWyV5BXI3pXdZXuokR2Zxeara8E+qBnROd7cFMkgbFgZG6Vytm9EC6hXTlpZNO
	+gWpjKaqeflCsORSFyPJAycroooCS12ushbEJD9cwI4aYjYV0dW9ibajqweHL7Jm
	iyoODw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffj59e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:56:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baf262850so6160941a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762242990; x=1762847790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoHRt+4t/c3tdwGEDl4fclkJI4Vp+4dj/2Y0zI28L2A=;
        b=ckrPo/BE/PR9gzruwYdG4drPLVUrFnVju4xhha5eAOzGD1QhodEfrhrmFk6Of6msS+
         fIUVqCqrMHPOUTiGmq6+Gl15J/vmrGADWLEix/QtiYLcgJx1Ntwo1lAKeg28EKCffwUE
         43HtaEucUJgpFBQAYE2MEhNlw5pgXH9dUOFtoMBkREKO04gN21zptete2G27WIwRd1LX
         cpYvyZgVtzaI3xGHRMegOynZa//4ocv+F5MwK0hp6yGy+rqzBJlDXuboYs4175O/oc8z
         pku03H1acNuEmAMvdLD/yLOjHPCpWlVnHhjHfoE8/6RkgUeM1+KbWkeWQyQLhHmb+cvs
         UOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762242990; x=1762847790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoHRt+4t/c3tdwGEDl4fclkJI4Vp+4dj/2Y0zI28L2A=;
        b=AA24k46Ou2K0YYAMw5SMadZkBgq1FxqQtm+DCOEOlm2clwxRhJLquxZCJXqs6RUTrz
         vFtX53PxzpMOvsxrkuOzzQao5pP5tZOScI0XpmWK3YTCKaXkx3askYTe8EHChjFmRhsZ
         PZFFavskJcK6a2vxyRvwpJSYiye64tfq16KBnLw1n7womAuZwdRvOyuKBb7SyDgWeyw2
         UY0FLiAeDTJS6tZJn511rOGQ8dRQmCPxYGJzXLKI8oycjyFZ+IG0UoE8Jr42a4IaGvYW
         y8C7PbQTZZSt5EBC+rawH2MXn8ruAL+iHMgvLCE01Lw3Ak95y/dOv61VwQC9LJkX8VdL
         SjFg==
X-Gm-Message-State: AOJu0Yzoo5bVeGvo3fNb7osYfqIr6c5yx8JAGKlmQIlHUpKCA4EERyWU
	T5AzPsN9Lwdqax7LNz3yUxnfjy0cxEz+rO7kWp2nc6iwvzOhWz7NB0KiEIP56kncGERoBDVUK4s
	HgfC1F5qnzo8zhpZIm1qW3M3eeOpGd5DEwRipvdCPf7PkF7BT92cJ7tOcFFy8uXpQeqbN
X-Gm-Gg: ASbGnctl1tzBVw6wDrjz0sKXkyjnlPRNd1l+0WZhtOb92Tz4bxDfTk79qm6+dBvIn4Z
	oTMPJqWQJM/lJReavszkceu7MyPcwzK8cun14DiiY0/0P5t1Fq6AOAskkQaLgfUPLbGa2Br6VnZ
	T22qQovCFy4/uxWJYI2g8WuxgSbKBohhYRJtS05ZhYM86sFOvQXjiUxxaUM145Vuxumn3Rm6zos
	ALjQekJ7HgTPPjnXzWMOsgKQkEq767GiH+3e4arK4fLZY8dB4iRqqU/KQXn3P45nr2g4jCWxybG
	q5my05bB1b7p9CQteFJCW7Rk1I6CaMqq7JnoBHsM96mwknbTaeF3UE4vzaHT3VnvUQTJXznySd7
	yM+eGwtpdiWO2AYvspWfzZBNvAZi7HlrLRTkxbRkdwHyxMQ==
X-Received: by 2002:a17:90b:2d84:b0:340:b572:3b7f with SMTP id 98e67ed59e1d1-340b5723c9emr14408697a91.20.1762242989732;
        Mon, 03 Nov 2025 23:56:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHblCsTh9EtWdUdTdA5S+5zt8dR4ohSG7w0SjM7q5S624Oo1ILhLcn4ytG8kX9EqOp8INvBCA==
X-Received: by 2002:a17:90b:2d84:b0:340:b572:3b7f with SMTP id 98e67ed59e1d1-340b5723c9emr14408667a91.20.1762242989235;
        Mon, 03 Nov 2025 23:56:29 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a16652sm3627951a91.20.2025.11.03.23.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:56:28 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 23:56:24 -0800
Subject: [PATCH v6 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-glymur-pcie-upstream-v6-1-18a5e0a538dc@oss.qualcomm.com>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
In-Reply-To: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762242987; l=1696;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=1mXglDsn+0xPeOIvS0urkFyaDKAG2hJUN/4wa3OAjrY=;
 b=GDVAIOjrtXgFxzq3uZDg8rQD0ct/+9J5e8bGi0lgeVcn5C6a0KNvzWvmp7eukWmwXw/i6g99h
 sLGPoRscagRDmBJWoDMGWX6jOH33rlVmLIRspi4B5THCcUdBlhNy+Ef
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909b1ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=prgL3jgsdPShhDvlN2UA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3YN5Ah2D8nA6XdSt-h5O0kmH_MrKPnW3
X-Proofpoint-ORIG-GUID: 3YN5Ah2D8nA6XdSt-h5O0kmH_MrKPnW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NCBTYWx0ZWRfX/TcG4CtWwxl9
 8flcFswkSUQwcAdU+0+ZDQ5rHJ52+Lt8ZNoF3mpG/2o7Fpq1jI3wyyI074oh+yAuTW8/cKVjqNo
 kAx/Up8RK3TMyYka5TgkW/G5QkUhmimS1YJJrlmLarODNif7m0IxPRITihP8Z+TsOacDbz28/r7
 GlNcWcHWxvZSCKWlDV2xOPQj/wqKdVG2nrWR8HP0sg3oObsFRoE4950f/HuUKSaoAf+VBgfNicn
 7V0r9BZMQwM1w3lH8dBbp6/pK1gouV9Ches/Do8SAuyEkJJjQdEsr5328K4hOZF/E/Xqwa5OLlr
 DKXnXcdc/R1h2nOihdVLihdndGFhuzBpHDzfF5AWfE+HxRhvis24HCqwrKZfeBbDYMf+1WtW2Y9
 fpY8WCK27wVmDPrPyRb+SsQs942TVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040064

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 9f5f9af6f6cd8373358ad7ec8303a62f006c1f95..48bd11410e8c2de664d47262b982473ee24cf09d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -178,6 +179,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
@@ -213,6 +215,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

-- 
2.34.1



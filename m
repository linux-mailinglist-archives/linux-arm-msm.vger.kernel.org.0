Return-Path: <linux-arm-msm+bounces-71660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E4B40A46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA6C20706D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A073432A815;
	Tue,  2 Sep 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTg2TTxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA7338F51
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829559; cv=none; b=rFuPftkBSOzKx8P1OwHs0UssuT3FyUhh83CfkVPuAcgvy2fDa2wL2xNUX1z6ybWEs/vm2Zp2sctoJ5nZwnPLed2um4rprAGgZNpUjS8DfJ9thbEywLMBtXpukeBKkE7qRXFyFaLsEjlml+4sS0duLS19O4soe15tpRiZGgWUCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829559; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWaDKMQ8rR+ukxc7Tli4vgasm+mK3o2xHe+Vp7ZSe+Ge4cdCw6k/swIdUEqpxSfbrwDIpreu1x7/Su8i4lfhkLqaONzFLKLdYbReE30WK9sYYTYUDqoOi/KSgnj0ed9Ols+pw0vkwz8DJk3w+tziEpmRBUb0XYCbQ4SKYjeIfeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTg2TTxn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqWPP021861
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=nTg2TTxnJhNoLL9BaeDyIlshZcE
	3FP/R9RRpXL1yQQ2Dz/zhPjQ19QdKxfR530jmSehI36+qqT79hqt3J8u/ZMlZEGD
	A6eqjw+GlSbohphegWsRzYwUjR/Xy6/L/qL64W0z0N1mGGNcy1ALKRFqlIz4j8Bk
	enGJAaxU7XvCmtaqHV8Te956ZCkBjBu9SlJ7BCvuw3kpKL+ccBtuUatfWXiFsxaO
	jIBGPy58JcxYtiicwrbsTczPZw0EW+mJgZQ3H+nGzIwWfIFNYEBsfQve9zVD0k/o
	umajJEAtkKNTR3xyaeWsclsvV7TRZttOWR2WHQNQtpEVnF7wJ68hzIms1Hg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s0hjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:12:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-544b17a341dso833788e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829556; x=1757434356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=OEEJjDA93DNoWduBx7WBZ3C/tmGMiV7Ayl+pRgj0uhWh1tncjtjYZ1IaAfXdZmgSDc
         pqAHRYCIi2zFbZwD6Rb4rqtNm2HEsZKIBko6Hi2A2R2CdiboxUeuicCK60UODjGw+QnK
         mK2p+nkk+xhH34j/3N9n5L8eanPIv+l6HSujXPBWNbmcCtsTrq9Lh3yWOO4lMxtslQhb
         zwmaWieNEfH+6+8LRcZbFClk36urwERG2r+0tf0N7aagntO5VaKaM3a56dwhjB5+YsBP
         JvcwTPnVut/bL9Xx44UaeM+fC2dIIkDAfgOLNlmPBxxkvywnzXYs6YLY/c7IX+aiD0Th
         V1nw==
X-Forwarded-Encrypted: i=1; AJvYcCX9kkYbOX68JbW38ARiNUVD8RG9PhG8fcj6W56935ApHD3DiI697IMnIdu5Iv8y58RLzU58JemaK7W1d8om@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpyd/7ukrKRCG23h+UgevpeFd5A/BPsZXa9E6hR+pxWNhskfM
	d1VbQuclhPjmNDKjkpm+6Tj+vj4ZcahxmAyi6gKV53wwy1s7OqpdLWNNB446GSw9kc6mui6tlSS
	xNHTCRzjAOldIJ5+GGzWCDmY53GwiFnnmkjNEDh307JRi+0wwzuriHhL/R5PV5fsxBfkG
X-Gm-Gg: ASbGncvsgUYV9tPju2pFrGskPI5Pp+i9xMObSyrzaKWC/5IwPLrIxbiaSH3YehQKNgl
	RyZikfdrOocb4rkTgqcIn63X+KQWhUkzo9lnQCRr+nkPW28+xpCZwiIESvWRRvUen2vFsrhnD1c
	/v6/0n0hWKRxh8igAZWo6VdDAneISQjRU94eWCCBGYbGAf7YX1vOwq0G9SPLZWF3CN3LLNSmDLR
	oAWAG3qSZLhwro0OOeFGkYnNys8Y3a7XtbSMN0S13XcO+r8MUT2lH5Qe9zNoNpcUV1k6i5wUa5u
	JptrYI1joS5ZUhXWOgooanZwybH5ZdERhD9XgXAD6kaj9Y1UIpVeJg==
X-Received: by 2002:a05:6122:181c:b0:543:6991:8f63 with SMTP id 71dfb90a1353d-544a0245d89mr2847485e0c.7.1756829555633;
        Tue, 02 Sep 2025 09:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/AW64XUiNKMzzm/MfHy36hagXtx5WIUMa11UNfoPF/ThD0Ck2204vpxusFiXXXWGCeVYkRQ==
X-Received: by 2002:a05:6122:181c:b0:543:6991:8f63 with SMTP id 71dfb90a1353d-544a0245d89mr2847450e0c.7.1756829553717;
        Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Tue,  2 Sep 2025 17:11:52 +0100
Message-ID: <20250902161156.145521-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX82TQJ6pop1tQ
 xFfTg5ABoZN6h9ZqFQORPvepuSCRwvPRnHdO3NPM/wcT3g/BhO6aZzjVGb+R8Yat+6qWt1vL8Jd
 7SsA/hHA3GdWQcGLIUEerMmPIIYVX/MnCAJwrG6+NacaaHco250JI2zHS0Cz9jC1eYPLdqxOFYW
 lfJKZS8KcdSITdyXqNqlwyup04qVbGutBPKpvQuaoeFAD9/AKHt+rV1SolnP+74Z4Rf/Qo9kSFX
 0owsFpeSVlQpT4F1gyQDYlf9blFDH1WaOLiT+CPYjevXJRJOKJ/ZvCAEovAjQnBObSNM4RErXVr
 EB+bhR1ee5tU9nA0A9mpwKB2MOpeDBvod9n2eACjoTIKm3bCikQyUJeAsnd9yQJeezE+hBylp3k
 2K15Azub
X-Proofpoint-GUID: Ub6AZp542nk8VNIZ2XpVS4c2O6Aef1kW
X-Proofpoint-ORIG-GUID: Ub6AZp542nk8VNIZ2XpVS4c2O6Aef1kW
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b71775 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0



Return-Path: <linux-arm-msm+bounces-74647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F8B9B83B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99B8B4C5D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D3A31A06A;
	Wed, 24 Sep 2025 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/88b+Cc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6831770B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739082; cv=none; b=I7TAaxKoL0b6XHe9rV1Fs3SHSQEL4+fN5k7LTR3KZQE+iSCRLSy/3UUXG9F+Zg0SmMIxMaFViVTPdV/SjtynmTkwMqWTb39Tq2TtXUCSPwq6/K1KxqKmoYXeOYVj9N77AFQ96tRBha5CGL25nvPBf94tBl75KDvN3jlxU1yS30Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739082; c=relaxed/simple;
	bh=T97FcqFinqlzYxgH+rSC8Mhx5RHcO1oPAjZVAZ06tiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CaQWPlRqCAyUwNBcsdUlzT+HPD0G0QTdFgRDfJVcY8ws4iSqNbHh47XtE0iJjMO5+6gYh58Fqfti8duerqBcDCALv2+sPVu15uw2F7oO0Ccj0Qn2zFcMGDPFBB8T1r+ZluUqQkpVOWKOYCy7Tq3nfx9nlRsq5dfwZtZWebipJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/88b+Cc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OClq0Q025248
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B3CY2hC1i6M
	iUSuv87D5Jm3r0035lg4EZdY8cNWgc48=; b=j/88b+CcFbQf5LdLKyp9gg/yCNq
	hucTkUaIzxSy8kKOePLODXXyHnun/YbaWXGPyiQNp/SeLyZ+I6LLxKWNjKV1GTC8
	LEFgFeqC5tDKZUzFsBFCfgPnSwyGdwFbFgLkj2Q+Tn2vBSfRvnGjKyN/9O0Ol/Z5
	wgNV1J89pGG1yepsEq1mrv+yadbEBG/JLStWvOtxvjZ15OIg7HFKq+cG6Ugejy7A
	xFjqB2LXuFUlD4TcZPdcurXZ8qa64svPhkf0a0b2WFMlGEvYqzo1/r0N8VeGl1Qf
	ZiXl3GrxQ0/MVNGCr612FoF+wOXjvcO6+Nbctf7VPMQKUan7RtI3WVGwyGA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv15ex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:37:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55443b4110so46884a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739078; x=1759343878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3CY2hC1i6MiUSuv87D5Jm3r0035lg4EZdY8cNWgc48=;
        b=GgyD2MZOykKBNHC/vsrIfr99fABFbd8jPur2MuTEbB/OAH/I2bDLPco1jD50iuiY/w
         xH2CbC6KNQnqHNeOoMzTIGC8rU4U+8idqiOVBX8+GbxQ5Nfe6k/gxScGJoQO/jkfBunP
         1z/mDMzh3C4Ybny0zRuogGsNKB+xTzZy34CN5m2wlLcQG9OXiW4QzHri69Qh5PHprPJb
         BIOe5LlnpH2SvfP6AAQ7G1XjeLve3FLNk7syMm0dNvSLtuNQEismjdzsFhSLrNuKW+aG
         YYyx5PlMeNORurjO2ZfSP1ijqJ6rcS7ZYzbPI6hzYst0TEMl3gB2sL8XH1ax/bwd2HeS
         kCEA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhl9+AcvEVWKpLX8CljKL7LoeuNTCm+s13XmH0M9QLVf+rtRll7fzl1xS4e6o9DrEE0HP8LWCmk5/4onF@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOvG7H1i/tfoqbmwLy0lqQZWCweNZumxt2rsT4qgAR3hckT9I
	H4e8JjwCePMPU+MJ92l0iHD7Xgzjc4jejypoVndBdyD2KJUBTlwsiJUrKrv5B0iVzTxmBfCSmjj
	b6j07EZr9gEeZinUMbURTvIDY4yMrnAeHVf7YEe5PokEtWgOZoHQ1UUv0xIiW4V3LtuUe
X-Gm-Gg: ASbGncsyk4tbuo5FyWZeeeXsJg95UrxjxIGxuRKWooJCwvpTg7mj/6GuCXynDYhtjpy
	j1DB0+y6572Aq6X5TPl7kTaA5NahCzGPZNPBMyw74D1iQGHWFRicbM3+dPUtQZNrR1g1Nucy31v
	pnWGZaJ9tt8RILGHqLYCd737c9AQsraU24te/MMATbMSa2DrZj3IvdeTjgaN7y0xC3R5n4f7+BC
	nBVriz/Ax8lXQtr9gngbUm07qHpJCHeHR/qjuuEvpnhUvTpCoJ473idae6G+ldNnpTEcHQu59c8
	Jub6rDKXh4eTTEy0JyqqfBgyzrqiMyeoYLOWYm3tdztVHgNeS51XQuLxw7VQCOJ937NcfMS4izJ
	M3vbyGWinhp5OIEn0gT4ZrJj7hgYxSqHCXCy5NBPjncM90cjPjjxRaF0=
X-Received: by 2002:a05:6a20:3d1a:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2e7ccc59ea8mr699698637.9.1758739077948;
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYFL5L9wefd1CvJSJ4agMNAcdiizATbs8L/gXpjLu4lLw/H9iBQnCCFdWLJ/wMVOfQL8qzWQ==
X-Received: by 2002:a05:6a20:3d1a:b0:249:18e4:52a9 with SMTP id adf61e73a8af0-2e7ccc59ea8mr699655637.9.1758739077477;
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:37:57 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: mailbox: qcom-ipcc: Document the Glymur IPCC
Date: Thu, 25 Sep 2025 00:07:22 +0530
Message-Id: <20250924183726.509202-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _2ujj_c-qIY8azAWK4ziOUgZ_-cCPaPf
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d43a87 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5H-Rh-Mn9-agE4ZKsUcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7MtYetmS5IWV
 IUGJthfkCyx4TB/eW5Rp2/vvDU7/4aNPfr6piYfHQrWyN69q/P6EVfcUnQwA8LA6p7qlE62B+7Q
 I6qi3Psr0tjxD2vEtIU1eRWTa7R8xhXXARxeacWMWWQLUH5+qWefs45pK8eQXTzbl5p8PuJSwY6
 a135r90DLEwtypC0KyKaEdrgBkX/1XEEcUc+3ex+hgSMK+1VnKaFnCbYB2/iN5WY6PjSh3qkNVL
 nTCCkxVYtZTg8lH1u2L9HL9PGMm/GO3r5hsbLDFoD6MTcAtGLFzZjRtDT7Wk2lDV+AhIREHvhLw
 6hBGqtKP1sCbAkuamoDwq0dn9N0AWWIyNeJ+FnoomTGJWTJRV/u+xg/QvOPHqIviHqTK7Pq0CFP
 xYznz+g6
X-Proofpoint-ORIG-GUID: _2ujj_c-qIY8azAWK4ziOUgZ_-cCPaPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Document the Inter-Processor Communication Controller on the Glymur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index e5c423130db6..129870185884 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
-- 
2.34.1



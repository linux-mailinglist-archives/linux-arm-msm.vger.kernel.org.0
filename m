Return-Path: <linux-arm-msm+bounces-87116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A3CEC06D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 14:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49B79301B2C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 13:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2221B14AD0D;
	Wed, 31 Dec 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AstAZ2O+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dfy8yM+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8728D2264C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767187899; cv=none; b=dH70m3E0+fpR/Pn3dpoOlW8WOxDhnDrBfGh+kx6xgybAyOjnbCxzcpEZWb4h1FTK6bvnLK6Yuizm2xtygqqMyJyOY7tZfAC8CORw85tyvEPd8WfLqArfv0iojy8srCb7wBqImxXJWIHmQT5QTG4QXAoRO+nwp7vRhfjG0aFi3XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767187899; c=relaxed/simple;
	bh=+fwyYkzIQVQolQaFntwnItchopxmfbkwdjIsllj/oSU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HA+QN4EFtURv7RlzPivNJCc6CH3jaJklwf0ZEAv5s6vq/wJtHap7QAN7EyztoXTAamvNoys6Ka3WPyE6lSnpW+TrUqPa/5KapX5/YW5UmdRgXeq8kj7GadOv1Y7iU6F2aMxasyjpESYZevjtb59AqR46SwRzUKJQgum/nrsPUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AstAZ2O+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dfy8yM+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVC2nAZ2725780
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 13:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6khf3y+B5eud9mBSQzrAbO323CbiIqLJSaQ
	Bz7nQTq4=; b=AstAZ2O+J7a1ooJUoTFeoP8PmkH9LEMKrg2dLf8V1FCTQD4lpDb
	MmBgWmA0DC9SGUcllZgA6IT9RWFW2Ed2CF4rKRowJoQ/JilyYLGUhp7mjQRZN6gc
	ko7YFjDpivY/UeIyUnPrX5jl7q0wcgOfUEG0NYOyqc4fwk1U91ikmvDNNGlDW6f6
	19514qriCykK6kDtEcNUZRdt7A0i2B0Ix3WowFFf9iVAZEAt8PTvuh5lXP2fVisD
	kJsEjXh31SlSZA1wHN0fc900AVxb1fDrmWDzZznPaq206yiJLBM+UNT4QvlRcqhi
	8+auQOHWN2JiU92QXnN4acBgUKDAqQcwURg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdmd6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 13:31:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c213419f5so9867253a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767187895; x=1767792695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6khf3y+B5eud9mBSQzrAbO323CbiIqLJSaQBz7nQTq4=;
        b=Dfy8yM+jh0oMBo2EIrALdd3mLFrfQmPBYLtfLQSePPezZ6W2BolP8UMxm/yuVR5k++
         DVZS4Xu6EHukAHu9wEdRzXnjETBn/C3fZP63VJAUFYw1qxT+6dU1C1IEabwu7dUvmpgr
         oIF9UkT7FbANEoLmg/C6vtTLqTXtDxSlCtenelq0jSMNuImMuWGYnU4z9D/6dG9M4cSt
         0SzwIBO7fzhVJLdSdknA8ArR4W3E4zFUXiG61WZpl/3tjG0P2l4l7b/PwtOYeveStL9F
         L+ZmAvtn4qA+pC+2wfcMlPV2buD2lnbpfWMDMVXgplzgA5Ryjulf+SQvUK6Q4Lqy1Abh
         Cz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767187895; x=1767792695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6khf3y+B5eud9mBSQzrAbO323CbiIqLJSaQBz7nQTq4=;
        b=karMUuICv21BweK63RPcDlHXB7rk1pFE6j9TfkLKLhxYu0Spl67UCEypAx+1ZJ4SCE
         Q+URj0QwG2r8/LvV0mKhsbbFtww28ZvEBmOdpn7+8iGUJJJZLjHvCpPR4qbh1ncJ2xnZ
         fRl4N3kFHCMI/YQsp5mbVRUGGfStDHvmT6OSL1QtAQAMpErrA7Bep+8YinIITq4qatye
         2R+JzPNEyLiRsKRJVm1yQ03O3kLAVu6EZ5kjGW/kaQnK0y7FbhcW/w3r2DMfekeHzg8b
         V+SURVkwrV+wyVob+OaIU2bPNSjy4TIMbBZB70H5hzY0M4o8T0CLx1YVblZDdwvjH+3W
         kB1g==
X-Gm-Message-State: AOJu0YxcvA4myd+Zoj5hwUKiZ2cRRqGbb8BowFtRBAN27+an5lP76uP8
	1D8ToqWM23u9L4wPBppVUJFVHZsoAXZ5QbnUolFaS2O1uZZPi2Q12nhz+A3mO1sKd1dQ6xA97Lh
	T38UeWLLPkRoDGwIfegSyQqCRKOlPBBhZ0rSzqlRse1xEnVhFK9SH4Jz9Y/lRPBR/9atk
X-Gm-Gg: AY/fxX42YaLDnHWMImBHb1Zcml/YnukDJEhRlN3vrO79gEDmhwWSRK3MfHzPdFJlPnZ
	5omTuE9PyuxteNjkzLzrxDF+5YQuWP9ba29rqzKW6XAPRy0+izEHvDO/L7fNMIrdNQZfLaISbm+
	KC5pMnboDdj1WlRF4SNPMFVIs0iIzFT4/kwb+xpa+o+Ske/pTElnwvLgxZmhFmAzesHBKBq4fPW
	6woZ5asTQ4e6yiNeLDsXzrLHt7jEOCmMPxhKemBlfgR1t1YW6f/k8JSgZfmCacaGs4arue6kzTM
	WtAo1JGXE1BHAMMrIzNO4QR+GQBGVv6ChAIG9d6Jarb+bZS/ZGMyyGIJEN7dPwXcRwNHLTHM7T/
	4haYUq7GnHdEM3eGo0LzK22r9WAkuZTlnGK6Hh9ce805FHaPHZuwUReluP9nZCDbQ1Z14R6HxeW
	olbTyZJBlLy0bDREib0Fc2o0wB/okbLA==
X-Received: by 2002:a05:6a21:e097:b0:342:873d:7e62 with SMTP id adf61e73a8af0-376a7bf0d49mr31957741637.29.1767187894999;
        Wed, 31 Dec 2025 05:31:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdZPuu2jWeVDgwZC7gyRNEWnpwbxhVNb8q0dF01pZ+tfHtG0ZKkQ0Wpw5Hk3SXhVAx2oLhAA==
X-Received: by 2002:a05:6a21:e097:b0:342:873d:7e62 with SMTP id adf61e73a8af0-376a7bf0d49mr31957720637.29.1767187894497;
        Wed, 31 Dec 2025 05:31:34 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm35919812a91.16.2025.12.31.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 05:31:34 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Update max interrupts lines to 16
Date: Wed, 31 Dec 2025 19:01:14 +0530
Message-Id: <20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767187874; l=763; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=+fwyYkzIQVQolQaFntwnItchopxmfbkwdjIsllj/oSU=; b=gbNDDD00R+1ahQOoV7TxMgAdj5zghlu3YA2taoGUF67qsRJpsB2lSBlUR0a/xzjLIEB7laKCu PN0pk5h6PIxDnW5dpzkxxOGZSksmfKJE+g2b0Eu9EaKzqzjmDeJmexj
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=695525b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2kavYovvU34opV40E9QA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDExOCBTYWx0ZWRfX6ffsYvMo3zVJ
 ZFIud5neNpN4C7dZ1lEUh2iO2CB3yyqbQxKmNDZeNNqit+gq1N+brE20k3V1kxqHEQMVTqg5tyl
 zhPbfb+IT2hAiwuzEf6AGTjjS1r79lNMjYue+pVwTPW3xusGixGlDGRxPLN1EEit7SBnP4zrUkx
 MOrsiBhDLa57WSsKUOn4/6sqaXGiN+HQmsIfXkgw1ucSxvTjb14xWQCdqxRpvm0sXwJQfyZJHIR
 F0X7QIg77WE9M5eh4iqf072dyBqsKCFqQvxQjq44FuNeVX/J4Ulw1RbMuyGtHw1IpgbOc8krmFr
 jE8V9Wb9N6x3LrPF2b6dxln9W7SUGm933qhfjZBUx044amsTREDhThUTio5h3DU6taeuHiX/q4p
 6oDLF/wbjlI/u3HArYlOXhbz2xpXugS8YggMlj9XVTM0H2S0il8YDgzyvB5usFVhKUAkV1WFbR5
 t0YPoM9jxZrJeZZXL0g==
X-Proofpoint-GUID: v388P5XkZewWeuhwrz9vTanSLcHtiSPl
X-Proofpoint-ORIG-GUID: v388P5XkZewWeuhwrz9vTanSLcHtiSPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310118

Update interrupt maxItems to 16 from 13 per GPI instance to support
Glymur, Qualcomm's latest gen SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index bbe4da2a1105..39ea09bd9309 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -58,7 +58,7 @@ properties:
     description:
       Interrupt lines for each GPI instance
     minItems: 1
-    maxItems: 13
+    maxItems: 16
 
   "#dma-cells":
     const: 3
-- 
2.34.1



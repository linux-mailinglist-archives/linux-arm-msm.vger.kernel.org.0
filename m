Return-Path: <linux-arm-msm+bounces-71632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B326B405FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 067BB7B5806
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08ED3093CA;
	Tue,  2 Sep 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9MOadRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AA2DAFD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821669; cv=none; b=sGXdZRiKymH3blE6FWkxXPlFhhPisFR3RBgpNxDiJ8O7SykXHcx+1J9GqiSUow16Mu/lK0P8MSzA9LWxBdBNbWciUvkrOcH84+ymV4ukAJecFKEV/akWnoDwXeJjUWLZ5aXJU9NyZFjT59p9nHtARocY7xaBjzBi+jFQz/EQmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821669; c=relaxed/simple;
	bh=LA4VFOt3FgY4aF9ZxXhKK2bEkPtHjpqcJQqusSBl6Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7UkHERb5mWRnGyGjizXF3Oi7KU6PPoKCnq8V7nsssaGM3IXAYhf78aPbUEVKLZy0Pt9fBHiUlkSYuEkyjUjTZ3iqsrEXx7Y8wHvO8V/G40pXelciMVnrcF4hLbzk6P6qSfHzY6hI68qTDOkd1N80kQb1OoG5RFEFb55mZ7YimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9MOadRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Ae3RL021586
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nUrsZtpHAT
	W+DRnY4OX8R5uwVqSv0TAiSweK0q80FA=; b=o9MOadRlWdllZshToc6EHL7ZNdM
	vsBYKb73KcInqDN61sc0lKCayFIbMYuMaA+AAEbbrduhGdH0jFVHVw6ukHdB4qVH
	buX5P1t9iw0qiyuXtd6a0Xdw6YF4xComRCnJ5WrgWkWR6wXMdw6ufi4iALNm8GEy
	X1EFASyQcyQHrUP9UffC1lSZ9o2JeMEIRGZvb3Ysbyxz2NeMTFj0FejaSA6evpP6
	UIBZDSF7uC50TV4HlVF6u4RgsOYn7rKHtLdSFsk0/rqtrIf3gVZQAn9nBNEjS1rB
	iosP8x8mwq2NbyRqcralEABgpR8EPCdbWXr/Uqn4losO8FmXeQ2eVIhnZcg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s03tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:01:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-544b12e328fso423198e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821665; x=1757426465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nUrsZtpHATW+DRnY4OX8R5uwVqSv0TAiSweK0q80FA=;
        b=XMBiZaGjNV62qCdvhI5iv1Ff5SCUW4FminErwd3GF5IwTJuL1dke3h8r2/B7xwpgDT
         z6RN7UogMfXn/pKmnREyguBo3YA5Z/Ux5xVuqPWLoJ/OY4fXRubJDLrEtcdEwt88c4nI
         5jtWhY4LWdA76MmueBRy73tGfWJL5ZlrGDfyYwo/q2v9o4e9qKMZjorLYEJHQ9frpimc
         AqgoSvOeud6wYd5zyWWyWCiK31KJk5BBf8PvxRIsIWJUpiy3MbXwS3p+yyy8uWM8NLoI
         gelciqz4H4MW8lqBhK1zJK1Uhn4oY2c2OtNWPxco3VbnkV1o8de23rt5nHMQu4Thz6PH
         QOXg==
X-Forwarded-Encrypted: i=1; AJvYcCWTjE4+HiAdDHaL98C6OhTHL2TTC14nMPWLJTWXayyAbFcbIzInYIL4/1phh6h2aCl4FVHdGZ8liTbVQK5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaEfCCNeJqJonyDCATEzbYyqzzSsWs2MLgvA2tcJEbR8boA5I
	7tu3tAHww8klKhOzN86ym7uG8ticq++4X4hatDV6wPBsEpSaFc6y64v9PU4cKdbDhDpXtpcmGTm
	YmIzc/hHute0/uRzfxMa/RGpPxHABMkjysk/lqPOvTrd7Mmcnt4RacWlmItxwyNS/movZ
X-Gm-Gg: ASbGncvBAgykdf0yyiJhhDnEpsM6DaAyLv7eUE395uj3Oqqc8qyzqBQmkRGQ8nh+qfZ
	v43jYtfa7jJG36mXQ2WsVSOb5IkcUqR9Of1NqVvXolkRdfX6c10FafVGyCQR+SfDnhuhQTmAQTu
	JL62xelAx7dmgOgdNNsDah46khyKnr8G8ciLtlUmGbxNWZSiOk6NJ8pLWffjAJsQH0dK0+17NG0
	ywO2eGaxGGKk6CqYfZLC488dkfSmhByoMP7Kw5ZRvSakebugV2ntGTxOkPKHgEucWUZonLFYnwy
	yPhZQFyRdNk5++IqkFm+gpxH0kAMZvTKM43r29YxK57c1j+rxbHsOA==
X-Received: by 2002:a05:6122:8c1d:b0:541:7a56:4c74 with SMTP id 71dfb90a1353d-544a0306e0cmr3436212e0c.13.1756821663209;
        Tue, 02 Sep 2025 07:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTYZ/QDb/Ck1fRw3jrSUnp8sbm+lDs1zmyvi4RAl2+EBFuGiMi5sraBYIysTI+XWrBOe6ww==
X-Received: by 2002:a05:6122:8c1d:b0:541:7a56:4c74 with SMTP id 71dfb90a1353d-544a0306e0cmr3435884e0c.13.1756821660065;
        Tue, 02 Sep 2025 07:01:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm14381196f8f.40.2025.09.02.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:00:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/6] ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va macro codecs
Date: Tue,  2 Sep 2025 15:00:42 +0100
Message-ID: <20250902140044.54508-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX3pBM5T73tZk6
 GM1kyTBl2jYz2ZKuN7CgKJeZxXco01YYphr5zBmg/fPDrFILgRQG6rPf/DJKkp62YT2bUisravh
 fn/JtLwawnwm+bQcAoqm1r+JFS6E+TCJ4kGnd+VazjfeCPFwvrpIZGsFKBAt214AtA90BgTUYGJ
 pE+3xMs6KX03CdIC1tX6ypLSTAR3h8Dy2Pr5RgVtt0UwQmJbUHzeG2jAnc2VQPUXuD/dnv9PnjB
 xDUxbcD/wFnB4sTVEFBdI/fG9dFaldKNrPqaTnwLfFcHO31erOx6Wz2AkqFfDEdj098riHGe42N
 pSRqBSpzTL2TexuGmeky/Y/6Eu6pBXDgMKxHrQJ6EFN/waRgLtrdex/JdpFuA1DHoTJdJFZi7YA
 HvgAcs/o
X-Proofpoint-GUID: Ol0mTZ5bLg15VfQGabslzpBa2nFTSRlo
X-Proofpoint-ORIG-GUID: Ol0mTZ5bLg15VfQGabslzpBa2nFTSRlo
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6f8a3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZPdVxaYzjB_9TeNNi-QA:9
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

Document compatibles for Qualcomm Glymur SoC macro digital codecs
(VA and WSA), compatible with previous generation (SM8550 and SM8650).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index dd549db6c841..2e8c26d89b00 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sc8280xp-lpass-va-macro
       - items:
           - enum:
+              - qcom,glymur-lpass-va-macro
               - qcom,sm8650-lpass-va-macro
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9082e363c709..b6f5ba5d1320 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,sc8280xp-lpass-wsa-macro
       - items:
           - enum:
+              - qcom,glymur-lpass-wsa-macro
               - qcom,sm8650-lpass-wsa-macro
               - qcom,sm8750-lpass-wsa-macro
               - qcom,x1e80100-lpass-wsa-macro
-- 
2.50.0



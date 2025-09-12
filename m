Return-Path: <linux-arm-msm+bounces-73253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EFB5457D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461F51C8693B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354512D6E68;
	Fri, 12 Sep 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZANaUjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A226FA67
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665963; cv=none; b=r9FZllJZfCm9ZcbUmhMxj2HDshgML7sMeAHEyoWZtx0Isvl9Y6U7LyRwVhH+qZVgzmGf/CI+23ww9y+clmaMlO75Sn+SQkZR3VoqGAC6i0A25yAcALB8dlmTA/TanAszpOGNJuv9pd4hqeNl/4CNzGuMutYtUFxzg73CquZULow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665963; c=relaxed/simple;
	bh=fD8gmiEfvHWqA/qKuJvc+eRI/STX56LOgZaEfMt7N+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/J6s4xQWky/bbvNNOKsvm6Cq53RWTrjiKpqcn21/3E50uTRFXnyfBAfxh7n2vuTp0KzSPaQxhK6U1na8nZT4g2a5TI1YIrFsq4ac6XpRiowcQ1r6vQg4P7YIsOfoCQF/Dh8XfBtAysUONe0pnnKCdNqtmokHrXb2K3Zx1YFEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZANaUjs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7ePK6030862
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bwb/aCh+px1
	clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=; b=TZANaUjsoea1z3esiiiMIIvhj1v
	3mZyeePcLnYZRkr9l8e2FzgRlJ17P9BZq0CrH3gpU2ghreeu7Piy407W3mS4byph
	0o/orDLKbiIotBitphoXnmoLd3YXOALwPTkwIua48hMU3CJNby554cNAUhGQRqhc
	HpvQ2WAxRDxKHs0IQKB+WmGpDdMn+Zf27nh7mqVPwPHeSY6WaMvSx9zFpiOGSAku
	KQe+kVXmYW+N3/orWE6Hgg2R8+TpXFpxAb+gzRIFw5ZHtpHrWIrp4aSqEYF39Qt/
	VnugbOe5yjGt343NPlTQ15sMQC2I/3pyCuIODZvOY0CQYhwyL6gxhE36d/Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgakv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-75e974f3f7dso46282846d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665959; x=1758270759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwb/aCh+px1clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=;
        b=NDiWu8aUpRtzPfSTO47ZgwtsTqTamuRC1lof4CMQEe+51wq9B9H3fnL+oVwTopBxoB
         gFvTCbWMCZLWKlSeW5zjezhDtMGSYBkevrEwvPivTxsWA5mCK/bzgiwa2AOnDU9ARN1t
         vdcl28hb+FlAdt8/CwsRXq0ClHg0tVaG9CyRJxG9D4ZrGK4RPdEiJtqVbG4p3otuCzTJ
         2l3l+W09/ApR/e+9BUYhJ0jy3qojC2sWXuGIgtqzmtnFHpBqSAWbtfojBr/+keJ0itH9
         1q8sFWZMEiy9NrNAzcI/yJU/EmH0Q3jjjLobImaXZYLqvj4lnLLmSq/vFK65PuwqkbGa
         2Xng==
X-Forwarded-Encrypted: i=1; AJvYcCUFfDcLLXncxPi2gEymx4Y4XhWhEJnlkaWgcPwgQpV78+R1kTlBszLQ+rGATElogEl/RgZwWMcqYJy9aHQF@vger.kernel.org
X-Gm-Message-State: AOJu0YyvhFh8NStQ6p9BvZaoD+pIaMcFwVHVkcALQqJkneVMpfRiP5Vd
	NlNTmM5X4aesn8lH6EpCb2skT948EiJQP4jGsiBhx4sAXG5e6yf8LJSNXm3yZSKmlxYzhU/ViTa
	Zp6mY0T4nYSpF628D/daVK7w3eF1+tkvX7QJl/T5Awb0vcWwhkwaHb4HbNhfILh0iv7pj
X-Gm-Gg: ASbGncsl/vhjoVzU1bBKl863NrvDjJK8Eoj1hrCpJtXceIeTTie7/UCWOXy02T0oeIA
	Te8J5HxvhlH9p+AQc5tbhzXtqBQwyOdhWpQPLtesB1WI0G7AFsdPgUKb9UenVdwQf65n8E5sdQ4
	ct9DTMLnKElzThdsLbkgDewb+8x6ghV/hOQDSEU9p3tdvgzQv9fDmBjxg2KrW+T3JKiXKi79BLa
	fegEQkGxr9zL8oJTvs59Qi+jX0o78r6P0Vpsi1KxQwRgUwoqNKcPxcG8s0vdCKPXb3HPFhz/rm9
	lzPYfSpo53pSewOGOpiZuTfOVt1q5JDqMcmKWNb7J9nX2BNuvsv8vw==
X-Received: by 2002:a05:6214:cac:b0:719:44be:3fc1 with SMTP id 6a1803df08f44-767ba92fce0mr25430396d6.1.1757665959333;
        Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa5DR34k3lvL9ybEJKoRTvbdPXiLG74+0N+qX4CK7QBfFv1g8JdBNxPvO1hEh4nac2FcXzsQ==
X-Received: by 2002:a05:6214:cac:b0:719:44be:3fc1 with SMTP id 6a1803df08f44-767ba92fce0mr25430176d6.1.1757665958905;
        Fri, 12 Sep 2025 01:32:38 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Fri, 12 Sep 2025 09:32:24 +0100
Message-ID: <20250912083225.228778-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GdXf6wnILIzGGDCL49gAwlOqlxQHdYto
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX6OZK3YhOxq+c
 cvWNPxqlkFFHcLfK+2rWqDm+NwMXIyWfweS0htADCAkdA1YigMijzKkdw3xqWt3YwdfxHG3JE8e
 FX2Ws+0uxcICiDP1GXsn2xQs5YIX+QtaMZxUy9PxLHXD2ut+7f9Dhs3LB6EGMEi/RZx45NoXZ0n
 SOO2SwnWn0UJLKBC/l3hlA516vwbEuK4Nl0faFUYz7OnGnwm/5/nsxVJDNxgvWGqd7oYM/lAMkv
 t6RHRQ1Zf3zLeR9GT23oa8t87XX2K1EcD+l3QpSzxZA8jBrhXD4Aj+pOWZ677n11d5YTiHVCwi0
 Hl/h3yFhJZx2UyTGHX7AcBBX/cwsfhegqKe8RmV8jsDqxdJIPS/Na9J3AqsXq3JEIlr2jDwrmas
 5tKalmYH
X-Proofpoint-GUID: GdXf6wnILIzGGDCL49gAwlOqlxQHdYto
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c3daa8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

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



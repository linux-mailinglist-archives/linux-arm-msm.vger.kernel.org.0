Return-Path: <linux-arm-msm+bounces-74326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F65B8D5F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F2616A438
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A1C2D130B;
	Sun, 21 Sep 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmrbgMz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F8299AB5
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438698; cv=none; b=l1tneIl98xzT83fBFeR5Qsp/qI7VD2WeaS3XJK4wgFzdkY03gnd+z37G9N+5yyvVKsHmgTtHa8qb/Nb/wzhMzJS57BE9h8c9Qzm1buyhsZBrt1H4H3/N3TePkt4wfQ0JO/Ksdwry4mjizg+Wxdb1ZhyjgBFapiGdSJYzSYJsz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438698; c=relaxed/simple;
	bh=gkMfNWX7UF1qoXPLmQBXGIhOGX2CqmoLfAcVoTTxvTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HC4A9seam8WyCFebzCBwmITRV/lwdviBhymdyC+zvmxc3q/iU75n3tlawrFO9vLj0pawBEEKSfG0UBYP0mbZqp04DKxZNQmayf+nPtKe2rYDPi6baF9+tPCHBbF2bbq8ykdFLiUUrRzQPw21ycPYeF4PBrr1EuxFvqILFlB5js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmrbgMz5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L5vnFs022894
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjSUqNHOwcOgxyTiutAx2CcM6pFy+KzH69E/2l64SVU=; b=dmrbgMz504vy3ARa
	p7+ySv9FffxK6p3vyWL5nYHaMrMF9AUeBJ/8laa6UIEMxcndOTwpBKm2S/0jSiwX
	1BzvSrkT11d+xCOLhxbOHoPY2XMw6Fh4raNFmcamNEu4r2xYzjDSLiWcxBoj572r
	lGeFUZD51yZRFs1QkbuY7m5GsLPdpMbLQZpmpMeSLyW0UHBRoyQ+F7eSCedUepfq
	ccX0HV4py5+dvHxBGrdk3O3R3KWS4cwWtcE+auTVyvDfS8AWwCnkOq9mV+oARBId
	gmxm1hlWedUNJx4Krw94cm7vDGkAyjQ9wPdYWkmr0j5HJva2nJCcBznQ5fytA8dh
	FofNBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499neksnw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5d5cc0f25so60276381cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438694; x=1759043494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjSUqNHOwcOgxyTiutAx2CcM6pFy+KzH69E/2l64SVU=;
        b=nAtLY28dr0PLJ03T81OUlVQV2z+E8I49U9POzUFdDCg8k/97NW29iyAn003o+K7Esz
         2LPwd+zwnO9o+elM1T7NzXO/tufBQZMMne2LMiFrnzh2D8G9V+ngKrrCJJxNOpGWcP3+
         /qMQcUJ/uN9ZjhKbTX+bgPPLBWJyf7qMu7Q+OgR+mwIauAb8XqXhW6shfDaFU5m7ZA8k
         TrHvyPm977j3r7XxUQaqcIKJf+L0mMnHfd8x9SHXpYgfsUuIjUnBmoYJRyg1k0y/N4sV
         579sEv1iIeWzbCx0bGthE0B5CSwJVycUUTD/hh0ZbqfeyDICaTYfM+snM5JF4KHo8NjT
         YGmg==
X-Gm-Message-State: AOJu0Yzytf2hTJZ1BkyQPBmfyueqPOUoZSms/11LBhlxXN9lOqzNlbCp
	brfxw26U0hyEVRvCTyliQ0vpWAaffHyS10mvudc84JmnnbF1CWZqmPXwOIUkWWQYfI/GzgyNc0w
	soGiFbgHL0qvCS5V4xcwhUbgZtjyRUD2Br/3fGynMZvxk6p42tG0Zoe8zm3et58IaIvVo
X-Gm-Gg: ASbGncvxyk0xsny9JIop0Yb639ILpvJVME2DCa74J8lex4orVAu7ndnyIBJdKqdVPn/
	WjWQ+U6bodMSQcXbRs5MPpv1WbrBEqNd/VOa9mJsyEhhQ5Coiq0jadQ59g9tD3tf/p3dXDz6moe
	O0FLTn7ynBpftr1xQLDpKsKgvyaIKhBzP9EpHoDsqxfO2govYieLtLAgaB079/nhAgFPtfwdELO
	tCcI4ed9lZDOBdJfQIVW+1eDlSbpWh+6ZZdMEpfAACip++tV0q6ozXOeNy6elZbHa/7GmZwVxOK
	lBWV0g6WB2fCQFF6JO8RcLWl222XtdR5FdKn6Q2duDXHWlGEMVDpSxhxYwxAdesTyMFWr5JmSmf
	zGLi06idvJq71Njbqyyg/7aztHB/lmQ80c5+KnCbPB3mYtc40FN0Y
X-Received: by 2002:a05:622a:1ccc:b0:4b7:89b8:d09c with SMTP id d75a77b69052e-4c0755a3fd2mr90590471cf.74.1758438694360;
        Sun, 21 Sep 2025 00:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo+1aQxqQMBxF96A7LIXaDR0BfbSj6EHV9y/IvDyLt7koCg02jKaYp+23rpZ76kP5uPfRFbg==
X-Received: by 2002:a05:622a:1ccc:b0:4b7:89b8:d09c with SMTP id d75a77b69052e-4c0755a3fd2mr90590351cf.74.1758438693861;
        Sun, 21 Sep 2025 00:11:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 10:09:17 +0300
Subject: [PATCH 01/14] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: document more platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-refgen-v1-1-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gkMfNWX7UF1qoXPLmQBXGIhOGX2CqmoLfAcVoTTxvTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6UgL0gkepLUc10qUCM/pJa7MkVq0ADnvx594
 VmJ24wYFTyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIAAKCRCLPIo+Aiko
 1fBJB/4hVPU4rixEFPDWJrldp2b6LfQlU82ZVppkwMnrRpfqXuLbdCuh9nmgiQeFylM40Hepq8W
 1bFc1YmSRKWUPaGSBYHpIsBMX3GlDClYgMjW2jtnSwuLJyztlzG7no/CrSbH4V6DuEm8V2yMu5F
 f3YLtWWgdq8u3vEe+JAZim4isqF3OqrpYr2xsgCFs2Evxa1czaP1G/xc9a2cp7cRNvZxrHJ02KT
 9qCVoskArsg05BvEwfD/If8NHIMA5v1yZBOy9p1zRRgPqVeabA4TEbX0lmRli+lnG0s4bHK4E1g
 kaq2sRqxYYcgZLctnCaCOf8LTLfu/V84ZjClIaRnOF+NlndK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Z3sg49cO4mZB7q8IxtIe04TFRrzHYbVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX2PqgsJOUVgDh
 IC1PqLk3QvrwVV8aEqBIQWwgvm4Skuuvfw3hEMod+rI9g5PwbuoGy/1WjKwY4rpt2MGJYcX+weD
 Ha81GUg9NE5Bc/elXjpNXQ/kGmLUlatPJxUlFTkQLYHhqdRyV3BgKlgXgetKTs8NcV2eZsvkYF/
 9IMQjOOeGS3Bue/QVLMalY0sRsFF+BTw6baB8wzXd2/B5cgk8eOx8G1mNi9tBjDI414+LzUou7L
 ZisuvJ0/3RkwzVSvKnQf2dplyOCF1Ig260uCNKH/DSFRX9zQNN6ToqQ7POVBbS1vlwHh9fLXHq5
 jZVNzwDXPdCsMD1PVJq5WCt3hu8rUMFgEsGS9OT9A1AF1Kg3qiUJicso9dgHH20nCbK1YGjAZ2C
 z4gV10yP
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68cfa528 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Z0kpv9XV0UCBN2vuPzcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Z3sg49cO4mZB7q8IxtIe04TFRrzHYbVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041

Document refgen block being present on SDM670, Lemans and QCS8300
platforms. It should be used to provide reference voltage to DSI
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index f02f97d4fdd215f3c83f851a5c5713488051e58d..40f9223d4c27219222a1036dece3b53ce0334a1e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -23,11 +23,14 @@ properties:
           - enum:
               - qcom,sc7180-refgen-regulator
               - qcom,sc8180x-refgen-regulator
+              - qcom,sdm670-refgen-regulator
               - qcom,sm8150-refgen-regulator
           - const: qcom,sdm845-refgen-regulator
 
       - items:
           - enum:
+              - qcom,qcs8300-refgen-regulator
+              - qcom,sa8775p-refgen-regulator
               - qcom,sc7280-refgen-regulator
               - qcom,sc8280xp-refgen-regulator
               - qcom,sm6350-refgen-regulator

-- 
2.47.3



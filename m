Return-Path: <linux-arm-msm+bounces-84871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4305CB1FE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 256273007CB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760B1311946;
	Wed, 10 Dec 2025 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdRn42fU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quf3zBfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B52FE07E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765345026; cv=none; b=ATwDsruTsJZKOHtKw5N57Wrj4JNH0TXhP5KbqojKf8SXneeXdpU7yL5lXKe0xLR6jhBmMhXE4C3R1v/xbvHP6e0fKLrDshQWxf/MTgLhtimJcvlF9GuiV6sh+l5dxPAb4oNPDmL2DcetVLES3DtmHnKyRuhQlnlIYmxOHaNyfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765345026; c=relaxed/simple;
	bh=R8JJI1uhI2Edwanp1ewalbZvS1L13isuANI/iPqDxC4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IIgBTMbOsgpV7TLkQDLU+Dn4bwCa7Fh1UHbsHCDQonUC2xwJXmtXx2Uf5koPfOnd1HIULogGetHFP0ZgGBTe+xg5jn1nVZKxLeMrC8FonsQLzod3/WNrj97cgWbSfWospGI2UlIhbdvLvm7cqpUvFepl6ETy6tr/rrkdpLVpGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdRn42fU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quf3zBfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LGAm1747623
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ibfkhNF/zpRSmEHttN8oCo
	7tXr72ThLSi97dbWXxxgc=; b=GdRn42fU0p1ZMWzfNPTIiMGHXbTsAB0DNJEy6t
	JpUZAtyQFuaXFki0D9gT2pELii37DCPEMlxzESj3+UD+qIKiFizEg3dvplUbs9Pt
	2NhEitd/2TqGLZqMgCqsa1yollxO3t5+zRYtJJ+Z9LByzJi4VXRdv6sKIn9A7eK7
	k4W/0Co+o+TO46VRkavOnO24lkyKEz2O0rHpNxrvRaI8AFC7pSida+Ouax9ko7vV
	XnH6ZSfDoPjZsrXasMvVd3wYvnkoYnW9F2I2P0/Dyh4UfIO0osn1vbLPBqlDVb8g
	5nk/lPJCVq3/+zVnDOL4blsqEjZinjtx05VdMCNUDcDPgVPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm69aaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:36:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e1cf9aedso130386665ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 21:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765345014; x=1765949814; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibfkhNF/zpRSmEHttN8oCo7tXr72ThLSi97dbWXxxgc=;
        b=Quf3zBfJF+jKm7rJMs1LsyUBVOjraOmDWboU7Gve3W5yOFKLfU1yHwKRTJN372Bc6L
         JQw8VwmNZU4AQiNklnMbwPRtsZ5ya3Vr0yunVD/8hFR6wsS8TAz5DreuGl+Bx2xGtp4d
         xKkg9DPUBa5x67Ug7q9JtGHXlN15LksWyTJrsOdx7/b2jqtFu/6ISfcFD3iqIkuEIp5O
         u+MyLiTN4yg9D6dU4VQSW5bEwCZFWjErxCirUOMniVnNAb9yETc89jROggfBodT+JVud
         mcuVeMZSMe8gB36q+oUyWBXUIz9obtb3FmYWiH4LP6V9WFwR6kILzFLEpxtsKc1i9jOg
         H8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765345014; x=1765949814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibfkhNF/zpRSmEHttN8oCo7tXr72ThLSi97dbWXxxgc=;
        b=EuhU5UBjuAK6/TykkeD79ceeWESt46lEXgSkmWxgqdLJJyo6ODlz74QepI5pGNlhS2
         8LV8Uf0GX6SobW9ufNTqZz22LKMi8W7ye7tjl0GwaNLba/LpmBSdupdimo6TbohdN440
         jUEeDisnF+wxnR9+28QTbgZIisTLVLhlN0cjSy8/LeIf9A/O9jeG4DPOOJXUybfHLTFh
         b1stfC6KeE1S2GCzrujHVFxe8xn5Z/gLien6DI3vinHk2iv1sGARaI22I4bfM53hX8jW
         tBEaJgkmIx65Yh/F48mXn0zH7saYQAg3uZ+Sd42XZ6du0BrOvyDc3oSKYZTFgT0mHfb8
         iwZw==
X-Gm-Message-State: AOJu0Yy84uBfU5peESQg886LBaTaI1JmATvpKeamZBsyI38n+66lpM/M
	JCwkuTKQ0+pxi56X2A718Fo0jEEorKJUg2/oxk3aO8HLmX18Pga4OrwsdwmMUxE0M79Bq0XYDPX
	5jl6iwoAzV2wXrKQBOzVkC+KnVic5OnWCEtpC19nm/EfqyT0eZGoR5r8UzEshRpYbfg2TIk7RL5
	MO
X-Gm-Gg: AY/fxX6CZuVKEqYnkQb5ZGcgY0bPwhTjKyifM0yrnRJi4G+orm9WSpsxwtAuTwpFxGJ
	76Lyi2PIUsQaGirzjqjbO3ofPEDvjkYGGBvjwXD3/HwSi8nmJBPYUjKiv+HGJBKRIBKpCCHUW5H
	ZI8FEONU3n5IyGDwesVtbAaNN9otS/1FH+sQkKnU9w02wJIM6RM9SEP3BNWLPSEeYzGHM/9kMyi
	2jKbnQ+yhoU/58Kr7HScq1J4lqGacwQp4bW4fcxwK2phQumarjRnI3czEZwyresrEilotzlpysq
	n4dgxI+2yFqe+Jr5Ab8V85cQw66mOMpVNhAxZi6qhEoYOyGAcCvj+1U34pH8nULwI5GMgQ5siAw
	HBVFw/DKID7D+SIqlNLVyhDi9tb/3CFiJzUQ=
X-Received: by 2002:a17:903:234b:b0:297:f2d6:17b2 with SMTP id d9443c01a7336-29ec2d72558mr13340055ad.40.1765345014402;
        Tue, 09 Dec 2025 21:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXU+PltquEyljo/qA39WFFxpHajJJMi0yn7q6iLEIKFJ9nPIoX/zTkHZkwWtgh5wyo50VEvg==
X-Received: by 2002:a17:903:234b:b0:297:f2d6:17b2 with SMTP id d9443c01a7336-29ec2d72558mr13339745ad.40.1765345013905;
        Tue, 09 Dec 2025 21:36:53 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4a13d2sm169256555ad.9.2025.12.09.21.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:36:53 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add TRNG node for x1e80100 SoC
Date: Wed, 10 Dec 2025 11:06:33 +0530
Message-Id: <20251210-trng_dt_binding_x1e80100-v2-0-f678c6a44083@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEGOWkC/42NUQqDMBBEryL73Ug2TdH2q/coIlE3ulATm1ixi
 Hdv6gn6M8wbmJkNIgWmCLdsg0ALR/YugTpl0A7G9SS4SwxKqgui0mIOrq+7uW7YdZzsilRKlFJ
 cNbVoyzNq1UCqT4Esr8f0o0o8cJx9+BxPC/7SP0YXFFI0mow10qIsiruPMX+9zbP145gngWrf9
 y+dFHb6xwAAAA==
X-Change-ID: 20251124-trng_dt_binding_x1e80100-94ec1f83142b
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765345008; l=777;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=R8JJI1uhI2Edwanp1ewalbZvS1L13isuANI/iPqDxC4=;
 b=7PZVWm8eRMuc8eK9CUREin9E2yxPy2s2IbkGA4IyjqDKPm9GI1vbZaoijUKeOrzN/QzzKB+GV
 DkDsH1ZoSuyBPlETdtf8KxL4aTWhVhC47to+1o7vsVXtQtRYXXiGmKe
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: cjAWHtfL7f7eGDmEeWTSP9T57Gnl0OKN
X-Proofpoint-ORIG-GUID: cjAWHtfL7f7eGDmEeWTSP9T57Gnl0OKN
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=693906f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6ZNt1lSE2E78l_tYFJ4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA0NiBTYWx0ZWRfX9xiILY2PjHrK
 g91PKq4PWzfZUQpuUh5hKFvwX+apNpPx2SDbrqyfXQH3lAeGDDuWm47POokfqjoAaB19Elz+nED
 xM11Dxc5HrEbkQeV0cpuYGP2+WJ3Hd2TW0c9I7Nyd+IDwLqfOzYx+UXsInsZgMJBkZpmyA/WSBP
 M6pkJqXyoRlgJtPd0A6SaQ+H5K0+tltrEIBAx7E9H7beVY8i29YJCqc3Z+oPIEWivP6odlPLGCl
 Esl57lRSVCmKj1hrkgylSIb+g/AsGeXzKcOiDRm0yqnygAGtcRw6LpOJWploQ2nt13BY9IR3DNN
 q7O2tTyHP/Z3T+edFdas1fQpmBnrQqWzN/EyKAQcOnuxBk/49j5s35LC2Wh3uj8isvYGSBLj1xN
 x4+53FBzkHoECch7DV9DqNw4AIn6lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100046

Add device-tree nodes to enable TRNG for x1e80100 SoC

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Collected Tested-by and Reviewed-by tags.
- Link to v1: https://lore.kernel.org/r/20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com

---
Harshal Dev (2):
      dt-bindings: crypto: qcom,prng: document x1e80100
      arm64: dts: qcom: x1e80100: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                  | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: d13f3ac64efb868d09cb2726b1e84929afe90235
change-id: 20251124-trng_dt_binding_x1e80100-94ec1f83142b

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>



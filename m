Return-Path: <linux-arm-msm+bounces-74325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2734B8D5ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 09:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DD0189B021
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 07:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889372701C0;
	Sun, 21 Sep 2025 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmneTwd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26F9140E34
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438696; cv=none; b=S9J9NJ84oFQRcQvWTpnrrw65u8asorWpKyIlHz4DsKzW1knfLdgZBt+7JOtJfWoAQvDhptSK3iQnu/hOxnGb4WL0wT38HNLPJE+y+FV1uCZLS+xQNgRY7d4c4EzkFEG4iZ6UaRCs6AQ6+20CgWrYmdt/qDUthzOqY66wX8q7HmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438696; c=relaxed/simple;
	bh=qCBUZH6H2gcrsKaJFR1+rygBnZPeE1GPMLWvNkY/i+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YtouhdCRIzxTTNq9cD54e6Gh+2LPP8W0+rth3cBDHnSc3bP3S+NoQApKdh+5Shvje6SYBQJHYOhZqBf7a2OzOwESZP1mWHEGdrTytnhzA6hznCO8Caju7bql4aUoT87MZom7d21/Q4EPrzkL9zOACSGOV2sItOYqFHSEYctqjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmneTwd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L6T7xO030852
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=675tRa9BLzBeTvCVeI0XOe
	bRmK0iVzgJEs7KBylFXRQ=; b=LmneTwd3M91yPEiCecmzJtBCuFhsKqHM6jDqza
	L+ShO0odPvNOCmb9ErJqR2Vrbs26OjaNWXwAzk42TsA7MU8SbXW/Cz0nvAjC3BDt
	Fcu9tQt9AoMRqXCr6eRA4AFufZvhfoxxMQkWGKMHKgKErmR04lTCP90sRsenDYTy
	BdX+9UH/tA76tNYllEwBOlJUDjWY4CWtzqtCYowR8ATEg9EjmtVZRl0LI4ryqS1k
	rITvqH3EmeSGxHCpHEaFvN/gqTqz7rXfPRCKS/miQD6WRBELTPEoPomHbA55Q5UQ
	q/oPKRtPewlatnd8Mc0L0iW3CeaycIrsH0VS9A3gUgEK40dA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f9qwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 07:11:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b4980c96c3so127287261cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 00:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758438693; x=1759043493;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=675tRa9BLzBeTvCVeI0XOebRmK0iVzgJEs7KBylFXRQ=;
        b=G94fwFhnJY9MOeZADG89Vd7Q4GT3JHQ7LakSzIp9zKzp/sBllARQqhRJe2gPbCl15S
         YXvDER3rfzI9S3Sqr9zBRFAYlQp0LBFZGv36jRGBO9L3pqRHs8NdioW3RaaddRSjJgv8
         SSV+XxdgE5N+ADoBG1Jj1PKcGx3rjyTH8GsoFQZKFzPlU4A5a4AqkYE7BXReOwMWheYL
         4YBmAVRQwosLIcs3eomspt7czyuSeB1x8H4hGCMQeHLfOzAPpBBO6mlOFgzWpmsbkpBK
         qjr1+aylb3lbBcW8kqGHJrN/0ILmfDY9hJFyTc0zaFaTky+btK4KR9cEymbsOu0jCv30
         Fw7Q==
X-Gm-Message-State: AOJu0Yz81TcvQeN0VlN150veK2lwqnwH5JfiZabZPjQODnrNlAd9wnCf
	s2afb2O6L4Te/r8njTVfbCrcIOqeKWnqxzEHnuzP19XC1NWIIQ1GSwlRjkl3p2+7z2VfH5w6L5a
	J65ALBI1f+o6r78VNUpm5O9YUssRsM2lSO92EXvxqZIK/sICzPzadb+rILUw8E6VRGyll
X-Gm-Gg: ASbGncvw/QblcM1e8UYvXLDy0b6ZsGncbSlgDxsucsOm16yiyQH5zkX3/z53mUhJtDG
	qeYxKcARfmqVYUPngBLahYX7+UwQtIn138ik7e6TjHPSXhVnDn9q2wIP4kig63GKq78kflo5JIc
	uCZdLP7n3okWCbnnztXPwsv9Ih7Yv9rG4c1lqoBNBexqtCLF3Ass4AM03p/8dzussccrmv3PAOa
	R0Szcv+3hWHcWQTyDscW9siAMGWR3iZnM4yuefrnUhraPpC6aIAfXZHO23gDQ4FIr0zodhKSj4F
	Hz0GhjxftfAzteqVqK9i4B/Dqodo6ulys4mHWnl2rAyn3M+bKaGUnwBXnhvvty6G212am/0xuGq
	gCAEh/3tvWe89t+SZF3PYQRgnaNby2MqOwZxE3rzVzo2uUK6IFh7B
X-Received: by 2002:a05:622a:5c93:b0:4b6:2ca5:2035 with SMTP id d75a77b69052e-4c07416be64mr110892711cf.81.1758438692662;
        Sun, 21 Sep 2025 00:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6a/nr7VJ5660O8pA5uGtxJd95HVUds2QIGHx6/8ri+YcRxb/26sTse9rVPDU8C2VnT/uCww==
X-Received: by 2002:a05:622a:5c93:b0:4b6:2ca5:2035 with SMTP id d75a77b69052e-4c07416be64mr110892471cf.81.1758438692257;
        Sun, 21 Sep 2025 00:11:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e06875c2csm144031e87.4.2025.09.21.00.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 00:11:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/14] arm64: dts: qcom: add refgen regulators where
 applicable
Date: Sun, 21 Sep 2025 10:09:16 +0300
Message-Id: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ2kz2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMD3aLUtPTUPF1LC8MUAyPzNJNkc1MloOICoHhmBdig6NjaWgCoDWN
 yWAAAAA==
X-Change-ID: 20250920-refgen-981d027f4c75
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qCBUZH6H2gcrsKaJFR1+rygBnZPeE1GPMLWvNkY/i+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoz6Ugg6uQb3dQUMhj7mY9NTbD+ccrO5lCRouqT
 lQkZHHdlNaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaM+lIAAKCRCLPIo+Aiko
 1Q0QCACbQOwQac8SR8RN18wAZAPDfujqsWIbvKwhvgsAeAJ4+LDpyZImczUTVHBDTCyovVUVYA3
 yq6gp7lwp7NpTlR+uhUWkLf2P7srIW19/+w7jc112Tl2IhMlerwhX6d+htFu0MHvKhcevsy9Cfs
 JV+/OHUZTHcso0Y2QBsrhFmG73h3o719rdWaYtDceZZB4ZsBdzSgJbpFTQZ9Z3nn9k5ZQL3muf7
 za8uKKnzabY8T1K/7PzB/zEeK2RawLTuDhigmBGMRD4T9UctJE98xjTA+Mlhe/Bf5C8LsEEN0MQ
 sJIIaiWtuvbKIZ59vu/u/DWd2HMpQ0XrTSUrhM4+CHuACH8k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aU8-xqvI1TpOAzF0gxZpwryJ1UIRyPHy
X-Proofpoint-GUID: aU8-xqvI1TpOAzF0gxZpwryJ1UIRyPHy
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cfa526 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qtLNUSdA59iILLCgdDoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX8VXIPMt/IpQp
 HEZXJd1Ngyfrl9kUtQHc27kh+PAvrG3noh70cGzp2N+dyBGM3ehdQxbDoG2QCpaCb+DcCNkzfH4
 a25KRgwxrVsBbiyEypuPku3fzrSjhWCR0vX7YH2cU34wON7BCwk4iubRtenebZW1HUKayUl5YCO
 8MYxYwMxBqGOPk7bjYg2jbmz+AcvBgRSmeixVO2l6FUHUtXSYDyXEXJ9QbZkwKwFyhVtKmEdojz
 5Xn3jQ/cKKXPb3ZpJgmyeY1HLmWTEkLCpVNY07pQTsI83MXpb3NZ5ZqR0YJ0DqwdvvTad0/TCCt
 SUjqnVmCgBxbCtNwi1XA3xT1LUEavqs4VCfb7CL1xWRf/r7P7qKav6fIEp0UFNOpfezcbQzy6K/
 3ZAHnzOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On several Qualcomm platforms the DSI internally is using the refgen
regulator. Document the regulator for the SDM670, Lemans and QCS8300
platforms. Add corresponding device nodes and link them as a supply to
the DSI node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (14):
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: document more platforms
      arm64: dts: qcom: lemans: move USB PHYs to a proper place
      arm64: dts: qcom: lemans: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7180: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc7280: add refgen regulator and use it for DSI
      arm64: dts: qcom: sc8180x: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm670: add refgen regulator and use it for DSI
      arm64: dts: qcom: sdm845: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm6350: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8150: add refgen regulator and use it for DSI
      arm64: dts: qcom: sm8250: add refgen regulator and use it for DSI
      arm64: dts: qcom: qcs8300: add refgen regulator
      arm64: dts: qcom: sc8280xp: add refgen regulator
      arm64: dts: qcom: sm6375: add refgen regulator

 .../regulator/qcom,sdm845-refgen-regulator.yaml    |   3 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 110 +++++++++++----------
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |   6 ++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   8 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   8 ++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  10 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   6 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  10 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   8 ++
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   6 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  10 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   9 ++
 13 files changed, 153 insertions(+), 50 deletions(-)
---
base-commit: e5a7b3109c05f8aae05357fdcdaa3cfeaa99d241
change-id: 20250920-refgen-981d027f4c75

Best regards,
-- 
With best wishes
Dmitry



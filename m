Return-Path: <linux-arm-msm+bounces-71731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACBB41663
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B8D3B12BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74942D9EE3;
	Wed,  3 Sep 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6RYKfch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D861DE2A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884487; cv=none; b=EeEjaA3+apxrWVFoNHJI+5cd+px46ur3hNWIva+VvXGc3x+qvtRsHo66loc3eTJv91cS72OcOi+bFfxWnB3iwjNlc5aHF10+UsyPCuRIN9eTi8pHHltqW20ARLyVZtaXwQPDs0c9FJfDykxEhRAN22gicfYPvgVFHDW4/RfCwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884487; c=relaxed/simple;
	bh=6fI/WJTuZsCb2cLp6nf/qoDC3ZpL644kasrqqLhKtFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N/tJtng+4jJObh1LCMmChhpfKAPv51F70ut4gm65YfdFj5EgYBtAbOkM+bmQIxLfGH4s+K6vl5rG749NqudHj6C7lH51r7sZ5hUzF0bAhm1F6+6BmyvSPImQdal7Tg49pB9p+Ams+ZWYEajqKzHge0na4yPaQE0oX7OIIO/6fb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6RYKfch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58320Uar018439
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+15yZPomaBksv42IAkxQ9f
	a2CatBrRV9jiwHyfUj8Tg=; b=I6RYKfchNY3/GNhx5/p/k3KR/Jkk+l4UonKRVL
	UzYMkdGmMBf3c4xv3I0HyI+NBhNW8hGHC7VjiEVCO3R9moQvRx8dhTSRyO12vNEt
	oAI/ldpq/KUOo5w7/Gi8p197fsg3E3dc3WMBpC/EaTYpd6+wq9fCcmUacOs4URA5
	CUOIJc503eDiH174N8TiEkX7xPaCojW1useDTAG8VvUgsNQYhjjG4BCk1jr2x8pa
	QoxGGKngag3l7AJl9XlnGK10N7+T1ttMGgrzqtgea3uOrGFbuUFB7vDrxFGwkiy6
	+5YYjVZu2vrDmbyZmlWqfJHoXxEvheZLeKeUZB9DPpJb55rQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwcbeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:28:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7723aca1cbcso3637313b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884485; x=1757489285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+15yZPomaBksv42IAkxQ9fa2CatBrRV9jiwHyfUj8Tg=;
        b=u/ASXAx/CiDz1mmBYEoZTkCfD1p7WfOSajBRl8az1vWBQgzZU1CdKH5sH3Z9mNvFGH
         osj9qhROFhtyzl3nPZ2YFjpvNRNoCrlhkr3GypT8HgSGD09d8CuJzxL8anx7KKT68rmc
         wdx7mvuYjD1Pxg5/kHtw9jkY7ZEizGpQP+RgiKLVBgCF5rLdZkAShpUPCqFgnm/2UBzG
         FlOsL2gXst3hRLz/JylsUHF9mp54tFWxi/th/QxCfSso5Zogsw+Tfbm46tZuBG2txYZA
         6lDiSpKsYkV10yYzIlttsYJxJ9CBNLmhTZi+9TgVAwGGCfnKaT+o4UGfvLKqdlCiUdEI
         5zMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzBLZCvz9QEdFNWiSp2RDbx7z4yegg9e0v5WDwEkhfLu7PFTdjZTL2kyZi4jpPJR0iO0H6lJlw5zD8MKe/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jNzlmTRdIyvORx1gXl3KArlULlRFuOWI1PdPOykV7C6B9dYw
	CClTlbw/XQ+E9dZWoxqMtQDLRSLVkmSAuk8ltndyQjsufTOC3iTuXuA+trgc2phA71AR1k1Awvf
	e0SXoL33mORMFXCyJf0FsOnX8sULTz6uKCf9LSOZt6liQYT7+WDXQr+HdbwXsegulP92M
X-Gm-Gg: ASbGnctKiTeirknFMfVJqM9s5n1bEj0YTZxOEMBN86FdWh7mCCTI+4RtnVDDvPD8w2S
	MRNRf6ic8iRebFOBonE8AP11k6pfvDq4NLCUOUJ7kwGXeZypVvoqfj9NgUSQI2o0Z1KQvmYo9R3
	9KrLrVxvPjrJVEE2qnYUxUD2fkjQ0rkAMUGAw0myx2RcyUsVR7JcSc7Qb35glI3CZ8H6f6Fz0Gv
	Vm958TQlAEYqyMCoR4urDA9B6LZjUEPOC7i+2HLDeYkTKCYicGF7Q/znOzGkaKStooAuPMbG2oA
	/E9bNXvlK92cTsfs7qkSIGfIUcccUbZhap130/vh/S4MtcOKAoPTfV9Y+jRbgO6X
X-Received: by 2002:a05:6a00:1397:b0:772:63ba:13b with SMTP id d2e1a72fcca58-77263ba0301mr7810076b3a.30.1756884484576;
        Wed, 03 Sep 2025 00:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtxRna/ty1FLHHxCQp+iEO3YPtJlZlb1qB9RHAaV+Ypt95ibIKnz9HKgvwkHVMTLUVLg9SEA==
X-Received: by 2002:a05:6a00:1397:b0:772:63ba:13b with SMTP id d2e1a72fcca58-77263ba0301mr7810038b3a.30.1756884483992;
        Wed, 03 Sep 2025 00:28:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b65a2sm15833787b3a.34.2025.09.03.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:28:03 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support for Display clock controllers for
 Glymur SoC
Date: Wed, 03 Sep 2025 12:57:53 +0530
Message-Id: <20250903-glymur-disp-clock-controllers-v2-0-af174559aff5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPntt2gC/42PTW7DIBSEr2KxLhHgH7BXuUeVBTweMaptHMBWo
 8h3L3Eu0M1IM4tvZl4kYfSYyFC9SMTdJx+WYsRXRWDUyx2pt8UTwUTLlOjpfXrOW6TWp5XCFOC
 HQlhyDNOEMdGWOSmUUtJoJIWxRnT+9+R/3z4+4mMrNfkTklVnGEvJUDmupNCKIzPWqd4IFF3dS
 6vQdBY4oETUwE+u0QlL8Tz7PFTMNdDXTqJRHdegTVtLa7BvmoYrLrWQrCTGkfeC0acc4vM8vPN
 zwj+/7ZwyygA7p41VtYRrSOny2PT0HnIpQm7HcfwBdJrskFMBAAA=
X-Change-ID: 20250829-glymur-disp-clock-controllers-50f728887bae
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX13gXBj568Boa
 /+y5WJoZPRjHDYlQnQCa/BJ/Acls9G0yKKsQ7DB1x1fgIAMBJwxIWU/x1k+K+nddfJLm6FMiXrf
 cwWzsa28A1I/8NrDv6tc3n5V/WRKs8LNryY/ApOPjLKXTpYMQStMROzVZPcWKhy/MyD3o7owAVJ
 GOpVqeF8oXpkyDRzb2J5ySxFXvK4prJe5DeBh3SRbt2ZgQQltQ/VpyEqHl+mXQyIfwz721aOSPz
 XSqI2pWY1eeXNzvvahHdiCo87pJFRmFA084MkGwyWOKwxSudWkULOxcT+fxFhTbRabSxowS9PGX
 4NnUqX6ez0uHD4FaD7d5ca5KZhmnO4DIZBcO6BmOPUntqzoCVzzIsC5ZlhkPf6iRjFGmsUTYm8G
 0FEfmfM3
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b7ee05 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IpJZQVW2AAAA:8 a=COk6AnOGAAAA:8 a=scdhUXZAs6pzPA43rBwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=IawgGOuG5U0WyFbmm1f5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cZDbVJYVAUWCTHDArRCB4I_F8tucu72v
X-Proofpoint-ORIG-GUID: cZDbVJYVAUWCTHDArRCB4I_F8tucu72v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

Introduce the support for Display clock controller(DISPCC) for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

This series has a dependency on the GCC clock controller series posted
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com/

Compilation of the series is dependent on which has been added as
dependency.
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-5-01b8c8681bcd@oss.qualcomm.com/

Changes in v2:
- Remove the <dt-bindings/clock/qcom,glymur-dispcc.h> header include in
  the dt-bindings.
- Add RB-by tag from Krzysztof and Dmitry
- Link to v1: https://lore.kernel.org/r/20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Taniya Das (2):
      dt-bindings: clock: Add DISPCC and reset controller for GLYMUR SoC
      clk: qcom: dispcc-glymur: Add support for Display Clock Controller

 .../bindings/clock/qcom,glymur-dispcc.yaml         |   98 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-glymur.c                   | 1982 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-dispcc.h     |  114 ++
 5 files changed, 2205 insertions(+)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250829-glymur-disp-clock-controllers-50f728887bae
prerequisite-patch-id: f1872a81e0bdf89b2e26397d8eb6dc1ce7eeac1e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>



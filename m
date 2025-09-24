Return-Path: <linux-arm-msm+bounces-74788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E87B9CB9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8FA51B27482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E0F286D60;
	Wed, 24 Sep 2025 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYGsU6/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0126F2BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758218; cv=none; b=dkgPcNA2M7Z6+jkto1t/LCtEE9yFqrnqDCldzj2wkreP5NNfWPvXuifP59b395XSb3Mq8ZSPYchrA4Sm8YBU5F2Cj3VvBL2SBqwLr3sjlipZYzzcfGmZgIbtZQ+ZJ0U9adg1aOGtdRTSBFVYxGbCORbljtmdbOv0kVou/mQWP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758218; c=relaxed/simple;
	bh=zuun76wqTxfr0E9KMvOfXXE9WAPE5crgdVIf0Pmi2yA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uMiUOoLwtwj2Q6jHeObzRe3XfUlWe7XSOkV1cX7KZEimIMHd6HfLHdeBVRhuJnDfTdA7Gnaq8gsmsAHR7qBmQvh6O0mf/3Wzy54wMg8jyULuLTkwy6J6zzhy20GpIpOeJI+zr+5F0bS6gY6v68NB+JXsuh2FFWlGd1TUAj5auI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYGsU6/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONanaq027774
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0HNP1gFppPHSf0xqi+qP+S
	k49znPKJdoy6R6/U+ZjdY=; b=VYGsU6/HFqzRsGWtkNv/AU8zPPvoBJdwgerQmD
	k+6h/w6Dg5vjO0QocRdME6RB8oq7dt0nOu2jkihi5eKUExqdInu40wwqrOmnU/Hr
	GcJpfRo4FNSOC2KH3L51FE+ObsWE0qK9qlefKWjr4VRQ3zmB+bO+rrBfqelJOZuC
	VECkrAtMzT9cXrjSW/522DF8N4VV6G9fjC5pxwS2pI+JL8OyyscMmgwVKc4338Y3
	OOHUt9Tm86wd7kY9zekn1NEICcG3fMdXk1MkbYb2hKxXQ/tynhnXIIw9xUDvtpPm
	V2eKaQcQPaEMf9Hx9uvkhCCq+ATaPZG9f/CJ/lZYfcboQuww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxerr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:56:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26985173d8eso5333285ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758214; x=1759363014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HNP1gFppPHSf0xqi+qP+Sk49znPKJdoy6R6/U+ZjdY=;
        b=Ks/tEB7NioLoRVql1gvPiFEDVu3uvqkLbQYdip4c9KXeYOV9/grHWibd/TQHJaCf7M
         JHNSPFCqnqMdLqAwmWuJdpzSOGaLoPXU9lLErYTIMt7aoGlXSSBeApLvCDFK7qDsu22w
         DO4VV7q8Ow+Rd2A0EorjU8G+qSvW68w4ccGROBDZ9KIDWMPnVvJ2W3xqsMyzuXQIHoc7
         cWuKzTkZn62leAwhTZ/bqJ9u8kAteCEu0E2A/SvjwSPwVxMABimQeXLqGAzppqn5QKQA
         aclFwCSg+62Uh4uCHfqK1oJ5r5kQnNWC0jXqRF/8vhb7W3z/avOolNoKMLrB5cyjNeUK
         42nw==
X-Gm-Message-State: AOJu0YyNWuVHDNyJ+cJtpyc4TWcGoQn5ZtT+bQwCh24yG620Kk8gEDyL
	fdIZ8RxIOmdaaycn/IJYZ35z+7yXYR/02yrlEsq1wmnLaBn7JzyV1cXhCdgIHAVKcR6K5UtZHYg
	cQopjbPd8J6673BG0FhCA/WLgnIlJvLsNH0iOOAbEQm00nyCdRtyUiZQxk978KSmc1i1L
X-Gm-Gg: ASbGncsS4YGjDTKH/jJKOH0Fk7nN5jhP0DfQGIs0TkXEePKudybaWMjJPiiLCl2k1mR
	UaDV5/OMAIbFbjGjOwOFdfXsAdBG8Gwr9iijtDQiDsepbKsCDOgRd8nOne90JdW3HGOBya9Ezii
	TPjmVA8RdH4nRjkEQKmnD/j3ItOLkAf7M07O/rBAkgG3y+eynpOnWrSwrIT4vaoP7k8vuuLkJ2b
	klruC11FJB5kKwkGTX+3sw+0PW0ugWM5sb1t0yaXvUgl6xwTNqVe9k1Jn1ty3sk5RxfRgTssUL8
	+GDf3xjtwOhO69PX2fbGldDuYy4bTTAhZ4P+0H5VgPguIRMjkYwBXhIP01BUrIWSYWng9Oomg/+
	kaMTlJNmaYQL2fAM=
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id d9443c01a7336-27ed49deb24mr18743295ad.20.1758758214108;
        Wed, 24 Sep 2025 16:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuXpQ87PpiUVqxhBpphiYJD8lJPb8xabQqGHfuiSSPYt/ISD0gfkaw01Z386R6Y3IXmgxA7Q==
X-Received: by 2002:a17:902:db01:b0:264:8a8d:92dd with SMTP id d9443c01a7336-27ed49deb24mr18742945ad.20.1758758213684;
        Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/9] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Wed, 24 Sep 2025 16:56:41 -0700
Message-Id: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqF1GgC/y2NQQ6DIBAAv2I4lwTXIOJXGg8LLJVY1IJtmhj/X
 lp7nGQys7NMKVBmfbWzRK+QwzIXqC8VsyPON+LBFWYgQApdd3yaVx6jvU9cewtKSQKPkhV/TeT
 D+9e6DoUNZuIm4WzHbyFi3ij9xUSPZ3ltp32qdokxbH2FBA6EKEPVOuh0Qxa9B+lM4xR5XWuBV
 piWDcfxAXEoDAzAAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=2526;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zuun76wqTxfr0E9KMvOfXXE9WAPE5crgdVIf0Pmi2yA=;
 b=htJ6K9g7jj5V9bOvCfCGRKnlr3PiOUcrSOdXlT5I0+7V9VD5wCueNm3RniYGdPvwohf1716Fo
 IAKl0lsQs40D9KXhUkLe7pO1vS81ndR/4Py/o8wjsJVE2UJqY/oWjA/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d48547 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0ZJa7YLzid_87pQeuMgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: xEhIXou_gQs318RyjfnEOO9bcnZnJjP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX6u/AK6CX34GI
 IsAYR3K05KCjn86TPMIe94P4scRjnbhTkkFGWWNJR7CBCNb5RYgEdu/p7Vjcpg/okooGLfRCmkK
 Nfads0vDmB29/8VTKJPVqbSZgl3YmjZYc5hAr+0rdf8GJS1LmyAczbuv2Pet2M2QZW9lA636u16
 Lf7B7ROz10Gf7vQ4Utyxn02zTFvEZLDx/TO3JrPOA0fwOGgqp5YGfiXlEgAqR3QfKW5NCFU+4WY
 4ovfb0vVrgb45rAcoi8reJP6sxdqJh+J0yuA2iqlWlAe/hGMPv/42QIlksyS7DKzcChFosDVJH0
 yaKB1u810rLy51V+PGQGzyO31sX04yDhzgorAX4+CVCME1VGx3lc3Qg1/i/13XOYO6F/zlnUq4Z
 bMsukFWq
X-Proofpoint-GUID: xEhIXou_gQs318RyjfnEOO9bcnZnJjP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Add support for Display clock controller, Video, Camera and GPU
clock controller for the Qualcomm Kaanapali SoC.

dependency: https://lore.kernel.org/lkml/20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com/
context dependency: https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Taniya Das (9):
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: sm8450-camcc: Remove sc8280xp camcc to from sm8450 camcc
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      drivers: clk: qcom: Add support for GPUCC and GFXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   86 +
 drivers/clk/qcom/videocc-kaanapali.c               |  824 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 19 files changed, 6983 insertions(+), 2 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-mmclk-9fc2775e2fa5

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>



Return-Path: <linux-arm-msm+bounces-65471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA5B08D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C266189346C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225352D29D6;
	Thu, 17 Jul 2025 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJ8O4pKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB4299AA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756702; cv=none; b=Gfuy7uTzQzKjYDAa4al34IUrk5GI+QYqQnirhmhvH04oYDbJ5qNhLJ8R4KtrXRz9maBStK9SrD34qOoP90NYJqCZrcXBflhKMWoNEqAInmw9+AGxxhhNUlphZXk39usPyjPkDjruAIUHGi2IO74j0xZAPBDDiAEJyXP6TTj4caw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756702; c=relaxed/simple;
	bh=DdwJLuKrerPAD/bOKsi5kAehWwLx5N9tzB5HjmoKpZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPzbMRvvmMI6+moz5f5bgeT0tChSWho8OIrWvduk+dFwVg2Vr0acGFfWJcpbDQSqsyP6n8D+3ARKORTrEQQNgO/G8woUtJa7tviIVMohW8pyERRVg/YIGri/LSf7i4NTUjSTc8dSUjGE5V4MrfZkbwCZNqvp2//ONx69dyhn0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJ8O4pKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCQvRv008502
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0AhCHQgosqZFk1q4UdMdh5
	Rudz9F+/AXpD99Mvdy6rc=; b=UJ8O4pKx+1DV8iaVNwO7frYjxo+C12e15QREg+
	IhhW0binc9aDco5OPD+qrY6dfMTPxrAgRwmondVUqQnJ9U7kNArYE+npseSj/BgE
	fuu836swpOxxFB3LKYFeF1GYzGZM+xHJreQcpHkrrETG5Zsx33Z00V1tir4zhv6o
	NYAUdGaMHKNCq+7aGg/DNQzJXAWW8RLb+qHs4+MBNC8oblWby9BbJXMgGeW9qzOE
	LcV4cRm9fOGtWTvnRof3/ydL3hKGBvVZQP0XNpg0RiqeSoTmwaTBc1/nIIELbrmh
	KmF0L5eDFNlf0iM2srio7TnbU+PWZSlHApETWmNO6cF80MyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb7pba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:51:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dabc82916cso156086185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756699; x=1753361499;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AhCHQgosqZFk1q4UdMdh5Rudz9F+/AXpD99Mvdy6rc=;
        b=VmWbs/iMLbFpB/4qz9GA0kZigpG0XT7bh1UR52txv7tkmKHpll+0i/GepQxSh5mGJ9
         njftVHQdJIYN3aJ9UVWbewijDDYJUN/LWeqFjE/kVSXsqF63WrbLIzVrVnVUXneRMtvV
         bPlW5puP4qC68v7g3oo/ZOjS3kGrv8LjJ6LJwSGwkNmLdRKNwIXGKBUbtJoYSMp+30d1
         xaQ+hwUwvuwu4ctbpqkenkD7UqidHsFhnP48oXvOww1vmqRQ911wRzNCCOnuOum1ZTMc
         AiJfYdr5VXLJco4t1QMPR2yCuZp5XGkB8+EBc8WNtMXiw+C2bJjHrw9gPaHTGpHmWEYU
         6yxQ==
X-Gm-Message-State: AOJu0YyUsrFHedCkb1IeHT/F/7VwL12ocQ/Ll2dEIOZ1qZWsRiikK6qn
	ezZrP0j0oOJt2OG+tjA+N8D33w6JRRIiYEDaBA0/dil3BnF8Qv7CuW1phnNWrzIrjghjauPbz4q
	vVhYrAoFRxM8FtOOzbTINBCrLrhY3LovgxnURwyNP2XUROYF3GIfwJG79BFmtFf1FTpuZ
X-Gm-Gg: ASbGncvbmW8fNQjTTwgkEL4nA81WXWmSkKIMxR5M5gM4v0/pKHjC0PgFlXLAzEuzsGl
	ue9yIuH6oKF9LAJW+h8PA721u7DZUOcnakbcbe95LHsF51yv7qfPORG9YQq0YZDMXFIiCpV/Gcl
	7eWEnQs6/CkIeFvwrJTGwX1O57XIpeYh2tIzAqLtSmF6ZLMmueN8DUvTlNy83Ztlf9Izoe6RiI9
	CnJ8j7gMNE0rLBRnIEn65pDfB/Bsddap0DHb/tDsghOsL1evwSdlAw02iccH4zMz+unPk2It8OX
	SbTWVWaYlPlKD8dH/S6/f9cvDxfZBZ624Gy7GWmyge/T5mnuk8+RU+12sEu691D95K7nh6i2w6v
	GQ8AD0es6PNtfadYpFK3PYD9YgaBR5YMnxo7I8mzh+xVkhz4TFXSg
X-Received: by 2002:a05:620a:260d:b0:7db:94e6:4929 with SMTP id af79cd13be357-7e34356c191mr801483785a.20.1752756698620;
        Thu, 17 Jul 2025 05:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL6Hb/qS8x6qNCLIo0L64gSkpP+LI+tUdT8SD4T3yBb6xBXZmoLFGumykrtxt/EuBxxo2t8w==
X-Received: by 2002:a05:620a:260d:b0:7db:94e6:4929 with SMTP id af79cd13be357-7e34356c191mr801479985a.20.1752756698140;
        Thu, 17 Jul 2025 05:51:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d08fesm3032872e87.126.2025.07.17.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:51:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: sort out RPMhPD domain indices
Date: Thu, 17 Jul 2025 15:48:15 +0300
Message-Id: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/xeGgC/x2MQQqAMAzAviI9W9BBN/Er4mFznfagjg1EEP9u8
 RhI8kDlIlxhbB4ofEmV81Do2waWzR8ro0RlMJ2hzvUWk9xY8r7liD4IGr9QcEyDpQQa5cJq/MN
 pft8PgAnpjGAAAAA=
X-Change-ID: 20250716-fix-rpmhpd-abi-2ac5b7e5865f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DdwJLuKrerPAD/bOKsi5kAehWwLx5N9tzB5HjmoKpZw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoePHYVQfVlJdmnm2HJV6yPhAhSwgnCxmFoBkyb
 D43E4AEtYqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHjx2AAKCRCLPIo+Aiko
 1R4hB/0Wqddk7X5MyI9SNMfQJ0dGaiJIcwQVLjMbIZsqLGnmpGegJrSher3SJtZrz+IJEiztPOs
 ZmPNcVI92N0i2fLwK9D+5u5Vg88IFfChx1nE8GBOA5XaWMAq9Bcl9/Og/N1xPELXmD9rwZuGPOG
 5/q55A8GmUj/nhmj6M/tZ0uhXteRPDbzxli+PDHLgJ41M029LHpYKbtoxz62NXzzZV87wAPkIpu
 W4xXdB1rlkG1qlIbiKKlth0FiX5JPqu7L6uH9tvDSzQk7vi88uZI1YxD+4rC6SLyzUee41ozgbb
 X72JdhzNB3bPcGW+x03Pmc+LcZ3QTe3SdgmOWiM547FhX96+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: hDjExqnjIvZBnEEwLG1S-zffx3ADWmcl
X-Proofpoint-ORIG-GUID: hDjExqnjIvZBnEEwLG1S-zffx3ADWmcl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMyBTYWx0ZWRfXxqVcmIpzByiN
 2r+GsX1PWHNS0hbfsa7vagOvJfih0FnJ1eXWaCz2eFQKpvlBVL8U2FsQ/MpH8t8vsR18Q7PTv/f
 LV8Q7+b4fpWtWC0gu3oEhhq70HdA/xruqKBg8dOI0ZeYFNslJPgtEbHx8kU5eKt4pcvgyBfuwA+
 mgzw/16Y5whV1r+J2JdI/LrNkP20GbVAi+e9mimhGcBk1FGj2KWBl5ilq2UPacnEZlJz3OE/295
 8qj1ktMNgyGE5DCYdMHM6+17s4AeabWf34JdM3DjwyVsW641JaH0VLV8Y11rwIiibueVVtIVUtK
 oKxzC4sZfag0tFlu/sosvuki5bldOf4DOhsHBYgi1GAUxdeoWAbKoJltuPwbYEUqC6qggGY2Zpb
 2VC81gsLL7qKHW21vd9o8Ii6QmYhfjvbc1iqlCt1g2STQQ8lEUjNvl7ysaH7r+xMzfEKg/hs
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6878f1db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OKIKnLrJKT9BaQ3qb9sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=511
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170113

Several Qualcomm board DTs either use incorrect power domain indices or
use old defines for RPMhPD even though the platform should be using
RPMHPD_foo defines. Correct all those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      arm64: dts: qcom: sa8775p: fix RPMh power domain indices
      arm64: dts: qcom: sm8150: use correct PD for DisplayPort controller
      arm64: dts: qcom: sm8250: stop using SoC-specific genpd indices
      arm64: dts: qcom: sm8550: stop using SoC-specific genpd indices

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 25 ++++++++++-----------
 arch/arm64/boot/dts/qcom/sm8150.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 42 +++++++++++++++++------------------
 arch/arm64/boot/dts/qcom/sm8550.dtsi  |  2 +-
 4 files changed, 35 insertions(+), 36 deletions(-)
---
base-commit: 78a8f8d4ec2bf09266a03a0a8cb0af82da0766d5
change-id: 20250716-fix-rpmhpd-abi-2ac5b7e5865f

Best regards,
-- 
With best wishes
Dmitry



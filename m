Return-Path: <linux-arm-msm+bounces-84294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B100CA257D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 035FA305BFC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E89F27280A;
	Thu,  4 Dec 2025 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5urEgjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMDJ8GZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293087260A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823620; cv=none; b=RptqWfHSBkP9ElJ0VEALWPK+1hlq8KJ8L0sMeZFXpXY+BNtXU4q26ix3Dmja73MD0BAw1KAbPwX+3/RQucvxTsjkbMh7CstqSbGp8PANnQJSp5yhJdBaj3I/j0hEPF0D69d6jMeCfwY31ZFT4xbzj8Z/0fXB4WNQjfW/CtfPmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823620; c=relaxed/simple;
	bh=0GUSfiG3cvzFvtjoAnBmgDn1KbVZiMVpHPtFZWlUalc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lxrbtPlVzKV+kMLltIls0VBtUJQvEhh5CjIlldyquzg3xXhPeB0Z5fuT5OkA/LSdoXdOhpKvaYQVXSXPe2U/RjhLepLW7c/CWp8Q3Js6+G5Fa3q7b69X7mzvN4/qvmEGo8Lxl9qOY6TGYlqGTtlywdAzkybWDouIwxUKbjL9SQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5urEgjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMDJ8GZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3NojZc2626961
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fRASef2ssEdNjfEjozIetUr10fm7LhWC/Id
	/kXGp8Sc=; b=M5urEgjm/cPngHOMzRAcQZCRQi99xz8c2Px2D0cYQhKcKHJYX9P
	GWQF51jtKY+VjeE342xerr9Q1KPj/YSAMaxcbeWbpydrfzZ0888fxQP+aeJ6l6sF
	qshr0fMlZflt2BU6V7i6s7F81C5UpEaDqszdrwwJ+dMxTfUK6YbWfJ0DXruule8D
	A2XGHk6giKQ6v9deu5x5KDx51VLbp7xSWKjCx/0eZYWylIDyLTh8D+UL/lMjYQPE
	bHYYIumHDVrvJz1fL8IWP/GrBGnk1/a+kzVb5hmYEtLXqmLTAjkXSjzHfY440f+e
	PQ6xOPQwB2/t84bIt/kpKpAyigP7kZXeIeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm12aqjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:46:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29845b18d1aso9201835ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823617; x=1765428417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRASef2ssEdNjfEjozIetUr10fm7LhWC/Id/kXGp8Sc=;
        b=cMDJ8GZEFFWvyYTJ0np11FShd7xHYkwajUfVh5uXvBkvFsSXZreHMPCVy986ECcTd4
         BtG6H6HGFWsGD6pxxDzTehrpgNO1/6Pu+ceTY41uFR2ATmXa6Xcvw+78YeDulRG6p8hO
         tWBsnnvIg9OFOaSGWgFdwKVtfcFkZKTrs4Bg4I889ceU4fK1rxlq8EU9pJuzId+8kiOt
         KhkQQp6KMeWBbkWUWA0Hz7QnUdEA3qYeEkN1luvO6P9ZDQzGNm9fApQHSM2CR78sjsQA
         E1bot/cEho68ZoXd3umDoA+ccrYw0+4X8UN2JpJXNxc2mKzE6XW0J7Rh9OkHDVkyOVwN
         RGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823617; x=1765428417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRASef2ssEdNjfEjozIetUr10fm7LhWC/Id/kXGp8Sc=;
        b=Cwi0HWOebSrjJE+wNmSiZORV502J1kP4/TdhOCZ4LICxpH1wjjkajCdJjxZ1h5KpLZ
         X9KsA37RWPJa9A1roYh2OZPbuj3K3JMQ37BCr3Mijj7YJejBZB/DI/dD1Wgb/BKp3rgU
         FWKe2MjlWBwWK1Hcw09abjsd16lhXb1Ju+U7HIkdJzOLzMdubhgxw8Hpm0AqKvlzn5FV
         TYqbaELSpz2PBqAJeVPmmOTLScfqXit7e/HHpfEjzF6k62+gJl8i3+SQvboXTZ9LsIKi
         ubHDTMgqjpMPvr0lS4N0Q2g83BLNaWnf53EaPcfY0fMSYNxc3JKqorArZWKIB1oqX0hW
         DYKA==
X-Gm-Message-State: AOJu0YwOF0HXRBNuMiajmWT576xrAA2zC8F8MoEPA3Q38i818fNmGc2b
	+X7Yf5RfR2phX6MCTH2+oo6UraeAdXLwgde++34kU2t7mG0/7x7q4AEhbIFcH1BzDqLxZ6oVcPg
	yPdEJ/u6elp464ETgMx5yIw4FV/l8/qqVS92vFJwi/1coK5j+P3AW4/FDa7WmfEDcFKkZ
X-Gm-Gg: ASbGnctlK4Z0C/iGMDP/6X3iHWXuX/aDwBnTuEJ+uai9fGx5tPbtGnCbIRYgKcD6GA1
	xbgy2Z8YLeuJvYgjlvuBdotQ25jywlpymwpJW/cD9rKGNY+ebnAW2nsVFOdMt5MXb6yHek3Xwy9
	00hSU8C9kLY0uqUeQEsCh+sSEzdPSrC+WH9bNXzconZbo1W+ZRkLBpVcm8MbRSL3zbXid3mk7pJ
	N9nh6qqv+UovfZENvgefegTBVlKNzK91GwkAvzWiLipIeU/gj9byq3x5UIDhUFGpodlR9dyZJGG
	CaB1xIbrbrm+mamHbH/2hYD3wLIbRYa0D3xXg2gnLadWgFNrqGO8mCJ/EGGGYzOiaOZUHNBVtSc
	mY3WHOQBM7hWlpj6ByBMJDjzg+r931kP78tc2rMjkIVt0kTI=
X-Received: by 2002:a17:902:da48:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29d683454c9mr55254595ad.16.1764823616998;
        Wed, 03 Dec 2025 20:46:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUshjjSgC/IdoRAZPEirOCKbfhASGTUkq4M6XbT1En4gA+2D7+OJKrKrqsdWN3zSjhjoZYSQ==
X-Received: by 2002:a17:902:da48:b0:297:ddb6:ef81 with SMTP id d9443c01a7336-29d683454c9mr55254265ad.16.1764823616532;
        Wed, 03 Dec 2025 20:46:56 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm5217995ad.25.2025.12.03.20.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:46:55 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add eusb2 repeater squelch detect parameter override
Date: Thu,  4 Dec 2025 10:16:41 +0530
Message-Id: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNiBTYWx0ZWRfX4HguhVvTWSxN
 OelHJ+JcmuxxQb+KsRE/Bsed5osGLDeL/DulS0Y/zM9+58EqLCEN7ntrIQuWVE66yjaNWZabGEn
 r0cyLsEdo5kMqW5Uhg8XJCKwYBqcFBKfd/RVsDnIRGAxRU85bPfpU2JZAvQwtAAhNJyrSCMqhca
 tAIzuZ87ArInaDx/0ySF/s+3AzRAZGSPw47pVjyeDJ1WJwa6A8n73FneKQ8jwMbUGbDg7j5k5kH
 uu+lSkT4ZciTkAAqlsXGqY2VIAZhbG2dZ13Y/aRz2QVHvFKazqV6rzAHF6iz0aWpL2iDGI0fyB5
 aXldAWOR+QvLVGOIzTvpg1IlJo2Pz53LSLSjKynie6dtSwI61V+1hVj6aapafRIrIsc0RQ24RB2
 Ff+5GsXHaW9y7KL1wHZW+MWrMa0png==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69311242 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vgYOIwM3FMrG93tDnggA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qaRkbQSE5o1QFm4d07quE2Ax1HM2j-D2
X-Proofpoint-ORIG-GUID: qaRkbQSE5o1QFm4d07quE2Ax1HM2j-D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040036

Add support for eusb2 repeater squelch detect parameter override via DT.

Squelch detect parameter adjusts the voltage level for the threshold used
to detect valid high-speed data.

Changes in v2:
- Modified logic to write to squelch related register in driver code
- Added multipleOf property in bindings to reflect values can be multiple
  of 1000.

Link to v1:
https://lore.kernel.org/all/20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (3):
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
  phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param
    update
  arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters

 .../phy/qcom,snps-eusb2-repeater.yaml         |  8 +++++++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  4 ++++
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 22 +++++++++++++++++++
 3 files changed, 34 insertions(+)

-- 
2.34.1



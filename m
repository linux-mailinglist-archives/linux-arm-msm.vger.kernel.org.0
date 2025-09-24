Return-Path: <linux-arm-msm+bounces-74710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B200B9C78C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78C584E251F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A242C234B;
	Wed, 24 Sep 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO1djkn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED92C11DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755773; cv=none; b=UKtD19LdQospN0Rfz9BpeImww6bK223ArbbxZFbL/9erHNbFkf+02mr/x6njHvlTgB1jDyx8OQgCV2qVK/gp+7zJrM4ew2dnhHHJZdXGPSNy55PLZrClTtULDYmoAXBIRHDiO3alQ0QXrszhAuS2TlgNOSLKTwE263O7wxjg9cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755773; c=relaxed/simple;
	bh=ivlwUUQlmRNXZlh7F+6fYULgHiWE/9fkPiEhxumB3rQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t7mgq6ztG9q2wD43QLynG0CKxcsikZ+N4PXggKAALhb5DtoE+P764HzlWW84A4A4+KB6vVUoBMQ/yNurdmez4d4k7bGYSwTebIV2eCKJe3gc1154GMMNEDJdS+cpTw08P82Ree4uDFNR2EPOqTfYdWbDpMbDy7uCY2MnVtNQEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO1djkn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5E0I025079
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wTJiF4BIPwE/2c1eTUxFT0
	H6zXGwpZWLXUqTjd5z6pg=; b=UO1djkn538dFcbyhVvFC5DZEYy/t3S/yvEa+Ta
	nzEx+tVehw60gbo/6pRY6yt5vuFwHJRpmAxTuwCoqOwcRaMAhSeBZSqQTXs3OLBb
	VvOhtih9uqtaqT98375KmIrLEkr2CihZhsWhB1IIiaiqi1CO+7IR8o6wtoOgFOSy
	aVEunlcQqZYBoPb36fCEYuSSbn6vAYF0ctdq3JTYp/Vi4F0Udqi5h7k0k382pVnl
	DH8JCi+9slkSGnYl5A/WiqPKvA8vVukpIZdE6gPWoTiFsA2YxyG7i4fFNVFqTpUx
	VrFMVlbE6VF0Ba8LfR/Ip2k9QiOqsolzfFqTGXRlePO1OnMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexas5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77daad52913so270004b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755770; x=1759360570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTJiF4BIPwE/2c1eTUxFT0H6zXGwpZWLXUqTjd5z6pg=;
        b=VoUTYL1tc2j63ie6ZI4SBiENy4x7ZPE/vPVXBvWLIF5JmnBpneLnQwmPTkkFHl2n0B
         AaqEDOOmJCCNB1ev1a4v2ePTGPGl4E0radWPkhAaCK/QkL/OrkeJ0Qezy5sNr5BIKG2U
         CO7hkyJso+W1g3HRQgTfOn04LKzuDbyBuglnQs6Hist7xRLtZkVX/tqmXMCiVSqdPRb+
         8VzlNDNGF/0iuA6beUoowJ77JVHKr3i8CKmhKcWPlpAz8a8lQDytsCu1X91trq5cJjH/
         Ds5Y1//Hf3bxCaiEwmI1aCZrEckWoGHyAukstpnCimXCmXuQK6f2CR6Lds3puvxC8JVW
         VLUA==
X-Gm-Message-State: AOJu0YxWgIQVysMdjnG3npDVm2KXDZj4ltUsCLM7yCZwUbIRN0AhRnWd
	KZwszcOQBxPD7aEi3qHu6A7DWDBcoWRuBk1lY022pc9dKjbRx3mgVE1bIcOCczHbSh6WluDcbgh
	PsbzKftup8eo0orcPBK5AHAXN9hrRFU1n+SkcawbYVLUPrQNhInAt7yYCI15i/07StAts
X-Gm-Gg: ASbGncv/FgjO/6uI5b/mLrsKJ5L49kkrixSFkK2Gi63Mv+QPbBH1LyA8qcVH3f2SzU6
	7tGHBJo/ofPV2ey+O2e2/zzqmBal5u2jO5myNZLevABgcqXePrIqbkb4LEtfh0QUgt+vwVYffMo
	T+ML6SCsaadGZ6aJ47wcxaN5tKZYwDpE18DioKTRNRhvluTsA74uvVFBIsTusJTvsNwNjTouFSS
	qZWYK7u50Y4IgGNP+p47uTlzfYArJqW147AeU/kj5M8x+/J75WUdj5ISBv7ul/cITkjKGoIV5r8
	1x72l8VViS3UhVwyB6vIHx6ZHMG6l5n6QfOvVVYiP6++4PDoziMgUojHtfVyElqWBdwp4xC3AVD
	tFVgnUyISctB2vj8=
X-Received: by 2002:a05:6a00:3917:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-780fcdc7f7amr1729492b3a.6.1758755770091;
        Wed, 24 Sep 2025 16:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+6K/1ZFPyR/zAwkK0azv8gcDU7cAcbMQSe3Bc31YPHGam1kxpHhJxChPuGrl7oC0rfnontw==
X-Received: by 2002:a05:6a00:3917:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-780fcdc7f7amr1729460b3a.6.1758755769659;
        Wed, 24 Sep 2025 16:16:09 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c27686sm144845b3a.96.2025.09.24.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:16:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Kaanapali
Date: Wed, 24 Sep 2025 16:16:02 -0700
Message-Id: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJ71GgC/x3M0QqDMAxA0V+RPC/QCkXcr8geokvXsLVKIjIQ/
 93q44HL3cFYhQ2ezQ7Km5jMpcI/GpgSlQ+jvKuhdW1wve/wWxZcfzmjc32MkUKgwFDzRTnK/14
 Nr+qRjHFUKlO6BplsZYXjOAEsexcWcwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755768; l=769;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ivlwUUQlmRNXZlh7F+6fYULgHiWE/9fkPiEhxumB3rQ=;
 b=/G3wgQ4QYN4y/BRvhzhGFePmtWPvBXmc43/t/mFWyQxQdB1XEtMwNHtqxJgw/bMdUHyC7v7bw
 Tk3WuLolbEEC0M+kbTG8Mr59QbBhD6CvoK1JxyYn0aECaGLnwhpleDB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: sIJgTTeqfCks7fNCq1rHnkF038mEnWzz
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d47bbb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0wRmexETLPsNm1jg2zQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4mJi4w/BO5Fr
 WLsNQ3jWSvx9XgG/jOiZ5enCHq2NIHUnZKys3E2cgOlpMFVTnawNXKcED2HIGEsEApsCxnYP65R
 7Br1xxo9JVmnCDnCufoG1iEqcG3pbhia2knW9Xz+6PquEdfzV8Rx6IH/2C1GrVMzdGFOZo62hQv
 BC6RcPf0rhlCGU312+yrKFCZS3UbVuy0+PqEFAu/lqLoYda0oDEzEeyNVfc51dlqPOGE2PBR639
 zNtimOib6adKpp2zo1JTDlovV8qKzesoSUieKc57tjQNsi6z8diJCvo6ihUCzaby628rvnw5xnP
 pVQfiNt/NLQM1Us/Ff2l/9XlB0Aqu3JsmLOgsSExJA/C2apkEvc7TmWrmnni50ZKvsfRHZa3ff4
 6OnNx9BM
X-Proofpoint-ORIG-GUID: sIJgTTeqfCks7fNCq1rHnkF038mEnWzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: pinctrl: describe Kaanapali TLMM
      pinctrl: qcom: add the tlmm driver for Kaanapali platforms

 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml      |  127 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kaanapali.c           | 1803 ++++++++++++++++++++
 4 files changed, 1939 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-tlmm-009fffa55a5e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>



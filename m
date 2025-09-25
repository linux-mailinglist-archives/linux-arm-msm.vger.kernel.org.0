Return-Path: <linux-arm-msm+bounces-74799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E843BB9CC2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F2C4A0C3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC742745C;
	Thu, 25 Sep 2025 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUajbL52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA01C27
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758488; cv=none; b=NxspxHM2JZChYyMSTiRa6Ajg0dUFyQs1DaTC7aRWW+N3dCgV0jag3dzuWPSPtFJr6fsNdQt9rvnR1Qsus5kFhVQSsLMmfW8Pt8rBs610GaUruM9c92YyFDOeFB3x8ngHD81AnOEezGkTMfN4EVCJRIAOLWCleT8bbqo4ZvC9/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758488; c=relaxed/simple;
	bh=gSe2sTkMlehwOWAj3Y2GzOp6hubU+YrwNgErV3spKTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QVpMmt/0NrGV9LqFqTmVBxfZ9s6MfNiDEG5eRpjgwq4LJVoxU+QUVE9IzqfEWgjjX4psEs4E813AeorHczUvyckLNQVXYmzGdow6HtWTKCr9NvmKOF1bmGasxYdv/fHurOdsMFSL+Ep9zaajK4XyimLbGFk1+MZWD8NM67x60oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUajbL52; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCeTYI016436
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h0/VaBuKZbPhV7llk3SByA
	RHcqJl0nQLuGkL0r8T90g=; b=HUajbL52dsjBR0X6fZqUhywMiafIQy6AbygzSZ
	dcAY+SKuAB7P1ikwvVw5DwTCxi5n+jin9jayDaSFlhMp+bqTSmxgXZuZTCpG9rG/
	KLnZXafI9okZ5Qt7Mb02HP1IB8E1mDx9CyJWr05xLHIe6Lbm1ss24hn1IjfmqhDH
	puF7F21hRbKY7sqqzlTPGzhdPY9XI4OvmT6tQuDouFlqt0aa2NbK9nKIaoTUJdXQ
	4xSK7por7o2uC4QBSdbTZyIkfsB077hVvja3Up6XU3kYAEAnH69EUUgOL7f6DcSj
	MrdwE1vCBwlRTqMIxx5SGmcPwV3yXhvhBDzUAcNDS+yW0BJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhwxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:01:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780fb254938so344959b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758485; x=1759363285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0/VaBuKZbPhV7llk3SByARHcqJl0nQLuGkL0r8T90g=;
        b=hORSIgFrQSHTKF135NSxdEqi7+l5RtLZbCf1O+b4k52BUhPumK4Pxp7qy+wCaxIwZ2
         0TXtazmvQ9hrgVhpXehMLcaICdKzZ5CrMhafvxY+RQhuU885e0mM849pA8ha2sQJqcWK
         Jlj+Ycxq5/e6IbrjfTMhq+u1wYcwkdE86LOaUPfitLUB0fmyMJ6CHYQa+39cp/Zjkr1z
         1/d26LlrF12/VMr62YEeRL0kOsMAnXonvY/9yWoy/QpH+wHKzVDBqudEG25Aa2GuYCO9
         rOj731i63mtyoZudVZU/by4M876lyUvN7OWD9gIBgDYKI3pyz2/pmHjulpg2EFmaST0J
         5S8A==
X-Forwarded-Encrypted: i=1; AJvYcCXeNhpJEualQIVbw9PJrjqbvFwdFbnCO61eQ+G6n2kC76I2hp/JkqnxFiLR5yZ2uofC1+7t2eSsKNWFGjIR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gB7XDMOIOn1E3P19y+sJi3BKvKooZlBaIGqaAHLKWdYIGlVv
	qeoKERJURqS/6h+/3PHlfuZ+IxWI1NeUGE2jN2d+ByVUTSosbRQEjmw5qZ4SdgYIGYYlEGz8ZSY
	w1gtUhT/NMrQrtEn9AduA25ffgo/nf78mOEi3SRaOX2LDdSl5xYsI7y90/kD3L41mf2yE
X-Gm-Gg: ASbGncvoVe2SoTffoIO26UWt0UmPT+FOEpB+q/evx6GFzNOXIYynISPFisaTGWAEPsY
	v/o1uPY1eY+HtbFo18o0QMIwRyNNbCyML1BJgpI2iKPDRSZb99wwyLS9nD0aDbjEgvN2OHe+4ZP
	eybZqmLA1fRpLDzZa/swR+OXP/CIz28S9PfrCthx+r3CirJBBbedRTe8xBeoWR/7r49yqXDb4RT
	4k9vJM9CcMAGFO+NWFUTRRPUxA1B2MnN5XU9qijPE9qTpgVR2+xpCmwghRyWCUdA0MMwSag+VtL
	FXtVBrZpvz5lUoCs5r/UJwTi1832xA3H6J9yzT9c5/ytBoSwXha4MbIYbbjo9pDkOng8LDO7iHb
	lCZbxepgQVoFGEog=
X-Received: by 2002:a05:6a21:7e87:b0:2eb:770c:c184 with SMTP id adf61e73a8af0-2eb770cc4cdmr85816637.9.1758758484144;
        Wed, 24 Sep 2025 17:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAv63UMjIFcouANiCEt3S6/Qb1aK+wQ0LLx3QRqdx4S1D1zTwEc3rhW3+Dv9QYaPvnprP4eA==
X-Received: by 2002:a05:6a21:7e87:b0:2eb:770c:c184 with SMTP id adf61e73a8af0-2eb770cc4cdmr85768637.9.1758758483585;
        Wed, 24 Sep 2025 17:01:23 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a1bafsm423152a12.43.2025.09.24.17.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:01:23 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/5] Add Audio Support for Kaanapali MTP Boards
Date: Wed, 24 Sep 2025 17:01:14 -0700
Message-Id: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqG1GgC/x3MQQqDQAxA0atI1g2ojO3oVYqL6MQaSkdJVATx7
 o5dPvj8A4xV2KDJDlDexGSKCcUjg36k+GGUkAxlXlZ5XXj8xhlpDTLhk70j79xrCAFSPysPsv9
 f7za5I2PslGI/3ocf2cIK53kBTdZyCXQAAAA=
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758482; l=1345;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gSe2sTkMlehwOWAj3Y2GzOp6hubU+YrwNgErV3spKTc=;
 b=d8EikvJp0rl+AOqQG8C6joTZKxp0/8ffP5mK5zQOjRpg6fffxqkObTRk2+rAGzugH/yFGjmA2
 9rfOXn1dChBAav6s94j5bKHdgwIeP1VEhw+XeQaMh7I1t5nRavVn4U3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d48655 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JQyddCt1Ae9KdOiSsPQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: X35E53ukOiRYHTOq8akk5YKBvhoK3XQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX8JRD5qLTD0PH
 hgGdNaml5Kuh7ulVya2JdvyS46mSr4fLaqIG9Wb4xpJS17Jsht5RfFA+Tq+g8c4bDWXDn1+xyVW
 deLEZGSDQh+Eleb15jlNcpVQRCysIR2d0bMGUduH7PYi+DBHky9xtECj8wVl7BWJ8j3LtbrknFV
 O5M943ee/sOSxMLsE4TT1t89B72lsHPdF9CKyUREOvf+6jUQt1n+T2PtM72yN+E1htcW9xz5FA/
 FINNVa41TgJVB1jPY0Scd5wTWI2/haUlzc+6wdTtiPE79aDsHHMpBomL5eo3ovGRecxzPXmvncf
 DYnujY+D60LW9GzqG4Z4xKSi396JRRdlrRcaBH5Bmmoo+T02f5428kiUjdO4Ot8TooG8sru6g2G
 h0Q6qu1f
X-Proofpoint-ORIG-GUID: X35E53ukOiRYHTOq8akk5YKBvhoK3XQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Add audio support for Kaanapali MTP boards. Introduces supporting
dependencies required to enable audio functionality on MTP platforms. 
These changes have been validated on Kaanapali MTP hardware.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Konrad Dybcio (1):
      ASoC: codecs: va-macro: Rework version checking

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
      ASoC: qcom: sc8280xp: Add support for Kaanapali
      dt-bindings: soundwire: qcom: Add SoundWire v2.2.0 compatible
      ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  1 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../bindings/soundwire/qcom,soundwire.yaml         |  1 +
 sound/soc/codecs/lpass-va-macro.c                  | 89 +++++++++++++++-------
 sound/soc/qcom/sc8280xp.c                          |  1 +
 8 files changed, 69 insertions(+), 27 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-audio-6e84a8447fdd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>



Return-Path: <linux-arm-msm+bounces-87959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0DFCFFDC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 229C83054366
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA44625F96D;
	Wed,  7 Jan 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oowc9nJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw+oUvZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDCC219E8D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813625; cv=none; b=urWRXatfMpPsOCuO8Y3RhkPzR8DMeX7HrCW3IJTjPMvMBhHYOzscVbnbU63Hn8eVVm654vQXUoEn00t/wS5riLkfTbet2CoQArrwOhyyP/k9aS3atvW++3OY8IB0ylozAoap422yRQM0Twt0T9Uc28h0FxvBJrAIfTw7bwqZh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813625; c=relaxed/simple;
	bh=znFF51lG9Fr1m7CgHCrtTF8fOom1lHPV2oUFjMGzTRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mj+XuuntOXu42ztms2QP9DrgorL+hLACxPuRodTCG10t0JQRGxClnqYCmxY+GnjFqUfqNkNJiQjen/YQPkFEoa+W6VYi9sGfewkFnB9nyGHLzFpmEwYz6W/aVEJKdIzlL16aRdm06v958r5chqMKOOLV1je6Ld+0u2TNuptZXCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oowc9nJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw+oUvZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTTss3751433
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 19:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEa
	oB50hUeA=; b=oowc9nJbask6qOaFVIvQwjInAQvFJZMitQwkDvdFCAHAhTbX0mM
	35eKeNvC3BX7NyJtZT4w5D8Mn7+BqM4PfKA2dS8tkr+XywbycFttCifmi4hGFhcW
	VUo05uyEksyd97nCR0zJiYiaxXLJQhEn5MbCnBR5WkzedGLW7LWotyfCIHMCtzxQ
	u8bMwZ7DtJt+jjw6uUTpgMzeBL44PjtqcoKE4elh9DZQU5rCf0ppDY2MN+h8Jw8D
	p1+HyjwdTXlbcXpfvebOVLl3plRE6dwkDbBtIZ8HJVfVhzmArAzCJ1Ikqcz/ShUS
	Wdr0JGqUc7r2RVTHJ13nNKqqvuI7EVzwQFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcrc5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 19:20:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso28395645ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767813622; x=1768418422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEaoB50hUeA=;
        b=Jw+oUvZZMxx+mQTLkgEnDszGLU+HgcQtUjuN07NED5fiRmbaSRrbhamrXCzI9edCeR
         7L/Z6gqn5jNR9cspDfSRNAY77SBSevtC0X8DVxkM9JY4WFDz3fjjA+gfLWzzKbtU7cuQ
         ANOgihKoDI2ZP4BLWhnxPpTw/5M3uZ9KVVtNkwclwTmcOA355U0nvlPQyTpb7eov3Rze
         Ht8hneuwFCSrYryuZH0IF4S0CbMgkP5Gg29sQVNRLzWWM6AoK/Kwkt5d0pwkV84YACSR
         t3V/xYqWi6Xqb3dQpVpxSprBgv0co78VUJ/XF8AvOPDoZAL4/EewdfNUju0ajuCze1U+
         cpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813622; x=1768418422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5vgp+4EtJJpI+bJYrlUdNbHlLrat1ZzfEaoB50hUeA=;
        b=Hc0b/53zCvtZye7S9qn2NUI/9EIqgkeazmftL9/vVYMDeHp0KVb+ohBNEo7w7JbN+O
         HIyAcPI/GooeTH9YwPOCX9mpgBTYz7uFyQZIJG6Ti52YuUJxPPCBaEWLvf5rGPz0nxik
         VHNUxVwPMIyRdUoNWHsLyg7sv/QfbcGR3gTgJ0HpV2XX6l5XUbNBltufpBfL8l/wetAp
         +gUWKLfzDjf1A1A80g6S1fT74UBcsNQcosWiPax0HxEEzADEd8KQi0tbYj/G31LVM8of
         LN9zhVgNUzZSbyo7Eez5IJR7mwNxIGqT03y6R0N6FmNuY9Xb5TtA3Nf2+Hirhuv2oGOi
         5d3A==
X-Gm-Message-State: AOJu0YyxAD9TdAarUE3EOvUm9dLodZA1cS0A3eULA28boUEpY5J5Oaqf
	brvbdopm3QoHbk4bivX3aKteChsimyXdL7beSsX2P5BR0jHcCJBWHIoXbPE+jUj27zlQMEKNKLS
	v5LAQrK/Ha9eMIAkn54K3YPa9BeJyTAao2UPHS7sjGUR1yZaULp9olKTZiO2pNYdGot0GsrcYSo
	rp
X-Gm-Gg: AY/fxX49QViTb8MUdfCnqgNsYcFagzKW6DEyZnsgnMsoQZFRDeqwbw1He5uODqPZjk9
	BAXx3P/dDhM1br12BQe5kMpXhm2KVTxjZZ5WimA4MVHaBGpdkbc6VRQf3odxHjQgHttOV2n3kK7
	QtybvSzmZsmuWq7l422sd7RhPm/MjzCp/NHEG2EnhOmOkznV+Qhbawb3AqBWoWFz6sdWyeRSYF2
	RsExmnFHktulk1b4jrLxqGq3bGq3LSGqxVHEMVQecnY7FfJzANeFMYSgiuRndFDMWLb/LA1+1l7
	Rqsj5w/kZQCuyiPOxbxxQWIs8K5sl1B5dL9Cz3C3eSmuEumicawGat95bvLXWrgfHkgkTWJd5Fq
	yUbwpAtYuMxse7oa9ptWaoeVT1kzbKLxR670VfrFahujaVw==
X-Received: by 2002:a17:90b:4ecd:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-34f68c4ff5bmr3575561a91.12.1767813622069;
        Wed, 07 Jan 2026 11:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzjww7nsn3I9Bw7LLLNAxkdlK1gXIoP7XnWvOwhflCW00/WqrnyLFxKqjEnsv8MdGjQ7iBdg==
X-Received: by 2002:a17:90b:4ecd:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-34f68c4ff5bmr3575545a91.12.1767813621569;
        Wed, 07 Jan 2026 11:20:21 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4141sm5756375a91.6.2026.01.07.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:20:20 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: qcom: Add SA8775P lpass-lpi
Date: Thu,  8 Jan 2026 00:50:05 +0530
Message-Id: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE1MiBTYWx0ZWRfX8zHO63y/EuPi
 QAFW040GJv82vZxrpklTuNfee42E0kannPYk+V+SEVlrf3HIxK4RKN+wtGc+zKeo+T0BIB2mNWZ
 5jTYjIi6/DelRFf49hfI8fIh7g3g+g8sx3D0XL9TafeMG4ENoqDcrwfODOtovw21Jz9l9uejM6V
 0FO8x3o7ZOrxCa8/vh1Pgw2sdKpADb63d6oaHRt1+gaKmjgCYIWo3EhRmqWduIhpAbzDxuYnT5S
 j0+jklvfGfMyce/2/Doh2uIkVogC9znYup6R7OKIqXZAKniIBhUqFaLMQ2wDnmE8A8R9bwOSIPe
 +KijI7T0VbIv7bTTO+r7yKJG+jP9x3OnBjeAA55Cy+XSgjuoDMzkxAS3nc601G6T5op2UHfNKC5
 Nx1ccUP/g5WOh3l14sW10AhE1+hmq64wkR8P2qAsBcGgF9cXazg5CBBmYIhNVbAKlFXlsnaIqge
 dK0V8EUxzUTI8uk6b4A==
X-Proofpoint-ORIG-GUID: X5l3jvhZWmx74trsuH_lkaYKhs2-xtnm
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695eb1f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5uaU0eOrlHY_0w-MWb8A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: X5l3jvhZWmx74trsuH_lkaYKhs2-xtnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070152

Add pin control support for Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

changes in [v2]:
	- Fixed dt-binding errors reported by Krzysztof and Rob.
	- Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
	- Documented Monaco compatible as suggested by Konrad.
	- Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (2):
  dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P
    LPASS pinctrl
  pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P LPASS pinctrl

 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 112 +++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
 4 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c


base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
-- 
2.34.1



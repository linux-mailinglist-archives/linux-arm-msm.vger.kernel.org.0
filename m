Return-Path: <linux-arm-msm+bounces-79284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B00C16DA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017923A8B04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA46B355021;
	Tue, 28 Oct 2025 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BX46BH7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIoWEByP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D29350A14
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685224; cv=none; b=N1AQ2BTSM3bN6FNnfO5XgJSIh+2P1uI0yg39ha2+2ybCLqoNUrbVDtzyvSBEcvDws6HhKxNT1LyHbakDGko8Y6zGhB6j4UgXN8hAsbSpf8f3qQbJRjIu+53iqvi1QiqlxhaAjhF4hAdXbWRB4f7DDR7ymvlTpJG/RpxqF90Q5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685224; c=relaxed/simple;
	bh=iTqj4rbfKgBgi+AUvAxT5DauIF+8OfMFLFnMVyLwlUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAc8XeW9MPRgIse6PQ37iyYVsOzT3GYUoR0bC/sGK9axLAyHG+IET0RR9yhsY8xN09nsSyJmoVmeHZHG9nWFPkfMyUHFw6mp1y6V1s6JNnIwPHzKZ03WQreFydaGpHUMXpHv6MS8iCIqLjLRf3wxQDn8dOX5oSwD4N1vUuFj1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BX46BH7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIoWEByP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlSPW2503319
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vorg18B2XkV+FIbgQ30llF26mFhbuUqKJLMRiD9B5mw=; b=BX46BH7imTciEf2J
	zW24/ntj66lPfsTcKIO8APuIgjE8KY6e9/1QPqcLgA6DYcWqA2HZU3Jk5FVSi3K2
	oL3B0FNOvWG8NzPhT6ORhnEKoTxPMwPB4LlzYtf5tdLYqkyj8ELl0Rn5TjpxiVzd
	raVCZ8MLPpXEceLzhQPc2+Py1PEnaSOTV/swahbvRUXj3c3fSS3++kR2maa4w4/t
	5VnY5YODMp0tQhCNWqZ2l5YiDEaDocXSKZ0NGxgFZn0350E2AZsfxHH6RpYH1esk
	SAx6LH+lsiIkg2+hSESRuW5pTEqMYWwbAWNn0YGeFgH1t+PkWJYKCU6sm3iszGsN
	MJMG1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g5d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf3420ce3so71453521cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685220; x=1762290020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vorg18B2XkV+FIbgQ30llF26mFhbuUqKJLMRiD9B5mw=;
        b=TIoWEByPjLJjtoGKPgMUjtrfeQRuX8h53jwEl5tKj0OTotcZjFKmGe0FzhIOQCh+9j
         jK5zOH5awTpBF80ex9iMKXLiZFuOsfJIhDtGDeSiZfi2dCEi0Zz5l/EfST4HCJJCwW3L
         YHGsLb9DgHAU1SX14/dKUo7iE8g6aE1uiX9qd3xD4/k8rodMzeasQm009CmrAM4IRaF5
         3eD0l/Ry1vvaOxbxEtfg6ikGFXucBD1nj50kDbbEiWcL7IaEPjjDUyGGJB58wwZ69zs3
         dpE6iJ8FJADQ7MTI8Xp+Wuao+5VhEV665O7nDGxPha1XyTxVgfbb5wiviaL+zUVsDWTh
         HSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685220; x=1762290020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vorg18B2XkV+FIbgQ30llF26mFhbuUqKJLMRiD9B5mw=;
        b=LG4RiEFp0Jd79q+6D5lZGxF+fQEx30ocUc2rwpdO1uknR8tvrBwbf1EsIibcFXLToe
         I5yzOnTE7wwRsza2SBLxjI9Xg8fwYW00gp8M4yHjiV4/avJ/GMOXhSQ/sspNB+V/LxTm
         3nxLOM48/6DDy/VGUj2RhRL09nfcEvNBG24W1FhNvFT5O6y83o5DMT2uKru1TZ8s8o5O
         0h4LxxCh9VWoKii7zJvgX+mi8wUfuht6Q/I0mFESYFKZ59w7JMW1zzMtF4tLStElvbEK
         OG/sto514nC+r5/Et1wPSZ1agvb/XH6qU1zQGsYf0tPRDKllbUwCCBtGa13+O7mMRDYD
         xVdg==
X-Gm-Message-State: AOJu0YwQJeOfWK7sQ7Q7Owu1O0y7FQiKE569JNAu+/wbGhAOjTIGDYtu
	RpFLh9qymupahHFy79FCShzzop4BekPxDnQUXkEYXQWI6uGudQsW2ZNF7bs5lo0hmmBLIWI1vH3
	PN4XVlCRgOHZT3yX8SGpOolm+u/xuaKpxMUwHbdI4yeG9dXNzz8Zf6+CKo2Lp7mAT4Xuz
X-Gm-Gg: ASbGncs8HCuiScS5FnnKo/aJMAWzRCtxYaRzeDNOXbgP7c9s5FdRx51WX5t/uHn35OU
	uOLI/Aa7sjWKVzvkplgZXkxiTv38k2Oj8Ni/Njwnc99pUdAvp+bLEY0lT8z9bK6Fed9zcMNZip4
	4e1GyBEgDpqmkarDYQLWmppQS2nVbS9BihkKZAg3nY1WQC2cW93eNiUIIW05aBPU3FfNNBPODeT
	EwQ9E8uC12A33N4xqutJ4hifgAWYshOiFd8Vmy2aWxujTYNaoMs2FJ3QDCwdgnBpC3qS4mNhilK
	vw4nGRkT0sKeSZUnNuJTdgalI+LQdAxPXRIGvbgqT7o5PLHgYOQLD8bdUTcxn+Xtz/2CcwtNWmC
	8hnGB2Z7qdRnGKaIq7U/2suc48sctYk98fM2APQU8SzxF3Aw+tTAWdI3LkYHHvnJPqgiBQm9Nix
	eBNNZgxemMgGYx
X-Received: by 2002:a05:622a:1b20:b0:4e8:b107:aad9 with SMTP id d75a77b69052e-4ed15bda5bemr8975351cf.20.1761685217681;
        Tue, 28 Oct 2025 14:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnUF9//FtOSU7LqGrJrVJ8zqWq03xoOf7Pt1/gAkOPIjfYtmsuwfLjxE78/4Mq4uZXYjnXoA==
X-Received: by 2002:a05:622a:1b20:b0:4e8:b107:aad9 with SMTP id d75a77b69052e-4ed15bda5bemr8973301cf.20.1761685215401;
        Tue, 28 Oct 2025 14:00:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:00:06 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: add gpu_zap_shader label
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-zap-shader-v1-7-7eccb823b986@oss.qualcomm.com>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=40384;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iTqj4rbfKgBgi+AUvAxT5DauIF+8OfMFLFnMVyLwlUI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAS7U60E5fWVIg49w8v4wOMsx5/fYrDoc10EEj
 LyUERRaBriJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQEu1AAKCRCLPIo+Aiko
 1c++B/40MjOW/zo7S5As66QFDDgwOq6eZ6MkxnJvF87/FtxTl7LoAXvosAbNWYZca7b2nGbhcjT
 75V6GF8OzJ6K5LV9hOe/U2KafnZkq5C2e5tzXmzrwSzK3ARFO9mmcHXmrFW9WsaJTn+1p1kTx34
 tol7HO9CMWseLAVSJGVm7V4CTOTGPfupXGsw9RFg0IJZiUKbOWV/b0imQ4CN7dJgm+Suxb+ge68
 NxsBe9it2GnwFpR0NzoiadShjSutPYh9lpf3HwW65mLCfDV916wkPij00XEwgNkohATjLrAXMF2
 drGT56r6J9Q5SuaLPxnomaybZykvj9XZS6cydqAvV3b6qU9F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=69012ee4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_TrE6IQmKm8WOfCTE7gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4WpWVTaufEsSmaNNQjpa0tenfMHmZ0W_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfX+ZMftwxbsaKr
 444KHZssXMZ7lbh0DcqCXDldxNducSfA9OBOGVx/YPklDlcpXX63POSj7B6crsPaPy3Jn497rnm
 itDgzT8ZM/61NlEU7EKD4vRarcBLuEH8dq8FjaHKhDllhOIZRWHVL2vRvsVm8HCdcz1fwO2qqUa
 CBZQY6JwbHSXixtaZhR4OO7aaDRiqVH8eNrRgGOuMKrz1tvJ84FgVZv5P+1aIKRNIlxdQjoRIT2
 582fdJpXRXeeEAJiHt4RtdKSozzRdXM7PMjol5lzVCWvl6skIr0Upapx1fj9blQq/qfPCtomZlL
 fsfnykV8hy1UT7uteAcc+6Fylly6MGgRRA56HMUcyA06GuwQiAsb3pmJSLgXoR+Shg0dQ6mL0Z9
 vUPU7lSU6byMW1X1atCA51a/veYJSw==
X-Proofpoint-GUID: 4WpWVTaufEsSmaNNQjpa0tenfMHmZ0W_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280176

Patching existing DT nodes based on full path is error prone and
generally not recommended. Follow the pattern introduced in the last
platforms, add gpu_zap_shader label to the ZAP node and use it in the
board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts                  | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts                | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts               | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts           | 6 ++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi                        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts       | 6 ++----
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts       | 6 ++----
 arch/arm64/boot/dts/qcom/qcm2290.dtsi                        | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                     | 6 +++---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                     | 6 +++---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                     | 6 +++---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts                     | 6 +++---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts          | 6 +++---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                  | 6 +++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                        | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                    | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso                   | 6 ++----
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts       | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts    | 6 +++---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                       | 2 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts             | 6 +++---
 arch/arm64/boot/dts/qcom/sdm670.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 7 ++++---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts                | 6 ++----
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts                 | 6 ++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 6 +++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts   | 6 +++---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 8 ++++----
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts              | 6 +++---
 arch/arm64/boot/dts/qcom/sm6115.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts            | 6 +++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi     | 6 +++---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts              | 6 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                      | 6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 6 +++---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts      | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts | 6 ++----
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 8 ++++----
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 6 +++---
 64 files changed, 162 insertions(+), 175 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 99658b0bca8461cc3903da9c8c86c898bbf61948..9fa70ff6887b78caf1826f653a5caccd9653269c 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -201,10 +201,10 @@ &camss {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/apq8096/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/apq8096/a530_zap.mbn";
 };
 
 &hsusb_phy1 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
index 220eeb31fdc70b89b3e237d1f6643c465bda5238..0bb9e3d8f7144a853bbde8dd6aecf7b6f63c9cd3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
@@ -27,10 +27,10 @@ &battery {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/msm8996/oneplus3/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8996/oneplus3/a530_zap.mbn";
 };
 
 &mss_pil {
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
index f772618e80c702cb8995965dffbf5992a9f66490..1d7b27c5aff60cfa5fb19d2285d4b8ef96185195 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
@@ -28,10 +28,10 @@ &battery {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/msm8996/oneplus3t/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8996/oneplus3t/a530_zap.mbn";
 };
 
 &mss_pil {
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index bd3f39e1b98fb6360950b646fd05c6b7036dd0d5..3c6a40212a8dce5310d43bbcc5f7b83e7c48a27f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -91,10 +91,8 @@ synaptics@20 {
 
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
 };
 
 &mdss_dsi0 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c75b522f6eba66afeb71be5d81624183641bde71..b341dec271930776795a75cdbc481d1f10f0ac2b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1333,7 +1333,7 @@ opp-133000000 {
 				};
 			};
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index 443599a5a5dd573a1ac2a83f64c5016c36d27020..f8ab03f106a1b736d2912409b07e2bcb98e33953 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -39,10 +39,8 @@ touchscreen@20 {
 	};
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
 };
 
 &mdss_dsi0 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 33d84ac541e1c52028ffa4d86d602e0dc876988f..1cc33c3123a4e0da9fe6beb982b38379eb6844ff 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -91,10 +91,8 @@ touchscreen: atmel-mxt-ts@4a {
 	};
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/msm8996/scorpio/a530_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8996/scorpio/a530_zap.mbn";
 };
 
 &mdp_smmu {
diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index c6544ffa6f328e901048b3e6bfd516bf11af3901..b909306b3f126f8479cb1a4cd0325b0af1f38787 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1625,7 +1625,7 @@ gpu: gpu@5900000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 43af25d17aa8314354b1ecb8617510cdd6c857a3..5cbbdae497d8a29521dece6925ce1f2022a8f9ba 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -261,10 +261,10 @@ &gpi_dma0 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/qcm2290/a702_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/qcm2290/a702_zap.mbn";
 };
 
 &i2c2_gpio {
diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index bdf2d66e40c62596b8b024de833835a0750df35d..0cd36c54632fa32353e679193f25a12c6e5c4a49 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -245,10 +245,10 @@ &gpi_dma0 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/qrb4210/a610_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/qrb4210/a610_zap.mbn";
 };
 
 &i2c2_gpio {
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 964e33b6e74aee9582d8eba32f976c6998d36c68..71b42e76f03d626ef8357ac66ef6c850344a479d 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -594,10 +594,10 @@ &gmu {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8250/a650_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/a650_zap.mbn";
 };
 
 /* LS-I2C0 */
diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 524d44cbae740577e010f156308a715962db1a36..d28d691624279161ab3679308166b1acac2527ea 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -338,10 +338,10 @@ &gmu {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sa8295p/a690_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8295p/a690_zap.mbn";
 };
 
 &gpu_smmu {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 625a155a584ae4ca14c6f373ef21b773ea7311cb..d86a31ddede29d4ebdad8f1f55bded2343bc14ed 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -350,10 +350,10 @@ vreg_l16e_3p0: ldo16 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 069953dcad378448800d45e14931efe1fe1a69fc..aff398390eba77c0891cb654f5f8d4938fbff81b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -444,10 +444,10 @@ vreg_l16e_3p0: ldo16 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 42ab76d52ae21c39d5855e20e11f9cb2319f3afa..8319d892c6e490a1a1c35f5558dc8c6d4e71034f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2279,7 +2279,7 @@ gpu: gpu@2c00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 858f71737d93fd8591ba42eb363748ac51699d63..c53e00cae465a6e7f4db4d60e28a0badefb1d912 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -504,10 +504,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8280xp/qcdxkmsuc8280.mbn";
 };
 
 &mdss0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso b/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
index 25d1fa4bc2055e67db0508aa09c8a8bd7fa01687..cff3735a12dde8eccc45f7fa5166fe163ae5e95f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
@@ -8,10 +8,8 @@
 /plugin/;
 
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
-&gpu {
-	zap-shader {
-		status = "disabled";
-	};
+&gpu_zap_shader {
+	status = "disabled";
 };
 
 /*
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 69d0d6c12e58653f8cb56cb7d383ad9d64699d18..9819454abe131b6e719ddcb9e84874e5e3e97d63 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -595,10 +595,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcdxkmsuc8280.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8280xp/HUAWEI/gaokun3/qcdxkmsuc8280.mbn";
 };
 
 &i2c4 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 87bb42d9cc327a1d1811f15605a369dc8760557d..fe9b3ebd64593cfbad9f298abfacaf25f5037476 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -717,10 +717,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
 };
 
 &mdss0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index ea50e370f69837ec9412efc17e2a41034b0736fd..f2b4470d4407fb5b6a3dbac8bc972c010c31bd06 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -457,10 +457,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8280xp/MICROSOFT/SurfacePro9/qcdxkmsuc8280.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8280xp/MICROSOFT/SurfacePro9/qcdxkmsuc8280.mbn";
 };
 
 &mdss0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 48b60f6186fc1d69178902f2cc3bee324144202c..00bbeeef6f14dd89de506e33742f8f73435ac021 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -574,10 +574,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sc8280xp/microsoft/blackrock/qcdxkmsuc8280.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc8280xp/microsoft/blackrock/qcdxkmsuc8280.mbn";
 };
 
 &mdss0 {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b7044b9d656e4991e737f7008a7cf8f0619dd115..5334adebf278248b68b92c1e8e754f680155dbb3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3371,7 +3371,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 760f21f19ca472d620ab1a0703de6e0d69237b55..ed55646ca419d79aa2408c5b86f9c43364a6c6ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -404,10 +404,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
 };
 
 &i2c9 {
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 57a3ffedc432b08aa7d7918c9bd0f9714dbb3951..b8a8dcbdfbe33e72cb259d6a4011fc9b3d6144a8 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1382,7 +1382,7 @@ gpu: gpu@5000000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 662722adf20b7d1b6a44a28ba3bbf6b3e373cd0d..ce23f87e0316b6bfb50b387f4832cc4c35178071 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -455,9 +455,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
-	zap-shader {
-		firmware-name = "qcom/sdm845/a630_zap.mbn";
-	};
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/a630_zap.mbn";
 };
 
 &i2c10 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index a12723310c8b630a4961de671ea8b60f1f8b512b..09bfcef42402911a3f0081819de23398e35ec973 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -47,10 +47,8 @@ &cdsp_pas {
 	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
 };
 
 &mss_pil {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d17d4d4d56097a73f9f54c0b70bd1b19ac693e64..ffe1da2227f00fbb26a4bf1eb88223136d7851a9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -33,10 +33,8 @@ &cdsp_pas {
 	firmware-name = "qcom/sdm845/judyp/cdsp.mbn";
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/sdm845/judyp/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/judyp/a630_zap.mbn";
 };
 
 &mss_pil {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 971bdb9c3693bfafab820a5242a82874340b6c4f..091568642faa78c2072cf8a1bc7f6d4ac72eea15 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -416,10 +416,10 @@ &gcc {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/a630_zap.mbn";
 };
 
 &i2c10 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 3fe71adf1dbb0f05fc4aa0d0bf4d0c6bf14af6e4..fd7fdc1f0749380c2a1630473839005f17aba63b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -339,10 +339,10 @@ &gcc {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
 };
 
 &i2c10 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 45e9dda007cec2500bf5b6990e7d8b1ba56a67c6..5d41a92cfebffe0f843dd387de473f0942f9e5a8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -251,10 +251,10 @@ vib_pwm: pwm {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
 };
 
 &mdss {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 238471267e1feace68487aa25f97748704ebb18c..ddc2b3ca3bc576d0548e2ecd43dd16196b81f38d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -423,10 +423,10 @@ &gcc {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/axolotl/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/axolotl/a630_zap.mbn";
 };
 
 &i2c5 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index f3ff0b3352bcf7c3eccf7ebe615cd2e40cee7847..7dc9349eedfd92199c949b091b6a0ab1c5990318 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -426,10 +426,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/Sony/tama/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/Sony/tama/a630_zap.mbn";
 };
 
 &i2c5 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 5b30ace99579d014d762865377d5e9fdd5bab371..785006a15e9795db1605c3bb5a5861142d78458c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -246,10 +246,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/beryllium/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/beryllium/a630_zap.mbn";
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 26f0900513169368ecfb65b01eedcaf1050e3f53..30e88ff010a39738c5c88ef23899189f5c4dd01a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -392,10 +392,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm845/polaris/a630_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/polaris/a630_zap.mbn";
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8c90f652afff25a0860ae993e713f94dc9b39f00..bf2f9c04adba7953fde99edea8dbe5f40daec06c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4902,7 +4902,7 @@ gpu: gpu@5000000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index 57afb35770058b84c592db9f20e82ebb7c4f8374..0ef9ea38a424a520362665265a25acf66d1c44b8 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -488,10 +488,10 @@ &gcc {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sdm850/HUAWEI/AL09/qcdxkmsuc850.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qcdxkmsuc850.mbn";
 };
 
 &i2c5 {
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 35121cbcd37b08029d3e1a12b99fca44f3e4846d..e41200839dbeca2867a3687ad71e622b0b8e0123 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -356,10 +356,10 @@ &gcc {
 };
 
 &gpu {
-	status = "okay";
-	zap-shader {
-		firmware-name = "qcom/sdm850/LENOVO/81JL/qcdxkmsuc850.mbn";
-	};
+	status = "okay";};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdxkmsuc850.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index ad347ccd19755b20db8e0de6852148c76010e697..466ad409e9240e5137794597d5af4714bbae7af9 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -121,10 +121,10 @@ &gpi_dma0 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm6115/Fxtec/QX1050/a610_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/Fxtec/QX1050/a610_zap.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 91fc36b59abf96d008ddeb43f3e4b9f0cfd49901..5e2032c26ea388eadf4bf41535ff4b2ebf8e472d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1745,7 +1745,7 @@ gpu: gpu@5900000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index c17545111f49a8388d8d5802ea5c3ff3c8a6cb45..be1f550fd7b50b994427395b6d49c63f0b8ff159 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -67,10 +67,10 @@ ramoops@ffc00000 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm6115/LENOVO/J606F/a610_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/LENOVO/J606F/a610_zap.mbn";
 };
 
 &mdss {
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 1ea2beb9e2eaccf0e39dd2baea853d0152e48477..e3ec99972a28c8b044ef23cc2d39b3997b856071 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2255,7 +2255,7 @@ gpu: gpu@2c00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 5c40d4e869d354870828629238d6e14364f438aa..51779b99176d06a5869e3147a40aa101a990a99a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -484,10 +484,10 @@ &gmu {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8250/a650_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/a650_zap.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 6c9bb993dc2a3d12b1c7972128e2a2f64fa8dfab..c017399297b9d567eca7fea2667e6c2b398bdf9b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -554,10 +554,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8250/xiaomi/elish/a650_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/xiaomi/elish/a650_zap.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 12565ad87890fea1cc6c25cc161072d75b793c1d..078ba13f8762e037a8d4199a916c713b7f185b3b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -424,10 +424,10 @@ &gpi_dma2 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8250/xiaomi/pipa/a650_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/xiaomi/pipa/a650_zap.mbn";
 };
 
 &i2c11 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d30b3bc2db9e1be2258179d9ae68e3ac14d6154a..c7dffa440074073b78e16070d745108f2b3bab28 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2944,7 +2944,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 24a8c91e9f70f40247fde6eb63aa5ce58e258139..5f975d00946585bca20fa2efe823cbb333aae5a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -403,10 +403,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8350/a660_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8350/a660_zap.mbn";
 };
 
 &i2c13 {
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index fc4ce9d4977e811c993291a3b5c8ed477b69c75e..5c8fe213f5e4ecbb8a152fd27506c3ba1f281df5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2051,7 +2051,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&pil_gpu_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 0c6aa7ddf43263f30595b3f0733ec3e126e38608..268ae0cd642a74d3bae837ac6c189642cacf4be8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -643,10 +643,10 @@ vreg_l7e_2p8: ldo7 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8450/a730_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8450/a730_zap.mbn";
 };
 
 &i2c9 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2ae56c39f2e6d8a11a2ef0f77bffcf05a6fd637e..920a2d1c04d0c5a89d72e7d7cfff24e10befb5d9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2459,7 +2459,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index b5d7f0cd443a18b167c94e450b5b9412897b2ba2..599850c48494b1daae9508068a153f24fe3bfa91 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -955,10 +955,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8550/a740_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
 };
 
 &lpass_tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 38f2928f23cc3c1905ceea182270ce882d61eed7..f430038bd402c76aef0b4bb069c5e62f8abba969 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -642,10 +642,10 @@ vreg_l7n_2p96: ldo7 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8550/a740_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
 };
 
 &i2c_master_hub_0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 9af2a4fd02ea5bdc0ea14b246d79b34d49e7e2d3..05c98fe2c25be4066b81920364c702c357498cd3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -835,10 +835,10 @@ &gpi_dma1 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8550/a740_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
 };
 
 &lpass_tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index aa3167d10a41265ae8c9f178f7505dca89834596..02160f8d08df834e8f2e13b68e6543d990a06acf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2491,7 +2491,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 87d7190dc991b11f5d1162aabb693dcadd198c51..5bf1af3308ceb647f031deb9f8755c830aa90c37 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -900,10 +900,10 @@ &iris {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8650/gen70900_zap.mbn";
 };
 
 &lpass_tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 9e790cf44804d00a056f92514630ef620e212343..b2feac61a89f22a6cac8f663f7364fff86c76301 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -830,10 +830,10 @@ &iris {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/sm8650/gen70900_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8650/gen70900_zap.mbn";
 };
 
 &lpass_tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1a323f4ebdd35418d28af720d95e60544161e2e0..07ae74851621f2ec127735e6f1dd92164ffb8d4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4158,7 +4158,7 @@ gpu: gpu@3d00000 {
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 701f35af7d5cd080de48cb70db3bb9bea3e46264..a9643cd746d500296848f4b0f928a2905dcd49c0 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -763,10 +763,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/Thundercomm/DEVKIT/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/Thundercomm/DEVKIT/qcdxkmsuc8380.mbn";
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 169726984d3b010f5d4874c8d3d0bf5797f10dc9..80ece9db875a59d7b2ee3adb09874b5af6601c1e 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -722,10 +722,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f2960953e608fb81be9b941115df6ba2c9913663..d4df21de0d95980620e5241cfdd7a31f016cd7fe 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -479,10 +479,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index c1f49cba61fc40c764122f365f2e4b418579a73b..2f533e56c8c84101973f557c4df2abd21af8832a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -676,10 +676,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
index 4ea00d8236935fb14fa5119310365ad392d8d5e0..0b3b6cb23e1ab91c90ccb5ac779d70981f3d6d90 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -9,10 +9,8 @@ / {
 	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
 };
 
-&gpu {
-	zap-shader {
-		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
 };
 
 &remoteproc_adsp {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 56e4d13cca11165c30dcbed8a1e0a4d7f8fa5cc2..4c31d14a07bc67055b836725d4738bd31d611db1 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -799,10 +799,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 3b319f65dde1e0df9e53191acfa161ccb49dff7b..7e1e808ea983b6571bde306f575a94c4d6fcff84 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -861,11 +861,11 @@ vreg_l3j: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		memory-region = <&gpu_microcode_mem>;
-		firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	memory-region = <&gpu_microcode_mem>;
+	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5a121fc4494014f01be5d6e3ab95060581ec83ad..b742aabd9c049eb0f24cf96fb1af879acfc5d3b6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -831,10 +831,10 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
 };
 
 &i2c5 {

-- 
2.47.3



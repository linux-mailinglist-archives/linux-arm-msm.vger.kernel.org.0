Return-Path: <linux-arm-msm+bounces-72098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37921B4431F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA2A17DE67
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C270630CD8C;
	Thu,  4 Sep 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wb8Y91Wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9030DD1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003979; cv=none; b=KBRU74hjthjVPGGM+UWFOSBpT1M/tKOJG10rdF/z0jsJQUDJVXFoMFX17957Awdu0H4/s+IQqqS+5NvjKp6AeWzKBUKWIU94KrWCSyvDwYlnAB8caTBAUrrcbwHkpKRNWs/xhYUu+ZYJmgTQdYQTj9kBrzeEnxD9dRyIcSaKYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003979; c=relaxed/simple;
	bh=gBYL50YC1XDuPqvactY/HGpJkmgy7jZJJarlpKpBrwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Grjog9cB7DuuDn3TCuv9039N45AGY0culw9be0adGGJJgmoJspDN5dBn4i+OQx0cQ6k/++s5P9tC3wqf7ow5c7bECvx7b+WgDJ23hQJk8yUIrm4Sgq0zDGZmT2r3F9N6u7Kgv1xbZBYcdP6Rseow2soHEJ1kDsY90K4QGZj/oDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wb8Y91Wz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7tt013583
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=; b=Wb8Y91Wz94F4B2Zp
	pzL+R7MzK4O+WyNMjkd0Iq8BrlPc43xcrjGpakz8ULnOpxsW11Xnn8+fL4o2bZum
	+oAbiSeNx9ZdYLSErohC8p4rS1zBmUOW50rqnqN2ljwMbYuLMRQauUv4sOCbr7lo
	Ck1S9ksmYtfd+xe7QE2xrua+xEDLB4YuQChScON1Rt0loZEhKA3HNP6RB4cFmVv2
	oi/JDm2CxpAirEeSnzTfyrX1wr5VxithPduSxRxTneLe52SCpVO4bWFur5jNnBJU
	deCaQck/c1puOkpeePgCbcm7OakVDn5q9Yai6SVdea0ynrgaG0LslpsT7XnStjYj
	T0RtFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyc4hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:39:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329cb4c3f78so1194966a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003975; x=1757608775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=;
        b=KNORdkn1sPSeVP98EeBzyzgFJHbbLvn87q9vhthfX/gkVKU5OOrK5qNWzevmOB8Pv1
         KFbBw9ibTXHOdnxGlwa138SQ2vWV6Y2luXCg4q4I6w68s+HEbrPsjahyqZLdAA8Isaas
         te2hfYfAtPmL2OuRccRIBbFrOvTRZxu+fsBm2mXULsy9WDBT5rb4TCfvfDBRfJzoFc9t
         D9cyf7oc4HUBbe4azRvRmg7Enr9I5fWrVcnXXWWInOWFqClndS8OFuN5AsCt1yqQq3X9
         heq5XJKRCz5LiQh7/BCPYZGZ1TOmZNZtkWv72pTJmtwzJXz6RdLCs3ue6LEpBEkn9N3N
         35tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLdnl7DAClInadfUi/dG41rEFrlwUsnGLhp/SRlLYgJazK08EaRpDgUQBV1/fOmGMAcXP6xnkkeIpsTNEY@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbBD28Nmrsw7oS9vJ9pKsQOIJtM/1zoNfU58Bm8/OXa7WO+wY
	y8kQYY+YF636Q6DMdWR9DX5UlA7QlDT8wysQZ0ulpUpUzHynxv2RLf9hl2G1dMViKMUuEfjcqar
	3rU8sfwh02EPX95gmneClnXAeSG9ZCOVYoBLvNPUwqR7xcODso1Ck8anaaYhGJWMRYwxE
X-Gm-Gg: ASbGncuyuolBkknA0IRLaW7azIpIPKPd+FIzF+kjqT6PCVA0CKKfET+6YMGo7eXtlJ4
	4pnINnsVuBvG/wirlWh5TXqA0fSaOUfIfVQpP+0RkddWHdrwTYcOj9sKl67LHpO0fzqA4rZpWJY
	frwyFLh41aNdLGM2N9Hu26nkNpWIC/TO9K4YOd+8YUjcVOlAwzPIoY5Uxynys/pIR325nMMz6Dx
	HTGa8uXpSFEuc+Sjdn006+wh17F5LldqChWDddeNLHOOwazIvReIgndUIT60kVJzBLC1whvL6nO
	xAspteoKa8PC55ukRSJUmdTtteXi3i0wzIyHBdjqBv3FIn3yKku/sn/f3BWiwjgoLJ6Q
X-Received: by 2002:a17:90b:4a91:b0:32b:6ac0:863f with SMTP id 98e67ed59e1d1-32b6ac08933mr8239233a91.18.1757003975484;
        Thu, 04 Sep 2025 09:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7nofFV+wfimTfWOGY7Z6T0ProffuK3bldt1eocUGgRt88vfTcLxAfprbv1of4R3zm4TMTg==
X-Received: by 2002:a17:90b:4a91:b0:32b:6ac0:863f with SMTP id 98e67ed59e1d1-32b6ac08933mr8239202a91.18.1757003975016;
        Thu, 04 Sep 2025 09:39:35 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:34 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:08:59 +0530
Subject: [PATCH v3 03/14] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-3-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1269;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=X+CejMSc/iURyNBdtIHd2b0fknWkLUOZo2knn9rM+7I=;
 b=B0ZC3gu+mtOedmT0tGm0gYiwIQI00Jep2hD+NjWSt7AaI3xEHGf7l6shbcaOVXZE5sHn6N6JY
 d0/KRtj88nOCc9VKZN67PTINy3iNSYFysTRiSSUhvbVD0jX0zygqbBM
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9c0c8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hGGMonP7TOO80wKNN9QA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: NwqcRUf5v54Nl25SCWKNN_zY3V3fS2LM
X-Proofpoint-ORIG-GUID: NwqcRUf5v54Nl25SCWKNN_zY3V3fS2LM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX5XAVGTz3Lr6b
 MwxSfp0OL8jpjL4HFUMGjP4uqcgiHeZKF2K26CwWZ7WvmJbtfIyq10wtL+A9ARnEW6AqqJzuiL4
 L+7GYzlHcj6No2JMRG8LZO4z3os7MeAj3gXSvDgFOK4AjtGpeMixiPIyvyAsRIPTWfx9mn/maXR
 U2PiVOJvp9LiHNQcZ4fy+tOGh4QYzo3RcJ/f0qGsIMOwpAQi0fTm74GIoUN3SnGRmekkFzxpoHA
 PZ/IgE+doj3B6+gbhPuAkNP5Z7Ju02VLK6DAJGqJfSx/gaKPwqEWvaNE8rAp/03a1OryRX6o7MU
 9Q25CQ85LE+dU9psE2vVAV+I8xFtvvsz5AA+VfGdwejiS9RewIGRmMaauGJGXc0gHthfrzDuqsQ
 J7XLvuhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9e415012140b..56aaad39bb59 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -323,10 +335,18 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0



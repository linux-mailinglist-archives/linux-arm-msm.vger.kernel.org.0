Return-Path: <linux-arm-msm+bounces-78561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24402C00C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F282D4F7B28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C417430F943;
	Thu, 23 Oct 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeDdOsXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA630F808
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219009; cv=none; b=SLRD34ee1pNJKFYbg0NTLISdzXL+I+aYYc3N1kMks1as7hpx2UiDTmJdIhLnDhdV9qJCwngBWceE36gqv4k6MfeGu4QsssMiwTmz6sb09Oqwk4E/btm1Wp+UTbrMBvlWF5HKeUajPvzy52V60ml2PExAh/6EEggtyAL1SESfa/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219009; c=relaxed/simple;
	bh=Z3ZKjce1eNa7cruDaoLFpBeJDrv3LxfBcxi/KFd0kkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J3PhkxFBMfiL5S3gfUP23C/TA8kaPYxlH/FYeU5VQnz+VnahXy0H2x9L/USVhGcXi4c0uC6e3OzmlqePwc5ym/kTKcv/+oitIEJk49uiA0Z+0Mwd+brqxHYt211QJ01zy3ZmjhFFLtvw5wO2XxT89s5lxsyV8ESsLMRdZLORGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeDdOsXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8P0EB020536
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b8+bYrK48YE
	QxTGw52Zzv2+zkKybAeDpreZ+tSe6PU8=; b=GeDdOsXZ0bWN6rptcPdawZeuklj
	/d4Us3XQAZWF6toxbu7X2EV+U4avFCqt7Q9shrvi7UtvABjqoMdrLtY0t45koKdW
	FAWyZDtJujBd751D0evAXHLXwiuESAaWIlNd0hsttPoYK4GbztFYSFt7RtrHCoyL
	gCGb5CkS1zdNBLngdO1mUSE3DZpO6EBMnbEz5ANYP2IJEmPXO39wI6idTaYx35ec
	DMDej3wAVUMhejyLd+5ISe+1Lvq4bK4EpTrDStMtgbcdu5dSaPYh8roK4eQ2EAFP
	w3YdL4AdymWkR0NQsTLba6bwNdnM/t+f57iD392LSbPP6XFpRUAmJkjZkdQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qj5gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33ba96c9573so197420a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219005; x=1761823805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8+bYrK48YEQxTGw52Zzv2+zkKybAeDpreZ+tSe6PU8=;
        b=r3wMkzHB+Wjwx2DOPnBdruiKojAN2hVisBK8TLmqJtKL09c1mFULm0xxoZMgv0mapy
         QiAAG2wc0JTIrZ99bJ68nnDqMUGHwXUEc8YmowNSps6ABOtdT/dEsqInwdhWU36Gkisq
         SNQzLNLg1nSzugm/FUrNZzoaC0wWYNQ8IKAH7vMInyOhXC9yNhV85kFK4JQNd4FhuV48
         QpAEcpYZrrxKcgrDvtDeL8/zVrUrmiEEtvJoXSjlRRP0d2TtmO0yxRjeUbwZsZ0Z4Ob9
         8vq1Y3lHzHxUnp8U0uyqvjhPPjUdB+xdq7ZaSv5OwGfOfBu9Yrwqp2bVrOwWmp/ykoT1
         AFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9XegtHcM47sHOGeMa78wYp3CRVfJTpjaZr2ivjUQ60Rzv+bU2AzLS+nnP/gw3p9Fx0RuwTOeg90+q5cwa@vger.kernel.org
X-Gm-Message-State: AOJu0YySW2HQjMZbA+TxfnyBJ04Msl+D8WIuB08ZFVCjTtYDtyxehGTP
	jRsZO6bfxvmS0F831CvjEeYPrRxAjaNV27g09XhqoKxNcCnUenmJ4kFgK05oz60WjJtO5cecvgv
	mnP/TWV5OAGcbqMcRjBlzaMRruXGolKdG7HqX+qSENwVFU8K0zMeG6MzuKB4G8r5lh54=
X-Gm-Gg: ASbGncvMUl1PbPLTt/xWMf743o5gfEy2oEfdbJgfT4FwgAzD7sIdq8crCF//dO9BcWd
	9knRuiGeCi7tinE5wCaIbS9nzFfE8HsSS1jZSni+D5++J4qSLen2gums2+TxHIjP4PHxlcf1zbw
	jbyzGti9YK1aAu0UcF8d3RSS+Ba8nYvppQGPSoI5ouflz+0SYxk9CWg3F/8TP1TGPw9ghVaPKk3
	PGQfFrh9x7igTv4imGMn853bveJ6q6Wr8lFQst1jQhMEGa8ua/0UTNsv7z/I4O8U0+yTktp9MCO
	cSv+iKTc35Pv8hEcjiR4aVYrsUig808XjCYxNrTm5KSMWlPFMgmEAryPvU6/woAtnc1EsQTaF5v
	7FvTcSeXu4F2CqPw7pdyuKsfpJQUktg==
X-Received: by 2002:a17:903:46c4:b0:290:ad79:c617 with SMTP id d9443c01a7336-292d3e50ee5mr68938325ad.1.1761219005532;
        Thu, 23 Oct 2025 04:30:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMBrkCvTO1nWUE4UYg/s8tYpYtZ7BQ/m0qwKJKLmXmKfeqgrsKE3F73O+O9t1ICmCNO90HOg==
X-Received: by 2002:a17:903:46c4:b0:290:ad79:c617 with SMTP id d9443c01a7336-292d3e50ee5mr68938145ad.1.1761219005069;
        Thu, 23 Oct 2025 04:30:05 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm20438815ad.97.2025.10.23.04.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:30:04 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2 4/4] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board
Date: Thu, 23 Oct 2025 16:59:24 +0530
Message-Id: <20251023112924.1073811-5-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX17OfiTQmr27W
 q0ppoxvqV3HC+Ad16rjt7mxip8CN1UaC8YKvSV0sNVumiHNvCQtoNv3PH/sXKNg9B5oIvgFK+0L
 3VfAjTf8FX35KfteLDKniThbvDYgUViJiHoJoEpRRjVa3AM0YqPmDmj0UNcDPWqKozruXnBfrrG
 tUtowLdu4/kbiP0xmNQ9ced7UvlB1sqqWAeLeL0xy8w2c8ret9bWyx2uX2pyhnPWZ3VS7jBH3Sw
 gkIQWFZ7sR0IrCJynjZlNRVIfdVrUUPekEjkEwbUXcSe6OK4WpAB8Hpts5zaQXWifIk7VHJZjI+
 yLwHclj1UhPyWMpqTv3/3DzTbTF0wkDobnEMzpF1QhmTzVh4GnHeHq/9XJaZYDRrknl8PJ53p8m
 3Vj+1MCvXLVWC2MFtMWrb45FyH9hxg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa11be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=53gy1XDxZ6suxgqcjVYA:9 a=zgiPjhLxNE0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _zHrv-wwcO8hZo7iK-kzfQ22DSPkI8I3
X-Proofpoint-ORIG-GUID: _zHrv-wwcO8hZo7iK-kzfQ22DSPkI8I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Enable SD Card host controller for sm8750 qrd board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..8d018eef44da 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -916,6 +916,22 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
-- 
2.34.1



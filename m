Return-Path: <linux-arm-msm+bounces-81345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00820C50E2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06C7B4EC6D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543AF28A701;
	Wed, 12 Nov 2025 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICNulaIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkuqe5ZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D72C026D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762931580; cv=none; b=Rd12WDqqzP6I5JHtbTuIOjXi+16fjZpCj/Er3Go2lBxDZSUQ9IS0jQS2CSeGg9QyFSy+HxTayHuN6ed1nD2HWcA70Aysqr6IzlQzbr0GsQovPkH6hfR+RfsAFBGVaTgfVYQeoCH3Nef4XtRtp1Kxycr+nGqOESIgj7C1TiOKFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762931580; c=relaxed/simple;
	bh=m5qRzBXfk+7VEqGt9EZ6c8TGwWlWm2xIIOOyuzJthpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YR8anCqdobf+MD56SbWZij3rcUBq8SCfy6NvSofTw1WeWEqER2FMydk/0LM0Cn+jv+rVMzGTFzNr3f2/AGnN3Ck90AxxGD4P62umcovPDb5HBk5hWwl2ZePxtFpfr4H+ZuKtSxmRUabYu7q7pnqU9vzt+XsIlTnely7YaR6lAt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICNulaIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkuqe5ZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC40Nxc3061401
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6tSBFaww/Hw
	iifa1rLo+kRKgHE87JQ/Dby/SR9hm8DE=; b=ICNulaIBhmynn0Q1eBzcG4XiOhE
	+KiL8zCWRhC2jtFhotaN/5JNecxfC6vG293BIBYbrxbSIFVSfUoJ0sP6FMT80dFw
	NOk9Pn1aay06cZ3FHvXI+hGGAz+CwA0NOgEXwt40aK9J+W9haFxotyWzq+lOR6+e
	J4eFJTJ6D2cqMnHIbb+KDj6KsZynoekJWps//PjhZ8w7LZwpW3mgmjYwlYN+hNZT
	2hlybcE4RgItJNm6v9cHe7VduW7jc/T3PHWxdH1DBCTOwAyuT7WJfWSUFs0TA6kI
	v404f6uWlJvYs7NCSaAs/icKKYb8ANLmz/9wa4Qpw1TYFt9A0JXKZV2Ec3w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988j1r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:12:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a97f36d280so138030b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762931575; x=1763536375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tSBFaww/Hwiifa1rLo+kRKgHE87JQ/Dby/SR9hm8DE=;
        b=fkuqe5ZYNE6n9c/lrLkSWAhmmFMoU9EpcREMY2AUkfDRutPIHvlWh0kpnEzRx4hrBS
         G8Q5OGoNr1PaSJLu9Pccr6F3V0xumKfY4Vmo08oodr4voHPPqwzuO/tTD0GKQDJNQ+uY
         XcPkTWbX6tlKYXrWD6AJKRPdbUUavx5ZTQya1poiX0dGa6mw9laKgCXDcb1TwjAls3fR
         O+vvxMfQ964Uunm29Zf1ogBFSOxpLUBFbud1fMWcX2dkacVxGg628FWq731zpTL4tHjY
         K8DTBIn2gLJoAn3S5y48yp1XAviErg7ir1P4ueN6QVXViq7Z8jk7Nt4+oD6EIcZMjg14
         axlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762931575; x=1763536375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tSBFaww/Hwiifa1rLo+kRKgHE87JQ/Dby/SR9hm8DE=;
        b=aFFQUwXmnA/kR49ycDZY+2Yndvefrvo8Ni8UfNAyGTOciLwHftgrmlNORSRJUioAjP
         8MM0/+KY1Pek4hQvoZ+KjYf4xe6ZmU1z8N+H5P1nItzNQBC1122aTYGCkakV6q7/8irD
         tbT49lRGLzcsKwOKMbTmned4liidNF96k3zOo3XhNjOzm64qX6RFdNJU3c0yZ6n2fdP/
         orNRY5WjQFQqYYXw7JNlIkRoSi8QHUkdKDUdob/Ht4Ro3DOD/7ZbNneEJityuQbEvtd/
         emV3+IWanqj8vO5ZI0liGrYYBvNANSk9+oyhE58ri2Xgoq22dNyBZDzF5xuMdK2LnOD8
         u6GA==
X-Gm-Message-State: AOJu0YyMFZM8U8YNJtSOuaKKtuVqWzNpFUE+1M4XQg8CmFFoz9McZWHj
	ALO7eNu0UGrlEYjBi0F6SPkv7LUpj37a+82cxgCDMTc8oDMcZXkVSAoZgZzmQBrSuZzI/qrqJKp
	vFnc+nI5zW3xtjKMQSHYxklPL8tD3reuo+BdYf9lIARsjK08OSJgmPke7yvLolvHDUoo=
X-Gm-Gg: ASbGncutTW+LtpIUW2cTNxR2Rbin2CSB8hubqTCpEfbcttjJu5Fv1zOLpkRh8xXdWgt
	CDVrdpHbCn0FMCIIOh6Nj9ggmk7gKBPo5vFWLeIw7uEyFAIrxr2F8BphN0HiwaA5JTHy+vrpJB0
	VfXAjGVWRR99+ycvKeXvyvqmJJigxE8zFOokT4zLOsA0IHNP7IvBuXcQ4UUjEAAJGF6CEibDM/b
	VCNp4JlXxALl/kNeDhxRq/kF0os0cBtQokUdqNngIv5/gniQarKGSc1grd3vagQEPmnA748HWW4
	Cl/m+lLsoCc8zjpRTGoYR2UDV+pD9U0TI+TpBvS2K+HYauAD+F3HLTprXp/qY6deVqPfnZdT/Z0
	vn+dZIDAeEZIht1ZlD8nHZbnXx6uVKw==
X-Received: by 2002:a05:6a00:3e21:b0:7a2:861d:bfb with SMTP id d2e1a72fcca58-7b7a59978c8mr1338349b3a.7.1762931574907;
        Tue, 11 Nov 2025 23:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfpQEyFDi6jdwEEaCexCPSpGLZixbiSi75vLyCQhJ0ihO9dPkMa9wikgdp5gvjX3k6+tuVpg==
X-Received: by 2002:a05:6a00:3e21:b0:7a2:861d:bfb with SMTP id d2e1a72fcca58-7b7a59978c8mr1338328b3a.7.1762931574492;
        Tue, 11 Nov 2025 23:12:54 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9632e22sm17949037b3a.8.2025.11.11.23.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 23:12:54 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH V5 2/3] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
Date: Wed, 12 Nov 2025 12:42:33 +0530
Message-Id: <20251112071234.2570251-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
References: <20251112071234.2570251-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bqtodo5xIZQHoZHHxngbllofu_YH1oMP
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69143377 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kg-vC1Fqsk3HpgLVStQA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA1NiBTYWx0ZWRfX9X+WeEbjtoGQ
 nvEuBBOImQHSpsu1+Hqr77ZIutsmRt7+Z4Mvn561Etj0yn3C8vHFEOjF0LuhETGyVkjF3kF4VQM
 YjS9iBphbraSM0y/Z7Q2LFmjzdZFxYKRDmGNmygpXyHckqrlsV08ruZdspadhYjZxvlMhx3Bsgj
 gZ6b99KXf46Q7m133bnfCwtUEEa5WbmyebPJzFYaRt9fcwQlgxnSEU5nLhLPgDQlHU9Wodgc/rf
 QZkm4zUE9uHXftR+PXOF3WIQGkUsdGgg8TPRanUUpihdksftN5k6DuOXbKC6rbpBcQqhIsjkCQ9
 vZpe4ZmgiE5XWjMoR4yTfkVBmYj3rn0X7sjfwa0zw3DdkCP5mG/6QzpEmQOdsCDtUk6s2TF5e9u
 rVoL5yZgNDuEIoJa/xge6gzDN/ePWQ==
X-Proofpoint-ORIG-GUID: Bqtodo5xIZQHoZHHxngbllofu_YH1oMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120056

Enable SD Card host controller for sm8750 mtp board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..bfde752f6365 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1075,6 +1075,22 @@ &remoteproc_mpss {
 	status = "fail";
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
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
@@ -1194,6 +1210,13 @@ sw-ctrl-pins {
 		};
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";
-- 
2.34.1



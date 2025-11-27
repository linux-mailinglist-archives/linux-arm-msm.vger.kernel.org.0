Return-Path: <linux-arm-msm+bounces-83623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867FC8F4A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 16:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3335A34C720
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEFC337BA0;
	Thu, 27 Nov 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miXf/1EW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZHjCCUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A9337B92
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257490; cv=none; b=txVxCv9/m7OgQVtmcYDLW77XSJ+pkDIhHMtB1o3uJV+Jdaw8fsS34n7YO7UFP0i45urMDr/+CGvDSQ+u9V1wI9hJp/EspTJs2IXDwcspIwtBALOpNp4PQCXRpiW3yKAVUlJ8HvKjYWnPQUehhxTs27Ag0ETMqMjn9kzG7Pn5oac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257490; c=relaxed/simple;
	bh=qPjr5feCyVN9UGF66gTTU1Qrf//JNSbwpTy9g5tnxBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmLmdwx9aDAMnC8LSkw8VxrJ65dehNVjopw29HPN1UlDp+J+vcpwd9I8kydScZFBDwEo+d+4DGCOC1PyTS8PRCVDlgNNk7uqxdqIpTCx+a8UKwMA9azTeCpvBqB01qNIsprFDfvUdSq0Er8a/GlglVcN7TEXLnk2KcoFoVjyaGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miXf/1EW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZHjCCUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3ZII848490
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 15:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eD3sS09h1N/EaBCu8OPZEAr+7V7ZaRA//SzWOiAkVdY=; b=miXf/1EWheiiEYcT
	Ri6cyqwgLcW8pMim+bvj///2yY4rNO9U45qp1m+x2JJu4YrJhIkVHMR73Nl68ClY
	8K08IG5tIl7ySprbbTwO9dEHjPd1mMutcZRF7FWFz843klfryFbPQkRthAOpIclP
	qeCOdF4r1RS6dRndjbnj24WlbAmbyST2wuyqzpScl/yhpJV3ryRsKLQQo6Ga0aAw
	arRRFeSjQtLqhb0hlbiCrvm+ZsU44QARWiLRHUcqBQMQmvWG+alXawXLk0MnL2QR
	mlAkBAXtFEqBjvDgdatoc16v1bgBlctxQmTXotlX2O/v3u9ayUHPv/1vPvSsZnbj
	wzyCkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd8t5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 15:31:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2958c80fcabso20900075ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764257487; x=1764862287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD3sS09h1N/EaBCu8OPZEAr+7V7ZaRA//SzWOiAkVdY=;
        b=FZHjCCUnD7ELVHrl16uuKIFo8+pBNktmMn0XhLJjplVk1P7CUYfQ86AJNar/0VkKtE
         GO+mE5q4QHEE2NoCsTsOcDOVNfC9X/ENGzdIP9sNces6qhlrP1tXcTQH6w6dSR3gHHQa
         AbizURbz9FVAsDM5hKOZNF6LPwlQHZ0Mz1kma7FgyMad0VMZtNj5LjLuQ545IUfWq+zv
         iwE3R8zj3BNDfyrzXdMTwFFcpiKFBueLj0HtQqDYgJz8By/q9cPlkUBMtBzWOxoo5e1x
         E6rVdvZzfEZH3y66t7mNARvMeTEtrQCyCSfYvKxBCkbXnOaz59Xxpdsl+WH0QivCdWok
         gYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257487; x=1764862287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eD3sS09h1N/EaBCu8OPZEAr+7V7ZaRA//SzWOiAkVdY=;
        b=Y0ykRscsdIIKDE/as9KDVolyNzuFgtqVHT+zs6QwfPnrCnJGRl4O3yrI628ZRCbtON
         j4/oGe6jbIOXGPWJfeuNpp+NQPxSnu3hcqs8XWxodfqNcn6WMN6zmRwInhdi3YWIfa87
         MNsEauN0hJ2fBbvquZBNPy1yuTr+JcrhMIHpwPV4RXL+KFwjlf0wfBkxUbqe+gIOpmnx
         v1Zrmz/u6MBmBc1XM2nA41mQwC4o082cHOlVb7VCtP3OSrcMlnPsRAgtQ1kkyuMdg4+G
         qvFk8X48wAfNlb137XcqXsR4D/oQ9IBBI27OR6R+gZ+SWglJuT5i6Sa/5ZeyYEIkzHoD
         Fojg==
X-Forwarded-Encrypted: i=1; AJvYcCXKSIyNuFT3j9U3F7Hmtuevzr1yqvGkN2iz8vh2Sl79K6NHgt8Olyjpin41ZTXgPMW+Pys5agcKIXIr+2ZG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qKo+GZTLlDBPInCaBdhSczRLieCWyJD5L/Lk+JV9JdzDhJ31
	rhTso9F/D7gFeM6M0pkPfOYWiUhMkKBWjGkG6BF5JBoymmCu5he6YoOBaSg87DAhyZgjjIkvQfA
	FIQLE5IBXTq0I52oca/qXILS1DJoRVYsfTGb9TwDRqaUh0JcXb3bl304xluLH2K4D+ASA
X-Gm-Gg: ASbGncth2b3rXhGeLLgvYK2Av8Ye89l6SxUwKXlgR5iM4eD3025Z+/ghHw3fi5Kvt7K
	dalc5OpRdBBrkvvuq2BYFBs2vT1XX09uL85Vvo4SjrrY5JLjZHqB9TeXvM4s7qStnrs/Fm/1yKy
	1riBJOXAvW50b2KZJhPQ+zFJrNlvG69C6EFFJBQANY8NJUtXy4NAcwq2CODnGRxcDB2br3wTKvN
	1jRFBXTGOnOGSIBV7xZPtU0CziliEV/70NBcO6sf6kvT161IIJI0McAjiuSKfj5lg3gZgwAqFjZ
	kVo8A96e6NY64Vf5YQs1tL5j+dmiKxJtEgkUMwvwFLbQBpgs/7ovdpdy6JjSOwsJKZUVp9gZy9j
	mcOY7OBMl56W7fwrfTMQR6v/LHcyj0D5o9Q+LOJcDfIEcYg==
X-Received: by 2002:a17:903:2a85:b0:295:21ac:352b with SMTP id d9443c01a7336-29b6beb1e48mr266425655ad.15.1764257486903;
        Thu, 27 Nov 2025 07:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNwGcNIV6jJlx4s7rqopdW4X9jQI86hghy7DMzqlJ90P+SDWOiCfUgp3GaTQoRgq59lQdxyQ==
X-Received: by 2002:a17:903:2a85:b0:295:21ac:352b with SMTP id d9443c01a7336-29b6beb1e48mr266425185ad.15.1764257486304;
        Thu, 27 Nov 2025 07:31:26 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475e889832sm3592940a91.0.2025.11.27.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:31:25 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 21:00:52 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add PCIe device-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-program-device-id-v1-2-31ad36beda2c@quicinc.com>
References: <20251127-program-device-id-v1-0-31ad36beda2c@quicinc.com>
In-Reply-To: <20251127-program-device-id-v1-0-31ad36beda2c@quicinc.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764257471; l=1068;
 i=quic_sushruts@quicinc.com; s=20251127; h=from:subject:message-id;
 bh=qPjr5feCyVN9UGF66gTTU1Qrf//JNSbwpTy9g5tnxBA=;
 b=QH7Fv7YGH5DXtMcXJDFlT8wz7oHpXJ785Qoc8rAuSRtqTgjSqIjDR3TP+nRNYfZs0NTK1uwa/
 0LXHwpNJw6hD4uFOMUxsbWJGv5R4s+POja2staBDv+N5lTpGpofcyFn
X-Developer-Key: i=quic_sushruts@quicinc.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: iz5-f3-c0cdjEc9AJOuMdhY9e33-z387
X-Proofpoint-ORIG-GUID: iz5-f3-c0cdjEc9AJOuMdhY9e33-z387
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69286ecf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Jztp3yZJQTO__pNl2z0A:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDExNSBTYWx0ZWRfX6BRCt3IY4H+X
 m6xHiEgYny8a9F6JJ5IVMD7im6htQrt+ZmtPfM+FXXEx/9XJzyXU+TmJgnEtEPAX5TmUMkmFlyF
 R1YgTABYcJe1tjwFR/ilzMHy9U0hqMPFsli0g55mImsq80WDF2mxiYxe3rDJPWukFJREQ3vBR/9
 Wr/uk7L0FtAz2RU9VDu5lMmoDitRMcki9u0MjGr2quYNwIY9ieL64D3tu0z6vLy2AVJb5ZPWWlR
 +VYIuvM5MpwqqfSfVWoPneEo5WJFZMjpOEHpLuV76ulDChDsxyWpbGo8uXzzhPCmNVT3shneXmC
 k/S/177OFQ/ERkr+VLNTF2Ve1h1WVJs51n+DP10QUPX/j4zFeiG0FDwY39CHJHJ736zNfsD0PLJ
 Akgk46o4XMB9nLV+Q4W5GYQLFMPWvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270115

HW doesn't program the correct device-id, causing misidentification
of the controller in lspci as SM8250.

So, add correct device-id for this target.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 4b04dea57ec8..797b19e40467 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2211,6 +2211,7 @@ pcie0: pcie@1c00000 {
 			      <0 0x01c03000 0 0x1000>;
 			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
 			device_type = "pci";
+			device-id = <0x012f>;
 			linux,pci-domain = <0>;
 			bus-range = <0x00 0xff>;
 			num-lanes = <1>;
@@ -2340,6 +2341,7 @@ pcie1: pcie@1c08000 {
 
 			reg-names = "parf", "dbi", "elbi", "atu", "config";
 			device_type = "pci";
+			device-id = <0x012f>;
 			linux,pci-domain = <1>;
 			bus-range = <0x00 0xff>;
 			num-lanes = <2>;

-- 
2.25.1



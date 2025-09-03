Return-Path: <linux-arm-msm+bounces-71828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C1B41D80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 515FF7B59D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D373009D9;
	Wed,  3 Sep 2025 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioE/qN5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0412FF661
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900101; cv=none; b=mDgyOPgzrc4PPyl1KlQT7KgYWN44+ihLM7QMvxCvItj0rQ1XjMo1Yxx85TR7KWIRQfeN5TkKGyC+zmUi9xq6DrH+ZZId6/6mnmCGapKrWOiZPaiEzP12SNy50tpw1bQVb3JbfWEFT5fXADb9fi9o9ghEyAzsFlvATrdIFsYWccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900101; c=relaxed/simple;
	bh=OMmO2qusXp7Lt8NQ08hSTCdRjFkU8mgyUlODCMZLmPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duDpZR4tnVXoABOSKVqmAmOpAJ8WmjlrDRiwGxAFdNrrqRBXNhpELu2F1Jd1bytwj7c6REFDXSZ+Y0et9TZpVH5wxP+36fshnNuVPJXlev+RrTjgzk7QysnXLRecg+AevzIvtmbjXq67ZH4cLG9UsNFsl4LqCQ/t31TGJ7RsKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ioE/qN5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEv8c001981
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYUvyVFhjknE/WVt1KWvLE4zOZML2zuiKhdUsPmDp6A=; b=ioE/qN5g1eg8D7Xu
	7S12Iim6Si5kXMKfZovyxl9tgsw4l2Kq3HRCo7O13zZawjWASNSH1yNIK2ddOI7+
	ANrXcdHFxNPIW6i1wQqVRLh7oFC/yX+ZXogM47/aV5tAuoReNk52Ab8NvSj1giHf
	wp7RyU+nwQLJQCyNwVIvIMt0RM6vLboqJ7NnOW+Pq+eGPZDOCQ1IOys5DVZnnT5Z
	ye6cnolLNt74xSakF+EAeCipbkPmBHiaJ6d8efeLffXv+fUFLAKz05C6isKOi8BC
	0Za3/gi3JhdjY3ogEQDfQlmC4YXFxuMzpXj5iXEvAaeYo0qcaKweoBc9XVS2umeK
	vWYH6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03j2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e395107e2so6400276b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900096; x=1757504896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYUvyVFhjknE/WVt1KWvLE4zOZML2zuiKhdUsPmDp6A=;
        b=k2pF9ANls/uCj5TQi/kR6U2JMeDAVHW9BNY5cUVpOI48wjNlwQHHvqrXYkUJZdKoRw
         lidvwQojvZtkScn00enK+xjaBr+C0tAqOMDz4egx4MTNkOhnhpv5q5eIhsUA5HTY3VqZ
         PaCzuT8Oi7pwR0mdJeOT/VZkoY+jGqruionBFt07qukugroBv45/YXsXK5Tq1PHnDq++
         k55qin4yDcaDmdH0EYywrD6jEWmR1BUAiUaO3zfpIjfV6YXHM8WOZ/iIUmeBgo2kJ0jX
         yMr1nAGoxAS6s6QrdRYaPAqWg6gqa6UrD3JZ19agzcYCeBmTQZAbIZ3CFSgfh3sHoXU9
         d+QA==
X-Forwarded-Encrypted: i=1; AJvYcCXCIeb+oWr1lnykH0MbPlCAmrPbiDdTqDf5/PyWrky98p3ejmP5Xxb83LH5qh9nRKzzCZrRcjRqGqFX8Znd@vger.kernel.org
X-Gm-Message-State: AOJu0YwPHgt3qb/s8VjuOhiJ51OtzN9ce7EUsel5Ibof+wbaXaPcSxyO
	C3qAN803zBOQKUdvS8GFWnZ6n3aFvA+dLYjrBJm/LFigRLtLIIxDPBrjXBGq7jRkw3PVGCRjbC5
	uvw9ww8BFEpJY9hrks54ZMXQRkLzB8DTAhll+Hzuy/Jw/VtOZ/4vNAwjppAF9hpVrv7Se
X-Gm-Gg: ASbGnctd1Q1oC/06hUkkEbHITwlonBNFYclfuB0yRLxptA+lV+815C8fdr78PVGbgSn
	5fvEPOe344K/KjJaLGbb/ZR6HpwCf+sApS9fg+/+qRWkS87D9WTwutFm0xyuuz/tc3BDaRshMOy
	vfqIhgLr4yC8YjjOiE17aGi63EGnrF2qU2fI/sUW4+iSkOmJqCFfLrJ7X3d9qwLGFypYnuR0B+p
	TEGBnfqEqyXKICVZ/4Dk0NJ7OABYuXpheYzyBORIeBPvZhPvRTbhRkBTdekCiwQRI/xtQRC5VHG
	E5BB0YbiRjTKYs7NLxgrO878n+a3v+6Ltx7tOQLF9A3fw29/HpuQDZXSs9zuCb5uYGUG
X-Received: by 2002:a05:6a20:a10d:b0:248:86a1:a25f with SMTP id adf61e73a8af0-24886a1a5f2mr2868639637.24.1756900096015;
        Wed, 03 Sep 2025 04:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF0YOtRnZh6lzIY4bOOxsucOqwE7IEqnFh1IXBtFdue3ljMah6LLr0S8VJ+jEOBFs+TNvxA==
X-Received: by 2002:a05:6a20:a10d:b0:248:86a1:a25f with SMTP id adf61e73a8af0-24886a1a5f2mr2868592637.24.1756900095515;
        Wed, 03 Sep 2025 04:48:15 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:15 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:10 +0530
Subject: [PATCH v2 09/13] arm64: dts: qcom: lemans-evk: Enable first USB
 controller in device mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-9-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=2112;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=wbi0daESjbNaIOArppgBBTQqid9X23CoN+c1pFU2aSo=;
 b=oRJD5bisNnpttQ3ShOqU4O6Fi5tTtdoR8thW7WDzmP550KyX6RXVCczUsU48CPWFCTuk14V9X
 NXYk6OUNXoMCcaUpcreCPEpn4SKKXbJz6dUaLyuOh9QtmZOKBj7JsLb
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 1Rd21JndxIoPoVHFSoqIJOcZ6qmeFhSx
X-Proofpoint-ORIG-GUID: 1Rd21JndxIoPoVHFSoqIJOcZ6qmeFhSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3h1wW7pynyL7
 rs6p0LMknfhRthjNPkJozpMSvyelx3UD4YRx3aXWW54iysouj1NsZDtkfIIRxCkQ258h4cVWnQu
 9ZBdvebT6OH7JPnNHWfDXpM6asfH+NlbUAhjB/qFl6lmn5Vqe9xCh9SF6Q96x0B++OgY0/5nqEB
 MPKgtiaRAuXR500PbRhzW6gAZlBE4YyTDKJwQJ79r4Z0VKym6lQm4vwDzy+iCUalGDNiywQI/Vx
 wBVSt5GMrb7ko+fEkZri4NNIgkvb37Uvu/TEfLs6PIeOvylkxrCWxqKPa5HHE9/d/+7cjZ5BYwB
 nE5be4cnBLYcoHEGdczfleAhF3yHq5RpnNRlT/34J94X+8Xr79dtrHKzHA6/JVZogEcCjBpTz/n
 pL4RC4N/
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b82b01 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Nk2SLWWF8xhsZ517u1EA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable the first USB controller in device mode on the Lemans EVK
board and configure the associated LDO regulators to power
the PHYs accordingly.

The USB port is a Type-C port controlled by HD3SS3320 port controller.
The role switch notifications would need to be routed to glue driver by
adding an appropriate usb-c-connector node in DT. However in the design,
the vbus supply that is to be provided to connected peripherals when
port is configured as an DFP, is controlled by a GPIO.

There is also one ID line going from Port controller chip to GPIO-50 of
the SoC. As per the datasheet of HD3SS3320:

"Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID
pin low. This is done to enforce Type-C requirement that VBUS must be
at VSafe0V before re-enabling VBUS."

The current HD3SS3220 driver doesn't have this functionality present. So,
putting the first USB controller in device mode for now. Once the vbus
control based on ID pin is implemented in hd3ss3220.c, the
usb-c-connector will be implemented and dr mode would be made OTG.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index d85686d55994..b67b909fb97f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -538,6 +538,29 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };

-- 
2.51.0



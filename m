Return-Path: <linux-arm-msm+bounces-59631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A0AC5BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5596A188942B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8219221931B;
	Tue, 27 May 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hn+Q1/js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420A219A79
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379912; cv=none; b=M049ej6b2QpmLjclzUyOPyOrHGESNaLTMwT+Kboo7RzrzxLvNYtmV7WlqDzE+Gw/amT8t+LTeM2kHJjy8LNNNKIUdNgEORh+K8X1OuP+aExoKTrVVsbJNQ+0EqTAwHYIkXgTbhNabWc4ooz31TXesZnQNAwwTGnHD9uJolvXXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379912; c=relaxed/simple;
	bh=kcDd7XnM4Qs5GMBjJTFaJT0hgtOfG1Vu/9PUtKeuisU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TaISiVwvESpTpeoUmZnW6W/dEU24S4szrirGTfPpbhuesW6bx8HS41fzN5tTBJedCSuT3qEX/FNnWFV5miu4N4AO4Clr3A1xj8zmgb/qZd6ynkhTtCtK61o5yUMKvS2Ih+xKA5zAsv4/rIkRLg/R2mcNnfZXF+b/Q9lnvfKoGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hn+Q1/js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAncWE018828
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=; b=Hn+Q1/js7qPqCwal
	QR0R6xiRErIo4DEK+STvZLfnrw+Qgh/ktGhQCxhH4XVsGkqdlpIEyZjdsB2XZTwr
	RAEvBd9mQ6/EyLGYMig0WJy4a9t5mHar9SKs6i97Maj6yZvtRFeesGOYF5gJ/OiK
	z0bzGKl9pXTURbmw5WV+xAj8bFE6stwakJ1Y/wHGKFDa36jtEV7LI0evjZ2hVTgO
	lNd7wjXcBmVYW8/cSgmFC7onsGW/LMVQ7Os/B6ccZlX7w1Rra7zu1RPs1G7VUY68
	/MgQX1kUNqniV5Yffbua7o6dsLvxkwRTp3XwGYpYgAnhDeS4bD7w5QUZj8nAYO9n
	qNnYAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvpxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso5185487b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379908; x=1748984708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma8TsHB+F3p3QSMnqT7X+sjQQo7g7lCsD9xj8Lp3FGk=;
        b=mfqUe2n0LrMQmEtDBaWkK9CY9Ur72Ly99eYQ8Xixlan7646woTc0O3DN5IYQRPR1tl
         5GwpQdY1aNgjMp5coRmrI3lnsCL1ZPUsTrcu0FzTFMrouODtYdX4eZWEjW/P8tVYfNcG
         vN+ox/8vG6PnN49sv3JfBjskulmwxem6xRbFPGsIKSwM052oXMp8Y3/1g3OiTvxx1Iyd
         KhhWyXi2qoKWh4aDfgGS0nFLtXy4jMZjDSpJT69Vx4csAToEgV1iENJ7ko8CWewIJ0E3
         O+NVgaYap8TKZpELyLwfQjcX1wTIs2jF+y9sh1e0AkQ5DfWmz4LuI2gIozpp1jUteFiz
         LPkw==
X-Gm-Message-State: AOJu0Yw8CYC6GOPHcyxChYvypqmIblBJSqrqp0UtH0l5MVGXlSYsef9J
	+vpmAD6rWf7xRjhvRTciW9yFfmkSFoViAMK2jP65Nn7L/BItKSh0nxWTALdA+pqKh/Hq8QocxCM
	jZVJNErn0TL38u6j2MLLmvO8ARj3T9P9IlLBeiaxdvCi0c0OlRVzdsvTwnymEh7dvN/li
X-Gm-Gg: ASbGnctS77QQdbEVxsrQoDmO9bdUV6mv2oKXqMFUdhrJmOXzOzzALwvgs22TOTRAqoe
	LGJo0YHIku2ITB9oTCO5HPs5DAnRYFkW9Ex+kGOV1JyaVjZn1Sc5zVNj21m0PnIhoHjXzIm9F/f
	NPH8t/Nb48Slk/3aVqZuyKmw5DcdqaAMWNqY9R+8asonrk/y9T7uN6BZ+ZHHFvRZR+L2x6J7YA/
	kenY4P6KEWBj8xntbt8Czj2qQJNqOkgZXHXNMs6h7p2Ng3fC6D8sj+zrZQHN4YW0jHbxdNczZUM
	N6WZCLrPpGaIf3NEhwfNhL2mDLCNS9FlZ1uVQv0RognvlrNFvfw44Wk24ytbxQJR5lM=
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807108b3a.3.1748379908165;
        Tue, 27 May 2025 14:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Bz45OE2w5HFnK31wbhlsPZnbFbrdn+wcobk3wqYztQHQDfpbs/apLivFlaZLBGsaPBctAg==
X-Received: by 2002:a05:6a00:2388:b0:740:91eb:c66 with SMTP id d2e1a72fcca58-745fde95d69mr22807051b3a.3.1748379907716;
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:07 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:45 -0700
Subject: [PATCH v6 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-9-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1413;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=gc+u2Wnbmer5INhP/AFAJkM8vbhhdjKxQE+MTNg1FPA=;
 b=4AgkM8l55iNY4RBu1/FwiBbrVzA4iniGJCA7yl35iytkMEU8TFElS/1xm1j9EFI9+yj5eR9fo
 gy0q4gu7itdDy4GfnuSGHdb+p/19GMumODCz/v+vYfN4+QHWeaYoKun
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: lPIrN37kdQBs65EDXotmKKFiJV3XtIlJ
X-Proofpoint-GUID: lPIrN37kdQBs65EDXotmKKFiJV3XtIlJ
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68362905 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX7+/xZZXTTZKT
 j/TBTCdJJUiaEmiugoZ8kMpbu09itJknuBTbljrhOnX/OU+v4fFqEjlbRb0Qg0T1d//kL1MGfZs
 7Pou+EIonvW2AWII4D688/KTurFvj3sHSWAcNBHEoRUkIqCxzcoxtIwGQrxeN4IPGQXm5O2md22
 Bnn2VhRugAkPDC0BabTaRUHB1abQ1It1p9wYyTjhLR4XChMSiuy0eULC78dSEHsNQCa+dgMwkVZ
 hWAeUZyKXU89O3mC/8jBemwQwR9F5jmbKxXY6N7CLrlNKPuO/flhpMc2dRPypFZG5GnhwG3tdg4
 jhd6Xbq8qy58E9yxW5vdfic40EWcNNI1326N3RlthiIYQ01oMv+LZgYzMB/1DFNZzAgmawKvbUN
 iAjfUFUj7/wUynCUv9VBAW2DqgxNSn0O+y/LiEAqPcBlxGxt4Ny5UoRR9XhpkpBEVdXr8d6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=785 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..5cb18ef1bdbece09a7626b57a852379a62985995 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -811,3 +811,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1



Return-Path: <linux-arm-msm+bounces-81237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4DC4D922
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32DBA4F24EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BC33587D3;
	Tue, 11 Nov 2025 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPUp4iMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEejvVpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AB3587C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762862360; cv=none; b=C9A2/aLDELKeS2koBhpaUmIPiMcU1Kkdm8dhM3XPHcEH8YhQPF6ppydT/+b1P9m0Kzp6OL1H92C5MKTHkY981LO9L2ViU9ZDUXdmij61iwynLhEUBAYKM6CATaN0+xD9ncMmG66RxrUscFi2y8bbYHHGQjuq11dFeNV+Zsm5GeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762862360; c=relaxed/simple;
	bh=1ccshnWeHcL7yrhEfzUWoVYUaknKpcWbRsjPVmbpKYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxOMlYD+VsRwESeM/hl7mBIUczSZTMib6QaaUkpt5O7LUpr8kg6k0FfZIjtZaJ7PaIYvCfuMR5WrCF/+Wsp6o6Bx0RI8/auectAggLt0LzRWECbGnO6hxBdHC2+XXquNEt+/kcc8vTPA7MkAjuKSa+zVnX2Oc1fEBHAH+jT0ce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPUp4iMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEejvVpx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBG8tO2425254
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPpW1Ve0PMp0S1/wQFsf61I53LtheYEm/caWUgRR/08=; b=MPUp4iMnneZ7ci5E
	cKTJGzuXgkIL3asFgTjLqjw5A+kKEdJbxPMidQcC1JWrE8SSak6JsjEtpmEiJu2Z
	tPDlmPXKjXZms4y9dKcDB7J6Hnpx0A2fqZprMfEKHvxORUjYY2po0tSUlvuPjcED
	JNv49CEMtYvXJsXQ4+IwslIrfk7M4H7UPgUYNttT3TAAuISEkuLSOXrvVyTz9P+e
	PO+jlBiGVbwJzw5VW1mx3kVKVxtLKo0HoytwFWcboXEDuJkxM3ka5odENWJI3hEq
	mCyVQqZ8PfnmE5OVBJFKWeB5JZJ8uxx0PfLUNcXqHnzr7oAw14KMcnN5RSaTlAoR
	qd8o1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350gep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:59:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437f0760daso6996429a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 03:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762862356; x=1763467156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPpW1Ve0PMp0S1/wQFsf61I53LtheYEm/caWUgRR/08=;
        b=KEejvVpxwo7RgqqbjisT617A97XWFnwED+YGvArhpPoK/ShPl2X5+h876+PYFAUvua
         tUBKfs3JIYDcTQuJbcPvU6cwdJW/6njzJ+TTeJ39LEX35OMwehXLusnnkfuQDnpofbEd
         xCb2wH0jfolG3rXULbsXJy4Fsycys8f8zA/tVGamOm0O19uJe1b2oNL7nXgnM+9eETcL
         iLH0RbGuvsQ/eucV0OlP3pPMbs6PVGLu3q6Zie1HKtngzG7M+l9aQzp2mX9FX5ASbH4g
         RBiN3vKOxE86XgFXNXhsOv6pjeViN2EJSUWJwu9KXLTHtsNnYvTmiAWb1ZSblI20KnZW
         /xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862356; x=1763467156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPpW1Ve0PMp0S1/wQFsf61I53LtheYEm/caWUgRR/08=;
        b=amMXFWEGLlTKCNk3VDsbkQVYE4lXHeheM+ySVbbtwDwmJJWVDYln97HGXVsKP1uszT
         7xGZCccBQPDWyuR7RxxQCmCVSCoU9HGx2bqmVCk3nqGzWUib8gkYYOfxCxIVZcAAU5gF
         KHlU7pWsS4owfBCAh1fVt1trNE5I+Jrlijy9Csnwj2aWjZv8GUITy6C7W0MMmBoyZQuZ
         iklQlIHewMVa7KkK6ykE+oYcq6BNji5c/j4RP6jwx1t/qJpYU2VLUPm4kaCWgjTdTy5P
         5x7UlKxODtlXU3BnKVGly7ckexVWohBsSWL/zKayr0+YCyHjIpJ7en6MvlC53jajAPmB
         Rjjg==
X-Gm-Message-State: AOJu0YyS3uJHVlCTfUqen+FoiaCC/8ErQ0Pw7TE53ZPuG/hLQ+LW5dxG
	xFt1KOOPYmIKVBhfj5qRh8B3D3BGkqeRLDZ8rZ1RiChnsLWGBzKUUtGgFhqZ7MKzHieTMfMqEz0
	9PE9sVLt1SEN2BIsekOqs7gvjJWKN6L0E7/nI472xPphhwgiphHemHwj75n+ECwDwhI37
X-Gm-Gg: ASbGncs61ZSlnIw/pUiGdiPFYia2rQPnjGDCTni+iqs4KXyk07MPxUXcVFqEEzrr6au
	JIrpKP2Pv4QCxJQsK+O7LSTB94SQ6Qxp0HJR+lCVgBGWSSY4Q42OP/2WVqfqzyZuiKSSrWiWIHE
	wglfRZiDJDlGow0lLglzV6Pi27eO7COFQ5sREKTPzRueOxZ1rrRCyFAoGnLMUy7Ah5AVvZE3gwk
	6MCLUpwfmRpPHl5ukUnTVFo/UDJQOVTti8YwlBHUHpqnFjEQy75qmmDvoKDUw1/aCGvS9rXVTMh
	9ufIlFSB2M+7P/oe09ZhuqDIYfmsjSDoq6Pl/nU0b89xs4kZMRYsix11brWqDxt77YIS4KodQiW
	wJ5DOXN47pktAzY1R+ywH8PkTvLC5v+0=
X-Received: by 2002:a05:6a20:a109:b0:2df:8271:f08d with SMTP id adf61e73a8af0-353a11b0de1mr16056462637.2.1762862356434;
        Tue, 11 Nov 2025 03:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELzwwan0MKKafefmWABWYqSGEcCE5nqRTM1jX7qZAnghLB9hDQQ5qX455Hzo7ILMkz63NIRw==
X-Received: by 2002:a05:6a20:a109:b0:2df:8271:f08d with SMTP id adf61e73a8af0-353a11b0de1mr16056434637.2.1762862355949;
        Tue, 11 Nov 2025 03:59:15 -0800 (PST)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba90307193fsm15420333a12.38.2025.11.11.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:59:15 -0800 (PST)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 17:28:56 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33)
 on SPI11
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-2-101a801974b6@oss.qualcomm.com>
References: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
In-Reply-To: <20251111-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v2-0-101a801974b6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762862346; l=745;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=1ccshnWeHcL7yrhEfzUWoVYUaknKpcWbRsjPVmbpKYM=;
 b=suDVvdfm169KfWv+hJeWYdgeMdZJ/j/YL2lraBBC154ZEcUMxMDbDY8gA0qcS/VkvXQYq8gsF
 4TtdrZAi1c6CcllYRnI3PvZCG+wJLgAuq9D7rKndV75zkz1OBp+Jfi0
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NSBTYWx0ZWRfX3Db6JJ3TmvES
 NV1aBalQ4rZw6B/1ke3Vh623/68tAnDL5r6DR9NRC3wor9PmfL06Wx52P3WVcOQvJilgSo/8vJj
 KhlEJyC+KBxy65Xsm7inmW/rFfqjoRZsHvNSwDAVZ8TgU969BopHl+OqlAABukC3UXr36f+LbGd
 qdeww1m3UGjuwkLt18MEunZIObikCfh2rW7Jsi5FUHV5rFTcA5XvMzJRx9SnQ9Lom+tZCzqFLuR
 11Xzj2WxQDqkUR1w+MTgc+YS5+yvMg+rmHijez6SbCRAwm3xKsNPbR7cngARuYUDOaVgwHqbSp5
 f1YS9XX1veFwl1jSYdSHddYRjKBQIGdvu8eKPiLsuA86BRMqMz7lyvnvMiFTSiUmGSWjuRGIyay
 L4LQfcjN4IdDG8oh2lJZz2K1lGKHXA==
X-Proofpoint-ORIG-GUID: BUOx9bK-zhWqpp7ArBZHpC4rYduX8knf
X-Proofpoint-GUID: BUOx9bK-zhWqpp7ArBZHpC4rYduX8knf
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=69132515 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PNAbdjlqmVCGte-Ijy4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110095

Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 08465f761e88..aecaebebcef5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -921,7 +921,7 @@ &spi11 {
 	status = "okay";
 
 	tpm@0 {
-		compatible = "st,st33htpm-spi";
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
 		reg = <0>;
 		spi-max-frequency = <20000000>;
 	};

-- 
2.34.1



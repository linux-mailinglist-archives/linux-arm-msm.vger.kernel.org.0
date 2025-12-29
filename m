Return-Path: <linux-arm-msm+bounces-86860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB36CE70D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 15:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59E103035F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 14:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E9D3246EC;
	Mon, 29 Dec 2025 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzoJF2j/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7zY78IR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36E31ED71
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018499; cv=none; b=qlYQCUYqwYE9S6dn7vXZRMN3PfvYlbp3p3X2IdWwKvCqNh3OuSTbDlzu2Agr2+WwHIZQzXJwxd1GShsaHklMyXFnJw+Q1CLTYbJC57X+E8eA5suEEtqHJhxYbe4O7dC8RO0dv9XIl5JUXzybTHDfDsVZfhF4sevt3Lpl3ZTC2rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018499; c=relaxed/simple;
	bh=cavGUb2fhEE0stVT0A29NxXSEWD3MbzE6HxUvn+msn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aj+2yKhbfPq0BD6YyvhpLXA/bcCSANrrObv22HHudXjarxzvHDIWqmRfxhKwSCGUMiWRH0FUxp6xQEewBR2uScLgnrZoWPTfsYC4lW6qx0wLrfUCiOW6gpr3Hv5FYS1WEgskwu9jBBi/YenvcsO6quQt855b9HDOh2vWQQUwTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzoJF2j/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7zY78IR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9e6iH4069042
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 14:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y2gNxmAsXOe0J3MpZt2ABHL11q8rsOEV4L8
	AhUoJtZs=; b=VzoJF2j/uYBOvDry63IyT6q4YCiqTrzYuapvpwbQt7UboJCAoJV
	nCJWyUfjp/NbYwe4uhlvFNRFyCi9IKAeABHS5nq1SnscteD3KlQnjYBUqTlS+ypO
	tgjtWAwMkX1l0wyB8D+zj4lGsOiU6B8I/vocAe1XkTjQGs+WaWrRJhV59fQ2NW0t
	Obseqq/EnWl9nhoj1onJZtc8GVzQ223QoSuHufk6zDmVY/GGPBDx+gL30GfBlh4T
	rz/UPTwpFKF/t3u8pl63kcvR6+2GkkMFwuYFwvMvwPrt6ZGPVj0htRoFg7cJY/zK
	FzVrQkRCgvUErL7vYHbPHBlWrcTpWtiEPFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5mhan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 14:28:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so3545453385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767018493; x=1767623293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2gNxmAsXOe0J3MpZt2ABHL11q8rsOEV4L8AhUoJtZs=;
        b=D7zY78IRwK2KVyEiXuxvZgi80nLGDqa6oT8gGNXC9uutP3fcH8cLkcHKzQbl8uQ4hf
         XKZOzSlR4rh7i1skJ2M0mS92yH3TOC4Az+IKvWGdeObKgd1EZHKC5EJ+PXmg/gU1J3W/
         0BMr7OBirt2ChEuGzNSnGUOlKqxiU5Z7Bzzvcj0TCVahEpWgGEhzWvYz78MVEPezHOzx
         a77H/Z4MN+6tgoeQpGoRBYZpMsyPS3y9slmzKVZEI5Gy3WcbC20LYDcjjdYbmkr0c6B/
         msrUNhm29hvvwJJYHSr6silr7bidzRtDo4pMR7xh2ucFdxBiAToSR0Mke5TSwSqAmhu0
         KhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018493; x=1767623293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2gNxmAsXOe0J3MpZt2ABHL11q8rsOEV4L8AhUoJtZs=;
        b=eKUnXTKrJ8R9dAKo6OWMY1udpV9+X4lmr21LzCF7AevnA69Uh3m0UxeA6l+75Bv+MQ
         N6XwcrFdPG1rf3KmzUb1GpCfQxQ0hE4ANNhDZopFIrj5EOx4PqTstyYzkr9lqUYNqIgd
         jlJYzoIB7WRm2bnoq56TbF+PVKUHExeGN3a5SL0mRmSuMw0js0cH8XdoKP09kPPE0B3o
         oy84p70VguIjTJ5VyxwkQsFm517o+xAn0Q5eXCV2cCr6YpRhdT5J10OLduaF/NvrsVgk
         T9URv2aWp5T+7oyX+tnIxVG4kqwiJSbMGm+ewICVTVZA/eAZVJwTRRqett30YMJywzQ9
         XjOA==
X-Forwarded-Encrypted: i=1; AJvYcCW8XVAe+J+ZF+vu5edBU/RXkcX2TGmlSBeH0/0f2JbLFDkc64doQ/0z6F4gwWe3MN2uFvysW/bKz7L+QXbf@vger.kernel.org
X-Gm-Message-State: AOJu0YwWooiMOp+RTvm4nbE879jSXxvDmBJMOn6m1DbXoQS4ifqyYP2i
	hfnZItmnjrvu9VT041r5FqK2zHEBdXJq+cL8Yaev835pEo6IePd+0YoKHd30G3CMoSHWIz3Tao5
	OOtbsx/WEndkmddK6t7HODkq4mpcJM+ojV3p2MrQ9qqe7wu/SNmWSscVRAJeuEpMwxr5+
X-Gm-Gg: AY/fxX5GIthBfIXyVttoXyWGMNpU+oVK4mgFTg7z8oStDUwAJcEbaUurwmIU0M/93e4
	TAHF3Ab3Y1LARoALFoQUc023xPn+DQ2BvLlTCj6gT983fg1RgoCRrBFFn+H6pY62xMEPaj3NZJq
	SS+653zHl6cZSqBu3Oso4t7WTX8y78URiu2TLTQto9oVWJd4wLtsAHBeHaicDR/sMg89ha3/iHs
	Mr7KcLgOnEYsYodxiHQKZN6U6msaOyYOVyCJgC2CUUFpxHEwIB60DwBZUjZzJdgn23dolAcTA30
	PM2bV9zbFfgi7U3nPIh+EWvV9jPX7KNWm9lqIAFp5yKNSSIFPjGqx7VfI4dtIX9GKBGKhCACJoy
	lSUXcmVtzdb3/8+OGq58brrsxxQ==
X-Received: by 2002:a05:620a:7001:b0:8b2:e666:713 with SMTP id af79cd13be357-8c08fc014e9mr4402229585a.42.1767018492982;
        Mon, 29 Dec 2025 06:28:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpfhou2F8tiGdaik+LUNeZ0OuiWZ+i6Un0IKT9IlqQs6M8sA6E3kSG6jA+estbVzhjTCBDvA==
X-Received: by 2002:a05:620a:7001:b0:8b2:e666:713 with SMTP id af79cd13be357-8c08fc014e9mr4402226585a.42.1767018492515;
        Mon, 29 Dec 2025 06:28:12 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ed98dsm2410619685a.31.2025.12.29.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:28:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFT] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
Date: Mon, 29 Dec 2025 15:28:07 +0100
Message-ID: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cavGUb2fhEE0stVT0A29NxXSEWD3MbzE6HxUvn+msn4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpUo/25dAVIXmnj/AGQoV1AthBIR7VTxcnNyfYk
 0MOCF2EWnqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVKP9gAKCRDBN2bmhouD
 19ByD/47sYEw1NvVgjliR+HKwBHTEmltyn5aS2lRPsOGsyy0f+R7gd7gcN8bYKGqKA3z1erUMC5
 L5dKplAhZlznFYbiCEbNhqneuxn1+JOP3K/ug6usoD7OjjLoiJNNciOhYvEuKWIvYoV3V03Lo3J
 D4u/k7O6hK8yDKm6ewzVmsLd5acNUhC1Fhl5wTznjYPibEyQGVr1lgzW//b/W9/ovnwpcyz2Ue8
 drnBpvojKouJBB3QQ3PMbVswBymw8IZw3QeBz/TSbDlzXXvpktZcPP/DP1FX+oY2tP2srKAUFWD
 9ZtbrP+ZCVNBHlVUwzyx0KlGDNfkzB45X52o40NiFq2TFLa0sNXNSWs7BRNXdJwZD80i5i+FKO5
 X3vF3dokDgC6cE3esJmFBgAU12T8baSZ9ChgnGaunJL5GWgmfZaC/XFuobhEQHHuM58VLIEQcU1
 C1SvBpytXRLe3pm2jBBWyjFG024zZ8uxs8sOSFlH12b600WVdqeQ6tl8z+68/ctZtE/Cde39UV8
 FYblt3vf2kC3nNtdEXKJh1cs+lEMXy22L5464A4snQxNzE4FiAzK7TPNV+r+KembNGtBGSqYomO
 WHICsCBzCr5BPSI1GLWr6lE9wlp/1CE7EvHvTivrpuMr3GoVI77PO/nkVBcgMvIeqaEjYPwq5zG 2O/rfDVw+2Fkzmw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x9NirwaAyPPB6r98-lHNnDShssQfxcp9
X-Proofpoint-ORIG-GUID: x9NirwaAyPPB6r98-lHNnDShssQfxcp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEzNCBTYWx0ZWRfX5JAvAqohYHfb
 qpcoDn+eQjL4aqMAbf702dZpegBXV0919TR77hPYUp5O1cLFiV0lQ+L1Yrc1Cg+S8dI7gLo2w7N
 1vBEQOIFXkwez3MGqwOr2e7Hh7Dn+d4ifDAh7+GMJwZX+SDHzoXdlmrYUhu/b3frLDw9ZZxAEbQ
 Pm2A927nCj2tRcMECWYQCH7Yga9Zfuyc8IgumUHzeHelgrY/nK2g0h8BkVXCIFfcZvFO2apFD79
 E/6/6gRkHENyscGC+OZB1X/ijdu/QOwQs/eE5IQYZUw9wQYJ2HMvjOX5gDuhQqjTK2lhlVf1w2Z
 lpwDH5546FfG20wokrSaaGZ1K7svH8Ae8+/HPdDIM5bHJVA258MyFYU+wBlG9MmZ4eg9XtoO7q3
 MoyWfU7YcuWGtHi+Ilj8efoK7DSDDzdxQ0qK3yJtUS4p5JayWwu1E1kcwnbvC5JL4DZzHmEEcMh
 YyzSzowaaro23C06gFA==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69528ffd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NYfFl4gwGCMNp_B8HwIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290134

qcom,msm-id property must consist of two numbers, where the second
number is the subtype, as reported by dtbs_check:

  sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short

Xiaomi vendor DTS for Trinket IDP and QRD boards uses value of 0x10000,
so put it here as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 68a237215bd1..6b68e391cf3e 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -19,7 +19,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <QCOM_ID_SM6125>;
+	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
 	qcom,board-id = <22 0>;
 
 	chosen {
-- 
2.51.0



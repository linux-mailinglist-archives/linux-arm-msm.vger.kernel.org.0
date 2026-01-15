Return-Path: <linux-arm-msm+bounces-89112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E3D22A60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 476B130B9B96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4353D2FC881;
	Thu, 15 Jan 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fej63xzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp41Wmhb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7602DE709
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459772; cv=none; b=TiV9wHcOG5uo7WSE3zpuYLqEsXwU3a9Pkj0bkmt/resvi854x+4NxB00hvQ7OkV+rwXYjodjn7Brb0MI3j2vUsA261yKD4RVVh54g6TUSnVIU1NEcGCUqhE4VdmUUE+UHf7Af9k6AK6rJ0rh5+QNV2aICTNEZ/cAZNWqiWy35FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459772; c=relaxed/simple;
	bh=7MSa+jAIKGOb6mqw2g6TItCsw02/UKwHGTw92N2gMWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbMM9Oe+ehYnzxhjs9kjap7MYCkZEO7ODsVS+9N+R9cUwHjvGA8iqpSq/AZYLllDFsbHt7UQZye1+Mhcdo7nOiIw+q3TTg1dp2u1KlRFcAwyTb5RMhX7R5U1rT+dU1tuX+lfCNhcIDAMJyDNOnSRWKElde05Nkc5E+mWQz1NV/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fej63xzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp41Wmhb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g4ij1692803
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEQh2H3cN11SyVCtNDfW2btIoJekDRXrgWkZySYSUeI=; b=fej63xzfwdrVPWop
	fmO72126GcpL7EOsG/dNq2OhMG6+Oqg5+qg9+3hsuXqaG0hdb12cj715kZzdTghh
	KcdfOaBuWSw9NDm3vC9InGeLRkEUadah78jxlbmyoXbd0sutjFFQveVQwS0PuOxv
	E/OHw6xYXhjzhLDd5zLSopjaQTiWZs1KGNVUQJuCAOqfz2M4rmBmK9yKKJxSKS5w
	vs4lFVC8+d3UrKaz90fKzir295qfhluk1Z/QO+CoaqpiOHzidN++Lj8+sYzuYIL+
	HMbbEsl2gmjdEGj/sXIzYLp3hT58/K8AquDHNkBl0wizXBNDPsS4TqgdcL2u6T6L
	gJGyIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931km24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0531e07e3so752648eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459763; x=1769064563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEQh2H3cN11SyVCtNDfW2btIoJekDRXrgWkZySYSUeI=;
        b=gp41WmhbOuz1elpsS2IHG7tAfWHciTpW8F+sRdYCEVguFEWfoLKr21WyrvPWF7t5XP
         qMwy/s4QS+wHHyuoLrgob3WgBp2ClfA2D360gXYwnV3sZZLoVI9u0wAAgkvITNQc4o1a
         ZCe1aBIvQyj33U39a6CtphAr+VhaRl3omxY9PqUx/zr2k/NBTS2hH1WuAtwPrLk7dxfE
         AuLZ7xj5H736bKZJM98iimyk8hhPXiYPF2dQ/+NfV/C9wBI5iBnQgAgUD2QM+QKGo6TO
         oaLYyeUKUOQ1uzyMSMUbbzPyzIyiTuWm/rL7uDdxrYqEsOdCLSOGTZQs/C5y4Uj1fIes
         0JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459763; x=1769064563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEQh2H3cN11SyVCtNDfW2btIoJekDRXrgWkZySYSUeI=;
        b=wcbO/DRVqFRuFXuYYtU0hmvCU9zGQwAr6tHsm/cw7FDmz4WLwCCwhbPSeckKafNaop
         gpCUzxvdyasUc6Pc8bRZ9Wl71Jpr1P0RJdgjSyqeKJQ7q7jVv/YM5Zn7HO/Y0GlBXDZm
         UVCYga1jRyjkRHWJrwK7DsNypT4cm3zs0BjQ3BRGU0H6p5c8b1ZiBTyTgATYYm9vBqCj
         ksOiy+yRj0XGqVt6AkdqXbRGq0RoM9R3Dmoba8PgIH4F+AwmRYvpX24vNrfvKnXxK9Kb
         sCmLEsI7DP4ZpEI/RTPIywmro02iB5PlVCfdA8v0Z7h23cCTnMXFL6Dr2X5qnLFCv6JG
         fA1w==
X-Forwarded-Encrypted: i=1; AJvYcCW7Giww7tp/IraCEUo/cICjA/EjnsLXLEXT3N2N79ZY8EQPtNqqquTlAnEcEou4N65sdrtskavIfuSGQZWY@vger.kernel.org
X-Gm-Message-State: AOJu0YyszLE7NNrDtDMAACxFD18WYLhprPNSqsXp6lbutkcN4KnbZuRF
	LZqmGWiDPkVwzCJ2DvrOvpcckXeerKrkOFIctTyU8qnPdaFCkmaiqhIxhMtqJ+bNKyp1JNcQ6Zk
	giRnAPP+ucafetmfYqLBH2XwxTipnvPMscexR1b2vNYuOJQ3tze03sgjEAEkkt/n/CBOC
X-Gm-Gg: AY/fxX6+UPo2WAAUy0uSeJw9zDwb/QQui8albWo7M2RiSU8Q+XHkr3ttqzOUVJSs5QQ
	KDY5EpwtpNa30olO8tMcd3bVsjZc16xxpArAgiz6s3vfQXQ+dd7+unmlYd5GnT0E9oFkDC7WNvQ
	rzYBRupICAzjlJDD29402DuEvVukCBxdiZauYbXEnga3YTSZk7APbtkCPRAHSBbXbV5x8XloDF3
	YgmfXPmlheafU9VBYdqh3YyXB0t9N/GGyvsGVjC4l9rXZ0E3foFQhZ0ufz4U9WfR0GWjrBII/O3
	S6wZWUnSctKAVIfplhvEtBLZ5CN14Q23v4m0Cvc9mbQ6NRTWSbfHAwnFSU/4nPSSQ0OG90mzD+F
	Zb+VnNMVqdSC9Rxxc6GvGKGviN+9r3pncUZiYY+aSK21mztpmdmI7qbDGLzYC
X-Received: by 2002:a05:7300:e781:b0:2b0:5735:25a1 with SMTP id 5a478bee46e88-2b486b72774mr8396982eec.7.1768459762552;
        Wed, 14 Jan 2026 22:49:22 -0800 (PST)
X-Received: by 2002:a05:7300:e781:b0:2b0:5735:25a1 with SMTP id 5a478bee46e88-2b486b72774mr8396953eec.7.1768459762054;
        Wed, 14 Jan 2026 22:49:22 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:21 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:09 -0800
Subject: [PATCH v3 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP and
 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-7-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=892;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7MSa+jAIKGOb6mqw2g6TItCsw02/UKwHGTw92N2gMWo=;
 b=SDDcD+xqZwxogCJ8q3k/XWqQfX8MmZloxesW2BTf1N+K2tSKFlni39diJZ2i8z9X3O75Me3I4
 VZOKmqT18XiAx8tzv1JTLMf1Asc3qs4oykPG5/nVnd+/8Gi5tMlrIhU
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=69688df3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lIVsHN_WdLZ9tVWbX6YA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: q88yCthtIX5NXiSIOyvOtjGONCbdZYSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX2g7WNuIMb+fF
 ysQI3XhX8fd9jYOOL7OEekx7lKZv0Tja0outsEEDcG2b/c/JI0nFbLD9peSX1GrPm5aH3Q+K+5l
 drVT/7yaqh88v0b6NmRTVXcCQroky+C7gUY8rFUiWf5XGqE2qXRvBqmH9SQjE3zl14NMEwiTglQ
 RPT6NETNmnZK+DnZ/vNpiGjbBUMls/IpZvlTQrGNae1uTy3RpRXSU9l4GEuEmWOk5U0KadBcn3W
 /EsSjnE0AnGocqb4sjz2dlyyPBRN2EhTcZea5qjm1I7v6zMEOdj+qFUF+N4BLLdYJsNHve24uMg
 F712YWrK41pLm0wCm1fKW6vbUbJnPTFnUtISgplJa1vkcUIbG60U6rn4HCcKRf9uLaIiD/OZBAT
 NBVdKMWsFnx5KLKyub2P5B7aJ3QfIzmoErXCSghY4J+OirujFCT/bP2pgw5j6Rg1snGXDLyrKY/
 qkblgaW7taXQing+SyQ==
X-Proofpoint-GUID: q88yCthtIX5NXiSIOyvOtjGONCbdZYSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150042

Enable ADSP and CDSP on Kaanapali QRD board.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 66b423a497b3..32034eed03eb 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -682,6 +682,20 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/kaanapali/adsp.mbn",
+			"qcom/kaanapali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/kaanapali/cdsp.mbn",
+			"qcom/kaanapali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */

-- 
2.25.1



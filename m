Return-Path: <linux-arm-msm+bounces-84166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C219C9E3EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D22813AA2FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E42D73AB;
	Wed,  3 Dec 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUdRG5ZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtLlrKVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640782D6E75
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751027; cv=none; b=S103vFoyhax0muppfUD+6ldxCHZvMep2WpRKX0VWF6Y04fkyRnu+g2Rt4Qd33CXbn5BiohILnY9p22taAg1iDZLiQTzBoaz27YHUoTUrfAJQzf0eeCEXuzWqtbo9j0fKACy65gVhfn8Dl/O5jRS7fbi4aatzEulXPFV6ucvPLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751027; c=relaxed/simple;
	bh=aPsejmtIUw3vCzEFX1f3SMBf8e4TQ4PLWL1r6BY0DYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMt/ffjK5gJeYhOpDsjkTNBjMdj77R9ALUUNHCnDJmag4M3Wh9Gv0WhRIGQp8qpzh5oZPVeikh4z5YsUw3zN4F3y88vg2IeVL8AXFmoUAK9fqshcx7ivU1AYILIvDqAdazraszd8TvT9roXfwUZyfiXKVT1Tv7v58+bkAqCxtNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUdRG5ZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtLlrKVU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B35pcnT331846
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s1I+JK7Ehts
	Vkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=; b=bUdRG5ZUbeaIcWGS03roGO6/y95
	6tzz4csS39cxFGjtdhgxkEXpn+KBhkDDVc2rzhrZxP6JP98zGKWz9IaQd+2hkvXj
	lk9kwXnxEXQ+6O/DqKk50i1SSwZNSw37r09mTlX9sA2R4Bth4hLuiZ0bDGfJ8LNO
	heANNYxgA3EGl+6aQ9O84ZMcTPIugJs943/1cvcPyetpJ+WcylzPDfW9iXZQT81R
	AOb0IsILAStw/6Xkz0MiBymGO9Xsg2lSzngO7oJNJQw9zqnZTGDlypICV57B6e3i
	x8vxSg8U2Twu2uZuREuwqO99WEupnS/3vyh5IPfW0JUft1fFMWnKdIhMNfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c2174-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:37:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-298535ef0ccso73044265ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764751023; x=1765355823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1I+JK7EhtsVkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=;
        b=KtLlrKVU3+YkeIoGby/c8EwnpeaxuXz+Qz+O4Qb7MIFvOTEd4qixnFum8xUKJv/PEE
         uVSxq8FjzX9GTFTgkdPKtGzZ940LFb0NQF8+k6J3rZ0deI11Nnys3MgEXTY6Slns5hMH
         qOGFYfpAkxxUKeAmQFvGOyLbAH8wyZjeTi9zDzHw9jiUa03CNU2ey9quFclzqmm9TmOP
         0BkcWgGIYgKMND6C2Y1NJmIHa1DCY1mSOdAKvWhYuVIEWKieq/4XlX+BXI5T9gxwfVx0
         dJ8h2DhlvWvRb6F8NRt/XMRldvda39aD1/cXg9u1sRvBoHSOYuBpxuMHJj+6S+0XTPni
         V3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751023; x=1765355823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1I+JK7EhtsVkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=;
        b=CiaVmsEJ9byCUXw71E7DJ/jeXNba/uZmRa88vFZobKJRdMqXZa88U8zXdLDwJhk6e+
         p6plCMUfLBtQSZ/30DdDYwiRT9N8t3eA0R4Xk+aRI+a840evHS6p0tW+MxV6yQDCVMVa
         YTrxbDPfMZOsVqTpX6XwQQzZNo8jzjRGin9Wt6LfWnnfd7HsVU4JuPt0v61x1YLpLxz3
         7J+FlIYm4pUoaah5xUxjsi/qHQ1t26R5EzkgvrqdceO3uHzuw2jc/cTE+6vPmXxoFLup
         hTy3MAqWANtjPz64V6zzYYoTEjNa3zIysKbmDhPXywD6fbx+2qgaD3wQ7+is6KwRBEeO
         mhZA==
X-Gm-Message-State: AOJu0YwhQLx7+PcDN8cPRMH5/idJ03Z9zQYVLoA2TRvfOjduBpjDq3FE
	uzZaVlPiU8263vQisHzQ0GZFmXrw3S4u0IL7mnTCkx+Xs1RLTjGXGNth2zFweP+8J4dbWCjZ5a/
	K8zcI9blW2pQDDOlRKGwcL72HpRw+qMYNZirjTGutaFTQqAkbn5w/x0IJRqDA7ben9U+H
X-Gm-Gg: ASbGnctfRl363po74OyTFw59SGIOuzRBY0wqfXIYXzp/uRXn8oMahIdrXdmDaYo2kxu
	2S3CPTefpUWBDYm48gBi5R2j3kRAvbbkULAHE4+3n0AlsustFluIuk9IBoDV2j3/f1hWIfHMm1F
	6E/8ncgNgVtwz3bSmROO/LO/LZ4r3y2M85GKLQDfxpDKKxrWKk75TrUfbJpiFJOVYPmJW+yVRIi
	5ZzUH3IhElG9X/xGaAOeysgEMqWPiY1DrffNeLz6tSkgCbpYyrTfI6yOkDonPELY/kL9VMV02Tg
	X/Aw090M/xrURdMYGnkS4imrLsgIdYqC9MHOm1KlKwOFwhXL2VOSw/UHmmxhPrICP46CPcFE8fN
	Q2XZ19pK3GngdLVXtJeUUKgHAOtMGnqlRoioh7dGMaKuO93w=
X-Received: by 2002:a17:902:ebc7:b0:295:54cb:a8df with SMTP id d9443c01a7336-29d68421e32mr20341335ad.36.1764751023208;
        Wed, 03 Dec 2025 00:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqcQo3FQq17q7z9kTvLBzxRmh4FssFp2WXvF2CQCr/ROBeeRraRE9KHBnL1Z54xJy2ZTvJLg==
X-Received: by 2002:a17:902:ebc7:b0:295:54cb:a8df with SMTP id d9443c01a7336-29d68421e32mr20341095ad.36.1764751022714;
        Wed, 03 Dec 2025 00:37:02 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce41785bsm175707985ad.20.2025.12.03.00.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:37:02 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters
Date: Wed,  3 Dec 2025 14:06:29 +0530
Message-Id: <20251203083629.2395451-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NEqdRqIkAIUNBHK7mR0LVaVa0YDhx_9_
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692ff6b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Z-y7UPfJgGHtBsD8n4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NEqdRqIkAIUNBHK7mR0LVaVa0YDhx_9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NyBTYWx0ZWRfX5nrV2EdzO9ZB
 UASqOchaJbWRjzbj19TfLqvi3Lv/eQbh1WlUHwXEqU4IF8UJowZNpTRE2sn+0QqYXMEijwRUVn7
 mFs0CLj5QrpYWZjMJE76M32yq+9foLEvLLyfBdPy7v2x6eoWfguzneC5C2gKZ89yx+xSAIFMDy0
 VJK44wvjjf9iuDsxsY27JP7VSK9pAtrX96pxETVRCy+H0pvHmZhsOtfbtIOCi1dtzlDB4bti7Qi
 zJEcQuUGZkSh3B5VRjL3/xWLWPrFxtQPHPO2WAgl/ZG/sudA2QEb/EU6qAN7Bs5kUCHlxJ8memQ
 TPnM2AYiYXedYw8yrKMSbuimeZyvYVOBq3gkXzR55oAgLWGaCRTkvR2mxskWx9ciL76LNolZy8m
 6MWxMySaLrFgxivC483sC4UqBzDUEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030067

Add eusb2 repeater tuning parameters for MTP platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..b9a4d1c99816 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1041,6 +1041,10 @@ wifi@0 {
 &pmih0108_eusb2_repeater {
 	status = "okay";
 
+	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
+	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
+	qcom,squelch-detector-bp = <(-2000)>;
+
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
-- 
2.34.1



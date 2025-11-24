Return-Path: <linux-arm-msm+bounces-83023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC549C7FA0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87BE44E5BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4480E2F5A1E;
	Mon, 24 Nov 2025 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy9jf2wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6DAlhqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF82F7465
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976382; cv=none; b=pZkkHoZ9DxDzIk/ksvQU8Kru9mKuDUNjzqZt5tRhNcmtXTZG7nq/iv+EIvU9c14dlYLsbKljioXHazHwNnMKodvh4LzajYbwGMQnRpANHZx4k2tnCUKQHiiB+JWCv6T/0T/q3rpyQoZhe8x6Azn3/jyE87X1NShzlohwoeBRJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976382; c=relaxed/simple;
	bh=H+Z0+XjWbKBcB+TNCtzvlAUmuPti/CbVgPsapvzJ370=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5dd5Sn+eotwdQAPp0lWD+za+c0jZnx9EGpCp7QzB4ixyuSNuKe8kEbcOl7dxt5pdKXxUA5ueY2ciMDxck1kHupGIQmE3SIpEP6WPj/HGYsQKrx1QEfyW0KGpoCgpSHSxasD3Up6EydPCg2sLCMxH8uva2cJRj+Y26Vjr5S30IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9jf2wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6DAlhqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO89Stj3821627
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxFrJT9IxR5RgsmEq2Yv201BcOfg3J4fzJCqGDcE4U4=; b=Hy9jf2wGb0qKqWgh
	nYAbQUiz5AhXOR01OtTBDp6k5fQL/P18betTdm/rZv7pRToOnl+7idyrZhKUMakg
	p8p8JljUP0DZg7xvZOyo8ZU+LLkJOdPrhvSOhTuUUtNyu/R6qKk7sUcI6ag5wvCM
	fr2d/f2tcwPstd8PuGRTSwkEZb9l4AP9NctUQLo7s5qyqcsbkbOq91aZXDPuRwtV
	P/MUERNCKiQMFNee3WR5tkl/PnsU22gByY+oZjF9dSDSa4BPmaEh1G2nJa1MGYr6
	qCD06ZomqMpjgwG+aM20eFu2lKqhITDiTNn+baxUR2qPyvB94X25kAQUSSYZ/roA
	thkJUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknr7tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f3710070so102078915ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976378; x=1764581178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxFrJT9IxR5RgsmEq2Yv201BcOfg3J4fzJCqGDcE4U4=;
        b=D6DAlhqgyE0Rv/2OcAkmrWURrh4hs+ksot4p8mN/V8wZIo1+ggttKjGuuuuiT7I/Me
         89/d4QaFrRykreW6lzfGkCXXfhjdovv5ZQ6qXFmzXSjLIp7vYlFBUKBWkY37upYmrIoR
         YLECmOsUQDTrAvHUHtR3EvPpxViovNqTBP+kswiSlUSVkdAE8nyLv2bSo6kUsh+WSYxh
         V3bIi8mlnRJ5yCu2LRbN9xkXT+becb08CKz5qMty9MIjLXC9SPXwSxcZtHkjVi4g4jpI
         sDcQ3Qd/VQZo0JKnTK3KJ6OHubETahbiTSXj0Q0Jjo4VpRS1PP4j91uGul269AeHKCic
         X8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976378; x=1764581178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nxFrJT9IxR5RgsmEq2Yv201BcOfg3J4fzJCqGDcE4U4=;
        b=TwLiqqv+WBAFKOXOc9Qfj61HzybfhXBGSC+6t5qPNU5bi5negSGvF2O5IPVdVK+HSZ
         ofXyYwDOBKLJs01a8YB+3pRgxEfY+9CBA+G911ZAuErzBBvY+YqKUNkg47UpYWQqqhKH
         ywwiWU8Uo+LIiKrb7ZTTmfEsqNTnn4wDGvlypSv8qN15jb80HSvTWbLfyOViclsOzgG+
         wV9vBchmCJDweDrJ99ujasTDRNZhwnAMum2fnvzfD4++O6ZR9j5fgXsgAUnZSO6Pg25d
         S7WxFrYB6IYIDmHWKd4iVyDPLtpytmAtNcSanzUiD4ly/VLx0vyiVwIebT01tvx7ImzQ
         CBTA==
X-Gm-Message-State: AOJu0YyulnCOtU/PQ5lrHkNgOUAqN/dFSaIlJVBtpkEnkLKSEq9upntR
	C/edwxLzT3eSRYCUXUwyNLHjUhY4G8By3WHRYB+o2fSAoE5YnLWv72kuYeQqLlib3qiVL2WN8OS
	P9i1SXgmw+4ZN04J4CGWg/Dn086NyxPtxsArjW9efu7Wx/NmFOiKCckkrQWBlhGKEdDdQ
X-Gm-Gg: ASbGncstCPXYzc+EfDBkpae22nod8Nh8QSlp0dwUF/M09V7r3yEQRJjL8XRSpTu0z9f
	lkxv6l5uQ01oPRGOwvXxbVumr7vPU2vkPOXx4iBdDRmR5yzIA+hSQnIWC0dTWsrfLJylPJzjOD5
	CgUTzE+1k5ZDyPXDduo3E9pDvjs/roUvLSPgUrzkxd1mQ4z97GteTccAddSgnoM+meV8xSZM/xe
	7ElYB/7nBLSaoHd3DoUEzZdVKjKIU+zN+a/esYO43P9uL18U1qer3NsPxEguVxp5lzb+qLOAmb6
	VolEltcQKqtgE0XMWxdjG1K9ATM6XH8/bhKceRavAGcqWFO3evvUZmS3vqmU1g2d/BFW9H9HAXb
	lkAXIfTjuxrcbz4i8LZ35bBUdz8pNa7+sZmOXZgM=
X-Received: by 2002:a17:903:2f8f:b0:299:f838:a279 with SMTP id d9443c01a7336-29b6c3dbdb9mr125084625ad.2.1763976378468;
        Mon, 24 Nov 2025 01:26:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVKS47CYaCpVeev64lH6ypse6CZ4vQkWVZ0fpEA6mOPicVdZZ5978MvuPZlcDcCwpDpE7AEQ==
X-Received: by 2002:a17:903:2f8f:b0:299:f838:a279 with SMTP id d9443c01a7336-29b6c3dbdb9mr125084215ad.2.1763976377875;
        Mon, 24 Nov 2025 01:26:17 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:17 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:21 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: qcs8300-ride: add additional SerDes
 PHY regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-5-73ae8f9cbe2a@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=756;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=H+Z0+XjWbKBcB+TNCtzvlAUmuPti/CbVgPsapvzJ370=;
 b=tylKaLunFc7025Ni3KNZ/q3cvr2PLeisWqLHA1cFzR7039Ufd9vmR8TEti62QsKAMCAZt7sTi
 emWMCWhb6xqBEZF+cfJa5GpR8fubgaMrDDr1D0ptQWYLnRN1lkU3mGK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: fbXV-nEi9dKsq5-_Voa6nGS1JfG3JenC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX2vZV0QB8LpjM
 HEVu/ixOHudri36eoYk+TrfG8KovYKWmjiCl8PI9Ps0MlMvXvO2qXnZ3B7jCD7LtjNIVs3Tq2GR
 eQO8Vql26DHd8Qvtu5fslQTrlsT2ghkNLqTS/H1gOPibBPocbJ3qj+8fiKcAntflGPdqbhZVz8A
 CO/tI5wMP2NkZFaUA3WSMtdDHEYwLGwb+8Dqm25nNFpU5nebaRFt+gwx5BA/hnnY+AWP5FshLwM
 zf+he7g5d6iCl896/H8fbXXgzAF7S7izQ5opHpYqwtPsqOFxHcChbn6gMlSOkxQsgOu5ojb9weV
 L3DFyE/aPLWlPIehqaXJKj58SfMbdodTC3t464P+CkVNREmRFA1l3XCByNMPKlQOAVmi35+WgBg
 l58a18PgbBsWrE53QWRGWKbBvWA4/w==
X-Proofpoint-GUID: fbXV-nEi9dKsq5-_Voa6nGS1JfG3JenC
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=692424bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9SjQZKpPHDDCJ_mzltMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

Add the additional 0.9V regulator for the Qualcomm SerDes PHY.

Fixes: 787cb3b4c434 ("arm64: dts: qcom: qcs8300-ride: enable ethernet0")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 9bcb869dd270603a34221b905f0946e8af028433..66f60146a7498a86dfa2cfc0a75e3dbc540d9684 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -338,6 +338,8 @@ &remoteproc_gpdsp {
 
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+
 	status = "okay";
 };
 

-- 
2.34.1



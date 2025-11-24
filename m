Return-Path: <linux-arm-msm+bounces-83022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92053C7F9DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC9DC342B81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE612F7AAB;
	Mon, 24 Nov 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vv/txK6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGjZ5j4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9252F60A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976376; cv=none; b=Dviwr5sHwFV3OpJCdMOs6RwS2MIlISFHT64BF72dEgB1hQaSz9zb1Z55xCy3DUOHzlEuR5f5LA5x06XHGeRhJXk9FIUhSIg/9EowCG+hREnbrDV1Sv7A1j20GPVmTjXgE9f7wHAgYhiVOozw1+1LGXS4qb1NjAnFYrdNkeMmdKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976376; c=relaxed/simple;
	bh=M6p6cNqOJLrr1VimkDtNrDv8+UuwLLTpopmoQFLxJNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsKMhKArS5Vg1rELQP9y9rV1dESOAgleRjU/2E1JvYtS+x1pv/pYgoSB4XXUwMYFW8CDnNozPyGQ5mEcELhVCBsw9goNbmyC5l7RXXDmlRx6tiCSjN8Hmwltc85mD8eKjh38zO7zFjv2hlUSVScR8ECLmLCdhKun0isHG7kpSMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vv/txK6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGjZ5j4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8ExqJ2439829
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/hIBToIJ10S/2pRwkHZfrpd6jd+9L2vzWQxkETTh+s=; b=Vv/txK6M6C5UwjFy
	LZLoqOEfi0Taveo/ty65iwbjv1SZZdKchBV1+G5DHegaAxrrKtF4l++XS5AIjsEh
	Bxm+P1uT5U4AoungOPeovusRgIPjYiGycCkAHyuwbuwpHYtJX5DpG7VH+LlY2nka
	Bio1S79UkPXF900AiOPXl69WjBFAAZIc4lP/rR09axXoloy6r3zYR5M1u4djlgef
	ayorcy0PAy7DvKDLJTZaRmwsH2qAWdb/ziQhLAtbNqcmGT9giD75jWtBbADOLRqA
	Hck+uSKNCuw+xAZ99rja+2zCVqUfIhJTljbDL2apZz6Kux18x08wiZ6zswtaroBl
	fbEbrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69evdf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2982dec5ccbso93013525ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976374; x=1764581174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/hIBToIJ10S/2pRwkHZfrpd6jd+9L2vzWQxkETTh+s=;
        b=IGjZ5j4JtEo71yPsPklGFt8mbxIUdlsxqGP764tUy0hl7rgABpu8VdnBfNtlqmqOMB
         +fM/NUmvOx8W/GiTCWfTUevQ7nTkuSVG1eJXCo4/oj9RW3bndlRNpGJhOBi20eBPtoj6
         qbMu6+AnkqpCrIyJjICni+WVJClwVDp3RPTVc4wOAKQpRKuTdwSxL4BTqqyqDua0ar2B
         mUo5S13l7OhvTZlFfBT+8O2zbDb0t4BGMk9BucrAHbBwACEIOYc4nHJLGBGsBDTM7TNP
         sSeJx4n2YXLG1xwltevLA8ZjfpcyKXqNTofEksKdoxyQqxm8Tr+eQw4nxUnq2SMsqUze
         UlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976374; x=1764581174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/hIBToIJ10S/2pRwkHZfrpd6jd+9L2vzWQxkETTh+s=;
        b=r5oZODM++SIwYOs2ZnCFH4AYrsP1N27xEDWkJEqVhI2Mdv4J9SCjs52gV8mgabkgDs
         ulT4BZJLttZtpOYY0YtbpyCR0bUZ1hq7ZNm+8Kogzl8Kp8o8c10qtIi9W+g18X9aR0t3
         YE+Xj37SyY3DYkWjWlR0kWZu6yU/DsaYuZbrjZ1Yfq7L9dUZvDTw8psDfPi1l0MYq/+9
         KAtGbgvrVvaCJuqGC2Dpo5yFpwI9jOMIT+b071xlCrbCE85c4lVYULL89S/0lGQOGU+y
         3lJXt3gTnVtHomAy+SJBbrHX1o6vBYIxbYlIK1MflA8bNCjx08UCdoQ9jtXDlGyMkeyf
         JjmQ==
X-Gm-Message-State: AOJu0Yz/UmiKLESsZE2LotgrMs5MprM90WWnuHjvzvL1cEeV9YZwfdeA
	+CWInCqiZT963kNudAN2ZMxTmtSout1lPDJLN/Ky6vmnLR1wz9p859mNNNwuRRefsXKxAUP2JaH
	RqyH2NPm0L2JA2cT0BDeiDydo9Mt1m1yO9KIkTN0I8HPfGYCRGrMdwjLV/TwjZUuiG+XY
X-Gm-Gg: ASbGnctZ73K7EBe184akHtO9PadOhY8OlCtuV7B9Rtrx2fD65JXlLHr4Kgg5YEDv6ke
	W0hXGsqbARz8j3pL9/mGv8auRapjnDWhrb94kJI1yfDZEp7R6RlbOHxuJ0yJTc+IFC3t6YwG7cX
	nZtulWXbk8O4UXsiI557Utk3CLd128AyRosm/G5t/f4NbqPxCnDzMeG7sqmV6qUXOznKXyqJuo7
	AFmHL3cCRxPz+kgXAj+/zJ8rlf2SN9KBcCYryJrcjJyyh7dJj9TahrssWNV8MqZApPyGeJyHpLj
	eCcnluOcXgkoXSSJEnEP9xIhvRXOTwjbuoOtbBDCLA4AprhkBTQV0Cex7VgJ52oC+9HhNmxqaoH
	GLn0pDDSJxF1098dF+P+7yLdsJMRaSxfpHY74l9k=
X-Received: by 2002:a17:903:234e:b0:293:e5f:85b7 with SMTP id d9443c01a7336-29b6c3dc272mr120304215ad.11.1763976373694;
        Mon, 24 Nov 2025 01:26:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF83DvZtzUF2+LIhnF8mSIq0TCnnj3RVGPicq3PMTG0lN+c/9Z2H5Zds8h40mT+RIhlKcdvlg==
X-Received: by 2002:a17:903:234e:b0:293:e5f:85b7 with SMTP id d9443c01a7336-29b6c3dc272mr120304025ad.11.1763976373198;
        Mon, 24 Nov 2025 01:26:13 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:12 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:20 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: monaco-evk: fix the SerDes PHY
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-4-73ae8f9cbe2a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=932;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=M6p6cNqOJLrr1VimkDtNrDv8+UuwLLTpopmoQFLxJNw=;
 b=aMaz5TVZP9VflQn25Wp2hNniu2DvfKxHzuvGVoNv7g1d5Wpw/XiNyG1S8PIrZ//iCtAUiTdHu
 XWUuDEpgKg8CadsIS+aEyOLn7Oiujr+tTGZYC0wDoAI07BbbbZqgAV6
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX+E0xuzujws/B
 C5VWC4YBd/HaNThdVy9jhtwSMJtG5GUz1P63KPOm8HsiAAoyo4dAurqn+uVvmTTZO5cqCuFA1gw
 cPt7ygjmjNoJKavcgStGUBzI4jQ68m1sYO3w7fmGNNorb83tHpw0dZVLy9xrHa50xZHX+eW2YxI
 9HGOA3Dwc0a2rbDYLAqY2TWhWzZh+dKCLBhBEreeha5cBm93Vuj2WAoNnfp9YyZ5ssixArRxaRO
 PmNEfa89noU/N0tGmWc86GhkPfPF8/xP8MJ7GiO7vTMFhTQ3ZCNMbYIW5jaXNs8PGTLPAb4wBzo
 1b1qzm+Va+nwr/ftZ4hq07FlxwTZj08OJxv0EfEwcm7xjKw+kNVDvO6a6XEZtPtg3Zs7O9haWL3
 mmMbEXXq4kMaXeqOMSHEzAZwcNsi8Q==
X-Authority-Analysis: v=2.4 cv=cMjtc1eN c=1 sm=1 tr=0 ts=692424b6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E-7DmkMnb8j6TIe6XkUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 73-PhyDV_DJXacMPrbomE1DcusYEc33D
X-Proofpoint-GUID: 73-PhyDV_DJXacMPrbomE1DcusYEc33D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

The Qualcomm SerDes PHY, present on multiple boards, has two regulators
providing supplies of 1.2V (L5A) and 0.9V (L4A). Update the node to
reflect the same instead of incorrectly voting for only L4A.

Fixes: 117d6bc9326b ("arm64: dts: qcom: qcs8300: Add Monaco EVK board")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d141465a325dcfb5542fc032c95a1..4b51a73cb5e95ab09deb9c94b4cdf06bf4c09a7b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -429,7 +429,8 @@ &remoteproc_gpdsp {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l4a>;
+	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
 
 	status = "okay";
 };

-- 
2.34.1



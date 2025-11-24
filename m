Return-Path: <linux-arm-msm+bounces-83021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDBC7F9CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0003A1695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3A52F6578;
	Mon, 24 Nov 2025 09:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsFdks+g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3Dhe8wV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728402F5499
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976373; cv=none; b=ncvP4Zqxer+3IEOJwm2kAAd8oBmY2HSJLNfTm5Wj7ed21x/BgkAeM7xzr16S7YAULRKEin+Km4pTN7TYsW95JS0lxSGuS5bDKKDAGxMdGho0WKOfLNo+oZBhljdlThyWcSOZv7eyVUwxcf6UNUJ9zOzvHciptmEJ4WBq/M4xQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976373; c=relaxed/simple;
	bh=oAMGitWIAgfVFPtosAScIxBCMBHgKBga2T/t+cTzfqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3UO02JIFuzgS/FYaihE4KaIwzdTocLLMpP9ihEZR4kXTYnwJ7pCCLUXxR6hzdP+4i63vbr+YbyluPnimsamgkmn20BpechMdj5m/qfdYeTGd6FnB6kgSwqDhExQPwUTxAcC0fXok7Mk5Y+FkECFj8TKlwRz0KQcXfLgNL6XEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsFdks+g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3Dhe8wV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO83oL32308721
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkR5u0Ko85vl+TubCEviuFZl6vNlDg51wIZWE3oBrtw=; b=jsFdks+gOdnsOZLH
	7p0ZT7un7OWYLwUC9X+9t0w1M40HHKCUeXS6MXyWg1kzRmOr5OHaOr34MFq5+3KJ
	lSHF/vH7rBYz59xaoSm7bLp7iGnxm8XvwKVg22pL4KvyoADKa7jROUG57NYHCqzG
	VgFH7Yx6SMOBPHlnZ6h6dCSsrn+d/s6AJnT1C2ZMWEVtu2ryWoKBxc74j0QP4q2D
	YIFUiexdM0YB34zaDDa2Yg7ARTv531PewfpZ0KlktZKFbS5ImlhJW6qh9KBJfvTG
	lBrX2mlOcNyYYcBoAw8im4yE6xJ7/dlRg4C81EV/C9O765MVW30cnRuwdzdgCQW5
	/nH2Mw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685vh6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:26:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2980ef53fc5so125614285ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763976369; x=1764581169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkR5u0Ko85vl+TubCEviuFZl6vNlDg51wIZWE3oBrtw=;
        b=U3Dhe8wV1vysggcCMYGYlkZXqmkpvIb6+fkh6CQowNJ306x9ayX8GaQDFYUR4DAsI1
         tEboHTQZS9+mSy59MX5S0v3aRXXKwe9qrwc2QAgtq2SrdyWNemqcuTql0v45KpXIkPx3
         QBl5fItk5Mw/nYbC6PnLHdDQwNcit/8AUy0EUTMhYb++tkqNVAL38CeU0goLE7q1b4hM
         m2+4V1n2z10CVZTo3amuUjhk+U7GOHrVqMxexH7XjEXGtPHOEiXdnX5bn2wDhi/1obU9
         XtiHKr2QvTIVyQ36jeTFBXaf0gAaibQGm98zZtNut/weiB2R0Qj+Jg0mNgcSIfS16rb9
         0llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976369; x=1764581169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NkR5u0Ko85vl+TubCEviuFZl6vNlDg51wIZWE3oBrtw=;
        b=n1EhEiQRj5DB5cTeFPDeCMjYZr9rq3Dcdpv+KGtsVck1nkbTAtqWKrA/C5Cku9FvEC
         /8ua/TylgRD6P0Rtniffcw+UqEOWRDhXj9wj6nRyPPxu3/4cAKXZ61rupEBMmpNI60io
         aa4wsLA1uLifmCdIrkj+4e60BrMwqDv7ml/lZFZaGR0GGOnGlFrsBVfs+LvinJcMjqbO
         WUv8evQlrAIUrvUtER5/A/j7GmV/BXOj2KTKLhLI784ofOcSYU9X2bvB8JxUTkXf8oba
         X5CSWs43cS4Yl0yD3uCLA4aP4OJ4JmgdCy9JW1TcoLfy3yidLvyhIFsbWKLbT9m9n2p4
         iQJA==
X-Gm-Message-State: AOJu0YyN9g475eIalQUoYMPXr5M3w/08fCbDjXXVHaPuIPzVhMV9Gn6h
	eTL6D2kYn2Qtd9mwsU/ZmEyFUUUEVM4TW5Pma8Jg/FXGsBiSVMfp19FDlKpTtTRXlo5YSHBeuR6
	DrmLtFWyea0AV0GUpZHjA1MFfW40/gC5At9XOpP+WxTrCO0jAtTNUlFz1ryh0Q95Bc1Ms
X-Gm-Gg: ASbGncv5AIyE5oEN7iDsARdqEPRJ0/lPnCn8cnROcJYBVybSOu7JfpQhENjavPZVx3D
	DENRaBwfTKzb6hKLWkEYjX4FLNQvf776PMto/M8qJobiCK4hmB1MAO4blEtkX+tNuJEQvqZt7l3
	uGAjDwvaqMMG6XYxyQpCQPxvhd0hyp6h5TS2vBJX1wWMFDZ2/7FNKaR0LVMistRJUbe5mFwp7lQ
	RiXijs87qHwV+IlKzxLLParUhdRjO5Vuphpj0jyMxvwvIjnr0vuo92Xm/FgJaUm0wOU6/Lf9RK1
	Nu/RXlo5grdRfDTUw7/DiGbR5swG2Q3dwbT/bzfRkutRveX1U0ag/0u+OIbUwnUY4iBFJlzTqDN
	hJuGveZpGSTZeQTvoHcoRb2ONPF/ssfU5+YvPOjY=
X-Received: by 2002:a17:903:2ec8:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29b6c6f1d7dmr117208395ad.61.1763976369093;
        Mon, 24 Nov 2025 01:26:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL0Aji0TqRSkyUsUgyFYkIRXsgkNDKqDb4CChR/dGgKGO2yJ/tiJxfM1s2zq1jIYw+2WmUXw==
X-Received: by 2002:a17:903:2ec8:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-29b6c6f1d7dmr117208115ad.61.1763976368603;
        Mon, 24 Nov 2025 01:26:08 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b1c2sm128444675ad.81.2025.11.24.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:26:08 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:55:19 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: lemans-ride-common: add additional
 SerDes PHY regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-sgmiieth_serdes_regulator-v1-3-73ae8f9cbe2a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976350; l=914;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oAMGitWIAgfVFPtosAScIxBCMBHgKBga2T/t+cTzfqE=;
 b=V9wP2UHoUmX59aIYgCIuhLtnMyt9fWYCXBzo8KcQrxxZuoik44ltwreFE4ro7M6T89N88ERZq
 n+R6EJVabgvAnwcr14sPpCtygPr/PDQbidvUO5nZgAzo9UgQILYQ7tK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=692424b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WayAn9FBvrSidyY0FQcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _bldq7fB7wHA249kvsxl3oCxN-ZTzjR2
X-Proofpoint-ORIG-GUID: _bldq7fB7wHA249kvsxl3oCxN-ZTzjR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4MiBTYWx0ZWRfX1Q+HBF/SDuLK
 yTmWxoUddRJwzH6rfHXWu+0E14HURh/PpYaow6e66aYACwpsw3X8ITBD0Jr/ld9jiZE+32asFvA
 8BCb4I+ndGrxvkUK1Ur00SdbdWKPLjL0cCVqzqK7gYZOEuuZw7eAiziRcSWr1sX9U9U8X7rL4t8
 rKRo5qIXwpFA4aNAiRJMOMmwQq2bKgpsvKQ47xm4movlB67D8Hjn4d4nAcSLsuuVx52K+QxtXaw
 0ItEuRMjgJJVvWF3IQMGnOT4vm40N7aYq67x1d6D6xTpJ+NQoHOm18vW07uhJcTXU3Wjvo/tDVH
 m7y+bWir4eWbjoxklONogaxHyg8Rg0lOxRurDig4z+AqxbUc9M2htNCphVzpKvKcpzCT1evmk0n
 /3aJD4DwENlU20qBjTTEuU8DZI5DSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240082

Add the additional 0.9V regulators for both of the Qualcomm SerDes PHYs.

Fixes: 5ef26fb8b3ed ("arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..17b5e79036161212f60e9f1f728c1af2448d1b4e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -779,11 +779,15 @@ &qup_uart17_rx {
 
 &serdes0 {
 	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+
 	status = "okay";
 };
 
 &serdes1 {
 	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+
 	status = "okay";
 };
 

-- 
2.34.1



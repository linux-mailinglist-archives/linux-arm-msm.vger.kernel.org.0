Return-Path: <linux-arm-msm+bounces-86363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2671CD9D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40B8431307D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEDC32E3397;
	Tue, 23 Dec 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QuO2ywDs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4nrqK3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4222BDC34
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503573; cv=none; b=DbeyPoTgsnUCMbheYb5I5vbScasi0uNQFAJy5DW0a4hEEF+faiNO5JEyXZW5tt2uNfgpaKMF1JE+FXHZlpLUcft1AKr5Jursq0J8KjdpfnLn1ImmWCf9D+DUaSh5vLMuC/I31yn+vOPbNFfgU+muQW6j52NVUepOLgybCs0hGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503573; c=relaxed/simple;
	bh=xo0vBYPysfUqzUBvWZ0pJL5mQaFLbuz2SApOGCnTdVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Esukfo3EWPaFj+Q1ODX1wiQ2PNdavx3xZZi9IX91HbhK0NNYeRItZOtBSyhouusa6u4+sHWQ5WweNhZPHKQG6BXXzW2Mgh3CA+wM87bjHEq3WKM8iNM3uEWWESTYOKLTpR+gSZV4n/la+QEct2CjhAjYT6yTTzGuwOkrJ7dN62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QuO2ywDs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4nrqK3k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFFgOO1630789
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=60+YVxasInu
	bCv92O19ctca3Y0nZLmCyqoF9EGpIEdM=; b=QuO2ywDsI9CySH/yTRDUyFM0Gn2
	ZXMs1iBssh98m0TRujHFhGpClcK9eN3ec8t6YnNCL+aUqvDpBKEPcYlg0TDTwnd8
	6c1Wv8/l/xpWzoVzuqDO2Nx4E6buwf5KMN69PrmK8AKeeaQ0R0N96HrLEhAqBe4g
	PwedSav6UsUGOAMbJ/aImpkHzD5XLWsH/NOfVBR04ZLS7kvp92GN46+2jBcpr0cC
	xfyqO62H31V864CBC5aDiPoIkHj1WIe8g0gsbS0vTc2t82FRnFfIm5U5D8ZXK+p4
	QBj6/EkQhfV4HSrN0pEpScQjiElNOhoW7eVMiJkbMcnW5LCDXSff67ileaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8k5tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 15:26:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so143653051cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503568; x=1767108368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60+YVxasInubCv92O19ctca3Y0nZLmCyqoF9EGpIEdM=;
        b=X4nrqK3klg955TjYfkYOscJf09xtvBNxV8dpz93OSebfAjpdv14Q6BBhF42ou3Ll6n
         +EE+xxOegnL78z9F3ORBzbvJGZkW0oy+PQkpdXGls6UpA2q0+2smO65235uzEVvv7Ri+
         ulQ4MyVhIFkSq26+k1zXhGC0s+paRTMH26f6jutZ5iYineinZDlEZHwQdv9cg6pladKY
         UtxQJadjS7x2TJLsb131eXEEHpK4piGJM3Ao3XiFLXxzekZXWA0Zlsg4J1Jlo24Kd7W/
         sA41cVT/PBy2wpVrgCvRlTibv94qw8yXPrZ9JbuXEYTcHNJU+Q99ZwuJq12h4W1WphNq
         t0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503568; x=1767108368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60+YVxasInubCv92O19ctca3Y0nZLmCyqoF9EGpIEdM=;
        b=iO6Hst2UeFfg240Xus6Szg+p1N70eho9r/nl0na/FVPJwUt/75BcqqX09zozzoqNyJ
         xOcQHQ4JFSs13f9LP8N5SczZ21CriIV3FRyX0X/EtgSsuKlvBEMkdUVeKQnPviVLiShd
         cZL5lSZUN6I9+k/AKnZ1wxnRofurlcvcWseSNkkn72VbbLSSS77nyyGxglKgrcIXKbLC
         N9Kkk8DEgzf7F2Ett1kL0++wKKyPZAB7LiV+55gki0qh3MV85CuKeOrQQHCKzyGJZbzb
         gnR8R/dVcP4PV0dZfKbOBcqmXGNH7Q8Xho6EOTEBN0tWhFW6DEgzhhn/2g93YMr7yo2E
         FJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUWV+aX/z+4iNKiHnLv2RGA6V4+NmN/V4RJhYIntMrWyyxUyYDO49edR11y5pxKdQALfrk2fT5njoCmEgjn@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLARO1fzAijdBqN8ZsxA9piJZ3+uhWnfy47a38UkRITQrAV4X
	vy+f9U1bncstMP9AZps/FHXwwei4yV99qtwVe52egEuQ3Bp2wtS8CMW+FY/6vMTMxOA7i4dkaOe
	h2sS2Nf3nMVYqriHzwqn+G2zo8Vh0d37hoaHQRF6bEh7ENd+NiqtyQeb4VSerSGSPS1e4
X-Gm-Gg: AY/fxX4T8m1X2vG2eyrwlHZmc8bvQcViK16G9yUVA6Th7EOQJWhouw31rFD6yWBfMEy
	ni3dWjLqg95l0AnW9cDc0eLGrb+qOBytdZTOIEwTbF0+X84Nlq/BuPKf9w7vqpd8xBRedgw55kG
	LvUhbQ387t3fm+/MidJ8YcBSkb/dgfKHZiWOQ3X4Ir7Mhzu95HF2D5CpkLZHgir9UP4JfVMz+fK
	1BzS9Yzes+ek05LRm48l7bIREzcU4djs2rzQYujOJCtWhKWnvKlW4OTFa8apiCPzru4E9uPe2xZ
	Ha1aChs6tbrhUMj5F9uhD+7Dtv6mjjuvyAcouWSqdVl6d7AF2YkwAS/Y/tkTq4uD725TwxcZ1Fm
	DEbSh/ptWWRle8THnOnuhbZPaJadUykbu31pucxhyVJz2d0mHy6H+Pth3D7MM4VIsDP8=
X-Received: by 2002:a05:622a:1f88:b0:4f1:c753:7082 with SMTP id d75a77b69052e-4f4abcdbb45mr216692821cf.26.1766503568609;
        Tue, 23 Dec 2025 07:26:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE0uLDKdZB2oCxVwEKPqqVrjgif/vqd9a8jwpZLLZzFkxFLveD1KZXzkz6Ug0Hs82Kfz4bLA==
X-Received: by 2002:a05:622a:1f88:b0:4f1:c753:7082 with SMTP id d75a77b69052e-4f4abcdbb45mr216692411cf.26.1766503568104;
        Tue, 23 Dec 2025 07:26:08 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm13268409a12.22.2025.12.23.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: Use hyphen in node names
Date: Tue, 23 Dec 2025 16:26:01 +0100
Message-ID: <20251223152559.155703-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xo0vBYPysfUqzUBvWZ0pJL5mQaFLbuz2SApOGCnTdVM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrSIbayp6pYBhtB9X64EKrLtyI75W0Wzh1To9
 RgCjeuByY2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0iAAKCRDBN2bmhouD
 14GFD/9PyZZkjPC06807Wa62CBIr9myNe/UfUtQlyyZHHtvWRpiXpr68IROG1COKnn5J1ST6dJB
 uXI0wFZ0GyuSIj/sYqDfCss8WraRIYy6s7EsvTYqsL2hCwgLCijs1gLKE1S5DCoMecp0v7jtHJV
 B0aC0pKj3JIdJTYoOjetQe5PtXJ/MGS5/fu03bOB6qpS3xEBpYTYpGNat8IBGR8gsjReqWupalF
 ETt3O0p2yYhbf9qE/1DweKBN01G6oSc5MejJCrSViBEVbokH1YlQppcci5cv2OiVBox2Jmy2KPc
 nFmS7Y+VyUaioiZsnkwTg7+moTImdooUS5icrJWIJz7aMdT8OjQXQ/26nSyl51zE1F9qF/mLuPG
 9BBEakeInqG2loe2omn45DNgxFvqIBC2x0n1Zzhk8k3FkO8gSItjjEa+GJ1vYAR3wn4I1wekgGs
 8tXmc2/Cgw87yBzaH93l4//XYZLQALtdunDwUaZxwTulXpqyiqNE8PyyOXfQRPHn203/fAtilb+
 Ln8u/Ti2TNyYd9wS1d8HiNLn00KuODLDroa+2AE0Q8ZvCathMAFhAw7M8V+P7woXGP194sxMW7f
 MWNOFZqyjrUfInmsRlwlZ49Ck8LUTOLvo7E8Ur3mWFi1cyWhnEsXn5U39h7yAWofmVD/K1wxtvM yH7kdLGzW5PoUqg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LWSba4UJTL-ACydm4fUYwUytK7BSK7kO
X-Proofpoint-GUID: LWSba4UJTL-ACydm4fUYwUytK7BSK7kO
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694ab491 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZcZdOxe6BgGqELRYw9UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfXwwmOsrYE6O3R
 wyBUU7kBbyQgOV428k6qlaPoiLtbhXREKCvwTIjOv3yS/pWfmiRrR/SKdjO0A41Y5y1zS4KHeu5
 +TzlqGnrY/Blikd3Z5e7c/FJwdy+MpW2MQ5QmOXltqCxp4LisiLCNGt2Bv1juXI+fXuhG6xLUo3
 ZFTSMvOjlxXMdiwrL6xSZP/GqnHCXYvf8ZRdppxFCjl6G/ACxrc3c3dlKLyWIAEFxGMiKDxAhqs
 xvxuCe+dCPReCfUSigJgw7cVv5nvWJNda/WCMLANMtKzGXulkSCyZ1uWKDfDBpB6VJ5bhl4bwFu
 E6PeXjmnz9qZyWIL5OxSL8l6tgDdqCzgUS1id9+VJR038bnWgKuGPBe4SYQ0RTwkQa9v5bYDgx3
 TdrDcixsKvGWrwC5j6WRaHUv9nWI1I6YdenXnuDkCiXa9I88wA6Ne7PY7ErFm+4m7mYhD0ULSfZ
 ecQ3O9TpkQgHbtjji1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patches done with sed.
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a..e1c8ccceb5ca 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -929,7 +929,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@240c {
+			gpu_speed_bin: gpu-speed-bin@240c {
 				reg = <0x240c 0x1>;
 				bits = <0 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..746e9deba526 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -634,7 +634,7 @@ qfprom: qfprom@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@1a2 {
+			gpu_speed_bin: gpu-speed-bin@1a2 {
 				reg = <0x1a2 0x2>;
 				bits = <5 8>;
 			};
-- 
2.51.0



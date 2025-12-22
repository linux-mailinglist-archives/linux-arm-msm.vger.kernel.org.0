Return-Path: <linux-arm-msm+bounces-86103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F3CD4C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07772303B19E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1326E3242B8;
	Mon, 22 Dec 2025 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0msa+hX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPZPZ3zR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EDF219E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383425; cv=none; b=hj6RIJ/zN7siDKCG4pBndN1VyFn648azd74gcSrjFdzBXXP0bUrsHf4pzbsKJbIFaXLl6EcwdnPEZ1/ko5yXY/Y3dssDu2vg93TBMhBpCscpE4nIDr4IiwvDq629/auh4sAyG/NUAfaHMFJO0aq8Z8853rX8IxbkHyN9JXaKSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383425; c=relaxed/simple;
	bh=msK0TuEP/JpApn2dMeevzdu9ZwAt5ednACbVKZ/f5kQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejquulXWoBA2gdTk8mg+2kdIg2DmWtsVCcmoXM2+N1r3kegjzXyuqppyDTvedSajuJ+0FWQFEdWGjWRUgMitL64tYaKSYXyXvyJuPW588PYnJ3lcu4POxizTccyteJ7z0UKZPeCOU0HMPvVqpaW8ZX0uSKYaCJeFcUbRw/ZeD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0msa+hX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPZPZ3zR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLLEcdU043429
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oYBWLRKtgR5GUmRZy2q3lvFAkDKmsEyHlu3oxM4gzo=; b=S0msa+hX5UtsWxOX
	PzpkQ1G9nP1d7wVrN8wtMFDPkWq+aMlbLXpev3e36b5i49mAA3uTtUi91hxyVabr
	k3slFs5HYvOUi9X87V6zaW3xShE3hn4xg3TKla+nH+R2FLd2Fr+sN7ek752tyedy
	sDiODlrEQlyUVOHXOUcPy3GtMQf2YH0gKahUeeajC38KRBcUgScT0BagK2fOC5Hu
	ItkDX3caYMLNU1+75P1SjKg4VyJ781gUj8aJeuhhsCVetp+7CvSpWXFoI/OuSwPF
	IrI/yd6YLWba7V0ow5E8t5PsAeIhALG/KU/hmZtkakxu/DEwcQRWEbNuxfM0fohP
	wFy3rA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubku6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso3653915b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383421; x=1766988221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oYBWLRKtgR5GUmRZy2q3lvFAkDKmsEyHlu3oxM4gzo=;
        b=KPZPZ3zRdeWGzRv0W7avDSVyKHkjLxKY0xh2LRqaspussSnnSL8iOhvEM0haFOzv6F
         Y6bYQ25dCUXjVjiV+dMPQXv601z9IYojPYyIx8+jAxLzepqwyGdvyT3C64eE0mzJ/voS
         +H495GgXtH+UN/44SavZ9LQAsa4pUOsU2ZoEoYDwNM03IcGDhBRKb/mTRTHsS48fFKxv
         MDoJw+ZtqlYujFndPbXpRnHS10IVtHSaOxpgYONnL/M38tUDZaA+mq3otAp97JzGL403
         uiBrbP/6r6ghK9bT7VJPb2N7Dk8vVOqieDFfIdTkOG2YJgW3znXGn6YEKVSQk78Tm98u
         vedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383421; x=1766988221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8oYBWLRKtgR5GUmRZy2q3lvFAkDKmsEyHlu3oxM4gzo=;
        b=rfO8Zp4xsZibnYHSz2U9w6Mfn/+/SX4qyIPJnEYOlNpogRHrZvM807aa7jEqRpE0dC
         7Uk/3CBIiSIbrMru2JU1f2HwxByokJy/kibhrXfqoPnk4I1oLcgUjqcpjwjzV3BRsWZY
         HPmk3M+qckzVopGUuHDy2MFu8DNDyYzYGOYpnIoaJcy2uFHtB9NoKei/hT7Ibawy6zmj
         lWdKBjkoVPOip/iWpppW9awwyJPBKjJlvw/xzPQBb7hHokRDZV3//qfGGMF5i9I7Ai1y
         lvBcWcFkvdG84Qr6BR0X3aXllfAveMopSXxCyft8vC1clC8iDyvUvTZd79xMky9hg4p4
         dcDg==
X-Gm-Message-State: AOJu0YzBE3h+AYb0T1qWKMpE7DDZ1ZUNMjpyOZpBWhdYS9L2/P3tdJmn
	xiX5dBwO1Kb6bAa0cj7BG4hWNwsxLqXqTCplVyaAMSOhcDqSDsQb/NPSuY+gHI5wbmff4CGp75M
	EylW4oh5wFWP+bBr1xhLvHz5/SY5RhyHCBBh5PZRRt0z66F1XVPPJG7TyMpop3h+Uc759
X-Gm-Gg: AY/fxX7FLZiz+L30UrmEc2E2iCZq9MFZZMoDbRFEcuDpg3NiaPwH/ePk1DjCq7ewkU1
	eNdYrBvo9DJTP0tfrYOijPhMFT4DWjVjrcLtpRL5cu5RpppEO5n7CJ79dCrNwhBJftfHRgXP4ZI
	NPfSQ0YdOfeAr/kaQj5OyzcatxKrANIlw+WdJnZS3ChlLTpXfwOS3aIFxx0oEHfoPOTVAw3KYeB
	FkICPTtK/wlS+6BHzFBNl6Y5/O7YqEYatnt1D7XQzRgU/7PxtOv9aZDjRLUrAyp7yDY5a3Rp3DP
	bqYxfXHXcr75RiWRmzI9nJTbMkkuaJEicunb41/BKLh6QpepjEmui+HJDDasuBlkRMZcfqffslv
	fOryYYa2SVhmMNziDgUYaxXL69j7RlGONCsjUzdvpJcuqbu3eiRZarUf3Sum8lJrYC9IMggMHnL
	I=
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-376a94b9f40mr10230679637.47.1766383421510;
        Sun, 21 Dec 2025 22:03:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKJYBoyMNtBT5Dte36/oKrc3vZ2zhaYD9wtz28QE77DUg421v+i/Yk7bQVy13uqXEQzDpUlA==
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-376a94b9f40mr10230659637.47.1766383421001;
        Sun, 21 Dec 2025 22:03:41 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e769c347asm5846668a91.0.2025.12.21.22.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:40 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
Date: Mon, 22 Dec 2025 14:03:27 +0800
Message-Id: <20251222060335.3485729-2-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX0zfB5f3yZvgR
 sHo9yPBunz43G+27u/+I5eBDfJa/Fgp7OJuvTFzcnPb6zfSWppOD5XP3Se6m81PCAyJe+UucFe2
 wTbhl7fu7pD4QMv1xnC6cN35jfNQFDMs4Rwu+RSDk/hyivozxbOPpNpIeovtxWb6sh4xkaj3Zrl
 zcj1gcMVAVJFENlY8+csEkvQqpddDGHaq6kCAOjo+9ntI+lcwwFkaF3caZrXGq8Wt9Wxon5wBZ5
 cryNG+j+/yzrskAwl6otrGoORm2KnwAXlEHiss8w4eI9cKJVzPcXN9Zj9WLWnFtBMEeeC7yYkkV
 nwrTXrkKfWxqrwj8aE84mwufxa2uXplFEsefTRnWAlxfqWLzn6FvR1FAQHh0gtqQ1+KhNLEbqys
 suh4totjR4tIxywGZeI7BD860+cF/Z5e6+R/sYKLWW0PyanUzGjzZbaQy9ZHsQ4vbFsUN8alnbT
 vZ8EaZdPgCKUkYTWxGQ==
X-Proofpoint-GUID: ObHhpzxPSuc5lYRPKd3FmDWGMqn_3YTT
X-Proofpoint-ORIG-GUID: ObHhpzxPSuc5lYRPKd3FmDWGMqn_3YTT
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=6948df3e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x-iFITsqBy0uP5guFPEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220052

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the device tree bindings for the PURWA-IOT-EVK board, which
uses the Qualcomm X1P42100 SoC. Split the common parts of the SoM and
carrier boards for HAMOA and PURWA into separate files for better
modularity.

Introduce the IQ-X-IOT series here, as both HAMOA and PURWA belong to
Qualcomm’s IQ-X family. For more details on IQ-X series, see:
https://www.qualcomm.com/internet-of-things/products/iq-x-series

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..5797bbfac9a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,12 @@ properties:
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,purwa-iot-evk
+          - const: qcom,purwa-iot-som
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa-lcd
-- 
2.34.1



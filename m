Return-Path: <linux-arm-msm+bounces-75236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84422BA25EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497EC189807E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 04:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD7C26F2AB;
	Fri, 26 Sep 2025 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWdO75of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571F1D6187
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758859829; cv=none; b=fivymKiWKpusXWFnLZlaDjIn2d9AWelLO7ZTaRyLIRwI1XOuL7d8KBAQAQtUFs3LUV0hfxVpOB5XZSuCgK+GABkGl5mzenj+hNm35Db7pj6T3DmuxDzOkqcW6j9ojcDy8iqZr9RlAbx+FxepvabCZ6n2yubb8/KLqIBsi0jxxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758859829; c=relaxed/simple;
	bh=yzczHhkeSpEdjWbQI+EgGiX8wxKMnYTmSWUOCcyMY9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LvfzYA8Qlq5qT3YlcN7JoZihsVy74jE6xPrlW3jSpjkXrfmTLjYzXiLxMD3Ed7QVT/MYEf2XhS624Z1UTAjRawVUEkDyogpGtK5yYwJIkWNETe+etBit4Tn+WjJed6i4O4zlnVRLdDfzz0qkgULWCUzQMKraM0daZw6Z7XpDQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWdO75of; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPo3V000861
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fVb+AbPCutZRLVQIm9bnMr
	NnzFAmWf0vDFzFMdHcE6I=; b=XWdO75of1T1SQhThPq8lepw9CkIrWTwFTgxeyH
	kYQCHJl+lKBlHzUs3YprGJRMfpKaZygkqM/bc/EBz2TJQjGum23I20aeum02g4pE
	usYdD8LkJG2EikUmcSQRGYIqvtGXDJSS2rKFIjVisC5/M6NgVBVQKz61HjRjnP+2
	K1QE2kD/O3ywEeVTfZ5rmuOcztPpnZW+ylxXglgch3PeI5Stk7oZVw0PCWHzxVwr
	erMXRUOH1gHtXJ2l2yPspF4MppK6HeyxDCL3ZmABwTWe61Z+psngx0l7C3jKKHvI
	B8Gp+hWEfNxeVnYvgauwMzl/3alb/IbOZJYkJg5l6HLGJFAQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tsasv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:10:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so2820925a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859825; x=1759464625;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVb+AbPCutZRLVQIm9bnMrNnzFAmWf0vDFzFMdHcE6I=;
        b=f9w9OKsvZuZs1ukQ2z29gu5/icktPUN8eWdq2HvWgD/sfSyKDELTHqaN5TWsVXE8EE
         au9IL+XKipi9EOU3iFhosC5wxBObTpkotnGuJed1ekSDvOalhoFuiDVl/AvioPoh6NV5
         tufpP9qCe4iIt4OaU58F3oCWF6pbQqv8sci+d04FD5eo2J35LrMPz2As491tuzuQoshL
         7uTbZvjtNHfcH843PiT1v6aHecFZhUIzgz8txaya8dMYcQNAsbvdjl+9meVHfjI8c3i3
         pPszSEkaCT1bibTsHvbkZ2qYz02Zl2Csme/JrPtSl4wpxO0vbE5Q2VbFH8H8/7O87GKT
         MWFg==
X-Forwarded-Encrypted: i=1; AJvYcCX+AjD1UuKzsNO72+0aeCeTiSK/cAz1Kw5eUnlbAD4liBdHT7lf1a3MA+lW0DDigGNkY8H36id8WfH8vRVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/NmhUtWEzuwLkKfqpm/b9Fzuueld8qCg/isofPPvbqriCjFj
	q3JyBZH//fgmUAmthMkgbu1bhF8WerSl76TDLJRdulD0SV+tcskqDYGfjyc5MezQypCeVz7bVaU
	FI5jyGUTaZIedxUQicraJaQh8j+ur0LCc1wcEUzNKPrGNRJypi6hF1ElnsGCafiG82DVE
X-Gm-Gg: ASbGncsa76BBanoC9FopOu+ObnTFE3RH9i8hv3R4Vda81KX5IdSRv+q7iRqDkh60YF/
	80ZqxD1FwaOvFsL9Mm7vizWcR3uVdIRHU/YK7/ZsGj5Hyfy2uy4PmM2mxxX4SSCy0JtBMq0SfdQ
	e0mhSRrckiYXV10e6EABPsDm9ByArNotq1NfVG2QbXavutqLCrmccmmFXGXBV+a0TfcxmiI1gb4
	k8NbuowP9sZW9QorViBxYbTo5jp3EDSujuzRHHZvZjzMMtJ2vFAC1lKHng8WcY3cSaQIP9RK1G/
	hf2yjoX/hreWl9v0czXHbpPDCJ+xDc20Li7lmGpf0SBCe8QsPnEX+6gTzaHRCEZVSBydNYGMlg=
	=
X-Received: by 2002:a17:90b:3ecd:b0:332:3d8c:eca9 with SMTP id 98e67ed59e1d1-3342a306b4cmr8030207a91.33.1758859825193;
        Thu, 25 Sep 2025 21:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH2pTc5OfdrAzvz37KW4lSHAkarGZabrpZ1vlaHE8LgJgWIcJCAKIAO9O5nvxCixAj4XdS/A==
X-Received: by 2002:a17:90b:3ecd:b0:332:3d8c:eca9 with SMTP id 98e67ed59e1d1-3342a306b4cmr8030166a91.33.1758859824749;
        Thu, 25 Sep 2025 21:10:24 -0700 (PDT)
Received: from cbsp-sz01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda15a6sm7455239a91.10.2025.09.25.21.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:10:24 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:09:27 +0800
Subject: [PATCH] arm64: dts: qcom: qcs8300: pmic: Remove 'allow-set-time'
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-remove-rtc-allow-set-time-v1-1-76895a666939@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPcR1mgC/y2NQQrCMBBFrxJm7UCsVEyvIl0kcaIDTaKTWAuld
 zdYl+/Df2+FQsJUYFArCM1cOKcGx4MC/7DpTsi3xtDprtemO6NQzDOhVI92mvIHC1WsHAlDcMG
 aizYn7aD9n0KBl5/7Ou4s9Hq3RN1HcLYQ+hwj10ElWir+Mz2M2/YFV98DKZwAAAA=
X-Change-ID: 20250926-remove-rtc-allow-set-time-ffbfa980930b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758859820; l=1003;
 i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=yzczHhkeSpEdjWbQI+EgGiX8wxKMnYTmSWUOCcyMY9I=;
 b=5ggYwmxE3npQ/BeDf7eaVNnjMHQTZenmKPEJNFWKS6JS6SUkXId5LcUGOusHaxWTTShunLlTU
 9nWCTfmD7HVC6tjNQnmF6LuJEg0OdqQ0Z2iB8HOcGt3yJrOz8bJQpGv
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d61232 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qwOtTkZhaZOgDaMejNkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WSlRyXHyGao6RZzeRJ0Y1cMt4Y_KDt5u
X-Proofpoint-ORIG-GUID: WSlRyXHyGao6RZzeRJ0Y1cMt4Y_KDt5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3U1RPVCDIZJk
 d1SB0LZME8KI2EQP7DagPe/rtwsIx8LNaK31aBMarw8OOCCZlAYXgstOpIY1KP4ZyBLrot0MHPZ
 Q8hoLjBG0sqzYuX3s5YGr6z2mSaSFjk87Frsflc/wziw8FZINSUuxPBw5B6bOK1M9y+3wHlC0LX
 4cIfRe36g5YPY7C5BYDqLqy+rl0CCqTIDpxZ09xAB0RJk0P0Xp4tuHqBXAqBOaln99J2KnR64Mb
 4uNSKzt9a9NKSO3LZLjpxockZXhsATcM5PsQuQ/8a3AHgjrKGppR5ihcJ42JMYLXKPRzL/d03DN
 ey8irj8+toPcTbMH4AZJ/HXqUFLvritWvJed6H6sRFOwNzhuIDChX5iC9mizIZSRHfXSiz71c+z
 BDx7nB3QCNa3XMIaPQY2yk35hHgbtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Remove the 'allow-set-time' property from the rtc node because APPS
is prohibited from setting the hardware RTC time.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi b/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
index a94b0bfa98dc39e41d1a0de3373753953609b95c..e990d7367719beaa9e0cea87d9c183ae18c3ebc8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
@@ -18,7 +18,6 @@ pmm8620au_0_rtc: rtc@6100 {
 			reg = <0x6100>, <0x6200>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
-			allow-set-time;
 		};
 
 		pmm8620au_0_gpios: gpio@8800 {

---
base-commit: ca9c6709e594e040535540a41b89baf6437672ba
change-id: 20250926-remove-rtc-allow-set-time-ffbfa980930b

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>



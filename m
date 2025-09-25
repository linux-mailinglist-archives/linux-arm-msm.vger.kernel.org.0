Return-Path: <linux-arm-msm+bounces-74995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F2B9DEA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9378D1B2622A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889DD24167A;
	Thu, 25 Sep 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A54ecc7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E3246766
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786520; cv=none; b=B02VCLR6nshay1Kq5AasWqSm8s7GZWHxiGdZHniPSZAkFTOZB8ZCbHfKs9FCOASszZu6/y6N9Mb3t/pFUUPbpvFjb2rWnHZYnw6QkX/1kfg+wHlc6b8JVAxz9dv1VFQHZ3h2ipOkMq4MWSVAyThs9IfmSgR5o/wbFsiq4QZ41eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786520; c=relaxed/simple;
	bh=kz8AhvRoxv5DfLNMb3yysS74jj5lUiwIoMBErv8uovc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ot9LzMh6dhb4vujuug0159iooCci43twhaew3lzILcFiAjK0Mx/LjTTYk0ZACWFDj+95LLwZ1Fy3WI2nrXdCzTCELnZHFX+sNY53qxbE2hNQ0iCxyoSH6Z5paslPgHOJkKWsvZDpq15qrpEOjlLsdBLhJKzfSyAq849AqZ0iiQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A54ecc7i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONvBcW023770
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t4DS4g/Aw4p9+wY0COWtzd
	LqmJu6dcvqt1gLW1rsNW8=; b=A54ecc7iIrfKN8frrBC1E8WDuvKRZCtm5kCYju
	FJFwXpG5MDTe0pUy/Ni22/r037WLxwba3/NTP9HQIh2zKej15dLMiCYEhrsuBECT
	lS/HT9q8TsZsAuNG3GFJqHxmZLtQPp9ibOojVlapjHt3Gy2TUWEAD6+RSgZdBm+q
	3luLt5jMhHgT4nCEYQTJWroEg6cJzONAYSVX9sk7FJ8qs7wbdKQzKk2gCn4tLUpj
	la4xW4UMXCgrOEU25GH3Nm+rs9Q56byo9NVgCTfJJ4YYibj+F/qlk8ebRhdXchrm
	L+nqnVeh31QL4zzZgBbBU/7KpEwBjzd2G4LN/vu2e51sfqlw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e98n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:48:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f914b5a4so784955b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786516; x=1759391316;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4DS4g/Aw4p9+wY0COWtzdLqmJu6dcvqt1gLW1rsNW8=;
        b=h7l6miDkIrzfCp5DnZBTSfXMHzMxdMa2R/jVsLsnFcFeUMs7QF2MncB87TlVVLHYeV
         8zQEX8MlamYzLI1hpBx74GV/MFoJymu2/cNqSZ4xWBu+A24+npUBLTBuaY9lL2rAK4+n
         XBTfsuIgduaXk7y7fqUH6f9Xz191qnCoBn7a50XO9YfetID5YzLg32xXM/S3Ti+joNAg
         3a9fWbc9oD/x63Nmh2+ltDpVn37z6krCqcudSqxOltsrS/UNve6eb8ooyMRjO7Qa3nOg
         NW11tpHoj4B5ANF8Bn4pWQQGN317z2bHZGZItj4mIOXejx9zg0BqK+rqZDu5CWtCoJez
         NT/g==
X-Gm-Message-State: AOJu0Yw/9exUosWeJEFH0O649JMLwBjZZ0tyRHyiRA4mEv1bx6hQskvs
	UewRbzoPI3/vFr4EEUaGCP57H4Yl5YVPdl22DAvilHGSopoqQUMtjYQxbm125cGdAffUejkssZg
	5Q13F2zuLQy6Hel/iLwDMpfN4EPah6fzHvpj/3nxzEUkRtpn0+O5SL6jMWARwchWv1JFV
X-Gm-Gg: ASbGnctf/sNSSTBhOdEqtqhZMnhorZviRNYdRi8eoKXbHqKHrfyNFYkN6JikU6j0bLJ
	WvD9BkwHE6YdoBSeJ32LKUU3Dt6a1kmClAVImh3j8j6sBgOq1CdzrG+cJCQfE7Dl+7cG0HkwxlW
	XQL2sV3Aw3Y1tKOd6AOPWr1gFYpspbcbEuc1wPbsN00ODLaI/2qX2v90FOGhIZS2V+glQlnjjrm
	c0a8I40EqE2vj/aw6Zg9S7nuE5Ih8sxqT8OSKIHSDPfOIUhWlvcFUSssxwDu2uXXZvh+3+mfFCu
	ptKaFaRK5fMjgRYlHaFtowfpZcQCq8051jjllM0IduIjjnNfI6MrnhV9cDMLK9BeFgz1c4oREQ=
	=
X-Received: by 2002:a05:6a21:328f:b0:244:3a85:cd7c with SMTP id adf61e73a8af0-2e7bf47c149mr3190235637.10.1758786516491;
        Thu, 25 Sep 2025 00:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC9M2BzjYTN1XPbvEUL80XC19PxiMlS3DyAurda1UfSKIrYxvl4PtOHp7rKLinnx0E0Otp7w==
X-Received: by 2002:a05:6a21:328f:b0:244:3a85:cd7c with SMTP id adf61e73a8af0-2e7bf47c149mr3190214637.10.1758786516079;
        Thu, 25 Sep 2025 00:48:36 -0700 (PDT)
Received: from cbsp-sz01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023ca296sm1209518b3a.38.2025.09.25.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:48:35 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:48:06 +0800
Subject: [PATCH] arm64: dts: qcom: lemans: pmic: enable rtc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-rtc-for-lemans-v1-1-17fc56451c84@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALfz1GgC/y3MQQrCMBCF4auEWTsQ0yrYq0gX6WSqAybRSZRC6
 d0N1uX/4H0rFFbhAoNZQfkjRXJqcTwYoLtPN0YJrcFZd7IX16MPAbUSzlnxwdGngsRh6vjcWeo
 J2vGpPMvyQ6/j3sqvd7PrPsLkCyPlGKUOJvFS8e93MG7bF1BAsr2VAAAA
X-Change-ID: 20250924-add-rtc-for-lemans-cedb3e630c4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758786511; l=1098;
 i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=kz8AhvRoxv5DfLNMb3yysS74jj5lUiwIoMBErv8uovc=;
 b=dVdVUOE3ajtl4HqTD/3n77q1GENbi+6wzPD480EffVNQiKPp5G2NdIeSn0+XIc692ldBJfiGa
 9NbQ5CgvNdtCJp2U0CHgeBLc34QT65Ac9bKcx8IA7N3BUBHuDZB7dVu
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4f3d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=C6FE1wmIh1dHcrcE-zYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: F4megmEgCW5sClMzyjG2himguHKy7YDj
X-Proofpoint-ORIG-GUID: F4megmEgCW5sClMzyjG2himguHKy7YDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX6DgveRP/9zdi
 feb0FgS76hQshsxIh/9aAQBKMzhXrVEYnZIcAM6jRdS8yCJulviUGosBmcl+1jW7B37C2MHku2I
 YL7oZ85nFOM0GJ0TufZKge2GJ4e/S0gIIVZWmRFdtervNTlAX0HwvPvtiWV8wQZE/tgIxHa4ZCk
 wwFdtcKsuOQdXVBS2JXpwRn1GA1/vRSDk2isO2RpgR12jpcrjORMEBd0byGCYnxje0qRwCcnwWX
 ih7oq7SjyP9Lk6aeDQFvbW/fPSV9SeDFGJxmsiaVFTIxTHtNGhuvy1rEdA+eM0atLyxj+2KL4mW
 9i6jpVrMV6L8oWvALKa1xrRvljs9LvYiVLEnzY5eJp7/k+hb7p58zZCYsM/TaAO412XNFddkEIT
 R+Qpfjw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

Add RTC node, the RTC is controlled by PMIC device via spmi bus.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..9e0d05c1b39ce229d5d4310ea1df1bf02e689178 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -132,6 +132,13 @@ pmm8654au_0_pon_resin: resin {
 			};
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

---
base-commit: 8f458a3ce73750c16af26aa154becb22bdf3bb0b
change-id: 20250924-add-rtc-for-lemans-cedb3e630c4c

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>



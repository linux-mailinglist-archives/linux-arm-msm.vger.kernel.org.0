Return-Path: <linux-arm-msm+bounces-72503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB1B486AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5263A189E632
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D596A2EBB89;
	Mon,  8 Sep 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2jwmYEW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA02F83C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319657; cv=none; b=iKrtf1vZv9zz9IWlQijUXUtpUgKp0G0xYiWHlGOfI1sI91wOQAjVpqRHxAFd/KxqqS6WPdyK3+Oik7LBAg10nXEszjYfKe6urCRQqwmQQ9jNSTaHQsBkWynye/IlgZv7ndhEQpxXjcEw/K8sdrolHbnVATtvsH1YCXR04VQJ2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319657; c=relaxed/simple;
	bh=cotqZe/TypYCRpLbOPE/9IjMIc2Y2Wh9oNHbNZUjKPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=roFC5GvWr6tJgYAtwuWWuUthpjJC2BmDpiBCyX7tCe7sZ7fb//FSE4PkViYyN/JVj43aLb8c48GzU1xYcKb2rzZKuTb49z2XJtWnBxeONMCE+wW+tAIGA3kKinJaULk9KOGeEm1jKhqHKbTgU2MZJFu5UdguHDKcF9b9/GVTlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2jwmYEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fGAn004649
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4bmDMlAr83kjarbdQPNXRMSEkAQzuB9YOir31juD80=; b=H2jwmYEW+6r92U+c
	GmPIboeDPPjxrUppFgloJAfbhyVZPseVy8v4n1DCdAVUpIg9f/9DDA9+VPyns2Ze
	WEsBsvYViq4rE5Y94rdN0lcFaT7RDt532FaVds55186NQSRityBvQsMGsSofxxE7
	hb9yxAql7OsfAg/6AGeabhwUhS76weTuqVS6ibLA7xIC9HCsx7Vs2Jv3ANveh62+
	hMr+/MKHuko4Vhb8Ymw78JivIMkJe1AinqgiE1YyCDiXd4Coq2w0eU3r+Aj6Hojq
	zpyZhGTyr4tss9hLA+8zp9jBrR0cL9CYASrhTkHdXfPNLk4cBvLoeBdGICbV6xFR
	e+w6ww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r94r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:20:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581953b8so46333385ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319655; x=1757924455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4bmDMlAr83kjarbdQPNXRMSEkAQzuB9YOir31juD80=;
        b=Z7vffQdj1EgGDOWanh/jh6U7RdWHo5KAtBPee0gExVT8MGZRRlUm36JzFd0cbavv33
         6Md1JpW609ah29VlxunMcODyvBQKE2iGdPvt+zSQJAUgaL2L0a6/l8gWVHl1m7zGyuh9
         pWw5g1EBh2KC6IhOfm+h+ZiGhTpk3OTPlTx2drUqGsviOtZyXrICYJdnFsJvV7kCmT4t
         kOtBJhemvAdUesw19WZv69Oxv0Y1QDViq1cPUFL76PWt/wOdck5/ZmaUR20iEcijZcL1
         91f4ovv9tzsM7wsNjXCi5UTs2kOrn0JZJ/ia9mFQ9IRm3IFrS/xIDTX6qcvc8G8KYEts
         yXgA==
X-Forwarded-Encrypted: i=1; AJvYcCXYFFMXaMKVARZMzbsVK7oFqWh7Q6D76QGnm2Q+azOyOYla/cMTMsucET8Ict73Qtm3bCY1wDEU1Z3yHNSr@vger.kernel.org
X-Gm-Message-State: AOJu0Yybf6drJAF32Jr6hpYEKHuLmhsrpVREmF59pxSo3/SmVpJefWZ9
	IwogAQ2jSutHN34Ocp+aiMO0nPpw+GULsNpGGocUCjGJYCO3vtUszOVIanjSZsc1YoFFlgJRUMZ
	8wvRPqPkx2JgON+r5Z14IZiu16Pp7KdBMNtHP2E+i1p4Z9XR/tE05ojVBrIujMOm7QFw2
X-Gm-Gg: ASbGncuSro7ZeBiEMRdNp76rw9PEaqfwxXJxLAmn8D3Kh2FNCp/hukA/sPZSonnaAif
	tD8uvLnRXMIRORlypkK0HmZEeQz2E5EoWv0IA8sIDkXuc2uNWRzTDt53JoP6oumbaqk1ZVDLzIW
	TI9fevQyb3tZ81DflPT5HfHmWjgxH4fdtboZa6qjW9G6dTYfcdblNKwTH+XLq5HcWUvWzX+0A9C
	yRXzFpIxX+wIdo8AccM+a6qZrXHqDnA6gXTzzGFGl62JHMXiU/lr3WuzME97CZ7v5CeoR4yS9jg
	goxGD7OZqPAh9MFlPpPPvXB3byffGPopU5FDdyDgbmRxU749bJNG67GdHpUladW/UDFd
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115481845ad.11.1757319654859;
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyKAv1bm1x/8ViIApnewyx6A0HUi/joPZbuM8m6VoLS1sL3/lRwAVXdrizwiz8S6y8u+V/jA==
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115481485ad.11.1757319654435;
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:59 +0530
Subject: [PATCH v4 09/14] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-9-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=926;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=enf8ibRVGnvRD27V5ouRqt4BCtLlEPGBzdF16+U0RIU=;
 b=siHIL7dGkdoLax4tSZ1agBwc5p8Bm6n1mgWA8Fz6wVawE1GVJ/QdPpLOpJ3pOZ8rv8wJrb+DV
 Dn0nCGS0NTQAO5Y3DF8sc22/5YO/7sMSWAgbZM8dKx2sO+6KSU1sPxV
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: Yqx22nyQamwhZv_CdFAxA3E_dVzS5Xw8
X-Proofpoint-GUID: Yqx22nyQamwhZv_CdFAxA3E_dVzS5Xw8
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be91e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9guL5b7EFFMc6jyTlUkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXw32avXz45gXo
 I8WYhuQknngeOcDxVYhxXD1uuZrEzMM2Wq/BmWgNqIKMiYTLOQDxqYVLXSiueYALBiBOqVMa2e+
 wlRtV6fIlqdv3izXd14OBIHtdMFC5c6i7XAQWFkFrpn/YM1cwnSM6Lnr8PfAJe2xGx5922WPHao
 YrLNFnPK22ZP4OYOTqa7x7LNqyzj7maNNtU+ad7xdohdJCUs5KwP4BWdqPAr27pwcB36SgJYTwT
 FbnH1MKWqeO6WPH6euMgxlJvLUa9xwVdzqHCTFVrGn4FHAaNz3lBETaEafEf+IDQ4hbW94Oz9r/
 vJhLQOJrq8wWrEwphesG/QRw24cB9ZFkjwOUc27Thak7U8bNNtHaFAPEOc4Sn7jv27M35w6sNPl
 fs5Wyzis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

From: Vikash Garodia <quic_vgarodia@quicinc.com>

Enable the Iris video codec accelerator on the Lemans EVK board
and reference the appropriate firmware required for its operation.
This allows hardware-accelerated video encoding and decoding using
the Iris codec engine.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 1ae3a2a0f6d9..d065528404c0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -333,6 +333,12 @@ nvmem-layout {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0



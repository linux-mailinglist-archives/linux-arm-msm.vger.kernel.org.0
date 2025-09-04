Return-Path: <linux-arm-msm+bounces-72099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E3B4432F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB93483EDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF5D3112C3;
	Thu,  4 Sep 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Omn7tnLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8D30F7E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003984; cv=none; b=NqtorIc3eKCtKDqhKMODPBwfggCbYKiPOvtqNDMprTpSkVEB1IFeLuROlPMKY4IaxdzuWPbHlyg9AwgcEUAAJw2/5lKmEIUstPxSB/4HQ0p5qigk85QqzmlrTYMP0rlId01Ar2MjgZUXwUnL98RhbHkZmVe7v0ToisxiZcz+sbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003984; c=relaxed/simple;
	bh=E1O6rOzv0lZ191I1uujSCw4U/Q2xdbO4Vs5JwqnUhcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMltsRj+zlMejIFafqkfSWXvQW41GCA2vz3XR5KLwmQGEFpawpKvtjk2kkcwcu8ZYKjILEERohbqERBPtj2HD6naXv+/eENd+uOE00Ifjmi8roUspEAfDHPEJm7I9B8xshxfQw/4I7psRYjqrbiWcRBE8xLx2MHu7cLYEBCaH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Omn7tnLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9hh007610
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CDpMGCSL5nkDXYqAdlOX/gM6pgktfLiD45yNmYWQxcg=; b=Omn7tnLf2fBYQ4qE
	OKmXW1LUnidhR3J+UQ25TvaidI8FZfGn4L4VeoUpxFcJJx0Gj+jLKm6SOleCHj7+
	TuL/7owoEtaVqFMuHssLoF+mrlNQmsQ/gszgSkqaFzjf4N0t7lPSeiIA6AtbZz1U
	fsbLPRd7tqymq1KyKD5pIPGwXU9Es773o+tjgacJqpRxodSMJhM/fYCSnYIgyobk
	EQWQofV8a5fqqiHRaUpNs7/9M4VAH2jssGfQNVRr3wG+mRXpNX573gICmxBqNRlV
	0vXqH0QC1LBkpq8yspe4M83Mm8b+IaTpHjLGchiHe6Jn0k7SlTwBiS53jwqQh9P7
	vTukVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura903x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:39:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4e63a34f3fso931507a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003981; x=1757608781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDpMGCSL5nkDXYqAdlOX/gM6pgktfLiD45yNmYWQxcg=;
        b=ANDCOEkrIn1+NhGIyzarfdvuitK1OANvNmZiYm2zxep/DPuU+fLRkKFQWcGWjHVJsR
         hOj623q4BaH4mJvNkdAdyScB/VDHVn/RQIALS1UIuHE98hGqkWq+mERV1fFcDMwJBOfh
         wfhtS58xIdnUwHYVG32Qd48zub8GiS6C5Oo128iq0MEyxwzD3E8m2KBci2F14MUG4B2l
         lVOd95QX6/fh7ngKruoDUox9uwL/JGWa7/3GFItDbQz7GsezFrwTppYtGz/haqdW67TC
         NBxdkU6vSXmRLMvjX2TIH0O/7NaAI+9SDie51D+nr9p17A281XyNT4FNuG2mtL3k+CzJ
         LKXA==
X-Forwarded-Encrypted: i=1; AJvYcCW71u9W4zBPt/7DJCEctZusAz41Zlm/f97Uk5YV/ifB2Jas+3xOcRx5Jo90VEpcnjH8N9YQ4B9wQEPbx28F@vger.kernel.org
X-Gm-Message-State: AOJu0YzNF79h4U6duQJ5bccZlGxPg+imClGxRRcAutw5AWVD5U9gp5fS
	Sds/bCmugh+YAFRqwmpOQXApOjAXkeTuJspxZR8qTcMUz86zLNzbJ0Poc09KDudj3qKArdusBKN
	hcR/JWkYlRhfL6YfKt1DKScZjcTsay7815paDDk7KTsrQw78X22RMCuIEB2Ot4T7v1DK3
X-Gm-Gg: ASbGncuV9cSJ2ZQodxZO67DEKmubr4CAbDM/FTUvv91L68BYeupTIdpVExuJ3zE8lcV
	ZDHLbDa9dCSqZb2L8p4W8sIoIJtL7i+bj27i4kyjJRueQj7QUSosWQyIjTbNZxo6mV8cQtp4zyw
	j5ioSUy31vxNMBZ8ZYpzxMdWIS7QRzysxA/wtTfmMp5qAqPvQ8AM59bedu4vGenrHN8drXdA5V7
	4kuV16HBNCXdYfZHKGcsiePBDUADo4iJR0n2EAODczjsV3i7VoXZ75M0fDIRtLcu9nCsvuTej0d
	uoU9941pu0sAqNOLSeQyCuABJ10MQPVHiwuQfagEBzfCmhkRERI7fU5w/jA3U1uSoQ5c
X-Received: by 2002:a05:6a21:9990:b0:24c:a32b:3235 with SMTP id adf61e73a8af0-24ca32b3545mr2764107637.47.1757003980502;
        Thu, 04 Sep 2025 09:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPha85n2iNFgSPsnAlm8leQ1tQQ/9MzM1wGVWoNdLxC6N6B3n1oZzAjUru6wb3vf1yNeqJTQ==
X-Received: by 2002:a05:6a21:9990:b0:24c:a32b:3235 with SMTP id adf61e73a8af0-24ca32b3545mr2764060637.47.1757003979995;
        Thu, 04 Sep 2025 09:39:39 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:39 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:00 +0530
Subject: [PATCH v3 04/14] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-4-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1246;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=KCMCr6yvyYTCxPTT039B/teImKPmXb9UNZkMYvy7EJk=;
 b=JpY4zDHyUFQo5X8IN54NMq0eLmnWrs5hwlmxAS3hLkb6nKOEniF9NgXSufodHaO0Qsu2vQrG6
 OqsYrSskXMHCf/9/DYP8Ug30KwWOixpZfJwIzxOa2WJHEDtTgg2vwUx
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: Bv-UYFUqW8Cb0B1x8Vtb9iZu9oTcYJ9-
X-Proofpoint-GUID: Bv-UYFUqW8Cb0B1x8Vtb9iZu9oTcYJ9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXycSwC56Wya7I
 pa3cR5ZdZEQJ4XReozpBYvlBUl8+NyuNbURp6p5bQSJMV0kmoy4BchThln0Ysjvc65KLlHyE0gw
 p/R+T4/5L8O6wEYPnRtXtvuza/s8dEie0v+JB7bpk1gdK5pwuVnfXV1hn7PeCLhesRZm5bRjlCp
 ZyC/k0Sj98xn+Ri1VhAIthj/6M84ovO4VlubwjVUFMUO2hLiM0zLmg/XPATpfik5OO0jZ+ukRp7
 0OKwqy2QA3UBddS3u0aG76nG3RfsPjchSdRKWE4MpQZrGc2qSa3Vn+V95ZIm6RNUyf1Y3pMpalT
 d7N4d3BnL3vwtCsljw5dZIfwZmrxQiPxb/iMCDKr+plpSxpOyKRLMYzunKP8qwvwjcD9tAptMOp
 /h76Wky9
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b9c0ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=itmwO_cg3X_j9a1xKB8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 56aaad39bb59..c48cb4267b72 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -289,6 +289,38 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0



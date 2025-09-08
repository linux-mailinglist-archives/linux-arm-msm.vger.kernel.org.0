Return-Path: <linux-arm-msm+bounces-72496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAFB4868A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DAD1189DA8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00A92EBDF4;
	Mon,  8 Sep 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hz7rxv8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1032EB868
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319624; cv=none; b=bBTGYlM84xoM/TZy1pr/KhzVQ6U10cK/wjAwJnyt/yf8NNX9bFgUmZnVowOfZfpxVNVvuCiZNTpeDMigcToy5HJTBNZ27qZe3zdLGi2nKXMAtdQr3z6yoVqnsk/FDtmX0H2N9oPoTrVSIhynDyFa709WkiIA+aDRYCBtDs9fCEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319624; c=relaxed/simple;
	bh=orOKlPtQLn5AGPhNEQlHkVZYfkJ9hhPyxvhObhS2CkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n15/UGEdWNIIcYH7mnz1jE5kE845/8xvPboDA3lGgdaU15BZmaSOOvZ9ui/OrnYDg7d3yK4G4HZNIILYfRb+TYLYqsvzuak4gqY9tgVoYrNR8FL5LlBz+u+ziQ75sgxOguwN0iXVIkhuo/rrxSoz86oBfLgv3tWDM0BwNSdi744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hz7rxv8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Jh4N8008832
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uiQp9Gtm65Pdl4W6k0WxVxnFve96qzLdksXdOVeH1VU=; b=Hz7rxv8mmA3JvVJV
	CS3ADwafbY16xoZwLnciGXlSLw+pIRijKLqJ824/Cu2xMrLwLTsAh3PUAUqg2V/S
	r0uC3UEkkYOc9Lr77+YbRnzyAOCTAKHQgTPboFwUUpa3eI8errnpSXlIkv5KjnEv
	LtTkq4sbyTvIigTM+RJeMlOaIIGFkF43z43iA+Z7viP/3PWufYo21sV3Fcy9YPgA
	fEgXoNrgoa47Qoh7/NnOWPnNc+0jL78ZcRtkWorA9wcVIYwjCamN0pDe0wh+JRjN
	Ou4tWX4YKhdqKGQYeOVCKJ9Oh9ys9wuEFuBzDyWSV9IkG6yKKn80rgOu2odBp+R2
	yKvv+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0ktax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:20:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25177b75e38so19421335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319615; x=1757924415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiQp9Gtm65Pdl4W6k0WxVxnFve96qzLdksXdOVeH1VU=;
        b=iAPcTaHn0V3Lrig9VRNV6qyO2vC71veZQO8udsW08DSoZpNmLYMsjg8uMxYg4z700k
         AwOS42akK7fJDxV9B6XfqAG771cYBHD6Judb64zPJf/rYxDXGQN6o4JK2Kgwku7lI2IE
         ssHisPpAIKK+IUBuup3CIIuXqam9h83wcaG0t+ZvfW0RNLu4zR91pgNw+vEfzkd/DGFN
         YmX9zfjDGgs3586Bw4u0aBk03X6dtT2m7EpOCHIeLo/WP/4/TzWVQ8FIBuVqeFod7qMb
         3GZYEtKTzku4oSTGnrWXeRcl7kMh5DS+PR/4QhXyDOkhdckARHv0KOuGaA9ctp5RP7h1
         VEvg==
X-Forwarded-Encrypted: i=1; AJvYcCVr5+a4JuDKwdgyVxVDKXnaTY7AL6CeZ/k4fwnTIaYDisdR8WmL3MdWVGICYChBkPlN4LTnP8B1eOv0bNjA@vger.kernel.org
X-Gm-Message-State: AOJu0YyZU2r4LiqHTJHQqC2eHwiZ2F0KnKf+v7isRarsSmuxIhV5oiGj
	tRfDP0topAUrbL4XbEh8mhGuw09+Rdel6vMpfl5CsqPjLXZDd9hq82NGJBn7qREF7ihcJlfO8NE
	8EK8GYHUZJRLgB53nZMIESm/cAv1XjNUjpJ0/easH+CarEaMe/V51ZugwWVcBIFNa9vY4
X-Gm-Gg: ASbGncur0J72QbLyGEvEw9HX8BsSn4OGZLvqTxPkyk34qfw+OqoM32c+EoImeUcqplG
	4UEQ+Z6HeZD2CIAqrsSJaZ18OoKGfnvCUehxFnF5rto4tdgOkq/WrSoNdDJATQSvckDrxgY4bEm
	f6Cy670XNM3niY3YJPPcQ6P8kRwRzIuiAOQU3ANNZAe205bVVb/Ng5wJPRKMlOlHwNoJZG/5QZS
	ysRcIY/MC6+Y07jnXitx18CxTLk4NuXih+ILW8La7zy4V0clPoT1xt9APs17gCPFroLvpUx/ywg
	XZLwrEGOGFxkEIHkFHTDeRObz9+p7mY5pXeXVhngzPUNQMuTPE4KQFfaGl1D/by3Prvm
X-Received: by 2002:a17:902:eccf:b0:24e:47ea:9519 with SMTP id d9443c01a7336-251718ddac9mr98887345ad.47.1757319614674;
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1vovZ9gkQhZX2rd/L1KkPL3qlKIyszAECpRN309/lL9U00EjRsbkgJQyBobjrCkcpgK0uuA==
X-Received: by 2002:a17:902:eccf:b0:24e:47ea:9519 with SMTP id d9443c01a7336-251718ddac9mr98886925ad.47.1757319614225;
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:14 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:51 +0530
Subject: [PATCH v4 01/14] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-1-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1254;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=v81wxg2XnsrITbgpwYn82teoXJQ/l0LPAItmU3R1jlg=;
 b=+5W9XDqLZ3HvskV0J+JhX/1XQy4z2UoMFE1DFgGDiojtHaS1/WyS2D/FlKi2vbAuaFXMThdCo
 qIZCasUOKXmAzeHCr4KNp9eFh0u7hWlbVQvGhT57cjHSkNuYspnI91N
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: Mlf78eWjoCh8QFI-viMTzzO_Pcxzry5r
X-Proofpoint-GUID: Mlf78eWjoCh8QFI-viMTzzO_Pcxzry5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxqTysJodCs8r
 cu4RuysOGOr2VI+OALQ1z3tMqwlsmz6nU3Pyv/ci8b57ryoxhz3dc8WPjIhdRBHqQPutZV4HOtX
 DazqOKQWxpvXHt99zTQg5f0fr4r2eR42YL9YBlq3nINj3ZRzKTecxnSdFT2yAe1aqutzQSNoUk9
 XEi0oMtWhYCkrUI1ZV+NdmTY0pihqnrFaqREOR4d/6BeLIX+s75uMUFXhT+Tui8Z+9FpnBTO0ni
 VSe0um/wX9f3GrtPbK/vSAswSEGxfaUp85oWX+3td12jTcn25+Gpx3Ry8+B9UeN3ift/r+XkKnD
 Dm977nWC3XV3ww3lGKzKYMOEv71lh4R4/SBR5+Q5b/TeHHN6WoBDB56IcmIfaZACzwp7edsabER
 WQuTnAJU
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be91c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=oyqPBBxx3V5-Y59TF94A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

From: Monish Chunara <quic_mchunara@quicinc.com>

Add the MSM SDHCI compatible name to support both eMMC and SD card for
Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
compatible string matches existing Lemans-compatible formats without
introducing a new naming convention.

The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 22d1f50c3fd1..594bd174ff21 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -48,6 +48,7 @@ properties:
               - qcom,qcs615-sdhci
               - qcom,qcs8300-sdhci
               - qcom,qdu1000-sdhci
+              - qcom,sa8775p-sdhci
               - qcom,sar2130p-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci

-- 
2.51.0



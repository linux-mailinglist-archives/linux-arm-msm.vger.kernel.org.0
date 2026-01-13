Return-Path: <linux-arm-msm+bounces-88776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D36D18BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFC9030407C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508338FEEA;
	Tue, 13 Jan 2026 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fheMmXcu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0SIhxeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173F38F24F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307611; cv=none; b=Z7JH3MXqu6raf0Kl5Yv4XN+gss4Fn3CgAijOi8BQQXeNQmSraaeWnSecf99YMovCtkeT/JSttx6JpVTynmTEriKtL8TnbgG10jfiEeJ4UR4jTebU4aV/FK+inEv50QGbUtpnqh7tjIhYwZbeeKt0W2oUJAhjnnatOrb6kwT2Otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307611; c=relaxed/simple;
	bh=p+Z5YhJTvjwskfN+mRUfX8mkgArxrCgucyMvCfVflZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQBKG450WrZAPHK+blqozXx/4tIFQ9KzjAvf721txQhsiWnv0hqfg1p8ZAaawPq/esStYhQzS1pAapq7WgBs5f1qI3xtXgMY5LaRFZhaXbJXN0ucIOKA35myPVAFPKJlfpztYKZ3T6OVzptH9efwbvpize5/1he93d5eBDqp2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fheMmXcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0SIhxeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7V3Iw3299864
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=; b=fheMmXcu7lAW70wr
	Outoo0SNSuooV0qgMpdsuTxZOVxVlyOnBLSeSgwFOmSKsSlztsCf3cgx7VU+N0Fv
	FrwI+OptKs+g/Zgi6TdaGE6hKgIT+T6pET7Q5lQN0OQ76/9WgUKTabBh4tWzOqtb
	9BYSNgFZm8vvfgQ5592ZThAWTY0PoOcjrO+UprPkz6nr6YeMPiaqVKMfl+38qkYD
	rARsMgnXkxfI9JSl4xIY5wQXMjD2IiZPy4mCPejVSr9RXmb/SP3BHNoPtrRaDK0n
	6TrFbAfWL3J5H2myShsA4ZIEJdtKxrgkHqkssxLqstfuLns5WUTZMAUm4Wt5UqYe
	sH40+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmarvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ba026720eeso583652785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768307607; x=1768912407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=;
        b=d0SIhxeDNjwetxVXaVBqKsiI8uBhgsU9rgERPAT8rqUaB3S9TxjprXtxjL8XCPcrra
         LpHbhHDd+PSjo4LX3e8q97bxLhdaCQwlNRQPrMjtkfQYePbAA/ugucXm6ignKvcDkL9T
         IJfzLmljJiHILt+GO9d8XbagQiojnuTYy4WGf94f+yLdJBqU5BGJXGFoQB4JAfOBlaXR
         /w3xtauel2qNR8jWmxvpa6GYpWwAMR5eZuss3ik+dYY26xBDkIVgESqYqkvUWay4lPtH
         4pfCeLmR1/AX938COclBS8ooqGjY1DVgzchl+pHGbazT2ShKTyxVrHFrQ6WYkyjRZiPh
         05GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EUuNeyrL4XzjK3BWb7sWjvSrSk5sQ1bWzB69LFur0vs=;
        b=kO+8yrqjMy2SwPh0vlU3Z3iHgB/egejIW44nSY2I0y4ITDb8n6xvR0W94IfzuaH3jf
         DI41kwZAiRaQsKAAnf6mYe3P5pjX6//C/iMbPKbLuHzbh1hATiQwgkzolmgq1idHfQJe
         aAqHDsRAU0OpgpN+qBgPOKaJgRLLxUrD5wUCeOh/a38EKPz40sWxttgwWMrcYx/ah/ti
         SzDTng8qPx5kpd56OI3S/tZHC/IJM9CXvb1K5HNSv+gNGKcnRuSIWv1t2r9EwukZsGKP
         11eu8U7IV5qFM09QbSvNjZCAvQiaw9HFCumtASogjc/NQ62b7wUgeJUZ7RKuLIyuMSmt
         b3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9eda+0txh21LR/RFJAGXPHA/gHn/69OawC2XPAhn1h+FreWMNUrsM5axPzHGPm9Kah65E0EDK78FKxTCt@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbfic+SHxO3VGX3mhpsYXgPV/7MYX2DVwbZ7qmlKYbtXo2Peq
	D3tkUByQvtJz5fEYSq7+V6BA74YF7TEzSfUkRw/HMMJNhy0oeU2izs34PAE8TkJyEKgw7bg3gPJ
	lmOUpGlS7tf4sT3dyu7Z19b6Jhobs83XieXt7yVgZ4TirRgTq0cwpLnpNiF/ZM9uqgZKc
X-Gm-Gg: AY/fxX4hABHSSJkE/z02g4A2OUnOF3O2J3+SLaUhbxVkitlZg8Khoq2DnNaTrxTogae
	GU8rFYnxXdsQPAq330d9XZnS+qv2P3QNgsa4PhhRVFfrIJM6jb6zUYgJ5NFRYLNfhDc3FudaHxb
	piZtsOA1Dvmp1QRnOjyP2ZLsSUA1Nyzz/CUNqFYC9ozHAk+sAxp2K81TnsLoT27nGAbAQF6v4DI
	/UNEmIxNSPNbzl4oyYBqDZS3nwm49a9n0S4Fv/0ugCi/bGhTd11Qsy8oqmRMt1NJXUuGlwss2we
	TmQmEZ8E3GUzeGY8EiudIlgg/55Xqke/AHT5Uwy6CuWwXknNsV/m8FpfhVG4I2M5ouVoXU8x4vH
	wGw18Jfj37vEy7e8MjQ==
X-Received: by 2002:a05:620a:127b:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c52dbc6554mr23788185a.50.1768307606987;
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtIIeyq5hPCTTeP8m7mlB+ydYrTjSYdxzAl6l+p940XQA8Nhmc+8giqdXwR8p18pJq+gCXaA==
X-Received: by 2002:a05:620a:127b:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c52dbc6554mr23784685a.50.1768307606445;
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715952fc3sm635303166b.50.2026.01.13.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:25 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:33:04 +0200
Subject: [PATCH RFT 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p+Z5YhJTvjwskfN+mRUfX8mkgArxrCgucyMvCfVflZ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpZjuPAXSVZt2fmUiaulM9SCMuY9LYjQINATPZd
 z47knfdzoSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaWY7jwAKCRAbX0TJAJUV
 VpapD/9P0ZzyL7cbfmcLUtWC3yrF7pOr8rJ93jwJSjpkUB9LQvXIvnhUc4dyMVoorv4pTarcWYJ
 cFVqQDY1AtpeNsBCzghvmCvNthXHEKdiH57EPGnmSALgg2tSWmcEYtyAvHvalxpKbMgXIuxoJu1
 uRFjojpQtRFgivYYyDxZTcpVQW2u71TqPRtNSUNDPhwVUcdz+DfkS7sH7/u7dW2V3cxHqzdko+c
 AOJkfj5xnu4g72Q82SR1jznP4YKyFJS7ND38JHx4EH3RKEVC1KlauVr1qsMCFfXNEodnNq8dChK
 2ZT/K8QuOuiN6UCtpoAbSibY596iq7tJpPVPcDOlpjNUw+IJo2t1ff4rmHIhC520u/5butrxBEX
 iGdzmQKND9wCqeTDOj176E5AdlGVj6gy8PfYra6IpQ2Y0+shZbKDEt9TEO/wWF32t09tYpks6nG
 ZUBtspG/GlJSz41+24iL8a/lQSXJuSnVYBvXEb9U5KMzxtMEoldDHhdrwof4kz6nNY0SrQbaZNF
 DkE1LXky8Eeg0390fQyhwjWXB1mrdGKc/cXNv0L8OQaY8cliDbZnpclS0CgacByZ8mkiUaqFPEN
 D0NpcmeqBZPkbEOqQnSA+Fn6Jljvusy4q2+aI94epl1Hy+RR/Ua+O6TyZvADCjsOqnmbJTpelO3
 dGQyXNny30yfkZg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: p6MeDlkiW8r3_1vIPsuxP-E7G3mCpAdN
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69663b97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vx3hbeaYKRubAM7LXykA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: p6MeDlkiW8r3_1vIPsuxP-E7G3mCpAdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwNiBTYWx0ZWRfX3GuH5a7C3L2r
 piJwgtmbDfmoHX9m3c5wdd6EI8f4ZCVibEdO86q+dBaDoTFj06yINqGhrN9FS//C2R9AlaKI6UL
 NusUVr0yeB1WRZTzhI67iPeosgSdcyC/F/yhhd3C9H5XYoJa75l2MAH26wIKygfcTEaD9luiytX
 tzSLFCCYJkot1QZaJ5odko6xPTOBF+lcOD7ZnnRXhdyimDGMq/54l0Op+/jlydVXJ8ZdPXujNtA
 esLXzspf+kNmeXJQ38phvHQndVW5OJz9ld7ziUnWO/Gbro70OH7L7gpYzEz7Y1dqeyB/Qlh7JAI
 udeHB2Bjktn5ZCS5hVr7hmpMG5EOkZJ2BUK6j/4Eo3NcnVSwp2bQ+CGXODL6nBa/o/21ka0+2gb
 SK0p8ASk86FASd3h5yCyVMV/HKcyL5zjyLXJhi7qdD/8BXw1wedzeB5Tg8L8uzyoZnoKJpR0gF4
 JMg35vYcBDEq2FT3gKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130106

Some of the controllers found of these platforms can be tied up to a
single high-speed PHY, basically rendering them as USB 2.0 controllers.
So in this case, the interrupt to the Synopsys DesignWare Core is coming
from the high-speed PHY, so allow the interrupt to reflect that.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 7d784a648b7d..f879e2e104c4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -500,7 +500,7 @@ allOf:
             - const: pwr_event
             - const: dp_hs_phy_irq
             - const: dm_hs_phy_irq
-            - const: ss_phy_irq
+            - enum: [hs_phy_irq, ss_phy_irq]
 
   - if:
       properties:

-- 
2.48.1



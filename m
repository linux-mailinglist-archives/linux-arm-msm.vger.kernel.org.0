Return-Path: <linux-arm-msm+bounces-78771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16272C0877D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C0064F1135
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C462139C9;
	Sat, 25 Oct 2025 00:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIPVC4Is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE132036ED
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353283; cv=none; b=kNr5QFUuHmtpEWEWCx28DFImXgEPDU3IF9BoCp//TydA/z0UYS4/CSF5etp+bi//fVa2Z7RjQBccPdh5/f9zxUYg6CQA/Mci2WR46NH7E16CZzylJFJUqykbSuC2UlxPXwpmbYSA2eAwfRWiqTJy4/oIRSKrz/gadtmxAhMCWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353283; c=relaxed/simple;
	bh=Gc+9GTCwE6Q65glT/UspkMZu20/gwwKg5czwnmi0HQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNt8rr116FKLzyRrew63EEiKIWK2r+3cP9Q/GbsKjSIDUGQJ7GzLqdpJUmHu3sxNgqt/BS4yMuIDk5k0ts7Fzy8Ccu8t38dSH4FfLoR4bgCowIV4WXttLn0e8844uxsb0QIYtOil14zhYEkUK4pQIUYpVcEgN69utLNFglrCKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIPVC4Is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P0lCKF026908
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqQ7CuFg2uQG1J5bdN7Vc0a8C6p4JOXok+RrLgiol44=; b=gIPVC4IstAIeGAZY
	p3EmUYOi5T3klfJuMPlp5Yc1XMa7YbQ7LjFKdBUfgm5YhWsTYuyGhmxIvBAL1VJr
	TgZLhrQ9+zOlgHnfzEIZMkqixMFkZwk40d5r1htH92nD3oPyXTyBgjNgHbu2+2Ht
	T2WpI1LY3iIww9+8xydDJgJV10/SjhQGGWeT410c0Y6cB/kLL3Wop+Gnn+PygSEm
	YtQki+WIRuWKDflsHnNhepxZ7sWYJ6KpTX7sADLRVdoviHyVcQAi1ygJ0mtkVS7E
	yYUMMtdqFDfUkwlWyvVjgTeXwW6Qaj1TdtyjEHWpWZLhReJLmUqIVwD3zs9hZGma
	2wpRvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jdh4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b63038a6350so2519445a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353279; x=1761958079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqQ7CuFg2uQG1J5bdN7Vc0a8C6p4JOXok+RrLgiol44=;
        b=SJEQPw6CcpPOxkddM9JE+C1BSH1AlarLqKH/7zXig6k9xCCHYAgP7wsLiIhhi13AP4
         1xN7iupnsiSpiDCH5LvMIk2FMhIFY25uCaFuWspB60Br9NkcMdgYD8uBoMmbNSt5uL3S
         q6PVtvYfbEvvqQwyJbP5NnvZPZwl2lZyWiZbhNKoWJvsPIR9hibtrPdk7SiXNyeg0IA/
         gHNedmrIt2sCONP/KnkMj4jcQ2bUp69j6yX+VelXdL5rSCZhb1p8KhX2GszTvbS3OSea
         e+jLVG+sWttXSaC51xTGrOSoRDJTAiaxsrpJtYU1ch7mqw2amtsokF0w21lsOhhb0sUQ
         uByQ==
X-Gm-Message-State: AOJu0YxSWTJlox2lA9/iVnlUVZz1SBTEcqcvQhOXS1siFZC+uV9p8sQG
	gC5pegdxUn3Fk0I3YQP5JGDVAsGhBUx1rPeb2JKEoxv42NyGirEODX9ma1x1VSq3rqT7JcZBRVu
	BciJHi91qHlbnGcpm1Lypa46qrRbEzdTJTZ1kMKJRyFa98ckx5LCt8CWJdY50gsq7tOVY
X-Gm-Gg: ASbGnctHvkAqWKz5U8AtK4td17XsMAbcysFqjx1TgF9pssauJpvHjnIOHAQlp8ZNSm0
	lqju7rwmQacYRV8SiZ8M8yEK+Xx9OS6REzubC3pbz5WjCUnChftO0YjfR7sfGsdDP8sc+3MJdK/
	V5LnOmKFScHY7OGFVxM5FL29x5egzooOfQji/VPo3WvmtzyYSHi0PvaxESjkiEXAu3zlxRgVUJi
	7Isyf7qdKCCf8+h3jhp1FVxJvrjFEeRTicDCnKxedcHtpQxAMkfPteUC4t5wM0+9i8+yraN6d08
	lIGpcHA8pMS4WXzAoaQPjP7jdoYBeKW3ickxv0s4B06cYR+NYLsrr4JTmVAsrMlSmKQ6FOVK1gg
	d0FzNF8srl23wVf1QV7VTtUyu1yitWyL++g9kO8I50h4IKz7mcgM=
X-Received: by 2002:a17:90b:1e12:b0:33e:d66:490d with SMTP id 98e67ed59e1d1-33fd3a598ffmr5633383a91.7.1761353279270;
        Fri, 24 Oct 2025 17:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh+lfmmLQDcK6Q7DNJ2kGNQg7Sd82z6UskjFMialiSd/3Btxw2kiuVr800TtDd5MuGzZwxAg==
X-Received: by 2002:a17:90b:1e12:b0:33e:d66:490d with SMTP id 98e67ed59e1d1-33fd3a598ffmr5633362a91.7.1761353278794;
        Fri, 24 Oct 2025 17:47:58 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:47:58 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:47:42 -0700
Subject: [PATCH v6 4/8] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 SMB2370 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-glymur_usb-v6-4-471fa39ff857@oss.qualcomm.com>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
In-Reply-To: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4wPHLSOo/ZIN
 YiDr0asuuBNMbrl0eh53V/lYhsMdjgsAWITFDRSSSOirMGbvIIdzxoe3XGsj+vueiED5SlC4MA2
 y0eHXgXctlCjIu2Db8ekGx1L51rhuAEVyvYTeRbQpv5Xr04/e1mwM413YTj6knImj0BYc3eEulb
 9xnsX5rWHMALeSimIiywrq/tiPXuqXTz3bLi08lBGzyBovRsVq3q/kI/GApskz1/0A9qsLM7pfz
 oIacYw/y5MskApxJT6A5p7/AqockwuZHzoIO8QK7NB/zysoOZSHkXNdCMGYw37RleFkZpImB9lY
 Pcm/7UZUBxRo7+mE+3ULKSQ/gpUht6joPsuXwgkcLhyQQGtXjVWEbcEGSfhjNzSk2G4oxPOKTw5
 0LbzSYdJTxEKnbawVZIRM1hMs7FD+Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fc1e40 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y1gNAQij8gbT5Y9RrKb-R33RfTMTExyX
X-Proofpoint-ORIG-GUID: Y1gNAQij8gbT5Y9RrKb-R33RfTMTExyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

Add the compatible string for identifying a SMB2370 USB repeater device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1

-- 
2.34.1



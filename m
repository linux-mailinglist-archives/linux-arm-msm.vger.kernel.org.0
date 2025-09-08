Return-Path: <linux-arm-msm+bounces-72460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63704B4826C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F890189D61F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB302222B2;
	Mon,  8 Sep 2025 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLTumgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3516221F0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296979; cv=none; b=stBmPj5JLe4zRtXBySgP6kYWN6rB7c6v083pi8yO+Ie2SD30lMMXSsj5mAHcd7oCL9jSOBoB0CTMFOVfDbmnyHq0SXTpWeXEvwQw4hQLibvrMvHe4+/ESdc9o45S/oVaM1uDV9OQLShA0hsstnFdRiBtSj0fPGBejtRXHX3myk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296979; c=relaxed/simple;
	bh=7Lmwt8RPe9FYwcCsZot55MuF3UiAhcsArLukTTIDuFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgDSzY5sBx4rDA4ElB/Xe4tj+EcjTzTVz5MBQ5ZTRpIT5MxeAS7YVp/yZEDt10vehFu6ovbv44qouRgOLVTv95ctTt5XX/SkXzp1+X796OKxODE8E6qRlIWG1OHowC/FOMYwakd4qUzAV0Lu0JYQNZp1szJLQ5FWtg0YhkKQULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLTumgV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NGX1V021182
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DShGhrjrqskk81shUEZqzaXPQnfD8BZ/czBlA9gz3OA=; b=nSLTumgVqQrTMDgw
	v2vrZb3bewD4HnzT8mf+QH+dTwiawtd8HWCq+n3HNFzzpqWhx4iUeGenxynk/Ysa
	b18YxHQyP0SCVuOjgrkV6EfA97WpFjexFI8uQhvntY3BHnt60J+HEgZTQFsd1uj0
	HNIbxcXmCt7fg5Xlt+eU2fG49g8RNAKf+qftRnE+2ylF/4C6FXObsI8HprGyJFKv
	8KUkgNy+7+onpdvLswb77mdhsn9JK4OJ99iaPzVW8pU7sYDS5Vy+uu4e6AJn9kXs
	tJRkkhB6JSzhYpnwzRLsDSengoVSA8OdNXKNE5VBhCVVhegT/UT49llSzW8n3huX
	i/Ix3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63aw72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:02:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7723aca1cbcso3600335b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296976; x=1757901776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DShGhrjrqskk81shUEZqzaXPQnfD8BZ/czBlA9gz3OA=;
        b=BwrC6rWBd1OKhh1FQYF+8TbLxC84MgwBfNeelCEHCZ6rDgMKyGXDs4zOD0rIh/xrk/
         SxpiHHA7ApGTtN51//GAoscQWIOjTgLabdd7AnOmarNveWpyVGcH6uJ85GCXXaMMoQXO
         UYN1zDs8v/cX58dnBoq2Yb3gtXRasCGZsTSq3boxsYTsbqS4q/eDBjFP6pwuE6nkyVn0
         CrJxelir0zr7UiV+XFxMFxwQ+mvJt4oFTCUOcU8GW3CwBwrHC/H8lPurzS16wMbpAGcS
         oCC8tr2v/Ag0yEIKmfsS7vZCViTarkEEq4eP2Q70Zuid3VY8QrbCt04w+2H3LV7Dd02S
         KiEg==
X-Forwarded-Encrypted: i=1; AJvYcCWya7oT+5bMWpjlfMvmeWbdVCLMTvkMAXm13Xwl9zJtizZa5sOWACN6Gry70I1zoLIXR70yUp6dmOPq/pdL@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzQoibIEJKDzw+zGM4iPkKLGjMgbgOWtHzZuiKJIGItrFGUWM
	Whf7AsBpcWxH4tGYApE70uP1G/4eSw1vzMn2WocT89pulHTe5lN+fl5cZqX+u6eXRKcjj37s2J2
	Q+cnh+Vfk8h+7p9hnfhFo4U2mK8/bD3Il2oG+BJHUMb8boqbFgky6uF10ZNlaxKuREAMaMNzFps
	RaA4w=
X-Gm-Gg: ASbGncsK2m2hdMnVPzViYdrUtTA0tNm1A6vYl8hfXFtzC88FoHcODZXZOU3GvT+ObJH
	L/fIaOnTd4e/DY8LAiXKaDGyuprT2f5DLiYf27HT609/Ui2W38PpWSBpcDzKNjXhYUaiAfWZ/bk
	ihfU/lG3Wn3GC9O0FhkKFx245JKdQVccjEgjKrWfHGsaJjsMx9fBCFYy1Kws7gKgu761Hgl6LVB
	CoHVZCI/VkWVawmw72GqS5w4yrR1FQeJ9/mmWeQ9AMJZfeml2wfDheASZcpb8qZK4Pg7V1ksIqH
	fYT8jhgWbPcuW06JRxrejran0RbUUOhMteC29bprRr+vzzlLaLGywwizQh0Jji52JxNE04FkWNV
	T/0U7FCgHWpNwjIQO9DnUWDGG6oQ=
X-Received: by 2002:a05:6a00:2316:b0:772:4759:e45d with SMTP id d2e1a72fcca58-7742de8f0e6mr7749319b3a.22.1757296976257;
        Sun, 07 Sep 2025 19:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE21drREBfGZ25w/CVQp8dbwRMeZLBum3GOWYMesmkAgDZBajK5madzZ26jtZiz8XqCEaW0eQ==
X-Received: by 2002:a05:6a00:2316:b0:772:4759:e45d with SMTP id d2e1a72fcca58-7742de8f0e6mr7749285b3a.22.1757296975797;
        Sun, 07 Sep 2025 19:02:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:58 +0800
Subject: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=1804;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=7Lmwt8RPe9FYwcCsZot55MuF3UiAhcsArLukTTIDuFQ=;
 b=Dc6xN4+sy4FfyxjirI9U0M08+G8323SeEKPga96f9sV/F8cXG2ByJ9zM6mCw+w7GwLgMMn9ph
 uC0Q5GaMEQID8V3WMgEL8/BG4NUAMYkDXV5bzZFjrl78oC4ClcU6zkb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX3NRkjvY/zDM2
 4OIx3syXYrxRhbCbsT6lqa9epyvZrXA3mxNwLc0evhfQd/aHYAPi3gafKVpRiX+n+9rgQb8QJlM
 BaQSLJI6xM35KHkNJoDbqMrnFrwpIvE5RWVJQ+D3pYkfR57y3xyH+sHdsPDnUvpN9g/yAzwoMZy
 0Bpbcq5t2u8iUEuG+O4014dcEYz3xibN1eyD0NGspPI1HdO7mgKyyf9JZvVlr6louvun4A02MvT
 77q1xPawlQSBrp6xu+m/6motFhbq7VyXlxtRLWY8Buql2HFOfBZect1axwpLTHoLUZsi8KPqsYd
 Ut2VuirLNT761YTpulLR8RTjlWZkXqvc8JEFjHW2848tguNnkukO5DSrOXQSEjeVc74eKlFpOhF
 53KNdB7x
X-Proofpoint-GUID: otxsgEImgZUMGbOdUEel2mdpFpwe4hZQ
X-Proofpoint-ORIG-GUID: otxsgEImgZUMGbOdUEel2mdpFpwe4hZQ
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68be3951 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1



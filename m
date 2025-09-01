Return-Path: <linux-arm-msm+bounces-71385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21402B3DF32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0998D7ACD2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC2A30DD25;
	Mon,  1 Sep 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faIWkcy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3839430DD3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720687; cv=none; b=as6nbN24Ndv9kwFvRFoHePjF3ZNhh3pkiuw/ooiaDzhW7J2ZNLcxf+7W6Srm97eJbLOrzAQYS1FC3D4xajj2O5ks6xSTADOvE6h9FbttALYWVM63hHa8jJKKrVWWf2q+zD5VY65K283WghGfREecMx94gjvJmSf45bH3TmMhy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720687; c=relaxed/simple;
	bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idMBBdapNraixxOiKud2AeG5qHj0LxubABAE1rt+bl/sIC22M2fQTSdfM6rG0W06mV45TSKTPRa8L4H6TzW1gMIL9rMzwcmgc3fu/H2gBwW8zQYJJO39zfCutrE5KOaUoYwQHP+eiz3dY0Mdh6GUvv45pnaJOJk/oL3AYaSauOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faIWkcy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819efxj027411
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=; b=faIWkcy1HtyDoZDL
	Q+EnDMusWVAaJfPBS/QRBb2VqGA5BVVd0WcOzUKKWC27bte2bt3aEc1opygywiHx
	BtnfEZRV1r6O4TXysWRIMcXbf0EtG9ZzYkUKk7psVcHFx0aE7Vug75YaFXudx/Pz
	wizoUE5HzJgyHzhJsnBnFlXfNONZXCDfUB7XMfVUEqVMEOfPzfeaGntt8EARPUR9
	GSSo1dCBJMT8v6el16fwtWSO8CCoXlI1J4lrRznu2uZ69HpOib3NUITQs1OrVMZU
	WPTOOAu8cdFhTRk+iiNipAHxaCGFnr9oBRDlmKbbBoroFDpQYUibvnnR5rQzm3Am
	bH4bbQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkc6xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 09:58:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso3968699b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720684; x=1757325484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GVW1gIOHT36zGHHStOfqVFIcMi+JiFxcWbVSTpf52g=;
        b=alNLmnVY7YHC59QmUuRymYjakhMaSdliP+Ql5TyFIubeKIFeqBJneM4jEXIsliIuTp
         9Yej7vhl5ymo+rPV2F0CDOJgecYg/hRFG3Z0zOgKJmABq14j8StY/jL/Zr5SFNuD/uZo
         yyqCRwStVkVZfJ3HrJLPLEvLxxTsuk0GJ3SQAUVVZ7Co5Q8Mq87WqQgZ/hsHo6Vnrnkd
         OBn1Ard2Dhdlnx5nGQso05wv1IgO8RJFyDvPIRM3eMMoSNxwZyrdOrFtZfSn1kzuRuhW
         1TXNoc5FVKoceXES7Z6rWjM7uoQ7N/WCakswo87OkhHd0PGgSH9Glzz4CK4ATNbpJbxC
         QB2g==
X-Gm-Message-State: AOJu0YwnryYvz1SqbZud8psg9vbvnqJNq4tjSlZ7Q9iT4b2yBGVN89hy
	rz1MAnuUwb/Mz1pXf+uWhH819jbuSQKNFvunB/LbqsaV73wk+KHVl4rfAz2VNMTI7i7hsy43n3q
	Fg6VOrfpVl0TFCZlhv1rlcTti8o5gAzreS716oqnTxTtW7NUdppiMY2/oKHU34OEJQbAj
X-Gm-Gg: ASbGncuabKp/U+p7nqBRoM3DWfhcSDVsEyayv2YuKhdbqb5XAtpH8diNzUCxeulRK3p
	BvziRmVpmKOvmq7XJjp4PMJsmknFsD+JY/GmZ030e5AoEt+U8zN/iZRVEPI/RgpN5DebebcXqkD
	BDGU9rYjRckBcr5zte93XzembUGNm/bCk6Pbv5OlUEMnxewVvnsUR0rKw3DTF2nC/BgLslr5z2z
	n5CuiWm24bDXDp73p5O+ZDCDNraXK69kvtyjR9fMYTpH8i+6hT6hz47GvvCWOfYOChBsYrdXfUA
	db3K3Pp/+RW7PU9jDL1KuIT5sCNhS/xUBK5w4mxejD2lgy3k4ty1+DyiSnseRwRdksdeNoU=
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id d2e1a72fcca58-7723e21ed20mr7659601b3a.3.1756720684336;
        Mon, 01 Sep 2025 02:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ4t0f/6dn3YuGE5Wx0MO+C+CC91j1Fu+2H7Lm7vL9NLa+L4y4wVquOSVTbCTnxjl+phdOyg==
X-Received: by 2002:a05:6a00:114b:b0:771:d7b0:6944 with SMTP id d2e1a72fcca58-7723e21ed20mr7659552b3a.3.1756720683837;
        Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:58:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:29 +0800
Subject: [PATCH v10 1/6] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-1-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1298;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=gB7HmGiD8GjEmuy7612J5648tP6/6MkBhyVIM4ydbsE=;
 b=QZLcbjlZXSWETLypy0qkDZdYxYFXq1VwXGtpQNUqWZ6Rqjs7x+mz2AEfwgjCQAvWn+9sXu9j8
 kU7/WR51wGCBNNK6QPhPdB2/aQBCRXrjH8W/5Tz2m80nZ2bzYCP+3sT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b56e2d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5ixSZjX4nqodb9qzXsEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kj61GJqvs7iAFLjspw4TSs45hPX8tgqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX9EG47Rb3dHmC
 qQRaMA086ngZHJbQuT78FtU+YFjpeNikWZ9aGG84HVPrSukW+VcsVIsqeacyp7UjujZaBvMv8bE
 YwhAo+2eahQ0YfE9JYEAsDC+mQUa9HbTRWlAtI4DeI6M9k1nXo9npINVb3lBLhXzvuFmE0lcsB0
 /67UL3OCqjv05vnMPvfW1Xe3ky3mGHYQN4Y5N1ko3/mL+n39EzVHVDctrXDboj6fxIkb5ZP5eOn
 XdNVlwa8b/TVZQjSuLGgV870895JQDFjpUTwGpCQsy9J2qCqqpiDs72wPrfqyt2s7mN3eGbhota
 Ya+UhzyutcyncTGAw2ggQa/ATJOe3VDcwkxeogatWseJJSZIFrgl9cLQfFEeBCVqlj7zOthKUiW
 PFlU1H9h
X-Proofpoint-GUID: kj61GJqvs7iAFLjspw4TSs45hPX8tgqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1



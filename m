Return-Path: <linux-arm-msm+bounces-71840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C4B41DFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BD7B1BA3087
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5EC2FCBEB;
	Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyskRiBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB22FD1BF
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900710; cv=none; b=ILkEElR0EoYZKeyf3zuFhaHd/bKAWJNaRS2DdKAVHMZYLsWR8dLUtuX9MJhZ4qROOVh/6DSp05AOc3kbrYZBdlWWEEugj3hM3dxcSHYhi8fcHjGsVP4JZsQQ+/hHmlsfFZPaEj1Vn7oJdCYz8LwdIFd1oBfeNY503Gcg6/d8ru0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900710; c=relaxed/simple;
	bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kszrs+weS0v/M6/crViv/zFJLDKhWcZGFWhoaT3fHj01WwJlckXq7SYzNgQUCU5zqab8EAsCSXXyqjtFoYACvOzGH9BZDHifP1F6JGBmbOs4r80bGcsE1hwGjweqb2phFl/ZudCyUKfB9DoftZj9cxZWni6Bygusl3r8vMxqqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyskRiBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BErTp022378
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=JyskRiBbpjmESb46
	EDPO31Z1EZ6yvegcHcH5dnSFNCxtWKQweEDJiHgII5QuNkgrqz+jiyEukqN5+ZZg
	ODBPnlNl0Q9itxQvhstV5cVyfsurT9JDf+Ql5+L2VmbrSLjCQRY9ILs3m052p5y0
	xcOe31KxSvXy9T8oQfx9f3XlR0Ikc5H8uzUqNw8gBlJllJOjRsumjxgW+AphYR0g
	3hl/KaGrvk8E9kf9WO5BCX3lRE6HRMSsYctWj7E1+FMr0IzH6sQKouRhBytHkF7c
	4SrhuCfWG3+EHxuM18Xux1+Vm2tzcymxAditpe76q7TWDLXW2giX0PYqSY/H+SZV
	mxys4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkdwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3349c2c38so76168091cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900707; x=1757505507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
        b=kOJ6koxS69eCZdKc3UqaxfSj8IwzyPsXb3c4mb/OVlftF2qdDUge6EXvKOyxtf4yDQ
         quDZhsV0G1SUiDmOLsEMht6K7h9Kv4aIwS8PgrKS3YXAy8rmxW3NxD1Dmbj/Yeip6AgD
         hwKSyQN3mo+BT3ad2/rmZQmc8fBP7SP+BL9HhsyZ2iaT/lwHvx2w9VSrNuUAVLcShIOw
         p/tnlk4gitTh3/DYlpxTisPT2kTc1IAvpMuoWjPEkYJHtlwH5xB7TLLlpRdKd1RPD+cK
         V8swnxbpMtp+6iWVQTkAgiyi3/SNIVrlEPtBu6sc2NLpF06/QkrVDIV9Z8cYlFjfiwZ3
         o9Yw==
X-Gm-Message-State: AOJu0YzW2fvnAoKsp4t50DPFTSf0ZjAMfR0yNWEDnhUxTlWV8Ckoe3OM
	9k7+V+4XCGOFLubBFRFWORc/5mgR8XlYqCupwF129gWFTTRxWp+7GXzN6gbMai59W+HEKsbuP8T
	K0wdAh5CLp5BtwJ1dejqQbDkv1YbXM0zq0vcIoucrrzZVoz9L930tx3JQno6mMH2rl86Y
X-Gm-Gg: ASbGncsdVq6Ym8NfG3jewD37d8YCcxmdY7ht3MNTLUjVGWS41d6zA822LXloKZ3xNUF
	+jlvyB46NQX2Tmnyouk1ERm9+rY/rXkOE7kB/kvndxwFRqBDDua2jSig3b3ebOo45vgnH0ZCX/e
	BkGpeX8JNsixE623jL1Bks1GeuGa/HKODJ3wO0mVBltQqPeBwl/CtKGBjUcOqIUsSmY0UemKZNW
	XD4n02+9RDSQapo5UkCWukx6leD35ins2pOTm8igviP7C1ml95aHcVrWwcAbko4QJljdBsyRe2q
	b44Ys0OIM3Iq6ABwKvvJZMpo3xP6c0H7GDarr6UjxWVucQZIbUE+RvUp3qd+viY1XETOG/ByjLU
	+GX1huZE224xCXq2eLbJk7BxuxO5sZBIyOukl1IVroywgVOq/mKiC
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id d75a77b69052e-4b31dcddb9emr153033881cf.80.1756900707122;
        Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+EMS2bgzjF+wonzL9M5BRn88S64ov/ovDLLFNBNiMqEsjMGSjj9Gp5N1zKTttlgvTkbhnQ==
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id d75a77b69052e-4b31dcddb9emr153033731cf.80.1756900706608;
        Wed, 03 Sep 2025 04:58:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:14 +0300
Subject: [PATCH v8 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1XzNKs3KOvrfNw9T9A5PinobRn6+BUmHYpZ
 AbXYmzlA/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1fDkB/0cdD4STyN4uofga6hg4Afg4alqCVv877OF09D2pr1z2nA5rdLzvmgnUcMuCfflk0wXjHJ
 bXsEEaz14lZtPp4J7G85o7G9VjPzwXeS+sUHRbWrm9NXR+wD2RcdMefCPMdcbueKkVTkQYgbgLf
 1FJVNEdeUy3cTxX6eCsIthEtfOSBCKGU6DvSa8D3UYbrbIpb3au9HwSzcrQ136I4QrjjRc4qZlv
 0hS9T6hv06o7YlXVEKtOOtgPd/PmvrYjHbiN1jnXrHriCAdu7gl5s564TQ8jmumSQFQB4GC74Go
 dV3x6hMYJ103JuT1RIOZFoae1XywiZB+ZJLIyFcu8cy2FZ/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX11WBh4n/Nt8H
 DC4Kl4V7DCDVv1690Fl4xRWloYPorl+VmERtYdkQacjHuN5DLd3zuBITM9dm1Q8Zxtq47dpauyU
 4hwJXYHSXvjM2XpoNTrvxzcZGyxZOwjVZNUVjeVu9vq0Rcf4DWeQaIu+oXDlJanO5H48GNgTMrD
 u8sUNNHc+drB5qSbEK+GZUMohmmub/DZtJEnC4MdKaxiI0oMcA9Vng9hUuXRJef+0TQyE47JzBC
 DWtmcKMC3BQIpM/7lpZVGi1EXw9yVt1XKaa5b++s4s09kIbYp9zC+bKMrMslMuaxAIrMCtYEzFr
 81ED++ms7R79UwueN1zrUVQ4lMogTUbAjXVJfgRWO3tj3u1mQA+oEkx1gKFrjEKqD+w2CMkIKR7
 l1og9+xf
X-Proofpoint-ORIG-GUID: hf0ur9CK68Zs59RBeIK_pzwiQXQ8m6na
X-Proofpoint-GUID: hf0ur9CK68Zs59RBeIK_pzwiQXQ8m6na
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b82d64 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2



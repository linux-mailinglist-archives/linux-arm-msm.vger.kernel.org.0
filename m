Return-Path: <linux-arm-msm+bounces-71841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E0B41E02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5743561203
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4992FDC57;
	Wed,  3 Sep 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLSwWccP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13382FD1A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900712; cv=none; b=aTAJcbEifmlY++a0yMht3EjBeEJGvWXCjRz5+HK0AlXArtEiuv+x4f10A4Zyeo6iB99mZCUwYzFQLB5go4e9J0tBcCL7+No7DhD6EkK2LTVTO/KKGjVAXRB2SL8E05Oj+I/9SWkPkN9FWrs+O2Rl08KtITf1xul+ZCeKtRSsa2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900712; c=relaxed/simple;
	bh=a8ke4j4Y6LPEDYk1jRjeU6q11tENi0EWXo++z7UB0Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHCW65ErlmyIJrUKACN1QTuiL+6Z2CHcgt+2m2XjgsgWjM5NKQq6CGK5V8wxWKKOw5O/p6NFeZlSXVGDmEr6slme89MUubq8HCxRRdTPBZ7cqjSukIjZRDq4OqlHOQsrBWkvaA5sXloja9yYNooOh5NIj3PIc9iKMiwFabXWfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLSwWccP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEv9q001981
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=lLSwWccP/S8X0gGs
	/cG78VTf5BfHVkCrsLKglvpXJYWGlJVm6hGZ+2P6SL5LUHvGPYTeT+4n0jvqyYCf
	bCVetzjPN1mOQBbteGN4fTSfpY791tuEEV63CpEO3Bbxm9yuYmLw3LCYy4a/8qi/
	Daq6/J88J64Z279Ta8hLhVsbtFmXmhmyIlb4XxT9eC3T3L19bUTgtVt2ZYhU9sI+
	r0N1nIykjxUn90aBK5jZkmb8EnLKvGTQVN1BHrf+kZHpKqJ/qH8wQpZyWApHFRlk
	lo9gOF95G53aMS74mvc9POfiosXmkc3wr0Fm9deoUfNgPFszqxiZ4BVJ/mluI87G
	pkvsyw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03k1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70faf8b375cso79540676d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900709; x=1757505509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
        b=DUNzHtV7VS7qfc1mM6dlRqc4Rh6Bxswly86h9Mt84MLYtRmK+fE7QysK/4ofCQCoO0
         UaEg4fJ5OjrPTOz0deFljcfsJGUu4KrPUywt72ejKcIxhSygOCrE53E4BFHk1s8ul/2Q
         r5Brg5gB03Uir0Rpc7DTKSL38Pv60KkGjBbhJ/PFlO//3hea+aHuzq3f8zgcTXhLrhfl
         4Dw5z8sIuNbScKrSHX738QF9EXen3I8m9Yq2AhI1piw+zyZd+mBv8H7BPIxTNEZiCZw8
         hK0FFi9xwG5kYn8CZRY3tH6LYmWMo1DKWPzvAkiVrBFpfWEUZGVfsq/12HcU/vVrUpWG
         h9Ug==
X-Gm-Message-State: AOJu0Yw+/jKOQHrnjMEmSddnD5jw50m6p0BubJsGzaNkbnFu1TXUoPFj
	clxxi3AQ3mbPec2iQeSKZVBAV4MFQEJpgU33uVmkNeN7DOLVuWszre8d/CzJuv50aH9uLFlp9qW
	Jnpyl2zBB7/QmwKOp64KpvnPO/ERAinKMWc0tjyYePa6NHQgN2p2dDT8wBG7i2RZzTM7T
X-Gm-Gg: ASbGnctwSBG2TidjjJj5naL2NA3EVaug+ovGR+s9XWmSOeJplT30QVbIBh+Q22hy1IA
	seVDNP0dyQKZp7d9vTs0e7Ut5m+le+19galRt1erqnCO+W4hAhPPThCvqO7ZfKPGD71zyIXgrnL
	fP8LfVZY3h/WmtZah8G9D9i9VfJYGsg/lIdKJ1dr3ImDZOfepVJg8uo8U8c/VCNHwboXQcb1Z3D
	tE8XjcpII7tSAPlhkIHA+eWKNKQeu7J1ERGazRPfvVCM+cqmKsRcc0eq2Ipb6SsA5DtJJoB/e/H
	ywam0MYLtE0WKCgmt99CzSRFMuA062zyJrLuOvFmkYAI/kewvfKcWXA3EhPV8lhO6cxC+Imzt8u
	s06A7ixZln3bpMempQzKDw1eoXJk8L69IJdYSiqnFbIcPs/pH9W7H
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id 6a1803df08f44-721f7f2f87bmr56508896d6.59.1756900708647;
        Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOxz+WdI3lYa/0i/KAsvn3bz2F3oaUn75lIwMhkLzpHl6K7aeiGWJnGPQJrpg5cLSzZ7bzBA==
X-Received: by 2002:ad4:5d4a:0:b0:721:f7e3:b339 with SMTP id 6a1803df08f44-721f7f2f87bmr56508616d6.59.1756900708191;
        Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:15 +0300
Subject: [PATCH v8 4/9] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-4-7526f0311eaa@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Xu+km2KutgPERGGGo2kmA5xB9BSqQJXCB3
 M/GRKa1pVOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1UVLB/9YvA2KNMlz3x3H5+BzWFNN7BkMCqdYEVllZZdSqpy+8dpZskxN/+586UCbKEPZGR0bPZn
 4rdUTsDG39PBRf3R9cGWP9e7Do/37ULaPUA+o4+nFcT/twphNVdMqEnAo2gkQqa5hTaxiVmICN1
 TFmroiajto+0rDQ4o6RG2zC5CK4hHc7naZKZLLmmo/nRz+qgbXbPRIAJdJw37Gxy56us3l9wHQK
 arLxfpFM/chb466xs9VErsOjWEL6he67ag4MM6Nn9dZpv5JacZHqPxwqbKIydIXovMXjAtc/gwy
 qfeQbAL43bMZLtSmzet3FrhNh6lpd/0IQS+XaeiS7V+FY8QT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kJ50sdiESxnort6milAkfk7SyWBmttev
X-Proofpoint-ORIG-GUID: kJ50sdiESxnort6milAkfk7SyWBmttev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8BKOk7Qfk3Tw
 YzEfFWK3xiDF+2lPXnfNHNNbto7VQe19Kbx2IPV+kq3e10RiW+P+vguscV65lgQnFLnB8DG/Voe
 3LKDmUs6L3zkRkYaALHAsXOY+JMC/F9ho16aE8JMVu0KuvW4rw1wIQfoGO0Uwf7KQQy/F3uAAn1
 orWxyLPHLiC9L5lViBUWAYl+NKTbGvBZaDS3bcDBrabJwg3mDDhkszILxVXdJbZllLGOyRe9r0X
 19NmowWH7Q3d0/aelqHcFzBfD+jyslWC5Zv/5WuDV+zS/vJNwKkO+t2JJbajfmLohFmvmFjxjLg
 nUfccVjUNRVVZiFtOKI7CD+ZKTiJHt6cxWoR6UChv+JAA8H9xr299fTp/CcWpH0ua944F1iE4JP
 2PTm1WBx
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b82d65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2



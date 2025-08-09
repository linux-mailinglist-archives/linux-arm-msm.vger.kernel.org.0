Return-Path: <linux-arm-msm+bounces-68173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2162B1F35B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05DA75639FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A313527F75F;
	Sat,  9 Aug 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AD3yxyqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9D27F170
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728445; cv=none; b=JZkFlybw0D+1Ytctu1DNgvz9uTvgpS4AsajwTgeV3TROmn27SopCDiIsRABgYcJuiuHXSE7wqEivtcyIXYL8osxXusOpU+kIDYZt2LQ5rsPgvOF+iZfSWa4Gwwiys1idGhsRdrjl/SNpKlGZpZB5cPgeEF0MhTpFToEuCLtzJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728445; c=relaxed/simple;
	bh=cH9mFD81gjvWgXR9gnN/Va1aF7qgFbqJRVc2CfvcnWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQhghaNtc/l1L7WyFF0UefkExl9ySZgTDIUzigI0zJ+N6pFqY/rpNzxsX9wDo9bn+tE3szFpkKB77NZbHTXEgipKx5rUqO1hP7uQHh0+nNk6JkETdEeufxish2Bj8JSd5B4K4FGOMCSf12PFi5PlnzXMY1pau/Ge+TYGOKeTDFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AD3yxyqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793pv79004767
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=; b=AD3yxyquwP1uFabh
	TGxA2LNS+njOoqMl35MUrGXiZ2pCWfcFTjiPji3yNVoOB8E0R5g4CdWYHgT3duWr
	KCkWnTe7dpj21WcFPS4WTK+iSs6cZNCNeSaU4xSwsdcyw3WTITeJjaY32JNQEFlX
	Z/oO3XJMsFCTR0QVwaEo83Itkfbs6UrAaQrY82OVIuivGdBXVy0I85cJh2wtRSaE
	KZDitMxICUKFAjj7Nvs6yAExrVxSy0ndi5P56+vv/VMhsg2bNxuTvs5PaU1KJ48Q
	FPDXFA7t+ziJi8gX5nd4kgwQE2UVbwI2qDR1z3eY0MzITbsjHrfLczKZFcfU7obW
	s5Uuwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgeu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:34:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e82a101470so430933885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728442; x=1755333242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxfuy14u1nD4xI/i3c1nKgU2lIEUsDht3WPVHTU7Mno=;
        b=Vqe3HKKyg4FMcOROpVm0Y48+lidw1cRMDtTCi6fwuY3l7WoG7StbGeN+zpKgvYEYpB
         1qXdMsKrEmr3JaIurKoqswJryxyrFuxFAWh9sCNZNFwFXZZ27+0T2ZGE+7/HqeZZqDPP
         nBWjITYXbjpTzwky2DTIjlAXGBhbRT6oTfWMpOqZiFjucdLqTtpoFS/viFcPROIGry14
         qNsiuSSxTUUqckUQzuJgpeXw5pxpxSgQu6LsrYU6n/yBq6OUg4b2qU3WiFsgfTT4U0KP
         oPsT3dYLcVvCJYMP+zT4fzc+vb/X0s3btWYyioEdIFYFPFDQHlCLxd5WuG26g6zzIBIr
         cwOw==
X-Gm-Message-State: AOJu0Yx0UAgm8Juuvo0msIfZ1p1A0s20wDcaJwY0gkdHAzWDB7G2m1TN
	ynomA3MM+7yh+OOiEArBDjzi28ABWslYiuBkr6kpNTJ1GcMI/38xfU8i629wFY1miLQuBb4fiwA
	yeuCbuKDtq5ANwnS6ceUm7jH7xdx0nQhiiGRaXOX8PFut2VonoWn/TGBzWv7+p9fVDlBK
X-Gm-Gg: ASbGncvDqAoCMHDe+BBky8HxGg4gSwZOFT0W8vSzgfzj2OyCoez/NbZTOEXoV8LWtkW
	EuOuE2pXMHvn+hI3GtiWhI7PYCCIe1YXDgmKhdp7fij4FpMpRQt3ACheKoLY5QRPiYuZE7u0vlQ
	/JywWk1yacTNXuTq4R51Q1198iTewpy/WMS7RPA+orz1voXM0b77ZYuQmOxc9KjmvoY+v9fggD8
	vT2M970A465cR1CTFR/9ycf4usnkC6Ebl8CyEFfeqc/yiCiwLaUXaGagc6CEgWPYwODsgShVpJY
	QoLHiVp6/k0iiPNDAxfuciJgZki5eZvcp6JQs5fhErhz/R5Epn3HOqucSCzyLgGGrg6sQrAdBlp
	eGbOli0j/E8wsalEQzOsca1LTRzgyZG6+u7nCk0Qg0b19yuzG5K7Z
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id af79cd13be357-7e82c6a7bd0mr923016585a.28.1754728442125;
        Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/n9eSGH3YW6fEMmHip0Qcvr9RZrfIXk0CDWrNNpteBC2vjmKnlIyVvB4nA9KO5IfYmcr80w==
X-Received: by 2002:a05:620a:ac06:b0:7e3:460a:a90 with SMTP id af79cd13be357-7e82c6a7bd0mr923012385a.28.1754728441654;
        Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:53 +0300
Subject: [PATCH v4 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-2-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
 bh=NXtQ3bomvI5JzHf8G2204y7/eJt5cmkeL6NKDMpr9gg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0hkKuweP/CdMP6B7vrf+thq0QX9XqRhZKZ
 NkMwSEJ0uKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1TPCB/972cV7KvtYTwIYjb8O6Xz+V9IwlaAu7GBJzOX0It0UuUU5jAb3vX17nSDCrJ8xsClvk7U
 lOcaS9r5jm8C3s3LTR2oAjlxxqwE4chNHCAFsZzoNTBNWHJQZItpJSHDOWp+OYzaeNTeNBLLyZg
 4IuGu96fiAoZZTweZF/+sYIhnTgzeDDtHPYusw+eNHxB/LR9mqpFokeGbZSG9gBIJnm+Dvp7uDM
 mNRVSo2wxC3VCLmhkySaogOqgYJFBEs2Hibgp1UxQkZURLndrDB1oPVYduguZZSVB4pGXId0rT5
 ObCu6d8pjRKXmX6qfQe3pX+negO9CjCPIl5OhTuzrL17uSOv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689707fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Uk7WcS4rsgD7sVvpipNIUJEc8FYIoPcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6YVXV9CM3IbS
 WFFKnhOMUK/KvqrRpI+Rhx5ZoMIfQ4qJz8lgRfInucrH0HzP+jx0dPR3NL7ymkbsP0CD5HyWaXv
 MaBF4Z3vGgs21W5fKc6IMnp7REaHZmfp3+vYj/R+3+MdTcbWhavbid+psYfGS0PWA6HCyYoJmow
 +Xu7rh/OrP6WAkxsznrY03Qb5SfxVOgwJE2it96jmXMu+kIP7QVynuEUgKJrbe3D1OHWhkqVAM+
 8wCPxiFA9jl0uCTzJj60Pafki6fsHz5FjKQY/O3vqzfflsEJLliST8lcl5l5pLEsojhRvY0K2zj
 BWM3IqjGt1T2q3vwkp1tW0okU1hY0RtGidHVVZc/eF043pmjSV0NBW2xVXdguZstkt3x2mpY7eU
 uOZOVZ1t
X-Proofpoint-GUID: Uk7WcS4rsgD7sVvpipNIUJEc8FYIoPcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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
2.39.5



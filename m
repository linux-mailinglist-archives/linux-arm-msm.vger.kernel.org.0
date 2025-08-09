Return-Path: <linux-arm-msm+bounces-68175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EFB1F363
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C65867B4575
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1828A280A56;
	Sat,  9 Aug 2025 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1ujCWNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399327E041
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728456; cv=none; b=k1Q+hmAhFQO3kycKDaSKg7nuQX+RfI4623Pw3upa2lJktz0P8ZI1jhBmqTlZ+noeb6O3J77VxBxARk4+eAEI5RlAEDvDHWvUJX5i/WaqkaoW5uKWCdSaBYJH8Pwino4AHGpX5rP3x8GLWbrxpWSQDmcS/dbpTYtwQ2nuiPMgwlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728456; c=relaxed/simple;
	bh=Y2ogXEDYHHH32US4rqwrs2C1gO2dNoRFZhWAu0HutnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2Da3EYdRvCLyAqnPmRsQmaz4mPOLA5APQ0D4sU+KzaBv0o3cUXeC2RwEr2oy1Ue/aXtq7ZPJvadWk6ytzW5CioJJ8Ez9Y+gLe3d2GtTyBgVbCzfdpayYOzh1q+IhLevCn9SQD9kyiip2J6fQVmfJXJq39aY7UUOUtIeZS8IyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1ujCWNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794gBwj014202
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=; b=W1ujCWNL3lsMnAur
	4iZbhjWF6Er8Td52ISK4x37YPIryNw3NBgcRn/WQnU6hNORUuaFXIWl2/2GzdILc
	VIp/1tnd1nH9nGdW9Lez+GNzzroQrnR2s/a9GBKEpOCxKEkKtPl3K3K01SqxiWTX
	yR2RPuBOufH2c5puaPOoBfun9rUs9JA70+jsEaF0kJIz30TEKbkikSrHYKQwd+Pm
	dnNIu4h2nEXtHkdhedWvuesUBF/Lw1ejMjay40yRdMvM+P6vcpK3WP20f8tcU15z
	8tmZ26BET/ISWQ2FpmaMoy0z+5DHkxYswrbpVnO524SCjbvIYmUF/drFbQ0U+Ipf
	Od0mxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm88ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:34:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08898f776so67906711cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728449; x=1755333249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=;
        b=FksJHZoBAfpbaY+40d454vxKfYmarTt3vG3y4CshkuNd/pPbfeZ5Ldl+fj+hLfx414
         IsOrluHisQAyfRYqcFFeqkawpl593fB5Xor4JqTtefOfS8MDVj4Jx3WKCN6GWabFE51r
         KEUEPl42ROs7sgiUKbxl48WVFZ+A7FSQoOVhKjEN3MoFRBv57VGHZSq2CZ0VhW011wjW
         5tIo9qEMGDl4eO6fLWechOAGjub9DBv02wU2SHUh7n+F6x7T83A0VxHBHB6T5vq1h/1e
         uAVhXWp1Kdeau5iCLOhK2IqWVAjB4Qm5MWTv3Gg05a/X1oPilDeGHA2mYn4O25A6jtrw
         Uo4A==
X-Gm-Message-State: AOJu0YzHwRdI5u27LGtxGoEcBM0sI3oj5NhsYdR5Qlx3nK8YC9wyW9ra
	+F1oKzQDz/Xa19aJh0OYILFTY5+kzO08or+yb+ymxjbSkevycCX0ybfMPmy8eq+3QiKJKF1g4du
	MwNyeHdtEd++aNX3KuTplp5ZMG9lE2TifgNmjyW2UHpohHkWH/NPXsCjoG2hM+LQjOnD7
X-Gm-Gg: ASbGncuyO4bVuS6sph6HupZDr3Ly7eFk15bzAVhFcmgelhnGwn/GlBiLlq3Won07BkK
	3AVCnLPPmr+jeRGsjjJsaiiUmUm6IzdKuQwA0fEwe6CZ5NMfEaSQEGKir7HFylkVCI7QVPwTNwf
	5U3kKXm7uboDtXCnsS5HNijn2SmF8YAdhfvCkXT02tAb8jWP22TrB/WoUkSVevv83Hc+tDjqvFA
	me9CpyHKe/OE7eep07DDDIscucqcHsL8qZOOJ0m2jlz3BSysFl1I4CejF9feCJRpD4Uxq4hX3TQ
	KgnfVRpmurS0lzyrZW/PsrWzKiWQfFrzptpH8NgXTHxTgvkw0ZfnBdb1EzgI3Yfomf6D9J3y35z
	ZxdPpwzDvkj88aZfnr05fazF9zT3/nn1vbrYDbGfxwgUx1nk1zyH4
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id d75a77b69052e-4b0aed46000mr62115051cf.44.1754728449241;
        Sat, 09 Aug 2025 01:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Ab4avSwq1zZ5d2YBZYLBo3nOHk9zflP4onqWeB1kJHzKmCxLZZa6pyaayGdxAMVuH3MvJQ==
X-Received: by 2002:ac8:598a:0:b0:4b0:6965:dd97 with SMTP id d75a77b69052e-4b0aed46000mr62114791cf.44.1754728448780;
        Sat, 09 Aug 2025 01:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:55 +0300
Subject: [PATCH v4 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-4-bb316e638284@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rRhj4oU1JzHT8f9jk9qa6uf5IjtK4GGvxWKFr60GaGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0g4u3a1NCs2Pi954EIn8pKAWuyUrvgWY4u
 8s5Au3R/ZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1eLiB/4ji4EZcId3I+Gipm7fUItEaEkdL4jBiSVpgDbR58hgGaGfh+rgg1iUC2K1H2n77wSd8Qr
 SVc9HGNGyoO+RsgWs2Q7TnCVDiYvrZUQnkVc2p9Nd9vNYCrpW87YySLDDgKLZ4bn8BDwb2nwefE
 ffzgcvATuCl1rekKNCxLWqIKz5PUxhd0rTjRXQgcaMpRDZ24nximOaUERVaE8jgKNGqy4nlXPe4
 PHmMFyHM5RlrJhBRvveyw+dPfy+4nluaTtsx3GrtM9qhNowxjd2B4f+K+Bs9fCSSwbTBJFKzuzQ
 klbUlOK1fCXVmzkHriccIeMu1IBi+WdzUkpz5G3GGtC0O0CN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXzAYnZMlCbyNs
 7FfRyiBaieTQeUKFEKngkmWs2NZYKCN6Rs5N45O7WedgtgfTg3xkCWpBfq1guz5K1Ehjnwk7wbM
 /x5CQmVEmHFQxRp/KoKsZxnw/D9enxMG12j0wtq1rgqoeXMAyDQeERyZR+xpQ/irycMmTAmph/C
 TnU8H3Hz6Si5zr1mhRR+R9Cu2bBLlQQwB1uzuIicowdQgZZJQpyxwIbhcZRFfHO6QiOHnNxEwGM
 eObb5z2S5Jh4vjYKuc+7ZNt1Cag30LbB+z0fQjZYDQk8bT18s6xCADzkY8/fWVF/C62BhCOYE1C
 C7iVJA2Ns7e3Polm1XPy45A92LwBEgliRggKlM8TO7MT3225iGBsuJaqRyN5+gv8aH1/stm/6Y+
 xHSAUQJJ
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=68970805 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SEMqefzL_7n-ScoQfNxb5FRLcgzxpYCC
X-Proofpoint-ORIG-GUID: SEMqefzL_7n-ScoQfNxb5FRLcgzxpYCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 55e37ec74591af0a1329598f6059475926fdd64e..352824c245224d7b5e096770684795625fc9f146 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.39.5



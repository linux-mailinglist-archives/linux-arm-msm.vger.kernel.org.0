Return-Path: <linux-arm-msm+bounces-55699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7AA9CFE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904013B7338
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A29220F077;
	Fri, 25 Apr 2025 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sb0Gs5DS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978F1C1F05
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603234; cv=none; b=EK0zHfBLClWmYpg2hLmRD0nQoWkoJCL3brKCqTv/862RyBSF5wgivVCRn3TeFm5bvLPXhLcXwSOAHjNKE9z5YRTUfngJjDeAdUwNysXZ6HQSQryziTuWkiaXghMVoICS+dehDDmOVjP2Mkc8WlB589Gbs5sLVyuSoa4ntBYqn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603234; c=relaxed/simple;
	bh=J08TN0ztRB7ngJ2Xbw4dsWy2SXPRknR9RhUG+D0mpHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxW3dZ2BhB2P4r8gExXs7vee8Y5NPQUTif2DKQfi3JObWDqopGW/K9kdoMpwONdS8C7Uj8FC8vZ7R6KSRy0rbcP6YCffVnl8Dy4ltG5PGJDJg3l0NkFCplbkazamy8k2XMHpsfubPA1ElkPW2jRnCci7hmX4spO5+iVlgJTA7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb0Gs5DS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK24b011285
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=; b=Sb0Gs5DSSnebJTdu
	4BFchMWOjEE0/t3PszXoumzDdAkbREcFkxZMObDKxurApR65XoWnli/37EbH72yo
	QdgmvX2e0TjNFLk1GcQ25hGJede+M8ONzPwznWoqqfqPTW1j6hvyEwqUyyq2bmXS
	O2de+4/nSPLREmLWKlhrzaMadHwe61rY5pniZNIrB2YG9dlBcUw+ASTRc6olK2go
	A8MBMfWEsY64NHJ7MziFAkl6y+pMlQ684oyYk61Z/JgCc3QkKLgZU491nhHZj6Tb
	ToW40fkBIQ03tEvNR8zH3dnwVuPdZcyuxfm1XlLddMOmEQ6nX7PiicKseKn1tgrJ
	FWHvzw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ed0526b507so43230116d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603230; x=1746208030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=;
        b=uPmMRwbunPlFFz5BEomEriXM+4Y84VqlIJP5f4xSymb23IaxV6RuggvAaio3Bjj+0l
         KNtzFUTY9eZG0BdCpwEvdBfIDK851vWhu2vuJuquBy/uxPuZRnT+vzXkm1gb34FzOKf0
         Dqt51hb1GlPGd6T5n5tBSOGqDFvC6cfsnviSoT/B4Gvi9DRsONyDBpCB4sp9J+7GEoOs
         xd8rO+gMuJPbrMrCNK6SL15wEbk2rMui8loH5JY1OXVRYQjTccEaQfkVTtKOekTAGH3O
         XID5krBVlll6+Il8v2nytLujF7Likf2L25zpR4b4kFzsn8YCm65oS03ifcQdEexUMUrR
         JeEg==
X-Gm-Message-State: AOJu0YyOZs8CPc+74cwvqlFYyXcyA7rUVv5W53G079b3ZSEKom58gy9L
	/ubZwBxUKww7yxA6le3MTLT6c70rthbL1fxDKrlV1Q+lqDJQ4dBdYD08j0THdfv6w0SsoQkWCEt
	6GEBk6AsVG38AlmGBsAE3zTCoafsnQicZWwxmmK2RqTZx/cQfAsXw4kXL0AATUfc6
X-Gm-Gg: ASbGnctEaEvbMpMtWtjACkACfHPx+KjAugOPwfWzbkG5iBic1OuEJy3OZNBnIuKNo5K
	rCgfK05U1hvDJekvJ/QsaYkzB8DR8HNgvfK2i37/Onxw6aEazljwmpyIbxxOx4sZ4FEAoUFFUaq
	NT4eDbW4lROlx/+bBvuSQKGfyfGFpXLuqS6/0zRS+xzabv3W2cCH4xrBv+qE3S1IbRm5CyK1WFx
	4hEqSYiz0HXSSabaB0eGIks6NZxYdY53XOoqg33YJ5pEgOHPXf5/UVMr4Ou88mg51EYUWyHYMHR
	cMKxr8xjfjGltax5Gm6rUvo2EGwzlc/WjpWvWPKdtON0wpgZWU8rt38iIsdLabXpBISzwueVaY1
	APNWVrCy3v0O8HgWLrkljL5dz
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805846d6.34.1745603230594;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIEqY7ImncnVDphCtbnSGLOWmanZeVwVNunDzbKH6dvD3Kbv7e2FBrG3D+7RsO/6h6RuRDpw==
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805586d6.34.1745603230262;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:01 +0300
Subject: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J08TN0ztRB7ngJ2Xbw4dsWy2SXPRknR9RhUG+D0mpHY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qZUWSwuEll7v2nmDp8IdjOzzGjkt+i3ZClV
 2s3mTPvyBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmQAKCRCLPIo+Aiko
 1VIeB/9B6xPFhmfAsHDltpJxU10pORyD/GZK0TKmUo4EmLcQu/iAUyp7FAAxQ0dV2CKtKv3Yssc
 e+MOgqzwAA7xY30vFFnLWNNdVze4SQm2ozgfZfBU/8A5dRaF1qWhAZhhWuohkpuL0dziErXzkAS
 OdiHeAiZMJ9WR/co7mEq6OxK+gQDVOODLspiwszb1hushVDHWuptWhejp3Xca+Ndl7cUh5eFdrc
 FuBMaXzKBcz+r3bbd7Xq/tuMM1Jh/Y/2T4duIOaUb7FvsQfnYc/Js/+C1MiF64KDlJgARAvrgZD
 xktTjtjH5vqj1E3O5j07YJNwO0JpvH2sn2nuPHnhSb6Xv/GP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nSz9yzNsWXaMr3iuC-19q7vYghOHco6a
X-Proofpoint-ORIG-GUID: nSz9yzNsWXaMr3iuC-19q7vYghOHco6a
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bca9f cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LOr32vULjwKzbL0q30IA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX9W7nOzGr9XVJ Go8+zWqzruItlXeiPVIsKjN4oivUEbNAHa5k9Fa7W0EwEQl4BtByMwaCpe41AnpLIHGabSW3Zqn ueyPX6L3QdkYuMkBrVHvep5D53ERK4WlcCR4O9PRrxj2zxiDpBPqBVhM8BymaA4cJX+faFtz0FN
 Ytr32b8JqWlrx9chsPZaePFoIznkUWQHcTbaHwtaQgRzobkuUDGFhAp1aGEgJEh/WWyhCzyZVU2 YHB8ooVFHP0vtJQeSdh43h/o96V8fslAdG6HuuYdSKeh+7o7Ay86+yy1yUNFdotruwH70eRDeIF LcEXmGDbQ4+0YJSeWx3wL5utqJJrQSRwOsa89h7yhBdOpNQtn71nAxDhsosQUCL09kOetR12ZNi
 RcGR+Kl6FIfDD/tORRipZCkwQ85BW8rS5enFQZIvvSzOQOFs4StCFjYIWsiLE30jn+J52BTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

For some reason Lee has mis-squashed two commits, picking up one chunk
from the first patch and one chunk from the second one. Rather than
trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
Add qcom,apq8064-mmss-sfpb").

Fixes: 2c8de7df7418 ("dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 71741f06d2fddd2d4fb6b69c1cfd2d449ce73f64..c6bbb19c3e3e2245b4a823df06e7f361da311000 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -98,7 +98,6 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -202,7 +201,6 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5



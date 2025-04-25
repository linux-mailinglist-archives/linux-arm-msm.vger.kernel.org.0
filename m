Return-Path: <linux-arm-msm+bounces-55700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F6A9CFE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887A71BC3595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D702821506B;
	Fri, 25 Apr 2025 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtM1uIpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F51A20FA8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603235; cv=none; b=G3Yo1neGqCIklGLnwHYogg6MYmoVErkE8xHtRhgwsEc6h05Nvl/+KSy9V8NOZ+dxQURby4/4Du7qiPmc8aGDgJpemW9pW+BoZZUcSgDHJF6DAdJEetSCqKSrdBM1AmpzH2MOQ0Jt8mJ1IUYoNs0gpR9h6oxFTXAs4hVcfv6w3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603235; c=relaxed/simple;
	bh=mUif3lR0PSG/HqgcZ2ciRfdEjndZCJLRXpKX12Gx8Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcnIyDf0m72UcfndP1wB2M4ONd+p0r4hZ/aPOJRPfALuaBzNpt9PRW+4xYF97yEERdl3VIkdW4NB+1MHtAY0WaF1wSds2hitd7VWFExmUwOZt7k2vrreC64JmnZnU3SHrHcHK+mKFMIrk0UDpquUC6WXvted42qBRTASCIJDZ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtM1uIpR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJq06004638
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bma7Qezl2UbDO2xCAi4cNSVueFgJi4IcQwPGvmhljag=; b=WtM1uIpRxYSK3lr9
	N99dqcPmaaojzAXob7daZkOhRfvoaLxLy7nPGWCrxq04xB4A0RuZYNyY53Br98ZX
	QjYPTMLf4v9FSB4Z/aJbITpNn+yjZI6fb4pX2MmnkacQf/A+LNhE4KCl0UaUIujd
	eb2oGAR9p9dSv+B2F2eKPKzSdEYlGUCixy3THvnoFhcgZWVwZ7Jzaq13sMRzZzKi
	fptzoVMbmWK7iA87/3dZaubEkt7buXu7cTmrcZtKs4002C7pu2+ke/3M4YVnfWIx
	LwxTtgUvEo+eYpdfE/12dMB846gyIe+tg+Zj88/o3YZAuUlQMCxQN/MDoGDynimB
	2Vp3MQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so414830885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603232; x=1746208032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bma7Qezl2UbDO2xCAi4cNSVueFgJi4IcQwPGvmhljag=;
        b=Dlqvp3v9W/bpm7GHMOQ9CdEJjHopxpnKNOUcIj5f+twSebUCPShcUuFd5M9II0V39p
         4cnSH7NEs/MFvWduCl/6SCcD90S2JB3y857DglUtOIEdYz2DD7eDmW11CPYxsXbcd/4u
         dTLbBTb8O3rtX/+QDe3XkPoHL+J3hV6tJx02chsndwSHO4A6zFu0vXqOPXbT+aPYujVE
         nMFB1hguW36kZOcNYSIdCkXB2c5TKw+V2BG/r60/quN7vMYR41mR4XV7HJ7jJV60VldB
         upJXH1fyfMpeg2UA5V1MQbXIt9i+eqER2m2xC37QU7ezle4KU1GtKbnVyylK5l7Si/MH
         DoLg==
X-Gm-Message-State: AOJu0YxtFQfuzEbJoceWxomZTNILZxU3JuMaORZt/42O/7paMK8c7hzt
	pLzWFc56IZftvdT0IRZGFNtx5wvQHqCFwJjeSQYYfGhPmzzXGmDn5DsXFI+sOJ8SxPoqKOfppLQ
	YPWkmRefLwSlHDAmX4Ibl3P2BKAtnoYAA5EsPXh7socyZo24ZHsYCWTn0Qs86RfZX
X-Gm-Gg: ASbGnctMY/B8lDxBy7cikFzB8E/rsVWKW/+VBMsU2uqJ9Rm3Ne3FgyjF9tnB4MlMxY9
	KcPlV2iIlrfby1N524uPR1NxUcSEYPBU91s9/PX4HJrI4pnrECm5q+qhHZtfWhxo2foTfyacBga
	FzCwfd2JYZQ5A73ORWJbtQ+qd0zx+klYVpnIdP40OPAXsVgMl6VkyVvMxu7aEZ5n/5UO6r/eRBi
	RlZQrFPRwGt7xzXvwEYBGfzOMjWH7NFhBGOC+8tfvSytCIRqalQRvySbZUP+F31ZovnlMqz1O/n
	g5ORcbqoH/5S0C4sruloJkDsOraE0cwJyWR+ho1GrLHPD9dyfM1tabCFbdhgMplokro1eeYonKS
	bYbXXQYcWT81gqNyVFdlWVzI/
X-Received: by 2002:a05:620a:2706:b0:7c5:54c9:3b8a with SMTP id af79cd13be357-7c960711409mr486803485a.26.1745603231930;
        Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt7mjq6OlQQ/4tvC5bPzsEBKl33M9pb3uOW3cET3lS/vXO07nVvqUKzXnJ0oHD+s6vc4v/bg==
X-Received: by 2002:a05:620a:2706:b0:7c5:54c9:3b8a with SMTP id af79cd13be357-7c960711409mr486799485a.26.1745603231631;
        Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:02 +0300
Subject: [PATCH v3 02/11] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-2-da4e39e86d41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUif3lR0PSG/HqgcZ2ciRfdEjndZCJLRXpKX12Gx8Ek=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaxqK+xV3BgdhsGl58HMTGWuzF9E7yI/Ihk
 ecnNjK9hBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1TivCACR1DBER0+mwSrW1ZxPa0IuIF+/ChpFy4jZhNybfElF0UcC9oECBsobIAfOSoCjqpnpho5
 3+y5H98SNTuoshl17dunWSasvvftwR8qyHFFNhZ2Iqynwly85r56rzI6FWk52p1RzKcaMJIXkbK
 RiOirQXcbmiTdRknSyL5ruVdebZv1fg2uhQ9nx2bw4kncqFCqeEqdViFJR4JWwX/S+cactG9Fnz
 DV8wJ3vmhGABfMd3nEeoxVRxd5yeY9kfUWt0zt6JUr78I2xsHRd7mKlEBwvSx4ry7/fPb3un9YL
 t6h8wrBNaXzCZDULJ7ZhWsd69yRPeENUivZSgZOd831ku8Yx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfXwzxUa6cHQg4W 8B0GqnyI1pPT/Vj/CqzQMEwxhquFJ3W2LXk921oM4KaBa4PgK6d7uJxKh/vQheQoHvfxXmXEMdm TLxXo30rykW3ErQKt0M/gsOayjscLjoc2WeHy9pwUR7zbrWcMQhxVy8uYRlIg13HvzO0pg6Gc5N
 EPrm7U6O5348IXy1d9W95HW1E19upydk8SQOI/7TKhmi9X68vbers6rwkNADqQsBq3sJf8xC3Mg qOyW2x3es3B9keoFPVN6HZuaR4dfz0xqnTF/ekRYYoFLdIUH17I5hLz+YpLEuo8f2yVoQJDmnny rRajCdKTbHi5cAYm49FEK+FZpSMAN2c1uuoUmNMfvE8366IVkIpJApGOyz4PFviiMC5RIGjdYYn
 tPohLG9Y/v1MDKgMzuoGciualP8djPAb6j8SHmA1PWSV1t6W/RhStN3MxnkGoCP+asVJjspt
X-Proofpoint-GUID: PPUfdmjsuojbVrZqnP5-fEmJp1TuiXoz
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaa0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PPUfdmjsuojbVrZqnP5-fEmJp1TuiXoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=971 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

Add compat string for Qualcomm MultiMedia SubSystem System FPB.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c6bbb19c3e3e2245b4a823df06e7f361da311000..0004878dd0da7e9c84675afcfad7a246c561eee4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -98,6 +98,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -201,6 +202,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5



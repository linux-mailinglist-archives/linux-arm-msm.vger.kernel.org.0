Return-Path: <linux-arm-msm+bounces-51728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D913A674E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE9884238BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F8C20E328;
	Tue, 18 Mar 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d96vf3+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912220E01A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304134; cv=none; b=Nqe77Wbpqc38jsysyZuxkIzz46n5Za29ZSBT6IF8mVhaHULTkICyOHbqu0aoilDgCY2exUgf+Tf/OkxHZle0LaSO7TEvjVK819JjY07Xj+NgqvjlkTaVWjBt3ux65QDTcDURQC8aXHYYh4FnHId/e1vNK0OCpMdrFEtC8bNpOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304134; c=relaxed/simple;
	bh=BRp8ajWiZ3GoKRS/wFU2oNiCDwEre0XdpX0f4IeiHvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYVpwbZMzgEAkkeu2SnRvHNF+McfW9Jry+DLsjUFd0QMkSaNEewFxopFVOFgFZOcYFP9EhP6V3DopJtpNOZesv+XkvKJEwHQb5jmRvsPPLqa6lgECMoY8RC2UyrdOLbqeg7lhoPCUEDJDzQCd5RUmvDhoUTaxjGiy5xmpMb1fs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d96vf3+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeAGF029857
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7upYdJ6N1NsAA6K8KEn3cSwjep8M82X8zV+sP22K8jk=; b=d96vf3+Nyrwbkf3v
	IxFpEpsrzOzQK7/SLK59qX33IrMkDo1YaPNHntbWXmgKgRe10oSARvD3oFftUkCH
	Flq52dYs/1eDqxaCTONHF+pMT0sKBM/5De0BEF7xIPgQaVgCvqLGIEfqW8T5ub9n
	UBOb2ZHQns5UHcYezcLyT3WKb7IvIu0HA961QW5iD+HZFpn31j95gc0FvAKrkMxP
	vj49lCQlXagPq7uKiPAbovjNlPUPcJjKvHHJlKe15iZkhOxMsKL/dZ5jY0tKqs2u
	fe/622IgiG1IdGBeqY5ZudeoW685gp4fNLoPlwXuCoCwox5ChQJLx11Q4G1kXzS6
	uYQmoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t04c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476aa099fb3so186947761cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304128; x=1742908928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7upYdJ6N1NsAA6K8KEn3cSwjep8M82X8zV+sP22K8jk=;
        b=EZ03YrBLyzIn4pl8uUYMnyhTEqvY3v0TojxjtKIfXghzfEgjBIe40B5yUiganmY3eb
         73GhfKbzU2Kfmb0DSOO/dxD0FbDi+eDRtvxC5MdSDYkCSU8YOVWq7LpL9H1X6RDa5K7m
         IsFi22Ybnb+N1Kxcc4xFmXX7sqR8kWchnQ1AL3rtT4pxm9JM0ukpRxZAA++LrL6oNBww
         Urr0kLD195CWAADAknuVFceo0wNckCvYi+413gtTFxpALI1nlshd/pXZA82Ob1ECU1+v
         YGQg/tTpSAJnj+cKFozzsVUVGsWyyH8GDH08+yupLl3sokVe5azUd27W2PEWDbsFNbw/
         +GWg==
X-Gm-Message-State: AOJu0YwXajV1SjEmHPy/wzICLzd1qhM6qcMdSa54LWsrdFnP0AKkAjez
	RmPa1dI14mCWpBhoYjd+wYn8IHTqYqOwPeWHC1aaKGJBsXGfVovKY7grMItRiZF91fYKzGnihOL
	YFVe5bYCZr3ASa/5KTi2lgjOwOn4Y/giPSZBMcP/RZbntZLqEPp7YcNLrdil+5PCu
X-Gm-Gg: ASbGncs/9IMOcJgpwQ2f8POuh6l/OX5IpnKzpShHz3ciZJZsHpokB9AeeYp32X2DdHW
	yugz7lzqTbEYrdU/zDdotTobPmf+E90upcdPV6LyLprCpZU8Pk6b3tW3d5Sdjh7mMEclDF5G9OG
	CeQDaEBMhlZZQHwwRhdyAJHh/YCRXAbjF8Atr70tuVXaZ0iqxO+NBAPDKvn6cb/dETNNT1ZV3Ta
	iOrol7JAZWJEShLCFteGcHIHW4k8pPF6mayciQ4Dh/fvtzBw4VMfe8MAa4g/5SvylM9MY0gdgC2
	IbOBz8cqbmflpM4jYyCTV4EUy+n1ICInI/K9wYhGAJefIMB+55smOfJPAqpo5hikKniG+ppxx13
	SwEjLlNMXbBX/6pT5qRXuCCOrn0wP
X-Received: by 2002:ac8:7d14:0:b0:476:9e30:a8aa with SMTP id d75a77b69052e-476c81b8083mr237297211cf.38.1742304127784;
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyjFpZgE4AvVRtmbsyhAdFg8jsqIKxx0eZ9NIiT1apJ6WBsEKHhpnpfBGf/aSEao+g0riIZQ==
X-Received: by 2002:ac8:7d14:0:b0:476:9e30:a8aa with SMTP id d75a77b69052e-476c81b8083mr237296911cf.38.1742304127430;
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:57 +0200
Subject: [PATCH v2 04/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-sps-sic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-4-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BRp8ajWiZ3GoKRS/wFU2oNiCDwEre0XdpX0f4IeiHvE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1WbdvxuNPjibDFM2fVqXm5cN9LXfh95gmK
 NG/CBLuHLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1coNB/4j4qf66Vdg53zrAGhVZa9Tk/yd2qYYnPAaO2sqDfaZwxpHJKCZ+YOYVBQi2P9yiPAOOUR
 uDf9GVf78TdxK5ZWe3OxPHkvBDW6DXlaFS2w8bySrqpyGcxZDVZwT9LnD8QfLSEI73LmfSRcDhx
 0m8c/0wFJHcOfj+H/vrs05P80MZR1xrHKh1r79bhLfDEajwLek2X7tN4gVK9/XSG+s/71bwxf9w
 J/rexdi9kFAoE//gdW+xVpjMZzX8/gTTj6pJF6vxm+ve1MCA60IK8mlZ3aH8WsPaCxrHGW5/JXC
 UUhB+72pCgni91F4HxSBG+SRmJe7NTgzaWH3vp1CHFhYzE5r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MYxoOr3tsaHFiqVXmOS0FR_JmHPAs2FO
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d97381 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MYxoOr3tsaHFiqVXmOS0FR_JmHPAs2FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=670 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm APQ8064 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 2836e4793afc918067d3ef93baf5bc7096f72f12..0d2530bd05b8c114232926e3ba8b0fed99e276f9 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,6 +95,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -195,6 +196,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5



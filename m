Return-Path: <linux-arm-msm+bounces-84497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 864CECA7EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93EAB306456C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C936432939E;
	Fri,  5 Dec 2025 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maBHIwKs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVwwkhOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C482866
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764944627; cv=none; b=B3+5n9Aw+eMzT261Wo4rS1qgYraMeiOaIA29bKY6QDpWrAF9A58vBby2wCKSAjSP3c8WpBt/KCn/xP/3kD+qC9PTOE+GSKabtcMOCKATBqnaiOaZR8jBtiTvNv3SrQRVU7vMs9U2N6y7i6S1eyEkIVxRrP1lK/fFTgxdr3vGZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764944627; c=relaxed/simple;
	bh=GimUc2ePlZuvy1QOu7c/n8QletDRsYsWJFcZcb67Pjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1ATtjH4RKZ5ugL4IwOtP6owEx3Un6Q5jihxw959ZRN2uoUdMAq3JJfslrEGNaNn/6jyLIkC00sOQIZsBz1kEJIinskK8IGeJvRXhsVXJNatSJoFaKxMigDY9wCO21XK+cAXuh85lB2OxRNBM8eKII1goY3aiJyR3ehFAKJyJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maBHIwKs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVwwkhOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58IZ5U2516884
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 14:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=; b=maBHIwKsp2Q5lzg6
	TkYJ2c/s2exAsl1JgSSeIxvvlUk8pV/KiK1jZ2TlvaRi7YVERzSXRTMrxPZTjm7t
	oGhVr3NUcJGg7qWuxm69RGbTGSXRsJCps0Uf0oTmE5nGMxxg9zE8E66j/N2H8Y6p
	/jaa0kr7jYp+0M4gctW64eKN4m3101ZBQBrc5Q12p/9mpZeiVm18Kk1LDQpVuwWN
	FTz6iF5qn3waUXv//7bODExJoHZly7mn/RR5M9uMWIZZaf+H4UMs26NlWWeSlyTt
	gapz8Wkp2C8tLDXUDamWst5sIj6+cpw1sNP/LGycX9B2xXOX9gNxpzVEz0CgrKOD
	bCb4TA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2e6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 14:23:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b4f267ba01so703836485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764944621; x=1765549421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=YVwwkhOQZtioFra7sNO4ScEYUhxdearHTVd/nu1vXRXNyqx2NUN2snqFU2GH4QpJ/r
         c4f2dYwtUe3RTXJzq6UzMpzkl6XPyq7dIFkod8YKWkqpvWTQdv27wuFZzCoNS83AWdqO
         IqG5yAcGbLNlkexRpWDIxFahhU8+4Og0xLv2N9N57d+L0rT5Cl3fzj/77t7HyerKLdos
         WRv+sdF0Rv+t8bckwiQ8P03VbkDhP5agCf3P3h3bxBRSVTRE70cveZKsQCYnLRJ4htV7
         LdF/xUmK50Gf+jas11ME+nE4B+FQnNDpTQUfynhX2YUkhf/k2eXyvcV3nAjePaOTq7mn
         MxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764944621; x=1765549421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=BfBWngcK5HNW2MI3akyuuUDfawjkVQj7QHe2XkzWS+39oPmNqQcJYICduwB3eqJDuF
         TZusZPsxYa5EbnzcCaNf7BU5rx6tqppcB4sFZzhT2b8gZF6DK/cyLVgLCx84XtJFVgYQ
         uU8LdCKFf6mLCBuCj6Bna+JsIm14uOKFZrR8yrjFNwphb0hwn3S50IrcF3JKGy1ZcTcS
         1nixyDbEY2v+u/j7wtlPJhRHhUOOpA6gqhLBIKqRoec8IUXdzzEsEt2ptTUUyIkgTroz
         VsvO9BH/1P7dtRKG1B8LV/HbbA0DI8VIweKl7xOsdYXshGcdmwVqQT/nMiw7gYQjbJ5h
         pvVw==
X-Forwarded-Encrypted: i=1; AJvYcCUEj3R4V6EX94df3/j6kHohrSISiWt7vAb+SwUuOUBiDF5lZiAZ1ypB6A8b4Q2nczMP2scFFWaTJLcLTbqz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24GrOj553xT2j04uxjm42CVP4aj2zBFgbQ2P/NCoqd3KnkW3b
	wt1MK+Dj+HPL7nXtqtUGhcSBtfeUXdmtmUrM/2eAqZdY2nzm47JzydtTcjtc82nPzBdTkuTHBSl
	CduDcD/095r/0p7WuDryxd4gwW7Qe38yYjqmwRgI/n4FUfLENooF6A9h2IN/8owvk0Ee3
X-Gm-Gg: ASbGnctTHIELuG+izkx0oceXSg815TGkioupWY8TCKnE55J6sET3lXTMtOrPZZB2q7Q
	Xsvz/oWk6bCQd9Xru5LZkPFtSjSsE9jOTFxn/THcThLzda6j/bN3G4RDncyP/38KE5XLewhafXT
	6IBwmbsU6PZEJ/G5ocMPRoGhIEAVdZcAYsBZtf1p6AsRf+TDEbH0QhD1JJoGImCi600cms17E2r
	Q3lGcvQBuzTpb87lEld0lHycAeluL2OkNV46Tf//l/tjveU5PVXj0AYfV1/H1wQW4P9P4nPd2eu
	EJPJjlOeusUnXm1ESBTaA7osdrnSk8P36QZ1KaW2lxNTr5iBURMnioXTLcBm/9xdGh8BAYitCzP
	Gn0Qtf8iYG8Nrh40=
X-Received: by 2002:a05:620a:2846:b0:8b2:767c:31c0 with SMTP id af79cd13be357-8b6136ee5dfmr1115231285a.4.1764944621239;
        Fri, 05 Dec 2025 06:23:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5DLeDF5MUOeEd0Y3uwh8zOmL2/TE7Tcf7NqeHJtIonKuSqWCxTdwXxHzgl2J/N5U0u+0xYg==
X-Received: by 2002:a05:620a:2846:b0:8b2:767c:31c0 with SMTP id af79cd13be357-8b6136ee5dfmr1115224685a.4.1764944620730;
        Fri, 05 Dec 2025 06:23:40 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331df0sm9414161f8f.36.2025.12.05.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 06:23:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 05 Dec 2025 16:23:20 +0200
Subject: [PATCH v5 1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-phy-qcom-edp-add-glymur-support-v5-1-201773966f1f@oss.qualcomm.com>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
In-Reply-To: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UjT3XNaICZQxaI2rtQkKLAQyo6ogQ8qaT0RvJnH3+s4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpMurkYipeXP0Khfx3gZTg6GV5H62s714w3l0Du
 DQ9TiZBE16JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTLq5AAKCRAbX0TJAJUV
 VtX6EADNLN1GC4Br2P4WQlwrPRF/EVq3EEzgOBQffcjVqZ7WxSwm4CGZz1sayUYRgE3FPKL6IKa
 MVXLseh54kQhMta85wAqumsYQnVoLchalVJ4dy20gaTEPY8qCNXx+Q3h85l4h9NHA7LIp5JQeNs
 h3pd2egcNYf7+jvYdfoPSLD1D2nGpBv+3uiYeYW1G9GZ3KxgzY0o0y1idv2pjOyBl3d0OsyS5Av
 VYJO6cT0hhQTXwgU4lsntAyqnAoCwbGON8o9DzWdMKQYvY2lPliisxsQ25tBmr1iyGghiQgD/sv
 lQb0l7otoeHgx7lPzYPia0rxiklNxHgKj5NKUcnNHr1VMl0S3jPnZxqy5/fqH5bdbWJa9ZnzXwD
 L5hk3ePJ3G6x1r8WrMwktrVLDTkQ1GGw4q+WtPZ0b1ONOFuoC2LifgvSfJQ01itu94h6q5hFRvX
 wZonZn3e6cRNcAHCPr1d2WU3VukoN3RyqVgfaOrP4l10xuZJhmsnMgf/RiOZZjmNHQjrGJvOSxM
 JWfLGT5hf0IZFxMQT1E5JWkiEtTfNtJSzXZxys3iMY/z5v9N/TV2O5C5k1gnKp3biFeapwmT6sk
 C0pz9meUltF0QhzXh46BECbMRI5IeqlVvG35Og7y7fDTVdJ1Z+lRshZPXjSHjAKIKPMYA7L5D2y
 KcPsqQnX7G7KeLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932eaed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=adPXzabyy6ZLveKXoAMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WJYCw0FPG9Hw0FZEHhSmEN_6z08PAHCm
X-Proofpoint-GUID: WJYCw0FPG9Hw0FZEHhSmEN_6z08PAHCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwMyBTYWx0ZWRfX0FF30kwVWB2t
 2tN999dYc7LU1Pdd7cmbdgybr7gC113mWmj4gQZwqT25homH8hblMIlTYuo/CjlcIRpeBrzhX1+
 Xk9VdDUTb3P3BOOi+paTCJcIdSYWOvh0eVhbMG1W+nBbWEuH8F2tUxRFTa9PlzA1yhJHsWTcuJE
 GQzUpZQuDdGPado8VmVNQyfaZipCns4LbkWuV2L8Fi5YmRLGORubI7Gn+2zrVGcWIjh5tlwRiyL
 k0NsbZhqtS6pAVHtxRQkGRq8IrEhLypLYE9t7ihvZ85fEWveqQ482zvIVCky0Yr2Ui4DiutEA6u
 3lvllm2lwqODsTL4CRmMJKEOXQp6ZwLTzn6WX1fYYliqnOhgMl1gRUQZqeFFkLNinGWY1JJrfBZ
 gcKl842a9pQEwKwfbapTz0ZDdIu68w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050103

From: Abel Vesa <abel.vesa@linaro.org>

The Glymur platform is the first one to use the eDP PHY version 8.
This makes it incompatible with any of the earlier platforms and therefore
requires a dedicated compatible. So document it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff..4a1daae3d8d4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -72,6 +73,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-dp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:

-- 
2.48.1



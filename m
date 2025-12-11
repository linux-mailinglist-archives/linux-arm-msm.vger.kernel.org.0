Return-Path: <linux-arm-msm+bounces-85026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CED38CB57C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB5673012757
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CBA2FFDDF;
	Thu, 11 Dec 2025 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7m+D05o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5dyLwIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50842FD686
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448257; cv=none; b=qGL4Bo21EyMhc/GcM2hjgRSMmyuIUzvGvg3C4dumEONyvMiJC9wrUXU+h82Pmo8rXyTS7g0SIFTQoy+Bp5SetvpM9RH2mmCRXmBPd4Ivcp9tLTHTbExEmvV9w0X14Nz+8iL+scguT5wJNfaxZp2ljYPBJ6ttgbw7+kKlVByNqKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448257; c=relaxed/simple;
	bh=GimUc2ePlZuvy1QOu7c/n8QletDRsYsWJFcZcb67Pjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oq3u3ACwixzcgwzHaAIh/F7+9eZmBwpjr2/XQrqAsrXPOO3SOuj5VgY/ESMY59pXCuSzgwGnxnbnleXI6dM23J47lRyjdRCp/rZuUJ4W21s/ZAVKG+RG5xMzBQSjug/vbngG10ymuNnwhGZCGKN4P94b+BRRIl/39L9dF8oyjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7m+D05o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5dyLwIM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZVip343006
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=; b=S7m+D05oGNQDN/Iz
	6y1lcDOBlCdxl481l6Mp3vYZ+7iPA7y/Q6jFuGCK/9C0HBxq1rpEjV1nd1Qj/6+E
	h617tBNBlObqcS5JTRCeCZYau62RptnkV19i1KFC3j/BFm/bFOTMGR9aEdiAZwhJ
	WVmgrWkUtUGkdkzyRP/tr2dJywUFTOVNCk8gEzC4Yh7vJ/x3rF4xthXsw7/vwYws
	Hl7jeLGGAKwZ33Xe2nZyOhm3X6rUynRMgejnl5wEBRr+Sw86Ua9xcIPzzomsYRaO
	VzjUSrAXnT8jii4uOxoF4QgVTKQFYv2UrO02gK698qg9FdBnNeo+NpCPm7g+jgX/
	HacnUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvs729-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so21715251cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765448254; x=1766053054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=D5dyLwIMuX9n6N0+3YpzToecPUHKu/W+Ac+N1AlNho4DBhNX6KdMumeaxIUJDih1VL
         dMtn9nIGEvJzd1Vp9vlOZVHOGyJ6NZcKlJ8JDJhjNrLMyARVtee3mX2RY56as7NdZa28
         1vETwYVYIhojq9B7iPOToJyMv9Iq+NMpgpFIoHnczAMiYzlvghYRIQDED4nmG/rHtDVv
         pE7E5e+2fJVpX7eLr4OTnJvS4GEwSU4qLFX7unpZ2Vjj0yjZJMUIZAAVLiBANrbEFmUO
         7Wj1g6UNnUymErOlIf4R5vEHGsBTcdgKVkZili0DpgOios+JAUelpi1IyHf8rQD1obCh
         arMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448254; x=1766053054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=V0D1dFB3edYPdzRLooNsGLCyONKsQJ8EGLAOuGj61GamtFzgYq0gxxt7+jhYxaHQhV
         8rkV+gdvFEArdVjxnkgGVxq2cpxH1ZbEV6zaAl19OhJMQVx/yr4yGRKBFbRnzjtDD+3i
         gIM4o5iDI4p/9oWdgCL+IRtOePdrvyTkU3kBBLZzMktFHEG1sAP+X7KDCQQK8uAdwqaH
         mFtdhY0njV/4iH1pW8fyK0zDb5J1Ld/Ze/+E2hCh+EiWSq/1yyCZq2z0+SZA+nCgSTBB
         r2eCnb98h3KTw7c/iSYD5uvyG/jQxt8eG+dV+goAsqO58KG0eebJoUYknM6SVJ+3nRIu
         Zo5A==
X-Forwarded-Encrypted: i=1; AJvYcCW9ouJTQu/JnnQVC1lqHn3wlzSovWIoPdC1h3E+kymN6SoduKOd8C9JWIJLxC6LQnbBkJdO2tNNwjalwmhi@vger.kernel.org
X-Gm-Message-State: AOJu0YwAySdLlZVQaC3O3xjhPBRC+9il8Teeu1xXiss4R3TtmjZjAJD9
	roSkpmsH7+e/m+zoWTs+/aCx479q9Opwky8ZzK/HdWuIAmFOxQKWfQz7wDDIS7xWOmWLdTWSXWI
	WqhHI8MrpzZvnF/r+enWNU1KIf+Bui26nRYWUs7wU7PvLcNYvnD/dP5aQBKMLfULl+uV+
X-Gm-Gg: AY/fxX67ghpAWdMh9WwKE0SX9+onn1LFoHPuZOf7KElHb698OGaXtHGymu/xv8JlR+B
	nH8+EwnZWxANs7R03oRGb/qGFbv+WNPMLmT8A2E7bEG9WSIzt3Oewh1Y97F/nIJ77G5ox476wCf
	06mFrIWnGE9QK9toHX4ZWZ4LBdiquaqkrabfdjFTcrY9bcPYgZ16hJD5J64BfZT2YA5q9zYLVgv
	+IHNf1p5zT0QHkBl05pN2B1KLwOcN8HAou+Sc4fidcxBWDAEqtNGf+l5pLJmwqalgrWCv4sX6Pb
	PFUQdt7fEv28HcGAT44zh9I5zpjXHWHC7e/30lMCTKPXAA17oobDWTODhqJ8G0D+LXh6/0HWaF5
	rqVQs9+JzUIoljTc=
X-Received: by 2002:ac8:57c4:0:b0:4e8:8c99:832d with SMTP id d75a77b69052e-4f1b19b8b0dmr65592221cf.15.1765448253653;
        Thu, 11 Dec 2025 02:17:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpFdTZhJfdfYHJFcMDtbP8b+NkVt3zxI4YJr6x2S17R5pVc36NFQVmDmr/3TO+9X7OLif+1Q==
X-Received: by 2002:ac8:57c4:0:b0:4e8:8c99:832d with SMTP id d75a77b69052e-4f1b19b8b0dmr65591941cf.15.1765448253088;
        Thu, 11 Dec 2025 02:17:33 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5191efsm225381766b.40.2025.12.11.02.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:17:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 12:17:22 +0200
Subject: [PATCH v6 1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-phy-qcom-edp-add-glymur-support-v6-1-5be5b32762b5@oss.qualcomm.com>
References: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
In-Reply-To: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpOpo0za2YinIRwa6tjrifsnTZ48aQNMl/njTOu
 hdJlu368e6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTqaNAAKCRAbX0TJAJUV
 VsnREACoP5YnqWL/NMo+wpuZX07f+VmgMUwphX4FG0jHF8C/WeL899DIi7HUYLIenAAF4hb0QuS
 YYFwW0jiqwGRnA7ksjENKEyZfi5MrUwJYaL1PwayuIQw6B3GaAMbuQ3aifzngfOQvEVpCdTajLG
 +74ScBQlZk6d8AUDRWWVBJnwwQ25Tnh+c4sinrtvm8r2w2kwWvbbnKbmbBhm4kYiONqk7UlSiyu
 rWULUgo+e4BVqKQ/03dH/EYMwl5at6LFPgVvA9hasiJgxwtOAwZzY4R5Bs+CQHJrbEhyXj/9Wdw
 lh7a02sdX8igyGBlh7OU6aQOdEka7ynemGSTDaM6FflR4z69an5ntCxv0VZZvao8LcQ+2lUCJk9
 rIumCfNVjKI6kftWP0XOnD8HJ31QJI6aUaaqgZuvJeGBirftfSuwteUAZBbjMwfsooRlIwqNYef
 wdtVhPrAkTjDlH5DIGHkb2O3FnNQvJw0uffDi+o9j0AUxhKAfAU500HMNFa/LC++Umi/MgboXkr
 exyrf2HZXHyBTBox9NBTJaUIA8y7Qj2PXQeUyqSlFc0zZhFsJoB0+jlUJ3Fl6S8EH/i2GY5EiHW
 6PZTLYVa5fYeJcFmQIfknU6P2m8nugUqP9WSPwu4yzO6tPJ61eMqFD6yH5f3iccKBL9PEtItOAS
 52ZCnoN5Ul5UOqw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OCBTYWx0ZWRfX/254Utf26bzp
 IJfNK/mEGbnNdda5WBpH6TcR2HaraC//GvaxRdai3mMXclb0XfMu4ABkQ8rkrt01w6/eMvDkQzu
 /GrhkjK5Ouwstzxaayh1VgsoRc0HGdyRLlcC0VSo8jxxa/yyYEQIYsWbkrVy6G08h9uJbuo1ACa
 G/XOxnBil/hjzs9a7r0T2Qf8XVh77TdktT6DPJRry0ViHTzRUxqcT+j2puejQ0P5rPS7rly553B
 BL4icAtfSNceH1ge8Gi3A9QnCS0SyZY5KtiVL8aOCCVGnsGrcwuxvc17okSVFrNAdIFBeGxZyOv
 PaS1MI9fHCFNlrIaTu6Vw9uWY0V1xQcKvdLRyLl2MZW46IHVXpm2oQ/pzZrMZ1ZKWRe3UuF7pvj
 4wxyXRGb/alPaa8GL0PtUPbmVC9NNA==
X-Proofpoint-GUID: oDOAZvrQm4l-W0M2e_AIetUNE52gOJHY
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a9a3e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=adPXzabyy6ZLveKXoAMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oDOAZvrQm4l-W0M2e_AIetUNE52gOJHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110078

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



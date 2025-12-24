Return-Path: <linux-arm-msm+bounces-86565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B80CDC14F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EFD93009C26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634B631AA8F;
	Wed, 24 Dec 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8yfyBHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6lVRwrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532632572A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574666; cv=none; b=EOa/HLi88nac0FVzRrKZai/hVbCYmLriGCVdmUTv5HBDtc/F6DcEF0SWTJve9FeFgN4cMJuFrY/JY46EIBbBxrSLT4LQn7/DbWp3JBZCQ5cMZLdzVNCZLRLJ6FvdmFtcyyf2X77Mp+mDOuQ+7jL/pSPh1ik401EGm+SUL5x5Mrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574666; c=relaxed/simple;
	bh=GimUc2ePlZuvy1QOu7c/n8QletDRsYsWJFcZcb67Pjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRyA0RAdkvLeYu4Kl45DwzJo8JUBlhjPlOOQ0iUQf2LtSDfASUf6KY+vxkW53XOX18A0R8/jO2rNZOx/EseRPnNA4tvn6jvhWp6EcTjVw7ff8l86f8+CTm3Gd27MCGSna7HyDY2lyJrs4pnXenTQQYezx8PzsRPz/hZKgeACip0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8yfyBHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6lVRwrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wKHl3796513
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=; b=Y8yfyBHE3JQTP3Pd
	x/EHpMWJmriwTxDXUAnSJIMHmObGVNFvQWtzPffwA+1BOMJAgXDQ+X37XxjZrIAa
	NNEys71qt909bq8wXYU7DJwoau3mBrSxs65qowA8dVlT2x6eHFtSK+iBSv4KmIZq
	TJh9UJ9Wly+uDD1O391CGzrIJ/kLzuyCWakpgZ8gYzZW1HvdXPuu3qhAnWpiTMof
	+UeBQ+IZIp2xjVIDOvj+IYpqoTMJ9uKJm8Q1a9YnEOZ5hO/7T/HVeHnRci9s42fb
	rzHe9PPHzFcqzjvYDQjC3x56wr5ySbmpYqdSinbG53fNw1sljbnnw3icgIpp73aB
	gbmD0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r690ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee04f4c632so108035641cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574663; x=1767179463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=U6lVRwrAuklYEV1NHJJBGP9bF0JhlUgZZiak+pyWyuqD/8RC3nVDt5oxPAsBrSGYjA
         A1RnH9H6Mwtk5mYI+Sjht+YzeiKq45ewfJEq6ZRBLuUpmohbdUCIDghox52uW1RXvk2q
         uFwhGD0bxF/XSK1k7Z5RkWKL1vxjDXWBm0f8nxGowl9LVFttH2Jj5TK9lMAsoBRVH9TN
         7OptSbhTDFdwertgeDTIoex4wBXPiO7wboxugEGZKxm7Y76bWK6xHAL/fCrNpHl5v9fo
         fv1bUl8n3cijn/iFQ9EdOkm/Y72N/Jd2OyMoz+cJC3r9DoiOiJ1TudQPM5iJCWn4gg06
         c5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574663; x=1767179463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1DTJQec/NgKiKVFzzWxTq2KpPf2b+8dzldrl/QCfts=;
        b=ILT9W9QxbF8qH7UZTudQH+U8skFqbjZvZwU6d8yeOp5a2CsU+qWAqim7RgXIpRct/N
         JJQ82w/e840YSopJhuFGz+mI8tuDQL5/hX9RGGOBh5jYCckF6gLtLB9ozvTy6KV01JWB
         oH9AorTsJ86K3TCks7kjAnECFJ+gwP245k78oNQrVleDhd1RRbghr+sTvKRxQI/JBoEw
         3LW9BzS5whtOqYmBX7vsmB8toCjWiCgPm5brxERlmbrMwITLTPqE8hiZiD8QkbK0dvbO
         8odP+IshZ/FWShUSGKYMxffoTdm9KN6589decmiPrpmXtKW+6wjhViPOKs00RP6Bk3ud
         6Dng==
X-Forwarded-Encrypted: i=1; AJvYcCURqXXyELtsydWefWBuY/nJrwxiRBKyg/MF4H+FCr1oHcEhz1AudNV9MlR179k7T4dlvV8F5YqzJwGQAJX6@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNlqMePRZbLdO5r+Y19yATH6+H4Q9OTBlK0DzFjpwQ856xJI5
	0xBxJuAcQ7t2ESv1B4BM0AV4kxkJGXiYZCVxiwD/V74LMziL20Csk/Lr1qGSLAnkdpHRfsGAftO
	UCYQVPLWu8rjIWu0dUs4pca/BumtmxshRkwo7jqhc6Ycuscy0vgiGKuu89q5ahvPnXnuZyPV8sW
	g9
X-Gm-Gg: AY/fxX5m1hFe9YvqrKSp7J1LnoDhubmjEtTi7ioUdLkbpZIQw4kk95NCVSBfPKrv5mu
	JySaD3VvAvvTuH8gAdE+q7XovBwVj7i9UGMzMMJOI9yGF1UlsN2d6x6thus1N/zkzMqdO0evDKv
	3dUupfeG5ssRmkYI2VfVLl566fijgUWQ/3Cxdv2ShgX2aAsFLFyV4gfaB11qNNx+g99YU1wwwMe
	pboxBUmClJVyf1oNpe7unkHmF73IwGbTFOPTsVYEN7rmy5jIHhjn9grGjCs1lqNe2dmTkxsp2DN
	HtZmtKqGTluEN6ofXsnrR0wG73kHydiPhI85rZ3H9FUf+TkIVTul1b/nvZRp/Tu9hthoHdyeDMp
	in9yxw7+lPPLezts=
X-Received: by 2002:ac8:6f06:0:b0:4ee:ccd:722f with SMTP id d75a77b69052e-4f4abbc439fmr228550441cf.0.1766574662996;
        Wed, 24 Dec 2025 03:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp6T0cq0IwXg65lmLse6KWTr5gLnTsngg0jk3QiZdkZ2HJDZGO3aC7R7s+OTrW6dGzXVqefA==
X-Received: by 2002:ac8:6f06:0:b0:4ee:ccd:722f with SMTP id d75a77b69052e-4f4abbc439fmr228550071cf.0.1766574662490;
        Wed, 24 Dec 2025 03:11:02 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm16799036a12.31.2025.12.24.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:11:01 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:10:44 +0200
Subject: [PATCH RESEND v6 1/4] dt-bindings: phy: Add DP PHY compatible for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-phy-qcom-edp-add-glymur-support-v6-1-4fcba75a6fa9@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UjT3XNaICZQxaI2rtQkKLAQyo6ogQ8qaT0RvJnH3+s4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8o7PORmYzF/km5uvscLA0AvVKwfdAGnmiBT+
 eEQkafS/3WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvKOwAKCRAbX0TJAJUV
 VjhzD/92UbVaCUYdY4NkedGwfjPbWPB09EV8FLIG9aU3SUpLwVj1yA2DWlnDSqr4XfUjmGR+346
 p6LcqlIGLMp6iMfsSEv9BH5OBRf/+WkWt3DSuwxBErjr3kIv+xv3mzDTd890i7WB5iiqlQb9jkQ
 Uu43Ooh+/RK7RAv6MTFgiBLG9oho3NRzaAMqHf7rQ8TJbzwsz10jLhV4W9fQztY2II42BhxwGfl
 r8vuyC3VQprO5b3DBpvBb3mwBx6JHFLBUlw530LpcGKK3xpTroEsGzg5Bq5JPWhgSnqkEugvl8b
 nwalR1sT1sTsuB3JJqWuix45qNsx7xlXn6dDAD6s6mUH83NRc/gLnxfUzEFkGjgciG0VpG/NIPm
 i3QUG7F/q3ffsZvVPOifacYhe41+rulE4rD8o10b82JTOxRcxn944+MCd+CHJRgX8aTVe5Qnx7W
 fpTLI5tMLcYrZ+rlAMN6dDACc8lrBgrT1488/HeStVFyIEq1ihUMLM7BWzuWn1xbFB9x8x+khVA
 mq7oOZayTf+pQ89Zl6fS9A+8hYnKJs/PTLhTMSYhEe1UgeBK97SqAkRgz9VwU6oAAwfb0ZaUhYu
 JDbHi0Ejf9v53An7ELP7LO3TProq/xiKixCuZwS0cfvHVStdyeCP5kZDp0QcQRRDHhHsOzAHQde
 6wZ/UIPA6EY5f4A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9iY467hxFR6iY4NkcwGu6vgBbRehE1gG
X-Proofpoint-ORIG-GUID: 9iY467hxFR6iY4NkcwGu6vgBbRehE1gG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NyBTYWx0ZWRfXxoDrkbePCM4T
 KQDUw7LgxeBh9cKLD74P3MQ9IIWr3at52+QR4f/3KhzBXJdsBxGv9CMZsH8seSE1jFYIZPwsaO1
 Oyqvz5gZKhj+uhX+2wwQaI+79Bb8JN4tNh2jAlRJxSVpnAk7AmVNBHk9kkDEeZzChj+z+b7zWap
 9NT3PIaYeqstTi807gl2EzkPVUPaqam4e5eSEKRJCRClwBJV8iHnsJiio0JQQ21sTWfwwPNArgG
 23e9p1qkegesCMbZCAsR6l+/RB4CTSYebelRjb8o3zn7GGswIFBzHQOsFble4EiuFjrtZSZMhns
 xNW/nW+OuciJEEk5+B5oKT+484kr1vtzwEo+/cbN5IZD/vWKU7O71vfYyTsRtXC7pyl5fJIfcxA
 i2Jd5B1CP0GZtA2dfvKkQAINhvNilWV/Poott/O3EcGzY0lGiGrDl1kS/M5YtpyPq44rKyJ1uqm
 sWwFJmauP9gSJHnTo/Q==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bca48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=adPXzabyy6ZLveKXoAMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240097

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



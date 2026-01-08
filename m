Return-Path: <linux-arm-msm+bounces-88027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E924AD046E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B493249E64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D80D3587D5;
	Thu,  8 Jan 2026 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7O9aB1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fem+cLSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CEB357A31
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862669; cv=none; b=DopPLbTpQuitSVzfaAok6eB+L9mXYQRIOpYI6AzqEE/Xu6OiEkA/ghulExEa3O6KBBmAV2kY4AhvnsYiHgIHAClr3qoZChK4ld5Z73G14ueda+dZo0cGSKOrqfNhDtKurHfekOirkKj0BubpA+i1nE2GBubRbAQwLHvarFO9h5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862669; c=relaxed/simple;
	bh=1bDSTkidDw+Ja+Jkbfj1sNEyDYT7N+D0FHhFA1impA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jo4sEk2L1PLATLFBS0wu2pfKy04bxdoSp5gz+VZTwZ8VjvXi0km8amaRz1Og+UEojuBSK3rx+o3mjkNAbazVe6WUB5hrrJKOpeN3fmly+OWiQvJibn12pdl/ZsuP0tx0qymghJpoMBF56iOmRfvHCoLWHjU5UdKLrGHqkJjaHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7O9aB1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fem+cLSG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088kmm93608866
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c8PWEb0m8sW
	dkLPVou1pl3oui9KwXqV++4vSVkw9qLM=; b=I7O9aB1PNe1S/3qYGlUbDFfmmQL
	2YQl+hMVOe27gUcYM+8pYK8kwKvrB5KXl4c88iuenF7Fhtpa9YJzrt/jOYtiP9i7
	uSRLsZ3M/jJoemTvbDolsWEJlCCmDmQ6ZP568jAkVYPaQpcI3NAXBgoRZlvdCRZD
	yUFVLC1lcuKcFjWro6Q4tAU8CfI7U9dH3oTg72t0cXawMB7GueHn833Y26g2uvwC
	U8dvOEszwCaLKkxDp2nq0MYct0LD0Qk8gCj4egv34YHZozkPCieJQ1qF4e4lLctr
	YgR6rR7u2nMQoYu4G5StLrvaOQ7ORKYnMivgsXSe67zoHh6VrBToVd8sL7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg3b2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:57:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8905883e793so75186736d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862661; x=1768467461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
        b=Fem+cLSGBh6p+YoNKxrwy8RapU6jG63Ad2SWAk/tlkaFBr2QT3HvJBNmcRGzdczD2N
         xom8Siwh/6GRdz7dXqe6kSXn/hcfj19dgTzYvZ4TqIjoaK9nHY7YFsBKPZ5xbnt8qzen
         sxMbvB5qlAxy5yv6tllwKNW70FexD7nY00c/FZoPbz8BvAQ1V07kan+f+k2oa6DvAldu
         expCwJMBLuOLoYwK6VL3UdoGR/55YFUz0R1qY5wAoA0ynQW5iIoaQuFyeFPsREX9sR5E
         pgQ9V5nqOjuS5fRn+Fv2Jfxd8s7EusjQQgn6HUcQ43+IjOx2enDqZrRb1rUeaGqytYdi
         hV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862661; x=1768467461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
        b=uEHaOPqa/XTSih6vWJcgyulGpkN7/OjvTz4mH1O3DjbOldb4RstCSbWwcTu5D4EWDh
         0ApYWqvkuCXogql83TggI9PzyOI1Ms7x71pY874LdiQwUvQFQD02dviHVm15E3GAd/Hm
         my6jtdISoy+DrGZyrBUOHapPMOICgh4WOZUhyNT/f2hM0cgHmq7KIV44txk/lC6E5Cqp
         TJZMVii8o7DDgK/9W93HCgnDfhW5kBri6Qwkf+S1CMPihx+xuXI3swbRPBRULFOFS+fN
         r1VBZjBh1eU384Y4DdXR6clHy6XKvjSwwGBlcHj6ufypTTV1vntH6vIZgKY62HlOxY0s
         y1dQ==
X-Gm-Message-State: AOJu0YymmZ3dPUdUmP1DsAnf5t5X5gOog1WVCkCvBPWYyLGr1etZPAtN
	As9hDsJ5SJyq48KccoGWam5IEkOlaIo/GdggpRqB3bFsRRD75qH/VmPaOAoGQiJskG+g6cXlkNK
	WhxK7pfGa5llsMww2R7xVcH1yoID0cz53nEqiA02oSL44srT/JGOIfFHhuNEEo6OKg3+/
X-Gm-Gg: AY/fxX5Olhjqq9DSuJGJ4gIMHmv4nnKHI2BmyjSyNhmTrHpHXVW/f6gHWlVpLtLIAp0
	OzSE15ZOqWw4tInLoSXGDk1NQM4ZZMsRR70JHmoBgg9uPNsoXTj8IqybyCD7alryh4zsuedpxXR
	gaMNqrvC0S99L9ntkR8F4g/nGtEtmM/skau+FFCf+qLHQfux2z++l52RgiCgCBxTHUgdcRINbIw
	gg4OfHFBDwlf8kL4iFtnnZm5z9xtAMesk+3Uyej6gltJvST3FLpNIhaPGAYumNoIQw5XFUP50LR
	1MMHSJ3JVpHCbtwCIIVd9OR4TeIAYgyIZOud+gaUqQJqopIqwLKYNk8/75D6Hpbjr9VVOAjV4uy
	sibWY2jwzhS3YSL1po3r/EY1yC/BzlFQRH+l/lzOWqJ2FjAyeiC7s1I65ahCN8haIi8U=
X-Received: by 2002:a05:6214:f6c:b0:88f:cebf:f7bd with SMTP id 6a1803df08f44-890842f5175mr77313746d6.70.1767862661202;
        Thu, 08 Jan 2026 00:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP71nOodf5/nPXrEPkydrhdDpMoq8JxICLTshZ3OPSRTvksaFU3iM79Vsd304YJwYU3HH89Q==
X-Received: by 2002:a05:6214:f6c:b0:88f:cebf:f7bd with SMTP id 6a1803df08f44-890842f5175mr77313626d6.70.1767862660848;
        Thu, 08 Jan 2026 00:57:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:57:40 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
Date: Thu,  8 Jan 2026 16:56:49 +0800
Message-Id: <20260108085659.790-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aDbD05g97tonx91PkHdtdCxD9EAe6B8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX9JKJJBgGExwD
 4V1D5bjhBc0qr4vyRGcwnmaW5a/S9e7SLNmsmBMID1pqMzQ+Kjoe/7X68dmYs3aWMde7irr9DUo
 oG36mZmyzsN7VoQPgYeBhyVSWDxDpe807lAGXDplgS8J4PM9v1zDLq9CliaoDq6M2JaNNg4bRH5
 z9EUll5SSVneRga0jYrAmF8QuAkoBQwvxsFzBMIqU8SoQ/q/a4MMv97k99q/kfpXqwLxTZLtZtn
 7srvF+f54xZYOAX11tYRnJ9PnKoELbxhPeCsDV5XXGpkwjbiCoLULmoadVk+5x96Vm5J1C4yQ75
 o9cIWr546JJnBkRCm22IC43nwo2XvLThdSF73nfozo7gzvE6CntxCZy3oRxyF4z9g5BIZW7RuM1
 uHTX46gZrItaR984V8vw9xzJ3R34KnF4+8OOEZ/aK8+spAHXoZiw7DC6aZirVyglraXFMQo/aDm
 DaxPYBngO8ZPBFZvrIg==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f7185 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: aDbD05g97tonx91PkHdtdCxD9EAe6B8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1



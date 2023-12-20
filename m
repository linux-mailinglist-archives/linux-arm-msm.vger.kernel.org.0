Return-Path: <linux-arm-msm+bounces-5551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A83819BFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 11:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3DB228877E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742120B26;
	Wed, 20 Dec 2023 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uBMaLhFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DF208CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2331caab22so463892966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 02:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703066580; x=1703671380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG9t7JfVXwtnb6DRy4cZuLmEqAW2xHjdtAPD5UdCGY8=;
        b=uBMaLhFTEIcBTJORZ7u2tqXqHmRv14X+AgM6fM6g9eOfbePkgRzlKYosus+VAoPBSD
         w124FDhkJqBcaoDJcCVflCCKr6ETy/OryhDqTb4xKSfhRdV01sc8/I1cdxb1D6wGAv3h
         wWlmQ0NG/AxPeXskBIsdsJR5SbyBhZaj6PEjZ7KP4kLF2HV/MWY7uu6jEQ329pxyMHW2
         FUSWPzusjwU4JD5XgIHXcp9neWkiCzaSyI0g+CydjsCP4SMi/NRRcStU6gf4SObNXGyh
         H3LJmjW8uPtwaONHXOqFFEEifwGZsdpD12rm2J7h3dFYILgvRygHVnFzejv4RjqlF3Wp
         tgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066580; x=1703671380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG9t7JfVXwtnb6DRy4cZuLmEqAW2xHjdtAPD5UdCGY8=;
        b=sUP9NyL00CsXjB3W96UNTMDKUlIsvQZNsXJglWMWffBrnjkzW0xzSpCsmECj9QWu/g
         mxuXgEkTKgE5P6a07YPDnKdIGTOgYrzxMmM/V7sFlJ34sZUQaiYxEzAZnx4gUc8Vr+qC
         7gsJkFTUp5U1UBKk39a+n024tHlXiOB3kLxgsvqtIE41yDE5qCDA4fpb2ZO3r857crrZ
         d7Z9sf5rYh0kwMvckmkTjlr0+z8R4RWkSgGxugyC4DwTY3RsmbOd47T738TX4uLBIxzT
         QCU/NJFXj/OeZhN3OeE/er516aekeuLnB6fHLao32NmhCquI7qyeDTJ5auzwFNXkLmJ2
         B5UQ==
X-Gm-Message-State: AOJu0YwiNlGzzLucske56/vX/2wStHsmurOEtZRPGGAsod4UhB2KIsTx
	lh3ZCDR8ZjAIezyJl5f5vl6f6A==
X-Google-Smtp-Source: AGHT+IFeUc7MhgtuoLd1PoqD17miYislsdV/yOLe/vhsYNTOz+seUTv1KFWTeqG8CfQaVUHNq+k0ow==
X-Received: by 2002:a17:906:24cf:b0:a23:5914:4a9c with SMTP id f15-20020a17090624cf00b00a2359144a9cmr2225503ejb.150.1703066580465;
        Wed, 20 Dec 2023 02:03:00 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906561200b00a2356a7eafasm3718681ejq.199.2023.12.20.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:02:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 20 Dec 2023 11:02:56 +0100
Subject: [PATCH 1/3] dt-bindings: soc: qcom: qcom,pmic-glink: document
 QCM6490 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231220-fp5-pmic-glink-v1-1-2a1f8e3c661c@fairphone.com>
References: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
In-Reply-To: <20231220-fp5-pmic-glink-v1-0-2a1f8e3c661c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Document the QCM6490 compatible used to describe the pmic glink on this
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 61df97ffe1e4..101c09554b80 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,qcm6490-pmic-glink
               - qcom,sc8180x-pmic-glink
               - qcom,sc8280xp-pmic-glink
               - qcom,sm8350-pmic-glink

-- 
2.43.0



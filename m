Return-Path: <linux-arm-msm+bounces-12708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6118690F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 13:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020A728209D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8488013B292;
	Tue, 27 Feb 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHDOz4SL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F013A251
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038412; cv=none; b=JOotNwe3yfiIsS45UkX4CWjKn0eQgSuR1QCMH3C2NS9SXPUoaB+Az5Imz2ZfHqrguBTtFNKSbHjON9jFUa6PEjDARFNopijrmigGxlM9P0iiAo03UUBL66KS/zYL7nkX0XI4ohv6se4+87AgMmVowovL+2Mc4inHLVaG5Fil6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038412; c=relaxed/simple;
	bh=W7s8U+G1CvS95ciIBnZfewffYKGs+qLImFMLmUIEz94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCKJxTK6j3A3F1B55UABtkFiyIRKj09zRT5WwQpryO8FqW1y8BlDmWfHaeGYjjx4rqOyDWr7v4NZUvD4kcOUtVkA33G5gya07DdypU/JDh3VfY3kCWG2Dh8vnMEsac6mRjkn7R2iS3CXsLTWVmGqqMlI3wl5sSbL5PdWFhftFKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHDOz4SL; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c1a2f7e1d2so746298b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 04:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709038409; x=1709643209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkwHy8KHvQ06UnRgJAw6K/xRKAhhDmr4TJmxluTjy4o=;
        b=YHDOz4SL6hNQoSFAlk9w03Pe1ixaEETVxtjT3CyoL5bLzPnDDMmgy6enxFv1y8++1n
         U8RK1ZKW7eQVO1dfZKJZWu3g1pL/8KjcNlwvF48ReXfrartuLeMGnAHYhpapAo+8bOfw
         QM4wSiJzVhe7ShswElAzybRLQD6law0d3gtIlZXpO8oZlpa85YSB9U2tpUPvTEtnFhsb
         NKlwBkGC37qirlD4gDKP/CfgYlfeKc+qLKNw17DjosS7TCOsgj0w/aylglmUplasXMZz
         TNCuXex9xe27pOLAf5+/r3frMiUkdpqcLdD1xNrgPHPPDp3pjEL+TW4h86GO/sFPgPcp
         UU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709038409; x=1709643209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkwHy8KHvQ06UnRgJAw6K/xRKAhhDmr4TJmxluTjy4o=;
        b=Yk09eRALjA5r1EsIPjNQRofQGh+qyPlIHfzZSpdxbLhSKzwAvK22vp8G0Dig/kFgwj
         jRyDM9Jt8NfoH4ZfFm2NZQbvtlGn+AHVRUfAbGFWi+dUKXjGygT1VmJgA7YolVhhrWCX
         Ca4DsqlFk8/VdvgKDC2GFeh3uUJdxKfcvXftdte7NBk4y3wN5G/YVevA2uJnenLaFe8J
         nzB2PoOAi/pQwwLgASjuz+yqLdabZ/dy5WFgD4TIX6v5SQPnjWo5seYtRRBElzzLWQBr
         yuhaJTANwvbPc4+iVLZa0GkjkGpMJ/LCFb33IF1NkGrs8fDUI/rfswMpOPK4z6nn8WEx
         B8nA==
X-Gm-Message-State: AOJu0Yzi0xZ9ykNCqQHKnJywTxLv7b+9uk5U7DUoFA3jNOXnicQa9D89
	R6n9l7nFlc+AiIRq7LjNJLZomJHv8rry1WB47TenJhb1YUl4Dqp+dLJscMs5KhY=
X-Google-Smtp-Source: AGHT+IF/yHO/Dm6DIcnG/gZgn6sGN8rhphuc7dovq6xwKaY4wfQou/GyqdJW/0DRZ9i6znaANdCKrg==
X-Received: by 2002:a54:4492:0:b0:3c1:3a0c:c1c8 with SMTP id v18-20020a544492000000b003c13a0cc1c8mr1836701oiv.51.1709038409299;
        Tue, 27 Feb 2024 04:53:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78b87000000b006e48b04d8c0sm5841193pfd.64.2024.02.27.04.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:53:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Feb 2024 13:53:05 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550: add missing
 qcom,non-secure-domain property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-2-15c4c864310f@linaro.org>
References: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-0-15c4c864310f@linaro.org>
In-Reply-To: <20240227-topic-sm8x50-upstream-fastrpc-non-secure-domain-v1-0-15c4c864310f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W7s8U+G1CvS95ciIBnZfewffYKGs+qLImFMLmUIEz94=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl3ds2VZrS/0F9OMKj3N2y3MIVbsJ5tqtVhzTZzyQH
 CIKCdkqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZd3bNgAKCRB33NvayMhJ0bu3EA
 CHIyE8P7dkULJoQZs6aR2vh555iFziqGjOVHgMgfB/p53Bcb4ua8ASEN0WQq5cv+MkSpJti7yaK6vY
 KCDckbJ3PIlFGqo2IsigEQRX3/FUe1ROwt2KloZgABFWRqTIXioe4z44OKGa5IWxPWw9zivKsmt9GK
 IPlCRGo+UGOE6Y5a45ua17jhi6p1joa8zJqF6O3gk0+FulYfXSYMJR1Dq1gf/pHfb+5ZpzDTgZmjR+
 TVBBfwhWbj3O+dHt7CLE2Gzae+NQ+X/pkTTWk9C1B6oTEbwWsKEl0ZxcOXpq33gA7E/JSdITy+QSrw
 E4YrstQ+381uvQuhYHhYf77bnvnx/TSmOWXzFwHw/2y0XSNd/Uo82fHGhjyHF6zI4ZdIcRWmfMej70
 TqbWz9gVaRVn87PVNA08isZGaB4AH1sD5f2eD+9RmI9swJOrqbQxU3Rlih9KeoO6I/BZ68Ggj7wsuF
 FwzKJBM6EpjfGBkA2+Rh16hpf8i1DdCgBQSGs1559T9AdkVnf0zGd+9tEDXtyS0migK9EnCTVZKt6Y
 oaS873EkRIdycZB4aiq9xlcWTLLlpbnFyGJ94/CFIpYaJ6pZoqx+k7jIBUMrvuuC9m0LfFa9S982Q0
 UVPfcKA9kAD0YLqvI8iaKiIevaxDmCsDY0rZz9bYClCsdZs8iXqC/+9GD9bA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

By default the DSP domains are non secure, add the missing
qcom,non-secure-domain property to mark them as non-secure.

Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7474cddf7ad3..7bebba45eff2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4316,6 +4316,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;					
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -4454,6 +4455,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;					
 					#address-cells = <1>;
 					#size-cells = <0>;
 

-- 
2.34.1



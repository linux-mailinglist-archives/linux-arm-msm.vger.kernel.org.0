Return-Path: <linux-arm-msm+bounces-7908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C928389B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9E501F259E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 08:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4A65786A;
	Tue, 23 Jan 2024 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uf4s/aKa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A757306
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000133; cv=none; b=SL0/n1fk7jRrdBejCzXPu3X+pUs5/xbMu1ZLY+besX8zqGY350Ck+f/knT9NLsGfHVPZNyvcI+jz1Id1qr6gOg5dN6a9ZI0yhE2UBqZ6lkquCBGL/PZoU00X/K81DZ8A12QvOm+NBX6NzyyMtxKmsHRBjtPhpkLDikxSdbqhzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000133; c=relaxed/simple;
	bh=KgVHrhVFt2JN+LdQ1BAfWTZKdCa+Tp0F5VeWu6DKKgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHxOpf5zdxtHLXzag5NxNP4lCLwsFrFeu3htfLmI82oHmgAQA79GeTtze75wzzZiwfA8gdj+M2mg2ycwcstj0C0Um7ybslDGcOItg9D1n5WxcyW5RqGVTalMWAmIpbsjbvfd8giu8e6Uksxm9z/n+k73ceavE9nAh5JphtzX0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uf4s/aKa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso3582891f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706000131; x=1706604931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0RsCrlKx3eONr7S13aLbSsY8WaatTTy7lB2UTSqL9E=;
        b=uf4s/aKaUpW0FGwyH5Ag/1v7G9pU20BSA2ZNmQ3djBcCknDmU5rpoE4Epw9ZRH3/BI
         hoUKT+pbG4ffU7fxLHF3IXVHpNdjP1QXUroiks0uFW5wx0gOOykJXfvakD655/+0bAC6
         OCuELpPl2RMAxkkNfUpGgh0mIAX+WkCVXZ8u8XyymHnY3NV35BohNI+iDJD68V9XoTBk
         k2g+/3KD1K+UqqKbqR2aOwAMd4bqfsqQSnsNJThEazIktJ2O1QZCoiRxAul6ylzVSQue
         EnasUjsIWOhmshdp0D3g86rymttVpDUO1CyH++xUfuf+wI0wi+/HHymsV3a7a1oSxW3j
         lSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000131; x=1706604931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0RsCrlKx3eONr7S13aLbSsY8WaatTTy7lB2UTSqL9E=;
        b=LIPEqdPhehOlyhOZLzP/7l6jj9l7N+bBl06j9c7YPleX7j07kSLA+HhyJUoQYUt0Vf
         WVcwTnPd79pkaA3PZQXeMPLSbjQmiCdQfXhQJXY+U7ys/2H+xj4qfOMQROAr52DJeL/6
         3V5M4Ox81/xk5smt6V/cFvp6mEsP3uNQPtZSzR7uqVT7+vBlCy1z0RHg503rEYA5guQR
         yHykp7OoHNSzNe4SwWrcWFwZtMKqhEUf6Le+seoVUWak1iQRV0J+zN8LTjfcrbPalpZr
         aGxLh+6T57XlGXSVCBQdplkl8E6WSst7lmwxXp7ojhm5N5SgQ0C/3u1Wzp9ATktAcLbg
         YLQA==
X-Gm-Message-State: AOJu0Yx2leMyjVSV7Tab1VEeOVDnhzkwZ99jnXqreXKXYa0AcDc9EZ9/
	Rmn2lTDw3rq0YtC3oF6/gWZfgyyT/MHET+5Ykh7wf7YeShey5uQODfUXvKDlBXs=
X-Google-Smtp-Source: AGHT+IHwLdhWDPz2qb1n8gTJAaL7WBQxz51KY723AE78wb1M+jw/Hkezvz7gEa+w5+ertm4Os+AN0g==
X-Received: by 2002:adf:fa4b:0:b0:336:87f3:b9c5 with SMTP id y11-20020adffa4b000000b0033687f3b9c5mr3360327wrr.15.1706000130843;
        Tue, 23 Jan 2024 00:55:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b00337d941604bsm11553765wrt.98.2024.01.23.00.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:55:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 23 Jan 2024 09:55:26 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document the HDK8550 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-topic-sm8550-upstream-hdk8550-v2-1-99fba09fbfda@linaro.org>
References: <20240123-topic-sm8550-upstream-hdk8550-v2-0-99fba09fbfda@linaro.org>
In-Reply-To: <20240123-topic-sm8550-upstream-hdk8550-v2-0-99fba09fbfda@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KgVHrhVFt2JN+LdQ1BAfWTZKdCa+Tp0F5VeWu6DKKgQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlr38AwcBOLOQpU9YVcX58d7kC+UQ0RhniyhvIyRy5
 OCwGltSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZa9/AAAKCRB33NvayMhJ0beTD/
 9Li4NM1ye46tNzYC3zSQyHcmIqWP6T3HFpDrgmv/kV9JruHSHk4iEyUzKWIc7YkY+rBWFJBASj+LDT
 s532Llq+GXdAXtibWV6J75F97rTqCshfupu6hJI9mGPoVsCNj6jvHL/EJGqGx7O44Q6I1x70g+3iU0
 hI4G8o80IZ0sk5fDxSeV5h0d4onDO6p4V6NtRz3b+5gHKw/45KECBO/11AtemYhjqdvaz4adup6Ts2
 6Lk7myLhyLtspQ54Yhyptw/SsDP5QkGNvE2uM6BoayvNdnBY9kQQGyUanjUCP9OOCy4gRbdmVo4NJx
 JJt663IAIRUBvwrhPXfpcJ9PCBElsIuf7LZDbKOAlh5tHr+chuAF4G8RwGZa94cDFCiCMcuY1Djf44
 PZFADpslGKtkIt/UUvGMT3I3kp1U4d+1jYb30PlCGVueboA4AI+R205hnUeoOyuxJxj9ed4N4RlWXW
 x9XdOMs6H+mRMZnemmqxkGJI6AAXle8CyYFzYUGqPuseJ51cWOwz2fcA7hJJabmt5HEFLYYCPUblrO
 fW3gzj63zRsQvkP0hg3Mi8Sb0HeRyhrelFEbtzpMKfqQ8wRuWPzUf5RFFOzmpJVx4Yh5eoNM1AOR/f
 PynOgrOwXCq3eB488PPm+DqQuQbERx0R1XlOx7lc3+pG7Csw7uRhkxI0Fn0g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm SM8550 based HDK (Hardware Development Kit)
embedded development platform designed by Qualcomm and sold by Lantronix.

[1] https://www.lantronix.com/products/snapdragon-8-gen-2-mobile-hardware-development-kit/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1a5fb889a444..c1720dd960c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
           - const: qcom,sm8550

-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-19447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328C8BF2F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 02:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 376041C20A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 00:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED7A12FF71;
	Tue,  7 May 2024 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+Cu903p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817A12F360
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715124541; cv=none; b=aVk7Gs+p6Gp9FlHpXt233A5dtl58JldZUXtaCIrrBBv6NDvqynjAQnCd9qP9Z0ifl6ysVRsrAJS0FwMe/m9aivzew8qdRLJUDN3soYgcVJ8MNx8mC5DfRl5+1a2PQS1HdVgpqWmvhN4V9iRJqzP0syBygILiR59PnmCh9bitOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715124541; c=relaxed/simple;
	bh=zWiwjlo5ptWDDdw5mXdKoOiHmQ5QvKRvmPpaFphCOBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnIfNktVskcv4b3cJR3xKcQqUXtwI0BVtYyj/lvJd6AVK/IrFdwcZQcAaA6UtGxknk7DhVImzdGw69YQaUmIdG9LmbaXezFpj+Ea8k24ZzZQXxFdYm48RAcGNWwDm6+32H7ahwncuf3M3pRhbrFxYSDAsjD7VRzU5tXHsmlrj2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+Cu903p; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a599a298990so1008947266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 16:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715124538; x=1715729338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IV3wYXnahtKPyGcIMiozLNqWG12lIZZRikgDtL6Kvc=;
        b=y+Cu903p24ilGhXuLpf8qEyuCLLB4nDhSVpZ19abk3JISN6n8bHh1UCvvPEELA167/
         HrGEvdP62FAyLHtrPh9Ov54EcX+Sz1rpEF7L6KV/wFEjbBrCb31Bm29+pqlo5BmaLF5p
         yDCrlEAPs0RiN2uWVl+8HeQlREsasBAcBCjO8kg2xzQ/5OsT2Il0FTGjbbkaonFlrLuo
         S5bL446chlhJUpFwCenOV9LWnMfbcLpqjWErDU8POmFCiG+KrJIcB1lnhDA92SIyIrDk
         g2JzLfdwQkkFUt2534ZW83NI5j3tjl+VjeRVBqzyWKZI1C6jp0DD7eVO9Ao3aCR/g16Y
         0zGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715124538; x=1715729338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IV3wYXnahtKPyGcIMiozLNqWG12lIZZRikgDtL6Kvc=;
        b=tqw+IkjUKqu5gRApZXzeH3Hj841RMMAQicUgbBVn7SvBapOIZw6riEjRL9nWFtf3L8
         kISv5fH6gRLdGwmviYDpbFd1Kg4AZGuq0+YBiqdkJugGEUG7gFNUrOTEAN5iBTKDHNo0
         91ysptstGMrM9vGrtpXua/Mz7rE74/jQaQ9xlH6eVIAFfTjOfNOAT4YaSkZHTtvvco/q
         JYVrv2FJrJoRygsTeHTKQgk9GMwhYiBPQK5f6sNuQ0zDSAU7FH2sirZN0WGZ2piHR7V+
         gOUCTc7lDScNZccpeXKCyMn0LO+MlJhmsxETgI8736o7wgmLrz1IU6ue+WErmD+DB7XA
         Pr0A==
X-Forwarded-Encrypted: i=1; AJvYcCVnk6XUP9XU6vDoLnz9SloJgAPwxpwiROLJPvjWaG7CJOYvw8mXVs+DOJuZLwMjeJUJJmGGgcsyHvBP1LrhJcvtjCUXw3AQjJLlLUeFPg==
X-Gm-Message-State: AOJu0YyfE6zOiwXgEP26utVXVpljKojEX5apwlDT7tW3TF21h0fqpgGr
	5ev6isSwNrk4tdAOMISlb1vP3xy76cRlAm+aT9fOsnXrgOIfO3PIoK03vWwNen4=
X-Google-Smtp-Source: AGHT+IEBsARS2IZ5kxRKtMGziIDdjrgDHjlxT6NjdafORTD3UeoJxZx3LQM8b8VBYZhD9tYNaGwpag==
X-Received: by 2002:a50:8e4f:0:b0:572:78df:c606 with SMTP id 4fb4d7f45d1cf-5731da6b1e5mr689850a12.26.1715124538347;
        Tue, 07 May 2024 16:28:58 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::8bb3])
        by smtp.gmail.com with ESMTPSA id f20-20020a056402195400b005725c56b35bsm6851841edz.71.2024.05.07.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 16:28:57 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 08 May 2024 01:28:47 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-otter-bringup-v1-1-c807d3d931f6@linaro.org>
References: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
In-Reply-To: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=zWiwjlo5ptWDDdw5mXdKoOiHmQ5QvKRvmPpaFphCOBQ=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmOrk3TMP3a+mT0tHgmuPBTtLTTCaB8KgItcIZI
 C3TO2y1P9mJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZjq5NwAKCRAFgzErGV9k
 tnFDD/4/mG2mYK8QfOgE0kE8qLVqwt9rmbe9gtt5KdFVNwYQMj/c0r915BkB7rEeoKQ85h0F2jw
 yWJ1PwKD9v29gKZ2rptc3da4mhAA2hxAMPN23zQK5LBBpsLx5gvyTFrUecPHx73vqg9+OWroFac
 eXkhRqJj1m9cAXFgqxapL0EzBjgTN/zf8pnj1tdSpHYN1V6y/Foyt+02HM2fki3ZZqiVxsKWd8f
 QXI+/oe8kQBRyVhnnrTCrIa2uV38gp3pimYzKYK+MxWd/MyQrsUXZc6sR/ntTag5uyO0erw1512
 skw1VyipPhhVBJIx1y1jTC2jyT5YPVqotFVyj0s1Osh8WoOIH0nHGmZq2iSpvL78MHFeweU+EgW
 WPggcGyz+QaJpQeTrL56FqQlX5hRmfL4k1Ivo41lENaOqNw84fpYQtgN5JWuTO/MYRcgH9m9kJu
 7SMYFRLYsJTpnJftD47NarhTLtCj1q6qGVrUKVhir5pCoXe8JtuXPhBXANt8XZavgGCVrKynQ0S
 6oSxev3WhSQ2+/x4TgUfZVlWJRwmjbJrqtErv9ZjkZtjyhylbXOU+TtqEexyfTqzs43UL/Cql1g
 FXrNWSy3Fq8K5lj/75c6LR0KtryCfQZX+1zRmusQGMaee86+YsPcC4rO8uPBIGGlarHQKnwH74j
 h3Nf93XKNWgMUqw==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

The SHIFTphone 8 (codename otter) is a smartphone based on the QCM6490
SoC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 66beaac60e1d..d4b2d39f914e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -364,8 +364,9 @@ properties:
           - enum:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - shift,otter
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:

-- 
2.45.0



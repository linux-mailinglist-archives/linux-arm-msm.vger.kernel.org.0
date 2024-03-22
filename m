Return-Path: <linux-arm-msm+bounces-14792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CE8867CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 09:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2ACC1F21242
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 08:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C2B1756F;
	Fri, 22 Mar 2024 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="L2sYvMkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC6C16428
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711094512; cv=none; b=qZHS37DAUaRFxp4nYpY4NQnvqPeMjjuU+CWiB5ydCr95VFrw5VdKnznD/BNQoYOoWI1ExM/eWWqaaG2H3chlCNLQewSJUcG+Z3kEH9Dm58OKJcEPYZMrqxXjeA9c6xmhJbPOR6M/Ipgjt1U4vG8qvr2X+dX1DFFI28tsnf8GXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711094512; c=relaxed/simple;
	bh=wL0JlF8eq0Z9HHcp26zCmP4nMmGV6x98g3GPHG5/rXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHYxiN8lSqlbKeTOFtRhbaTIasXr/VJcPoWxvok/p2mZjmLJgOLx48KCasX+rfNxtVjBGC68gPcv0pS7D1Q+Cioedy+IX0jcIN/37Wl4VKQ42JAHWlSqIv6NK/8LlM9/rS0DwMCn7K6ePaBXEFpf8RyI1q0MYMWJ32yPHV8qZqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=L2sYvMkb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513e14b2bd9so2220678e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 01:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711094508; x=1711699308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAOZ7K61fLCIDdZx+aVvexoe0zzZnMrZfxPNoh4sO1o=;
        b=L2sYvMkbwy9ZIRErfMudHK3guTLz0uR0YcEFrkhJuexLJza6ZvOfIqE5t775MLoHBt
         k4Gxjr0hKX13qfGKFPMd+V6i78WAItoK2Xy52Y9ZgE9l9+MuAcJwy5qAoIGT2NoSdf+w
         8//y9WUziRsnds10+7vcEFG97hHP4swCC3ULE3z3IsHjoC/JspwoQEKJuXzQ++oiBEan
         pnGjqypgC0tsPbGsDTkguXtTAXLmrTZBPXZLl0ZSTu7bvnW3jACzweNcCGFSI0II0iuE
         zNAb23NLOaQSQmI0mOkTI4trf4kKaLVCnTZTCLzkmqjDpQ+xoM4IFdNj3XvaJwTnksVo
         WL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094508; x=1711699308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAOZ7K61fLCIDdZx+aVvexoe0zzZnMrZfxPNoh4sO1o=;
        b=XS0QsNAcM+8As8GyJvuDzCga6dwcVWsCYOR3+azjOjf2RnJREHUwqBpdkXWid2yH+c
         wEAIk/NVPSMP3f7nzZGExEQEABBOPAeLqKUzWpVcHJjv5BPDYpNiji0fLoSlIFP2mDXO
         o0Y7NIH7SSvdX+m91IuuDGm4E+L4tuS9maR7NF2GF/ABzyiE8txBmCQo2PEkjvfq9Kqi
         0qXHbVewE6L8ad9VZO1OnuWPGQPjQ+0igZpF548bWUtiFw8ItoFnk3pbtkJxPPPrrtk+
         AM8E29M119jl+buT7PsF0u+52sO9tLAYsZ0lljwAaq0y2fT6G1Dj+EXq/4gcS8UyC8I+
         m0SA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9OGOWNuvVigGio691jNHTsmy/HEHXihX27NXzV3UIhvFnT9fgmx975KHJu8UsbbXLFlC0PnMG8Xqema/nP/dsBTxNqIsfLcrABnPSA==
X-Gm-Message-State: AOJu0YynT6N3IBdp3gfNZgIGx6bWSHOReoFgPwaMfDgcsCEF08ACpea+
	aL+OKUj0iVeItOSJgpdrp6pzfYjMHUn4Ik/raggsyYiP74JIrPcIUbPb7PqfBus=
X-Google-Smtp-Source: AGHT+IEtUnHCgXspvWzyBcI4Iu6FD4FhY7l2vPYZlKwtFxOzaUWi05T9h5nexKq5DDxYU/NPaxZq9w==
X-Received: by 2002:ac2:5395:0:b0:513:dd59:bb3d with SMTP id g21-20020ac25395000000b00513dd59bb3dmr1104924lfh.20.1711094508372;
        Fri, 22 Mar 2024 01:01:48 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (046125249120.public.t-mobile.at. [46.125.249.120])
        by smtp.gmail.com with ESMTPSA id p29-20020a056402501d00b00568c613570dsm739889eda.79.2024.03.22.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:01:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 Mar 2024 09:01:32 +0100
Subject: [PATCH 1/5] dt-bindings: regulator: qcom,usb-vbus-regulator: Add
 PM7250B compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-fp4-tcpm-v1-1-c5644099d57b@fairphone.com>
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
In-Reply-To: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

The VBUS register block on the PM6150 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 33ae1f786802..fcefc722ee2a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 

-- 
2.44.0



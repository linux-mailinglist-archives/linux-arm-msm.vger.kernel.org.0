Return-Path: <linux-arm-msm+bounces-73121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEEB53228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C3981B281B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1F232145E;
	Thu, 11 Sep 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mVE4cGqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C13218BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593762; cv=none; b=pQqG2aHTA2e1TLMAyS3Ar/urF5Xpl71jLPbLToYbnXCG3L1idB6FZLtKyuAMsVX1xdlkt8zCHmmdGek5lT9NXwECg810honDlmF+wuByjvzw2RnnvyIrwD1SFjGTJGn35JaPMTcU1SZt3vjUT1ev9UQFHz/QHIeznifk9f3+U7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593762; c=relaxed/simple;
	bh=AnOXO7m0V2+5EV8Mv50wScBsDq9l11L/Vhh0fgbgYEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zzk7e7TUT5A16rOFccCyY0meUW1NfllkSVm9xaB7g2ot7uOE5Ck6uRQ2/e0XCScMIZYoUv97OIr7AqF3Y7oKZjDszf035xFeRhD//Sdj/JwidGl0OZTMOuUwFFqS9WwE0lHAv0rzy8YSPWIZeYstoxSi9XbQC9KOcRUs35OUryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mVE4cGqg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e751508f15so548208f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593758; x=1758198558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU5qxqQ3QlAqV/z++RFsbMDTEhPRXVKvJSuYqKmt2lo=;
        b=mVE4cGqgm2tA+14B5FaZ0pixUqx2YS3RT7zmy+bleHHPCcYmwDllZFDcxTwKVgGvG4
         JPUtkM8YEzqWQKfqicOLixw/CODjQFAudFJGV0ktojNUiz8mZ9NsYWRdo5sf5mm8lcZT
         pdZUNCAW4zxpz4wmloeHC4gV0urcJx+T7RgdgTQ5m6IBeLw1IwUawUCaxTRQiHPCi6YK
         NbAsMetfpvth6Oc31DBAJDtC0jzUU7xsh3ROtzRSsvWuwQvTWAqhUuQycvqtN4sRDeXz
         2siHc0M2tjcmtuJDero5W5hXAuiFt0ZvZ3Dp2l4c6PmymdDMQroIGcQDag+Tx+kdOrbe
         z3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593758; x=1758198558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU5qxqQ3QlAqV/z++RFsbMDTEhPRXVKvJSuYqKmt2lo=;
        b=DPTj4co28yUv9kQwHUGf/n3VEXicqx74yKqadqbd+wsXzkm/x4TPBCSBxz3bJTCnMG
         1kVXJXqEPXmwW1JFuYba3+ixCSxg+bi3bbDbgTo997VPyrJ9eSIGIQJICgZ60jcGQUty
         b28r2TYfuHCdwvpU3H9Lho3coq6r9nMpdL7jaUxlIqX9a8fLTrr5qi7y7vSmm2K81bxz
         gTyDxkL3QObldtGSCh+fTfytqMOISz6unt9VUZzGdzCAG8/OwUYzox7hLvFdnUKAbVEb
         aK4F5i8PiLZsTh/WsfI03jPc8kseB4k7ybU/5+mJZkyO+btFfXFAOHn/HHDesB39QbDl
         gWOg==
X-Gm-Message-State: AOJu0YyGoaaEAACWnKUpRF6RAra76DNTcp+QJGo3GGCy3dlyDS7tk6U6
	MjJi/B8JGsmngB3nP5olTmolhj1R/S+gb3DWhkIREw3YGzVtm+NlvEPEcQ3zNBP7BGZTQFMszDc
	uCIVp
X-Gm-Gg: ASbGncslTGg+xlbhIYbcF/nCGeSHUZdWtH1TGFfmGKG2UBpFza2NLeq8BgUsupSVTci
	aB7rGp1oqm0irIBFv+ns2/1X30vReEprQYv89xIFAawVn2QfcOvDpI8h8ibQSIfwwxVvBQZ3kE/
	uc+IuIuS/1oWtGL4llHL3+fWuUDGbOk3Iw8S4Ysh1XcEOOMFPTCupl7bQZMnmxhjsm+bv2dv9zF
	TNbWBsZRiZE9LVqifyAOKE0M8JcYV68zGsmvLBo6cEbv1z3/hpMb0NsNl1ouQ4bsADXYMprHFv7
	+nnrtbmdTJFI/SjtdezNhr5A5Bc0WM29gmRAt13yRMnzw/Xn6AFef2AfOZEbJqaDjvsbwixfUsh
	DXfROqVToubXEhuUEVMhKlzsAsS/XLFr9jw==
X-Google-Smtp-Source: AGHT+IFWZTWiXMDADOt1G4QAp/SFmNA4LJ7kToOBm61D0izqVFxvUQDX8KXFSUag/JDhBo37YTQjjw==
X-Received: by 2002:a05:6000:2502:b0:3e7:4835:8ea7 with SMTP id ffacd0b85a97d-3e748359441mr10681959f8f.8.1757593758409;
        Thu, 11 Sep 2025 05:29:18 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:29:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:49 +0300
Subject: [PATCH 2/6] dt-bindings: display: msm: Document the Glymur Display
 Processing Unit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-2-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=AnOXO7m0V2+5EV8Mv50wScBsDq9l11L/Vhh0fgbgYEQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCRIB7YzDXcPBwww3XfuZwJ96qdhgZxW+R9+
 CJm7Erg+b6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAkQAKCRAbX0TJAJUV
 VueyD/4vMtmE+QKJqal9APF+kXMGk4ZAPOWfXP3dl0dBg+0h0tdInJRu/Do4YH125zjiG5dBK7u
 +HWqfLrlaWCCFKoTSyJ5cwIQPjz1uNHUKADtGkgTS/35F5q6VQucEthCeqiAPzdHN41oGG+AGBB
 VMvPgvrAITIVenCzY+QHi1urWXtgkQhdazYZf0xpH4S54w2s97CAhnHOd5lOCfHeifAESXdlsWt
 ponTQTcqvzEH3zXsm2rWfOghtc0STMzVNqafxZZL+o4MgghO/D6G4uN4oqbKwLOVf4SCw9vAlF8
 7AX9jZ49eK/+nC4An08NNEka0KepmWEmv0AWuNkMv7PS0Y2kOYo9tRMizkv47I/9gUbnfVEjmZs
 SoMzlBKNMDjIqa+yK9/lbuzij/tgObP8qFtkbxjD1fdgSunKi61ldchgvC1/855LP5Rlpjwf4v2
 1f+IRct9ASrlOdUpUIkMX2AFfZPyLxqTSKfjy0+F0z7VlAHFpiyVVFRNjBbawkwmudOIasgH1N4
 Ln7qYqSejvwnLyCmTK2Xi2xSRZxT/lGgxV8mpdz7FMQ0nIUQ62cX5lwljAGpyUO3lcnFGgozpbx
 KCyz+KBDTK1WbH1hdhXBf7Kxva2WOrCawj578XSp6vEaRRfAzBXV9uCer5NORaIeKZNaBr/RWyh
 Ys0TT+ArWe7Uq1Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.45.2



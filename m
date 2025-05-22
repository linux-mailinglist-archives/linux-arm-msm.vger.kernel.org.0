Return-Path: <linux-arm-msm+bounces-59076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8EFAC1256
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6302A3AA2D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8C22288F7;
	Thu, 22 May 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuClYz/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF27191484
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=AocLxLO3F+lLcNCFTaeJSlNHMoAMstDL7MmVnIm2W/+dJBHHlnZCt25Uw/BuzMUgY+aVvtZbAozRtKvkZW9n3yvS6m8Ezq3Q7GzWztMlvb58WicvIr+LZ3wDT/5wCSStlcvMrSYMbN2Ih/GMEj1KREbzGhnRBS17MwqVBjFHNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BTGlPNBUqufLWTLKvpNxjSK3+Nvn4+q+dEmnWIZc2m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5g2FKq29lEbVBZkqLzS6OV65xD1x5xCSM5wwa9tIez1rfHMUw3oqCjXNvPjef804mkcLBsOrGDPemF7Ifo5qek9E6wvLoL6z48ZzlW6rYLnlteZjtRF+1+KW21Q2GEMZIGjwYlgPJGZ6WaBwqNWQYrUv7WEpJ1TXDVjmSl4YR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuClYz/F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so95677915e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935656; x=1748540456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=xuClYz/FNAcR1XBd9lrteBSgwu079CrWakSSFOvN+AGBTh2bDUnfa3e37KFsfYqzmU
         Go8qmzJzm0dAbHptyDJ1NQF81Nk4oWWedSFUucy6ccFHPjwnrASDProjJhK8nhpPPqSJ
         y6BzFUWEVMHyq15AK25wwqr04K1j1nnAjTerHmpKilzO/T2462exJrY9QDT+/vV1nUPZ
         9H1Ig0hh7fuvIJD9Wk5/FSqY6z3RBIAJ3FoQHGuV0QmXPqw5xs9tlJshZPC93MuZFTW5
         wBU5GCzbab7hDhR+xAgMEBLo+cDamjHIOEYBHr95fnED1S3MttbHCeVZcBhOnqQlPohh
         LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935656; x=1748540456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQ39SsLjmpmIAzQnJOz4snESZPOPzY3BiAe6iDYGQ0=;
        b=ne0ZD25EYgL5VO4ZAbrXHRvkVgwiGK1O7lzvrm+5FE7fWCg3RhNE/jdNeruUP9UFtE
         0IIQMgawr2XWXR7Jx4nzY3XglZQ7VQPutKu+GGDolzRa5O7RH+1nQawz8PYMTou8qjJs
         m6dKAuYSbBLkbED6Rk4nG5fu7UXKD8xJCHh+HGdGf1MlnyFJWLLeEHeKwfWhuZEfd5yR
         Ti+bjVwBENIu4DdgKAUodmOzfFoaWg5piO5fvkRJl5JegoiAcPcMa+2s7xl1fqDnzTGi
         AluZWdBlj7YNJ60zmhYdigXOuwto7rckdIgZe4Yqq012o+LzJvbXVxfbQ/wpSGMBVh9a
         +IvA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5SfhLLFc3+kNnT4JleydtAKnQtWZi4m0dIA6dfS1V4vkYElYcb1R53KgmO75Sp4wfz7UsZRNP4H7HVov@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuuk2RAHO+kAV3aMoATvhYK5ccf5AT2h7yIcg1bCJ7NEMcjGOp
	fiCXMgLWH1dsjh34RTQyVso9P3B0KoGgDBih/VoHmz12uP18WTdFfKzUSTlO1wBT5SI=
X-Gm-Gg: ASbGncuVLbdnkq10arKns/I/TsnJOpDtMYahoovVZ3tDxC3P3k9+DYX+DeMgYyo1ag0
	MedItu0Rj4R8ofP2leBqMBX0QLdnbcToOGc1LHtN+7dze+6WnJHo912QwG8dEeKEUSNTDrbm6Un
	DSGwh9Gkv5/GMDVoz5BTXcZLjncgplajPU6ndq2AC5f+2O6vBa2pK3HN8IdVJ9/bV7o1RJR3X37
	5Ifp2Tw8HqDdUKP9kaC0vp9VVbhz+Xeys9IHcmSbrIugvDquLl5klSoyO38vxRAMBUIRnjTE4Wf
	7nj7RRBE05wSiQLNoY4HT1PZQ6UADxKJ8+lky5BIN1F4H+A3Zxvg7OBC36h7EKTboiOF+g==
X-Google-Smtp-Source: AGHT+IEBbmBeEZeBEDTgs2S0bIt/X0hdjEoD/gWNab7fsmjGtWFgCjNCvRyckETck0ijr3VIY19D5w==
X-Received: by 2002:a05:600d:c:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-442ff8e1221mr214812715e9.12.1747935656418;
        Thu, 22 May 2025 10:40:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:52 +0100
Subject: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

The pattern matching incorrectly selects "wsa" because of "sa" substring
and evaluates it as a SoC component or block.

Wsa88xx are family of amplifiers and should not be evaluated here.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
   required:
     - compatible
 

-- 
2.47.2



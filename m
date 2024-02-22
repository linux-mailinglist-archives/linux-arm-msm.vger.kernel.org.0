Return-Path: <linux-arm-msm+bounces-12202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C021D85FE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 17:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722881F27EDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCC515350A;
	Thu, 22 Feb 2024 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8OQXrXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50D14F9E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708619851; cv=none; b=drMGeUND0dyVDSnjk4n1xIauvONSOGPGiJWENKryEcrIPoNrlMymjtdd0dNfAiRyr+iEHQYcVjo1K54DscLabk/B1sBkRVYTZhufU2hJyodVtLgKk6HCNqYkEhztR5z0A2G1+f/0Z52lejPv7RvfGpmSpUJqQOVbhvThyapKYyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708619851; c=relaxed/simple;
	bh=7TaWjSMnr9SyJaL1rSnUq6UVe3SDZbweU+CU/JSE12o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y8eSuZE0O2W0vWthiFl9qXmQk8Ijg8D20KMviSxVjcIIx+gP9qQImSoAo7GG4hAP+Jf9hE3YyNokb5G0qVjZaYc6dk00BiTDkqReL0J+tPwp9DDcywITxw5kYWwEkuiEUQhO6UsFRTRhTgKXbKDvo7Kq8q1P/UrhcmCfuVijNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H8OQXrXL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso8429800a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708619848; x=1709224648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ythAlB5fOuduCOWoNXa4hv2/pnJOcPq8G9cfPzDgUoI=;
        b=H8OQXrXLleYyVLeshdY3zehihi+qwT/Nk6N+ArWW1TNbRoUb6v5aJbow9wQcaklDB1
         /rlt6vftkl6XzIk36t4Ka9C3tDXlm2v3g4Ac6vALE+5v1vEOt+xuUUTNAi/q2FYD/vSM
         ZCMZ3b9i+myf1lPeAbQzCTCJMTRi+sJcjLHVH3ugrRiNyERuBRASVEHvpii5C91c+oPy
         IamZL503BYj+lm38EAjmS4Tq+uN4O9mSmXiWtmR3pqftboA+/n9FrbVL5xIdIbSP+lOW
         K6GoU2vUCQYX3GCMyWBClShmo3wM2T5+PurN6kKpz1JBi3FqNWIOC89H3YyXeO4UFFEo
         KKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708619848; x=1709224648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ythAlB5fOuduCOWoNXa4hv2/pnJOcPq8G9cfPzDgUoI=;
        b=kcLYEFJ65EteV8AR9KT9YY4DpFo7T3yVUeWh+OKKFsz74z/1o+hr4tS25X107acSy2
         rIu4pdQ47N3A5H7DJpsIPkP/wOZyyM3AINwQWvRwFvUGKXZLIuiMgpzP2rjsJ0LwB9Q8
         4ZVlyX2As7tdkZg+i4EQNjHJ0mt3MMPtCn9xq+WYuXsi5ZbkJOO2/iATI8JrOPll9T2Q
         sUzkKydx39UZl0ZBbIs05Ef56NtGIMADKcslR85+d6VWGc0s0djkCE7Fyq2iybbpoi0z
         4U68lQfEpsp366v6WiKRepGdp9AWD52nXqWxDCHa0TfLCT0Vd3PIUrPrTfw1N8JX7lSV
         sguw==
X-Forwarded-Encrypted: i=1; AJvYcCVkSW5arMjE6TK+iiMHqLxQyec0VO2+6hBSEqK93FRDDc9vF2gsKj7fcb/+IAHGlHvGnORYg1AF6fxLc3H654A4rM2SgDzh/yiWFc5NQA==
X-Gm-Message-State: AOJu0YxvGPJWLs46dEHiP/kgUHQKVEjZw1kROzLBjq2zDO73F+pdsUWG
	gCga6O2m26Li9YTwL8QPJnw1tEdBO5K8Yscr+zRSsHic/Uwg9kgcn4nnLV9QQE4=
X-Google-Smtp-Source: AGHT+IEDqRBn3wWYrrFcXKIOrpL73QXc+7HDhyj6TIw4Ua/8t6GPiVQ6GsEbJRHzFBalKuA1vFJmwg==
X-Received: by 2002:a05:6402:5246:b0:565:2183:d296 with SMTP id t6-20020a056402524600b005652183d296mr2969008edd.27.1708619847900;
        Thu, 22 Feb 2024 08:37:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id u19-20020aa7d993000000b005653c441a20sm614191eds.34.2024.02.22.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:37:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH usb next] ASoC: Revert "ASoC: dt-bindings: Update example for enabling USB offload on SM8250"
Date: Thu, 22 Feb 2024 17:32:04 +0100
Message-Id: <20240222163204.65468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit a9c83252bff616cf3a38d55b7c6a6ad63667f2dd from USB
tree, because it depends on other DT bindings changes which were not
applied.  This commit alone causes dt_binding_check failures:

  Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Greg,

Please take this revert. Original commit should go via Mark's ASoC.
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 49e4f5bbe9dd..2ab6871e89e5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -227,21 +227,6 @@ examples:
                 sound-dai = <&vamacro 0>;
             };
         };
-
-        usb-dai-link {
-            link-name = "USB Playback";
-            cpu {
-                sound-dai = <&q6afedai USB_RX>;
-            };
-
-            codec {
-                sound-dai = <&usbdai USB_RX>;
-            };
-
-            platform {
-                sound-dai = <&q6routing>;
-            };
-        };
     };
 
   - |
-- 
2.34.1



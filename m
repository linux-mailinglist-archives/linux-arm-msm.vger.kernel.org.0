Return-Path: <linux-arm-msm+bounces-55868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 463AEA9EA10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D29593B00DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EC522DF9A;
	Mon, 28 Apr 2025 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0/7aSPx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426222D4C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826773; cv=none; b=aJIzjT1KE9NmvKfiNLCj6ikmDUzeO4HoVRguqkF+Z/GH1AQf7bBSLaV+QH36SORVDioCF3oLy5wd/56veOTdrOMh2ESQpnm2B6EZztr9nLJVWFBnuTc+GkcuxaqYjRgVeXUDVx+PEqTGjUkX0KGwf6xDOWbzSs3q63HyV8eO6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826773; c=relaxed/simple;
	bh=a2q8227S7IVaFeHAdaSJ94I6tLSiVXiu9D8/iCz3E2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+nDGhwdMHxFclERDOcBuIAYBXgv+Ua9i46ynxkFT5pe206wsTAUi9nNwTUty2cDhz3Qlk9QmK21D6HkygMpb3e3Xb2VQHj+LTxDY2iQ7bx74ZtP0wCrkaHWACBd5dwSfEHTrLpUveT+y+75GPo2OpWnwifLIKiquVzD0qFdB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0/7aSPx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so1213355a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745826769; x=1746431569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++CyndwUisWgWH/S4dHSTfV3pOj95NuarysuXxNeUys=;
        b=J0/7aSPx9Fzar86FtLC5mfXMq41kzabU7D+MbU0K6zdsOJ8knuYQYwBDfWbhG7ayOV
         POUhBJ6YLuF9rXm2wlsPbTn0Stn+jje0LMnMqVzOJLTcAZjbNkgDyQ113/4Crr18sGBJ
         hqy9fy7OPLMRU2UQuT+5yXnclw4zK88YvRpKsTWQZUuLnmkKnuFbJ92d/Uoj6ZbBkYXe
         VROnnxFYWDztkmoEYsmqkeuva8VJIXa8OTPeWdJa2TDp+Z/Hku4i8CFtcKiCSgsfSjTH
         Fl2C5ltxDiKn7p9wjq8EJIGwtvwmcf6+Tt8fT3w7vfq39Sug73cAWfXiaSVft+kcOeBU
         GV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826769; x=1746431569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++CyndwUisWgWH/S4dHSTfV3pOj95NuarysuXxNeUys=;
        b=tcn5PxSDBeAUY4orj4/yTQjJSIkMx7ZMp/FeOdOAqlhRMa/SKcQQJeXLxybgQAAOn9
         lH0hKQKn0HKN1tDZ4xCd1m6j627+SzbZggzvlc5dBZRO9DN5DGEcfN2ASvLbUckjPi6J
         VWVTLtLArDAkELzD42eZkpDOUPCycjtlmrWgx1IAWFgwEOxYSY4UDwNaDL04YcPs362v
         8o6HuWoXJJzdaX65zWfcW/7o5nYb3TnfDWzTBPGR1ZNIRLhGdqJklGDyDZ2I2sRXPp9w
         bl7+QSYZt422r+Swyw6umwBCh7noIgsDy0YPh/1h0m+k6IiOq5vZ3xhWx4q1PdtcNs7K
         Ig9w==
X-Forwarded-Encrypted: i=1; AJvYcCVTHRN5hB6hp3lIOAx08cyvJOUPNFfnk/fVDea8g+IPnRDqzAW4KbXN+HSy4n7Xmhl3eDinoQKDJz8rVVhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKX+empD5X6ltbaokmVrcZILTFezUxbeu64TOtePa5WIe/d1V9
	G1w9DQ3iHJSKOIn7Vr7MRAR/WI+52TMBeb8tuNbipdjWSOGcfnh+VXsUoiCt8BI=
X-Gm-Gg: ASbGncv2t0r/uxyOcEBIsbo/KZPkDxn38ujAt1yVg8ItwL4i83QApCmRda6gwcT7faB
	HGoNzZiER3fSDOVTXleRSSqt8pr78M7xi5zOX/IKaeXy1RYlRon9quNqSickwMYEBUp7c/JzfRd
	D8E7QhmGJ/V1cPWwCYRaaV5J5Fw3Mswuh6XyAgcIqtyEjUFUakSR3852K9oARmF4B5gqz/yQMDi
	ktdSbbl7sCbdrJdigc+7mA/EWz9kVlB8L2SLoEmCRKFFYDzEqi76a2Q1WpK3iu+EHNyicjH/coh
	QFUiJHjAidNcWBwLyLrgryXURkPnEP/aFuwFcxYTcCtyU3ix/Q==
X-Google-Smtp-Source: AGHT+IEGTZVZiJqfJ5HX9QPHWnLpx/E8XElCGd6Od8tueakLMxHqw2Flou9h+m1FaZ7wEavBKyTctw==
X-Received: by 2002:a17:907:1b10:b0:ac0:b71e:44e0 with SMTP id a640c23a62f3a-ace7110745fmr364254166b.9.1745826768533;
        Mon, 28 Apr 2025 00:52:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf73a2sm574036866b.114.2025.04.28.00.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:52:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8150-pas: Add missing SC8180X compatible
Date: Mon, 28 Apr 2025 09:52:44 +0200
Message-ID: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=a2q8227S7IVaFeHAdaSJ94I6tLSiVXiu9D8/iCz3E2Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDzPLrwtfBdFg7DRuVbMa3eXN3qGCKlYj2Hb2v
 5JF0WZv9B+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA8zywAKCRDBN2bmhouD
 1xNdEACCfDg4cenrjMEuYZSPid+RtrHlHDfmvB3y6qJw3UkferBfwYrKfsuY/YEXdZLiQpBiH6z
 n+NZ9RmBze3OXQvX/XbAFMzDTWiEfIIafzpBsn9iChkXxCFz+6fPi5fY7Znf7vg4Iz72gHU4VIb
 d7McqqNy52zQSpQyH9Za4zRM9BN9BSpRRQ8uCk1oPj0bHZp3EsIa2zUohIrgdoUiwxVUgS/l+I5
 VXAcNLbe4YQVb5gxn0D9Bm6I6bJ5DTGuRuyaxod2Ek+NS/wZT+marX012rGtF9gVsckzRYC7NqI
 cUepxVvh2Q6umX3hTmbWGlIXRQbqGlk+kqUdTJ5F5xl1UyxfThzCoLX3NthXg3/M+xmN2oAlIdF
 BjC6Zsg/Ik6hRVNNs163S5ikj5muJgxbdmsD6M8wJ0t3IBycjOAVcMl8dqrZWj5spc9+NGiHH9z
 i8Xo6jCSs8c/t78EO1pI8YZLh9KaWvlcc9l95YHNZhxjK8pvx8edVSsyOP7KfbDqw88BnhVu5H3
 yOD5FkDzSeTiHc9eK5keu5d4+ryTML0wpx4OJzwkIKxwX66ZyHI8EYfpS0WgeYmIHOY3pz2IP2M
 b45vbG8Q4hFCdHKmXOXyREDDOXIaIpZDVo5a95TNDTp76bI3Yro7Uvs3CasHWuDJNW1o+Cr8MAq 78ytQgYEaiOOFiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Commit 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and
SM8150 PAS files") moved SC8180X bindings from separate file into this
one, but it forgot to add actual compatibles in top-level properties
section making the entire binding un-selectable (no-op) for SC8180X PAS.

Fixes: 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and SM8150 PAS files")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 56ff6386534d..5dcc2a32c080 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sc8180x-adsp-pas
+      - qcom,sc8180x-cdsp-pas
+      - qcom,sc8180x-slpi-pas
       - qcom,sm8150-adsp-pas
       - qcom,sm8150-cdsp-pas
       - qcom,sm8150-mpss-pas
-- 
2.45.2



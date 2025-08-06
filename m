Return-Path: <linux-arm-msm+bounces-67909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431AB1C5FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 14:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E85B4E2236
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2D28B519;
	Wed,  6 Aug 2025 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssBivf58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF64274FFE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754483926; cv=none; b=l9LixafUD4785j3QFiH6LdEBDO/Ny9HuklHiWUDD7BoSys7X79fK8WXxmRYHpTyJnIRrUCyCvZh00vPwvGE2e4JSsbZLsGAjURXnZSJNdFcfok7ELuNCNOVb9urcxC33oXrXCLSysy/ssHZ7JTrif3kI9wtvAIHJ8eJ+tZ/4dOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754483926; c=relaxed/simple;
	bh=fHoREgnkeV5Y1pWz2nlv1aPFFEoGrGcTrhj4czujmNM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ewruMgnqWkn3Vrvb/aqyktTdRlqvqAJUJx6v8o7RjBVP/Tq6qqkkQ5gw1H1wgIuHwty9KjYTylR3KJTL2VoEpGTyIlzmeOTHhXSnGEuAkYvjHgP9WWQixLAcs3Bs4d9DmiVcsaaX/aqJOR/Ay+8x+DD/Ea9XPgeCK86TahsYAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ssBivf58; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-615877015daso842732a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754483923; x=1755088723; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VaZtENKZm/tfRAOtyUeeFdRLhWpnVE+rI9+LmA8k0o=;
        b=ssBivf58pmuWj71EU9ByooSLZ7S2wyR2J+oAaYWv9ZZ9gauEDPgvCMx13JW80lRl7w
         9ENNCO24j0ghKVyjLc6rvDCCTFDt5zS6aUlx2oZiu8QeJz76JpLcUfy5IkW9YreGEnBw
         cHbGShU4Vw3cHSFsPRCkkUyc91GZ4Q/WzpvsiltbCTo0H8daPsDtfZURFHEyMZIUj44a
         vYVZnsOHivrKiKdHZpolzM1IFx0lN603laMa+RKCxAYSbb8ilCmb6yYJdVRdL5DbsPY0
         W7FO1BBZ62JDl9RECRVwGju3xVx91u/DSiN4yPQ1PjlzEs9noTfZ9cASn+Mo3TMq86lr
         J9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754483923; x=1755088723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VaZtENKZm/tfRAOtyUeeFdRLhWpnVE+rI9+LmA8k0o=;
        b=c1Q0IfSHIFbRxiDaC9I81COLHs3GHemQo5Xbs8QXVRmzSl3n8FIIlGWRdgvkdVDlQ+
         f9ujhpcp0fMb+ZQxSbwXYUktH1lJ2HZqslUNWPsbUUqW8PjK8eMQdCoVklO7LpZ+w8am
         RUFgtBQ3nnmurGo/gq2blL/jlN0N8c3ZMZqDEJEC4j0c7WESvhL+K8FaZu6jWwMYYKwj
         QX1AKGXhEDLtrc+/uMKbRT7fP/0CluAbRM/nMgFP7kMCITlppi3NRzjaOUfomTCVY/u/
         Y92uV4PNYaJj/s9x9Xp/HazTeHB/qfUIZ3jWyg04MNWgjJB3er5M6Rmj1LnfcgmQMBHd
         6MDQ==
X-Gm-Message-State: AOJu0Yx442wNjOJOjRw3Vqii/KRcIQ4/bC+Es+82eizndFzV1itEIXTB
	BtQXTQiaalEcgrrXL5kyJW6pB4qvmqIIRgG/39QHb/niKz63nFNzjIlXPkfwj1rQV8c=
X-Gm-Gg: ASbGncvAW5qyEtHbFsPv2dIhZGrACF+mD3dQzy67l7T5tfEfPGNO3n6pXbRJgOr5McO
	FV8Q9t2/DB1p7n6DNVv+q9+ol5adAZ97jPVdDP1s9gRsL2XheKEo6YvEpHX8GQpyLpvmeqgatUZ
	z00XjbU1bvZ3IJ4TGuztL+xfFT2yAv7nYrpZqIqHBUYCQr5ERZToAb5SoEOLGyUtY6kY/ylwYUk
	cDkpl549rgn9O0LemLoKPXhah92Ugp3CNd4RBbfFAuw7Xe368FZx8z41rTS0z7aUf+dT8T+S6EV
	bVY1h0XRPDGloMOdHQQiuqMHXTz9GKOT2rsf86M1oMfvK3OgjUw85054ST/cgyXqA4dnaddTYJK
	oB4NJ+TotZP8P3uVwAhYgHW1/9ufXuCKS9rZDFhY=
X-Google-Smtp-Source: AGHT+IEcOjlxhis8dtk4Llzt7HCqXzOLdN/tQl26ZuPjoBL3T0vFFNKR7gAuorxk95mAuj6zOSlFFA==
X-Received: by 2002:a17:907:3d9f:b0:af9:8a71:e090 with SMTP id a640c23a62f3a-af99041c6f3mr103342666b.9.1754483922931;
        Wed, 06 Aug 2025 05:38:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm1083866766b.97.2025.08.06.05.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:38:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC v2 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Date: Wed, 06 Aug 2025 14:38:29 +0200
Message-Id: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVMk2gC/32Py04DMQxFf2WUNa4yJjNDu6qExAewRRXKw7SWO
 gnEYVRUzb8TQtmyvLZ8ju9VCWUmUbvuqjItLJxiDXjXKX+y8UjAoWaFGgc99QacAZkfpkEDZxY
 IRYBccEPwhggnVQ/fM73xpUFf1PPTozr8DjN9fFZBuW2cFQKf5pnLrot0KfAn+YHMJGKbvn6j0
 fSox5v5deFAyXtYetAwBDvSRGTRhX0VeI5+U7HNemIpKX+1ekvftP81acDt/Yhbh2YMSPszR5v
 TJuWjOqzr+g0j7PBzMAEAAA==
X-Change-ID: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fHoREgnkeV5Y1pWz2nlv1aPFFEoGrGcTrhj4czujmNM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBok0zLArheMhBgD78cBVzQyLrjFfeUzBZPB4S8Z
 6FzaaE8EfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJNMywAKCRDBN2bmhouD
 1x55D/4pDVkVmS9JwVg9IjwJD6IHSnSpcG7AZ1lSE0TJPbFXy6lRaMmDRbKroz/x164SCoxLZtz
 Qq39a6YpCvjopnwUVnjhlGGAAICyfMs3lkkCyNjSvDzNA+/zKJt0MaO7XbDNuga8rdWOtmpWV2B
 w5OLMEF+bX5LXXITi4aNlZchjs8VBtbSvK/IZ0iA9cPCR0/BXvjWS+1hk6R7M7xKo4taoixAWyP
 fdXbrG7vqiO7/q183+iNjvgjFrTI2PF5L7Wjy1hWVPeNyg7bvZmw1KIoF4Dud2U785geJ7K8DSb
 CapNBD05VZc6KIGJnET+zizljUy9bk/HDPaLg8cnf+rALdYyemkd1pi9o7EGAbm7QkfiykpVxl2
 S0iyYiZ1vRbPY0e7gLbMJ44N3qQiJxRANy3llrpvkxt+nsBKNL0D4s38MkA6YQSWExs4zedcE+K
 0Pny1CHOCT8OOUZ+yDp7kWMmXSrjHSC5O8/DaXxcA66zMcZbX5WtbNbdN2ZD/K3rApW9StpSUKk
 IksPnvFa37GEWPV4CbdAtWbt1nJgL4ZcgwJmL9ZuXQ4r/s772pdQmxhU95PdtF+QE2NUX1jPK58
 CW2VHXNwFud7jR8dp8Q6fTmmrihwa+zGfEU/9Gs2OoSOs7NGN8fpEUHscswZgaKRaH6BlOhLc8w
 eI5gI/SXVs+srEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Changes in v2:
- Patch #1: Add RPMHPD_MXC (Konrad)
- Link to v1: https://lore.kernel.org/r/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org

RFC because depends on old series (6 months old!) which received
feedback and nothing happened since that time.  I assume author
abandoned that series, but unfortunately unmerged bindings for
qcom,sm8750-videocc block this patchset:
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

The bindings for new compatible qcom,sm8750-iris:
https://lore.kernel.org/r/20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      [DO NOT MERGE] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      [DO NOT MERGE] arm64: dts: qcom: sm8750-qrd: Enable Iris codec

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 113 ++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
---
base-commit: 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
change-id: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
prerequisite-message-id: 20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com
prerequisite-patch-id: ada17af875101625f7754335fabc909c8ab9cd20
prerequisite-patch-id: 3cb47a7c47cd96e02b5a4a05490088541f97c629
prerequisite-patch-id: 8c77b8e0c611b5e28086a456157940d773b323ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



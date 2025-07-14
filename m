Return-Path: <linux-arm-msm+bounces-64826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234AB040AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1EA1890E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB05D255F22;
	Mon, 14 Jul 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQVM943a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A5D255222
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501323; cv=none; b=GmQzTZ9OlPFELDOLITW4PU6D90sEugm7ihqsKBzQk3ZAaf1KAnioBfzYsjuH4YQlrT1Fdgp6EY6OagvFuhGBNYplN/dnaHV7YApxMbYGzWaUJsVMSHw7IKbE+GJU4y7P+knCDYnhGpYd6apbbxYwtfk7cVzWgUGXzemYPeaJsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501323; c=relaxed/simple;
	bh=DYPaM1sSsYolxg2BQv5NXOXylFsZZtxEsSUpo/VrO5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=noYeqnhqgQtAXuOGm3dnPmxBWxo3HSdNw36QZRLJVJRk8GMLK9jusnz7Of5z6hYnuWGIOj/dI/ucQZvdpyjZpLbdCvvat2dW0VDNREimhpUyKPQdUhMOrxoADYtD0IStM9i2vDWbSlQY5roFQ/ADgrmt609ZpvigaPCdNWI/Daw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQVM943a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-455f151fe61so1140425e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752501320; x=1753106120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMsS4p/8HnnLMPJhpx5xJwxdy+uDVUjnjy3BTfjqkVg=;
        b=XQVM943aRn0Yiw+k3zUGX2YK4n1D5g5zWSPg0jpvxet1lJuuWn/COxyNG+zmYyD6qt
         0PIZ5OQkCjptLdB252aueHdFBgid7q3MYbyJR/DmOSoL6LBMq+/nla6kXzYA2+q6lBTD
         oU08y3lVLcVuIVJQS8fGU2b1Y0NbjgdPNzJnnoL8L0LH4z9NgLrJ4m+VmFv+hCD4n+eI
         7mGhU/oxM7NQgsEZ3coGEiDNYy05kLtstbpd9C9d8IfhzkLD09pH0E4X4shvME5BISmM
         RlL1enh7NpqOWvKy/6pS5lF/D26SB4ZBhPv+c/Qa4wQ3GRxRRJ8puHRX2IAx523oQw3J
         4Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501320; x=1753106120;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMsS4p/8HnnLMPJhpx5xJwxdy+uDVUjnjy3BTfjqkVg=;
        b=rJADAfjbUuAE9PxE9OykhhdHi0yA4lWoo9wrFxrRXYtgTV42UQj5cliPMXWMtgBQiV
         HusIGjhFw95bVWiwSP9mXdFA5DZU2rtI72f0gUg8qiAuCnSksfz2PrUVP+EYX+2YlBkP
         p4qvL0AENcvVTdTAvjGhuPbls/kZuP6Mw06hgpYyFaOG2LaP8jdXJtxcgzmx87LppKjK
         4jMb/YrW9HQihRxmNdbWLrGWM2svKwo8xOWewlpQEgk5iUxLEyAkXiefz8VwgMpwTXAb
         +yWWWxF9HtpdA5fVNzK0ZqxOI3FH5qJlqejMEZ2Arx3U90s99O1ZO1bskLBVeJJy23tu
         ohxg==
X-Gm-Message-State: AOJu0YxSd1E51zmrl+/oW5y5ajCX3MgZ+gbKjXg7rcKxna+ZCe29hMCl
	sXNYPeJEXk7bgKNGJAjZmnskzdQYBGnIaPE0sBxk0yIeh9zhYvhlId05xg1JvZlDQW8=
X-Gm-Gg: ASbGncvOdwC7XpJ+1//yDRAHQazmtyVFMuX8KuGSmdcvGRJXtQyr2VNROp+jgABqN8+
	a2LoTg0jXs/tcCaF9ucsjTuXC+EwEX+0oKuPZgb0gOini6yeEWtCP4+I/asB/ckV8wcCU8g9y/I
	zlpgsMilvkuaMWXYu7hjXCvts09na2vRe7t8hoSDSEECCp77rC6iuXHe1zl+kFV0tlt+2daGpxI
	m7tT9dbsf1DzqoFSqudpsR3NrudR1xlxbMXOEDo0wTNDk/x2ruYk691TepgnlYhHp1OZqYDXnk5
	nTG2tJ862Z9TzppLzE45NcJwhWLarI3tPWerxtIeh+AFeXrsGvEqGK9TyTsRIL6u1ecOjFVNFdn
	ShRFtKoAMe5a15X+hBw9Dndt2iIkmlVfUOwhr
X-Google-Smtp-Source: AGHT+IGZPTqIQD5sX61NlRQSDM47b7vxHr29b8saJcEcopmHzDGD0h8EFE/XajLMupMDvfX0Jj+PNA==
X-Received: by 2002:a05:600c:8b21:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454f427c67emr46100375e9.8.1752501320166;
        Mon, 14 Jul 2025 06:55:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5037fa0sm172291575e9.7.2025.07.14.06.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:55:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Date: Mon, 14 Jul 2025 15:55:13 +0200
Message-Id: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEMdWgC/zWNSwrCQBBErxJ6bctkyEeyEgQP4FaCzKfVXmSi0
 zEIIXd3jHFZVdR7EwhFJoEmmyDSyMJ9SCHfZODuJtwI2acMWulS1XmBtkDpdnWpkCML+kGQrLe
 ldwWRriEdH5Gu/F6gZzgdD9D+ykjPVxIM62KNELq+63hoskDvAf+SL6QjEbPomyz1Ra5VtZovI
 3vqncMxR4WlNxXVREZbv08Cx8FtExbaef4Ag0OcWN8AAAA=
X-Change-ID: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DYPaM1sSsYolxg2BQv5NXOXylFsZZtxEsSUpo/VrO5Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQxDJMbfqyOTL2rUgfqBXT1ZADL5bttGFGXzN
 MSyvm6JjAKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUMQwAKCRDBN2bmhouD
 16adD/92KbMBSwYI5EFpS1hyc8GukKBBb9GrVAVXSJN3pB+4/QuHAeTb6xodp2yvn0y8HNB8V0+
 rEkhRBVLtMoM8WfpB7M4fDydse07F4E+bBQ76ljle/a0eoAxhCC3JZqox/v+EeNnesw4QZCwMDG
 zUyeudGVfi2EXKH7SBnbU1D8Lny6FXWw7JQS1hRateOV+obxJRb/WDl8kqRzwcob6ISHpiJQYbG
 Ua3MG4atwySvw7blV1Ogp1ZE7dFolZsjhvA8j6PP0mRa+jTls3kQ+ujOUvk5LyfgXs0PiAaR9xr
 m7K2/RkgmALLOwBI511rFmNNmH/EM1xUK06FX7Pfvcn9Fz3JGNtzLjCKpw9NQNuzlA8fBpNJDJT
 /NvQTI6FSk6izcr8FEntnMmt0i1FYg9e1xR71m8w5pFLCkB2U/Gc7wXWvqwBpZoI28xfBIlGNI3
 GELnY8CbAZAtEIdQArwBO+A19WQQurPDbUhTCkabRB9m6fjxokQd7spy3oheFWClmUPnblTeY1m
 kVYq4LtEVW2/MEjwZKtKUdix4Hs9REQyaOv6MKVLJYs2htOrjj8dHatw/yt0afv+CJ0Kc58+X5y
 klw0hkcYKYNrRTkJbtsMAaZsCyuX2zOBYKGqFzH2YsKXKB2YeL0u0Qk6M7VUFHsSJHBM7E2nbD8
 Hf9Qz1at8TdY35g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

RFC because depends on old series (6 months old!) which received
feedback and nothing happened since that time.  I assume author
abandoned that series, but unfortunately unmerged bindings for
qcom,sm8750-videocc block this patchset:
https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

The bindings for new compatible qcom,sm8750-iris:
https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      [DO NOT MERGE] arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      [DO NOT MERGE] arm64: dts: qcom: sm8750-qrd: Enable Iris codec

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 112 ++++++++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)
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



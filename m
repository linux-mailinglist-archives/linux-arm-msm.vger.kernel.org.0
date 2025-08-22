Return-Path: <linux-arm-msm+bounces-70400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A7B316DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29373565C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8C42FABF2;
	Fri, 22 Aug 2025 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MbgwkUtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2721255B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864271; cv=none; b=qfM+Mi8azhOZ9IXpCnbOeV3ia7XKziMWShUWg7KY2yMPJv0hhKUaHpAUID0nIUX5iia1DFqNzwI6F9ceICLd3J6vBPmbnoS2OOtx3VLpPC15tqnHypgXRqKWhUESQi0JQyHv/KwPmx4YYAhHi4q0L27n+4YVKTsspQCJZZtEV1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864271; c=relaxed/simple;
	bh=ubXV3U1HqSfj9OfyDdIEu14wx2rqvpN6shiVlE6XX5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UpRDXJ4t37pPYLYzuis7aOn5v6kizzV0+OvIFCI7twP0WZDQZUb+ZzJVj5iZ/c78weUqw0MJ1Ix/lKMB/aor8Y99l4PdguYYjSmJ5cfrr6ogwa970ts8heBsze9F8laZDo5vIexRRqeLbQO4a575gYMtFGyrqFC/IlM2Sdu6Dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MbgwkUtm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-618adbeff22so235510a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864266; x=1756469066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfJNn+5fJKG0Y4abB6dAOaGr2vAo++XaGnEeHRfq9sw=;
        b=MbgwkUtmlWlM1VKp/LE2MPnDqP8KGlVl6vZtfptHCxM49t4FuxzTHYMsiX3kLpq7oV
         0KwkTHZ0fEmszZB+AeKKW/AVnFt8syiSWGH+Betp8TPhD4BTPDB65DTmEnUVJmvLH1e8
         dMck02LXRGgNi1r7nlHT2g7pRZMnDK1PQZWCNfoBEjhtT1rtng+x1KPATRgqCvCF86b4
         WKQ2Tn7GToemqSh2em/Vg7QDvdlLyJzdVjUhY6NSinBrZyEv8+WA4EqtkPJCe2BAso0c
         a3cSCMxcrdEYYfUZ6iGJzoInHweGBa7MAWrdk3GyRpSMfOGj0RJ153kQ41UgJJhSnGDH
         A+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864266; x=1756469066;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfJNn+5fJKG0Y4abB6dAOaGr2vAo++XaGnEeHRfq9sw=;
        b=MwNZPeh1Won+7f/xmP87C1eqKMn6OJABpZ9kd0olPBsPvTb43cfdQyicZHVtcDfYID
         K4E8Gn5INGj2YMLI2STfNPEQLXERwuiUVIPbYifoTNLjqfQyB4JwGy23Ns6k8sWY2bHW
         beHzBvm9zVP8gxdLkLGyqGwFwOhPpeaB+gTTAMqym5WFNvKlmAw/1dNjhmKFDy9AMrWr
         MMVrtF51B7pAq/UB2m4StB0+Fgruu5sGfp/Ipd/CqKBS1b+rOmwA5HMrI9ikD3OvFET7
         rsH9zaoAIfn6zCsdpYrtKaLbPDuQg9oCffOBbbNIRLTS8KGu02yRAmwqDnZ5vJ7kwoEy
         WcVQ==
X-Gm-Message-State: AOJu0YzV/FQFRllWDdcLAaBXiCJ5Kz4cCW8MzXdB9cLxkfqWQbNExBYo
	vXaQEPxknPelWYzLkRIDf8unwYf/biUo0nceOlEMcVMyVCaP5a2undz1LyJLH6llXso=
X-Gm-Gg: ASbGncte7IrO9a0MhHXIbkXo0kMalDEKCMRGSK/1KqRgHpn2/Nh7WESqOqUcGYHz1I0
	lxem6XY6WUKpxtYfx5QKoZeUdxkJ/o42H/qInzhSc8tfoI9dJbL2AxeSVBuZ6lC8LARNeYS+Sx7
	2PstBFw7noDLRyv4VNGOsLhpJkEaiFy/s/T53U5mAHHtkLC9nxfSyualE6042eiUTCYuTi5a7R3
	9lkbJwwa8k0qZmEH6MBezDiRjtHDKKK6ClDQyJB9AVgzqWmDOJGbYIfWCAAwf7AZ19GKvyQccQO
	uA7Kaw0PxAnDjg2N/Pnnu0g63B9wae5BMG1UY2YfKLbpC3weEAq+3GIZL6QrIvfkE8q/4DQHusv
	6QmndWzqhN5zWb3WF2OJ3ID51H5L7KlQOJUXFiw7f3B9oBe/iJg==
X-Google-Smtp-Source: AGHT+IHmjEs885WlhaSX+1Z/NPmVu/xZy65YW+ueP3qjkq3QbfxO2ReR7rqjb5TzQUQsLcfo8FeHMg==
X-Received: by 2002:a05:6402:234b:b0:618:1835:faa4 with SMTP id 4fb4d7f45d1cf-61c1b4d0198mr1457282a12.3.1755864266343;
        Fri, 22 Aug 2025 05:04:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/15] arm64: dts: qcom: Fix interrupt-map dtc W=1 warning
 and cleanup
Date: Fri, 22 Aug 2025 14:04:00 +0200
Message-Id: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBcqGgC/x3MwQqDMAwA0F+RnBdowxzVX5EdShtnQKokdQzEf
 1/x+C7vBGMVNhi7E5S/YrKVBv/oIC2xfBglNwM56l0gwlwNpVRWPfaKMWdlM0y8robRP/tXGFy
 k4KENu/Isv3uf3tf1BwMWPB5tAAAA
X-Change-ID: 20250822-dts-interrupt-address-cells-a1456890a281
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ubXV3U1HqSfj9OfyDdIEu14wx2rqvpN6shiVlE6XX5A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFy38uowu36sbFsiFqEXMOUJX8drqKsk6Ukfa
 WRSipGAu46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhctwAKCRDBN2bmhouD
 188OD/4s+sVEu5Mom7pUe87dG7UydICa+W8PAkmmLrQN58UTOsBavBTNNVqgTqykYSXjK2F5x8Z
 wcaR362wu3XHjjrDw5Q7/pLWCl5DRZNUElMeanrQERqSCM4NKCzll+4GSr2gpwPlkfZAvDE/vTq
 /PCqXcxu7CXsAWQHIluUMNlLcz6iJIyVsosbpsgMM6MkkckBY7My02Ga9YI+QT9LMe+9NbflHuN
 DdoN8h5iT1t994vZepmWOkqvVothdWSLMlwTtSmtYdaafh0PrQTwBv+LIMZEHSV23RPNFvkN8zP
 wM8FJU4CEb12uYmgPEmlXEx5c6x+yj4N+yt7TFgSrS9S5ZC0hrrz7uu/sfkC20+M16fto0okQeu
 cS2CUdLJ5FYN5NQtK69TaLY9Pjs+eVRORTaYkDvtKT+oTxSQdacJlbzCd4+QXvnYBtfpr9cW5xs
 0GU2hl+8pnxwYJQ3FlhKl2LP2HeUpASzTX0Fio+ROgdASrcIgtBI0gsPSAwFoxV7mPMc/gLIbyI
 i7rNIv4Bxgvb+fJVg6SHHC14PmIgOGGV7b698LiiSRYiCBl9Li3WkHBQgB9OS1xF0EHEu/AwxcU
 iVmfoqgn4socqbUust67tnD6AKqIkoKj+0IilknIFG7icn2pTiMyoJ4nlIPdDb0vGhJmcoPer/q
 gr/zqtAUtnqAR3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Get rid of one dtc W=1 warning and cleanup (verified with dtx_diff).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (15):
      arm64: dts: qcom: ipq5424: Add default GIC address cells
      arm64: dts: qcom: lemans: Add default GIC address cells
      arm64: dts: qcom: msm8996: Add default GIC address cells
      arm64: dts: qcom: qcs404: Add default GIC address cells
      arm64: dts: qcom: sc8180x: Add default GIC address cells
      arm64: dts: qcom: sm6150: Add default GIC address cells
      arm64: dts: qcom: sm8150: Add default GIC address cells
      arm64: dts: qcom: sm8250: Add default GIC address cells
      arm64: dts: qcom: sm8350: Add default GIC address cells
      arm64: dts: qcom: Use GIC_SPI for interrupt-map for readability
      ARM: dts: qcom: ipq4019: Add default GIC address cells
      ARM: dts: qcom: apq8064: Add default GIC address cells
      ARM: dts: qcom: ipq8064: Add default GIC address cells
      ARM: dts: qcom: sdx55: Add default GIC address cells
      ARM: dts: qcom: Use GIC_SPI for interrupt-map for readability

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi |  9 +++----
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi |  9 +++----
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 25 ++++++++++----------
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi   |  9 +++----
 arch/arm64/boot/dts/qcom/ipq5018.dtsi    | 16 ++++++-------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi    | 16 ++++++-------
 arch/arm64/boot/dts/qcom/ipq5424.dtsi    | 33 +++++++++++++-------------
 arch/arm64/boot/dts/qcom/ipq6018.dtsi    |  8 +++----
 arch/arm64/boot/dts/qcom/ipq8074.dtsi    | 16 ++++++-------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi    | 32 ++++++++++++-------------
 arch/arm64/boot/dts/qcom/lemans.dtsi     |  1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi    | 25 ++++++++++----------
 arch/arm64/boot/dts/qcom/qcs404.dtsi     |  1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi   | 16 ++++++-------
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 16 ++++++-------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi    | 33 +++++++++++++-------------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi   | 40 ++++++++++++++++----------------
 arch/arm64/boot/dts/qcom/sdm845.dtsi     | 16 ++++++-------
 arch/arm64/boot/dts/qcom/sm6150.dtsi     |  1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi     | 17 +++++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 25 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8350.dtsi     | 17 +++++++-------
 arch/arm64/boot/dts/qcom/sm8450.dtsi     | 16 ++++++-------
 arch/arm64/boot/dts/qcom/sm8550.dtsi     | 16 ++++++-------
 arch/arm64/boot/dts/qcom/sm8650.dtsi     | 16 ++++++-------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi   | 24 +++++++++----------
 26 files changed, 233 insertions(+), 220 deletions(-)
---
base-commit: 931e46dcbc7e6035a90e9c4a27a84b660e083f0a
change-id: 20250822-dts-interrupt-address-cells-a1456890a281

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



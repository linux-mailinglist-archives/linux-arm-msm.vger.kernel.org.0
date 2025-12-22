Return-Path: <linux-arm-msm+bounces-86083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078FCD4918
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD88A300FFAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 02:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6551E487;
	Mon, 22 Dec 2025 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLkHRC1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF5A3246ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371124; cv=none; b=kkX8KH8jlqKhhmhshWxOJG05qqJlsjGla9jp7ONn2z8RwG9qirq+YkXGDqjJRopoz8/P0Hp7KCa4U2Spnz4EuXb7qJTEaFzFbXp1bRREDCbCdi0L6pkP6fnZOxTeOxtiAXXyZt3zuMOcQfAGIuHNi+DJN9103ErKfc9yDt8oTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371124; c=relaxed/simple;
	bh=o+lo2R6VrD2l1K1wAu3s8Nm2uMhAoSvHCmKpmzcG7Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZf9bEr34KQEwz74yi+A14fDhmk9pRXYCPExX07UI7+S//G6y7A3+kKGlpcss6RX0VkPSlaf36HlCykGJmpcjfEtAem4/qD7MwMoD6/46IqC4FvjXp+FsOQSSQpbD6APITDv0luuio6hcwNDN3DyJNagBiExAaPD1Qv9rJ83m0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLkHRC1E; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-37fcd0704d5so3030731fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766371120; x=1766975920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKplcJB4INYhLUJt5K38fUJf5ua/a1xn8diyUX/jozo=;
        b=XLkHRC1EaGLPfW4YSiWEpiEasnVFGlWQL4lYG3DdVPMhd8AlNauIG12QYvia6ahQuh
         CxXI2Fa/8YLO1d6wq1YrmiwKJ5eKuW1fcr8fvEm7ah5l+/2049yhxXfU6IwMC2eLCiQU
         EClety32oaCOiziPJgq4NR75pvbkvjN6sjWGUMrIs50wVDGhDyR7NOuepaV8QmKYk5kr
         /iF06bdeYD4yBToGsOmJU9k/epTs2bNn0x5czMMzRTwWmUpcq5Gy0T7FquJ8jmApK/s/
         8eDkiqCs1rOgw9YrmVL/4gYDpc9cWP0XRsVxuO95yc+X86lzcrSz5oUcSp/tSLu5EOue
         pvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766371120; x=1766975920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKplcJB4INYhLUJt5K38fUJf5ua/a1xn8diyUX/jozo=;
        b=b7vM0jc3ccZaJj4B1QaSfllYWPrJ7PbvRvL++1JpWGvYeTBDMXTp4GZ9GIa69/oWPr
         aoi8baffuQHdUR+y1cZ9xfLy4O4tG8Q2WnPpDZ57zkLsB0pWVZL4+8260y1CoolW0rOx
         2CF/OLHegzsHmxuVvgBjrsj2KuOGXAlesLmqvhWUwsZOhG4ZebPH9zdRXNsALJf6FVRP
         Ebbl5qDIVLGJ7lD4PTYH6nhy2bbQXXWs4g+uNi+m/AttbTTWqp4i7ANpUKLtPBQfFjLZ
         A2sgjoALiT8a4fuzFmLcPIHEDZ2CdLvUWVhcQHpFAsGkmCSBWo5hNjjrqTe3U+OUtBbt
         eZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWaCipqs2xFktlJ0nIuU5uZl/haRqubUlO/azjKGcdnQ13GjGCza7Au58lIcDZ+6aAYXy0EU+C1XtOkjvzO@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIHFon3GFFav0j7uDr61Ad7TAiuv2x/YdKKl89CeFmKsFB0YU
	QzVn64HLTx2H1Ty09bAOsMmYNpP4RKAAGbIe6l4FgTZCUm+fBuR8xL6IK62PqkPHwHs=
X-Gm-Gg: AY/fxX5JmQ3Y+NBEBrBCNrFwm9H3wBa+exYtdNAW6Trbb7OdFtz1++QuclzsB9i5FIJ
	lePP4sN0/KbmnlGcyJ0RyO5KiF9b+tpHAtvEpKSBDk19dcau4wlnisggdMMxpN+hqXOwby+n4ub
	NP/gRQR5ZMazGQjfXjzuTCPvM6BmVQv7dMSzSayJdlwzh657NzaU3nBCjN1rt4HCAWnm5pXL87+
	eEBGMqTe3772e8NkpNiJo67oKNdEJy6h7cxX5DnRKyDIsuBw59pLZJ5J7TaP8+DhynV26+fzi+n
	S24QVhIM2CR6FJjpClihfvgwbP6NdLCmXmVMp9Lb6Ct1IxqzA6Mvgv9HcutTKooIk0Ux6KVdruY
	3OXoKCH24nyKAiwFLGT3NK8fucO1f04602xQSzMfc38Xr+H3FMYm9EaWt08T2QkKBvSu+vqQAi/
	mf1hqX0JVgq0ZsGnOwez7oUcez9rnL+xnsM5mKiN1miIMHBC58gzHQfQ==
X-Google-Smtp-Source: AGHT+IHh9nsbdPcviX+36zw/EY+HxcRMpmEmVE4bG3Yo6GF15MCmn6yFnMTw4RnDESnldiSEuCzRjQ==
X-Received: by 2002:a05:6512:2350:b0:595:83c6:2228 with SMTP id 2adb3069b0e04-59a17d1c883mr1987950e87.0.1766371120394;
        Sun, 21 Dec 2025 18:38:40 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm2778259e87.95.2025.12.21.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 18:38:38 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: qcom: sm8550-qrd/hdk: correct S5K3M5 properties
Date: Mon, 22 Dec 2025 04:38:30 +0200
Message-ID: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The changeset updates voltage regulator property names and removes
an optional data-lanes property of Samsung S5K3M5 image sensor found
on SM8550-QRD and SM8550-HDK with Rear Camera Card boards.

This reflects the changes in the dt binding documentation of the sensor:
- https://lore.kernel.org/linux-media/20251203040241.71018-1-vladimir.zapolskiy@linaro.org

Changes from v1 to v2:
* added gained Reviewed-by tags (Konrad, Neil),
* removed changes, which move status property to the end (Krzysztof).

Link to v1:
- https://lore.kernel.org/linux-arm-msm/20251203040538.71119-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (4):
  arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
  arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
  arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
  arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property

 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 7 +++----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                   | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.49.0



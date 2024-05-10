Return-Path: <linux-arm-msm+bounces-19690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F18C2527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28202285812
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D43127E27;
	Fri, 10 May 2024 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEUJ17zg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44090127B5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345919; cv=none; b=O95ffVCYvWv2ev7Rzda7Br53vt97F9YHm2DmAeIEE7WjdRndHNcQ42nllm3hTbU6x9/MQy2jENw7EwmHB31zm+gSE/ruj7uVhkIjMyeBQt8sRdl0cIHEcrlRD6eK33aTTJeUCtjfr3DZfgNkKhX28vkzsqphuFDSNpXw8IwNn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345919; c=relaxed/simple;
	bh=j6ZhT6JKQdpaQ4nF4OUVdMD6OZP1lkY+RwkwRCLgSkk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4RSl2jHZoyW9TMfmNfmtbTuLLOgdL4+AtjD1HkR4ry/PcZrxx5/qtnUn67iQoVKO2waVkZ/+FbpQkftagSdQgMVkRL0akidofyVjtAX1d+q5U3EVNO52QeDP8fodD+jqmTLMINkmz04OUXMhuwxq1mpIjE65bqPJmGnkhjXrM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEUJ17zg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59a352bbd9so342174366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345915; x=1715950715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rF3Vk3nYg5uojFLwj6FcvaVgIkPrJFERDpx5/V2uZE=;
        b=VEUJ17zgxxllVJf1mStUqQrCeuaj9hnBMkhlc9sreKPkSP+g6GbgRmwL6QqAf1CCIk
         2VMOWQR6Jyx39S4Pd20DvMhUFTAZ215fz3I1+mlyo2nih6PHR3x083zphDoblpdFqTUG
         BmW6cHZPBIUXl1HgZkOsqI3OV1KooajIivsBhocwGq4pYQJyQ7Ggi3gBAV0OSEASETXS
         RQgFLjEg+vjbApZRAsFDPvzoI30z+MwubHo3ZTEceRl1hUFOl/0ee+jApD7o+AJ+Hobd
         QzOxOEkuTd0BlMy9BqZkikV9z2MvgggAF5j07lfiis/DxuYoSsT5KCturmewxTFwMuzr
         jXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345915; x=1715950715;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rF3Vk3nYg5uojFLwj6FcvaVgIkPrJFERDpx5/V2uZE=;
        b=P/eOx6u8+0dFzmHjIpLGz4z8T8C6M6feIG262zfaxixPAS7oETAedSlUrbz4LzOQkq
         UHAlmAQpd20JrmK0eWFypOt1YX9jCWjJEudlZA4wHgeX9g8I2N0fj5CiUh8hN+ADooc8
         nF0DX40/KSaw7JxI/EW3ze5A521EuJWPPzji9iLb3c1MO6mEtB7axd38Nx+PJrumbqY0
         gESHvOeWbLKPwntfe4upun8wbsQcDr4S8oFMZK6PcopzA0VDWht58w7nLxZOjyL2SXNY
         rbI9zhR56ubgvjN1yvF3UwRVmxrk5S1jZBde+6J38i5FK8iKuBBGKhsBYLubhDymqRA7
         bxog==
X-Gm-Message-State: AOJu0YySJrGP+ekaNadEB2jVPhts2XDYJYRhN0KBGLkhHDYj7PE5TySy
	bnvg0AiNsyQq89fU1EKC3IqQ3FLLW9fjA81YP+uMnV3bGxCr9eLbVXWnTREwAUg=
X-Google-Smtp-Source: AGHT+IFEWwdsaPUn8ujKgl36DZHxd8effoxjsjwh1WmVFN9CjQrAIjGgg87VdiWkeAbd1uF1pjBf1w==
X-Received: by 2002:a17:906:7748:b0:a59:92b0:e0d3 with SMTP id a640c23a62f3a-a5a118c5393mr399265666b.34.1715345915620;
        Fri, 10 May 2024 05:58:35 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/12] Adreno cooling, take 2
Date: Fri, 10 May 2024 14:58:29 +0200
Message-Id: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYZPmYC/x3MTQqAIBBA4avErBMsiqSrREjoaAPhiPYH0d2Tl
 t/ivQcyJsIMY/VAwpMycSho6grMugSPgmwxtLLtZN9IsXMkI3w8sl4SasO86cCXQKusMp3r3eC
 g1DGho/s/T/P7fuPvbe5pAAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

For the thermal framework to cool devfreq-managed devices properly,
it seems like the following conditions must be met:

1. the devfreq device has a cooling device associated with it
2. there exists some thermal zone provider
3. the cooling device is referenced in a cooling map
4. the cooling map is associated with a thermal trip point
5. the thermal trip point is of the "passive" kind
6. the "passive" trip point is being updated (via polling or otherwise)
7. the trip point is being hit (i.e. the thing gets hot enough)

Various QC DTs have various issues, mostly around 4, 5, 6 and 7.
This series tries to amend the platforms that currently can't have
Adreno throttled, without making much unnecessary/debatable mess,
although sneaking in some configuration unification/standardization.

Further updates can be made in the future.

This was originally brought into attention by Daniel in [1], this
series resolves the issues on a treewide scale.

Developed atop (and thereby depends on) [2].

[1] https://lore.kernel.org/linux-arm-msm/20240116115921.804185-1-daniel.lezcano@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/b4dba1d5-448a-4a4b-94d5-f27c6ff0010d@linaro.org/T/#t

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      arm64: dts: qcom: sc8180x: Throttle the GPU when overheating
      arm64: dts: qcom: sc8280xp: Throttle the GPU when overheating
      arm64: dts: qcom: sdm630: Throttle the GPU when overheating
      arm64: dts: qcom: sdm845: Throttle the GPU when overheating
      arm64: dts: qcom: sm6115: Update GPU thermal zone settings
      arm64: dts: qcom: sm6350: Update GPU thermal zone settings
      arm64: dts: qcom: sm8150: Throttle the GPU when overheating
      arm64: dts: qcom: sm8250: Throttle the GPU when overheating
      arm64: dts: qcom: sm8350: Throttle the GPU when overheating
      arm64: dts: qcom: sm8450: Throttle the GPU when overheating
      arm64: dts: qcom: sm8550: Throttle the GPU when overheating
      arm64: dts: qcom: sm8650: Throttle the GPU when overheating

 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  28 ++++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  17 ++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |  12 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  28 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi   |   8 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  16 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  28 ++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  28 ++++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  24 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  48 +++-----
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 208 +++++++++++++--------------------
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 169 ++++++++++++++++++++++-----
 12 files changed, 406 insertions(+), 208 deletions(-)
---
base-commit: 2adffd063e54f8790132eedfaf3019bfb6f62268
change-id: 20240510-topic-gpus_are_cool_now-ed8d8c4f5f7f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>



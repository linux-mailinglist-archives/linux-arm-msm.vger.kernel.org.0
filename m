Return-Path: <linux-arm-msm+bounces-51079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5EA5D39E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C368716893A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EB620ED;
	Wed, 12 Mar 2025 00:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUJxAp1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D183C30
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738306; cv=none; b=Uv/BLetVmTkpn6jp0NC0L8xseaF7GTJVrsxrnBE/+dCTmCikyFwVKnHlEtJ7Dyi12EDfdn/MmbPJI0p7MMgQsQjepIXpRCaBoy7XLFI8OCOZw41EvPHAqvPUuJ7P/P/mEFXfgER0JI5kLre521tG5CmqdrLt1/JKMi4nyCEzhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738306; c=relaxed/simple;
	bh=r4uMDAv8ZLSzUVvmQWSjnGSf+Wa5/Jy45T2NBY/rZWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPo42ufpM9GWRUQSN1slFOFEBCF0iH6YUefNtdcWTfIHCybM7+7FZSbFYlNznRApz7GXKJ5qZafQAZrSs+SWBx3F5MrOVUp7MOCtMGKzaZBynjkI1en7k9p3M/4TeTOaSHZMKVx6ULfetJR06RA9YZIwhULoSA6DqG2RHk4/rYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUJxAp1/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5494fe13a6eso888426e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738303; x=1742343103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x71rDFrG69wZWQuxGcSWuM7VOTt0MMfh9Nt7EV6dQ7g=;
        b=IUJxAp1/7H0GgbmfiWUMLoaK6coxlwKeGs+WcqTl6HVbbMtKQsE0toWP4YweW4s2M5
         EtY72MyME6dAgkzkW63Zkn2J63WIojHO/jP4MHUXvba967ubUWJ5/9zHF93C/FVfSlDv
         026x0C4Wf16zixi0bU/A93lSaBXbOnRBj4LYOYFqoZRm4z/xfnh7seNYFnGxr8NW+cXj
         LVFxC57BRkvbQiNI70SxWYZkeFAxfQg/dBcu0fM7IndXQuUyZfedsJafnlecEpvynx3R
         I709r7BkzOS4B/m/G816vL1aycmxj3BgcfS2diWm+oIkA6wVEh02dum1kdlCzjVjLWL4
         lwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738303; x=1742343103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x71rDFrG69wZWQuxGcSWuM7VOTt0MMfh9Nt7EV6dQ7g=;
        b=OKS/l6FHpI3ufzITxrA9aXkTdQWzpgyLKsA3J1gP03zcqgbOsrPUd3p1cXjmbGTEnj
         LfMayWhayD5rztAarIyW91b8z8p5OFgqpSPyhVQAPGMzU8S3+qnn0cVP5Iqy4kVfyDUm
         YZXw4dbr1MyWWOH+v8iRigE7jcuKFkdmmfCV5klKKrdzaQlRI4o4scIcYm71LLermZ9b
         4yjOoWwOOqm2mLHtqd5+wRnsc3UhTrLdNLAp+UUELtLxNV1r6nbgXK/qcMwWK5yeMBJB
         Zunz6FK9HiMVCPrPnCoQ8EvBx+D7JBiYJMsdAVDvrtl9da2qZ5sqxtvCRr4xdyTaNTwZ
         11GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO0FR3I/zFBdQZc4fxeB/wzXBkal2TijjYNMIcg75KnSzgN4nASDg5dWsCmCIxrK5d2yWKiWXePpfWicyW@vger.kernel.org
X-Gm-Message-State: AOJu0YxYE+r8jeCfdZfme/XfYr0qUV4MlBUHrz4B7KM0NzQpgPMLSrdQ
	pbHW+s89RhGm0pIcuNg+Aw+avd6AZel3qrhnqxG7BmjG6ug59zfwL1Pame85s6I=
X-Gm-Gg: ASbGncsDoVT14Wgb+h3MEa3WNntIx3ThOZaX+g9kHmC36jFeG5+PQlcNoqBvPSGujOO
	rq5pZlhufnNemk4CqOIisbL/p5DPIkUFYgJXtN5ZA02lF35geO4968RPdZRs+p8r++lcaRV0cwL
	hWIWLLNUDxd1rjp3UD18nsClVuQk4b7zORg2q9vrmq63+qDE4mWRG8vJUhGj5dRUTKC7mkH/qon
	Q2aGVXbhqx4yt44U/bK7GRMuwb4O58iX98UWSggJL5a1cQQl+MmdNYKDcf5pdaOEIbmoIf6jfat
	hT8MNYBXGSV2uX25091zTG+sy+qL0DoxGC0hOxUUgzPrn07gL6cMwxrf3dNkpX/MWV2eIYY+Wwn
	JDI4las3XxovoQodnt/V1E8TSDNPHAKZ+UvzffFmdHDuS
X-Google-Smtp-Source: AGHT+IGueK5QoMNin55y1U+ReeRji5g+uoV6EuXb1xgUOJA1idypd0Lwh+bCzoqSFe0fWJeU2bJx6Q==
X-Received: by 2002:a2e:a9a4:0:b0:308:ed4d:6291 with SMTP id 38308e7fff4ca-30c206a5124mr8288491fa.3.1741738302256;
        Tue, 11 Mar 2025 17:11:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Wed, 12 Mar 2025 02:11:29 +0200
Message-ID: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SM8650 SoC contains a camera subsystem IP, which is
got supported in the platform device tree by this change series.

Qualcomm SM8650 CAMSS IP contains of
* 6 x CSIPHY,
* 3 x CSID,
* 2 x CSID Lite,
* 3 x IFE,
* 2 x IFE Lite.

Vladimir Zapolskiy (3):
  dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
  arm64: dts: qcom: sm8650: Add CAMSS block definition
  arm64: dts: qcom: sm8650: Add description of MCLK pins

 .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 328 +++++++++++++++
 2 files changed, 717 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

-- 
2.45.2



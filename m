Return-Path: <linux-arm-msm+bounces-84142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74606C9DB4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 05:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 686C04E01D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 04:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ED526FDBF;
	Wed,  3 Dec 2025 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbGqoE90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770726F28F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734745; cv=none; b=CMYaRb2R1mKG4fCJ0pe95hUniZYHkZ9PAgyE7vJiBctSV1TcbwSJFCkONlUvIlHxGcHRZ0o8CjCfZguGaFe3xOk8LvdH3Hfpa2DNyHnz1+PDR/+9Uju36Fti+HD2GHlQ91/VSIi/0DBQEFdOP26CDL5MOtYnnfMphcbfcDqmZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734745; c=relaxed/simple;
	bh=vtlK0ZhaxSVXO9xNTREVYiPCDU6CowvtSes4xTee6Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=avOYRgv20FlnijBwnl10gwJAtXT44oaLn+pp2jB01sj77zgNIjb49V49oqRXDCfv5/p9Z+nMNJW//6k/cu/NGX6/kkjPUjIYLvy/303C1pfxyuDAbrtMNtCX/oxb/1NN9ZSWkoZUK6HTF/zgbBik8gSPEIW2k3sBibdcBPBcV1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbGqoE90; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a492d38e0so8197621fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 20:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734742; x=1765339542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AauXa/Y27Mbhc+rfU8RtO1F/i06XMMTsp7zJqho7aGU=;
        b=FbGqoE90M+Pqqs/WZRd67z1odG1E6ztWufmgn1Lubu2OYeD9rKPK2kE2beEHysQFuX
         BvHO51ALxwnCIUa9UQks5sRg97HE4Fc+BIWI0rpU12xX63CfELO2p41teJLn9KEDFR7P
         s3VdsmymhBM3pCJgwBZtoW9emolncXhOKl/AKOZGwtynrq20tZM1f4BciDZzvDMeW+Hz
         jvpyouESOwv8zaz7xiQDfsnBzS/tc3vBuUJJaFp0cuOnRr6WErO+ZAZy4A7On/XtJINd
         hnabDLzr0MGUNjTRjGazIk/3g7G5OFemVwQExCEEU7POIHUrg05rHak1ofE7JhCF6kwh
         uAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734742; x=1765339542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AauXa/Y27Mbhc+rfU8RtO1F/i06XMMTsp7zJqho7aGU=;
        b=fEhMZpGjkolLLVXhhXxt0mOmu//e9OVpqvw+qQ6+yhCtFXHhQA/AXzG5ZX6xwrlv+i
         T2zYf4EC1cwXNxEYEjy/0K4rkiU3+0r6Os/dfDweFruBydYBJSjJr27keNsTYEjwnpqv
         s3ZyySrnri6fJPNWhqb4TECmO1xPYSwDgRFSGhi9rcMSvBDkj82fxvBIog6mEouu1tYs
         aQBEmqVyAZJ4Ln6tB316nCJVQ9j7WDeRha3BDf/qFwjNdn0AkRHbxR89gtffK6jnhtD+
         c/s5xOshpgR8nOzK0+6Gps4KyBuBWFMT/fGoMSXpvOAPbf0gwXfnPaA02AZYhEKdypA2
         cgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp+cVtMzIbg5WTr8qSTwpXARlyLTXFio3m1cdgsdM0cdkNyzDjCMXS8AdcNsluvIWfoDClXrv6no32WqFG@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKgyQPoijhj1tK7tX2ljer4E6EjU8JG1Tq7udH7Cst7p8GGjT
	jwgu609bmkiHeROdL7UUuOE70HrO427QRNAnrFkGDVV/8fcu/Pi0kK+3mqqDjrbkiss=
X-Gm-Gg: ASbGncuMUKGLcvomvxbMJn1yprMQAqU4TWaXiE5AyvYxZ5IkWuxSMsM2sLzwiJdCJXQ
	8zRC4O7jLJgTC7edQuZDE8ZHzb1QRpacdP95sNPLqNL6PDHG3piLvKLNrOxh485yG8xd797SmLY
	IwYJw8aCGEnz21FwlRSyOCXfrL1gH5GauflvSzg+agO262/oEleg3GlisTkt+0pLbS7vm3FOuAe
	KQihKwmMsr268QdS2zdeSROtJLER+eDRVoJQbA5PA7jUsRWPgUCMgCoFdzB0pESbjx8mvueVFXY
	ubTz+0+QNBZSs4rs8oD0thQTC4OQyMlY1UZGAfp+a4EyVUJA2d5yPkrcxWS4G6sNsn94kZ/sngx
	3kFfKji7Of6vbw2ePTY4L/L9b5jIQFPdMoSXtV0zFBNiqemBWhXprydap2GlB05hrC7CbqLJHRb
	12jHigt6XTX55hGoGWwFe08q9r0OpOXK0QOcEB5Fx9bLaFJnf/JE18rA==
X-Google-Smtp-Source: AGHT+IGRM9PXFkTHzRIxS0LDgKxvTnnx4+Xizl6bO0aUh1UWcGFmB+QLnD7VuP6+znUk879iNlbbiw==
X-Received: by 2002:a05:651c:220e:b0:37b:a65d:51c8 with SMTP id 38308e7fff4ca-37e66a254cbmr323011fa.0.1764734741591;
        Tue, 02 Dec 2025 20:05:41 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d240981cbsm39505631fa.24.2025.12.02.20.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:05:41 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: sm8550-qrd/hdk: correct S5K3M5 properties
Date: Wed,  3 Dec 2025 06:05:32 +0200
Message-ID: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
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

In addition to the changes above Konrad asks to place 'status' property
of camss device tree node as the last one on the list, do it as well.

Vladimir Zapolskiy (6):
  arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
  arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
  arm64: dts: qcom: sm8550-qrd: move camss status property to the end
  arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
  arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property
  arm64: dts: qcom: sm8550-hdk-rear-camera-card: move camss status property

 .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso     | 10 ++++------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.49.0



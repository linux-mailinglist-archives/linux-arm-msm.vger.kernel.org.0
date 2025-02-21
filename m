Return-Path: <linux-arm-msm+bounces-48950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718EA3FB72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B5C700834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9E81D5173;
	Fri, 21 Feb 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBjkC5zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659F1CCEE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155038; cv=none; b=HJWaKA8GH2fK+BcAPb+17Tp4txQArcncyLnxzVdm97RZBUTBGfyB1fm0MoFDj5Mngsz6Ss87sayYf92riz2fhF1A6NzW/wx5DHn+fgipp8+j8rkZvsWm5lBDbXo83fCwLcghctyhHBNjRvoghTrYtKLZt+TYYJjm69OoA/uhCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155038; c=relaxed/simple;
	bh=YPeDE9k5PoZhCWd74NM15u9kZ7B1rlsN24CYZNpnAo4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BpaJTIho4CVxGO5BNN9F/BWtcbAj1A0GHBi8ZZn79UK43c3W+EyDgl0Dk4oTZUUvfQdRX8h4GsGFVoCUk2bgBNBpW1pxLlsnVEdcBMpks7WIIP1HwHSl6GUd7ByCNRjMr0bsH8KC/MVkCGTWfwUmU0phtDCHDmDSB9LLzVEiN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBjkC5zu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb9e81c408so39864266b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155035; x=1740759835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+yipc07uDBPA03tmZf2IT2Wf3oGHwxAMcsPIcFW9c44=;
        b=gBjkC5zuO72s+QWNNU2NHC5YZfTr/I8M0Y1eCHODcs1H/oysyw1a9bPuiHF6+r/Cfc
         txCucaSk6Bcv5iRDWaWPUs88se5GFeJiDWsEyyKrQQZeqqOa+SVinQROkuOAMROkJzpk
         9mjTbzn2TdRFDoQcpYAIBkpR+fZDyL9gS7gLPE+162l7YCoaVigATKtbrt7DYCAtgk9s
         LAB7k814z97EYtqsBnOlq1I7k1yZUAYuuqvjXmvuAl30GnbxKFqs3DS6sSaWXU18bdvf
         KZQCgkwQ1Z+HVdm7ZELdlSoK9IqPj2IiGBYccQVa7QT/v+vjwPs6uFC1gBB4oYXPqgla
         oo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155035; x=1740759835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yipc07uDBPA03tmZf2IT2Wf3oGHwxAMcsPIcFW9c44=;
        b=dXnSsgRLKCv7T55umwtbRVejqWqPJlWSXgXOt7+WdrLuYShLkLMlCD/hcedPSe+1Dh
         XlnI9XSsj7fAFNmxkIw3rsfKuhrBtHp6sd6WRqUE0weFOigQVDbMPmLih48AWzlPKoSu
         67AZI06MMkTkwMDtfnO1Bb8nHlFnVzWjosXwkXCFSEfBiKnBirWtYj66XNy69+Sfb5Pb
         WW0gBkQLkb6T/wYUfm4NKNXGobLkNEDSjwN87Q2sVnS26e+JF/vsctnFnc6MSCnIEoMR
         QqcD6p9xm3U7c+0yjV3wdYfmyJo7tOqbrpOSfaPvPsV13RrOwgzX/6G9UnrJwv+G11UK
         zu+w==
X-Gm-Message-State: AOJu0YxW+vMrbSWlTMS89mpjqGdridJqLG4Z5kqCpqwMekRppRRCOyHy
	PoIcUIykYlEHZN9mTCJ4Y4mAU1WsSGjDq6C3cXaQOe7aBzt7PEv8475hescUXrk=
X-Gm-Gg: ASbGncvdBCatPciWe7H/z81z0I9EdAxG+a1YSlI8OH3vtdWHkkQ6kF2bx6sU8zEPp7q
	5ZpNSKSBenrMghKrtCahlD7/nrX12sFbqle3Z24cmZ5lFiPc96kfCeEYDZFAC6BYzcX6xKIzcsz
	VGzGaUuXvMmUSFP7zEprWVB7vGzQvlX7Im7S1V09LRG5UAeCP4CVMSN6nnNZ94tOBBwWd5ixgVo
	THMVhgEZqqPjhedc4l+wDp9EurEhgLFHu61VrswjgUk6iU9/YtcDji3b2xwTjLyDJB9X6f9369B
	fNoSjQtvKn1IvXQwgE3kOxpzxq3gMUr/gfw1Hl1Bm6dzTI6qfm7t8uLSPPp2VANKwIlmqPW3gpS
	1
X-Google-Smtp-Source: AGHT+IEyjO+uMmK10QMH4Zm6RG6FkdMaw42UAjw83fRmH1H+WSKYtFyv3mw/iclIJvgWKpj2xJiMDA==
X-Received: by 2002:a17:907:9713:b0:ab7:5fcd:d4be with SMTP id a640c23a62f3a-abc099c6a2dmr171153966b.1.1740155034895;
        Fri, 21 Feb 2025 08:23:54 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1050545366b.96.2025.02.21.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:23:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sm8750: CDSP
Date: Fri, 21 Feb 2025 17:23:48 +0100
Message-Id: <20250221-b4-sm8750-cdsp-v3-0-fe2891beeef7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSouGcC/3XMQQrCMBCF4atI1kaSSdomrryHuJh2YhvQpiQSl
 NK7mxZciLh8D75/ZslF7xI77mYWXfbJh7EMtd+xbsCxd9xT2QwEaCkBeKt5upumEryjNHFlsO6
 g1goVsYKm6K7+uQXPl7IHnx4hvrZ+luv7N5UlF9xibdEYS7JtTjc/YgyHEHu2tjJ8fCUAxI+H4
 rERREBCa2m//LIsb6tUOwLtAAAA
X-Change-ID: 20241122-b4-sm8750-cdsp-38a6c2643a3d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YPeDE9k5PoZhCWd74NM15u9kZ7B1rlsN24CYZNpnAo4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKiWDsYQjzjNGo27/iiSfWQm7NUltQsh4YYUW
 llY+oPk3D+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iolgAKCRDBN2bmhouD
 1+gqD/9HoVs6oq/y9WheuG6LFoamttSDKzUlAmwXgmn816y7wy/I923nV8hAhC0ELmHd2UlArq7
 iY9hHNOpOyeqdzTPuGLaUyzhv+c/+xZ41hQMgnWb2aKbeS+bwNbxYemIWM2Kr3tcEGOtQy84qM8
 /RBOk5X0w/gwcx8anrcW+uV57GosLzF1Ekug3P2GzXs5qPP1Iv9S7LqTCNKQ8p0QKVy3ij0ssEv
 kqzanELG+Kx2Q1HBIWljNzgZlP6BgmYr52W+pij8VTUJAng/mvYJBbZ7RML6i/k5TIY4qk/NDkb
 j75349UeR1J9twlHXv+IFCscWyHqXysVbuafV+QzET0RKsBn+HqG3DsTL94Bcr8yBmqRAXDcLIU
 eds5o+0k1yiuwPBAPXKuf8VcqnTp9CezP01WcFuimtV3prePeteRCGmIEuMOncFrfbcDPnKCeYo
 6WJSZYcE/f4A3X3SeW1/FncikZdmz+FSX/YOSFH+zYep0530jdc+g2nW366MnYfG0OAZ6aZN+DO
 yUsG3qf6269etdE/FDij005v3qz8ZUiGHVJEgtWuXAB6hGy6bS5qis26DCuxWZ9+3HDQZtK9LIY
 M/54gOd2h70Phx5dKOSz0befufbEVxuo23mLCvDELKBn39oV5LAL9wi7S+Pms3X4LMXVGlOEOgB
 NwSk7NlPSqJVWEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Changes in v3:
- Based on Dmitry's feedback, move modem pieces to separate patchset, so
  this can be easily merged.
- Keep previous tags.
- Link to v2: https://lore.kernel.org/r/20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org

Changes in v2:
- Fix CDSP and MPSS PAS address space range.
- Re-order nodes for correct placement.
- Rb tags.
- Link to v1: https://lore.kernel.org/r/20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org

Context of this depends on my audio patches:
https://lore.kernel.org/r/20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org

Bindings for remoteproc:
https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add CDSP
      arm64: dts: qcom: sm8750-mtp: Enable CDSP
      arm64: dts: qcom: sm8750-qrd: Enable CDSP

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   7 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   7 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 194 ++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)
---
base-commit: 65177495431a929b9c6ead8360ca256edf3668b5
change-id: 20241122-b4-sm8750-cdsp-38a6c2643a3d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



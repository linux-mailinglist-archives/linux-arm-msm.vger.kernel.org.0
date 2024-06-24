Return-Path: <linux-arm-msm+bounces-23913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3369147E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5902E280EB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F3D137C33;
	Mon, 24 Jun 2024 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYle4mXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF62F24
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719226554; cv=none; b=YcWvsTNe6PFqYGsoUbLBmzCfPS7mH3T9tdWgbTUlOacCWj7mOjjQOjAuqysqbxQYjkUwiVRYpxx/1tqg1u8k9iBjJFElWoaDxKhx23C0aAMLKK/z0quN8fhbD7WEk2xXuJJko1B1ChMOV8KmKl0gpyhAHL6cZn/SHA2hUzlgR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719226554; c=relaxed/simple;
	bh=m93PqmPPYlVm3qNVKHO1OoiEMehyaRVknTRxmok2Igk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bw7Thx24qTzWwUZiztAlNLFzFIG+ubUUL/1eDqYmnrFq5kU2zU7vAgsg6fMJoPqlhB4IrJkjtMyU7A14x/E/+n4b4aFD+2e3egWEkVyUbwVcMtzjYllbmhKik0/qMrYlimobTkPWmKNg/3j73pSc7lhM9/XtaAbiUD5QA1AF9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYle4mXz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424798859dfso34828745e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719226550; x=1719831350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrY4lNWDw0JNKgEW92bRaQnV7A+B9G4Rjjc9S7WHhug=;
        b=BYle4mXzA7Au1Q2lVSw/2qNZ5jKLb+WtinSNg9pc7uw0j6qgwLnxR9vm2gLWk9u3IZ
         KYui7B5BAs/pIk0qVIagYJdijqtDy4tW4YvZ+pU0avSCnPOIFfSbxFQBXX5ClgWvYvoy
         HPT5E2sXj528jsJI/lN/4f8/tc1w3feU80WXEbY5KCC74VfpKfILuYjOXwnD08T75xLE
         PcXHxwVK4x5rn9xudkiE2b4usnz3zHbrZClMlLjF3bLDvYZG0AmlEN0zokjHTqmvkEF6
         OxXr4dax9LFBGWfCFtkb2FrybmI/Xw9mdH14iA9zhaFY87i0fR/+ZVMPLGsEyuxIs7XM
         pGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719226550; x=1719831350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrY4lNWDw0JNKgEW92bRaQnV7A+B9G4Rjjc9S7WHhug=;
        b=ITeGZPL7tZPqB1wWlrpMtt142lZpXzsXlQwFfs9r/C8bQ943fvjAZziNKMUQo59paz
         yZRG1C2F0PhtklsXbdMXdjsVLZyIxiPxa3ajgMagLOVIdGp873RCRZbQPdr+AtsMGZYa
         A8LOWclDkMW141nCw55vgwix8sRAC/Q1c7IFOK1aWsE3+0YvXsPcHt+CWA8rxurZisMn
         kePWIhWthzhdQZ+dwPXGq8TLdqxpyv/zgswvcC3MMxDtDrI/6kFZ/78C8Yrx9aWZ8cuj
         OEmfkk06s5P80zAOAy/7viCPoLFPoDN87j94S/cxyOdq73vqUgPCb691WR793rDIZptK
         144g==
X-Gm-Message-State: AOJu0Yxw/yohiB+jF1ve0IJjICSJKcLx/giWkGv5U8GQjcsvw7GyZ6KL
	1dnKt8xuTo7E85oApjYEmmuiI1Le1op03y0auM/+UCK77sMJS04GKOG+Xv2DZA4=
X-Google-Smtp-Source: AGHT+IHw1NULDpfy7XMXRJ6DWODLoOwVod/uHKQ8uJcE3wFATvr4D6AfzpR6xKNl5BBnD6N+fh2jqw==
X-Received: by 2002:a7b:cc89:0:b0:421:7f4d:525f with SMTP id 5b1f17b1804b1-4248cc35da7mr28663365e9.24.1719226549521;
        Mon, 24 Jun 2024 03:55:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b6bsm172479595e9.32.2024.06.24.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 03:55:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
Date: Mon, 24 Jun 2024 11:55:29 +0100
Message-Id: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFQeWYC/x2NQQqDMBAAvyJ77kISxNZ+pfSQxN2aQ5N2V2xA/
 Hujx2EYZgMlSaRw7zYQWpOmkhvYSwdx9vlFmKbG4IzrzeB6rJZQf4JCSgsaOw4c+BpuPEJrglf
 CID7H+ai+sbyRi2Cmuhz+I8Spnr/Hc9//Pdx1+38AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=802;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=m93PqmPPYlVm3qNVKHO1OoiEMehyaRVknTRxmok2Igk=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeVC0Cnfdjgd6Z45SxGBAWvVOkP4/ByB+oynqM
 N+tmwF66b2JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnlQtAAKCRB6of1ZxzRV
 Nz+TCACEtla+qJDMQNeMS6wau+2oS8UC9r8+No4JYzgGKWx7zyR1Cp4PZhZKlaMNw0fHkiqP4vY
 w5BzUOiW7J3cQB9hfWz2uZDiyvN3R2eOhFozBVmNNUjfPtr7YT4S8YAnuV4iMTqAfoXA63t5zAo
 CRGcp3fptScKxrLW4hltFmXwosJYjy3Pv2kxRuSifQ6/ukSb5UKpexcCYEJZ9pOu+8KX0NxDgnv
 7tsA1KmtSPTB9in6qkAuahh/rTXHdCwmZJSsQ2GSYTfzHXOfAWQSBMlnHQBKjgbxHWbZuLTcwOV
 ZQHgw5nQFtuu9Gr6GKW2XYTQPlHgXrzhZmPaxcaYENLQ7UgN
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Soundwire resets are missing in the existing dts, add resets for all the 4
instances of Soundwire controllers (WSA, WSA2, RX, TX).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (3):
      dt-bindings: clock: Add x1e80100 LPASS AUDIOCC reset controller
      dt-bindings: clock: Add x1e80100 LPASSCC reset controller
      arm64: dts: qcom: x1e80100: add soundwire controller resets

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 23 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)
---
base-commit: 781025f172e19ca5682d7bfc5243e7aa74c4977f
change-id: 20240624-x1e-swr-reset-0196fbf7b8f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



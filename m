Return-Path: <linux-arm-msm+bounces-15862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA0892E7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 05:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83AA1C20B7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FA9C2C6;
	Sun, 31 Mar 2024 03:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WhyFsoHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD968C1F
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711856943; cv=none; b=EzCcnboRQjBna6P/as0gV0pfHA2GM6cmUMuqiP6qSYE1J3Fdq3ZteG0DeAqLUtg7S+wmsr6ayCFdPRZPtjKw0HSolQ6rKJF8tyDnzcg5J3VmZwo7KxE6vEH6EVCmOCCWGuf8Bx+D0QQOkaQFG0ouxJABi693Zp7a0gyqv0DjbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711856943; c=relaxed/simple;
	bh=+m4KcknPtPtiYtZonTjzGx6OYYK5R2lRlFqksVKoy6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJ4J9UVNTZ2q72FpJ/V0tBaocR0tr7j35okIVq0byLt15CXMHSRtXo9YtKP6IckBuuyw6zCzKJ9OEcK5R/qbH85aqsuUmg32N3AhoRz03O5YLY5/hE11EE66V4QfQxrUUYtX0WH5BSdr0aYf2AVxbe/sQoWvyoQyCoPmTJhlbjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WhyFsoHb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513e6777af4so5129149e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711856939; x=1712461739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QA39XfS6kFKT4ejZVfv3YPVU/6vd+JV/fWoR8cy3Hug=;
        b=WhyFsoHbqDQ7/eCixkXhH4SQOq9Y0LERVTtGi6VPLyb6Aq5poUmKPuI9t//n+mFEDw
         wzFMONQm6miJnby0YglF25X843f0yrw5FHnO9Egtd/+VKdvE+0afIwU4CkJYmfcL0jGz
         P5PxgE3gsLPNMzpxjChk+QxxxNnc1H0L/3+lKVM25tciq8RnwxZ0g5YCjCOy7PUS7xfm
         aDz15HppcXvHYeNUhgfmgcBhWwHgb8eHq18BRAZDaIRyyLj/lcYXIfpBb8W1UIInRpTy
         7nD6p+zQy0R9KwuGP2LoXzwZ2coAPmssaoPbkc8C63TWgPjQ4f4bbdXniOYlK29YXXRE
         caag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711856939; x=1712461739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA39XfS6kFKT4ejZVfv3YPVU/6vd+JV/fWoR8cy3Hug=;
        b=OyAf3wzGFct/mTNNdL8dUQgo9BaqGdIgEsTu1NEm4Jb5ZpxX+3WSi1HcVoGRjOXiL5
         zuU+6IQAQKcIJO/yEf6boyJK9dF/m00bdHbhHp7Kli02xY28OAFnOwXT+Q4uIiC3P/52
         8Fn4SadqCIJjRKFDM9ipvc7t+nkOU0qPUWNbNXxDP0Swqe2FXRdWebFmQmoU8LmRyxW+
         qOOtq55g66IYIcaAjBu8yDXzxjgIb2O8U90p6JZ1mQwxRHTxghvrD1anQRUBw1IACu+G
         1aXCXGwnXHi/NCO4PAjoTwtbT6mRkEwJM5Cq6KWzEwZDHDrw67k5FbZCAY3ubwOwQfQY
         DC6w==
X-Gm-Message-State: AOJu0YzER2I4sKwBGkKm+ABE0hqve7uxmuy3cDTbk/jHzyR9hQvlUsgo
	xNWg7jbxrE1zXdshj5bXqlYcGFIOEFc5osCOvDEeuvvCSpo8zsyTDj/TK5wkZl0=
X-Google-Smtp-Source: AGHT+IGSdefNnL48D3eBdlwTmsQLOovE8Wlg8ZbjSA1Gw+Fji1zWPLMzzWF++RtT1H6iclnJrX22RA==
X-Received: by 2002:a05:6512:3d8e:b0:516:a13c:da5b with SMTP id k14-20020a0565123d8e00b00516a13cda5bmr2170657lfv.65.1711856939344;
        Sat, 30 Mar 2024 20:48:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k9-20020ac257c9000000b00515ce9f4a2bsm762980lfo.35.2024.03.30.20.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 20:48:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 06:48:57 +0300
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8150-hdk: rename Type-C HS
 endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-typec-fix-sm8250-v2-7-857acb6bd88e@linaro.org>
References: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
In-Reply-To: <20240331-typec-fix-sm8250-v2-0-857acb6bd88e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+m4KcknPtPtiYtZonTjzGx6OYYK5R2lRlFqksVKoy6E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCN0lpGsRcs88ocPowhrJ7L1MXDJ8Nd/yzqLpz
 YP0S3kelvGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgjdJQAKCRCLPIo+Aiko
 1WS1B/0UJJ+q6jp6DmjaNxuD67We0M8FXv0OqWuz3+dUqEbt5hh3+WWDEncBZWIIMg4qmwwBM+5
 WxRjipNxGZ8SFqH3Ldmt1d+zW4NVQkKrGdLVtcft7KXGdGPR7Sl0HQoBI2AUXUT0GdCJZfCh7ly
 1ZPOBYAIUQ34GuRpzREZiZp/xdwNDXQ8CUDKUR2Fq7d4t2ilOpaFtEKhDnDRxGav4e2NQ3pveHc
 AWcQoZRvP1uptTGZrTSgXOgcmyKsnGQCUek5Pkl7xlDyP/ZgpzNMQB36WqNRK8Oaasawoi/vf2s
 m21i0X6PdA7SJMDwic/ExivvKhs8dKOyWVFhT7J88rpTNdKg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow other Qualcomm platforms and rename pm8150b_role_switch_in to
pm8150_hs_in. Corresponding port is described as HS port rather than
role switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index de670b407ef1..857ccc5de085 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -556,7 +556,7 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				pm8150b_role_switch_in: endpoint {
+				pm8150b_hs_in: endpoint {
 					remote-endpoint = <&usb_1_dwc3_hs>;
 				};
 			};
@@ -703,7 +703,7 @@ &usb_1_dwc3 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &usb_1_dwc3_ss {

-- 
2.39.2



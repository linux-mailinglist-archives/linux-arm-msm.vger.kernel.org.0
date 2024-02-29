Return-Path: <linux-arm-msm+bounces-12970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7186C9CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBA891F23201
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DB6135A64;
	Thu, 29 Feb 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvWp2SDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35C7E0E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212041; cv=none; b=JeT/2g3DIjFla9PaXrGE14vNyEPGf9PK8JTatUvFeBrkFvHHZfMtkXburC4dTv+6jXvlEjvzkX0JFNascQMQfsVve480DTw1/LD/QhIXfDV+0W61KTRqOHe04RuARaADJIDdX1o78rKyDLf08ThkOs3p8C72Ne1a/V7vhA8oD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212041; c=relaxed/simple;
	bh=MsxEEfnne02nqOkZki/+nigAQ0nhYoGqJj7vVZuWZn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8h+MVoRKIeyMW+IdN5PyvcI6jRJM/ci5+BvqVdE48XKU0Vr3tUz1vqbGUBQFnshUc3aOAMcqrqPiNhvJKPAwf5vf7iiAqZiXhIWtszTq5qIXw5/1oenqWDkCzae69FqYCqDk1at0oG3xV+8grvMC6FF5XgoAGB7UsqZKAO+cPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvWp2SDG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412bc3350d0so4770045e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212037; x=1709816837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fywjC4h+f6+K3smJr1nJvUkccespMrFvMNirPgXOt7Q=;
        b=CvWp2SDG/zVNOZL8/UpiUGPJ3hKRQdG4lI8hKskWZj2JeGJQ9M/RgsdZyGJhvSfh/v
         kpeD5rZ2gPqQgSSZmdPeSVkHnYosQ6lTKwUsxi81PueCm6c0QsN8OHZnTpzAcM2K2jwq
         eWTH5DTvF72AGU7H9n7PgVXVZ3izbYF7zbGlLF3cpd6PQpo9dX7zagm6BBhqW4AQ1r6r
         oj8om+tUVrSI8OujgJ6NLyd9uqMi4ByePckuZYBew5LOrXTCgG9r4YWLKQghGb2M+dQw
         0IeEY1Dl3QAMB2DI0isVz9Ku9zVKVFAf4OOsNY99GNp+xeTalApgg68O7nylk0SEaNPO
         qPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212037; x=1709816837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fywjC4h+f6+K3smJr1nJvUkccespMrFvMNirPgXOt7Q=;
        b=kJF41MjPyLdGJVl8uNpvyvYH9E58SbJysGUFuJivj6kYM3xM2UMbpZHjzsRYGXlmZM
         TUatpz3ZqLGV5tORfInp8BRzbeV5pp8la0zrgTbeLnG2R6rRGswyXW8OHQ1/vnZTkUKr
         uyY9oQ2+sLL8ZLh+rcQAsUDWyV0y8PAIWxLXNJkAfDbjWXppica64xuO66e47US002kD
         7AzNY9DVCQXOpE6PKE10JGuDTdu6Z8klI1HYXq6Z/+6guztRAc5L1DSANga2rvekWpwV
         oAYZo7CGdOVd0+hpZh3+3YmpMqGXDMlI3AMhCtfM+zr+lO8RaZIfKO6TUgbgWG30/Jis
         HxDw==
X-Gm-Message-State: AOJu0YzTll8sVSxV+i28YWo//o3FtLS1qXq/FAH7SHJokJ1xK1m7cNrJ
	TVBvRQLHLeCsGV0P9nRJ8ndNnWUgfaD0D5Vzd9WvT+K23iHGnlCZMEa+WdXTME9NOzhZsTSEdV5
	ch0k=
X-Google-Smtp-Source: AGHT+IF5SHeIBv4y7JFQoUnfwEl/nga/kneK6KmwsmHQJMRK9styGPFjelcmVyl29oT75A+1YByctw==
X-Received: by 2002:a05:600c:4fc6:b0:412:c1e0:e95c with SMTP id o6-20020a05600c4fc600b00412c1e0e95cmr550358wmq.12.1709212037288;
        Thu, 29 Feb 2024 05:07:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00412a38e732csm2071473wmq.35.2024.02.29.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:07:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Feb 2024 14:07:07 +0100
Subject: [PATCH RFT 7/7] arm64: dts: qcom-mode-switch: allow 4 lanes for
 DisplayPort and enable QMP PHY mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-7-07e24a231840@linaro.org>
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MsxEEfnne02nqOkZki/+nigAQ0nhYoGqJj7vVZuWZn0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl4IF9MdD4p3qfj/k9iDx4mHLqSVCaj4RDbCJRWBM7
 p5FfNVGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZeCBfQAKCRB33NvayMhJ0QkJD/
 sElXkF1lTcwKxlvSHshNzoZANrB1IsApIQKCsylEXa3rV848swZ0XipoTQ+DlYBLwtQZlFbQuMLW+V
 lQBLxxZ1hRmjE8c8vBzqVPtWwsBDdkzli/VeDPA4/iV4qsZ8L0ZGXyv7QE/Rj4sCAORdCo0m63M+io
 rJ8MXfFUVeWcHhYizPLjjJ/4x6M4Hl3oe2hbCRjUS4h1rbz+rIA/4/sQ0fzzw4R0Fut3rIczCKetkL
 nWSwyzsAw9PLfa2Gr58/Y84zGs4/MoLq7hGxndGx6VK9VO56tHz68/O7QANPe91Bmm3dZ+9fN8T8P3
 YSFhK/ZaxXpvzPP8tNcvCzuhu6JiN/bal6NlNWqen6edtPsRFKgQP2Y56dsoExRw3vTi8OQWFjO81b
 jb6aSVR1rI/PTIDKVRPvG6oy12Ili+6haJwq/ZhKUQYd2JL4d5GFGxE5NcLXs7NEnpZq1coyblzbM1
 NbD8qCEzRPIyK/2mAa0UEiDmhURs56Yx9vNe9DWRL/Jxeyt6Hx5c5trKuzHNBmFJZxy5hZsiTCB6+m
 7kCy2PPviHgmk+mhTgTZrZPuvTrtonz96w0o3ZKL4vaMgIi8mfz2YSK4Oj6tsbZ5eO7URXeiPj0hte
 XDz+8cgf6uMz9YxJ2A9fxXwG41jlapzlRtdeabuWBo4mIWY2P0yk2b5GIXbA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the Controllers
and allow mode-switch events to the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index a0fdef55a40a..6c73e0fc001f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -556,7 +556,7 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -565,7 +565,7 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
@@ -1112,6 +1112,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -1149,6 +1150,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.34.1



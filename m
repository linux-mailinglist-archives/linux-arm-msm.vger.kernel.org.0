Return-Path: <linux-arm-msm+bounces-41420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54F9EC674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8849C1666C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12841E1C2B;
	Wed, 11 Dec 2024 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzdTxi+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F491D9593
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904208; cv=none; b=bE5hAsGf5FbXYl1ND2LgD7AkG5PiME9/Pr6/70xAwhwpxH5V6Je6eTwoU/sL1eQTtaeFQeAFIk5YSwWimsRZb6KhD3fdgSHwMMFMds39/dq0KPE8DGC4DIbpcTREKQiI2kkEFvx0FtpI1MAfaUN6XsPrwUhQXc7woEuPNyelKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904208; c=relaxed/simple;
	bh=s//vtdkbw2Gb2QkhA0NkGSHzJ9RvMOOZFJDWLiU/OYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jA785U+cq6JL490jNeif4/rCz2BndudW7iDWzmdO1Wu2nvpMsiLwP5o8owYRh4s9ExeOlP6cB4wGxcNlvKHQtDrSLhxrouxI/L0YkZdGRsgLF0cOyAvVLmgntcGxhgmZu6hS3tIcFNlZQ0PaGdGWwQX2aeoSw20YiZIiAKbMgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzdTxi+W; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283dedso11964345e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904205; x=1734509005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g0PdC8VcNsQn6CXAGeXre0Evydn2mlkdKiWM2V9YXc=;
        b=WzdTxi+WRuoheipe7etQTQaZL3mc6HmWcmw1d7yUTeHGm1CiLyhkVTqZSquVOPlBMY
         +YXb53Y2rx0JMYD9JRJyJ91FM2OdV9VQEHya4+oN+jf1GiYnbE0sj1XkF94d15+++U8a
         1VygGQdfeH7FqTkxNi0LSfvZnL8AozetVNyeursDTbZBy2YlnhvI4lF1n6JGiHjN2HJC
         JLYBFYN/41xGP6PvaPn09t+e+OSVNX45Wy8ZV8iYmZHX7Y8qFumnbAxZiK9mAhZPxD0Y
         HNea8jY3ydU93H1RpyCCqOIJLb7vfW7YjSyWYh6ndh802FZLuTBGF5bVGL2E989EzymV
         HKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904205; x=1734509005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g0PdC8VcNsQn6CXAGeXre0Evydn2mlkdKiWM2V9YXc=;
        b=qCJPAMXYCFlIYbhe/rMteGMo7I2wmTigq5uPbuObWNbcLKtrdfIqk0OmGard6hCWIg
         TkBSbYUGkPfIDEWchB1eCL8nlkd1+13F6DsfHklEHReQ8FQjsXB9OHWGA56uhF2hVyBM
         4c/hZz7DubPjOKlK/6MkMo9Gk/MlomLVpCY/sYuJ7ttFsnaZHqeWm91PzcgIxK28cnEa
         OvDIt+Ina+XhvRVUYEvxJlo8GbQNNdHIU5sFJUmzqhkn+Y0nplAdsrV3x9waekXwQhiS
         mVxO8KwyM9yHPAnLoIt6eH95Sv+Cb+op2ApXu20DJArcPOTwTBFpz6TYiFJ2lTEUrci4
         DSzw==
X-Gm-Message-State: AOJu0YzKmXndccCFJFUeQH70vm62xAZe7QrK/rs2+jVUN2HgSduq4BK7
	8XrZ5jdYiDc/FgBcfqFzFAMYpYCq7Kz4tDNtlyfue0nRUT4gkv55f49vF7k31JG/rkXwuWydZ+K
	t24Y=
X-Gm-Gg: ASbGncv0imHw45i6Q9tEnPnt74XJTeJ2x4AbfFYZvjsg334i43iNrm4o284gcXYg8Tp
	HcCLbfZgCOUUfREZJEz0/s45nK4/KWw07urLOV/cdvRzWk8qmkrhYiGrG9HiQ31quhG+wjcdGDx
	uW2I3GDVImBJ+dxOzGv0ZdQjko2X06qQUf/xkjFU26vOkFAyjwv/AH2rIKm5gXdGrg86C/B0bgp
	s/XsVQto/xyZHTRh8H89/DM6p+CTrn//vexLwpw7ROfkXi24MCV5rT3Ds9SEvh5DxfEws4nJQc=
X-Google-Smtp-Source: AGHT+IGqZHJqkSh0FBvkbmATZafayigQcmc4obhma6Ve8kcg3jK/PDDTqBtIorfl/pmnHJ7//yURGQ==
X-Received: by 2002:a05:600c:4450:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-4361c3af409mr13219995e9.14.1733904205243;
        Wed, 11 Dec 2024 00:03:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b09fec0sm24205795e9.4.2024.12.11.00.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:03:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:03:14 +0100
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix
 typos in da7280 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-misc-dt-fixes-v3-6-010ac10529b1@linaro.org>
References: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
In-Reply-To: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=s//vtdkbw2Gb2QkhA0NkGSHzJ9RvMOOZFJDWLiU/OYo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWUdFAW8+HLSlXsiWX0LrFDaiXNMvn+lslLKCG/r1
 dDOGI3SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lHRQAKCRB33NvayMhJ0XlPEA
 CTlkoC3cZh77xqLgAPHrORajeT1oDv+XxiZlwcM94PT3RjR+je/eg2hjyTueu+w0ihUMYiLEgozR3n
 l3GW+pMckKHoQV9UNLTudFLUTJhyHnoN7iszMqBzqR2byCkJbFwAVxs/KzogfRAi/IvQLm68A4EsED
 GxKRg69o6XBz3SbW8/uPujNlEgM18l9roC0hN80o86NruwGnVaHLiD/yB/Tw8NA4zRZGTDVKlJRRIY
 NZj6wnaZWELKHtKjSishbVFbgU+dDmcgky9WB+ZpSpYeJK9aiaiD/ATOn4LZkJNLqplaf+qhAgjOU2
 5x8mxOXV6zDWIzCVH/3suRmDvjAJ+8gAdJ4XBxMiLbcC8afcOK0Un5XktFj0B9TT31agLWbHtsv64A
 c8OHyB2ID245ij5GTWAd40Z9HgKeqdyznwe0WmTYtKTyye+K8W2xkryN4KKZxwuwQSvfsFS1boP1cp
 TonxVlQ1P9Lavt8nGfc+RFt95DcJUzSanLG8raBUbFzaiTl4Np7OaNOj8mLYTN37P/4oYk9Yzvh9W0
 AKWek2+eufkwRsGKOE0xXLT+cQhDO420sAn5v6xdsL1C6R66/tVWcbkfylr34XJMnPHCo0k/1qAe/s
 Qpds9ammz4gGMEp0dvLg6GZIyUbf6Mt9kYJmIalEsvEoo7kapeHllWWXHH3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The dlg,const-op-mode & dlg,periodic-op-mode were mis-names with twice
the "dlg," prefix, drop one to match the bindings.

This fixes:
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,const-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
m8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,periodic-op-mode' is a required property
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#
sm8150-microsoft-surface-duo.dtb: da7280@4a: 'dlg,dlg,const-op-mode', 'dlg,dlg,periodic-op-mode' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/dlg,da7280.yaml#

With the dlg,da7280.yaml converted from dlg,da7280.txt at [1].

[1] https://lore.kernel.org/all/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org/

Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index b039773c44653ae8cd5c2b9fdeccbd304ad2c9e5..a1323a8b8e6bfb556a2d6d865f8b560bd6c4d429 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -376,8 +376,8 @@ da7280@4a {
 		pinctrl-0 = <&da7280_intr_default>;
 
 		dlg,actuator-type = "LRA";
-		dlg,dlg,const-op-mode = <1>;
-		dlg,dlg,periodic-op-mode = <1>;
+		dlg,const-op-mode = <1>;
+		dlg,periodic-op-mode = <1>;
 		dlg,nom-microvolt = <2000000>;
 		dlg,abs-max-microvolt = <2000000>;
 		dlg,imax-microamp = <129000>;

-- 
2.34.1



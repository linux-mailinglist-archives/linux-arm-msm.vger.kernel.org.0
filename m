Return-Path: <linux-arm-msm+bounces-43622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F79FE5EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8964B3A229A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56941A8418;
	Mon, 30 Dec 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJeV4K7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B11A706F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562694; cv=none; b=VfYL9MkwORMLSsP+QDGKbDYyd2XZfofY5nWeRghNDjLVylFq6QoYhPJAhVUJIWEAIKss8D3ImGxUhpOcdUxSjO5EcCVkqAuHdi2m0HoMjYUW8XSV8U/p84iV3jgt5AHvxG6KO6FlSEU4LzN6mKsGaCJVfgIFzcYu9yc90BS7kR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562694; c=relaxed/simple;
	bh=jGLTAugEoSXwKu8aklCQX92hP9mnmqNNM/X8hnjjVXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dze4vb10lbfhFgbBkyAJ9cj/HhsSU5uqvfT250QE4NdJXjKhAq7prm8xy8uVERZyUZr9FnX7Mo2pnR6y1nC9j99pzw4eWwicbCek8JdSqP75xioo7VrZvCclZiLnRK77sY8DNpQBlgopLrTStAJQJzHQJ4LAdqsdiVoPjvAPkZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJeV4K7U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so91578045e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562690; x=1736167490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka9OJ0lCnfA6ALixeFrsKSZhUTbEuLvcviSCATqki7U=;
        b=fJeV4K7U42nWyoVFcR4D5R4KqBMkjmSONsDHKF3AEQEuiOWSIQE8a27MfHg/G2Kdby
         bKInHpY+htW9yeFCg2H7rHwWcTJR5dO9FugN1jX3t/C0Zy32psidU0rj4NsqPVW1xdWS
         5pD6EASk376dVHLte0ziBod2sqF+ujaE/6HJrT2OcRkVomZ2o+u6U8hT8yk++9f+TwP8
         vUYi7OeNDRQ0hREpVKRL0wPz8NFEUkcw1x0wUzfYgCXUbjBz496OYAI8yYmJaxJd714K
         /3W6iUdJCxErSmW3KvWQ1qoVV3kyDuCbvw6xA2iABgzveku3POYILZ14cXYelnOl6pKc
         RaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562690; x=1736167490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ka9OJ0lCnfA6ALixeFrsKSZhUTbEuLvcviSCATqki7U=;
        b=X5zi5XxKIoU+sNBojX98Vg3VibcSk+W/9PF6STObbdUE/trda2FyQp4/S+cP9+yLCz
         1NTgaWkK5eZPwCPHtbx/NNG5Eii5jIflX2/OUTHDNe1bW4IxZeRPIRGeXYfGP2B5wy2R
         M+sicubG36hpX/YsjRj+pIavZKF3zX+famIN/NBwaAIOdj764JdcpnGL+GL592eyom0g
         zexNQkQWXQy3QyarlGeIs/8HbtZ0phvx9osem/rvQu+/WtnilfEn82H7hDvtOmc3CQUS
         B3V2V5zWoN53yekT+L3U5gIkDXyTHO04CrBHIDKYDuH86Unlkey4h/m//vWFCbwtg2pa
         IqVA==
X-Gm-Message-State: AOJu0YyHKTrve1lD6c4nh8/mp4IsQioeyuKVhBABpXaxjip9l4PPotPT
	qvUqWbHUP0ri0ecQ29Wy6HETDleCgxMy4D7vSFrAX/OyDfN3gOYLj1cZqzEh1Zg=
X-Gm-Gg: ASbGnctoqXdxmqXsJabWKgmPY8EhCv/u0EgQfhkDI6UtD5W6DTvZj6BrMFVPubQBGxJ
	neL1c8Tn2fbq38XZTCy6m8K1v7Sbq6kvF5A9aD5ag3Y6xQeul4gI5vdIXnRtkH6pXzDfRSBtOix
	N6Bzepmy/gWSXTB0hr5BOxMfV9R2n/c461G60F2UfkQcDUW4XONDLGn2YyvJEZMy0SLA1BpSJ2p
	gW4dUjs2/vQv+MWLiV8hl6p0kNWxIJuJz0RU7x8MT4aMk+TXIdFAN4+mKZbWkX8zAtALVYloUZ1
	5g==
X-Google-Smtp-Source: AGHT+IGr/+xJktCPbXgtRKy+Xf/V+no2dTuHAEOqxMxUtMqYzqY8UpXk6fSW+Lep12pEorVWu/sOaw==
X-Received: by 2002:a05:600c:4688:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-43668b47ff2mr269542015e9.24.1735562690333;
        Mon, 30 Dec 2024 04:44:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:44 +0100
Subject: [PATCH v4 1/6] arm64: dts: qcom: qcm6490-shift-otter: remove
 invalid orientation-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-1-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jGLTAugEoSXwKu8aklCQX92hP9mnmqNNM/X8hnjjVXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW97NaEmzKsf2SxEr8EkwYMK+GPKXjVrmEPO8iV
 nPfVXV2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvQAKCRB33NvayMhJ0ZCJEA
 Cl/OCLWr+r9MRXrJi2w1BjnbxKjjJWhJ1ETcWsHnHgQNQ12mHsV66qlMyWgVlh4JZaUg+Lpjadyc0T
 QvwcnEXYDdATmvt4GWlhbTS6G99UKJ/1hxHDLczwMEy5kOZ7b1A6ECBsdlz1YwUpaxXu3AtUzZMS/8
 eM+eJ8/h3rOMNHSbYnNhz7r5tJNSGCjzOUgdd+xhiKYPKC97yYSw2x7DGHhDmZZaZ+MlFzF1qIYNoT
 C0bcWThJkc5Kq8LAdTzgyw7J/1o9Y/DR1Fda090yr/NjLaXmZRvg5Ya0Kl52hPTHWhTxeyp8i5ybpt
 6x4nC+JrjexL8i9JH6OeClmCQ8S7CO8hKgM/G4gXziq+/s2yxbO9YqWAlfNvaisaoKdP+ahLADhmpR
 LOtL9lM5ap3uJ5G4ptzoo3mYxMTLWQyIyd0rgCn4tkba2nEOLzFdZVTXj3UlRSNmWJ1xHmY1DjadrA
 Wxhl8psHnQwAKgTfJuckN62Ihmt0uqLCFAAsvD6rACs2wUamzYar3k7ck0Z+2yQ7U2Ji1g+Ixhvmto
 FWHshQ9rgQDvFHluzfBt072JUM9UUoen1Qfo2mwa3m6E5W8qq7N+bQypHQhWFsLUOtVkrpnbQVrjI/
 7odxDMp75HJ+tCEF6QPpYIckc69pRX9BQLCbdc6fj7FPrB8veLkPP/yUaQzA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The orientation-switch property is not documented in the PHY bindings,
remove it.

This fixes:
qcm6490-shift-otter.dts: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 4667e47a74bc5b0f01a53beb49993d238b13c4ea..75930f95769663f6ac3e2dd0c5f7d224085dda40 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -942,8 +942,6 @@ &usb_1_hsphy {
 
 	qcom,squelch-detector-bp = <(-2090)>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 

-- 
2.34.1



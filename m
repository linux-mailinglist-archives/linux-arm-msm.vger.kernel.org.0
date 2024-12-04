Return-Path: <linux-arm-msm+bounces-40212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF049E380F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31261285CAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258071B414E;
	Wed,  4 Dec 2024 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGCkDz1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3951B0F1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309824; cv=none; b=X6B6rvvJsN6PqDWWBYXsL5wW/n1Lrr4na8p/fOQ0fZVIGHt+ysNXSzXchxv6SyNnGzk9WK0GOe9P7xFp9kyxfwqpzWjhfMtY85oPcobzLJBFyVHDoY6n1Fjp3FZDdWqvpvCZMgOddNKraI3pWXJGDvwAL0vJjcqCuOmdY/XSuTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309824; c=relaxed/simple;
	bh=XQw5/dLgHP3wZZRrlANMcPewANzMAEwRZ2FnrRWc/9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2GGG5/7MWzAhQT2pZAeQcBOzDlRSU+42Y7c7cm/IAF9MPy3g3d4xMzTMifcBAm5anyReJfMLM5V8lGHEqMthzuaoBoE7a8vy3z20HASVC3CJuUbNpT+FobNhIsgHdX3droipu3Ceq+UQDWxCUJIOJhGU+pEkaWNOIc0gKatpRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGCkDz1H; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a2033562so54803635e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733309819; x=1733914619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVLQTYUKgrl6Mzfzc2kyUxFlrszPB/hoyj88gscpRSU=;
        b=UGCkDz1HwIZJcCiH1pVwv6TFGlcWaSU7KW9bbS8l6+b8MS7yNdW5haGxbKNyNeMeDP
         bPwHEtpNX6fC1u1n+vFLl1M1ryVMsZpavGst7wxZauFYOcVXYCqx2xPwxPjk4weV1Jbo
         QM94sDBORPmXg891jQZLBLolwKlHiRPjl7HutCFPxDGJjH2tGU6ZmnOTF6Q0DVrfU15V
         LXgEDEaOQB19mkGGHpiReAZnguyBZLBkuHI1aohrX8bS6eRF+FTOwFAQqtJGuqLXpY8W
         XuX0m/GfEQEyAt7xI3C8K/voUQZE5lkI/rtOjEirzqdLgpLK0jzbR9KEEg8UpRowViDC
         l84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309819; x=1733914619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVLQTYUKgrl6Mzfzc2kyUxFlrszPB/hoyj88gscpRSU=;
        b=Dw+1OBkM2DlymV7lkdlGUxO2r3+o4+i8DzzyVhSQ1RufXU0NR/8+p8FMBTaAbdrQDU
         6dnDRDgzfLHau93HXnWMnXdZ8DodUwoVGiao9m9kgo60x9kMyzWqWh+SnaHXlxUoH1R8
         hDp5ewOQqU+Bpo2hNhFCsPkCXWXCkTwpZegXJSjfR/+J3+3kajebpD2vcMI+2GO2N81Y
         y2BM4cXVhQokBy8U7KEj4g8j+M9x2Ih3LG4AOv9q+eC4g1tEkqp8QsSaFCJlKF76HMf5
         RK3xLVSSAB/X0nXsLRCxms6fKfyB0hYld0h6PTT2XiB2eQYVrCoA3KoKPMbKUv5CCU+k
         Z6sA==
X-Gm-Message-State: AOJu0Yx7jk3p+h3Piz8yG2pvi2yd6mYz2a1C8ZMQFzsCUjjx6fKUbgoV
	gyN87NBeRM08+NflVLg9K8Ax70lMzCTrr/ynAw/aUyWyiKSUwpytSW/jJPPJ9Ig=
X-Gm-Gg: ASbGncuWzEBkVpAo6vyFJ2a59en/5tat4kBSSfFhiBeWyC4mx30e12urgBWa+E2b3tP
	JSfWI7OSLi08bzCZdarB6rh01rtlwNv0FB3awzCOb7bpCkv+FcnfnKFO0metcKHb4Bsa8XRCyXV
	EnZqLTJhIQJRQPd7FQMFzIff2u29/EQggWFVfGrbtRsoK/12lLoNh2Qx3OMPUdXqgDp0O0Xr/E9
	MFU6MFxoi4MWBdK5omxclbvhYEatv7w87bRxCTBPDDEtU8fHLzuKQ2qObOoErnYQM9+7ic=
X-Google-Smtp-Source: AGHT+IH2VBLl7suLujcTImBcRbwzctJqIbDDlGVXcjBAFkeer/UYeoX+207KER2j/rKNT4KMqjvZDQ==
X-Received: by 2002:a5d:5f8b:0:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-385fd53ed92mr5410841f8f.46.1733309819225;
        Wed, 04 Dec 2024 02:56:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd687c3sm18459063f8f.77.2024.12.04.02.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:56:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:56:54 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 fix ov7251 lane properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-dt-fixes-v1-2-6d320b6454e6@linaro.org>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XQw5/dLgHP3wZZRrlANMcPewANzMAEwRZ2FnrRWc/9g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDV35JNaPnZnQJCGePoxKWzWV5+CAbqF3def5VT7
 DZraBZOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1A1dwAKCRB33NvayMhJ0V11EA
 Ch0naY1JsGSp3rMkV604t2VevF0cVIskJ/W2faLjv3jD8Z7hfsPhbr9W9Q8yN8w7WL8oDh+WFLa3w5
 IEIIXKQDOiJyeh7eqZR7PjVe6Ah3UepXo8ppPJRB8f/Gv8t2fWOjT8B+Bbn3QX8fRDNcuX1y9aiaW0
 RU5ts4yVLm9Z7txLuiEqoPzIrL+cVaHRvn/3n0/y8oytpB0FmUM2QvOhnB3mypkPiHB3XwPRUE5SKQ
 5AJwDn4tQSObdpCzNciaj5yV8cS36TYdMJr4uPqJcjfNSCeZgWu8uGG5URNzv8gh9qI6YQYDvwddif
 hixEE5DtwQ8j9c93v49vS6tL1CkSEwzhAHpMYKZNiVrHmqDUHgtdZ8Ylh8mamMI1qJ61w4jnaNz5Iu
 rELUCV9QJ+SxK7GmkAZEcJ6nXdqntIyYgzQmfKZ7xCo0BtX5xc7+UdHpNPxuXdasMg4tuzIaP7ZKVS
 3AG9VeI/chWNe4/72oiBB0pG2nsFMdE833ZWFeQ0D3K37Vov0fWbqtcQ8eQNUg7BA3g+XDehwxcHvj
 V+FqDFYu28MY8EBPhSA7pumkY5o//bhb64AIbOxAq1al1wbXBXVf6UD6ADnx/x3wJLH7E3zgs5rbcS
 L3VanmpnOmEVYPZsWJD32DCtW16ub9hoL/IEDWRYEv9Namrp2F+8L2uymPdg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Bindings documents data-lanes as a single entry with a separate
clock-lanes property, but DT uses 2 entries in data-lanes.

This would suggest clock-lanes is missing, fix the DT using the
bindings example.

This fixes:
sdm845-db845c-navigation-mezzanine.dtso: camera@60: port:endpoint:data-lanes: [0, 1] is too long
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 0a87df806cafc8e726aacc07a772ca478d0ee3df..5a16f4c2b346b314af3d614266e1ca034057e643 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -115,7 +115,8 @@ camera@60 {
 
 		port {
 			ov7251_ep: endpoint {
-				data-lanes = <0 1>;
+				clock-lanes = <1>;
+				data-lanes = <0>;
 /*				remote-endpoint = <&csiphy3_ep>; */
 			};
 		};

-- 
2.34.1



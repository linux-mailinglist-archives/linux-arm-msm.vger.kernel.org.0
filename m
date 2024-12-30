Return-Path: <linux-arm-msm+bounces-43625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8B9FE5F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094F33A21B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63A91A83EB;
	Mon, 30 Dec 2024 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9pTC4oL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93951A8401
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562697; cv=none; b=RtDrqkQh6IjD9LSnejozDsMxr8swokCUqa8R9cSFBu47C2OLhnhX1V/vEMqJVUHrLL8zEeirt2g+wEU+QYUuw534pgG0FQbtTvbYlYv0E4l7UvKbT7WsU6g8QZeXTicmaA8nt5vy4MYu5p2wxiXlyc/xLrJ4wiu1S+VBqRycqVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562697; c=relaxed/simple;
	bh=xNgp6TiJ0FeSJlamI0es9pE1KyaNL83wlO/q3q23SEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdcHsndVUc7sPaiIsMIddJPohevB0tw36vJnMjvO4xvrB+MS+q8EaXrMVANWIDZ0k+vuxVnKAQUKbFQxTsHIeECHKYwR21HVdogMnbNV1V0EBCU+NoDiYUUx0T0oAFBESApyga2dkacSXrYtRvYJV5m5RGpXLqf6FhRhxpubyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9pTC4oL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361815b96cso59520935e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562692; x=1736167492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6XcwNZjAF5yMT6VAjG9hAZ73d3JBM4pTGdtgQ0bw5Y=;
        b=i9pTC4oLCV36WaA7jxhiiPiX+SIThBeqa0EApV/1feIyAFaNHUauXDyMupgBgcHGXz
         CIUULlSWwq65HtIzJmjjGLwARRX+bcEYfWJTbQG7gRVRWTEMb5oAkrAIFgabSl4U3qAA
         w7XNlQcd7li7BdC7kZmlmZnxX9oFLK50DssIl52+1qJ5gDzxVNwDtgryJJ9LSYGNuTTT
         kQHG6OEMt+NMIYdJNUxP+f6DTOgb/6PP5R1ecqjbmyTfLzWVLsDvpP9dmHzo35wBOb+u
         pvPPlZ+l466J64LAKYZK9uM1cNw++gXopB2abFiwYZWK0+nYXVO0deonprR6kOeuPBBI
         V+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562692; x=1736167492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6XcwNZjAF5yMT6VAjG9hAZ73d3JBM4pTGdtgQ0bw5Y=;
        b=mMzTUcFz45q6meT/AZX6K7lwdRoaVg20C4iac/dIlUu8NgYzuO4S0ivs6RKS/NLxbC
         WHTl6Wc/5N3bf35KWMWtVsGeCdCfgdz1yhHlrUAOa98n7q6ZaOO6qvlYeZsc66bP9VVQ
         4/4GzZzJyXg2IV6GiUH/bWO9m85jx/MzlJVUm9u94vjbHg337PKJLrM/qJRejhsbgAkJ
         0jriT7A3NSAapfNcCD0272L8mhOLWBDks/RE0+jVzR7/bsspxSqQGQ84/UTNAd/zlXG+
         pYe0zMyIPanD0aTR3PRYWOKxXChN9bXhL/gPDgL0pJ0dx/OQ6tnH6kyFlqa+FX9BaSGU
         GmxQ==
X-Gm-Message-State: AOJu0YziBjuwG5gzG/kZw05vwzUzuSpOTxLFyPxMdpF22mZCHiCSShVH
	Z2qtkvg1YR/f5ZCeVClOyCFT4e+5F2x3Ien9P2UcfTUfwp0DuZIEwezQSynQo0k=
X-Gm-Gg: ASbGncst4ouFcpwe1yECeaot1IS7r3YClvUMVlMLec4s3Ehsw/Ke3lVzT4+60YyP4jS
	Mf0ymIJ7AezIbULegpCYFFWxrgIeBEo+d18PUFuPQE3sh6HzJ8QShveC3bsLR0TjWZ617nqfYcO
	1vDh5wsqV6+Id407kcD+vwguj9lnS1X4lB5QqzN6aXp+MPyjriWnTfuv0peqBDpYko37NPxM/aG
	YiJ0J50R8EjMYXhflDpYBJoLnKH6IY1c4vgKK+211s4/jVQnuh/FSkexNtd3q0HTZioyEyAkNUi
	QQ==
X-Google-Smtp-Source: AGHT+IF0qXXL9RTFrz0rDOJHIQ+iXeOIa6KWm+sY8xwwyZQIOg9WUAmEvqJF/J6HBeWc4OKLr7VcIA==
X-Received: by 2002:a05:600c:3ba1:b0:434:a315:19c with SMTP id 5b1f17b1804b1-436685488bfmr315295065e9.3.1735562692091;
        Mon, 30 Dec 2024 04:44:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:46 +0100
Subject: [PATCH v4 3/6] arm64: dts: qcom: sc7180-trogdor-quackingstick: add
 missing avee-supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-3-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xNgp6TiJ0FeSJlamI0es9pE1KyaNL83wlO/q3q23SEk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW+gl7WbByE2suSuV/BZqC76D7ijzucdylZHlIG
 XqpC5t2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvgAKCRB33NvayMhJ0SvsD/
 90sF6Oy3fVxQCRwvi2JLwGQniV0XbaQMUmEij727jD+g+BBZoxwWBPyGpLIZHhvvsLJ26wVVOBVCi7
 w8ywNNWP4Zgk2OKewppAZPRAgL0rNPzZE1WjG6Hs6oG+Cnbniy4mxxdWckZB+cBS3f/c3hmq2U8SPM
 D2H5lTNdbW0qSiPFkh5vWfzT47RORdoUcGOGhp5FF08tbMe8ZZ4JRbGSAOx4ncnfZdZK2QwOUDVEwD
 lFl8bpvsmbS1wky97Uh1PV5YtXyR0CcGxOcw2gFTME0VltMMXPOssdTNXZOhLK6aw6dx9xonWghkWi
 xoO/qIMWmg22hVIv8c/q7hp024oAV8vWAW4RfsnheQSm8N6luWL4ZHCqpJ4CUSeOt0AGpxXmLeBBum
 1X9DSwJO6paXkG2hGk6forywtUFLokvE281MXtbYu3uTdUEJs8DW4sYrtZ+qoJrupeq9xfA5Fqc/Xc
 nP7YdZ0sZOvgwQLH5qSwK99OlAEc1xwJGtuPSa+Dbu+3+9KP6flhRNMQTy2j5mWMlyxvppuZ7bUs+1
 7y4q9wqKFPVwpYEiTF595kGzJK6MsGQNH66VjMmoJ8IJDUMUd2z/91yDGOV4POXYtV+lU10tOarpT9
 x1MWlbE2qXV3iNvrbBXAKhHz1p2bOc+/HLvXdASHhYgDZbFhyccw6wP3Xx3g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the avee-supply, use the same regulator as
the avdd (positive voltage) which would also provide the negative
voltage by definition.

The fixes:
sc7180-trogdor-quackingstick-r0.dts: panel@0: 'avee-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index 00229b1515e60505f15fd58c6e7f16dcbf9c661b..ff8996b4de4e1e66a0f2aac0180233640602caf3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -78,6 +78,7 @@ panel: panel@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_rst>;
 		avdd-supply = <&ppvar_lcd>;
+		avee-supply = <&ppvar_lcd>;
 		pp1800-supply = <&v1p8_disp>;
 		pp3300-supply = <&pp3300_dx_edp>;
 		backlight = <&backlight>;

-- 
2.34.1



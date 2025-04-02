Return-Path: <linux-arm-msm+bounces-53052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F99A79151
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 432873AC30E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CBB23C8C1;
	Wed,  2 Apr 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EihaTqL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97D23BF88
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604603; cv=none; b=OZTnnwLhPmXj89a2F4QB+bQ+R8tkn7YATtepfN1wIqUMQN3JSaS7tCSX4A5ToSX7blXlUZx+iJPcyszB0c4Gp7SE0Edvx/RpH5ea7Xz7uu5SQwbIBdlGBdVCdbezzxPxqcANYz0uFnWorTa2q1FM152nCXFxqXKEjwvZ/BZN3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604603; c=relaxed/simple;
	bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO6XhcMUyJx2Q+Yj8ehkeMkbptgQmqxalfSdtoRptU+QExQONxXQOauXBWPZ9UwI2J9d/+v+EMTgXr40I3vvN/ZPMbfaxTTv4dYEaF7tib5GYEyABDJHYtTXRuAEpiTJJVJ0zPFifZviwDhyIhGfUrMwtOy0OxtI9hEIptTAXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EihaTqL4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1767493f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743604600; x=1744209400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=EihaTqL4a6U473j/OG+Dr4vfcb3duGGsQ3R+pZ8968I0BXBBV+dxuE5iYpHVgLzUEf
         8kzsNTh6JmZeFaVQGbEHikK0wzYL/KHXNTY1jx+ZqfKhWNM13n2UeLf/4Y/kHD8ZzyKt
         BjEd78lo+vDVilZyi/xC1EnEFofRHvW+f7gi4foDDk/NvjEUBR+BfKeDToJg7uaOjlCx
         K4XH4ObbTlbKw/57M4PkNo9K2jUC1CUmW4RseEgNHXrERfHwAy3UBhBIUDn9QFogbV1b
         FnmkTnahLbtkQySgifBau66tEZOM3XzivavSOD2n2AeM1JLCqFCLtPonpOES9THsuw5D
         MU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604600; x=1744209400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=XFDdk0Vj+JsYsu3AMAK3cXbcJxjh+IbYfcB4YciAHZ0tpp5CWIE6SmiHZzK6rAS27p
         8OGxW/LLaI3YDXbZis5RHfk5Wc0Vqo5DulygS2uTi/ycQNSG892lKHFmtHfl8wV1gEun
         NmNnKavDTtnsjtZh4y+9nXDhmENtRDeRKPCRyn87pNJ+MCtvNDMZGtWX75I7LeLfE6pq
         2ylH6v26l0ai5KAeLmEKKgKnBGTg/02a2eLVJV0+mkLUqxnokLv1VgU487WqFQp+mi7m
         +OeO1Sh7wPNgwRhW0mw3VfffsMjoKH4Qv7GreQaZEIeyER2kha6k9UQRhYMcmXhJX2Lr
         eBwA==
X-Forwarded-Encrypted: i=1; AJvYcCV61Zp/Gko2NU0xP1i/5+fU12+QyLmdohFz70TGF1tpLxOSHWtmOqZGX2Xlyq3iV1yYfkra4qFPJ8LNap4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw089rDWk9SZE6j9rg8ibNh8xASxtk0VqRo5IVx1p1OhP0Hb65k
	DkpxuQAzUBVhwZPoxIdcpdBFoRDbu9nI0YhN2zFXcKW6T1IBbR5RqvLQqCCpG7A=
X-Gm-Gg: ASbGncuSPDgo3AgJF+yulhvpDIRFgKMPz5ziUafJtCWLqD6IBn/edNkPSpo3O0lCHrc
	ygcYdaaVhxZoWZbLZ1PWXNwF79emkTAxWcSgrb7UHNUM6T95Vbu+Mu7+Qj0ml/M58MPmkNW09Dp
	uO14+WaN/jwvIcMFCnmxsSXmXQEM2zuhE8WxTfSmLQ2dvUTrxjE7GRTDvwupirgxkwTCDTOs3yv
	MVR00Ep3T8JmbD06nxLOFlsclXTGTO0JvG1xsRysD1ZRX8QCXKlyvMInwsOS0U55CT6L3a+yOO1
	AIUxzg3NeloYfrkSnRdcnv5bJmt7D3czelUHmAB9QQMv+f1Ljjkji5M7
X-Google-Smtp-Source: AGHT+IFcoBoCC9BmmEOzMP3U/FDnU+7IhugBotKCAX7qSMOx6S3uyBr/tGFAZRODEe1ztN7QMsfesw==
X-Received: by 2002:a5d:5f55:0:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39c297e41bamr2609766f8f.36.1743604599866;
        Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b66d29csm17396769f8f.60.2025.04.02.07.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:34 +0100
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0ZIzB+XdAppA9QOZwn9n08ERbMN6V7fJpA
 8Wz4niUuIOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +J6YEACTC2p9NkWyqoxpsfbz8IAmvp9I25A0PJ8pwu+woG61rttN5y0Dbq5kye4TA+O64PyRgMm
 4Jb7rcXJxkvK8q/+/ZEH2ZgUER8H2sOXLYvmmqKbqNzHnURqGHahQ7okHtiavXEs0HVIB9KTQHx
 beTZ7pS001+OWS0Dtd+1TtLWnQbqK0wr0DID1wKN0Sw6kIIXGTwzEA7TGw5wzOfqxiy6EuimjSc
 enu/AZ7oRhc+0ksmUjEvlnwo+DehQ5r1QIA0d0ZF2x0CK60zx6YH7OrFU+y0u65xpGckL72ljCZ
 GtmMPsdIyKoJWw1B9vnFZm371LQN8SKeAPQr2+DKLyY3eRN++a338cgsvakO3YqOEKxI7PGjv4Z
 EjSW5iDSQ6TiCD+Ljwhl223FUrZ7rGtd0ChlctmkW3GjuEw8cBcv8r012oM9kp5BlzV0X91g+SB
 2JVtduFeu6MOhK7liW2i0m2l188EkvEju8T9gfTLmfy3ux03W2FnmIF8QkMnXnsJrtkfpnRldAe
 zaZM+YCPV8pRcjuq4uWTExmbFKHQkYeuYiL0hxsUI2EWbSd4dG2tum7RSaqIWo7G3f9HFcIVUIw
 nO4nJlY82B8fJhUImzNkkULIrXBI70WtYrzOC41CYzgt/LQCg5LVdp+rM50Ngc3WpOpj8YiGPkP
 nk9FjQewWQBW4rQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
index be65fafafa736a0401a5872c40f69cb20cfbbd90..d524afa12d19b2a6f22a24b9bed6b6b40248375f 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -10,3 +10,11 @@ / {
 	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
 		     "qcom,x1e78100", "qcom,x1e80100";
 };
+
+&panel {
+	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
+};

-- 
2.49.0



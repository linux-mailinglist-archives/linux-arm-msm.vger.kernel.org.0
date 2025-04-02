Return-Path: <linux-arm-msm+bounces-53020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B594AA78BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA5A3AEA1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B636C236422;
	Wed,  2 Apr 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7S1Qi5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D158C236443
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587929; cv=none; b=J1HWX74IXU93414s4bnf15K3RDwX2l/UqszZ9QjNet0WZDTMzD8jaRgpH9nOd8pudcvNiQOOqgzxbh83a0zVZpdwvMi+fULGS/7QCNsOwdd2cgAxhOIfb5PAsn/PwJ8Yw3+D1E5FeZXXve8XIe3sNqbyudA9uTM5zB8+JsOoa6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587929; c=relaxed/simple;
	bh=NM+r1eddNSJ+PhsAt5mpIMaaO5aqtw1lqIQpoUzxeuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kb1wLkyY2SoAtLSelpq7OOY6cj0Lv//0j8Ozn5gx314abvwulUMCaSTwoJmrmhQibiTftasXAx0Ua1TZzJE1vDFA6O8eCMHIkvRl4czIgldMMGOaqc0JzshCWp03k5/KEHBE1L7Ta8PE7LoN73wjfz6Z8LEoQut3bYmeQmR4h5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7S1Qi5H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so45145825e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743587926; x=1744192726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=v7S1Qi5HGFFAs563CZQMWl7yRSgGBUi67wtBQpU/p4pohJHANrTHFbzzkQ9557edUr
         1Qau6T3EXCAVOXFZ8w0bll/VeAQ7ZwOkoFfWmIfZhk0843DBvE1gDknAlNAkgPUcsLGD
         7B7gluzfHx2OhrmUapKQWwWQC8bh6zhgpSwcxtowmpH6cN7QUEw7wW3xghl/M6eAnAJ3
         kF2Ak/PezryxI6ckhLE5IHVoykzvIM8NcHkLXV8HqeUJIflpa5pXY2ZTFPTLkC1AIjDn
         ZcWjXg020rAv3epz0p0EDMvyDGs5Pn33bNkclimlr06+2s0nfQHbhcAXzbIWbGVTepOQ
         c3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587926; x=1744192726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlNr7s9//ER/SikIA2XjkSmK+up9sy8cyHVWwjM89l8=;
        b=UfxfgeWR8gD00/SVfXXTlVjkYkRqTgT05FEg9Dr0r7NghMtwFvulzTbI2mnsjfC7uv
         7FJq29QOayGEdm5MMveSz99PfTMOSIQlS99LNJX44uQvF2SlSSSVeEpmU0SG3mVzXCm0
         iL0y7W7n7QwUiwUixbmpvipCtsW7yxeqIHc3ViQlzo7XNEY8GBz341w6HlDKBWBm9IZa
         RQnWkdrLhDlqtBxq0OG5W6tkAPN+KUF/2HljxgXwIY5mqJm9scQY0SH92q1tliG98TJQ
         l1pGDiPtdaM9juAKdhiiyeR0TME2CslDLevX+XQxy6itSIQk4P5g5SvdvQ5j+n8DFKPU
         YMkA==
X-Forwarded-Encrypted: i=1; AJvYcCVEMD7PRiTa+cjkaSJPlPonVWbJGGv0sm7LRHONNpemDCJdzg2r5F0lW/a+QhMUJFwRuJ2zchm8iMAO4rv0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1eKbqIjlJXR0/iIS0/Md1lMLq03UNDChPpPYORreTKcksjz4
	gj1M4LowhYBUoccghFOO6A7vdBlMLnU7Gkc15kcQWwwDJIv3nEX6F5wzGqIunOs=
X-Gm-Gg: ASbGncv97uMT7+PgCKmWQzyo2bov3As/jHY7L6V+g7B7hG7yeHsQFUPTW+43hROovsV
	/d9QUmX4FrXuC/CmDqs9VhWxnEgwcM/VIftnhcMEtPgLuG9Xkxz0FsFG6VyObeVR+7Yh9lMqV/N
	AFzqBx5O1ILkk2J9U/YzXkTCzjBHaYOF7lNBjrJ5kiPjq2Dx0eh43EirxQ8snJN4t0HhbP7ruWf
	J6bxRt33UUILmtotpJ6LspG4GFQ060cERrXTxSATW0q01DX1Ln9HLtKDBa6mOuN4UREE7yodACh
	1og9WwQ8tY5JG1fpoAvmr1WcBpWWzmWdmYc+ft27RofHMzaBE/BsHTtt
X-Google-Smtp-Source: AGHT+IFTrd+aG1QnoeDWN5Twws3fGm4IGPhSV3zclRttiqm7JC1zigHY/sr1x2gYCsORgZ8e0lDQ8g==
X-Received: by 2002:a05:600c:68a:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43ea9f8dae7mr37628625e9.6.1743587926052;
        Wed, 02 Apr 2025 02:58:46 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ea8d16d35sm34705285e9.0.2025.04.02.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:58:45 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 10:58:33 +0100
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-2-41ba3f3739d0@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
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
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpThFC4dZp45FqIClVwad+jsKVUrk56+VO/Q
 SuTYwy/5FmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KUwAKCRBjTcTwaHBG
 +Ml6D/0b9LsPEQpFxaORUDI4PxBYS0vegaZinECmfYatrMEJZ0CRoesXn4RqP0Rkz8O1l+VdZ99
 vRmgfsW0Gxp1qRzh7oxa6sEk+K5Hk7ufI4Qig7CntNHwZwfkqW3+jos1MTZypwEGK3CmpjOoPNx
 mnnwxfzaOzUxtu8iuKdI7fGFSXYYQnNGlggPuW2NkKHwuM6juYbGvyrr7Bs0L1DPiF5PpDA53sr
 V56jVUWnss6DVU4pJ9v1vsiOpJpg9BVtH/6D07SJ9o8wbM0pYair+IfFdkLLvOidUGySWODI8vm
 7BScqTbK6wWBpoxSF6q1nuZOqYatUDUHF37LBjr6A450gAcTbqJRpk/PQkV2YNkoUiOll49GriQ
 5FwnWfq1AAuRBQS/CoUrVhUfVwlLh1WIB7wELoflpqeMK7ErAtd3b6pcRle5U8m4R1RnFepnUfp
 qnOeFQDGX1M3wNQn1/NN86UR8XZdOhJjf3ZRQQqQ+fBTel/uBb6TMhJluZzU3Zi3D8UuDmYMvIg
 LXpsSwKSCJ5zcMB1oP2zL0MDpRy58QWFgg3nQMSX47RUY6RYvXfU6Qp9uxEQCNOQnVx/CdgZyz6
 dfRrpSdK724AJ6HvUuCW4jPS+ZdI2xc8NqjpIe/i21nws4gS/pO6wemnISaryic2YzSxoIqOxrZ
 XjJZSTNiPXOlmPw==
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



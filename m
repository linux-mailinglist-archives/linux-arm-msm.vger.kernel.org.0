Return-Path: <linux-arm-msm+bounces-53050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38556A79153
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36AA91888B8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB49A23C39A;
	Wed,  2 Apr 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXV9b6f1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C947823BD0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604602; cv=none; b=rvBXGDPwLrh16t63/BxiwwZmwd7Lx0kV3GTtuJRXmOZV1qjTWpQA96+VuZJIrdftbytbm8lORAJFNVBgenpg1C2hOlml542Lti4YhIcfSaKJtNKO1t+NTaBBn0W+hgiZDYAnuI6bjexiFiOcj6U9co6/koAMuDxnrRcuxNz6QVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604602; c=relaxed/simple;
	bh=lYKcS/S64jaBbWA7VwCFB9G+w+RBu3krRD7r8H3WqDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiG0lg82OvWp/enyB5CZ38ky3bkdwDNvabX/Yu+H63L89+GFDZfHj22PHhbTGazeil3iZSc3wbeDi9xQIgtFNLHN1e+As7zNcLNZHgOYdh9s0ym1kBAGyJkqU6x4j21aJHLGlM8RPIAx5axbSn0Peh+Af/pexqpZeGFsFLX2gzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXV9b6f1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so53560205e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743604599; x=1744209399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mh4boQsSW/1gwg5sSN4EStVan8aEzJn/qzxSEcSDKHI=;
        b=VXV9b6f1FZmej/UZ/71ccoNsPbnIdn4YXrBJ6/l0hkD5/L5vXFf2cf2wyg+lxCVv9N
         VfbbD7FH1yu3fJyDcrDGD5UmcuzamwL3C8WcDf5P5c868qeBV1FC57IEYswvQ6fM6kJr
         bP6A6XIrEsaTaFnSrDHfDFuFkY+eWWegKcAQbNTGWYaHjl8nnsHJtsdl3/Js3dZbSSGl
         Hq0uhMvnPmMXNvL22gu7rcrnt5vDqjHKDkC2llEGGGS/MrVj+KI9cIM/VsW1bRpYo8Au
         SQl4XEHv4udqPBF2Rvj52ZJErPwemrCi2bgaA834vb4s8hnZ+RYo43SfAsQdWRN1PdhL
         BOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604599; x=1744209399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh4boQsSW/1gwg5sSN4EStVan8aEzJn/qzxSEcSDKHI=;
        b=KRq2HFUPWe5aXaDi/q8cebArDu0XQ21vLVSIu4MXiL8Q2Wkaxj96352CgIbcz5T3vb
         qryLLkJDYuFE3BKOx0K8t4FstCnR1UtKjJ4WG7Efr85TLuPF0Yb7Wny/ICPxCK36MD9R
         yRUqhFhNOqqJncgaCJhNUUGlRDO4cS9eq4BLVvztpFES3IgJqIAqc6GzvcQCjCPSVZZG
         n1/Fc5vNzOx1LIbLs4oU61j+MyA9lSZ/Oxbr5uwGemo6pmVSFHrVx/sQPbTD7uLnT8y2
         45qhcllw+eoHMAOjd3qZK9dS4+9psQp+Cy+1kBgMZx1sf1KX8AMIfv3agsZsn0fK4FAI
         L7dw==
X-Forwarded-Encrypted: i=1; AJvYcCXNhFuQjU8uTt4ShPtqmydZOlBle+Ck8d7IhmZ3eypT8iV7LWZxzCu7i/Asr6tt6BAicv8BJ0Wn08Y2guit@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8nWqro3V5AJtSjleWNcuhiuaaJQ2uoyGdesoh9q+Nr2bEulE
	2VMRn//0ksncelr7q3y3QDZiww0uCp0522SKPJOGDI5QRQMSNyFahwsIPC1hrO8=
X-Gm-Gg: ASbGnct68IGD5WH9TEP/LTLsf8VQHT5v9+u3rhKNCHZ/rOwwdbsI4ULFqzTVxwVqjuu
	KeBQiW1ATyy8xXm1QxbtiQVfpgwEogM4gERHFrEyiuoduRH/vy6oS2EC7BfNBSPtxzPG+dnXpw7
	Tk6O7tJ9Rt+9Gbh14JJOy+NcTX/DsOeQ1salVagV1KsrbmJmmx8SER9s0m9o40+ANCmnPFfWx46
	exYCPZJN7F7SsgT9aTqGRD3c1ldlYw3KXOJ9pRiUJIbCDZMpRgFyZ2ciyiIT9ea/FgMbL0g0QLe
	BT+T79oWSa5R+PX3tETw0hnWhx2M0xOn0j/qi8IsKIDHqdt9mdItPvre
X-Google-Smtp-Source: AGHT+IFNQUUyB8A1bTf4Ij5qY/HCNx5j9z9iFYAzAYi1EJMrBAvFa5jrSvb56dJD7kXugebXVJZV8g==
X-Received: by 2002:a05:600c:3507:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-43db62b7b59mr118985945e9.22.1743604599115;
        Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb61b6469sm22404065e9.34.2025.04.02.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:33 +0100
Subject: [PATCH v5 2/3] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=lYKcS/S64jaBbWA7VwCFB9G+w+RBu3krRD7r8H3WqDo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0+zTamMU6afHjzWIHKk1AnyJXEH2d7oI3f
 zEreawG54KJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +L8UD/sFmaJoyYlFHncItTgKvQT+7iy/a24yOrWQrSW+Jzsa3s4pz+KcXTd/wyhPL+f1YDcWVln
 VvWRcMV6o1XdUqEOScDVN1iQIspnwC5hZZZriTHQjqSNA8XAHcteCpcBCyT1me4XTIDnk8e9cHa
 +j/qmFo24hpuxawRQVMolmGdO0/Zrtp+tIq2kiY4NiMiHyI4QWRNjKdQXEuN3v7+gb8oc4eR6G6
 j+vWangFowfOnVpgqOu0plaYGGfGcWS9FirjyncFkDdt/GrS14wURsQhoee+MqpHDO7ypas4jaV
 la+8O65p5PcjXoOojtEjs4cXbdXdxVSflTlFOVHOIsbGmUQeiiCTM1dGz5yyfwhYvwugvd1OPDf
 K41MaX9SyBJ7r4ks9WafACMsjhDXVpXkul2qNIo6EiUWq9vJjHVBn786BtTKWDZA3BgbSgR0ngo
 F+WLVw/xeEmykzvaEQEY0urze+apugdNN3qA4ach3mycH+5mRXfS4ZOneTOoCDGOayutHZYbGwi
 A8+BzbvsiWq2C9s0V23lN0WRey5KoTyBwO2If7KkqS6SB613tU8+y6b8DzlUWY9QnqVyKkVR02Y
 eUaORjv0UUw/KXCpclIhKgsmDHKdhzxTluaMJtdnOFByMdj5cYU6MtlDWLFiOtTSay9zQoOQbP3
 ayNgWCIzO0Hwslg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..bbeb2e6f039957e443f0f6d16dc00fc62b012425 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -975,6 +975,9 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {

-- 
2.49.0



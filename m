Return-Path: <linux-arm-msm+bounces-40767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEB9E6B77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519F81885190
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6801FCF62;
	Fri,  6 Dec 2024 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjNMf2QD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C481F6691
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479987; cv=none; b=ZJmKu4ou/GbFACq1cjNyQSOvUlUjdHcQoS9baAZu0zI6g6h+re0aEr5PfbHAL6z3jo4wf0DXXRW/TI2h3HsDU76C/CA8UxyPvP35oZzuooJBUWWz0EKEQt+QfxTOF9UiQABwbSaWUvwflERtDCWqTvjY/p/gQ4r1C0O/dXRmnfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479987; c=relaxed/simple;
	bh=xNgp6TiJ0FeSJlamI0es9pE1KyaNL83wlO/q3q23SEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZT74XYGg+JzlwLpmwbr5fvel3yvXm6yNjxu22/IbbkFo51kwpAbIJ/SkCWKd3DsuCiDrtW4emIBNZ194VitT7aus4PMMZNauv374HwWvT/I6dSvWr4RnRdy+TsG30W8KyKbLidjXx4UU/z5DSHDZiv0apIiDWUYXmG4KDJ5rZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kjNMf2QD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e1c3e1c50so1900828e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479982; x=1734084782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6XcwNZjAF5yMT6VAjG9hAZ73d3JBM4pTGdtgQ0bw5Y=;
        b=kjNMf2QDIcI7vouWAGm8tCsB5UUolQD2Zv8bB9Hv34RicYpEdHdMKHz0haEaAFuZH0
         QcOsF4XqULf0PgoETf6jLP8oXzvq+kXejarCjUrBwmfoogAiv62Li3szJAC4UUKUVh8E
         4lk5RIDidLf9ZyBCBnak/+CA4q3dzx5U3yksFKVnX9GZCdrglkDH7zwtoexR7IsnGzQv
         g0NRNf3CMoXVm9K8X2kIEmUvlYs+YJcV7K49Okez/POig80Isr4u3Wpff3M5igOmyoXp
         Bi+cdWxArc5TZ/YM8BCszbLiiinT/btyS8N86cWBnaaWnSAjr4vQATU0sZ3eoj0EXb0r
         buYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479982; x=1734084782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6XcwNZjAF5yMT6VAjG9hAZ73d3JBM4pTGdtgQ0bw5Y=;
        b=D5I6/C10gM98Fkod0sisX71cy1q+haKBjrKh9gIwq8IhIV3SN87YotyBGY5ZuxgNLe
         el5Uv7Bn2468qKhmP6TuLKeNQTYSAYnKQWD/1Yo9vlgpYuSQpRrYsaIO5xGs8sXmlYXO
         b5zkxcjXEXu0jlgwqDjFio3zdubKc6cWII0k2GTf/BUDSwODGK4A+ocfVrd5YD6zScHL
         JP46pJeBUO4UohfiYWF/cj6yI0pN4Gz8I/Kx+wsUszoyJVbaVoWkscXr2RLodk/sbqeH
         dNsPg+NwXsLWtRpxnZ58BOSgJykr+0xdyU42BNTP8lv+yfG96JETqlxRnbwVjl/R0e/D
         P45Q==
X-Gm-Message-State: AOJu0YypemtRzFn5auVR10voWwA9+35jKdKM41g06v5JfCPsus5fzjFm
	sh6om7I2XV2C0Xgj9cwhL+LBWnMFW6NQ5RJ02XpaSbG1k5hs1lJduttt3hDBc1g=
X-Gm-Gg: ASbGnctCF03CkVxfGKdmiE3pWSmW6ltDjtLSfj1o6ajbbJ3hBPj1tgZgm9gWLXkTKLN
	crOKsj62dJcOVHfvBllOsaF+ufxYNc2SLd0jjBdIKX+nH+xOAWKpFOkhDWe4JcM1oBAmrJ6nhGr
	fl8dkWGnrQeUqWjE4T/8asO9cMpW3A8G4zNexu8Akcz9eVOINLowhJyJGU3tX/5Hnm7RQFSGzpy
	x3dur9JLUyZX9atgvhnm+L0AeG3z9BxsdgGdXlefN0hpELlwWHF2LpF37oK1c+lxl/xF14=
X-Google-Smtp-Source: AGHT+IGxBtS9erQheAIYQraMAQwYIxM9ZVE1VbLT0EC3OTLniDQTPWCvjo8RrTsSP31+xkJUc6X4bQ==
X-Received: by 2002:a05:6512:ea2:b0:53d:df9b:ffbb with SMTP id 2adb3069b0e04-53e2c2b8f52mr1027512e87.19.1733479982331;
        Fri, 06 Dec 2024 02:13:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:13:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:55 +0100
Subject: [PATCH v2 3/6] arm64: dts: qcom: sc7180-trogdor-quackingstick: add
 missing avee-supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-3-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xNgp6TiJ0FeSJlamI0es9pE1KyaNL83wlO/q3q23SEk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4osXWyvTAL4SumfNSG+0/bagpUAhkQSMAajmT5
 jKcsR7qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOKAAKCRB33NvayMhJ0XzOEA
 Cb3UX6gSR9PovI+3rf02fph58pPK+mPUeHwGV/Wk3zUL9V3YbcbOsQrzARz8tx5BTIvhLvdqMN/Rij
 iWLiumObRhlyT42dZmkT2E2vxFLFeXG7sb7np6dbOvX0bfUOpRyD8GIxnji7IAjXW/7KnwDD6RG4bT
 U6KSro4CZ4J2PkpAcwd391b8Jx03XpPBIeRKkcOq0Ga3Rb7uVL7iLSM9kPJMeTPzDBkUuvNodazAvX
 bnblBJy9n3L0VS//pWhcqKsNUUjbuz9UbKrBKoQdXchTLI2jA2CpkOjPal4v4812R4Y5d1ERP5xaAa
 jKuhVRDMiDZaJT5KcgDC++F5v+n8iufENnhQTXHbbrTme2mECfkX4e6YNVoU+cJ0zvmDqYQIfqjYg3
 8SxT6wYRnNFgt/EF4dn1imhfFJs4UkY4DEE8O5VbpXwqOTDD3ikSrSBvE5eOtoj2hAjq0KJ0D+htJb
 BOAODcsZ3XZQA2hqhkM8Xle2WzGMMB1d9c3PWscQ2+R5DcBcFK14h/wlAf+YmFP0Je5Le8CbnEpPNa
 me+iMqSuFcl37h0G5USbzEROzE3K3wJf4subQ/sz46nh7IlnxV1RziZUIrYLrAipN2GQvSOsoccwQF
 AO+7pl8SOGwwOpwAktBFucUbGEW0O9f+T0vNcXXZs5+xWwBD2U3myiq6K5YA==
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



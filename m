Return-Path: <linux-arm-msm+bounces-69290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F1B27017
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCC984E2F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 20:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DA6257459;
	Thu, 14 Aug 2025 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyDb5dr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956391E51EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755202592; cv=none; b=PDOivhJbcBg75j9SPY9sppvwxOoKxh3isgC7G8Dn3btUWM22rlS0NrkS/5D84Gy86KMbGpKCzvrWFWpc3xvFbkDsI4YusiDbo6+dZfStMqW3mQdK681klG7d3nMlZsdJDGdXoKw0q6ETVD7R9d4A/Hhk6kH+CPpLFnncKYk/5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755202592; c=relaxed/simple;
	bh=UR9CJlGOumdJ6XViY9zdrJ+sX5v7q5Zz8QVakTaN6rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tE8M03+wTEStXvHBX3n6/b/BjkCh1BsTx7nrUWH3+D/O4cA33Bxee3JAVtFPY1Mm/n9pKr2Yb7xK7trMLwmm6YvOhcUOF66/yNsOvYb/9HDUuppxJMOyF6GIngImL0MZn90dSYucPYWuMiuho2o11Y2E4CKubtMzepvRYDR3wGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyDb5dr1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so9421535e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755202588; x=1755807388; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StF1WS7dXjSG3S8YqRGzKbn6lYD1sTo1AD3uQFyFIgM=;
        b=HyDb5dr1eXYqv8cfpp00hfrPwctsF9zql1pXt23YQH/pe601fUE8Ii8TqDFntO66f0
         7rHa4KaCkyuGEsGeudTVeEVBBfSit3p3leNKauCYrDcmGwF7YAtpfjVlewJ7N2DzzdFO
         WTTDsCT9wbSS7QPWUs0JXegQiCxoVUbMdtJcPooAqKuuaDYMuvhvQkKuc76+BtDdSVMH
         QREHkB1WAKZtgEBOzbV3drGuPolgH3xPUFcrkdd3t3di+sSoNQOfdIptVG1gmqQPMMF1
         y/8/8u5+GAaU1Q4/Wm+qIA9fWdgAvC/shcLjcRev4rxXIeU4O3Eqpa+NxcFVUFKgPgpa
         oqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202588; x=1755807388;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StF1WS7dXjSG3S8YqRGzKbn6lYD1sTo1AD3uQFyFIgM=;
        b=oDY0+hZIQ6AXaRLwHkdfqL5vKTzbRORaamXStpw8zhtjpeQjpsq3CBlo3Hmz2jtd9A
         KyS77sQuXmNA9RIfXSs5NgfmKJnM5BV/7neJgjkIWN4/FZ9pc2kGk8T4jj9+AfwaDl5v
         EGdi3o1u0UQ7NBfjp6uAX9S2jEg1ba8Ywx7tk/4NwgTE38GbXNQLCoZ1RVxpnKaVnFk2
         t1m0GU/LakwcOv5EsK3aK20OFcAx5psTjmLm3rqT7faB7sZ1oHnqJ4LxRHDTixu5dlWR
         IDSyfX1pc8Dp6/ACMyzFaFquQMTL5LyKmJfG3ExI9Ncchz9RmND5o3Ocq0K1upyG89H3
         4x/A==
X-Forwarded-Encrypted: i=1; AJvYcCUO+g5RgcROESPF4fgMkd2YCH/j2+J6o2G0yXTF6GlcJ4Wk1ltyf1oduTA89biRtCrKvYDAWY/IsE/5YJHB@vger.kernel.org
X-Gm-Message-State: AOJu0YxDV2A6aew1WTnALrwe3HAYGNQ8OgusyVbntKoUlJAz9Xugffkb
	nbvdu3OQQjnGad1Di3bXERonTiVrekxCfiGY5BnZUb6iZzCJcYqIspWmvPIXLTWlz8s=
X-Gm-Gg: ASbGncuhi0xWsAbHq55D1bBdgKdx9Hpzjpa761f0Q38IxylaC3rpsrZea3gRXZKUrcb
	QiNufXWaXbOLb9plVyOs9IITj4RnVDN2sV3/YGOcIOO7v7eDWhCsllBN8NRDz6SU8+IecCMA5Nc
	G1ugemHwXa5X72z+ZkGPjBHU0vL1yz2YY+La9FRQa9wmmCLKYu9r1VaHxbqxtal/djgfvFIY26K
	ZF0snw6yF/1CrvltLSCE83cVWO6U+V3t30MWQgcy8tbSfjSEgGrb33mv3kytsC9oggnAvvq7KNF
	77XfCqqpgzTP72MtJPTB4J3M0zLbTD8wBrRJJckvPkLqal+EPb8yUGsTpJKtIvd+CWmr6STzSEw
	Y7RRI9ulH73/wQjG33jg2grEuFzCsEP9CVz0Cm0Xt9QQVHwALJQCl/1+5QHlIaM7/
X-Google-Smtp-Source: AGHT+IG35AXneNLp2XhORujrrZpLj8xQqQ2QwFH2vSV8MBkrs2SaDDuC4gX/ZVreUWWAHMpD2a2gXQ==
X-Received: by 2002:a05:600c:35ce:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-45a20f3de1bmr867585e9.4.1755202587833;
        Thu, 14 Aug 2025 13:16:27 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4533e6sm53091106f8f.35.2025.08.14.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 13:16:27 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 14 Aug 2025 21:16:19 +0100
Subject: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
X-B4-Tracking: v=1; b=H4sIABJEnmgC/5XSzW7bMAwH8FcJfB4H6suyg2HYexQ7SCKVCEhsV
 /bcDkXffXR6SLbskB5JQD+S0P+tmbkWnpv97q2pvJa5jIMU/suuSccwHBgKSd1o1A6NRngpE4w
 xhkoJntN4hkXZGcYTE0xh4BNEbzOTVtQiNsJMlXN5vYx4+in1sczLWH9fJq5q634CXxUoQBeTj
 ZSo0+HHqQyhjl/Hemg2fdW3ontA1IDAfUw+9WQwpTvR3Ir+AdGIaB25rL31pu/uRHsVLeoHRLu
 JKgaTjYCEd6L7rOhEzNmYbAlRY74T26vojXpAbLcdfafRW4WW1F/i+0cQKj//kogtH2lozjzP4
 RKx/e7bZVSnLLwq7lAhQiACpgmOE20fLw2nO6GjM7m94b9vMfu/tYxTSVfxurSwsZbDcRnkHax
 eYhUN+Wgpc5fcv3oMM4OcfS7LfmdMkHiHqPpolLMoTyK2RIyanVO6DwoDJytnv/8Bw20bEGEDA
 AA=
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=UR9CJlGOumdJ6XViY9zdrJ+sX5v7q5Zz8QVakTaN6rI=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBonkQXkHvdTdtW1hWVTgwYf8EIVO/OKf9tODqNi
 bvdOga9eEeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaJ5EFwAKCRBjTcTwaHBG
 +PuQD/9sK95C2XdA/EEsCiT3Ps7+7zUhKnAbN1s8hpqYwoj/1Cr9X52aG3q1UvDUO+gcRuUQ8co
 4iBolnzoLiGK7ElyNQicV33hsgi1W3Stpfz9+9I7OYmXgan2w+yj2eNSdym2dIaNXzpm5gOC/nb
 bnZLJd5m6Upf+iquJJiwX8iscq20Q+G/l2I6gU5dhjA+KIFQphSTlsr00h0WsahMsbbBSg1gKIr
 c2OQT0195OHJGBfH9EGqXvg3KWbu+3lVa102nt0zb2sCFW6x3OcpiPcB/l+H1iAaDRLAHgaS4ey
 iPPMDiS6ftgD+c7Dsr2C2aNtkROtoHLv0pImAEdcF31p8YmL5shn8ab/0aAimwkgb5aqqMrdSoo
 5ixxDmO9OtQSH0RO+IdD+S+SIO8lXx0EkSrv9p9fBuVxDHB0nY2gqIDxjoCVJ7pKRtcRsFZAreS
 h/JgGb6p3roLUCd70vCvX/A3VKGEf+1O8svSWQufHjEmB9aS1gwphmiZHm8PtlBQH1SAeoESNcB
 YgqMdoAIgKdlHr9flvF1L9z5Pjut9DozRfumxCEbLvUh+2mdbeoL83ntJ0oFKAjpp8XoUrsx+o5
 9/NVT00hKFAdm0pNzryap2rhXZeGwf78s0LNcEfFAC5jMXyFdZoivdRtDk/XXVJblv0CHXgektq
 UsewMI9Rv06Fd+Q==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the Samsung ATNA40YK20 eDP panel to the device tree for the
Snapdragon T14s OLED model.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
panels. This patch series adds support for the OLED model which has a
Samsung ATNA40YK20 panel.

This series depends on [0] which adds the edp_hpd_active pinctrl node.

With this patch series the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as (to be clear this is not a regression). This is fixed in [1].

[0]: https://lore.kernel.org/linux-arm-msm/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/
[1]: https://lore.kernel.org/all/20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org/
---
Changes in v7:
- Remove patch adding edp_hpd_active since now handled in Stephan's series [0].
- Properly add OLED brighness patch as dependency [1].
- Link to v6: https://lore.kernel.org/r/20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org

Changes in v6:
- Squash patches adding "edp_hpd_active" node & its user (Johan).
- Sort new pinctrl node correctly by name (Johan).
- Use correct function "edp0_hot" instead of "edp_hot" (Johan).
- Drop review tags.
- Link to v5: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org

Changes in v5:
- Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
- Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org

Changes in v4:
- Rework HPD GPIO into eDP device rather than panel (Johan).
- Drop review tags for HPD GPIO patch.
- Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org

Changes in v3:
- Added review trailers from v2.
- Dropped dt-binding documentation patch (applied by Douglas Anderson into
  drm-misc-next).
- Dropped eDP maximum brightness patch (will be sent in separate
  series).
- Removed duplicate nodes in T14s OLED device tree.
- Reworked WIP comments from commit messages.
- Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org

Changes in v2:
- Use the existing atna33xc20 driver rather than panel-edp.
- Add eDP panel into OLED devicetree.
- Add patch to read the correct maximum brightness from the eDP panel.
- Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org
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

---
base-commit: 33a21dab19b31540dfeb06dde02e55129a10aec4
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
prerequisite-message-id: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
prerequisite-patch-id: 658fd45e0cb953e3c667a30f2cf78cfd3582d552
prerequisite-patch-id: fc665d8cdd099464e6fa4401489fde70b65bed30
prerequisite-patch-id: 13ff38b40f2dcb283be82485e88ca4efc249599b
prerequisite-patch-id: 7d02075f074ad8f32eeaf5ee8833d0c6a230cea8
prerequisite-patch-id: 380fed6c07ca1ecdb73768054454e47c984d00e9
prerequisite-patch-id: 1f8b24fc983fa23abc97512e15626394ce760ffe
prerequisite-patch-id: 7d29e2fee2b19cf2d12d54cca052b1c1fb808c9d
prerequisite-patch-id: c5bf1706ecf4df7782707bbf0d18a0568842b562
prerequisite-patch-id: 34889448fd92cdc916e7e19eac8446710d2a646a
prerequisite-message-id: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
prerequisite-patch-id: ceed93f46ae27c7980c5b57022068daaad8dc8c9

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>



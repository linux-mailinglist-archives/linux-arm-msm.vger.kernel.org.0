Return-Path: <linux-arm-msm+bounces-53049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BCA7914D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D6F23AC109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAE423C367;
	Wed,  2 Apr 2025 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzZzMPHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5038FAD
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604602; cv=none; b=NAvtiEbqO4kdusj9zB/WzgeF3Ng83lMoJw6sllNxQtfOjwf5Jc2dAQUkvdt9gmqcDgEVtm1wvDpm/+VI0dY3XTOyd6ytURVf3OnICixs6/dNAPtDmbVBJkPOpfL/IWeKU0+2Kl3+bK/baBs1gVn8dINmta/G5dd/ARl3MrSkr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604602; c=relaxed/simple;
	bh=wdbY/f0SsTEDRKIlr0J0r8jqNsTifwjpoiAj3tZNr3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r1OQwrYHWxfxR3C16cxJ3rMvzSY41HNStStEsrPR4KHNa4f3C9q+SOZEaSVNXHnON3KfBA9cvAxKXhm8LLrn9LdcMmXrtC1XU0SxcbTTVQYP/Z2LI0Lb6cRJpKJrHmR20CW834FbBZlkOKLClhPBZ7gNKkGmimPXqQoGqdE2kyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzZzMPHm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so44838345e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743604597; x=1744209397; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OZPFd+3nBV9zg3pKEpB8c5hVsmEiajWVSSxIoQN/J4=;
        b=nzZzMPHmlxyOsGiT6ZOaSSblhGg9+ClMdm+d4safBzLcDWcUMZWox6AzlxBI1rPuit
         2slLfSTT4BRkvoB4ZrCKLNkHav/Vxc9FoM7pRYo19M6azLVX8ar4349K8/tX56ni1ye9
         zzwQZV9PRX10DOvKsi7gG/PTET3z1rW3zn+cwZ1+Ldzh8GRz1CEuupt9PHDCb1jdFVId
         1KJyFSEYD0V3y4Ykomu5jEF3uSAWpVaO+vh7w8i1e2DFNET7KJr+ebWQt5qySxMM3MhC
         lrcAHf2XWUPxszlrnmMG57xvBtYNWVqHUsOBO8RGxPowSZCzghgeLjmoYO6INimyiUCJ
         PLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604597; x=1744209397;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OZPFd+3nBV9zg3pKEpB8c5hVsmEiajWVSSxIoQN/J4=;
        b=QNeuIr1lQETKG7TStBcA7Ctz7defTVK0n3xI/rTchHc+UYsrvKGPvDJKX1JNj83YHs
         NVhVi7Fb0bI45o3Vc+B+gslpOeI5SqGp7vtiA6nafbnGeLk/0Jq1sbmi0tTDmZsx8wUG
         L1YGC7hiQN4gcZdl2F8LyEvnbz5+n4e341OEOWv8w7Zaf1bnbwf2AlnA9xR07aci8Ya4
         t5fs+Q/Cj5e/BcDWbyj+RgrE7Wxyh4j3NOnFZ0YdnFWgH1t7/6i7cC9zb8cee2ZpuMUG
         wnUF2mjWC1EnDvwRdo8XmlFWgcscCto/X0gCFa4ozTvDy47tpYFATdAqLsCIR0pNWjv7
         +3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyKeGd+9ISTBd9G4xpid0LWW+Ofxw6eojacuR09w2w8aGqeU+QKg1bSVj/86/fUTjUewHZwmGYERwXDMKR@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdHNtwP8Q8CgHJAz/HqZCO6qwTi6Wi7q0Fi2q6hZE0qMM3ytY
	pHMXLMDy+5yksDvR6+BKc9YO4SxSO1wDqQiJc5fQ20ETlQiDgh7DtMMHKBcLJrg=
X-Gm-Gg: ASbGncsliHfyLlDLyirUSKefC6XVjPISidizMY8aLS72/7YmNZfHtmUyYxE4CQMgW+S
	++FTXc4P8H53lACpwcPJnuBb/5F4r+QtuK4EZdumC/s8o1QEUtoSDYfVIyCWXnYspd3MB84AWd/
	6nyArGTx7mAufEpWZyUJ9tB4pcvKEjGom2lg+bCOTtfLdNZnjm6c88UobBpFpZm8fAjYgVEMYTz
	WcTsLEeq6CC3Oyo/oRGS3IGx41mPHjN9hVIAD34YB0HOw5B1VZERLYdx6FYgomk9D8lXhCGOb98
	+lXaXpOSikPk6jL6cet33rXNnDBPg4lrPLX4CFCqbzG+tzcyb7O6BuvLqhvXKYMb6Jo=
X-Google-Smtp-Source: AGHT+IGHnEjaAF6TdBWULUciMcarFp5DBhDkePCJjZ4FPYyba+CH4VGbrtlke+W2qDrPN8q0hph4gg==
X-Received: by 2002:a05:600c:3d98:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43ea7c4e76amr77872505e9.2.1743604597214;
        Wed, 02 Apr 2025 07:36:37 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60d1472sm22654985e9.22.2025.04.02.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:36:36 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Wed, 02 Apr 2025 15:36:31 +0100
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9L7WcC/5XNy07DMBCF4VepvGbQ+IYbVrwH6sL2TFpLIQ52l
 YKqvDtONxR1E5b/WXznKiqXxFW87q6i8JxqymML+7QT8eTHI0Oi1kKhsqgVwiVNkEPwhSJ8xvw
 BZ2kq5IEJJj/yAMGZnklJekEUjZkK9+nrdvF+aH1K9ZzL9+1xluv6D3yWIAFtiCZQpL3yb0Maf
 cnPuRzFqs/qXrQbRAUI3IXoYkcaY3wQ9b3oNoi6icaS7ZUzTnf7B9H8igbVBtGsogxe97qBhH/
 EZVl+APQtObPHAQAA
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=wdbY/f0SsTEDRKIlr0J0r8jqNsTifwjpoiAj3tZNr3A=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Utwut02pE2oqTD8qrOzYffFgIVHdVfd9YFeN
 +epfIlBW/qJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LcAAKCRBjTcTwaHBG
 +MjEEACKpIi8hW0hmQ61YYN9wbYDtip2XyYLeaZ4hRkEGeekUnSgiQz4yrznSISsLhWJ0vge/sY
 MHKaQ9i7msQFoHQDmD1yQKrYQA20gboJhP7qcs+hJWri7Ae2x1XgQDHCKIowbBBZITII/5RvyfE
 +EpPpqbnHKzbhoLMV2M2xinnjLYrYOxutwafQe5hm1ynnekZIz+PTq6Jks+b6fS+iBdoA7Hlwj/
 jWvrxdgqAxvW4osixzolkY8D/Inpof8iwJif/Jib+LZRm+SWqiRpqkz3I9DBdpRgvH24hQAspE0
 hMFKjwlEzsqm+TpcTPHnSXdtAC0Vn5BhTOC7ru4dLUJwn+sIHIDNHa8ntNXEhT+CkXKU/aKu98W
 GHxqJCzoWKprht3arBmRz9YTej1yA4yPTxdcwLEpMy0SmmjO8ULV2VtP0XZl808MaFNsp3S0SqX
 dv4oIfgu7CHazXHO9qDjBf9pxveRuQ1VoAGyE/Y5dxzJcOrOWdTwpFqRzJ2PkV/To1gh5f3BsFg
 JN7Lpef5X37vVE9Gt4ReKAl3pMgJ9WDDUqbaZUt3sDQMYEi1dZ5BPflqt+9GwWo9k1cJOwytRt2
 XFzAreywfPAqYXpmrglHYOIsR0ibGMJqY92tKoWvf0YpgAC/1zv+tRhtTZr0QSq2ETd7uxijLka
 NqXc2AcO8AFhEcA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
panels. This patch series adds support for the OLED model which has a
Samsung ATNA40YK20 panel.

With this patch series the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as (to be clear this is not a regression). This is fixed in [0].

[0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
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
Christopher Obbard (3):
      arm64: dts: qcom: x1e80100: add epd hpd pinctrl
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
      arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                          | 5 +++++
 3 files changed, 16 insertions(+)
---
base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>



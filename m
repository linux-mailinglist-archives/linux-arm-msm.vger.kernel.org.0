Return-Path: <linux-arm-msm+bounces-37660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E19C5E21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D80431F22826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2865E215000;
	Tue, 12 Nov 2024 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqlgIdR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F420B1EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430898; cv=none; b=Kpl+KU/WcaTd+2D5gWnaPgHEevvsu5Yuw5vJXPc9UQlYihVV630W/1g+6HspIjjqr59eOJOHSjCOJuFGgmgYFSuMjKC0OTf/vbVsEEW8rOvMSpUVbU8zP26eNYcFfxAxL6hfQzTGRNxwCO36OcEUGgsSgbmegm4BlAiRfrtDzeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430898; c=relaxed/simple;
	bh=QdMcADmJnreZLQtMOGP7xsANBU/fDQvnrerd3qhqG5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UdqMDe2qAOF02LcM86swuiiekfR87wZVfSIxBG2/NEGRknYIDOorswLJskxLC6kv4eu5jxF/LaibX9RRUfZME0SaYHf7bRYu77c0FNv4mIjNZLVxRh7FKEsllXpTChSKF0ek9P608lHSER/43rsMF6ZpXJ1e9+aMBMTSYqc41f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqlgIdR5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43159c9f617so46947295e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731430893; x=1732035693; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hk0rqQWGF5qZIEm5N8ldf910xYUbQ8SJF6GsB6UMS8I=;
        b=bqlgIdR5u4tZ7yt8CvCAvek9Tp15YMj5MCw5zYVyM8ziXVtn6sPPo5DIWrWt7waOTc
         9sZFcWtux40/yZGNHmU2KH/eHYbTeb38C9kRYklRoYGwgQXqA033ncYxqak5SSsze6ZP
         29fZ+Ri0MuVTj2SpIm6ynQNyjcEpO0RGjTxtdi1qpbG4Fn7csJL48YSwYRaREuz3lti8
         Mx8G89VunO+NfgrEwQJzd0VNSkr3SJH+dGaTsXyUNVex0D4JOQ5W8VviriurCwAq2+IK
         UWDGW6zX80ghcAsczvcFLABAIFQBH2VSqlwWB11rUuLKxSJ7omNdW9KntoaftzMnjcxX
         vS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731430893; x=1732035693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk0rqQWGF5qZIEm5N8ldf910xYUbQ8SJF6GsB6UMS8I=;
        b=rPG+BwwDG11nnjgkJDK6IY2+RMJ7ZzN1b4Buj/wBSr0yguTjDj+owqNRxlXxqF0CFm
         hrR2CGB4jTDAEBwOpNwf7a9sBtuF/0paRh7aM1kbfe7LDrLz6bqjQxuO0h9mWfxsD0It
         ISB1mUpQD+Lg6MRTcW1MPRAxKtM6ftD4IUCVnA0ltlkoDmzCMOOaTTOaiYBlT+mquZu8
         truyUvTad/ADnc3SZtuFu+K6uiberwINt4mYz8Lgs0C7WlDbicyJcQafdU2oLL0ASg9l
         nGhavlv+xlWit5uXg5x20jI+S84O8pHHQYyB6/Blx7ku9QVQunp0Yb9rL64MLVpEJzhQ
         zb7A==
X-Forwarded-Encrypted: i=1; AJvYcCV6bi+D7VMgizmm9HPwU6v/JXIPb50AxxXFTSS94ygUbWJxAU59cNA5A9g0z8mI3ND4++pq84ByYe7Yi/b5@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOBG3xlcADKji463LmwyxHuDPr6NqZdI6vEMbXs7QAawk5wIB
	NxHlFZiz76U2c03WBxMNBJUNxjru/TWYfNjqFkFVVKV2bpD92oxyZkuXxDYU9gQ26MZlJ2gYvhL
	5
X-Google-Smtp-Source: AGHT+IFSMBojI+Imkb0+JGLwd8jCmTi0rjRk9veZD23ZwWmx51GdgwxPkT5B+ORTlAzCVyhiswfvJw==
X-Received: by 2002:a05:600c:3b82:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-432b74fdef5mr151814295e9.3.1731430891290;
        Tue, 12 Nov 2024 09:01:31 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053051fsm215018895e9.6.2024.11.12.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:01:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 0/6] usb: typec: Add new driver for Parade PS8830 Type-C
 Retimer
Date: Tue, 12 Nov 2024 19:01:09 +0200
Message-Id: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWJM2cC/2XQwWrDMAwG4FcpPs9Flq1G7qnvUXZIFKc1jKTYx
 bSUvPvcDtYNH3/B/wnpoXJIMWS13zxUCiXmuMw10MdGybmfT0HHsWaFgA4Ijb6ZwGAA9CUzW9A
 jiUjvaSDqVG1dUpji7SUeP2s+x3xd0v21oJjn9Mdi9I1VjAY9iLjOw2BGR4evOPdp2S7ppJ5Yw
 V+g1lwLYAVIRgZgYXHQAPYPgNgCtgI7rvdMlkzwvgHcGzDQvqO4CkwwdWR4wJ0N/4B1Xb8BN3N
 Sr3IBAAA=
X-Change-ID: 20240521-x1e80100-ps8830-d5ccca95b557
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6048; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=QdMcADmJnreZLQtMOGP7xsANBU/fDQvnrerd3qhqG5U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnM4ndKMK5bQ4WuVBzvhz013JOvxeDL1LJpNuYw
 8O9mAOo+OeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZzOJ3QAKCRAbX0TJAJUV
 VgICD/9si7SibFXI1TxZT8Gwca2OdCy/cGgJrwfG8IZCh5qzosrbst1JDEe2AK8oyZvB0BgPjV2
 LHSATOJBW138g+8De0iFEs3jYWxIe/6yRJuiRPTOg6n6D+G2eMmAsMFyhZ2VoMIP36BrtKqPPEa
 wPGc55AECt5riPGXmP7OqLLRoZogdG8fKlgUDFw++GMCsQ/WNagPNvcgGJB6eNsrym38srP3wRn
 uKpS93Mp0SNyEDEfE6gLqSUNoqORmYz68vuBqpQTkwV5dGoVR29aYlIG+VJw6SGjoyaF3RQFQPN
 ibrgbugRvZi0GftRHUZ6ctdPfDAJOj/3qaFUINy+lcY7fNIX4v/HQbrR9S1W/qeNWEzTNIoJI6t
 OOaDKPsrFYeJBawWNy0HmSOL9N6NlgUGZDDe+v95eRPhNoNdYK96+Txz3ogoXlZ/f8foqs0Axb6
 YTwwkJxgq8IXIr6i7nwh81WhvQPycwBWmXFZ2sRm6F+n4xHVj02myxTw7zFh9zHVbPY6Ip/vxVN
 3x8DQAdpgxZc5ESzMoGTyd+m9J5ZMOLPA/GykQVjZ5kR4ZHikhVaK/w4jP2TR4dOBIXBuyu5SQd
 iZ4sO6/ytCDQxz183gK2LTkX4CkI9JCA4lNbuxQiv2TDQSGX0kDMltBa4UzaHlD1s2UwnEVU+Ir
 LD19O8/qpH/Yn5w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
via I2C. It provides altmode and orientation handling and usually sits
between the Type-C port and the PHY.

It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
a few laptops already.

This new driver adds support for the following 3 modes:
 - DP 4lanes (pin assignments C and E)
 - DP 2lanes + USB3 (pin assignment D)
 - USB3

This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
it can support link training from source to itself. This means that the
DP driver needs to be aware of the repeater presence and to handle
the link training accordingly. This is currently missing from msm dp
driver, but there is already a patchset [1] on the list that adds it.
Once done, full external DP will be working on all X1E laptops that make
use of this retimer.

NOTE: Currently, due to both LTTPR missing support in msm DP and a
reported crash that can happen on DP unplug, the DP DT patches are not
supposed to be merged yet. That patch is only shared for testing purposes.
Once those 2 issues have been resolved, the MDSS DP 0-2 enablement patch
will be respun.

The LTTPR patchset is already on the list:
[1] https://lore.kernel.org/all/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Renamed binding schema to be the same as the compatible.
- Dropped the ps8830,boot-on from the schema.
- Added register offsets and bits names to the driver, like Konrad
  suggested.
- Reordered the vregs and clocks enabling, as per Johan's request.
- Used the dev_err_probe for regmap init failure and dropped the
  multiple regulator disable calls, replacing it with single call to
  helper, as Christophe suggested. Also replaced dev_err with
  dev_err_probe on typec_switch_register and typec_mux_register failure.
- Added some new pinctrl specific properties to all pmic provided
  gpios that control retimer vregs.
- Re-ordered alphabetically the retimers default state pinconfs.
- Added the T14s patches with same exact support, as per Johan's
  request.
- Link to v4: https://lore.kernel.org/r/20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org

Changes in v4:
- Renamed the driver and bindings schema to ps883x to allow future
  support for the PS8833.
- Dropped the dedicated DT property for keeping the retimers from
  resetting on probe, and replaced that with a read to figure out
  if it has been already configured or not. This involves leaving the
  reset gpio as-is on probe if the retimer has been already configured.
- Replaced the fwnode_typec_switch_get() call with typec_switch_get()
- Replaced the fwnode_typec_mux_get() call with typec_mux_get()
- Dropped the clock name, as there is only one clock. As per Bjorn's
  suggestion.
- Dropped regcache as it seems it is not needed.
- Re-worded all commit messages to explain better the problem and the
  proposed changes.
- Link to v3: https://lore.kernel.org/r/20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org

Changes in v3:
- Reworked the schema binding by using the usb/usb-switch.yaml defined
  port graph and properties. Addressed all comments from Johan and
  Dmitry.
- Dropped the manual caching of the config values on regmap write in the
  driver.
- Reordered the DP pin assignment states within the switch clause, as
  Dmitry suggested.
- Added SVID check to not allow any altmode other than DP.
- Added DT patches (retimer for USB orientation handling and DP
  enablement). Did this in order to offer a full picture of how it all
  fits together.
- Split the DP enablement in DT in a separate patchset so the USB
  handling can be merged separately. 
- Added ps8830,boot-on to let the driver know it is supposed to skip
  resetting the retimer on driver probe, as the bootloader might already
  let it in a pre-configured state.
- Marked all retimer voltage regulators as boot-on since we want to
  maintain the state for coldplug orientation.
- Added pinconf for all retimer0 gpios.
- Didn't pick up Konrad's T-b tags and Krzysztof's R-b tag as the rework
  is quite extensive. Especially because of the ps8830,boot-on and what
  it does.
- Link to v2: https://lore.kernel.org/r/20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org

Changes in v2:
- Addressed all comments from Johan and Konrad.
- Reworked the handling of the vregs so it would be more cleaner.
  Dropped the usage of bulk regulators API and handled them separately.
  Also discribed all regulators according to data sheet.
- Added all delays according to data sheet.
- Fixed coldplug (on boot) orientation detection.
- Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
  supplies.
- Link to v1: https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org

---
Abel Vesa (6):
      dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
      usb: typec: Add support for Parade PS8830 Type-C Retimer
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
      arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support

 .../devicetree/bindings/usb/parade,ps8830.yaml     | 119 ++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ps883x.c                     | 437 +++++++++++++++++++
 6 files changed, 1352 insertions(+), 10 deletions(-)
---
base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
change-id: 20240521-x1e80100-ps8830-d5ccca95b557

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



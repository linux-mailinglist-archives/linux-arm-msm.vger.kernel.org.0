Return-Path: <linux-arm-msm+bounces-36770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE46B9B9559
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDF22826E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3394C450E2;
	Fri,  1 Nov 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBGa3PI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3F1C9DE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730478605; cv=none; b=oneVGKkRlB/Zh0KZXBA2BzXjz4yplWuMA7dtxQdmqdDMaD6V4bx1aIL1E3n8Suwb1HrKFQ5NR8V5wxeH4GBdjYj6QBfWX7N6OolzLAtG1mSs9hYP/HksYpvER95wCY7GLRa4oWJhFKSVRcm2F+9moBtchstLnjgKv596ULXXLno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730478605; c=relaxed/simple;
	bh=GwhnxTN6IKdAhoiYHq9BHErAjUpa6XS0q/t8w3Q7+SU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rm+FQytisFQqJOS9M03CCp1oUIIvRxA8lwG0Qo6mouxFZGNmb+SHV0ZmcNMYF743c/bQLJOj4DPbe5EPQHjaOM53F4qkcM1a86sB4q2iuQd5NoDCE2XN1OihrqZHx+SCiK21qVUHUwF4Lx7Y7f9BSD5mubd5fDmKhK9llDTctZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBGa3PI6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43169902057so16930455e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730478600; x=1731083400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xV2uPyOco2cudl8tBlSJx+8OzN/N7ovUZzUCwvnIR4=;
        b=dBGa3PI6vbzvgONn6UVtJqxxm9xDd0LGMuFZwUrY1i3hw6HDRPFU+y5dfxP26ik4Ya
         Vm1HEnwVx4LNtE+UwebTaxTMrG58VULZcABLixco5Am2Gq4TnvjVWg/YsXMhxI9XdFxs
         Jes2nIGGeWZh1lsGMSf9hZUYaKN9/pjDBk0YiR3hdKfimcGMIRjLLZetMce7QXsoCveX
         oPwJBn7G1l6K7QSsRZwjgO1qb6CE0ofRDUjp6ktcvfj3w1wzITKyDbNBvalWAXBSliUh
         HBbC9iEfK8MAJRezXAcA+OPzDSFaBKYPrmxq4jXmu6st25avZI2/NTN6mWe6w1WtSipT
         jdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730478600; x=1731083400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xV2uPyOco2cudl8tBlSJx+8OzN/N7ovUZzUCwvnIR4=;
        b=SjDXp0s50RrNM1IR+uuE3Lip3T4ALOhIsknN7UT1PAOWysgeQua+T1Kqf1hh7CAhU9
         GeELPo7I1nD9UhHFlHdx3Ut7EBXDFj1ZT/74aBZsw7ufwSpcJNYV5Bg1nTAL0oI3gx7Z
         XEs6WQp9IQdJQ2bG5TFNeTWZ+qM43JF69DpO5ckArOyWaiG5W5AGg+dUPe1bjuqiJUtR
         mfHl6fo9YyB5YwH8oEJxgA8BQunAuAR4N6eE2YrXeiEs5AIdKHqodwRxEpIQYBFmEMBv
         Dzl1RkLjn6PDKj8/zQ3tthSvoLk96Y4HE3FQ/oRg8p/vzVBLP+FQxwlz1Iy7XX6HPbEV
         emCw==
X-Gm-Message-State: AOJu0Yw1ogmXGWj4WNBd5X71czJtlvTAgToqSt574tDUvwVof29E2nx3
	8jZ9gciUfyjuJ5+j5ZNVIokOwUa/5+L6PxzV+AibtoE/zIuRPpE9abtWj6XsLUc=
X-Google-Smtp-Source: AGHT+IE+1eEbyy54+dwOLeAG3e2coFZuWleidZjoR1HXs1s3EkS9SEWs47zYPEUW7I8mCI3wW+XDog==
X-Received: by 2002:a05:600c:5114:b0:431:60ac:9aef with SMTP id 5b1f17b1804b1-431bb9de94bmr106613095e9.29.1730478600230;
        Fri, 01 Nov 2024 09:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d69845csm66697555e9.47.2024.11.01.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:29:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/4] usb: typec: Add new driver for Parade PS8830 Type-C
 Retimer
Date: Fri, 01 Nov 2024 18:29:38 +0200
Message-Id: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIBJWcC/2XPTQrCMBAF4KtI1kYmfzZx5T3ERTtJ24C0JZFQK
 b27aQVRsnwD73vMQqIL3kVyOSwkuOSjH4cc5PFAsK+HzlFvcyYcuATFGZ2Z08AA6BS1FkCtQsT
 aqEapiuTWFFzr51283XPufXyO4bUPJLZdP5bmprASo0AbRFkZaJiV6vrwQx3G0xg6smGJf4Fck
 yXAM6DQagCNGiUUgPgBOC8BkYGzzv+0QjFnzB+wrusbJZLPXzEBAAA=
X-Change-ID: 20240521-x1e80100-ps8830-d5ccca95b557
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4927; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=GwhnxTN6IKdAhoiYHq9BHErAjUpa6XS0q/t8w3Q7+SU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnJQH3R5ariP3XZ4eDe1/vgo/X86YogzoXQQqIn
 8DMFjem/LSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyUB9wAKCRAbX0TJAJUV
 VnJ1D/0fbgTJeSXE/1RxqYsjZYfWia6/sn4Qt7s1pDPotK1cFzZ/RAXQMzvSL9Qn37CIN1ArykM
 PntQQl9Mue0J2i6loyg0mqPjfht4XYbBVDiZW6dcDfx8YQv+7Lc1MRdiBk/RyHPrSTEuHewTf5w
 Tq1jxCMh1qDxEIpj/GInjHUoZWEKjCjvK2Fmnv4e2mQuPtAcwI2gRx1DiqD6A2hswHLa+SkA2Kk
 SltMrYvA7F1CDGIdnrZ2jJL53+audt4lIEGouASjhwc9uKRgiOcVAgr+iojjik8J5+7g/YQGP/1
 vhnTmyFL2Oy2pyPsqaNWL6k4fZW4oU7MV2C+B5B1/E7nwjbEynaQBFST53Qm1++MJSc8RXsZJCw
 DyjB6W+xdwIPowdBeZhdDoLkI9NsXZMq1OzORGrer4tkcy7zVGjefZRuzQMZ/smOhla2AIid/qj
 K0NgcGWVMKQ6Eo70KFCdt6MruMLRvGghPKpMKBqv+Q99B5P601oyx/keD5ZQ9ONMlcCLFZcnK9K
 Pt2NJS0ekCWgWFr7DNLN+rYE8O5w/MhUBSsxU/iQ1SZdeI8+vIE7uw63vgQi6s2RjbSQEGW/s+W
 xuBztZI9XBrZTqbQ8JRkpxR8D6Ay9rrMJ7xTGnado3myWZUUKm/k54W0FTlQ9Y9ror75GZXC1OP
 Xu2DU+rQHoQESsA==
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
reported crash that can happen on DP unplug, the DP DT patch is not
supposed to be merged yet. That patch is only shared for testing purposes.
Once those 2 issues have been resolved, the MDSS DP 0-2 enablement patch
will be respun.

The LTTPR patchset is already on the list:
[1] https://lore.kernel.org/all/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
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
Abel Vesa (4):
      dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
      usb: typec: Add support for Parade PS8830 Type-C Retimer
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support

 .../devicetree/bindings/usb/parade,ps883x.yaml     | 123 ++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 463 ++++++++++++++++++++-
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ps883x.c                     | 422 +++++++++++++++++++
 5 files changed, 1013 insertions(+), 6 deletions(-)
---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20240521-x1e80100-ps8830-d5ccca95b557

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>



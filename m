Return-Path: <linux-arm-msm+bounces-50880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79919A5A5BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 22:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013041892B88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EAC1DF739;
	Mon, 10 Mar 2025 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDOpvCfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8508BA3D;
	Mon, 10 Mar 2025 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641068; cv=none; b=pGTnjnmX7gytQHyFmjrxAmo3XTUXPkNwF/qch/+vWnFfugz54CenFW19W36keMP7PEKIbM916DV3XgB0H8ORU1eRCDvGKQq/egRdNhgTVSWMXVtoyrO/EqlWyU1EZDkLqprry9a0g1jAazSepxueeHceusmPOAcNMEBDnrZ7EWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641068; c=relaxed/simple;
	bh=b9vxx7zWqUAhhlQ33nLe3smTO7PR3kuPAH3TbTnBkEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfJyLKaMqXsGIRTJo4x2KcGnl77SgsqUzTcJTBaWOFpzrrDTorl1R7X59bRfCwLfJnaydsZ7+0mSrtOj22GgFLR9/iv2CDBBs1geFN0J4g4NFahkW0ChPYoJ2oHNoIpxuJC8xVl2cqZYpH+6bPIiiWfnJRbziMLaVcv8ycl9Umc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDOpvCfq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso12611705e9.2;
        Mon, 10 Mar 2025 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741641065; x=1742245865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDGr+bd0+v4IvOiFmty2KtVI4kE9v+gI/XWZpKSUg9E=;
        b=JDOpvCfqXdgLbc9twCFcldeAvLQKAhMXvsizzxh136FBPht2kSt8Har62J0wHIGshV
         cuHMYuaaunw2XY2B8idwo4T+uIIZ1IaQ5ePcgMXWJMK/DPKSk4+aFJGACqHvjrkONFFT
         qnS/7KqNlXab0UH91i38DxBL86p7c+5hxi0G3duZyFOAXGK9VvAac+Cyx4hl1tnEm9AZ
         Zt+kT0NLwUQEECg+qY/QZ1O+d0FHwwEBOEZCoMVj0B1u8CuGViH/huiyK171lEiuPK5m
         6ocTzyIz1LEGC+XvALt04QAc6xtEaa/wGFqSitRntqCpPf5p9gcUSNKwPLz9FxMHZ6S8
         jKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641065; x=1742245865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDGr+bd0+v4IvOiFmty2KtVI4kE9v+gI/XWZpKSUg9E=;
        b=Vf074DwN3xwgQ32PCrH8WW3vGZ+U0iq7K1LZockPHtjOjWorwrM3JEIyGNxmBBXdeR
         ZRduuET0CZKmDp2YeTUFx8pXeWUNqvJVeifbBaGoX5h0ijbm0fGUzRWIeLl7JTtWGVKf
         sEoh7zFqmo5zWw/mrIILp3ILcJMsjsmbzO3RfjXs7uN6AmChhfUj2AJeptrR11Hme6Vc
         m0GTfKPtm8J2yI1y9ltnSOeGkeqtGHJT0RKeQXibrqTCbjDexHKT/8SL5v2firpCwh6C
         S7HmA1dtaXdPz94B7PULlsP6wlr7cHFWGLKDGNsYYybJJPgvSn9CvsojkKWQaIsUzcrj
         Ul0g==
X-Forwarded-Encrypted: i=1; AJvYcCW9rANtF2uRVcnTfgoluAuv1FyJ++LuB5EGeQxSAl51SJAFC2IMWEwSKGVErPQU70UjwnGHKKytncD2WOqO@vger.kernel.org, AJvYcCWoUh7H+E4yjP730xRC9FnxFi4Ao2Vv7Xm8pdBftbyz+KGXrU8gHByVKp2mRdliEftZKJ3vyR0pqW3Y3miw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4f//J6lmna3KChjqq9TjABklcs1wAopv97gWT/cT1MNbwN+uY
	jMjjPilWbsuwAGfwNiVfRqAokFSICXU4xOWSrlpUM+JVReVD+2k=
X-Gm-Gg: ASbGnctskuBTFGenZ5+ats1WQFC2zimN0ciWiUOiKNoFVBQdVMscfzvRT/V1c9stE8K
	gS/0aJ5A2cXuDfSCNBSvv6Rz8pXKuEBRDT1vi1aovXKGnkPKb8vWz5IVpQU+lX+R1kcLqLHaHAs
	zhzX6TB8G/sOPQ2/4fup/xTcCjzQ7Mq+ia8OSpqqw3srLZFsXNr93fw5rcrRq5XzxTqZcnG7R4t
	Bj1NOCVKpYYdS2LutL6zvsDy+OysvmpPbE7E5H30UNbTnj2i5B7tSGt1RjznKBQnEZmyb/Nc3Eu
	am174mDOBqwmBc12PxvZVLyA0Tan28hAgjKZ/5DkqE/5tOyGP9KxqgmN2Jaa3vyxDOUbYLppLfR
	hAvzU6A==
X-Google-Smtp-Source: AGHT+IEBiIQ1MbFvdWaPDPFgLiSRfkjBIX+VNXkv/hbTgdIWgEvtEnCjb21i0lAzwM5h6ATTR8/aYA==
X-Received: by 2002:a05:600c:1d12:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d01bdd224mr20195455e9.11.1741641064571;
        Mon, 10 Mar 2025 14:11:04 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cf595a771sm54980415e9.36.2025.03.10.14.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:11:04 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/2] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Mon, 10 Mar 2025 22:05:50 +0100
Message-ID: <20250310211039.29843-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
to non-transparent mode to enable video output on X1E-based devices
that come with LTTPR on the motherboards. However, video would not work
if additional LTTPR(s) are present between sink and source, which is
the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).

First, take into account LTTPR capabilities when computing max link
rate, number of lanes. Take into account previous discussion on the
lists - exit early if reading DPCD caps failed. This also fixes
"*ERROR* panel edid read failed" on some monitors which seems to be
caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
initialized.

Finally, implement link training per-segment. Pass lttpr_count to all
required helpers. This seems to also partially improve UI hanging when
changing external display's link parameters (resolution, framerate):
* Prior to this series, via direct USB Type-C to display connection,
  attempt to change resolution or framerate hangs the UI, setting does
  not stick. Some back and forth replugging finally sets desired
  parameters.
* With this series, via direct USB Type-C to display connection,
  changing parameters works most of the time, without UI freezing. Via
  docking station/multiple LTTPRs the setting works when increasing
  bandwith (eg. change framerate from 60hz to 100hz), but in all other
  cases the setting again does not stick.

These appear to be mainlink initialization related, as in all cases LT
passes successfully.

Test matrix:
* Dell XPS 9345
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Dell U2725QE (universal Thunderbolt/DP Alt mode, probes with
	  LTTPR when in DP Alt mode)

In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
in UEFI to force universal Thunderbolt/DP Alt mode devices to work in
DP Alt mode.
In both cases laptops had HBR3 patches applied [1], resulting in
maximum successful link with 3440x1440@100hz and 4k@60hz respectively.
When using WD22TB4/U2725QE, USB Type-C pin assigment D got enabled, and
USB3.0 devices were working in parallel to video ouput.

Known issues:
* As mentioned above, mainlink parameters changing is not stable, but
  appears to be unrelated to this series, and works better than before.
* In a very particular combination of Dell XPS 9345 + Dell AW3423DWF at
  max resolution, right USB Type-C connector does not always work:
  following successful link training, mainlink is not starting. When
  switching monitor to PIP/PBP mode, the issue is gone. I am unable to
  reproduce this issue in any other combination of devices/modes, so
  perhaps its an edge case of either the monitor (Dell AW3423DWF) or
  the docking station (Dell WD19TB/WD22TB4) specifically.


Due to lack of access to official DisplayPort specfication, changes
were primarily inspired by/reverse engineered from Intel's i915 driver.

[1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  drm/msm/dp: Fix support of LTTPR handling
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 136 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  33 +++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   |  30 ++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 5 files changed, 141 insertions(+), 62 deletions(-)

-- 
2.45.2



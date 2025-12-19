Return-Path: <linux-arm-msm+bounces-85929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA50CD0ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E95E30080F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD686346E51;
	Fri, 19 Dec 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zaDPtlaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DA626ED5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162484; cv=none; b=ieS0j6+j4NAb6YR5KyQmpQVbft1rAjSP6RcbVUUWV4Sq5nF0OKBQAJJd7O1D+ZfEVTN4dpgFhJmheLm4i7cpZiA05e9STkGLbEah31wP5TZqqX/gdYEdopXgKp7L+0F+XzS9idLP8uNin6sF2lAFt2Txy11Tl3odUtRBwKpVNi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162484; c=relaxed/simple;
	bh=ucfG3/xpPbSz5u5wmkm8abE5HIantGt2GhrnIFQVyic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cCVxe3pqawVp8g5mpZwdKcFOT0+C1wA0+M4RkV2iPMepjGVJCDTiqfFTuI2YdTYwq86hoggvAB6RvN4bou8cwG+Hkb0FtVV+9u9Q9ePYJZ3jTev9N2OCuDZ0rpcjLhSVHUtXzh/IQSplEMBahVi9bLClxOk9UOv7K7dXok4+fBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zaDPtlaD; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b7eff205947so262845566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2kzU44j8jBSDtGQe926o+4fjeshGhfwHjfNhdVR/KY=;
        b=zaDPtlaDLE4j+7b8J028SHtCdDwtkYv8/RF8abcK3g9jXsqzNJN0NqRdJ2cZsR1iMn
         QPRnXN9mlDRIX6o2+vpBPgdt1DrOeEkf8JVN8iFO5HdbXCi6FQCrG03XzrOyc+N629ID
         LmlDMxyrMd1FOL46g51H5MUtTq65Vo2uZxo4SxpDENqzqs2wgcxhPyES6c1xXNNe0aQ6
         F7ZbYLaVNy66c2ne9wIOMMfgrcb2uI3gcVzYSXAqNoLtT1gSsdp3GYPNPhUvvsJ3Ec7N
         rFbG2HQ+blETW/VYRl4HiLIhLWGBrFhMCJY20iax46paOI4s1GVzyHo5mOYZaETqT7E3
         Bg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162479; x=1766767279;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2kzU44j8jBSDtGQe926o+4fjeshGhfwHjfNhdVR/KY=;
        b=tXFbCjFfQ6atWnAW1eKqY4xW4q/123GrVE0g2EJ+yrjyJAZ1ZRllYvsyRpQXtNybhC
         /NFmK9HfPYhQI1n0OvIDcrRR44wl1dud/25pXo9I6u46FzCbWhLYLCXGMN5y+CzDdVyc
         v1Pw6vBIrUUzVvwSNbuQuVjyPleOnkNgTXLp+beLynrqCsOJEscMVxopcXTZNxQPhBkF
         0Nen74ksEV2RgZNNeA7CFB8TUdYri8NzvhM+CypWvTAZw8jN0q/3zQa+EZYpBVwwI0Oh
         DLhSUkc/0ri3J7NQB9s8pj/pnJqeB2Gsinow/P5yfv2kq3n+aJk5SnoL0oQ7oa88JnVu
         n6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe8rzQQAt4fqjmOfdtqJ7LbzykzO2TLM4jRtQqwJeOOwo13WnnsCXRwkjPQjmounEoKBRFQWCRn6/hHYJs@vger.kernel.org
X-Gm-Message-State: AOJu0YzeM/W+Zy6Y9qvGfMu45/QauLBVFQIxwM1i+iYYu/fh/uJYSo/1
	MZbbEoJJsPeHAmoMHyL00C54+n7/eus+Dn861kCAbACxTvLHHO8r8pmk811786MWIDjr/lza/eD
	M+Wf1thqpkTf0Je8=
X-Gm-Gg: AY/fxX5Lsi6aLcxv+8JKYBLFp2hqy1GmfH75ETtr+yla54xgZdRhB5LmIJsHQBrmkVg
	7L54bOSKmBBBed44xF+FTH3NfobdF+PS8Bsn3nmVKegeQXpRQAVSTgBtdQtXx4nCkQ+zisz9KyG
	Z+XCOhzWfQMmkNOejkaVWXLpHoZEqZZAjnqCFceS1UqNGxbwuWrng7pzKEy3m/Dp5DE7xiu5bm+
	5M9hs0XXAWbxbfJxhm4ZU2Y5Dt+cas76FYRSD7qjfI/0xuOJuUG7DH3IbSp4XysSTsg1TbsKhLi
	+1dGvOBYnQzSpVakz/vwyg3FD0CN83H7BOwuP0trhABoQMCyiaeZt7YEuSSWFJWgpKXlZB5V8mk
	5WQJvCFjUmg27sLJ+EOrlqHtZ3RUPw7ffOQeWDmLg632+Pwu+bZJXJRb1OLkoS54RjquL3iyygt
	GwcAFYbfp+g+XFL3g+NL1+nx0zc28wq/YBC3G4EHfX9I7Vfk4GvLgA4O421oDO1CiqToK+u0bL3
	Wn4xLzHCDgxvqPyQPNcYMkIeQSAabOW/nY=
X-Google-Smtp-Source: AGHT+IEaFbfo58dESu/7UUTqBgyeHYsfx7xP4W4fAJTOuAdSjlywqklvueTJX6xzQc9E0FRh5v+ocg==
X-Received: by 2002:a17:906:6a25:b0:b73:9b49:2dc7 with SMTP id a640c23a62f3a-b8037183ebfmr324320966b.52.1766162478678;
        Fri, 19 Dec 2025 08:41:18 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/6] Attempt to bring up display on Milos SoC
Date: Fri, 19 Dec 2025 17:41:06 +0100
Message-Id: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKARWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NL3dzMnPxi3dyU4mLdtEQDczNjM0tjc3NTJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAXpnMk2EAAAA=
X-Change-ID: 20251219-milos-mdss-fa0763693775
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=3814;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ucfG3/xpPbSz5u5wmkm8abE5HIantGt2GhrnIFQVyic=;
 b=6kFDJkb27+1S/KM6JtihyCmbtRfH48KsMI4CJJ+vZfiHNxUP/S4L+J3+uHLZNu3O/bEmA1LN6
 5ms4n3cr1YuDx9lAahnXN5ZpgXhIzqSkw4Z5VGf6d3ucTmnay9J+m/s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Hi all,

This is a very WIP RFC series that attempts to add display support for
Milos, in particular on The Fairphone (Gen. 6) using the SM7635.

I have excluded sending panel driver and dt-bindings to reduce the patch
count, since they should not be relevant for now.

The data in the patches is mostly derived from the downstream msm-6.1
kernel for this SoC, named "volcano" downstream.

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/display-devicetree/+/refs/heads/odm/rc/target/15/fp6/display/volcano-sde-common.dtsi

While I'm fairly sure a good chunk of the data is correct (marked "OK"),
there's still many unknowns (marked "TODO" or similar) that you can
see in the patches.

Unfortunately it doesn't work yet, with the screen staying dark and
these errors appearing in dmesg repeatedly.

[    6.541696] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
[    6.587091] [drm:_dpu_encoder_phys_cmd_wait_for_idle] *ERROR* id:33 pp:2 kickoff timeout 0 cnt 1 koff_cnt 1
[    6.587387] [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:33 ret:-110 pp:2
[    6.589509] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
[    6.637482] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
[    6.680077] [drm:dpu_encoder_phys_cmd_wait_for_commit_done] *ERROR* failed wait_for_idle: id:33 ret:-110 intf:1
[    6.680356] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for commit done returned -110
[    6.684517] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
[    6.729507] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout

The panel is the BOE BJ631JHM-T71-D900 with a Novatek NT37705 driver IC,
running in command mode (not video mode).

The vsync/TE pin should be configured correctly:

~ # cat /sys/kernel/debug/pinctrl/f100000.pinctrl/pinmux-pins | grep GPIO_129
pin 129 (GPIO_129): device ae94000.dsi.0 function mdp_vsync group gpio129

A full dmesg can be found at https://public.lucaweiss.eu/tmp/milos-mdss-log-2025-12-19.txt

Schematics of the device are also available if somebody wants to take a
look, starting on page 109:
https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf

Please let me know if you have any ideas what could be wrong and how to
fix it. Thanks!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (6):
      soc: qcom: ubwc: Add config for Milos
      drm/msm/dsi: add support for DSI-PHY on Milos
      drm/msm: mdss: Add Milos support
      drm/msm/dpu: Add Milos support
      arm64: dts: qcom: milos: Add MDSS
      arm64: dts: qcom: milos-fairphone-fp6: Enable panel

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  71 +++++-
 arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  24 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 627 insertions(+), 7 deletions(-)
---
base-commit: 167013d059d5c4a09d49068408044c7a65a26cee
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>



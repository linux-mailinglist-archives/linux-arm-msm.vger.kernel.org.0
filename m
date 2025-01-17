Return-Path: <linux-arm-msm+bounces-45380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6885A14B8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCEE18879F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5D31F91DA;
	Fri, 17 Jan 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOEu0u/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F501F91D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104204; cv=none; b=tfjRy9we+SNwtcgD+NJOPb+LTo4zj//LwghXjbFN2ik6mrpYk3orrzdalg/VtyDiQpHiO+edPo8gqV8gudXODHwqQU6tbrhm3py4a/zCH3HECgIxNV1aPnyPGotg9Sz6boBg8gH6rIlzw86FSS1zbwhfSoF1OJGecw7GG8ne+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104204; c=relaxed/simple;
	bh=nP4VV30rpvduxunGABbo7dBWD4cMiSH8HcV1Q+o2kbk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=js1W3VW/PnAikp8MGn0R7ygz32I1rcI9DUagP7EVGXNa603KnEJfhzR7W02GaNeUtHnCmiiKyQdCSw7f76VTpPjajDiIayWWf0r23UxbfuFGRWOOVdHGbxS2H/wB+9awJlawETlpePzd03Gd0HtD+U4qy+wwHeGkU48CGihouko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOEu0u/F; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30229d5b21cso15995581fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104201; x=1737709001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0ikR3MG5Dad5PLWtZu4J5E6aw45hxShewolJAGb8WY=;
        b=NOEu0u/FlxY1dKAAsCwTra0Tc5I+UCLMK9YdBEvYr7XMzR6H6k9JULn9WIUfT1Cffa
         Ox4PEG50g9+9ZFiswdQDTeTxZ6lHhlrN+R41L/5BiOp20j+LbCAmM5c+3UP6idoU7vZH
         oszfgdC5TFcU0WYUylU7/NLlkKI0NAUxS7FWztubWzCzmvpYjzAy3+DQnv/F8GbQgb5b
         9zqbthpRfaTy80BQPCQFyTT1h2h6ZJq9RhiYFC82mwJe5ViNtc0WCycQoAq3B+WsiVut
         PBGJylKRm9L35UPP69vRRJqZyTKPhFcLlgdtRJvYzqFrOapTvBmEdOsFGA9rEhOHDXG+
         rd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104201; x=1737709001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0ikR3MG5Dad5PLWtZu4J5E6aw45hxShewolJAGb8WY=;
        b=AQBXZ9/d/YzNjRgAYjlM2UaQ1pEoSrdBD5yafsLMd1f47zyFwLa9Ll6aQKZzlGIfwK
         aZ7K7CmY+50c/q8pNa/TUYK1axOW5/PHZblYIGBN9dV8S+2JyypUfftRwNI7xGF1p83i
         IrnBZ9guuGd6sWKY45rpDU8OFn+XcJBs0i9pGOwcwA/af7suYEFmsxzGSRYAcp9C9p1G
         WdU8+ex7gVmg/jcmie+uBXVO7sj3ByBxEnfmynWRxJZ3nxyOeNnUwZXy6vR3UR39oKYo
         t1Y6Z6HxjmFnZWs7D+4nucpB/a9hCjX+ZaOCysoad3U/0mlg9kH1yquwXoi4+GWc+bUY
         SgXw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDRDqUdDWPY/nIG33mC6omdplPi3uGVD1ohzpGPR5z9hLvl2jhTyaEHB58shqCV0sqUYqoSfeyH+Rzdgh@vger.kernel.org
X-Gm-Message-State: AOJu0YynSBsjGA5A2fl3P17n2lB3sVtF3d4ONyK0+b9L2LLcvle+PIRd
	/s/i+g6gzGRh0mE4Ln2BL1Dp7sYtl8f5EVP/MnPlpgWo+11qp+jcaKRGIfk/KrU=
X-Gm-Gg: ASbGncvtDSKkiU5GOFpSIRYcZ4eIzkvAdlRi9zyll8UXIynLxoHtw1YA04H0F/gGEhz
	AlRN+z5yoHlZFqFJkxEIuNoh/Ivcf1rgevQUhOch8U1fcMaWXp9XE6kXymSy93NwX6cvqXmd2y2
	3icuUCrnSQfNiz+94AVbztcbl6VSoBqVRUrmf4e24khxG7PmXhVIKxHeu/g3Tbo6TqXS5ZKBGZh
	ERomJz0nh0PT5vEFQQbB9LG3XtKvyYNpbGpK9dRdysmy+FjN6zikuBo8Dhrzs8f
X-Google-Smtp-Source: AGHT+IHFY25drW5Lw2ZVshUT8i1rMR2KHN40GDh6zDnX9NGy7k5yQuInYG8L/p0IYq+WtTkiEafV6Q==
X-Received: by 2002:a2e:a265:0:b0:307:2ae8:14b with SMTP id 38308e7fff4ca-3072cacabd5mr4867911fa.12.1737104200598;
        Fri, 17 Jan 2025 00:56:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Date: Fri, 17 Jan 2025 10:56:35 +0200
Message-Id: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMbimcC/x3MQQqDQAxA0atI1gacUSy4LfQAbsWFJrGGUpUEW
 kG8u4PLt/j/ABdTcWiyA0x+6rouCSHPgOZheQsqJ0MsYhViGZDtiyb/1T7IGzEOROKOYzFRlOr
 BdSghxZvJpPs97qB9PaE/zwu8bAqObQAAAA==
X-Change-ID: 20241231-drm-rework-dpcd-access-b0fc2e47d613
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nP4VV30rpvduxunGABbo7dBWD4cMiSH8HcV1Q+o2kbk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtE7QvRxYCJ8RauLnkCML+SkHt7cVuLLC0Ji
 Orr8qLbQPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRAAKCRCLPIo+Aiko
 1dwnCACEdI8fIo784cI7usBp7nXSWiMDaIt9E8T5+m1FE4EeARrYjouNWNKnDV0m/yUFOHqfyM6
 Y0KoZRuABDGps8N6ZXbX5YtfwAau409DiIEv62yELDA2ENp776PZ1LNcXG2nTQ5Vuz6SIC/A8oH
 MrE8/0T54dqOVZgjYU6oFdoTyVQAvwK4xqk4bDRbI84rQ/tHznrq/Nkzij4KzQ+KOjM/RB5RT6l
 Wmrac3yaT2WHjuVhr4FCZ2ukZIHpIXINoz4HP9SrquYJO8h+i0UXDOLO2g7dL4b4r3Ktg2HTETE
 NT2EN92LHPs/CEd/qc/W+vxoGjaTmiboJ1aGo6fwxGw0jubz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

As suggested by Jani implement new set of DPCD access helpers, which
ignore partial access, always return 0 or an error code. Reimplement
existing helpers using the new functions to ensure backwards
compatibility.

This series targets only the DRM helpers code. If the approach is found
to be acceptable, each of the drivers should be converted on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      drm/display: dp: change drm_dp_dpcd_read_link_status() return
      drm/display: dp: implement new access helpers
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-aux-dev: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers

 drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
 drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
 drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
 drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
 drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
 include/drm/display/drm_dp_helper.h           |  81 +++++-
 include/drm/display/drm_dp_mst_helper.h       |  10 +-
 9 files changed, 354 insertions(+), 345 deletions(-)
---
base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



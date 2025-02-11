Return-Path: <linux-arm-msm+bounces-47635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E9A315EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ABC57A3456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BEB2641D0;
	Tue, 11 Feb 2025 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGkTLI1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D80261590;
	Tue, 11 Feb 2025 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303388; cv=none; b=i9sNLbLNmIeCqi+Xk1uUb6R65vy4JrcZzmNmMoDKkKgsGAWF8tDB/MEMCrqJS5PCK+PV+vMvj3/xwiTFSBJhAOH5JQjE8MmpGD2mihV7XAbP22Hl6LWXjwAM4iH2GyGuD5nDXbyj3Sscwa4dVVoxE6swRSeqs5PPTAJtsu2IAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303388; c=relaxed/simple;
	bh=q7mudpGioXTvlqpq0msVddOb6NgEqKQnlQZT/L0oMxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J6TjpuBSt+nRGU/u5yrw1IW8R2wVLE0e1rVBvkumKarfYW5ClQaQFljmvzl+mxNvr2M1OqzhG9rrDCPSBd4NAb6azXzWag+mPcdgp6RhdWRR4H7qWBcGCHOH59oPpbq3vglpPBMtx3chB1eauwAFsfDeoTXUu3uCbTqXK17EyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGkTLI1+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f44e7eae4so101160265ad.2;
        Tue, 11 Feb 2025 11:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739303386; x=1739908186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjpUGXkhDfRXw7zSvgy8sT4jnZ7i9DN1kehwE4vfMW8=;
        b=GGkTLI1+HIbKLsHQ1032NADSIZ2gS3giH0DnPVJkfev1uHN+Tp9Q207fcOM6tHP3wp
         81rbsFG2HDe/XOSqKkzTBY+5tY5kPWY5VMf5HguUAcxUoyxiXQlO/O/mH+x4OQAh2yMy
         M7KM2/L0MKtNwL/76swNZJ5yKMmky1L277tx3HUPtYkdjEeden8WLWPYIj3Cs1Dkb1O/
         XwPDDUv/yhXRMWMdDVgHWAV2+LUGbp9Fhn6tleSYDck58qN+nauxgBnS2mpFYmlTnIuE
         OF7xHDIWlmwG5zHvGfF5GgYxqRVYvpOgknu3mIGImdUW3VkMeGUEKqtVNoAscmOYEAl4
         CP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303386; x=1739908186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjpUGXkhDfRXw7zSvgy8sT4jnZ7i9DN1kehwE4vfMW8=;
        b=JwgU0RXujDhWsyZUi/uM4foiU+xdn+1cgjjh6jjqxeImRPH+4+gkEtEle2t3wyF9Ud
         okuZMRebGF+RM8+dTzKExre2+neoTCF7hyoXojmTWu/a6Z5keAWzDZR+Lw87nQl/ti9M
         Md1EbEe6KWeEgOVgVMnjP/CuOHPRUISmbQU1ZTkgsgUpBxMD3oFOCUSdnYRNmuQ/liZq
         x+SUEGhBSLM+bncOIF6B/IqiKQwzZzP7Wxmby58X51fdKy/bXzgfObfz77D2ZXKJUPwN
         OUXfdJU/VlKdtHyDPSEyLNPqbCM2Wc4Ur3GbadepzmrLW25wT7U343nxI+DbMqpPjYvN
         2XyA==
X-Forwarded-Encrypted: i=1; AJvYcCU9cM1ny1zqJEFSQzYzg8AjYMrQH7wt098X23mjCMGFgfcyBvCtABPjAUA/r7r8pPCZb7yKJwHoOLCa@vger.kernel.org
X-Gm-Message-State: AOJu0YzgdnCc+qi4AIIvYuHVoEzlU4p8tF+bgLd6cEUe6FVihSQUS16o
	L/XxlAytFVpjUISxVhquCqm4m4OEqUDnHlN7MOVWjZWHH2RpmDmeQ52+bSiy
X-Gm-Gg: ASbGncsVubaJ0kJwo65uhAV1cwO3mxVIfEx5ocVlHNEPnhGJQ4WPhRnmo0PLk4PtFhZ
	wXzz/rWnwaX31oSAZleHibo0txpFd0VRPQd36Ccv0A2TvgPEv9UFyO9XfFU8AMJJLjJlzWuvDQ1
	LikEOi4CgNHNh+cwWhYNnzBYlEwnZXZqUYKgYwtGyNhCrYyvS5A9X4C2XwD7UPJ0BxPb1Jd1q/S
	mPxI704g/J/yR31H56OHMgRuLjXu7FYzTwP+WoTfQ8Os/hF0UKD3HqEncKqLrjZsRWnyumSCO6/
	eIMb4Lf+3/83ceZdG4qeqCbmPQQAF0zkepSLPA==
X-Google-Smtp-Source: AGHT+IH37wtYZVk9LnGGxycAwJeRYDRGUVpw8i2n95/wnOmXU3d48HFE1h5Jo+e4BCuHk/JSvIgI5A==
X-Received: by 2002:a17:902:eccf:b0:215:acb3:3786 with SMTP id d9443c01a7336-220bbad0d25mr7605455ad.19.1739303386130;
        Tue, 11 Feb 2025 11:49:46 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e68bsm99815035ad.169.2025.02.11.11.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:49:45 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 0/3] Add PMI8998 VBUS Regulator Support
Date: Tue, 11 Feb 2025 11:49:13 -0800
Message-ID: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds support for the PMI8998 VBUS regulator in the Qualcomm USB VBUS regulator driver and the device tree. These changes enable proper VBUS current limit configuration and ensure compatibility across multiple Qualcomm PMICs.

Summary of Changes:
- Patch 1/3: Updates the Device Tree Schema bindings to include "qcom,pmi8998-vbus-reg" for PMI8998 support.
- Patch 2/3: Extends the Qualcomm USB VBUS regulator driver to support PMI8998, dynamically configuring the regulator based on the PMIC type.
- Patch 3/3: Adds the VBUS regulator node to pmi8998.dtsi, enabling USB Type-C VBUS support.

Motivation:
A long time ago, in a conference room far, far away, I promised that USB Type-C capability would work on the SDM845 when we chose this chip for our instrument.

That day never came.

So I wrote it myself.

This patch series finally adds the missing support for USB Type-C VBUS regulation on PMI8998-based platforms. Future generations of engineers will no longer have to mutter "Why doesn’t this work?" while digging through device trees.

Kernel Version & Testing:
- These patches were developed and tested on Linux 6.13.
- Attempting to run Linux 6.14-rc2 on our Lantronix SOM resulted in a crash, making it unsuitable for validation.
- Validation was performed using a modified device tree, confirming proper regulator configuration.
- No regressions were observed on existing PMIC configurations.

Next Steps:
If there are any suggestions or required changes, please let me know. I will be happy to revise and address any concerns.

Thanks again,
James A. MacInnes
james.a.macinnes@gmail.com

James A. MacInnes (3):
  regulator: qcom_usb_vbus: Update DTS binding for PMI8998 support
  regulator: qcom_usb_vbus: Add support for PMI8998 VBUS
  arm64: boot: dts: pmi8998.dtsi: Add VBUS regulator

 .../regulator/qcom,usb-vbus-regulator.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  6 ++++
 drivers/regulator/qcom_usb_vbus-regulator.c   | 33 ++++++++++++++++---
 3 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.43.0



Return-Path: <linux-arm-msm+bounces-74508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC2B9507A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 10:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2958617269F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1DF31D382;
	Tue, 23 Sep 2025 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuE8wWKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357D31D362;
	Tue, 23 Sep 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616818; cv=none; b=mM6t1DNqyGx4e0aMTC4+6Q5epwzeL71kyncJVqTDq6ldyIXitQz2lXEWNNIiTjRNbUExqcPvuoNFSnOcha3LrvXdSij2fi9ShyUk3RlLR4ExDTS6VFyAM32+7XX/4k+COIO7fyid+LJgY/+hflGUETpdEqZZ2674Wy1M7yAOT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616818; c=relaxed/simple;
	bh=CUDAyPmWzHGBHTlq0IqMu3RYBPGp4SCwqHs1KhIXCnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b/k8X/Q+cvXICIa7MWQvJ48CkWbojiEf4n/ApUW0Jw2DNJHRq2QjBAu4mmOWS/mPXIijQlHMOQlhgvzfJ3iHhosMoBMTEi5jwnRIPnt/WfI3Oa0S/lEGGZpv8h9euo/HMvKqPUjuAVMCGSmhSaLltAHKCkJ3S8bLHY3YNfwZ/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuE8wWKR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758616817; x=1790152817;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CUDAyPmWzHGBHTlq0IqMu3RYBPGp4SCwqHs1KhIXCnw=;
  b=SuE8wWKR/d5X0EcboGzmXfstHcZU/GitSksybT2KPgtwmsF4JIC8iVLV
   zQbI4WvAAVvdC4R0+NCw17Uu3rgex2BJ9pYVJhzqUoRUc7fEWUTxRlDL8
   FYtjR0UjGLpU0Yv4DOPfI+0m+R7V0lxumpm9szwJWuxbpq0at/rIxX4OV
   C+A1ZRAV/b+AtKUYnqVnceVamPp9DyIdAqIZumz20Vp7Oayuj/BGmhDbL
   6XMAt6i/m0PXR3s3y/bV3n4MAsNQFPR0x4vTdpHBwX/iJwuCMFHZJgzYu
   Tr0TKhE5/bGanehSpk3pu53KvZd80roF+dnwsY90R0sN1SOXKPbYtrnxH
   g==;
X-CSE-ConnectionGUID: Oxc6Rm6tQV6OveijWHed1A==
X-CSE-MsgGUID: q7+ProweQCmYUFmnb7fyKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71135514"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="71135514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:40:15 -0700
X-CSE-ConnectionGUID: u5BQTh96SKGMj6nk5qoIpA==
X-CSE-MsgGUID: b2oRGV9nTt+/wNrGxJQjDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176291302"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:40:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Sebastian Reichel <sre@kernel.org>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
Subject: Re: [PATCH v5 0/3] platform: arm64: thinkpad-t14s-ec: new driver
Message-Id: <175861680092.3176.3763843003064695385.b4-ty@linux.intel.com>
Date: Tue, 23 Sep 2025 11:40:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Sep 2025 23:20:25 +0200, Sebastian Reichel wrote:

> Introduce driver for the ThinkPad T14s Gen6 Snapdragon EC. In theory
> it seems to be compatible with the ThinkPad ACPI driver, but these
> devices are booted with device tree. As the name implies, the existing
> ThinkPad ACPI driver only supports the ACPI interface. Looking at
> the implementation, the ACPI DSDT contains many mapping functions
> to translate the low level I2C messages into the interface used by
> the ThinkPad ACPI driver. Adding DT support to the ThinkPad ACPI driver
> would require adding all those translation functions, which would add
> more or less the same amount of code as writing a separate driver using
> the low level interface directly. I don't think it's sensible to make
> the existing ACPI driver even more complicated, so I went for a separate
> driver.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
      commit: bee278e18e641a4bc11513b0fa8f5eb2667b8a32
[2/3] platform: arm64: thinkpad-t14s-ec: new driver
      commit: 27221f91b83ff1435e550f57b8380a01bab0fc80
[3/3] arm64: dts: qcom: x1e80100-t14s: add EC
      commit: 7de8353e082d179a241dc4a4129c5d6916803399

--
 i.



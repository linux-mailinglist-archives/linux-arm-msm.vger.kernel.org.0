Return-Path: <linux-arm-msm+bounces-74509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB49B950AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 10:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 153DA4E2729
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9EF31D386;
	Tue, 23 Sep 2025 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wvg6wV3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519A313295;
	Tue, 23 Sep 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616907; cv=none; b=cp0p/rcs9dMj1NPUDhPi3bCliignGXhVAOFra5j7BPCkPm6v47tQY2JCxU0Ix/ecikidM0k1CUSawf5tFHsf3ZZpB/bCk2SqjRMID6azUKlI0VFL6BRl/p8laB1J5iqCjmTMCz4ETtZ/zb3Ec9p4+WUS9doFFK3EPTde8jH0w50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616907; c=relaxed/simple;
	bh=lRpdbF/4V+EkIq17vmldPHeUjul5knfmqsC1F6Yw/+8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QDqXKjvDLe1hgFG6RneA2r4YFqATrZjVGn/A6vR/uFX54cqua+paRE0bz4C0jSbG1XJ2XIMsD1FdA1H9FFohZYjtWPHp2fQxaeuYWI64uebMzulaFk2uILwpBQhft4QR0zyXlKuNzEubkba8r8SlwCbrosX9wCiactMzbaUU+Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wvg6wV3J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758616906; x=1790152906;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lRpdbF/4V+EkIq17vmldPHeUjul5knfmqsC1F6Yw/+8=;
  b=Wvg6wV3J23WSOOpq1Q/NsJZ5XkT9wQA61uJztEXhLaICPkR5zcxevFzE
   cJjssxcjnvF9DZy6Wg3u7WCk1DbcCvJUXYFp1r69lE8EhTRr2XqvnBUAq
   WZeAIDW6rP5z1f7SBYncY7/oGrPmlSTunrUmpZ4XPNKZUmDmp0IVrjw1U
   +hRnDt5EfxLb4NZFgRJ6A/Q7wIl1vneRHTUPVPVrzo3UYs/4X5Ha9esOX
   NtH+hqT6hwhklnHbvDBe9NP6RSg9Hu67AZ7j8HNTGJWzVbcJy14noyh7k
   sB7lGELEJL2tfdcLKtM0loBuHl+etwgOptViJw4R3bMxW34aqSsmOYIEj
   Q==;
X-CSE-ConnectionGUID: jVGWtnEzTxmov9oCeOcTfA==
X-CSE-MsgGUID: zGGRHlRGQBGVzicR0r3Pgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71135645"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="71135645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:41:46 -0700
X-CSE-ConnectionGUID: YdeeOyQlQzqkRAoii6E46w==
X-CSE-MsgGUID: 42y7GCWgTR6Nm3sQ8NnySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176291562"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:41:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 23 Sep 2025 11:41:35 +0300 (EEST)
To: Rob Herring <robh@kernel.org>
cc: Sebastian Reichel <sre@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, 
    Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s
 EC
In-Reply-To: <20250919144042.GA875871-robh@kernel.org>
Message-ID: <970a9db9-6bb4-7cf9-bd8f-249374580fef@linux.intel.com>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com> <20250918-thinkpad-t14s-ec-v5-1-ac0bc6382c5c@collabora.com> <20250919144042.GA875871-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Sep 2025, Rob Herring wrote:

> On Thu, Sep 18, 2025 at 11:20:26PM +0200, Sebastian Reichel wrote:
> > Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
> > which is based on the Qualcomm X1 Elite. Some of the system LEDs
> > and extra keys are only accessible via the EC.
> 
> s/platform/embedded-controller/ in the subject.

Thanks Rob.

I took care of that shortlog change while applying to the review-ilpo-next 
branch so no need to submit v6 because of it.

> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
> > ---
> >  .../lenovo,thinkpad-t14s-ec.yaml                   | 50 ++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

-- 
 i.



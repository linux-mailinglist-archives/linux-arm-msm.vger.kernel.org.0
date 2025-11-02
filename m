Return-Path: <linux-arm-msm+bounces-80013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7205C28992
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 04:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D2A1895FBC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 03:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD371BDCF;
	Sun,  2 Nov 2025 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="A6TrMfIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m10243.netease.com (mail-m10243.netease.com [154.81.10.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD34A3C
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 03:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762053882; cv=none; b=nulecGlZ66bklPIf9u2Na80RDHQIeJK9+ILTkDSJ3Rmri9lAkF0NraR+Q+NRBxL6udoUBRl/WGuiRzLj8dbRb97RwguetCYDIjBbWkdWxRtOfD/6KUYecf/umwiNOzu8Hz1isfamV4VnVaTfl3ebouKoCdCLJFZd9JSWcTha+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762053882; c=relaxed/simple;
	bh=SfJ9RMgwuVpZTKuIf6ysPpMKFQh7RYkezwGbBQOG2Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eohkF4ZjKO1efVa1ORqAfMT73hjAj0oghVjnx6LT0rHPnWKpbAwP0xDvzWoBGEPeItofRsg3tq6RjR250k8CDgaoWNzh3+TAkf7C7u7bx2BErWKnqvFAp4NGdY7j4FJTq+CoVL82EMilz/4aNMIQW/dwADVguWxJh7HKUfc8jAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=A6TrMfIu; arc=none smtp.client-ip=154.81.10.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [116.3.204.103])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2809d7952;
	Sun, 2 Nov 2025 11:09:13 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Sun,  2 Nov 2025 11:09:00 +0800
Message-ID: <20251102030900.107190-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <wq6q2xem77ul3hxxptmybpeexj7vpbdujtlizzzpankdwu5564@ug7bpbromyms>
References: <wq6q2xem77ul3hxxptmybpeexj7vpbdujtlizzzpankdwu5564@ug7bpbromyms>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a428a53fd09d5kunmc5043f9784c667
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0lIVh9OGEpCSkNNSEpOSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk1VSFVJS09VSktIWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxKVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=A6TrMfIukmSSG2zk1IhYuZvHffWlt3YoSpt2n9gLGiytFknB3jGxlF4rnNX7QwY9l/g/AeQoz5/ns2XtNLIlHCCw3mQoqt3joeSqKZDsIkTn9VVdajrmpoDjB9rjEKmWPfut8zXSwMu9GOnPdGCnKJdmVZGeZ55aXh3zRCX9EQE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=/Wk7gelrCokWjcSbafW75qF2+S26OGsNeJMhRgjZ8ds=;
	h=date:mime-version:subject:message-id:from;

> On Fri, Oct 31, 2025 at 05:27:27PM +0800, Hongyang Zhao wrote:
> > > On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
> > > > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > > > QCS6490 SoC.
> > > > 
> > > > Works:
> > > > - Bluetooth (AP6256)
> > > > - Wi-Fi (AP6256)
> > > > - Ethernet (AX88179B connected to UPD720201)
> > > > - FAN
> > > > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > > > - M.2 M-Key 2280 PCIe 3.0
> > > > - RTC
> > > > - USB Type-C
> > > > - USB Type-A 2.0 port
> > > > - 40PIN: I2C x1, UART x1
> > > > 
> > > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > > > Cc: Casey Connolly <casey.connolly@linaro.org>
> > > > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > > > Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > > >  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
> > > >  2 files changed, 1391 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > 
> > > > +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> > > 
> > > regulator-foo-bar-baz, please. This way VPH PWR doesn't stand out.
> > 
> > Understood, I will check the entire device tree and change:
> > vreg_lt9611_3v3: regulator-lt9611-3v3
> > vreg_m2_1v8: regulator-m2-1v8
> > vreg_sdio_wifi_1v8: regulator-wifi-1v8
> > ...
> > 
> > > > +
> > > > +	vph_pwr: vph-pwr-regulator {
> > > 
> > > Otherwise you currently stuffed it in the middle of other regulators,
> > > although it doesn't belong here.
> > 
> > Understood, I will move vph-pwr-regulator after usb1-sbu-mux.
> 
> I hope, you are talking about regulator-vph-pwr now.

Got it,
I will change it to regulator-vph-pwr and put it before all regulators:

reserved-memory { ... }
vph_pwr: regulator-vph-pwr { ... }
vreg_lt9611_3v3: regulator-lt9611-3v3 { ... }
[...]

> 
> > > > +
> > > > +	led@1 {
> > > > +		reg = <1>;
> > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > +		function = LED_FUNCTION_INDICATOR;
> > > > +		function-enumerator = <3>;
> > > > +		linux,default-trigger = "none";
> > > > +		default-state = "off";
> > > > +		panic-indicator;
> > > > +		label = "red";
> > > 
> > > So, is it "red" or LED_COLOR_ID_GREEN?
> > 
> > This should be changed to:
> > color = <LED_COLOR_ID_RED>;
> 
> So, what is the actual LED colour? Also, is it a single multi-colour LED
> or several separate LEDs?

The actual color is the same as the label attribute.

It's actually an LED package that combines three LEDs side-by-side.
Our hardware colleagues thought it was three separate LEDs.
I've uploaded a photo of the LEDs to Github:
https://hongyang-rp.github.io

> 
> > 
> > > 
> > > > +	};
> > > > +
> > > > +	led@2 {
> > > > +		reg = <2>;
> > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > +		function = LED_FUNCTION_INDICATOR;
> > > > +		function-enumerator = <2>;
> > > > +		linux,default-trigger = "none";
> > > > +		default-state = "off";
> > > > +		label = "green";
> > > > +	};
> > > > +
> > > > +	led@3 {
> > > > +		reg = <3>;
> > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > +		function = LED_FUNCTION_INDICATOR;
> > > > +		function-enumerator = <1>;
> > > > +		linux,default-trigger = "none";
> > > > +		default-state = "off";
> > > > +		label = "blue";
> > > 
> > > Likewise, why is this blue?
> > 
> > This should be changed to:
> > color = <LED_COLOR_ID_BLUE>;
> > 
> > > 
> > > > +	};
> > > > +};
> > > > +

---
Thank you for the review!
Hongyang


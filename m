Return-Path: <linux-arm-msm+bounces-80054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBA7C2A36A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 07:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE6C188BA3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 06:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E81F22FE0E;
	Mon,  3 Nov 2025 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="FWUhIy6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973187.qiye.163.com (mail-m1973187.qiye.163.com [220.197.31.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6878C347C3
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762152160; cv=none; b=Fp6JoIPCRu7Zs9qUqBoNQ+7qE7CC1ZJksxPvUM0GrP0iAgTRvSOlQzhCnzdyDvzg2s3O+C5iU3abuFtFKaz0d4JZZSfopMN0GShu049G3lksBvxYwaU+pL/NSP8J4hUZmC2JzhT+Yc8pRtL68aJQCEIYIe56O937xtlg1fueLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762152160; c=relaxed/simple;
	bh=gDl4Wy3wPz2R7YMKyjVGY5A/pZ/DRlqoO4HPbVuXjn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3i4piV5+7zH2IoJz70PvGTQA8ubv/2OvpVXFHVxY87JGAq76AwlBxm1NU0hFiyc2pxsETBikX+V5aOJuVOWlK1rQPvnJBoy6l5MEINswFtOnQWpaRZND3dsoRERWcOzDph0kuOD/96as2c2azi65LOIUMgO30nPPhhTDhrndJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=FWUhIy6l; arc=none smtp.client-ip=220.197.31.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2820e3c63;
	Mon, 3 Nov 2025 12:20:11 +0800 (GMT+08:00)
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
Date: Mon,  3 Nov 2025 12:20:04 +0800
Message-ID: <20251103042004.24260-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sokypdm557dik57ayif4kpgd3vk5xgvzpoaarf73barl7w3w3o@ed7oxnbhq2gb>
References: <sokypdm557dik57ayif4kpgd3vk5xgvzpoaarf73barl7w3w3o@ed7oxnbhq2gb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a47f1a7f609d5kunm2f6257c298a2d3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0MeVh1ITEIYSE9MHk9JHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxKVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=FWUhIy6ln4IZo3a03nuQXRzRk9oei1SDnzFQ8y+tfZnaUwdO28JgOO29KkgKWW2R2/F2EH9iQaO+ptrpAxF5HgaFTjaIwjPCDvk8hv9NGV1xVocm9TfoO8AMLfuxTmbKz4fU4snDYjr1herkGCTaeOdjLnBxdImeO28EqYAFrCg=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=b9ZzlagggH42HcNcSjIFxGxCiYkoKNaokjX3lqiWODg=;
	h=date:mime-version:subject:message-id:from;

> On Sun, Nov 02, 2025 at 11:09:00AM +0800, Hongyang Zhao wrote:
> > > On Fri, Oct 31, 2025 at 05:27:27PM +0800, Hongyang Zhao wrote:
> > > > > On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
> > > > > > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > > > > > QCS6490 SoC.
> > > > > > 
> > > > > > Works:
> > > > > > - Bluetooth (AP6256)
> > > > > > - Wi-Fi (AP6256)
> > > > > > - Ethernet (AX88179B connected to UPD720201)
> > > > > > - FAN
> > > > > > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > > > > > - M.2 M-Key 2280 PCIe 3.0
> > > > > > - RTC
> > > > > > - USB Type-C
> > > > > > - USB Type-A 2.0 port
> > > > > > - 40PIN: I2C x1, UART x1
> > > > > > 
> > > > > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > > > > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > > > > > Cc: Casey Connolly <casey.connolly@linaro.org>
> > > > > > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > > > > > Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > > > > >  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
> > > > > >  2 files changed, 1391 insertions(+)
> > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > > > 
> > > > > > +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> > > > > 
> > > > > regulator-foo-bar-baz, please. This way VPH PWR doesn't stand out.
> > > > 
> > > > Understood, I will check the entire device tree and change:
> > > > vreg_lt9611_3v3: regulator-lt9611-3v3
> > > > vreg_m2_1v8: regulator-m2-1v8
> > > > vreg_sdio_wifi_1v8: regulator-wifi-1v8
> > > > ...
> > > > 
> > > > > > +
> > > > > > +	vph_pwr: vph-pwr-regulator {
> > > > > 
> > > > > Otherwise you currently stuffed it in the middle of other regulators,
> > > > > although it doesn't belong here.
> > > > 
> > > > Understood, I will move vph-pwr-regulator after usb1-sbu-mux.
> > > 
> > > I hope, you are talking about regulator-vph-pwr now.
> > 
> > Got it,
> > I will change it to regulator-vph-pwr and put it before all regulators:
> > 
> > reserved-memory { ... }
> > vph_pwr: regulator-vph-pwr { ... }
> > vreg_lt9611_3v3: regulator-lt9611-3v3 { ... }
> 
> Why?? What is the sort order?
> 

Sorry, the sorting was incorrect.
I will correct it according to the alphabetical order of the node names:

fan0: pwm-fan { ... }
vreg_eth_1v8: regulator-eth-1v8 { ... }
vreg_lt9611_3v3: regulator-lt9611-3v3 { ... }
vreg_m2_1v8: regulator-m2-1v8 { ... }
vreg_usbhub_pwr_1v8: regulator-usbhub-pwr-1v8 { ... }
vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 { ... }
vph_pwr: regulator-vph-pwr { ... }
vreg_wifi_1v8: regulator-wifi-1v8 { ... }
reserved-memory { ... }

> > [...]
> > 
> > > 
> > > > > > +
> > > > > > +	led@1 {
> > > > > > +		reg = <1>;
> > > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > > +		function-enumerator = <3>;
> > > > > > +		linux,default-trigger = "none";
> > > > > > +		default-state = "off";
> > > > > > +		panic-indicator;
> > > > > > +		label = "red";
> > > > > 
> > > > > So, is it "red" or LED_COLOR_ID_GREEN?
> > > > 
> > > > This should be changed to:
> > > > color = <LED_COLOR_ID_RED>;
> > > 
> > > So, what is the actual LED colour? Also, is it a single multi-colour LED
> > > or several separate LEDs?
> > 
> > The actual color is the same as the label attribute.
> > 
> > It's actually an LED package that combines three LEDs side-by-side.
> > Our hardware colleagues thought it was three separate LEDs.
> > I've uploaded a photo of the LEDs to Github:
> > https://hongyang-rp.github.io
> 
> Then please use the the multicolour or rgb led to describe it.
> 

Understood, I will change it to:

&pm8350c_pwm {
	status = "okay";

	multi-led {
		color = <LED_COLOR_ID_RGB>;
		function = LED_FUNCTION_INDICATOR;

		#address-cells = <1>;
		#size-cells = <0>;

		led@1 {
			reg = <1>;
			color = <LED_COLOR_ID_RED>;
		};

		led@2 {
			reg = <2>;
			color = <LED_COLOR_ID_GREEN>;
		};

		led@3 {
			reg = <3>;
			color = <LED_COLOR_ID_BLUE>;
		};
	};
};

> > 
> > > 
> > > > 
> > > > > 
> > > > > > +	};
> > > > > > +
> > > > > > +	led@2 {
> > > > > > +		reg = <2>;
> > > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > > +		function-enumerator = <2>;
> > > > > > +		linux,default-trigger = "none";
> > > > > > +		default-state = "off";
> > > > > > +		label = "green";
> > > > > > +	};
> > > > > > +
> > > > > > +	led@3 {
> > > > > > +		reg = <3>;
> > > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > > +		function-enumerator = <1>;
> > > > > > +		linux,default-trigger = "none";
> > > > > > +		default-state = "off";
> > > > > > +		label = "blue";
> > > > > 
> > > > > Likewise, why is this blue?
> > > > 
> > > > This should be changed to:
> > > > color = <LED_COLOR_ID_BLUE>;
> > > > 
> > > > > 
> > > > > > +	};
> > > > > > +};
> > > > > > +
> > 

---
Thank you for the review!
Hongyang


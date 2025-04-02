Return-Path: <linux-arm-msm+bounces-53026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A856BA78D51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F3716BC23
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F7623815B;
	Wed,  2 Apr 2025 11:41:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB323816A;
	Wed,  2 Apr 2025 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594077; cv=none; b=dsfyZISqmaBWSkoLsLRxrEOGMR4Az13qBRC5uni3HVbrithQonSyrwOdCNadO0TfwCu+BNF9QUWyfU1UWU4QSzlS0BbymjgJXycjfe/+lVQYTIi6SPYGL8Tlc8DowDA+/Ky37ki/SOH8s8QxjVTaMlGJNWiYf1C7KaLik76bc+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594077; c=relaxed/simple;
	bh=BYKiHZs8fdAgXoz5MbtxHispejZm5Oh1LIJHg80TC0U=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=NTtqGs5dBwVJ94r5jR9t1bRvI3XumKoXhmiU/4dwjR83nNYKmPD7UF0Qn4EFkOafESEzzEKTT9LDEJNITiY63nQA7mpHb1Xhk/O9iBYREUREXVSOBMYCLk7DxpTsogO6At8tCXrG3RXz5gbmY5AYOkHwARiHEvNJ8obr7Wfytuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNH75fKSz5B1J6;
	Wed,  2 Apr 2025 19:41:07 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 532Beuck066915;
	Wed, 2 Apr 2025 19:40:57 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:41:00 +0800 (CST)
Date: Wed, 2 Apr 2025 19:41:00 +0800 (CST)
X-Zmail-TransId: 2af967ed224c2c8-28bb5
X-Mailer: Zmail v1.0
Message-ID: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>, <robert.marko@sartura.hr>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMC81XSBVc2UgZGV2X2Vycl9wcm9iZSgpIGluIHBoeQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 532Beuck066915
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2253.002/4ZSNH75fKSz5B1J6

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use dev_err_probe() to simplify the following code
sequence:
  if (err != -EPROBE_DEFER)
      dev_err(dev, ...);
  else
      dev_dbg(dev, ...);
  return err;

Zhang Enpei (5):
  phy: allwinner: phy-sun50i-usb3: Use dev_err_probe()
  phy: broadcom: phy-bcm63xx-usbh: Use dev_err_probe()
  phy: qualcomm: phy-qcom-ipq4019-usb: Use dev_err_probe()
  phy: lantiq: phy-lantiq-rcu-usb2: Use dev_err_probe()
  phy: rockchip: phy-rockchip-typec: Use dev_err_probe()

 drivers/phy/allwinner/phy-sun50i-usb3.c     | 8 +++-----
 drivers/phy/broadcom/phy-bcm63xx-usbh.c     | 8 +++-----
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c    | 8 +++-----
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
 drivers/phy/rockchip/phy-rockchip-typec.c   | 8 +++-----
 5 files changed, 15 insertions(+), 25 deletions(-)

-- 
2.25.1


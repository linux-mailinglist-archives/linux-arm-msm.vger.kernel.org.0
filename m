Return-Path: <linux-arm-msm+bounces-14832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F8886BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907742833EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E743FBBD;
	Fri, 22 Mar 2024 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrVVcElj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C45E3FB96;
	Fri, 22 Mar 2024 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711109813; cv=none; b=AWjqrT3Lk9olzZcVfEBuCl1cQtav8rl1fTBRY/hMr+QQXG7MRAPLcRFdWngeWMsI7F3FVyOBHB25XnTSU9DxfAHaelY1LovF/tr+MbFWEHfxaXLXr66FGN1NwrthA5a2X8GDo1Yms4+ksH3l+WMBSiwJp9SdCcx2U9oOVf0nCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711109813; c=relaxed/simple;
	bh=6GbJsWGxmFtiBWmID7ZFlMBCVqgL6q207WuWB63+Ji0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBmHCgPe1cvZp3s7eT7K+c6IXiguWWtRQvJ/s+ffQK1ttSI9I98eoGphiqEI2E/DNWawxgGdhpf/e8Ak6cNzfVDW3eoRIIs3Uc3kiWEWt6XZC5jOalUbschGXUIgGIMpxJpkEFba6jRtERnUDrBtlOd0bbg2NQJWamQ8RHR0nSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrVVcElj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE76C433C7;
	Fri, 22 Mar 2024 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711109812;
	bh=6GbJsWGxmFtiBWmID7ZFlMBCVqgL6q207WuWB63+Ji0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrVVcEljuMJXYQRaXgOJGHKs8+jNX9m4vK/ircw3UZT8N3o9wQPAqrh99iwAbsjXi
	 qJg3a83KXLRK3HjvFFYuUYBBeak2W5BxCORHt8d9IE8tL7x3bCy6lB6MpF2+ffvC2U
	 ehKIfiNfyEIzQ2xtr4+FlL56eA72cTjqRndntLdnIQvycbbNWIo0PRq85DQqp2X7I8
	 RpKYtDHRPpeYSsCW+BkwPai+s/5wz9MdaJ1h2Y6qRywwQYjBIXaA+z+A++PJ0merLj
	 INl/5gPPoUQepHzRnPs+10OlQ7+QoYnj0LqoKUQhNJLRE99mPFOypRGnogc55pk45o
	 ncd1yPaYpKAKg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rndpV-000000000Tv-3RBX;
	Fri, 22 Mar 2024 13:17:01 +0100
Date: Fri, 22 Mar 2024 13:17:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: typec: ucsi: fix several issues manifesting on
 Qualcomm platforms
Message-ID: <Zf12vSHvDiFTufLE@hovoldconsulting.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:10AM +0200, Dmitry Baryshkov wrote:
> Fix several issues discovered while debugging UCSI implementation on
> Qualcomm platforms (ucsi_glink). With these patches I was able to
> get a working Type-C port managament implementation. Tested on SC8280XP
> (Lenovo X13s laptop) and SM8350-HDK.

> Dmitry Baryshkov (7):
>       usb: typec: ucsi: fix race condition in connection change ACK'ing
>       usb: typec: ucsi: acknowledge the UCSI_CCI_NOT_SUPPORTED
>       usb: typec: ucsi: make ACK_CC_CI rules more obvious
>       usb: typec: ucsi: allow non-partner GET_PDOS for Qualcomm devices
>       usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even further
>       usb: typec: ucsi: properly register partner's PD device

>       soc: qcom: pmic_glink: reenable UCSI on sc8280xp

I just gave this series a quick spin on my X13s and it seems there are
still some issues that needs to be resolved before merging at least the
final patch in this series:

[    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
[    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
[    7.883493] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
[    7.883614] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
[    7.905194] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
[    7.905295] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
[    7.913340] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
[    7.913409] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)

I see these errors on boot both with and without my charger and ethernet
device connected. 

I'm afraid I won't have to time to help debug this myself at least for
another week.

Johan


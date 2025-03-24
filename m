Return-Path: <linux-arm-msm+bounces-52369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A97A6E08F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 18:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5EC1720FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494F1263C75;
	Mon, 24 Mar 2025 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b="WfIBASoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5E2641E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742835966; cv=none; b=FMQIsXvw3mDaJctdawCjfp++2CqN64FXgzpN4NKeA1/gL5YCPZBLrqMEVkcwFkYU7jfhhfq65VpV4kC9ZGa1yV44iZIo/2H6xqpfuqykH6kKKg1t8TgCZCOkIhYwE5H1k/f0OzmaNTi32GY/ts1041Ri/etDdY3eZj9NQdrGy2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742835966; c=relaxed/simple;
	bh=tmqHuzhAZXTG4eAuu0ZnQgAzD2ivCoMGn/5U74rRFp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OakGQOd0VZf+dEdnKGgEtABuMZ5l+dMTfQ/hieL2/uhd0VTci65h3wNdDMRHsZaVR5C3lluoth8IOmkZkAOGDHxBlcWpnW7jugZcgG0bUlwfaK/vsuhc4MJeyEQ8RTusa1J/0uEgbo2RkeDTnnucymHRkxgQwRdaOt5ZgpLC1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=craftyguy.net; spf=pass smtp.mailfrom=craftyguy.net; dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b=WfIBASoi; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=craftyguy.net
Message-ID: <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1742835951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0MUSaxC+hQA+rUwUSVWGGTFbI21s/8Et44mf+YXe3o=;
	b=WfIBASoiCff/K2GUmPuwz0CoE4OwEWKBKn3IQq+nmjO+FBltsURxhaGA4Vl/fjgP+DY+IJ
	eEY+5l6QH8RwNHHD0sJYmdvftHUB765X+GWF3OdpXYV+wRyOW27SDL4+me6h+nn5ixVq12
	hbZU0RxRulGKzcSH3gy4cXzzygj9Q5sEIviMkDivvFOuV2p/JRVMxoOvDTkAJEqjD6cBXH
	8xxTDARNCpIjG2UhXGpPqSmNX04DjWEh5f6z+W4DbHfzyLSW42oYghSM8sECjYcOCk84so
	IfaPIQUfDIbk7Nj33LJ0Cxvs/D5kRSMoiOvWSvg0yNeDj1EOnuJG9kgpm3Fg7A==
Date: Mon, 24 Mar 2025 10:05:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250324132448.6134-1-johan+linaro@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Clayton Craft <clayton@craftyguy.net>
In-Reply-To: <20250324132448.6134-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/24/25 06:24, Johan Hovold wrote:
> The PMIC GLINK driver is currently generating DisplayPort hotplug
> notifications whenever something is connected to (or disconnected from)
> a port regardless of the type of notification sent by the firmware.
> 
> These notifications are forwarded to user space by the DRM subsystem as
> connector "change" uevents:
> 
>      KERNEL[1556.223776] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
>      ACTION=change
>      DEVPATH=/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0
>      SUBSYSTEM=drm
>      HOTPLUG=1
>      CONNECTOR=36
>      DEVNAME=/dev/dri/card0
>      DEVTYPE=drm_minor
>      SEQNUM=4176
>      MAJOR=226
>      MINOR=0
> 
> On the Lenovo ThinkPad X13s and T14s, the PMIC GLINK firmware sends two
> identical notifications with orientation information when connecting a
> charger, each generating a bogus DRM hotplug event. On the X13s, two
> such notification are also sent every 90 seconds while a charger remains
> connected, which again are forwarded to user space:
> 
>      port = 1, svid = ff00, mode = 255, hpd_state = 0
>      payload = 01 00 00 00 00 00 00 ff 00 00 00 00 00 00 00 00
> 
> Note that the firmware only sends on of these when connecting an
> ethernet adapter.
> 
> Fix the spurious hotplug events by only forwarding hotplug notifications
> for the Type-C DisplayPort service id. This also reduces the number of
> uevents from four to two when an actual DisplayPort altmode device is
> connected:
> 
>      port = 0, svid = ff01, mode = 2, hpd_state = 0
>      payload = 00 01 02 00 f2 0c 01 ff 03 00 00 00 00 00 00 00
>      port = 0, svid = ff01, mode = 2, hpd_state = 1
>      payload = 00 01 02 00 f2 0c 01 ff 43 00 00 00 00 00 00 00
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Cc: stable@vger.kernel.org	# 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Reported-by: Clayton Craft <clayton@craftyguy.net>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> Clayton reported seeing display flickering with recent RC kernels, which
> may possibly be related to these spurious events being generated with
> even greater frequency.
> 
> That still remains to be fully understood, but the spurious events, that
> on the X13s are generated every 90 seconds, should be fixed either way.

When a display/dock (which has ethernet) is connected, I see this 
hotplug change event 2 times (every 30 seconds) which I think you said 
this is expected now?

> UDEV  [236.150574] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [236.588696] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [266.208175] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [266.644710] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [296.243187] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [296.678177] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [326.276256] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> UDEV  [326.712248] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)

Not sure about you seeing it every 90s vs my 30s... anyways, I no longer 
see these events when a PD charger is connected though, so this patch 
seems to help with that!

Tested-by: Clayton Craft <clayton@craftyguy.net>


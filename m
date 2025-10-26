Return-Path: <linux-arm-msm+bounces-78797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CDC0A21D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 04:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06BA518A5F5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 03:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1F262FC7;
	Sun, 26 Oct 2025 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlCVClqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168F770FE;
	Sun, 26 Oct 2025 03:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761448392; cv=none; b=V0HMiLcr7/e9t+Z42g3WGpeqfSDbiMirukJaoycY5JkJQ7U//GkvrztVpbj6KUpUaGVTaRfJ/iwTZCbvBxTnXM6UGtAFJllnaMbae+VG3mdC96eTqZyPq5km2mOId6WKWPTsiAEVq85TNyOxeNWvDi5rWzj8oxIZkfu2G8f3lO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761448392; c=relaxed/simple;
	bh=V3g0/JYpPQppqk41TDgRZ9KjYVAz6NYrBYIgKBOnrj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5WHV1fTkSvcy67YwYelaTT5A9SAUUSzYYGAzX7YsIDut2ThXTEWI1wcrglzlAGR5onaOUPo5khCLIXsMuGH0ChlEgbMVwEfbCyN5b/vrx4ZNyJf2nTL0jXj6V1VnCn4jHxSdVQnkTE8RYo4X4/iqMYg01MfDIVYMV7hqYVpmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlCVClqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CE8C4CEFD;
	Sun, 26 Oct 2025 03:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761448391;
	bh=V3g0/JYpPQppqk41TDgRZ9KjYVAz6NYrBYIgKBOnrj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlCVClqu3swF/vH5r2PaTITugVfh5FaPKTgq0u8P+5GMmuZV6jV2A4taoNWIOrxVB
	 QIsGrWWqniXSM5Em1GFw6dl1ScT6UiMm4Hq8yTYks8ZioksruAJSBRmKZFv03QG4Oh
	 7ogT9uJBq9GF9iP3gM0+XGjpLiObHoLXoNfCmAaTrQbXIU32kexqoN4xE4QRHK/z5M
	 gO3EBmsivRJm7j+UBr2KblO5/wq1hjUm60jvfQKo6yHg18Px0L0nsDtTPv2vgQlQXs
	 0z0i0E+nAIgLvHrJwvCOOGvT/Y/TY5s4lh5n1GguHrflBlEl0VL0CaNGQtGOzAmoct
	 /BhdipKku36uA==
Date: Sat, 25 Oct 2025 22:15:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Rakesh Kota <rakesh.kota@oss.qualcomm.com>, 
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: enable pwm rgb leds
Message-ID: <nepbosujmpldx5exylkqjylonntj6v3p4jnnoyxstmbmilb7jc@t65dwpxzorg7>
References: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
 <cb973808-005e-4920-a35b-3f02a402a78b@oss.qualcomm.com>
 <ada950ed-7b51-4e62-93ff-550c427a73fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ada950ed-7b51-4e62-93ff-550c427a73fa@oss.qualcomm.com>

On Tue, Oct 21, 2025 at 02:29:22PM +0800, Tingguo Cheng wrote:
> 
> On 10/17/2025 4:09 PM, Konrad Dybcio wrote:
> > On 10/17/25 10:06 AM, Tingguo Cheng wrote:
> > > Add red, green and blue LED channels for the RGB device connected to
> > > PMC8380C PWM-LED pins.
> > > 
> > > Signed-off-by: Tingguo Cheng<tingguo.cheng@oss.qualcomm.com>
> > > ---
> > Just to make sure, is this a "multicolor LED" consisting of 3 ones,
> > and *not* three LEDs that are supposed to communicate different
> > functions (i.e. network, power, disk i/o)?
> Yes, it's a multicolor LED composed of three individual LEDs within a single
> package—not three separate LEDs for different functions like network, power,
> or disk I/O.
> However, there's one exception worth mentioning:
> The blue channel is connected to two sourcing signals—the EDL indicator and
> the PMIC PWM-RGB blue LED—via two resistors. These resistors allow selection
> between the two sources.
> By default, the board is configured with the resistor soldered to connect
> the blue LED to the EDL indicator.
> To support software control, I’ve added the blue channel in the DTS,
> enabling the capability to light the blue LED from the software side.
> Some developers may choose to re-solder the resistor to connect the blue LED
> to the PMIC PWM-RGB output instead, depending on their hardware setup.

Sounds like we have a RG LED, and if the user chooses to modify their
hardware, they have different hardware...which they can easily describe
by updating their DeviceTree.


It's a bit weird, but does it work to make this LED_COLOR_ID_MULTI with
just the RED and GREEN channels described?

Regards,
Bjorn

> > Konrad


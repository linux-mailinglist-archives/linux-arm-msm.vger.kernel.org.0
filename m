Return-Path: <linux-arm-msm+bounces-49823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C7A4926C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BE616E7B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD871AD3F6;
	Fri, 28 Feb 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+t4VKxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B84276D12;
	Fri, 28 Feb 2025 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728889; cv=none; b=a6jBhBIWs5VmpnMLizKhawnnglD0jsVp9xlgxe34d1bPQ8tkjyGQCtRA9O7PrF/TVRXz6en54u7EFH0l4Za1jn6wTekAeRgl+4C1lnDc30aNjo2PiSWq6HonbSvlOhHr2vUYu50+KXgjRtLXTTmwMy7KwwHUisSdbwARE2iIN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728889; c=relaxed/simple;
	bh=HGpFNQkVjQxJJSTRdgfAfdyHw8/IugCBpe8cfIEU9HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqWSSrFLoTbvUOVh2FeN4vY+EmsNg36Spgu5NaBs7atr4nU454Ris8UyHkJHrl0vevL78BkquAjaKLnoEi+s5PDrJEI7jP2UWgQTUyseyL54sGSA/1q5afup+MD47J1ge37+EIJibEFPJr1kb70LnUVHLDw4RraP/ROzPZqRxag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+t4VKxl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCB5C4CED6;
	Fri, 28 Feb 2025 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740728888;
	bh=HGpFNQkVjQxJJSTRdgfAfdyHw8/IugCBpe8cfIEU9HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+t4VKxl6N336f3UvXWqZ7t3qEC8vaz8f+98vpwatU4Vw9yJTxvjUZ7ptJLIfvIoh
	 ovDBmpyuVoJhMMID/nGlLfaUIhB9hGT43nhkKF3Cm6IblywQkSV3rZuzW3H2f05T8x
	 IK8KBufVbG5utOIlzeEgGdLHaUaABgGLt6tE07qdJLPVzmGzkwLPdc6612+Bq1S8ad
	 pXYKMpv22HW4yTRzWnzYZTYC2U+9Oq40WT8lzs97Ak3b9Oi+5oxMQn4okbR4o3AITF
	 yjcBrf0G+lgNPiBNe/vexPhnIl3AQOC8bcxPkTdOUUXvjIX6drwquDzL481SleXkEs
	 AhNi+MejdK0nw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnv6c-000000000MQ-2JWK;
	Fri, 28 Feb 2025 08:48:22 +0100
Date: Fri, 28 Feb 2025 08:48:22 +0100
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
Message-ID: <Z8FqRmGeQMejGLXY@hovoldconsulting.com>
References: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>

Hi Jens,

On Wed, Jan 22, 2025 at 07:41:56AM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
> 
> This specifically means that the RTC time will be synchronised between
> the UEFI firmware setup (or UEFI shell), Windows and Linux.
> 
> Note however that Windows stores the RTC time in local time by default,
> while Linux typically uses UTC (i.e. as on X86).
> 
> Based on a patch by Johan Hovold. [1]
> 
> Link: https://lore.kernel.org/all/20250120144152.11949-7-johan+linaro@kernel.org/ # [1]
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This is a patch to switch the Windows Dev Kit 2023 over to
> using the UEFI offset.

Please try to avoid posting patches before their dependencies have been
merged, but at least mention any such dependencies in the cover letter
(or here under the --- line).

The series this patch depends on has now been superseded with a v2
dropping the DT property so this one will also need a respin once the
driver changes have been merged:

	https://lore.kernel.org/all/20250219134118.31017-1-johan+linaro@kernel.org/

Johan


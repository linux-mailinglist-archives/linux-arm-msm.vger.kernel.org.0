Return-Path: <linux-arm-msm+bounces-57246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F28AAFA5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 101277B3DF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC37228C9D;
	Thu,  8 May 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ux5YbSG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF0450FE;
	Thu,  8 May 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708442; cv=none; b=V9JaeDJQp78F9uNwWf7xEom5eotqI1GrHu6+CBzrIj1iqf2ABQ8VX1ivIUjT78LSVwLDLz8YGDsOgWpC4cW/5n7YuCplPJMUvDP4P3YhV3CzH/1N1qCJjlCRtbI/xUu6NQXEcy+zg3jCAkJUwLjEngeJgmeBvvnuOtbGHGXT/sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708442; c=relaxed/simple;
	bh=WQ+dEDqE0N4Ce2haP45gqtTO7ovSbiUniZK7xBrS4iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5gC32RHOG8xZQG/H9PJkb99DG13B3LLK239emMTNrKqaFpmYL+FT6y0I+PNxPu+7HM2aU17vtRRuaKFaqlE0ryDWx1zP1mLK4tqQZ7o0ao1/bAhWidMG03t7XP3JrsrF28VSobyCaCV2uB6zTMFVQeNjPWyHgL1FtktEBxoYV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ux5YbSG1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5556C4CEE7;
	Thu,  8 May 2025 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746708440;
	bh=WQ+dEDqE0N4Ce2haP45gqtTO7ovSbiUniZK7xBrS4iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux5YbSG16TdrjVtHpRaK020glxBTpaVeER+Ns6XdTBLDMUps0ttWqUo1PGmQphdg7
	 ADG573kjB0SyamQ+n9lPpMDIIxvLbx6kD+Rf4Iqcc0MPVOfr48OBa+6oEmCLBJD+bx
	 Pgu6iUDyuZkrFMqTZQXGq5/6ZpO406zoyWTwk2ZAVse9cI8AvINCsMPDwCVuxhzN4Y
	 TmtDdp07Hfv2ksJ7fFr2jaN7E+ujletYumspj/gfrvU74LhCCfjOBJWPJ9psnNuHKa
	 BY870FGeF9qEYOmbVYLpSJCrmBcVndM9k/J2YmwEg1O9EsQmjfwopdxhTxhNzzpSJB
	 1jZD0fFJ9n+Pw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uD0ek-000000004Vm-2CAw;
	Thu, 08 May 2025 14:47:18 +0200
Date: Thu, 8 May 2025 14:47:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: x1e78100-t14s: Enable audio
 headset support
Message-ID: <aByn1mnsClCquBSh@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-7-srinivas.kandagatla@linaro.org>
 <Z-zweM9llVE-bzYc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-zweM9llVE-bzYc@hovoldconsulting.com>

Hi Bjorn,

On Wed, Apr 02, 2025 at 10:08:24AM +0200, Johan Hovold wrote:
> On Thu, Mar 27, 2025 at 10:06:33AM +0000, Srinivas Kandagatla wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > On Lenovo ThinkPad T14s, the headset is connected via a HiFi mux to
> > support CTIA and OMTP headsets. This switch is used to minimise pop and
> > click during headset type switching.
> > 
> > Enable the mux controls required to power this switch along with wiring up
> > gpio that control the headset switching.
> > 
> > Without this, headset audio will be very noisy and might see headset
> > detection errors.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> 
> Looks good and both playback and recording works fine:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Assuming the mux change will make it into 6.16 now, can you pick this
one up as well?

Johan


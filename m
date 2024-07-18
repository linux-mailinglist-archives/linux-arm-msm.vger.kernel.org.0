Return-Path: <linux-arm-msm+bounces-26551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C71934C8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 13:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42931C21EEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 11:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AB3137775;
	Thu, 18 Jul 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLg5JSBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7725612F375;
	Thu, 18 Jul 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721302125; cv=none; b=kUl3dw7QOeeiO1tSlJOpNxEpu0TO1pMb5vg8aZ9xJgwjzGlQuHZDctzhEYUTkNqStYkv2Xtmy3p0AcciXo5dxqKw6Wm0S3ggQ6UkTZq9DI4yEVftSElRQoXaKjgW5imTI8IEDFJWSskWGNz8OoH8r79MfaALH2cOuUqsmJEj+Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721302125; c=relaxed/simple;
	bh=7l7LByKCLsDtojUYBtdwXF6/DC3o7m5MOam0KmswIzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGAapispVSOQRFup0tZ4XDEzmmlJd9q0wDUCzFfi8tzAbnSk1JqAui6LeZlhrQztQdzFHaqAvsixht64H3S7K8GjeSpPUqIa57LDlDkLvVs5Wli/35ZtfSlXj2QCuYlkB4mggV0kZYlni/U+Vhy1x5+vx6pQkGunVD6dk00o0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLg5JSBl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FAAC116B1;
	Thu, 18 Jul 2024 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721302125;
	bh=7l7LByKCLsDtojUYBtdwXF6/DC3o7m5MOam0KmswIzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLg5JSBl/dLrxBn68XvlPOKfW19BYKmCkqR+S3BNSrdzDkeMpDttxDSdEuLq+z6Kj
	 JIeI86++JAfA5gXakAsRdoJNFyR2qp+hj87pixFdodeR3qFOSH4q5VS2TA4ByKxfIp
	 tTwlREH4TClCbvr1QbPWwoVKwDt4SZR+qMRaqifcLX03SSIS2wmFPl8AlNEezDghLO
	 TOLTb42ei6zL4tkvHR//FOcYYTYUt7xUgXBXxLrLbXRGplIMk4mNbwbmJUEm9diKaO
	 XZm+Vhq5jQm8IgxGtO7XAHCoeBfsqxbcc9gTp9yO4n1+DfWQo3qFdFXoulg6TtBULI
	 hh/1tKzKtMhFg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sUPJZ-000000002hi-2Fv3;
	Thu, 18 Jul 2024 13:28:49 +0200
Date: Thu, 18 Jul 2024 13:28:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add Broadcast_AND region in
 LLCC block
Message-ID: <Zpj8cWfcqYj8rUOP@hovoldconsulting.com>
References: <20240718-x1e80100-dts-llcc-add-broadcastand_region-v1-1-20b6edf4557e@linaro.org>
 <39df7ff4-7f22-4715-a0f7-eb2475bd7b55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39df7ff4-7f22-4715-a0f7-eb2475bd7b55@linaro.org>

On Thu, Jul 18, 2024 at 01:20:37PM +0200, Konrad Dybcio wrote:
> On 18.07.2024 12:20 PM, Abel Vesa wrote:
> > Add missing Broadcast_AND region to the LLCC block for x1e80100,
> > as the LLCC version on this platform is 4.1 and it provides the region.
> > 
> > This also fixes the following error caused by the missing region:
> > 
> > [    3.797768] qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)

Please say something about this error only showing up in linux-next,
which has 055afc34fd21 ("soc: qcom: llcc: Add regmap for Broadcast_AND region"
region")).

> > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Please fix the commit title

And that.

Johan


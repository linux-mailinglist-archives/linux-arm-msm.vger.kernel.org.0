Return-Path: <linux-arm-msm+bounces-31950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C06DD97BA1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 11:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D89C1F22409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 09:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9997178363;
	Wed, 18 Sep 2024 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLrEY4+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC131547E1;
	Wed, 18 Sep 2024 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651756; cv=none; b=JHfy80Z+FsQOMrCVQBJlFlTkDWSa6yYQ/DUvOGiFWWv/meV/0KrE+SwukGnyuq3YQb+jmWRk9zfS4Kp740BbDqBcAPIqRvJUXRs2zXqD/KnUK9kLE8aYDo3DOT1AqCDVRyJKkE9Mw2nP722nXPmUIQ53GHO5JINS057b8q7EDdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651756; c=relaxed/simple;
	bh=49jKeQJsL3Uv3oaN2Hnvr9pW2xAjMqMoWaw0AEwgOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgc4WhpqXL6aL0EBXgjOA0ubb0xilnU1g0ke59pAzzisH2XbyHd4BjGohcUL238ciUp8BOFRL8tQr0KU47uid8rOCyeP9HdkPpUvwMm/1pBpmDl5rlP/eCKtjsR7XXkH31w/soKdPzUJrvk+T0gQg3qdrvKnYFMEOGzUiVNWD/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLrEY4+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16635C4CEC3;
	Wed, 18 Sep 2024 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726651756;
	bh=49jKeQJsL3Uv3oaN2Hnvr9pW2xAjMqMoWaw0AEwgOPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLrEY4+Q9HW3zyAIxZI9mXVDnMMLfWsld4aGYOLrhgrZk/ymrg/rr8DPtYrY5dUJ/
	 CDJXwM5xWspG11bw1VTegTKibhzmgUIkcvylEwNgXmUbERItBqylGAacFSYds4FtAs
	 S2UIU1OowvXHKubP2h5SLA++xLCvhSBGeunyQtetjHZa85G4JSifCUlM45spQHpn3I
	 LwBumlaj0v3HcfyrRQJ/NxzBM4Xq1RKe6TaDTpdBmjWWlWYY3MZT0ESNgnejd95Hlj
	 7THB6hD5Hbl63jsdjbTDAYMvmN0A7xTrZdjhK0LUspxnuy+bme8N5d8uXzmUCvuV/j
	 ok9B/3JWTsrcA==
Received: from johan by theta with local (Exim 4.98)
	(envelope-from <johan@kernel.org>)
	id 1sqqzo-000000000st-1qiO;
	Wed, 18 Sep 2024 11:29:12 +0200
Date: Wed, 18 Sep 2024 11:29:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
Message-ID: <ZuqdaOSGeReeWNnV@hovoldconsulting.com>
References: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>
 <5932fc68-3afd-448b-99b8-65ee9ef5dda6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5932fc68-3afd-448b-99b8-65ee9ef5dda6@kernel.org>

On Wed, Sep 18, 2024 at 01:32:34AM +0200, Konrad Dybcio wrote:
> On 17.09.2024 5:00 PM, srinivas.kandagatla@linaro.org wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
> > at I2C address 0x2c add this to be able to get it working on these laptops.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > ---
> > Changes since v1:
> > - moved pinctrl to parent node so that pinctrl can be claimed globally.

> >  &i2c0 {
> >  	clock-frequency = <400000>;
> >  
> > +	pinctrl-0 = <&tpad_default>;
> > +	pinctrl-names = "default";
> 
> You're dropping the QUP pins, please include them too (like in c630.dtsi)

And make sure to CC people that provide feedback on your patches when
respinning.

Johan


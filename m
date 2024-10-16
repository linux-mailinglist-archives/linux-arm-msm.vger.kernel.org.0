Return-Path: <linux-arm-msm+bounces-34550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B5F9A01BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 08:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B931C20BF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 06:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5B193089;
	Wed, 16 Oct 2024 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXtBZ1f1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90724409;
	Wed, 16 Oct 2024 06:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729061512; cv=none; b=EPQ/MVTWM6TjixTLVWIRA9TV/pMlYMw43k+GeNVB/11GOchyNqpGR9kccm2fOlv9/0Rky6ix/51+MMuBYu5ktlqvFhemnSSXAhhRiZXBZLrhBb+t1dmvK8Fisbv3wX2xwmyhb1Z2zaPQtqpTouDyBfEfraUwfIfvl5ug8uVb41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729061512; c=relaxed/simple;
	bh=pzFvSrILNJvs8eutEDR8LLYEf0Fi8x3nXwNhPl2QtOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD1YcX2OEA8WuDgJBf8KWYWDRm/9/8fv4nUVOcDmKxJQNFk6vZaEtqnsgwBBfgPOE1uHF+8ezDsAycaZQ5jf7KPlCUAhupBBh/ITjzi8SHfRTc4sqg589XWXgjtsv0e7PRz6rGbHx1uftYyQIVTXHLzhLbfrfQXIHITRcliP5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXtBZ1f1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E2C4CEC5;
	Wed, 16 Oct 2024 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729061511;
	bh=pzFvSrILNJvs8eutEDR8LLYEf0Fi8x3nXwNhPl2QtOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXtBZ1f12KQdLorzHdASqX85nFLOXJbiBSQhdqlFwqr9pryuYiVOHe7hvRMN0Sb0U
	 25bRym131dP15/7+IpkSjeRP+mrIXk28zzJMx8hLQ5VANWl4mcM+mnldqOTsn00fXX
	 8KCjihGS7Y5OmwpUaegeiG37/8fT8tLh2wo/tn4UikLYmluWX+Ma23S8uuk5TMNveC
	 +tLZTjewTcrma6vzhB62sx/EiCz5l6oPjtgpA2aDLf1EM4uvbQrv/8LohJkQR61LZ9
	 MzBKM/rqZWzRkX5ohCbdCer66SgpoOG6KQARno+b6WZWSeLQ9W0ywA+H60kprMux8+
	 bX2QNHs6xiJCA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0xsz-0000000050C-3qGE;
	Wed, 16 Oct 2024 08:51:57 +0200
Date: Wed, 16 Oct 2024 08:51:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: x1e80100-crd: add rtc offset to
 set rtc time
Message-ID: <Zw9ijUy04cC4Qzio@hovoldconsulting.com>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-5-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015004945.3676-5-jonathan@marek.ca>

On Mon, Oct 14, 2024 at 08:47:29PM -0400, Jonathan Marek wrote:
> See commit e67b45582c5e for explanation.

It's good that you reference commit e67b45582c5e ("arm64: dts: qcom:
sc8280xp-crd: enable rtc") but your commit message still needs to be
self-contained and provide the explanation here in some form (e.g.
quoted or paraphrased).

Also spell out the commit summary in parenthesis when referring to
commits as I did above.

> Note: the 0xbc offset is arbitrary, it just needs to not be already in use.

How did you verify that nothing is using this offset on this platform? I
assume we need someone with access to the docs to make sure it's not in
use as we did for sc8280xp.

Johan


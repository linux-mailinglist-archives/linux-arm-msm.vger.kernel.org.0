Return-Path: <linux-arm-msm+bounces-34551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A259A01D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 08:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398B01C209F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 06:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2221B0F22;
	Wed, 16 Oct 2024 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgT2D2YC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51A170A37;
	Wed, 16 Oct 2024 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729061832; cv=none; b=PebwWRA1JlPAUVqBid0mXw+zjIRppQC08mWsz/6528x4BQfYX/7/bujEP6103ooOC1K5FUdYgs3V6uT3lIyRe9cfILUIim24KODe6KYIEOLuiLab7fPhJhZZC8dJmXpYX+P5XuEDXWHxSw5A0hIekRXJxq+E+OQZLzIpksSMhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729061832; c=relaxed/simple;
	bh=htXNOCBtpgC3Fvk04G3rBBhkx6Ise1PadpLW63t9K1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE6lrPnaGDnJKpxhX2uA3WzydEYof6MUnvyXgeVE1junx5uVTfXzi0GsYjCWIcNEe+GQ50BdoP85PNlQ2oM99noOqCo3yT/l2YN1DY7UPRUya9rpt43wdferw+lsoV9Rt4ApO4QoijtulHj+RtChn6zf4nLi22vSVKnEhXSsjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgT2D2YC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD827C4CEC5;
	Wed, 16 Oct 2024 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729061831;
	bh=htXNOCBtpgC3Fvk04G3rBBhkx6Ise1PadpLW63t9K1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgT2D2YCgs05M8mf4zYo6aW5fwplf9TL3YJyuqm3uJa8nG0THZ8IxyFyW2HQ3Mpxa
	 DjvVxsGIm13lnZvr4S4Y3pvfPN3faE5B1ppZIqpWkDihn6YW3tndxHKjhQHC57Taio
	 d60tHaH4DlXaiv+lF9/9+hWF5m7xR/zXX3/80IUigcXxQGBrzayP2wfeV4LnBSYgrr
	 GS1ofSilA3wJvbXFs5t/52th2NgP8N4d+3ksxCXLhePIyXOk/en+88X3YqQfQabU1B
	 HT4tWGljcDCcyxgbreRWlHVa4vvnUgpwenIeG3pl/kaUACg1vE4PhT/Jmn7TkpJOuv
	 Q6ITpvVBgAqFA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0xyA-00000000566-1Bsg;
	Wed, 16 Oct 2024 08:57:18 +0200
Date: Wed, 16 Oct 2024 08:57:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jos Dehaes <jos.dehaes@gmail.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Rename "Twitter" to "Tweeter"
Message-ID: <Zw9jzn2vEymY2cAd@hovoldconsulting.com>
References: <20241015170157.2959-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015170157.2959-1-maccraft123mc@gmail.com>

On Tue, Oct 15, 2024 at 07:01:56PM +0200, Maya Matuszczyk wrote:
> This makes the name consistent with both other x1e80100 devices and the
> dictionary. A UCM fix was merged already.

I'm not opposed to fixing this, but please say something about what will
break when the kernel and UCM files are not updated in lockstep here.

Johan


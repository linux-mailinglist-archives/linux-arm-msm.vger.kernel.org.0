Return-Path: <linux-arm-msm+bounces-25258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26E9273AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F611B212F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD371AB8F7;
	Thu,  4 Jul 2024 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCQjqfLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E2E1AB508;
	Thu,  4 Jul 2024 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720087693; cv=none; b=D32AvVIzgB+++VcA6+Hfc6/TS5zA7XPVNbaF6mVQQYFIfPBm0hhRNAYUvh1Fzx/jMMJ1eVEap9de5epvyS7tZy/Way96V0TG0EVuQDwDfHLlwlvqA3uIIi0LPraoIjELmimK0/JnkObLyKivyoBzGL3FF2MM3rWGBmWoYdjSS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720087693; c=relaxed/simple;
	bh=4L+j5Nb3YdQBIueSA07q/26gPF/oUqNFVZ1jfZL8ij8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/PkldlddKJyugNZVcELE6/7inlWbnW4iZvk+ZAdMrycV3h8cBsRerjPFItWgnzpkqH13XI5H5zWl2uYpQihty5hN6Ef6YbCCHF9kcWHLhpBkc0QsM6C0aONsi/1gSAzM5HD8bzTJTX+1nAzN5RImJRis8kcUaxYr2/OL0mzdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCQjqfLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EADC3277B;
	Thu,  4 Jul 2024 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720087693;
	bh=4L+j5Nb3YdQBIueSA07q/26gPF/oUqNFVZ1jfZL8ij8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCQjqfLPaxHLmhe3DumLRvPJ9rGhBGH4sSFlDDCYfZ2pLQfZcca1yascUph7jg+hm
	 ZkO8o2yMQj6EuPl99C6k9mJUtrcx5hSmhCRmnvyDVhhdEhbiPo7sU9Q3VYYnVd3sqT
	 d+QAQ9lUs0aih2fyXnkh0XBZxa54CzaTnVYhBP9kA8qaYtlYeSbWJplWUk2J/mIf+d
	 gKLo7pvBQWbTrys4teWQZKx/vQwPI/TIZVdxbH6T52TlsdTCFoJp5j033VA9c7Yh6I
	 gnLGuu5gMUzx8ojovcsGKBTeXdcEKjP1QjHYIN1u+/UPlkor8tPM8pVuvwXPpLIEYX
	 DBG1+y+PVfcrA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sPJNt-000000007p9-0V98;
	Thu, 04 Jul 2024 12:08:13 +0200
Date: Thu, 4 Jul 2024 12:08:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] serial: qcom-geni: fix soft lockup on sw flow
 control and suspend
Message-ID: <ZoZ0jSbohdYAqY4E@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-3-johan+linaro@kernel.org>
 <CAD=FV=UauWffRM45FsU2SHoKtkVaOEf=Adno+jV+Ashf7NFHuA@mail.gmail.com>
 <CAD=FV=XPKqjMcWhqk4OKxSOPgDKh-VM4J4oMEdQtgpFBw8WSXA@mail.gmail.com>
 <ZnvJQDX6NkyRCA8y@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnvJQDX6NkyRCA8y@hovoldconsulting.com>

On Wed, Jun 26, 2024 at 09:54:40AM +0200, Johan Hovold wrote:
> On Mon, Jun 24, 2024 at 02:58:39PM -0700, Doug Anderson wrote:

> > 1. The function is named qcom_geni_serial_clear_tx_fifo() which
> > implies that when it finishes that the hardware FIFO will have nothing
> > in it. ...but how does your code ensure this?
> 
> Yeah, I realised after I sent out the series that this may not be the
> case. I was under the impression that cancelling a command would discard
> the data in the FIFO (e.g. when starting the next command) but that was
> probably an error in my mental model.

I went back and did some more reverse engineering and have now confirmed
that the hardware works as I assumed for v1, that is, that cancelling a
command leaves data in the fifo, which is later discarded when a new
command is issued.

> > 3. On my hardware you're setting the FIFO level to 16 here. The docs I
> > have say that if the FIFO level is "less than" the value you set here
> > then the interrupt will go off and further clarifies that if you set
> > the register to 1 here then you'll get interrupted when the FIFO is
> > empty. So what happens with your solution if the FIFO is completely
> > full? In that case you'd have to set this to 17, right? ...but then I
> > could believe that might confuse the interrupt handler which would get
> > told to start transmitting when there is no room for anything.
> 
> Indeed. I may implicitly be relying on the absence of hardware flow
> control as well so that waiting for one character to be sent is what
> makes this work.

I'm keeping the watermark level unchanged in v2 and instead restart tx
by issuing a short transfer command to clear any stale data from the
fifo which could prevent the watermark interrupt from firing.

Johan


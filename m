Return-Path: <linux-arm-msm+bounces-1374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7507F3104
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD4C4B213C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EAA3986D;
	Tue, 21 Nov 2023 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXydgTaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4333C3B;
	Tue, 21 Nov 2023 14:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9156CC433C7;
	Tue, 21 Nov 2023 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700577323;
	bh=lzjdq+xR1tjd5//XRTySWMSukAT4qx2YCGmo6ZbzhGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXydgTaEmXbfaj7JDcggt+Bmu+BXvOM6FORELUn5GgCT9o2pfn+AgeulbjOZoVnC+
	 7hZGdDBsd8q5EUCHWfWm7ZB8NSSRRr1qDELwQCSkXRDQvVP6Efa3cjQCFm92hYXJEL
	 zPqzyaIU+kCTMnauyAQ0P2qfld2mFrXTi7z32RJQGyC9zxQHx60mKxQN2rDM0FoCCH
	 tZZJDLv/+fSH71lA58r14TXL5FG1I7N+5kjD6KRub3cEUsl2fmPmaC6NI9fdtW1Vmd
	 gdsaoIqqARCGnpLNH+7rjCdmx9JO6gLvZulebdC1IG5HvnYDUxH2NvP7Krg6g+kwPS
	 6XRUtHBa09OTQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5Rqh-0005lu-0x;
	Tue, 21 Nov 2023 15:35:35 +0100
Date: Tue, 21 Nov 2023 15:35:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/3] USB: dwc3: qcom: fix wakeup after probe deferral
Message-ID: <ZVzANwndkuzhBOiO@hovoldconsulting.com>
References: <20231120161607.7405-1-johan+linaro@kernel.org>
 <20231120161607.7405-3-johan+linaro@kernel.org>
 <pgmtla6j3dshuq5zdxstszbkkssxcthtzelv2etcbrlstdw4nu@wixz6v5dfpum>
 <3ff65t36p6n3k7faw2z75t2vfi6rb5p64x7wqosetsksbhhwli@5xaxnm7zz4tu>
 <ZVx1wRefjNaN0byk@hovoldconsulting.com>
 <0b627853-78fb-4320-84e4-f88695ac6a9e@quicinc.com>
 <ZVy1kAslWYOQ6n9q@hovoldconsulting.com>
 <ac838113-501a-4f2b-b858-c59f586a9f35@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac838113-501a-4f2b-b858-c59f586a9f35@quicinc.com>

On Tue, Nov 21, 2023 at 07:38:18PM +0530, Krishna Kurapati PSSNV wrote:
> >>    Just one query. Even if it wakes up after closing the lid and removing
> >> the mouse, wouldn't pm suspend be triggered again later by the system
> >> once it sees that usb is also good to be suspended again ? I presume a
> >> laptop form factor would be having this facility of re-trigerring
> >> suspend. Let me know if this is not the case.
> > 
> > No, we generally don't use opportunistic suspend (e.g. unlike android)
> > so the laptop will not suspend again.
> > 
> > So this is an actual bug affecting, for example, the Lenovo ThinkPad
> > X13s.

> Thanks for the clarification. I was thinking in android perspective 
> only. But if we don't wake up the system upon disconnect, wouldn't the 
> controller still be under the assumption that device is connected when 
> it is actually not and only realise this when we resume later ?

Correct.

Johan


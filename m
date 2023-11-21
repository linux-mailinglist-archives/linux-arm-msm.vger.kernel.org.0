Return-Path: <linux-arm-msm+bounces-1356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B77F2F35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747091C21744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 13:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD6D537F1;
	Tue, 21 Nov 2023 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Clrx6vhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F19524CD;
	Tue, 21 Nov 2023 13:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9A7C433C9;
	Tue, 21 Nov 2023 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700574596;
	bh=vF4LkQLYcuqRQJyYUrQVjvPfs/5O3qig6tC9j8drZog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Clrx6vhzFPyv2yohZc47Qd06hxwulyJMXR0zF8G9mAcsExaH8j4bz0DLhcFG1fY46
	 h7G5U5C5rx1d3pE3of9XMYTBQAyoIBodIfiakp1AYhJGa+DSnJC+86JgjLmP0qmT8v
	 2QLaWXUwtfguQs4vf/7TMEt+cZBL+A7BEE5ROpl5seJ/9/x7xn0E8w0elP4pStnTar
	 G4iDjBKIl0lBh3K15cykqYtWH+xjDv01/F+GxJN4Hl2HuaIEtsn4zBs02BMikWMMkf
	 MsMUYD1FEeYJXX0/2lPrQ39Um2EYCL+YBp3pIYrw81TomowSnX1QJYszstRjcKySai
	 6IguUM2/CCpDw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5R8i-0004sr-2u;
	Tue, 21 Nov 2023 14:50:08 +0100
Date: Tue, 21 Nov 2023 14:50:08 +0100
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
Message-ID: <ZVy1kAslWYOQ6n9q@hovoldconsulting.com>
References: <20231120161607.7405-1-johan+linaro@kernel.org>
 <20231120161607.7405-3-johan+linaro@kernel.org>
 <pgmtla6j3dshuq5zdxstszbkkssxcthtzelv2etcbrlstdw4nu@wixz6v5dfpum>
 <3ff65t36p6n3k7faw2z75t2vfi6rb5p64x7wqosetsksbhhwli@5xaxnm7zz4tu>
 <ZVx1wRefjNaN0byk@hovoldconsulting.com>
 <0b627853-78fb-4320-84e4-f88695ac6a9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b627853-78fb-4320-84e4-f88695ac6a9e@quicinc.com>

On Tue, Nov 21, 2023 at 06:25:37PM +0530, Krishna Kurapati PSSNV wrote:

> > Specifically, I consider the current implementation to be broken in that
> > it generates wakeup events on disconnect which is generally not want you
> > want. Consider closing the lid of your laptop and disconnecting a USB
> > mouse before putting it in your backpack. Now it's no longer suspended
> > as you would expect it to be.

>   Just one query. Even if it wakes up after closing the lid and removing 
> the mouse, wouldn't pm suspend be triggered again later by the system 
> once it sees that usb is also good to be suspended again ? I presume a 
> laptop form factor would be having this facility of re-trigerring 
> suspend. Let me know if this is not the case.

No, we generally don't use opportunistic suspend (e.g. unlike android)
so the laptop will not suspend again.

So this is an actual bug affecting, for example, the Lenovo ThinkPad
X13s.

> Also, the warning you are mentioning in [1] comes because this is a 
> laptop form factor and we have some firmware running (I don't know much 
> about ACPI and stuff) ?

No, the "firmware" in this case is just the devicetree which has the
DP/DM interrupts defined as edge-triggered while the driver requests
them as level triggered.

(It would look similar with ACPI firmware which also has these declared
as edge triggered.)

Johan


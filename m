Return-Path: <linux-arm-msm+bounces-1396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E77207F3584
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 19:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 253821C21147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 18:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAE922090;
	Tue, 21 Nov 2023 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oAiS3rLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA92208B;
	Tue, 21 Nov 2023 18:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A0BC433CA;
	Tue, 21 Nov 2023 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700589808;
	bh=4Bdba1tvI+oo6AwkBvI7o3hN8rS1Gr781gEAW369E+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAiS3rLP0tA/M8+4GsKv21y2WEfzccGCLxONAD3Mbarc00dJHiUzmNA92+JXdAtK3
	 LcsO8lL9mFj068RmJedxp8//fx7ptxJhGw5tDhRvNjZm/QfrMuCgISZIEV8cHOhAe0
	 52gCom8o2k74XhigWHTJzC9hRIuyzieg9pk3B/PM=
Date: Tue, 21 Nov 2023 19:03:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] USB: dwc3: qcom: fix resource leaks on probe deferral
Message-ID: <2023112116-cucumber-hangout-b538@gregkh>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <041f239f-7b40-4681-8c6c-2268f9c2c684@linaro.org>
 <74cswe5tivcctmnty3gfavzsxdvjz5m4rktyj5auzwvrndninm@dah4h2fdj3zv>
 <ZVuO9qj3SRHAS4qm@hovoldconsulting.com>
 <2023112124-duckling-absinthe-2167@gregkh>
 <ZVzG4-U_y2q_EBrp@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVzG4-U_y2q_EBrp@hovoldconsulting.com>

On Tue, Nov 21, 2023 at 04:04:03PM +0100, Johan Hovold wrote:
> On Tue, Nov 21, 2023 at 03:21:34PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 20, 2023 at 05:53:10PM +0100, Johan Hovold wrote:
> > > On Mon, Nov 20, 2023 at 09:22:54AM -0600, Andrew Halaney wrote:
> > > > On Sat, Nov 18, 2023 at 12:47:30AM +0100, Konrad Dybcio wrote:
> > > > > On 17.11.2023 18:36, Johan Hovold wrote:
> > > > > > When reviewing the recently submitted series which reworks the dwc3 qcom
> > > > > > glue implementation [1], I noticed that the driver's tear down handling
> > > > > > is currently broken, something which can lead to memory leaks and
> > > > > > potentially use-after-free issues on probe deferral and on driver
> > > > > > unbind.
> > > > > > 
> > > > > > Let's get this sorted before reworking driver.
> > > > > > 
> > > > > > Note that the last patch has only been compile tested as I don't have
> > > > > > access to a sdm845 device.
> > > 
> > > > > I'll sound like a broken record, but:
> > > > > 
> > > > > is there anyone in the world that is actively benefiting from this failed
> > > > > experiment of using the ACPI tables that were shipped with these SoCs?
> 
> > > I agree that if we can remove the ACPI hacks in here, we should try do
> > > so (e.g. given that no one really uses it anymore).
> > > 
> > > As Andrew already mentioned, that is a separate issue not directly
> > > related to this series, though.
> > > 
> > > Removing it before reworking the dwc3 binding [1] and adding multiport
> > > support [2] should simplify both of those series quite a bit, however.
> 
> > > [1] https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
> > > [2] https://lore.kernel.org/all/20231007154806.605-1-quic_kriskura@quicinc.com/
> > > 
> > 
> > So should I apply this series now or not?
> 
> Please do. Removing ACPI support should be done later if that's at all
> possible.

Great, now queued up, thanks.

greg k-h


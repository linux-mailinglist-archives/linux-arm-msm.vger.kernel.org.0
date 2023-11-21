Return-Path: <linux-arm-msm+bounces-1385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C77F31D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 16:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8C51C2099E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1499555C23;
	Tue, 21 Nov 2023 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGnUEJcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A94A9A4;
	Tue, 21 Nov 2023 15:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AD6C433C8;
	Tue, 21 Nov 2023 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700579031;
	bh=ybjDzxPZW5g+QhZul9Du8UCGPjKVYHmIO/KEc0Aw7YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGnUEJcGjCJUadWNW4WUkZSR3cMzcCee54zegnUDA8ilcTUNmGunCdv+Q9IDr4+Mw
	 iACpM2DWBIvBGGHfC//8xFf0Mqq7wLY198e8tWfMB5VxPqYg3iKKmGqjWDAmDm+R+A
	 JJs27it0sDCvJQJ6EWHm1gdt3kX2qCkXB4SWd06ox8GubkZ1FMC0/hqK1ttsjVLnUZ
	 ki975Q/Qp7qFubmCb3G4lLk4jUogBtOezEN0QV0+IDrXwfNDUlFs9B8axkBpN+Nb8u
	 4pAK3DJLq+/1sUwFzqnvDTf/JwilcTCFwrJwSP1ZFzbNRPC4w7yVApZpPRmr6ujn3l
	 cHVxaXqno7+mg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5SIF-0007xS-2C;
	Tue, 21 Nov 2023 16:04:03 +0100
Date: Tue, 21 Nov 2023 16:04:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <ZVzG4-U_y2q_EBrp@hovoldconsulting.com>
References: <20231117173650.21161-1-johan+linaro@kernel.org>
 <041f239f-7b40-4681-8c6c-2268f9c2c684@linaro.org>
 <74cswe5tivcctmnty3gfavzsxdvjz5m4rktyj5auzwvrndninm@dah4h2fdj3zv>
 <ZVuO9qj3SRHAS4qm@hovoldconsulting.com>
 <2023112124-duckling-absinthe-2167@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023112124-duckling-absinthe-2167@gregkh>

On Tue, Nov 21, 2023 at 03:21:34PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 20, 2023 at 05:53:10PM +0100, Johan Hovold wrote:
> > On Mon, Nov 20, 2023 at 09:22:54AM -0600, Andrew Halaney wrote:
> > > On Sat, Nov 18, 2023 at 12:47:30AM +0100, Konrad Dybcio wrote:
> > > > On 17.11.2023 18:36, Johan Hovold wrote:
> > > > > When reviewing the recently submitted series which reworks the dwc3 qcom
> > > > > glue implementation [1], I noticed that the driver's tear down handling
> > > > > is currently broken, something which can lead to memory leaks and
> > > > > potentially use-after-free issues on probe deferral and on driver
> > > > > unbind.
> > > > > 
> > > > > Let's get this sorted before reworking driver.
> > > > > 
> > > > > Note that the last patch has only been compile tested as I don't have
> > > > > access to a sdm845 device.
> > 
> > > > I'll sound like a broken record, but:
> > > > 
> > > > is there anyone in the world that is actively benefiting from this failed
> > > > experiment of using the ACPI tables that were shipped with these SoCs?

> > I agree that if we can remove the ACPI hacks in here, we should try do
> > so (e.g. given that no one really uses it anymore).
> > 
> > As Andrew already mentioned, that is a separate issue not directly
> > related to this series, though.
> > 
> > Removing it before reworking the dwc3 binding [1] and adding multiport
> > support [2] should simplify both of those series quite a bit, however.

> > [1] https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
> > [2] https://lore.kernel.org/all/20231007154806.605-1-quic_kriskura@quicinc.com/
> > 
> 
> So should I apply this series now or not?

Please do. Removing ACPI support should be done later if that's at all
possible.

Johan


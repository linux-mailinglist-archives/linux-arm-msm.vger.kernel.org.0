Return-Path: <linux-arm-msm+bounces-961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820087EF1AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 12:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AF17B20981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443F41A588;
	Fri, 17 Nov 2023 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTH939ox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28509171CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 11:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A0EC433C7;
	Fri, 17 Nov 2023 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700220241;
	bh=cp8VziTtK0TOxFkKNawLZ53dTtyMX5RViHDft5lzhT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTH939oxoK3MWuqep/YigvFHO3T4TD63gQEuSrw296AwMhHtHgP19cq8x/jSrb8QR
	 NOXdeYYjc74PhlJl93orKukm6kQhkX0+wX2FTxuTtEr232Ft7qDGgVhmwh8Oz/x48d
	 T0GrHo0BtVIc29otBpwwW1FC+k9rHg1NxI8LXS7HbyPZ+sATahagy5qeRLJAM+iMk1
	 1qQiY0LrjiCX/FXnq4esEkdHl4wHuUEfqiF1oSzs93FPKlNpm2vMqlDPiCs1NAkJFu
	 0JPM4hcMZ/A1+ogBsUDhe6vDvs0F70wUOg3b6wVfBRXAuMBurASuT0/i2p4YVd+d5f
	 Sstevwc+ceecQ==
Date: Fri, 17 Nov 2023 16:53:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] PCI: qcom: Clean up ASPM comment
Message-ID: <20231117112352.GS250770@thinkpad>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-5-johan+linaro@kernel.org>
 <20231117103227.GM250770@thinkpad>
 <ZVdE6nqanqcaL8sO@hovoldconsulting.com>
 <20231117105404.GR250770@thinkpad>
 <ZVdH3GkzWupoxyzJ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVdH3GkzWupoxyzJ@hovoldconsulting.com>

On Fri, Nov 17, 2023 at 12:00:44PM +0100, Johan Hovold wrote:
> On Fri, Nov 17, 2023 at 04:24:04PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 17, 2023 at 11:48:10AM +0100, Johan Hovold wrote:
> > > On Fri, Nov 17, 2023 at 04:02:27PM +0530, Manivannan Sadhasivam wrote:
> > > > On Tue, Nov 14, 2023 at 02:55:51PM +0100, Johan Hovold wrote:
> > > > > Break up the newly added ASPM comment so that it fits within the soft 80
> > > > > character limit and becomes more readable.
> > > > > 
> > > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > 
> > > > I think we discussed (80column soft limit for comments) in the past, but I don't
> > > > think breaking here makes the comment more readable.
> > > 
> > > The coding style clearly states:
> > > 
> > > 	The preferred limit on the length of a single line is 80 columns.
> > > 
> > > 	Statements longer than 80 columns should be broken into sensible chunks,
> > > 	unless exceeding 80 columns significantly increases readability and does
> > > 	not hide information.
> > > 
> > > Going beyond 80 chars may sometimes be warranted for code, but the
> > > exception is not intended for comments.
> > 
> > Breaking the comment here is indeed making it hard to read. It's just one word
> > that needs to be broken if we go by 80 column limit and I won't prefer that,
> > sorry!
> 
> Please read the above quote again, it is as clear as it gets. 80 chars
> is the preferred limit unless (for code) exceeding it *significantly*

Where does it say "code" in the Documentation? As I read it, the doc weighs both
code and comment as "statement".

And how on the world that breaking a single word to the next line improves
readability? I fail to get it :/

> increases readability, which clearly isn't the case here (even if this
> exception applied to comments).
> 
> I really don't understand why you keep insisting on this. Just fix your
> editor.
> 

May you should fix yours to extend the limit to 100?

But I do not want to get into a spat here. Checkpatch, the tool supposed to
check for the kernel coding style is not complaining and I do not want a patch
that _fixes_ a coding style that is not an issue.

And I do not want to argue more on this. If the PCI maintainers are comfortable
with this patch, they can apply it, but I'm not.

- Mani

> Johan

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-msm+bounces-945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474887EF0F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30263B20AE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EBD1A271;
	Fri, 17 Nov 2023 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaMGEQXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944F19477
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 10:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80863C433C7;
	Fri, 17 Nov 2023 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700218089;
	bh=MHfAV0lQx9b1z+ZYliUxzTe7mQ+82iR06qthvGyNmPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaMGEQXaIm+8fY90zRgc4THJWT/avYJ0iX4KnXk+pCrapICvgAlIFs9cjTcH0NNjm
	 PVc3dWUwXhYwR+TSqqmXsHAASgMgYM/ua8MdL4wCLUsNmjVGa0W7Ugzoslvx6URJRI
	 UebBeMVsEaVyTXqiZZCpKkX3S65WM2cLnRFRh+lYg7VTnVjW+z04MUQF5A7FgXO6wr
	 tNB3d14xNhLlc9K1Nrpb37JLRQGnWXME3XtnyipyuUcedmcMKtOiDVufr6qbmu+xzd
	 MNSZ8xFsRzdGo2olOE2rL5w+uweIJCS7dokvuRktw5IKipFqIgLhMJfKuaXqhmVjKs
	 m5Ypaz6ooXbuQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3wOQ-0002Kf-27;
	Fri, 17 Nov 2023 11:48:11 +0100
Date: Fri, 17 Nov 2023 11:48:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
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
Message-ID: <ZVdE6nqanqcaL8sO@hovoldconsulting.com>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-5-johan+linaro@kernel.org>
 <20231117103227.GM250770@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117103227.GM250770@thinkpad>

On Fri, Nov 17, 2023 at 04:02:27PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Nov 14, 2023 at 02:55:51PM +0100, Johan Hovold wrote:
> > Break up the newly added ASPM comment so that it fits within the soft 80
> > character limit and becomes more readable.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I think we discussed (80column soft limit for comments) in the past, but I don't
> think breaking here makes the comment more readable.

The coding style clearly states:

	The preferred limit on the length of a single line is 80 columns.

	Statements longer than 80 columns should be broken into sensible chunks,
	unless exceeding 80 columns significantly increases readability and does
	not hide information.

Going beyond 80 chars may sometimes be warranted for code, but the
exception is not intended for comments.

Johan


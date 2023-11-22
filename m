Return-Path: <linux-arm-msm+bounces-1507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A137F459B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76B91B21101
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97305102F;
	Wed, 22 Nov 2023 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYCefLpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD51C2BE;
	Wed, 22 Nov 2023 12:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FB6C433C8;
	Wed, 22 Nov 2023 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700655499;
	bh=3PecfwOd2IAznuwvH/QmZLOkNifAzul2CXHZqkNhl/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYCefLpTk3Bjc88e7qGYwpRSdOgQ5hWAldH/c73Mc44vPlbj9Q76O79itu6+8dddK
	 Z5yMd/3FJ1jtmmv8w3L4ZUNVlAyHFj7MFpkxKrWMEiqGODusLKhlyNcJDRNtW7LJkB
	 jPGf/e/kq2/hCGAq03ihYr96u9NY2JPUYc2wffxeMmue+N5bZPEoRYfQ8aYqKbSoHS
	 7JBZEIZJlE+rqVCTtMLIJdUyHeVxF/MPFaaQPRatBh5v2NEkZWIThvvRE2kdc2HTms
	 J+4M4Y0hi0v4Ca7x3AwpuQr9G5FGTEizbVtIXtYoAlhS0X+Jwg/I5FsIYG39w32s0O
	 YNtys2WtFep2g==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5mBd-0000A8-2v;
	Wed, 22 Nov 2023 13:18:33 +0100
Date: Wed, 22 Nov 2023 13:18:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 06/12] usb: dwc3: qcom: Add dwc3 core reference in driver
 state
Message-ID: <ZV3xmW0fDWY5-6qZ@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-6-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-6-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:14PM -0700, Bjorn Andersson wrote:
> In the coming changes the Qualcomm DWC3 glue will be able to either
> manage the DWC3 core as a child platform_device, or directly instantiate
> it within its own context.
> 
> Introduce a reference to the dwc3 core state and make the driver
> reference the dwc3 core either the child device or this new reference.
> 
> As the new member isn't assigned, and qcom->dwc_dev is assigned in all
> current cases, the change should have no functional impact.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 100 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 83 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7c810712d246..901e5050363b 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -67,7 +67,8 @@ struct dwc3_acpi_pdata {
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> -	struct platform_device	*dwc_dev;
> +	struct platform_device	*dwc_dev; /* only used when core is separate device */
> +	struct dwc3		*dwc; /* not used when core is separate device */

Hmm. This quickly become really messy and hard to maintain. It may be
fine as an intermediate step as part of this series, but why can't you
do the conversion fully so that the Qualcomm glue driver never registers
a core platform device? Is it just about where the core driver looks for
DT properties?

Johan


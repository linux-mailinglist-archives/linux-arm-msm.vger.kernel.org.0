Return-Path: <linux-arm-msm+bounces-3287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EF8034F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52339B209D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67515250FD;
	Mon,  4 Dec 2023 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AfXFhWhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED8D53E;
	Mon,  4 Dec 2023 13:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EE6C433C7;
	Mon,  4 Dec 2023 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701696665;
	bh=d63k/4zq+ci1uefjy/Q+LzOICvD1194+J9xTaUCkf6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfXFhWhSwtdWw3E5ujjO8giHxIDgdT6bBURXAmuDXxB9S51/l7k3tHJyXL8ka2nKf
	 Ejvnf7ixYfSLJGSQb+LNztn9uvd2O0zVyc66PF98Ciuk7TlSlqfo/IL+CFMuQlAoAV
	 0E3GE8M+4FBqMmRyGhWCH5JAOOzkag3uwqxnYV7c=
Date: Mon, 4 Dec 2023 22:31:03 +0900
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: usb: add accessory mode
 description
Message-ID: <2023120437-pebble-tantrum-5c7a@gregkh>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
 <20231121202925.2481471-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121202925.2481471-2-dmitry.baryshkov@linaro.org>

On Tue, Nov 21, 2023 at 10:26:59PM +0200, Dmitry Baryshkov wrote:
> Add description of the USB-C Accessory Modes supported on the particular
> USB-C connector. This is required for devices like Qualcomm SM8150-HDK,
> which have no other way to express accessory modes supported by the
> hardware platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Does not apply to my tree, can you regenerate this against the next
linux-next and resend with the acks added?

thanks,

greg k-h


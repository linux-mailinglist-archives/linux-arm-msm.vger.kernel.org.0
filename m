Return-Path: <linux-arm-msm+bounces-1508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A47F45EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E062A1C208FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E574D5A9;
	Wed, 22 Nov 2023 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwmOU9T2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BA4D580;
	Wed, 22 Nov 2023 12:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7071DC433C7;
	Wed, 22 Nov 2023 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700655816;
	bh=BYEcrkRJolTlhrpPIJPgV41ILBqMXfYPCsqUZp1UwYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwmOU9T2VGnU3b6rAa05NBuX3nFH52KxkrNJb7dcCGGArBcSfFkNG81gZrz1fIk6l
	 T/olhBkflMFu9Vp7eX5hz8bUgvcdkJBwTLvOWyws15S3wo6MHDxwSdmTr1JSrvOlGy
	 tRRYmmd/roKlvJ7KVthvHTfsMEVG/fotLXgs1wE9VkRvatMLT8aYZizP8F4TLOGrfG
	 o2wSHZPHxdWzHrQ3RDnGFFh6TP9CD/9McQSJm3BIMZy2t3XI7x55IpOYRh9F2Q3npw
	 qCPov3ojvQvJ6zw4otHorw9091L5Gbq+F+7rtoayNWfQTuVlAp7HmFr3BgM1oAyrbz
	 2pyZpaPBbuEyg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5mGk-0000C4-23;
	Wed, 22 Nov 2023 13:23:51 +0100
Date: Wed, 22 Nov 2023 13:23:50 +0100
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
Subject: Re: [PATCH 07/12] usb: dwc3: qcom: Instantiate dwc3 core directly
Message-ID: <ZV3y1oUpZL7btbF1@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-7-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-7-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:15PM -0700, Bjorn Andersson wrote:
> The Qualcomm DWC3 glue builds up a platform_device programmatically in
> order to probe the DWC3 core when running off ACPI data. But with the
> newly introduced support for instantiating the core directly from the
> glue, this code can be replaced with a single function call.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

> @@ -986,10 +933,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  interconnect_exit:
>  	dwc3_qcom_interconnect_exit(qcom);
>  depopulate:
> -	if (np)
> +	if (qcom->dwc_dev)
>  		of_platform_depopulate(&pdev->dev);
>  	else
> -		platform_device_put(pdev);
> +		dwc3_remove(qcom->dwc);

The current code was broken here too:

	https://lore.kernel.org/linux-usb/20231117173650.21161-2-johan+linaro@kernel.org/

Johan


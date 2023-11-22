Return-Path: <linux-arm-msm+bounces-1465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0B7F42FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760F11C208A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9E925547;
	Wed, 22 Nov 2023 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wf1mV/Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9993D992;
	Wed, 22 Nov 2023 09:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149E8C433C8;
	Wed, 22 Nov 2023 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700647115;
	bh=wFOz84X6JQkAzM3R0/wXegUEVDcHqoOwN9/NQtwtvm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wf1mV/PkVmEWBKYQSBG9vYSivTRFJ852ePt/q6LjCA0663fSVUQoEc8MSIKQYHi9j
	 9GQoEiUCuYB0jtaKMyhiCLXyA+HaXSUe5SLGzyyBC4uT6rSV6nav0M4q19s6zEJa1Q
	 zw4Z3zL1QxYPUIWaX7StTBczTpZGjAGP4/jPmiXOkVLPsUc0CDcc6t2L0e2mv1BMcu
	 J9YrxCqsGS5I6pUxcX8j5HG13sVGFDJpwmUMrJM9mK4w/Edn0Qdnhyg0+jFYOchkc4
	 6Kl5aTIT5sgpgBMxPV42UFSGMc0422tlVAZLrg8oXZ9sawdJYHBt2HmJ9efgbfdy3P
	 YMASud1Mubkcg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5k0O-0008Co-2n;
	Wed, 22 Nov 2023 10:58:49 +0100
Date: Wed, 22 Nov 2023 10:58:48 +0100
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
Subject: Re: [PATCH 02/12] usb: dwc3: qcom: Rename dwc3 platform_device
 reference
Message-ID: <ZV3Q2Fa4KL-0hBE8@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-2-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-2-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:10PM -0700, Bjorn Andersson wrote:
> In preparation for the introduction of a direct reference to the struct
> dwc3 in the dwc3_qcom struct, rename the generically named "dwc3" to
> reduce the risk for confusion.
> 
> No functional change.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 46 ++++++++++++++++++++++----------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 3de43df6bbe8..a31c3bc1f56e 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -67,7 +67,7 @@ struct dwc3_acpi_pdata {
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> -	struct platform_device	*dwc3;
> +	struct platform_device	*dwc_dev;

Since "dev" is so overloaded, please name this one "dwc_pdev" instead.

>  	struct platform_device	*urs_usb;
>  	struct clk		**clks;
>  	int			num_clocks;
 
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
>  {
> -	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc_dev);
>  	struct usb_device *udev;
>  	struct usb_hcd __maybe_unused *hcd;
>  
> @@ -486,7 +486,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>  	struct dwc3_qcom *qcom = data;
> -	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
> +	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc_dev);

Perhaps you can drop the tab while changing this line.

Johan


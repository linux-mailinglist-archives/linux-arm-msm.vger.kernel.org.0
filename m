Return-Path: <linux-arm-msm+bounces-3441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01D805333
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02A82812B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C1A56B64;
	Tue,  5 Dec 2023 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMJov2tc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76650697A9;
	Tue,  5 Dec 2023 11:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85D8C433C8;
	Tue,  5 Dec 2023 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701776483;
	bh=39hIynYLxtwl/O23npHEkHvKhoLwLy7fzyGPOOqty9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMJov2tcJS/7wL/pPXe3meTv6r3DI2KkeFBdH68DYYQ6tOUabE33M0QM7VH7HVNV7
	 p94elf+S/c5ZZTQ6sC4/qdAYFoJGrTmztWs/T2rak7Zi5FH2riyTetSCXQ8QTMIx12
	 BOWXOXEHXX6oJXKOKUMtTOt5d9hXGsTAL7rBfXBF/0qNEoRGiLtIM1qNQE0zBikHpX
	 zOSQY2ZM7dH24M+d+GMc5hb6VtdvRM9UU5yAgUfvyYvNcpzcwO7pHEkzQye9fAXDyd
	 0C0QHbw+lBZVRSsehi1ZgvBuBjZDx12acKI5T8BS+Fq5ugVe3WcPnjd2HRJHMcKtNi
	 MuP18QxZfnWCA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rAToU-0008Ud-2D;
	Tue, 05 Dec 2023 12:42:06 +0100
Date: Tue, 5 Dec 2023 12:42:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qrb5165-rb5: add a pin function
 for BT enable GPIO
Message-ID: <ZW8Mjp9whA9rxam9@hovoldconsulting.com>
References: <20231205112311.16391-1-brgl@bgdev.pl>
 <20231205112311.16391-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205112311.16391-2-brgl@bgdev.pl>

On Tue, Dec 05, 2023 at 12:23:10PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Set up the pin function for the Bluetooth enable GPIO.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index ce6ae0771d34..ead0c45ba60c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1264,6 +1264,17 @@ &tlmm {
>  		"HST_WLAN_UART_TX",
>  		"HST_WLAN_UART_RX";
>  
> +	bt_en_state: bt-default-state {
> +		bt-en {
> +			pins = "gpio21";
> +			function = "gpio";
> +
> +			drive-strength = <16>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	lt9611_irq_pin: lt9611-irq-state {
>  		pins = "gpio63";
>  		function = "gpio";

This makes no sense as a separate patch and should be squashed with the
final patch enabling bluetooth. Same for the first patch.

Johan


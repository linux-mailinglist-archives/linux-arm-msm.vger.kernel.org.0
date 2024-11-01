Return-Path: <linux-arm-msm+bounces-36692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE49B8C7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 467272810AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E34A155A4E;
	Fri,  1 Nov 2024 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQmC1Mv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C114A0BC;
	Fri,  1 Nov 2024 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447964; cv=none; b=RXG8OcuvuSpvlATOh1wyD7J0JfMESov9L5bADOHVD0pDk6djBT8O4L6pGcRzDPyE+vdVEOfTh6ZPPYZgAexamyeqhmSsXZw9i7jG4AaO6UBn2xFIPg/eGJVJtfPcla9vpNSS05HmWZ06AgeH3oPmae6E6TT83y2p05FnPmUcosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447964; c=relaxed/simple;
	bh=NG3wZv0udH1ATcI1REUmK1B4VROjpbbqhKZ6obH3BwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAhiy/sGBf6GOVoZLNYBLGlX+krBGl2pJkTqVKBzW7f8tfLZ6mG/x8wAoD5YJi27L8qewSgVHGimQn2+SD0RIsSDpgg6H+3DxDUaJb5CR9PdijwWmR36e85qqtQSRRvCOa4EWcOTH8gMV5z8nnHiI1feQekyoMFAPHECXIKVzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQmC1Mv2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC99C4CECD;
	Fri,  1 Nov 2024 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730447963;
	bh=NG3wZv0udH1ATcI1REUmK1B4VROjpbbqhKZ6obH3BwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQmC1Mv2yddRscBCbTI73oEefjkPpfwR7QmgAx3c5w0xpDd8FNq83vIKPp+1IQ7lJ
	 Mekf35pmX9B4ALpRT2zRqBP9c3sg56jXlldOS/Nn+kmPmz1uvUjLYgnkpgFnCOoPnV
	 CtqZRJooWiYQCVW/pKwB9rtqq4gu/PwzOKfHVBV2CX1J69OpkJqi/eztoLfaxwGr5T
	 N58hI0TiA1GPjZBcHol0B/HNGU++T8z0ynvKrJfI8qYT2PAhpWfV4/EXH60dG+ECKY
	 oSJu3imQhp5//YD+A7yqO4PCmtWYthvoN0rMWlVwcmzKXWzVmsC/stqRQS53hD2qeF
	 yj+1C6A10qt2g==
Date: Fri, 1 Nov 2024 08:59:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] arm64: dts: qcom: qrb4210-rb2: add wcd937x
 codec support
Message-ID: <a4z5awo6xodgjnmgrqd2hvf2ta2yhexsoyilbprz3vkimymc77@pqp3bgc2fgdh>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-4-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101053154.497550-4-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 05:31:47AM +0000, Alexey Klimov wrote:
>  &tlmm {
>  	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
>  			       <56 3>, <61 2>, <64 1>,
> @@ -691,6 +731,21 @@ sdc2_card_det_n: sd-card-det-n-state {
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
> +
> +	wcd_reset_n: wcd-reset-n-state {
> +		pins = "gpio82";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +	};
> +
> +	wcd_reset_n_sleep: wcd-reset-n-sleep-state {

Where is it used?

Best regards,
Krzysztof



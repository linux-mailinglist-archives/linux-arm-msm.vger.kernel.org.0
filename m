Return-Path: <linux-arm-msm+bounces-38927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0828A9D6A2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C89281C74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B646F2E3EE;
	Sat, 23 Nov 2024 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRivZ1Ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770717C2;
	Sat, 23 Nov 2024 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379639; cv=none; b=BkDxQ73T01F3i3qRN0mYLb9sQxqrrNTLoIWFD7BBLKW7q5ZJMxGGbPpiE3phgoohzLNApVfZbTFo71nYeVAn8J1tAwK7mFbIvgVL747BoRDNRuFuJxDs6nQAIg+vGhZN9nBApPdkUByTOhwKnZaeovNFcwUxsmbhCJMF114mztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379639; c=relaxed/simple;
	bh=tCT6K2z82iu0OMh4jUxwxzcAFtbKbAgIOhD7MXXZQs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnUq3Il3tybIvtZlBkTwFV5sLogq6IiVHu3mClzZzijRXgU2yPSE99n9msi4DeI39Ou3lmq67le8qnMjcZDTUYx8t7nHEi4dYWtrccHKqxOHD9Wl07cUuMtAOJYP/4RLucEqAwOWkaVYetuA38oOFUd/3lRDmEO537YeLiA61og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRivZ1Ah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC1DC4CECD;
	Sat, 23 Nov 2024 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379639;
	bh=tCT6K2z82iu0OMh4jUxwxzcAFtbKbAgIOhD7MXXZQs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRivZ1AhgEXJbZbV9l438hEX0b8CCKvQX9AhNRdO9NQwXCST1A2ILw7z1oxGw9yxP
	 E1+G/7py140ruRt7BhffX2NxhFJRZbW6KtqFqGO9fj68b7RIhPa05iyE+8nS/YYEGA
	 qv4rZ7hNZYCd4I6ohZOj90ZSSgxlE8GD6j7Pmb2w+bgyJv0e5cjMQWBs2KvUuu6brM
	 ADa/OFhVYQKHbgOhIa7sgPvBnipD8X3KxVrKBE8+yt3ZK64SP6SIITd7jBRmf0MNhr
	 pOUcB3ITzHmpx1iMOVLGWpYrhRyYpQxaUGUt7ZHfTDUsZbksuISulFfwwLEAXYjSxL
	 /bEBKAkldkFkA==
Date: Sat, 23 Nov 2024 17:33:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Message-ID: <auvo564udpfdhufn3ccv6ty74d7otvpdgs3s4epbgzxpfdlkuq@fvdknv5akuym>
References: <20241123-asus_qcom_display-v2-0-a0bff8576024@hotmail.com>
 <20241123-asus_qcom_display-v2-3-a0bff8576024@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241123-asus_qcom_display-v2-3-a0bff8576024@hotmail.com>

On Sat, Nov 23, 2024 at 01:58:55PM +0100, Maud Spierings wrote:
> +
>  	pmic-glink {
>  		compatible = "qcom,x1e80100-pmic-glink",
>  			     "qcom,sm8550-pmic-glink",
> @@ -537,6 +552,12 @@ edp_reg_en: edp-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	hall_int_n_default: hall-int-n-state {
> +			pins = "gpio92";
> +			function = "gpio";

Messed indentation.

Best regards,
Krzysztof



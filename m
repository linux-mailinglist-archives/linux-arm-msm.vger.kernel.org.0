Return-Path: <linux-arm-msm+bounces-28506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978A951DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA77B2128F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2501B3744;
	Wed, 14 Aug 2024 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="T8+uKAwy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i9hs8IQ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF51B32D3;
	Wed, 14 Aug 2024 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647002; cv=none; b=hk9P8AYDfJxF488e1cjzaa8Q1+caqPkmFy4fb4jaGA89+m7uKMBgvqO+VMb8ellfqo5QQRrlTrP5RWuGwcjOlTn3cTVTU93o8M+GqSptAb5ssFPDuqCEd7+GlbIQYzeSXKYRYvnTPPxGg8pW2gGcwM3rG+vkapr1qrdB/BivTWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647002; c=relaxed/simple;
	bh=I7UtmZ0OBgcdGNh5dV0kh+7DRg7LjEREhYHTM6V3o0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YujgPs+jpgpKVKpNlM1lVl9jcNiwoYIdAfBt4SfeH8kJgG9Y+/qmrxczerIO+dZOwGpOm4NMXDxZnpSrIOQExXDW6ECNUdUbtfEf3VWs6liZFv17ncuzzg81XL9kTdVM+MBWCPa3Rrox7sMslQkhkpw+Y6v1K0bypEUS/+FmIUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=T8+uKAwy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i9hs8IQ/; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 469111151AC4;
	Wed, 14 Aug 2024 10:49:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 14 Aug 2024 10:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1723646999; x=1723733399; bh=aXCB4HFOam
	529ahXCl29lsxxGkiRww5P27fIzD/jqlg=; b=T8+uKAwyDA3f5VLtNuISyHwzfw
	hXVcoFD76BX6hy6Gx0meqeETEbnZRhRa1Mzib4faoS9bjck+jYQZIZB9L0EslfjL
	u/2i6c9WQt/ndamEktF0luAHIi8CDG1uSUXkLo6zeofjX+EwhqKeBV7oeMZC4AE8
	gfS4VsZy5Q95ohEWc/SCAzSGTyqNWo7kv3HuCMNRT+JqD/uY17Cj0whiQHW8hCwu
	Cb68TvMjyBBeIOGpxvtU11xQ1rWjMsyaH3568m0FkZIsKPoz+Ylh8cmwRsvLGYig
	sCCKzYFEL0x+ON5Tx/7zFY+G+6fizVdiQRHia3onep8M7DuB/Tw+H64J+FQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723646999; x=1723733399; bh=aXCB4HFOam529ahXCl29lsxxGkiR
	ww5P27fIzD/jqlg=; b=i9hs8IQ/0GjERXDFnPKvcXkn/+Jc+kkP+b9izrA9v4MT
	P36kBGXJoO/dFA5V+fPz5Va3EAttXiaVQYbzeo39jvEEcs4PtlGLQNptbPUdbX2z
	ShZgUQjBUlURC6Ht3gA2+DQUhGUcKqOaMdH9ISBBzlr72lFCqdv3Htu1uXcP2Y40
	nUEbgQV391ZgDh7hcfWYfXs3MGrdwUmhCKHuPMXgMza4uVzsGdlcj6Or3SvOfLzq
	WkNGPGWHWAIZ1mANC4Ad/Lf0iVZLRk+KILQikbbR9CQSm95wiOZhIOZkPENvZYVY
	F3Yo2DzxjNG6lEAd6kkaj34Qt1UMtxQmqXAY8/Jdfg==
X-ME-Sender: <xms:FsS8Zr_SsSEWOCDdoympLVVBH7mfR3B7aK-5YogLr1-XsjOydFepUQ>
    <xme:FsS8ZntxGE5sLYtwFEv4wwIajSzyO10DhFHOp9XN7C6FufBJP0ig0PpQNVFJilnu6
    mbEHSAWPzVvsQ>
X-ME-Received: <xmr:FsS8ZpArIXVgruZSpDrk1NASDpctrnL6aIG9kzU_1GiB3Tp4bG_7px6V1DyILUbARGGIaPqqZtaqIfWyJa2k8k4Xmmk39WX1qJK4XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtgedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhgrkhgvvdegsehishgtrghsrdgrtgdrtghnpdhrtg
    hpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhishhhohhn
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhsuhgvlhhsmhhthhesghhmrghilh
    drtghomhdprhgtphhtthhopegrghhrohhsshestghouggvrghurhhorhgrrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhphhihsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FsS8ZndY5vkRgfmmAwnOAA_sea-Yu7TIhwJubO4hmojHB3vCWSU_MA>
    <xmx:FsS8ZgNZhlZr7TEKLLKP-1mquZ8g7x3Z8ER9R2AW7qR4ICSireJaqA>
    <xmx:FsS8Zpk017SnqFS5wQrh_l1ooigZfbw_CsTUFnmbQIOQvH4xBlLZYg>
    <xmx:FsS8ZqtsjPYin1b1m0EtwKu9w5QfIAAEn5avyHwJ_QPrd6Dm9u-cgg>
    <xmx:F8S8ZrH0CbcgWDon6AYMN2l07FVDVbjOUnXHEV27j_naolyQocNExvbn>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Aug 2024 10:49:58 -0400 (EDT)
Date: Wed, 14 Aug 2024 16:49:56 +0200
From: Greg KH <greg@kroah.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vkoul@kernel.org, kishon@kernel.org, ansuelsmth@gmail.com,
	agross@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: Check NULL ptr on data
Message-ID: <2024081448-garden-module-40f7@gregkh>
References: <20240814141125.50763-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814141125.50763-1-make24@iscas.ac.cn>

On Wed, Aug 14, 2024 at 10:11:25PM +0800, Ma Ke wrote:
> Check NULL ptr on data, verify that data is not NULL before using it.
> 
> Cc: stable@vger.kernel.org
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> index 06392ed7c91b..9b9fd9c1b1f7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -492,6 +492,8 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;

When will this ever fail?


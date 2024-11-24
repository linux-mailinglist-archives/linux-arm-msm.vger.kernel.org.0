Return-Path: <linux-arm-msm+bounces-38961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5A9D6DFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 12:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 194A3B21041
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 11:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218A1898FB;
	Sun, 24 Nov 2024 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9F+V2L1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191A1891AB;
	Sun, 24 Nov 2024 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732446005; cv=none; b=QPw0lTTsjN/c0xtF6AEerYS8/+f6uOKMqB/fue1G4cD1kRbV0BEhdq9agrRwmLZ+K/36HNSOtEC4KNmKKLnlrRvXlY5geMR+QIPovDx7XbM0qDCkfTzg2eQAjIWMwCpDWWrrv8DI2E6FPg/2ZbVs0CRbGMupJY1WGeHDACk+ZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732446005; c=relaxed/simple;
	bh=95UQNooQ1/xtDHil/lFmvjulG65W+cWONuW8GgkYtUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DN2EUPf8aIaHgD5F7ldS+PfgF9lPqT5QvupgIjQknVdcmSP3PIJ5aGlc1TuspQxpn4Ui4H4VFU7utovBp13j9cpwd+Gg6eBcwjlBH/eqkYeSJDQpp+xFuGmTxk3UF1z7c4glKYuT/n1M1bAQxSDXmB/8M2+RW8OJ4tCoVOQAyD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9F+V2L1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13041C4CED1;
	Sun, 24 Nov 2024 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732446004;
	bh=95UQNooQ1/xtDHil/lFmvjulG65W+cWONuW8GgkYtUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9F+V2L16moEeax2rywUzrYkZcOBcCczdpsyl2aNWCKDFLnkFtWjbYI1jEqGibZwy
	 eSiDOI+uECaEWMJXIs3DQtEvcBZeNcSSoaizkgvW/Zw+RsKNeiqfDtYc2wvC9S3q2G
	 BiXpRNBHdXZoJtp/a9wmQtp9xnWbxodmhYFE/6qErL6TeZWVS/YstTvlkmFRnz8dWZ
	 XCNYo88PpDbFDFYcR+INGk1yGrdVXyJTWxXNmrSCEnDpEYbS7aMo1rF8SYaA1MOTww
	 8st5Wasj+cYcm8Oe5BDzXjeUBa4hFwczQXmFaiv5qN433pD0SKRyIzCH1ktlMSh/NS
	 fuAst+iZb4YVQ==
Date: Sun, 24 Nov 2024 12:00:01 +0100
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
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
Message-ID: <k27rqbfvuon3uppgyhcfhcmlqv7ritbn35fmhuljnw2ievqnia@rey3cljv2p2n>
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
 <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>

On Sun, Nov 24, 2024 at 11:00:57AM +0100, Maud Spierings wrote:
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger and has a different
> resolution.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof



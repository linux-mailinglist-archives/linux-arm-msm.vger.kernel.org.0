Return-Path: <linux-arm-msm+bounces-75133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB06B9FE0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C810B188BBED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B218B2C1586;
	Thu, 25 Sep 2025 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxFtplm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8E2882B6;
	Thu, 25 Sep 2025 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809180; cv=none; b=RPBbw0HXERuqqWW8NLsUTZGxBUzbemqzxLqCcyZQDnot0jiNjwen37/zTetIGhs8v/2MFS/8neycBdJHAt+rpvyKKmuc1tmTdIZ0GbdZeIybdEZDpGjCI54Sspg3tLZTyTP4lX+c48Y7ufFNXEIVxbPPkVyn2klAMHEtq7vzWxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809180; c=relaxed/simple;
	bh=+P3MJzrY6ycmpHKH32Y3s17bB4zBsBT7C8hhGbMeCRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWZiBKUrTnxcurqo/wOEld8UuqKZVCXgV/g6p+D50DIuzADilXAXeIgZLkgtVt/ZDyLQqeNge0pJquYG7+jILgWKhanwaZq5c6pMW2uSnb94vGfOKxNJ7qfrgEd8X0j3Qi79lgXuNLrCdoF7eo1F9zX7LvFeJ0nCpmkd/Ck6gro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxFtplm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30314C113D0;
	Thu, 25 Sep 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809180;
	bh=+P3MJzrY6ycmpHKH32Y3s17bB4zBsBT7C8hhGbMeCRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxFtplm1yxMw6Oc1+qHIlEtFbbo/QvTUfXOFNT64l8Miw0vxT0S55xIMW+RyFMbb1
	 pKjxPK/z/uOy554L4FOLWy62f4XpMwqrwU7814az1rKMFaRpZ/z0A06z4e/wQMPqCI
	 JBRNp+PB1tuAiW6fcEtED5wXpvqg82t7dgpn8d8c1A5mGwB+I0F+o8OEzm64uEHVgo
	 stoZXDRdJMFYTQVHXNAqib+whpYBW1iKYIRulasUCJQITKjPUeDcIihRopJJvbVqMk
	 UR+FLIGghRCmR2xdapr6nO0luPSjVyaez1HBxCZTScpIyWtr6sSp3HkXsDpsMjygmH
	 vCMdaSp0soUPw==
Date: Thu, 25 Sep 2025 09:06:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 15/20] arm64: dts: qcom: kaanapali-mtp: Enable modem
Message-ID: <pd5zbxclxtrfaukorad6dyld5foa6tcupqeiraj6uxlio6tmdu@gklwmof7n6sd>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-15-3fdbc4b9e1b1@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 05:17:32PM -0700, Jingyi Wang wrote:
> Enable the MODEM on Kaanapali MTP board.
> 

Please omit this until you have gotten it to work, and if that happens
before resubmitting "arm64: dts: qcom: kaanapali-mtp: Enable more
features" squash it into that.


PS. The patch adds a failed node, but the commit message doesn't
describe that, or mention that it is broken.

Thanks,
Bjorn

> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 2949579481a9..8d1b3278389e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -1263,6 +1263,14 @@ &remoteproc_cdsp {
>  	status = "okay";
>  };
>  
> +&remoteproc_mpss {
> +	firmware-name = "qcom/kaanapali/modem.mbn",
> +			"qcom/kaanapali/modem_dtb.mbn";
> +
> +	/* Modem crashes after some time for OEMPD load failure */
> +	status = "fail";
> +};
> +
>  &remoteproc_soccp {
>  	firmware-name = "qcom/kaanapali/soccp.mbn",
>  			"qcom/kaanapali/soccp_dtb.mbn";
> 
> -- 
> 2.25.1
> 


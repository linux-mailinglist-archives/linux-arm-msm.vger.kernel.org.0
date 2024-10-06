Return-Path: <linux-arm-msm+bounces-33215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240C991C40
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 05:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36685282FA7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C621A37160;
	Sun,  6 Oct 2024 03:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXITrilf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709C320B;
	Sun,  6 Oct 2024 03:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728185537; cv=none; b=tEAu7sCYjyluLBmTz6XsYIiD6ZCfjI1JDsjf4vhDYwHeySWSVyPApIjUWhE9c6Wm2vvDl4rhia0VRBeIFrwPZHFjrkBlOv2T0LXFbnIzaq1DavIllVLr+HzifoPVVo3ASI2F0ce4NN7FLA9/OVyn6ke9Wa1OGyW+mPErgDhL3P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728185537; c=relaxed/simple;
	bh=hRAf18sg5NU05oSS3MsYOJ7pRBWWG66dR8GI8Dlq7U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3b4HgvwJ4fca8HfA4lBJBPg8L+hKIocZkrRgKUB/BqWFA4AXfCBKYWEz1RMfGscSaEZSp7TfC8rocStg936GqQcAHvFGWxl3ebnLDK0+qy2/i1UcS///il7ZBpQ6ykmYsckxKshV9sWt19cT+Ine7zUr6f+7p11SQses7Jx3Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXITrilf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6119EC4CEC5;
	Sun,  6 Oct 2024 03:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728185537;
	bh=hRAf18sg5NU05oSS3MsYOJ7pRBWWG66dR8GI8Dlq7U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXITrilfVimpXXTy1KUwIVIH0FQtv1QqrgObver3f0nrGWFvwi7LRrUNXeUeMzujG
	 mzEB1lHb+evIu2U9xvUknZxm3OzT6lucdlbJ2JAro0PgJGBhdUwPt0Kxl5QdGCW6K4
	 R8ZjgiB7Q3q/wJnNCNsZkCeoMcjHlW1DrV4O9AXHOGp5NSJaIJpXHh2zM1OJtD+DT2
	 tE+/6fRvYy2Hjxnt2km0hW7V9HTzXFuxRLss9gaWbk+UBgAODPY9NNPuII9vjSjWd2
	 3EYFPNR3CNYmoEnAhwlvfZBfvlV4/oJU8WbhIsbDV/wpEB8BG2TcF1+FLfN0K/dC1h
	 B9qKoXRrmRQ+w==
Date: Sat, 5 Oct 2024 22:32:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vedang Nagar <quic_vnagar@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
Message-ID: <nahe32vlzvdsk4xkcsykhvdwtjkzia3tk4lgnjmbtc7t5d464q@oz6lx2foy7vq>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>

On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
> Enable the venus node on Qualcomm sc7280. It was made disabled
> earlier to avoid bootup crash, which is fixed now with [1].
> 
> [1]
> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/

Please refer to commits by sha1 and subject, not by links to the patch.


Please also clarify in your commit message why venus should be enabled
by default at platform level.

Regards,
Bjorn

> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3d8410683402fd4c03c5c2951721938fff20fc77..59dafbeeab1dfd6e1b021335ba1b04767d6c24e5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4288,8 +4288,6 @@ venus: video-codec@aa00000 {
>  			iommus = <&apps_smmu 0x2180 0x20>;
>  			memory-region = <&video_mem>;
>  
> -			status = "disabled";
> -
>  			video-decoder {
>  				compatible = "venus-decoder";
>  			};
> 
> ---
> base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
> change-id: 20241003-venus_sc7280-642a6b81afe1
> prerequisite-change-id: 20240913-qcm6490-clock-configs-0239f30babb5:v1
> prerequisite-patch-id: faac726ebdf08240ab0913132beb2c620e52a98a
> 
> Best regards,
> -- 
> Vedang Nagar <quic_vnagar@quicinc.com>
> 


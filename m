Return-Path: <linux-arm-msm+bounces-79525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E289C1C423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24ACD1888BAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC722D63FC;
	Wed, 29 Oct 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMc+qd+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626772848A8;
	Wed, 29 Oct 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761756459; cv=none; b=qNw53gKCm56A5HPxXyQN+CVR3PAcP7tWi+FZh0jkIfP75WtGsb6Afwv8xbhJ3lbiE6ehxSEBArmKB//3BoZD1Jij82/N77Z9c6ZPpS0azNxkidE1FQKUHWbIN2eZ50x3cTv9cTIWo6kvFmgHztpGPbcNdK1QLu+6UOFN9kKkenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761756459; c=relaxed/simple;
	bh=pBcOOWGaRXezt8GRk5PoTNjC82ZTI+t9XQA0gwKB/hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFCa7bMd7BXH4IVNjVQRLyRZqjdSy0TUYKMy/cUgWqBpcFmbZEbsLqOx3p0fckxhetKxdmIzkjvPgX4B++31dK/aadCH11YARDT6omGrrH5m9r+HvZ0homAr0ppFHI4aSpn0sq9RB6BWkzbrxvm2UBvIDrySTIY+O9nc6HRX3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMc+qd+K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B481C4CEF7;
	Wed, 29 Oct 2025 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761756458;
	bh=pBcOOWGaRXezt8GRk5PoTNjC82ZTI+t9XQA0gwKB/hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMc+qd+KcRgFgTuLkhbxAKePNb/E4vp7MOrWdNSem8fzt6eDplE3odYrFAcAIRw/q
	 Uvbzy40HvYIlF3OzdZl2OO9hYIKkIldnPhndeiya7hj6DpCXpZVM/jXh1zmBJ+TV4v
	 A3yjBdy5aZCrI2VOxhxCT6oxn7YLKorsy/BFPljqC/06kfKVPxYRjWW+Cihg9hqwrv
	 HVoNYlKkrjUF/Pyb3z912VkmF6/+JptOQyDImWsR8cOoPP+R78rk3tVr9c3WXXGsS2
	 OnKrkSp+bb9uqtHMU8GBUPXVXNkAk7HYORfEjifTeO5aOPHx++S7kADYJrCV5Scwpt
	 pASy+Y7cmuEbA==
Date: Wed, 29 Oct 2025 11:50:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Update 'model' string for
 qcs615 ride
Message-ID: <wdneie3ioxxllqy42oucr7xh5nb3r5mzv6i5idnnstltuxrdu4@7nm33plkpush>
References: <20251029023137.381386-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029023137.381386-1-xin.liu@oss.qualcomm.com>

On Tue, Oct 28, 2025 at 07:31:35PM -0700, Xin Liu wrote:

Please make sure that your subject prefix matches other changes to the
affected files (qcs615 should be qcs615-ride), in the future.

Thanks,
Bjorn

> Update the 'model' property in the QCS615-ride device tree to include
> the public board name "IQ-615 Beta EVK". This ensures consistency with
> official documentation and release notes.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index e8faa25da79f..047ba656f67d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -10,7 +10,7 @@
>  #include "talos.dtsi"
>  #include "pm8150.dtsi"
>  / {
> -	model = "Qualcomm Technologies, Inc. QCS615 Ride";
> +	model = "Qualcomm Technologies, Inc. QCS615 Ride (IQ-615 Beta EVK)";
>  	compatible = "qcom,qcs615-ride", "qcom,qcs615", "qcom,sm6150";
>  	chassis-type = "embedded";
>  
> -- 
> 2.34.1
> 


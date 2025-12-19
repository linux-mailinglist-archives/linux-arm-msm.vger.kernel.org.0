Return-Path: <linux-arm-msm+bounces-85976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA45CD1CF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 21:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 406D13015951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B627FD76;
	Fri, 19 Dec 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2dNuMTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D452D4B68;
	Fri, 19 Dec 2025 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177020; cv=none; b=Tp22CFwmg47eU8tGoY28/u93oa2G9aZI0jZ3qdgGO0h+/FPzGORkacuUYhUQQNBZ2mHZMjfqUgM0UlLtmM0p7oPzOJYQmQgpIm8rUCz8+6wCMPIksxdBDG5TBiOeHT3u/9bGvTwSV+EyUc2sd3mfGcTdzii6uASOostG50LgL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177020; c=relaxed/simple;
	bh=pX3I54VXZttvfFVA3YxMLNVpmsQM2u4lcy8kfCEYm94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhRYnOYlHJ5PNINU/UBdxe6+EXK9S46t+aU1V8jknxQPuZjsHpCQLa3urMMM2O/Wp4yHI7tABx3Jx8SValNDOhA291knZ8gtYLMCbYfz0uDP+rcbwbntaGFifL47GNelDx11mDQ5y7onfDzUg5XZKNpuEDkmm2FyInIBxBy0So0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2dNuMTn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3197C4CEF1;
	Fri, 19 Dec 2025 20:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766177019;
	bh=pX3I54VXZttvfFVA3YxMLNVpmsQM2u4lcy8kfCEYm94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2dNuMTnK/16qiP4fS60eK5xBGmalupWLj7SjXP76odQ/OEY12nLtjKM2Jl3s0Mse
	 vATjXQrLCE7zVp7BQ4sdYpzjUTc07sZ64CksBoIKD9hnlVX/rV1bHEPA3/LHzfnBxz
	 ERzLYCnLg+rZ36Bd1//ydixTduzi+/Oc5258/UvbrVFBjNV9qmQNKbJ5+4k0Rn9VML
	 zVY4WdGEl5m5NPzX9Vkp1uteBri/Rr+ebHsTU+w7Ws8scES7Zy8Ib+Qz9OAczHbOQP
	 ROOBnJW0f60aKYvWHD+WkYK222fKJAyfCpx3jjOwEDbTgzWclz9S3+uC8XZ2ovJMli
	 3hKDNVMKezBxQ==
Date: Fri, 19 Dec 2025 12:43:37 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: apr: Use typedef for GPR callback member
Message-ID: <7rk2zdwyznc7ljiqkylmmqlakmo3c4k3r3hhlbq2j6ojujusy7@iwg6qj7smvkk>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
 <20251130-asoc-apr-const-v1-2-d0833f3ed423@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-asoc-apr-const-v1-2-d0833f3ed423@oss.qualcomm.com>

On Sun, Nov 30, 2025 at 10:40:24AM +0100, Krzysztof Kozlowski wrote:
> There is already a typedef for GPR callback used in 'struct
> pkt_router_svc', so use it also in 'struct apr_driver', because it is
> the same type - one is assigned to another in apr_device_probe().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  include/linux/soc/qcom/apr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
> index 35f44cd868cb..b16530f319ad 100644
> --- a/include/linux/soc/qcom/apr.h
> +++ b/include/linux/soc/qcom/apr.h
> @@ -156,7 +156,7 @@ struct apr_driver {
>  	void	(*remove)(struct apr_device *sl);
>  	int	(*callback)(struct apr_device *a,
>  			    const struct apr_resp_pkt *d);
> -	int	(*gpr_callback)(struct gpr_resp_pkt *d, void *data, int op);
> +	gpr_port_cb gpr_callback;
>  	struct device_driver		driver;
>  	const struct apr_device_id	*id_table;
>  };
> 
> -- 
> 2.48.1
> 


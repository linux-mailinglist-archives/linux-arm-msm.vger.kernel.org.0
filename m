Return-Path: <linux-arm-msm+bounces-20879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B18D2A95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CBDF28AF0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A06B15B109;
	Wed, 29 May 2024 02:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkkUTJpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04A15B103;
	Wed, 29 May 2024 02:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948293; cv=none; b=jbOiFb68cRyDNJYEYxP6VCujWcU6GicgXboIoYDE/L6Uv9BOo6M2nt1i2K1Kw5Ph9qOCeCebxlw1TzjKWBAVHinhfZULNc9mXgNC35qemzGIeNXhw1t1wnEWYqvXPlRXE/ZOy4hRp5AocfldqVYJd/uLuFApePWJ3bK417SnDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948293; c=relaxed/simple;
	bh=6G8j/Sv+MtbqrS9aW60pSqltpea9C3Q217H7ckx6jrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcquaKGPDiFpKa3hB6VS1CSwb7tMVp8XZYypw4e3paRIoLopTyRui7bJ04INXaTWGWvDpjjIu+ix9lmAAnCUWifMDLS9frD7CpakP35i7YEJzGrutq12gwrADGz5UTkX87xJ+WJf/m2uFPUHA8jRDDTB3HnVD+wAhjLXexTahV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkkUTJpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E954C3277B;
	Wed, 29 May 2024 02:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948293;
	bh=6G8j/Sv+MtbqrS9aW60pSqltpea9C3Q217H7ckx6jrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkkUTJpauF3WcRU+4Gxy0aKAGevlHW10RE4k7ylmBgPMrW8NB95+1VbhDNT4mFdZ4
	 PS5wdCIa1FCk79CQTZjnuxF+kxrZqxs9k+3AFsY9kThhGOZeXZYsSz6P+QATb4FlIk
	 kU3dqX08/h7fjMzjZz1nMhZR+Qin/GU3PpV+KUvFAOxy/XzlR0rxrJt1+cQr4NJqkS
	 vKFYXFPusjM0SUKVhrqpXYuQSTddxGoERcPCMHqxi6ZrvmR2E/K/51fHf+a2ToO+vr
	 UinYDi5YwEsnrkuKG4SgP0EkuKJOUeybEfGyNC+0daCADFkzoj7/DCMwjOneWbtSIE
	 OvVHG7ZmrW9Qg==
Date: Tue, 28 May 2024 19:09:34 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Richard Maina <quic_rmaina@quicinc.com>
Subject: Re: [PATCH v2 2/4] hwspinlock: qcom: implement bust operation
Message-ID: <upfsdgmg3vvx6ebehlem2u6rm6y3jxwlgvdbagtntstqsdvusp@gogo2jidnop5>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-2-fb88fd17ca0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524-hwspinlock-bust-v2-2-fb88fd17ca0b@quicinc.com>

On Fri, May 24, 2024 at 06:26:41PM -0700, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> Implement a new operation qcom_hwspinlock_bust() which can be invoked
> to bust any locks that are in use when a remoteproc is stopped or
> crashed.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/hwspinlock/qcom_hwspinlock.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index 814dfe8697bf..0390979fd765 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -64,9 +64,34 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
>  		pr_err("%s: failed to unlock spinlock\n", __func__);
>  }
>  
> +static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
> +{
> +	struct regmap_field *field = lock->priv;
> +	u32 owner;
> +	int ret;
> +
> +	ret = regmap_field_read(field, &owner);
> +	if (ret) {
> +		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
> +		return ret;
> +	}
> +
> +	if (owner != id)
> +		return 0;
> +
> +	ret = regmap_field_write(field, 0);
> +	if (ret) {
> +		dev_err(lock->bank->dev, "failed to bust spinlock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct hwspinlock_ops qcom_hwspinlock_ops = {
>  	.trylock	= qcom_hwspinlock_trylock,
>  	.unlock		= qcom_hwspinlock_unlock,
> +	.bust		= qcom_hwspinlock_bust,
>  };
>  
>  static const struct regmap_config sfpb_mutex_config = {
> 
> -- 
> 2.25.1
> 


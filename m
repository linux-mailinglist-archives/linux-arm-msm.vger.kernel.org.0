Return-Path: <linux-arm-msm+bounces-38821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8D9D5D42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126D01F24D1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCBD1D9A49;
	Fri, 22 Nov 2024 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZGhi/jk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9A1D363F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732271234; cv=none; b=omiq9b9hS0liheCqQCR3tjfh2XET8oPqZPhqng5MX5nvhJO1tbOltCNyi46qAAFvuCO4U4sMNpSoPHRb8x5as/OABCsFahJmGAR2Nx+j7g9DguP0Ivuh8a2IRiWJFvOy5B2EGv65ef3EcWxhJbMmQrnB2ZanL+g49cwM0Jk1r10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732271234; c=relaxed/simple;
	bh=9rnoHHf3OGi/eM3PFl0xOISrBSYIaWx3KevI8ScfJOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKfZ7YKNF6gTEFIbt+luNg3wws3P+kmhJXR8o24YI3YM3L6ofVIpcVSJz/cMZnIJ3DEurrsHrU+vBaK61HrkNcN5ydMTHlSqWquH/tVAD29RDh0MJ4O7676xwnhzCRj/Kg/R8rMozGrYz0ho8sNfEPNTXB7DkrII2PYEq43UW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZGhi/jk; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so11670961fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 02:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732271231; x=1732876031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
        b=eZGhi/jkeNormbm7r05AXsRa66h6vhrXVJ77ImSpaBc3Qn6a6AF5SGxRhiT5oya8H0
         jy9lGh3rJfAAUkFYy5DT6BUYl2l/f/d1/VuXsKU89bhSpDIM0Z2oJCA5s2pG4SiQGDJG
         QVtBDh4CfcCv3A4e+wlu/LyWSGGv6kCtSPhW9rW4ypaJ3cD3sjxE5f1ZUIovn8uAcEbp
         gIFUaTKlIwm/iyBgeEG/TETHoGQBmJNYyYqkZNlpr/4xRojOgD4GVhgDvZMOJQlLMDZq
         Y1LUpHtPFSg9tFOcFOzufHChHsnKG7PFa3G2hO597pl4m5TDMzllfVpCusjjC9CGN36I
         V4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732271231; x=1732876031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
        b=h46bFMnjeBC+jKxmS0uuuC3TfOFORqTYIzgyRK+IdCPbOcI1qIuUPm+dgyzvJyJNAO
         dv90UxXacq4DLJWnKxQqYdcRvP+9907Fc1R+yziFa/aoeRWMVUKwpFrRuDDXXXmcyS8n
         32m+SeA1XLoIHY2DOPgLP2XLGf0PCn+JbEI3VO/Kkaw0GyWkJakNqp8ZzOjU2AojUpTF
         /KYRabEzGiETL2MkxQZMsmlBllqKWSaxajk+85lwIAQ6iG3KUwfbuVsAH4fbyOAHjz3O
         s5AUt4eCeN33CTk3BorBDL8Edl4lYg9ggaKzdB8nVgWm/Ska1FXVqSF+8ZASJ6ryIK85
         umhA==
X-Forwarded-Encrypted: i=1; AJvYcCVICrQ7TCrn0YwNAfffIa3hrGs5N35e6dUnjM78A+/Auiuffg+V6WCF7nqeLVST4sHn+GYbY/NOB6rgyiLI@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLsiRjhD8ddjztJBc1/jyL4VfnUpeOhkIJ8tlZGss5nUsd5RB
	B0QTtNKFi2/FFmAMm9LpPl0aoa52eKnCjAQgUCjBvR0nl/TGvqKMEK1etwDNs9U=
X-Gm-Gg: ASbGncucYQXGRZgw2NdqJ9Q5c8dmKYVdMQf/yNL9Nme8YTrl4xV024E31JwRNxy4aqk
	PGlAwK5VjD3WS/B/wUVPcQdjMb60BZx0xEJiIHTOFvm2Xxal5HEzJy3U0PU8bIHbE33eoZOi6sZ
	VzykwemhRUrG4hEA/DeLz9bDs6++n/EJ94okf9AXWgXwL2Xa0tIX3GvL6cH0MVZRLtKXkLMOgnF
	rDHpJKf43ovU4R6APQ8OGMANVlstuGzgsCqEiLMBrQpki8YY0Nl5A/Rlj+ocRqu1UsdPzrwJtSW
	2Q9W0gVgCUIJM7khhvYrl29nUvZIUQ==
X-Google-Smtp-Source: AGHT+IG3oQHashA6tpFb+9+NmJi4GpOI+M8h9JPqYyxeNcEzdxQdY5O2kg12XYaqyKtAV7A8h+5UvA==
X-Received: by 2002:a05:651c:198d:b0:2fb:5b23:edba with SMTP id 38308e7fff4ca-2ffa712dcb8mr11465241fa.23.1732271231158;
        Fri, 22 Nov 2024 02:27:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa7a65786sm2280291fa.63.2024.11.22.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:27:09 -0800 (PST)
Date: Fri, 22 Nov 2024 12:27:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: Add display support for QCS615
Message-ID: <n7mnldqd2td2cm4uup6mlnmbzyg7unbzvert6kyweopplbfssz@vm3egater24k>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:51PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 186 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


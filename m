Return-Path: <linux-arm-msm+bounces-38827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 686059D5DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 069DAB24B90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12981DDA3E;
	Fri, 22 Nov 2024 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OKm/vIOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C51DE8B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732273254; cv=none; b=cOEZlBr95754erJThRilPKQeaQgzgJMmUi3v5f0CsHnT3hqIqYQsg+2BubEpS7UXu5RP401AjWIRsY3C1l/0l985sOi2iOI7hBY+cgSofX4UAtdKGhxpytG8ugwory1z6vgtNlcRf1owOt06eeK2HU/i7erckT81YrYCHhXHtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732273254; c=relaxed/simple;
	bh=esQkEv+bJkBiPxQO0jmazrQSqkgqrNZcKbFEDiYk7rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASjduHH+HXoU7dag+XgGTayi85VZQznerIW975qP6YV7y+9U7Muw/3lG29m5XwyclAX/N8mNk+ItDreTnTQ/NZDnMEZVfr9HeeCE1MKezoZnvU5wbguiqrfKPTDqWn2uugAx/Rt/j9fpoyNLwJ0a5DBLQ+QYWXWIV6Ph80R+7tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OKm/vIOg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53d9ff8ef3aso2394281e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 03:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732273251; x=1732878051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AlkHc4CfnQoPn1A5gJ9s0BPlf2Z29rGqNglkoIekDGw=;
        b=OKm/vIOg4BlzkqHDJHW+9yr7BCvKPt0Ylt1uUzMiL/bhnc26chJvvppOWUsyh4+3gl
         sfH8MBJhxk68a0UaqKnJkcpDC6WP7yEXq6z1RbMW45rhydHKciv0mUitCVB50CI5ni0w
         xnBVLHa1BMVqB9BVpt9lJ+jIEptgQoFrEXNvx/6X1waZp1E3wT9BhwWhBX+gq/QXU+oi
         XLy9qSxnFu641XBIMGN1G04ijor5fTWF588mz9cFSGruCvd1qOc08YEIPNDVtTXXKKfk
         daHOypB7GjS9UVTUJLoB7l/aGTXUa3cJPV9zK8RCm++W0IDOI5fU3cxHLnMTyEehU0VM
         abEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273251; x=1732878051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlkHc4CfnQoPn1A5gJ9s0BPlf2Z29rGqNglkoIekDGw=;
        b=RVgjvrMs+ektLN8LcyREgZh8sH8BHa3DSX/y6GZ5gZ7feHYUABv6S4AR490TyE5aLF
         8H0X56JZkV4LBgy73sG0OC4k5uu22pOEyudHMXh0GI/AdRPnBHrIi2w49F5eiYVIshCg
         wFQZj/wcyty5NMOFpvBQrVk+MC6LnOnihwx7MtQgD3AShQtvR89adhhX2mN3H0vShyeD
         JsYSEri4LFesoCDPZbGLAPNBGbaGc3wd+bmu8/PATuvMsgEQkkIH/XhroaQwGm1P0uFy
         dFREY0j6ySG9u4Eo3bCJF6+5pCZMwzeYi3KIgT2XINwyUB/SOVVw8VZ2L2LGE14u2kY2
         FBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdn/ld3OgiDIh4KF5+TNbWSex4BZJyMzinKyl4bz9Mpnrc5vEx8aUVH9uHb1uQGa+ZRSlNTjOR3A2PrMnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzoKzR+BWYb+bGZYshiMqP8JzQmzCF/oeDkpu2pH2B51BfYpQXV
	uqD5JARaQ7C6JyPPCc0XSB6WmXNtU54v89o1L7xhpIA+sNZMPYBIoR2dNCgfylo=
X-Gm-Gg: ASbGncuB+JWoeyXT+U/QIMNYfq9FT1i9kFp1oLd4rcJmAM668G/qYQj8Mxvknv1hM3z
	L/OFUhoAMESoGNJIj44vX1wRvzIXZ/IbMBqop7aD4ftnZkVqylbB7r0PyWedhJWpCIKfi7KnjtD
	kIy9eM9bj70rLRcswpaoesY1vUWVH0Cd7ov2a8f7jpGR2QPbK+SN4QLPzATBoKNAViwC5e/rVc/
	J+GtGPCQfOAs9gfdz7ID5Wdm39idRz3J8ctjArWr+k2Q67rhekKhCiLK756nTChpfZvKY079Vqq
	ixRu/y5hyeEi6MpTsbxAMEb21SejsA==
X-Google-Smtp-Source: AGHT+IHRcfY0IeVLi53bK8dwcq3XFuy2uo8jqF7yK68qsQJ+2p/GgmOCR9UBE7JD6UnJ50+els3Mjw==
X-Received: by 2002:a05:6512:3b8e:b0:53d:d0c5:4ca9 with SMTP id 2adb3069b0e04-53dd389cd1bmr937303e87.26.1732273250848;
        Fri, 22 Nov 2024 03:00:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24456b2sm327282e87.56.2024.11.22.03.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:00:49 -0800 (PST)
Date: Fri, 22 Nov 2024 13:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com, 
	quic_kotarake@quicinc.com, quic_kamalw@quicinc.com, quic_skakitap@quicinc.com, 
	quic_fenglinw@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: pmic: enable rtc
Message-ID: <4gwmrfnzqqlawgkgjd4fj3t4nkpulnxuzsc756v6uxz4dlq6mm@dhv2aqkdx7du>
References: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902104302.3959670-1-quic_tingguoc@quicinc.com>

On Mon, Sep 02, 2024 at 06:43:02PM +0800, Tingguo Cheng wrote:
> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-20482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF898CF159
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697B2281AB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF811292C3;
	Sat, 25 May 2024 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1Zt9xuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A6127B70
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668248; cv=none; b=Syv9JfPIZGi1BVv/C3qmTKN/AqAhd2OWNSfQ0oXke/shR2qrYw76vaVkjIE7e04zyOW2UeAeWvEP4vUki9L5+BtxXydp1s6Xx6CQG97rmRVHaVPW6M0FKLmNbWHu59bCU/8lpS3JMUcy0E8rBeyvufuzZnu2y/2+RXFv1h78JXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668248; c=relaxed/simple;
	bh=QHSmgW7osBH+KHXlF1/WzNWwE9eqv8p67wUx/Ts4k+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSVW8JxnDAUr4aAa1NtOn/eRJp06VxZltZaTEoplUSgtMEkfkbSSofrgyIaOd13JH19EmVG0Y7yT5SPuhPpXXjgRcZZ2ADS/DXRTzC2VAyYhYww60E0/+dNDZmGSsONpL14vZolQSYPUcTNvsJY2T/vpOZ0u/OiC4XXlTHYJGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1Zt9xuE; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso24555161fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668245; x=1717273045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eqkkaAhB5zodAiahm8ADezWoNphieJvlbxZ1nCfU3mY=;
        b=a1Zt9xuEhGY7mqVaV75M8sfydzfi2SwzfyQu9V/3H2laKtqxUCcXbjmAQsQK2qLHQs
         HZRqG2EWtd7oPS+8Q15rOnmICwsj2Gr2ZNaTXzQ1l5r9FKXgrwEoovEeV7pDHTR4j+dX
         /USe3NPzsI0SsQU8w/AYgQW9Wwzhvy+j2rXwnQoXNpRV5tlPtEFDPRO9fhuPS9Jr03Mh
         K/iTKymmjHGFzm3Qd0eXV0y4DXy+Dkp2KjPg/lqOCPPW9oj8dIuhed53nM1tZMtJo5Ns
         9wO0v2E12NXjEqZlW8dT3tPza2BieAlGrb7SJCV7OqMGfaWzg8OuHeAcfavU3i2nYspv
         pdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668245; x=1717273045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqkkaAhB5zodAiahm8ADezWoNphieJvlbxZ1nCfU3mY=;
        b=QsoNq3EbxCutu3qww/DRc+j3Dp7+h0PoByGv1Jic7BpQK1UGTbRj1gZsy7uuGMtQKv
         quBPpP55QghttwKGu9gh/hbra6X/A7eGGqBsvdqR0ihkZWXJupRk/GIQI/Syl/ud31Pj
         QXVGz0TJlCWg4lxXUSFSufPe0j8OTScGKQ5rPqylYqUQnJarB9lSiHVN4rerkffrzps3
         ebKn8EUW88D4wEWGjvQVRdff+EQOMKoSgpt+no/M1S8uQfgXYo6HZxPzAw6/IiLLU/q1
         ko8/LDY6qT9EE+kL2jcBZ2qe0RZDpPdWq4fEltboS5wuKweuNLRoZMFmBQsREcaGH9+t
         HZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCW7gaLllxrRtURW6FiX9LDddOG6nzATvx78z+NsOPR+6y4K4w1QknSxr5YWCLDd4X3GkMpjrJR8xyxAUvk1o0RsLLDXzjsjfng6WdmfDw==
X-Gm-Message-State: AOJu0Yx8DE9HTCzw7soH53crRftQWJRZHfEBV88BVu3UYhIz13Vge11k
	cQXNEseXAW1YQlmz/PhJmJFH+MifFADtmw6zyvstCrUY3W3jAlMrThfBbjr3Q6Q=
X-Google-Smtp-Source: AGHT+IHXljxuGalAvmyjvzrcNfI1wbojmx0iYFgMUe8hBfLdt+A/BD1AGKqWABqy13mTAz406l/ehQ==
X-Received: by 2002:a2e:a178:0:b0:2e2:1a8b:e2f with SMTP id 38308e7fff4ca-2e95b0bcf29mr34404251fa.2.1716668245179;
        Sat, 25 May 2024 13:17:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm8686871fa.63.2024.05.25.13.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:17:24 -0700 (PDT)
Date: Sat, 25 May 2024 23:17:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable
 USB multiport controller
Message-ID: <dazmvgycbywpsbgtrnhi4hv3jgi6lt7dpws4gn2du7z4q4ygr2@ph44udnljkhr>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:04:03AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Lenovo Flex 5G has a camera attached to the multiport USB
> controller, enable the controller and the four phys to enable this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry


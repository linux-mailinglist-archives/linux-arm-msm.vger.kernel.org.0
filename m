Return-Path: <linux-arm-msm+bounces-23903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241AB914698
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 11:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1773281FA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 09:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E0613213F;
	Mon, 24 Jun 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgvfWOkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182F61FE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222332; cv=none; b=FvsXcqEcLUPeUpcZJaFCE7dpCrzJV/txgx31ATm+Zpbr5YSYxjaqLGmiptUYN0JaKhHyh+V1QZ8d837YQBidSvK6VCOLjBb81Lg2IRveIEj5rJt+0MNF7k9cv5jhHVDERWGNeqeIpyTEUJmbQNHvlrnDr4w0AxrON5DBu5vemu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222332; c=relaxed/simple;
	bh=KN6Xy95DA/76ttyjaLKHOHB4qSMJ672x9Oas7+ljqL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lt37MLsErUFipegBY0nlq4q/b3AEzuzUV4NAzIO1zkUw7LFi6HQ60NFiXdAgDLbINbeRJbgfAfS3BvWhZL6OtBFqxb6yCiy62IMB1AgrcVoS4lxWOp005E97OI8zmZhjI6rfw7etJMuztvV28BSFvkLg2SF+QRcWplf5klTE9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgvfWOkm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so2957333e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719222328; x=1719827128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2T+vB30li/O7omHwMEYULiIVM5Yoc0a3cav+xwX2TM=;
        b=NgvfWOkmDjCsKMcGA3jmGKn850a8PJWa3z17+DFU7VGRRj8a7S3WOaNFYf4qfAugxH
         EcgHYwYvfFA+flOgytHVOPhnFTRFtq6cd7/OlWfIRyDjJuyIhuwhgGU4XVlBfGhpEDVs
         djv47AzgB2d4LhfyoqxMOE2Hj9Hc47lQsq5irMCshUkjSSCZJyjMnZUPMp6VqmSY6Pw4
         DGqlvupucKVTBfypvlB1nvLy9XrhTzaY6jcs1X5uqj4N3yfdLKqZi9tKoIM00Qlk1rCr
         DDio7ksusP7cJJf8sKvh4Js8ZowZDMkJBQjUBiiEIuhPjZVR/8lYdGD5yCRfbx83sniv
         L6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222328; x=1719827128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2T+vB30li/O7omHwMEYULiIVM5Yoc0a3cav+xwX2TM=;
        b=K1q5Euy52tJocuhuZYyR58mlA6Zyhg+8RgcbnFw1+afrMZzzP81Gc5HGLtQhA93N+H
         Q3G/du0rOPXzipB3K5U7uQgPhwekwG0E3Va20fxjjYknh28rd9Yk2SLwFsIR7puvgfpn
         nkgGFjA8ROiI0K02iAladUnbSGE+c7r+OfFoaqKHnhueqZwjzYVEgff1uD/rI3cjdCMX
         6dZPKLi0qWtJ4N9Zcvp+LY0/+2ibfRfCO9KdbHmRJG48INAbzVIJiineEW4bLVfePxd5
         nWfglTiG8UUDW+kzWvXav0eU9uXG/2dyHVeJX83kcP4G++lK9AAdkU3xpwqRhOrHilLE
         fLDw==
X-Forwarded-Encrypted: i=1; AJvYcCW8zu+pLb19kojpr4o2Q51gu3HM1j8a3EHonBQOSilh395kuPKVFUeih3QKLB4dttkHB5Jl2iX0Rnwjl7/b3MsSSKlOSdo7r5W1OizQSA==
X-Gm-Message-State: AOJu0YzKvdZ/ZGRYzWGSWNAujZhDb5VbwAyqPdT3mQxaFnUXPmzY067P
	aBMBD1I/cseIYIhBnq8bPVBrvuDMXgHPBobGspXBapkGz3V+2z6/nVJwOztu7To=
X-Google-Smtp-Source: AGHT+IGs0sNNK7EbrMz9guyDVqQqxo6nu9BzMy8MfIzoVO8+KKxTpquIJqx9InsStNttCSY2VbCeIQ==
X-Received: by 2002:ac2:4c86:0:b0:52c:deae:b8fa with SMTP id 2adb3069b0e04-52ce18321afmr2477186e87.3.1719222327875;
        Mon, 24 Jun 2024 02:45:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ceb804334sm42225e87.183.2024.06.24.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:45:27 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:45:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, quic_rgottimu@quicinc.com, 
	quic_kshivnan@quicinc.com, conor+dt@kernel.org, abel.vesa@linaro.org
Subject: Re: [PATCH V3 3/4] soc: qcom: icc-bwmon: Allow for interrupts to be
 shared across instances
Message-ID: <qld47ryqxciamnz6jmdqtad4s4cemcl2r6kpsd5gst5ccwa5ma@4ej2gzk2vce7>
References: <20240624092214.146935-1-quic_sibis@quicinc.com>
 <20240624092214.146935-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624092214.146935-4-quic_sibis@quicinc.com>

On Mon, Jun 24, 2024 at 02:52:13PM GMT, Sibi Sankar wrote:
> The multiple BWMONv4 instances available on the X1E80100 SoC use the
> same interrupt number. Mark them are shared to allow for re-use across
> instances.
> 
> Using IRQF_SHARED coupled with devm_request_threaded_irq implies that
> the irq can still trigger during/after bwmon_remove due to other active
> bwmon instances. Handle this race by relying on bwmon_disable to disable
> the interrupt and coupled with explicit request/free irqs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


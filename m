Return-Path: <linux-arm-msm+bounces-18390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0878B01B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 08:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6FD1F232F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 06:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC75156C6B;
	Wed, 24 Apr 2024 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjN9qFk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D563E156C61
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713939732; cv=none; b=LmeEvilhcx1Vm9gfNL2oCjGO9edAD65FfOassswbEieL7sBLSkQYDPX/etJHHR1el1PDeYFF9fXsjVlNtEZGUjPlOBRKnGLWn83TADbS4wB01xNkLg/UJyKq+MSBxOQuxc9EEp89XGxAkfxSZzKNeKjSxoZHNUN1LnLrYgZl8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713939732; c=relaxed/simple;
	bh=MQPtpz9vQk6STzTFq4kGJqD2Y8NKbLZKvqBnfStP6A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX1mRxWfLcdCPh6WNn40Ke0Rbz2vhHnMKsjGaXDQlxyi3f70tg9KqzlFrvM3gnEAMy1Nb+v2DVdNqMsH8zDfVFhGBjRS4sgYRwONkSvP3ae0rkMMLTE46tDE2B8vJdwC++AgqD+0DgRxUEmNqkYmTY+lkKpMOZMIP9fSiWjQJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjN9qFk4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3476dcd9c46so4910501f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 23:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713939728; x=1714544528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VloZgAiIDg8xCm7oqET/SZ077s2AvYrrDK0yYi3Zp5Y=;
        b=vjN9qFk4I9DB0Y+bdKT7sW+YHNVz6fselZzNefAm3qt/grlEoo/JJwUbLggUvXPuRb
         RUYN9j3K6wUC7lD0k58YQ2HZex3aoKVwTbSQFsnOCYq1+51Ad+mo0GXSwkMwYOPK0Fbu
         Bn5dQgsU3uGKZa+JfYnAeTNi46r6l4lleWl6hZTwjJqsdTP2b2Xp5OSlNZwt2aO0C8AZ
         fKCToSEZn3EcMdWv2jrYWLp5OLsGrEv5dihqAcfdV1lJLj8n+8fCPOtt3nyLBVNLq6sy
         yT2zOweEUw4S3KoExsbJIXAk0kuiygycMgji5F1Jz8O9IdZCPBH1rLjyoGE/R8k2qm0W
         O3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713939728; x=1714544528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VloZgAiIDg8xCm7oqET/SZ077s2AvYrrDK0yYi3Zp5Y=;
        b=kv+p0BSLQ1qrj88/1f0uZdu0m9qtymc2cdhFH9yGyiMK0AZiOtJdxTKH4iZMQFe9CA
         gpVfhdgP2SjbjunDshi6IC/++DgGgTqopTPBPTfSq/t+UQs2OGuP4CNsdttMTjl/7N0P
         a7h2b3a+58eVHR/rdLl3i1dsCU6YvodsXWfXjLc2Qb2JfqveJwfY5Qph+Oiq3abTbmM6
         tUo+bYfZlCFCZ1PifHifgTm2PRLQEbnuZiYPnL0joeGQTEJEFefDYmFQQb/ZwcEbIAtP
         t+1GlBfbwK0dMrEHnHRBRfYP6PQ7nVDRxwI4LCYyuQaxAIJZLieFzKVU7uY4lv0i+YsN
         sH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMNLW7DIz744BbugWDnPFPQiMHML8ihpb5zScXm2sdkGK/hhNg0ueXCEUhFa0k5D0v/wefHC6btaFKtqkywmrJr4K7zIgo8ZL7dc+qNg==
X-Gm-Message-State: AOJu0YwxoG00VdAKJqhXSOXBKJKi5TsgemjVPZin08+/8UYAhtLqycxU
	4vhF8CWnIFSx6dx7Le8GJ+Sa3S6UdsFYaMUl6bphx1xVP2uzLW7o81qK26mnFn0=
X-Google-Smtp-Source: AGHT+IGJadW+BQi1gpqVuF5OXatbduHm+VwYwQa5DQduYxoVoCem+8ZwKXGiMeEv76x92rCZ1Fa+yA==
X-Received: by 2002:a5d:4892:0:b0:34a:4eac:2e43 with SMTP id g18-20020a5d4892000000b0034a4eac2e43mr933848wrq.68.1713939727761;
        Tue, 23 Apr 2024 23:22:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b0033e7b05edf3sm16182230wrq.44.2024.04.23.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 23:22:07 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:22:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sinan Kaya <franksinankaya@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Sinan Kaya <okaya@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: qcom: Drop hidma DT support
Message-ID: <758648fd-9c00-4b40-a827-b1c84c81d183@moroto.mountain>
References: <20240423161413.481670-1-robh@kernel.org>
 <22adec0d-3b20-40f4-9ced-72d7cd48c968@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22adec0d-3b20-40f4-9ced-72d7cd48c968@gmail.com>

On Tue, Apr 23, 2024 at 08:51:36PM -0400, Sinan Kaya wrote:
> On 4/23/2024 12:14 PM, Rob Herring (Arm) wrote:
> > The DT support in hidma has been broken since commit 37fa4905d22a
> > ("dmaengine: qcom_hidma: simplify DT resource parsing") in 2018. The
> > issue is the of_address_to_resource() calls bail out on success rather
> > than failure. This driver is for a defunct QCom server platform where
> > DT use was limited to start with. As it seems no one has noticed the
> > breakage, just remove the DT support altogether.
> 
> I disagree here. This seems to have been broken your patch.
> 
> dmaengine: qcom_hidma: simplify DT resource parsing · torvalds/linux@37fa490
> (github.com) <https://github.com/torvalds/linux/commit/37fa4905d22a903f9fe120016fe7d6a2ece8d736>

That's the same commit that was mentioned in the first sentence of the
commit message.  The commit is from Jan 2018 but the oldest supported
kernel (v4.19) is from Oct 2018.  If someone really cares about this
code then they should be testing supported kernels...

regards,
dan carpenter



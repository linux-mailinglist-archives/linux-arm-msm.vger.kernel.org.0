Return-Path: <linux-arm-msm+bounces-47974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E9A35526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 04:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DCA616A03E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 03:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5323B84039;
	Fri, 14 Feb 2025 03:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OjXZjuKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741952753FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739502171; cv=none; b=tjILmBVvsALwBpCBW2qi9S1GHxe+JwjjPI/r1xxEfQhQWBv7Sawbvlj80EggRvkanLkhupHPhbTOcPpAWS/5HFRTNB18HJMm94nd90s584uRqK1g0+aBLTykmie+jLLmHi0s2Wo4tKg7nx2MId8ItbwFaWImiV4ADYvtPQupjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739502171; c=relaxed/simple;
	bh=310SCreLOWjVMoQwtab8Ic7phC4zW26IofrQVnTjjNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV0kFoS8A/m4xY6eDMFDwgaTn/lAic3DtDD1I5oFJUN8MO5cJ48aD5PAzM7GtBCTnfkX3LAw39PxmS2x3IndeDnTzBzXiMC5G/pOvzK//+CRHYJy3Vtja1gFBbFizemom8nL6AL310aVpA37HcEgohondG57khxeBqiAMQlA1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OjXZjuKH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450c8b5b3aso2648235e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 19:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739502167; x=1740106967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMXPC0n9S8Wq9vfM8cZ2cyfmYZ/PuB3p3mPS4Blfh8I=;
        b=OjXZjuKH9byrzwDx43ER1sjVeOiGJFLlz4EP+qDFQjHExZJ4s9fCjcpjXVurq11lab
         /WP+PBNA6fqKsfxH89OkvaoNeRD6Z32R5DAcWGFscvPC5dyEa6vvc957sbVaw0SCLcFb
         DnuKZwn+jnIAfU09Edd4Y/cKWSKZPcjpzyLIh4PSIXlWWl660At8VImy8bcudkp9Jo+j
         uRUk8ljPdiEI9C8HDOfz3FhVv8MYcBxe03Vi+PoftvAXxJ8/VijEHbPcn6TXQqIpVnws
         l8cxDGnCYhWNX4ZMeCFILCSP34+n6YT0rt+cdRVe7NusEfqQ0VOK6dj63HUC67TuaW76
         UZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739502167; x=1740106967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMXPC0n9S8Wq9vfM8cZ2cyfmYZ/PuB3p3mPS4Blfh8I=;
        b=oP8+7Wt9+dhE0EkeYz1lSCpb/de53vq91zI+ra0kgfCuP5DLd7rY3eaTaZxwtp9VrY
         8bmrXqij7BEiEpvtqfliCyDzHnVwBqEB9Az0XKXH68OGPIHlH4cK/fJbNZtVCD7wu3w1
         YS1K1Km6op9LF1xqSQKxdBrPZ299HQ1kMF1I+jBguXZfDDSwTRAGwgVorh4yi5ntRzdi
         bnaeu0UDtOpjTZ7Zowa5MixL+GHAynWnWSgvy2PiY0qhsw7AsYzuehtjR6QgOSMtXAIi
         VDdxCnF1BP8BLgvs0Xgpaaec2ab7u6DxaUmR1H6/egxV5FDW9b/DUDu6tk+d2RkUUaND
         pFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoZjY6CqDJJhECK0XxJSAeB/pneIm6cS6RZ3n8jiDHvUxIS4oGSF4BsTadiTSfH61XD5TOemhfQNQPMlhy@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfGhOO0tEs4iztc8R+L0Au1Zj/GctVabB7Cjy/NjF7Bj5FaCY
	uo6Hoi9y69gBAXEgZTiFAaHhfXgVwD5E8QDXevm9zp/5ZvJ+jQ+laSZ0VJLrwEY=
X-Gm-Gg: ASbGncvZayvinbDbTJ3dkzlNFcCbZsKOAl3NBPbKiYlleB9nl+OQYHWisaSeGAp5B9a
	XWx60ufBkxEr7rDy9zhSACV9zJ9UquDqF6ab7xAkmK2lV6U5nG8+jeN20HbNwSoybORC//81Rlr
	AlrPI9WJxZvc0E6iEO9wXDDfSctF4xktHxKiT9RwhO0fmksUCpWJINm75G2gF44vm/GBNf1Xuqd
	Q3bNG8/eRjfng+Vpyu3+cgEWf2YWYXe5mjEO7ZU+kJlRkCY6pdx8o+NPsPu7D9/cE46NpOmBN+R
	iCoXDzh+AEpDODoHKIev7FCZ/WdiqK54B1uI4MT+lM/KDLR8Gl/zgo73ueEbLY3HONx0TGc=
X-Google-Smtp-Source: AGHT+IEiisR2Dr3bIqWPVy/kYxhsVVznWxSw11t3tOyaPR+gHNxORbGD6+GOA3VnDVeXzhuCObwtWg==
X-Received: by 2002:a05:6512:e97:b0:545:2a89:5673 with SMTP id 2adb3069b0e04-5452a897ec3mr41274e87.9.1739502167443;
        Thu, 13 Feb 2025 19:02:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09ab7dsm370613e87.61.2025.02.13.19.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 19:02:46 -0800 (PST)
Date: Fri, 14 Feb 2025 05:02:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: Add BAM
Message-ID: <v5eipkz7daurxueft66f5kxzm7fnjamtzivzoldztxjy2f7vbv@2ju4jvcrpefc>
References: <20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com>
 <e0ef29dd-afe4-4ad7-95db-d21326744c92@oss.qualcomm.com>
 <CABhZbsXo69FL-xUfg3a20RybO_uRmsOKyMJ2w3qnpk+8pYyUqw@mail.gmail.com>
 <e2b31450-c428-43c3-b25c-3ec130171011@oss.qualcomm.com>
 <CABhZbsVUY5n3bL-vbzO-xdDH6amC7FYmZHuRTh3Cb3OiQSa-3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhZbsVUY5n3bL-vbzO-xdDH6amC7FYmZHuRTh3Cb3OiQSa-3Q@mail.gmail.com>

On Thu, Feb 13, 2025 at 05:25:58PM -0800, Rudraksha Gupta wrote:
> > Did you keep your changes that shortened the sd controllers address space?
> 
> No, I changed sdcc3, sdcc3bam, sdcc1, sdcc1bam from 0x2000 to 0x4000
> (2nd param of reg) as you requested, however, I got a splat.
> 
> Please let me know if I did anything wrong. Thanks.

Konrad asked you to increase the size of the BAM devices. You've
increased it for both BAM and SDCC controllers. Please revert the size
of the arm,pl18x devices (sdcc1, sdcc3) to 0x2000.

> 
> >
> > Konrad

-- 
With best wishes
Dmitry


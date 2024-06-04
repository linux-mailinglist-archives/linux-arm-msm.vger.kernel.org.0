Return-Path: <linux-arm-msm+bounces-21597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A98FB21A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2743128303C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5724F146001;
	Tue,  4 Jun 2024 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FfiliTvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98004145FFE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503958; cv=none; b=JibKtQ2Q9U3G85LuYQXvDdjLoocVroQfW090vO2/J+XjtL3ggCnsizhQO1eTbv5NapYMaxvDvtuPZPrw0vPRo3ZLhbGUO4ipm7YgrgLeE+aBVP2cBxDotrv47ysqqZUxnqjDYvKnMuHXAwBbvbRNZt3Wh9mDcV9zbZL5k9HzFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503958; c=relaxed/simple;
	bh=s1VCyyJJljzsAGyKD0o7mdCoAu+eLFprs/YEVsgvPA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2jI/4Yp1Z5OodVzJRbqZC3vdB3qyV8KzXa7UahSrwMXjKHZAdPfIJNAY9rWALLEmKDKliUGahhosPi1TxINak7z9pv48mcwVqv6aGPI3VsudEFISFfrPae5sZwDgHfo14vbnK8oIm4c04bNa7C+qqFyvpy8mCdw0xS29z4y1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FfiliTvn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so9679032a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717503955; x=1718108755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9gS0OyJH72V5TfYu3VmbBAJJsXIwwQ21Ck30Dm2cAY=;
        b=FfiliTvnArvh3SByvoAAV/xMv7XPhD6qoBLnLSUlSJjDfx8kIuHIQtasx2vLbNgEfn
         EdPeK23fBf46DLNcyzwk7G/EGkPQRXJ19PAi6bv545zVTBJ/bVtc9T7Bm9T6ejNvAoOM
         TE7OLRtcnNqVkjry8QXaAeLh1Wuqzi5OwPlGF0Ldn9dg0VDaj3gQFVmPuFd4NMRa0Y1w
         3T24TUCguST8xqYw1o0vmFSDpvOIOAa5SZ9urigwamu+0Ro9OB5CiH8YH4nOTnt9Cbz5
         19getvDlMcUFhcZPCcT1FoKCtL2WNPHWe+gcAfyoX/Vqu2Giusx4MluiYE5YW6nD/FzR
         hW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717503955; x=1718108755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9gS0OyJH72V5TfYu3VmbBAJJsXIwwQ21Ck30Dm2cAY=;
        b=th4QKiVdq6SnxAGAJadhXmSRDOfTcLRNbNNPSuelAPFqi4JyiGTatboBwxTXbsqUr+
         gFmSny5EUWlKZ8F3K5d3juPxxPXIvV5iU5Yoe0uKKJ4lvvYBWlcGDLpXfLZKGn5690mt
         6dlueXYeG5ji/qvsvkYSvMAa32kI812IAO8Fozb4x8B0Itw9mueaQW6IcYFEdakJtRFE
         n69rB5Berk8k7/dnxkQnX/yFBqP4aXJBHYderfzt88UaqA2nNhURlnt861YdLSw5Zm67
         vJP0zebHzYGdvmICqHx1pv6J1yRL488HZoRRs1JYK1zSfsdePGS5x9QU0+1mBHQJQvr6
         15ww==
X-Forwarded-Encrypted: i=1; AJvYcCUiMfEZa6w7metoIA58ndtX5U4CKRreZ2LNwxcKL8pH0SUiFuQ/exfawhcvKJygNX4PRkyaJRHtk98o6gylGn/OScdTlAFJrKVeoVHAjg==
X-Gm-Message-State: AOJu0YweCz1gjy0r8mGFw+X+gB+/jvkw6DnBTXl9Kk4Ovq+hOBYCaC3d
	KX6VEI4uJQnpuY/Sk/pubpVu5GkroM/nqj7YlwWegcJSRYPDZqZgv32OD7zBhoY=
X-Google-Smtp-Source: AGHT+IEN9f8uev3FXprfAoYc9A1GaTXa2CrF6gqcTsV0n51gFLuo0b534nnOFA35YyhTJtD3rOTrFw==
X-Received: by 2002:a50:aadc:0:b0:578:5f53:f017 with SMTP id 4fb4d7f45d1cf-57a7a6bb3ddmr2057448a12.6.1717503954639;
        Tue, 04 Jun 2024 05:25:54 -0700 (PDT)
Received: from linaro.org ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb825esm7298469a12.32.2024.06.04.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:25:54 -0700 (PDT)
Date: Tue, 4 Jun 2024 15:25:52 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add X1E80100 Gen4 4-lane mode
 support
Message-ID: <Zl8H0KOrfuF91kpZ@linaro.org>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>
 <Zl27FJVU_YHokCiD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl27FJVU_YHokCiD@hovoldconsulting.com>

On 24-06-03 14:46:12, Johan Hovold wrote:
> On Fri, May 31, 2024 at 07:06:45PM +0300, Abel Vesa wrote:
> > The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> > 2-lane mode. Add the configuration and compatible for the 4-lane mode.
> 
> Same language nits as for patch 1/1.
> 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> I tried this patch along with the DT changes and the link on the CRD
> still comes up as 2-lane:
> 
> 	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up
> 
> so something appears to be wrong here. (I noticed the same with your
> next branch last week.)
> 
> How did you test this? Does the link actually come up as 4-lane for you?

This is the PHY part. The controller needs some changes as well.

Yes, as of yet, I'm not able to bring the link up in 4-lanes mode.
This however doesn't mean the PHY sequence is incorrect.

But, I agree, maybe I should hold on to the PHY changes as well until
we get the controller side working as well.

Thanks for reviewing.

> 
> Johan


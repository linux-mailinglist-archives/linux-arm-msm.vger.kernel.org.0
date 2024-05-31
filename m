Return-Path: <linux-arm-msm+bounces-21357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE78D6A2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 21:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DC71F2A62A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833AC178369;
	Fri, 31 May 2024 19:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUJoSd55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39247FBBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717185032; cv=none; b=DsEnh4U9Zi8Wgk70cbJyt51w9OzTcsNtSLxCPkuijr7HDrDIGdiSXoxPU4BrIMvXekUN5RvotbkALC5O3jTuURsnCX6tJCk4bBAFHqneg7D1CvnMRtjQ3qnMoW8lpJNy+1X1xn1B8KnsTjBpwPKA3h5DCHQ/ISg6anYezhOyNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717185032; c=relaxed/simple;
	bh=f1akKPVORkIyg550KoLiKCAWrsfKqsVFxRZIPvcbZPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShepVsrz6JXYI4315oFtvu0mDbs3ZrLowb4h7xbyu7ISxhmS+oQMf1Yg+h/aB6oc0A/MCu7pzdRf2QWwAdKGj+3sHT30KmM2fcIVDs2N1DfFyScQcPFrkHM+jKSKv58m7KPTT0xYmXlLUuQR6GwOjxH7PO+Tb7GEAu5Hw+Yc6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUJoSd55; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e96f29884dso27807671fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717185029; x=1717789829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU2ryqJo2RbqRp0VMOW55np9IwacuNJWvzcVOo4CArU=;
        b=nUJoSd55JPTRyfeQ8dBevZkwESFBStpRt6xex/T+Sl1NTf1vWzMY8UxL4FSD1kPkSa
         Tu+5nnLS7Sh2sMfywQHLxB2IyEwLv7Men8VZTrbpBUeZQbkWcG5kGllkwGXYH35mzFyf
         sylGXcIZ7ArzRvV5AqxSOOt1ZaSdQWMnbOw/kZ2Ut5o+7LcuTq4qq0eQBEV18g9JqBsc
         Ol2bEmQHNe1wqOFf+mllnovV+m/uqpLefprlaBZRI9YYdgdkEOR+VEhwsvIYQBkBeZuB
         eSqyPkFinCZCxqC7FbQBXsyYK0dEGVrnDyPM7bIiPXkAK7yOZAsTzax/CLUXXVzaJzay
         DHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717185029; x=1717789829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU2ryqJo2RbqRp0VMOW55np9IwacuNJWvzcVOo4CArU=;
        b=Ybl82UkJjT7cdHzfSeLdkcTSPauHgqqVjA3dyACVh139Yk4nKET6ZfJTF+FEylk01H
         faZjLsvQc4ZUUGH4omLJE+tZuSrOZs39x0ZxyScfSMB3tWK+hcDkbD4xt1niliYeKmGp
         w6rdbmBYRHUT28nNvJz4QDVtSK0IWDMJWLGIC25jibQWKPW1ok17s/9x04oom7geQ44W
         vCyRoDvvWUoMnVweCJ08UAXASSmxGH/3oamX/tyGT+1xIiIW3bdRhGz2vR3Dku8EWPPg
         mmMl0eXLptRRQpWexgmqOe7yCnXsLKH0H5W/cNhUBcGZSNGK/QfZsKcYMdIVvagf7NKm
         Ux1g==
X-Forwarded-Encrypted: i=1; AJvYcCV67H3Ij0A2KZDUlqS7k+0DahXZYXWZjKagsJmGwG+GLIhoxlajWpmwuWL1AKKuSn/2wWeF3T5eSHzIvacEt/FxHhRIs6geFVd30DUsyw==
X-Gm-Message-State: AOJu0YzNy7RAjEd1NHxAgdBfXVTjcscpMzLxERIfy/0p4L8IFACKbBLd
	FtNIphjibWbPMBeAapU2Ruf3eZHIa4ue59xLQioYgR6MH90Z4wwZ/QvfMgEJzFw=
X-Google-Smtp-Source: AGHT+IFFrDCc8S7OXqYwwrRK/3LCw6k22ohK8j3g2b44ginDvhYF+tDr/CvgM1Z8qwHTb7dniJuQ7g==
X-Received: by 2002:ac2:5101:0:b0:52b:797d:efd4 with SMTP id 2adb3069b0e04-52b8959c55fmr1680065e87.16.1717185028871;
        Fri, 31 May 2024 12:50:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8beaf911sm206658e87.20.2024.05.31.12.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:50:28 -0700 (PDT)
Date: Fri, 31 May 2024 22:50:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add X1E80100 Gen4 4-lane mode
 support
Message-ID: <ubyvrmv3giartl6pnen5dbis2yz6y7r6zvihorsqzsfof7q7la@e6xc52ss5qyr>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>

On Fri, May 31, 2024 at 07:06:45PM +0300, Abel Vesa wrote:
> The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> 2-lane mode. Add the configuration and compatible for the 4-lane mode.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 42 ++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


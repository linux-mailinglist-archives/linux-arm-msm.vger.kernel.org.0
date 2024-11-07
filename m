Return-Path: <linux-arm-msm+bounces-37218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3F9C01CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FCA71F21C56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C291EABC7;
	Thu,  7 Nov 2024 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiF/SwaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831EF1E9068
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973758; cv=none; b=CfMGDwODE19gF6mG7VdCpGNLOxjniIhy5O9088wLR8vMdZEHZjhXXivmXO5b6DpfLynvII+MMtahnrhwWRrFD57UK+a9KI10B+MiOruOZsSDwkhSR3/7tHc7MKtDcbKYFTbju0Gniw0MN1I+yisKqeLHwWY7KWsoQwEuVx5xQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973758; c=relaxed/simple;
	bh=rrFkrZlWWI0hjIM6aakNetJyy+/N2IDP48A0219Jsso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmQ1WXL8uKiK2IPKUv1aiiZtD612DXx/n2n4eV5HSp8sjrv09pkE3sOn+NMeTxl8wDjpoG15Q0wipJ3NMZRxtT/XE5FnjehvIEO9UsSw8LHLQPK8s17JKDPs7SmQIM8j9AajesQP1v5/rATs3ZcLO1zuvHYpAsN6WrDW0a/1L/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiF/SwaE; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso741788276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730973755; x=1731578555; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D28gpWJQyzf+Jb27JMYfEmpZQa1L1wKrWQ672EFcXpI=;
        b=xiF/SwaEzr4YqyhYpqN+6zTzy0WYFmt/Kz/K5Xxcs9Bu5roZG17u6JmtDoY7eijnz5
         /f1H5OWjZzDdpiSnFnb9prPNKMz4rSBYYlLB2ywci9XdqY6bt7c1v7DrdosTsw1Ru302
         Rf8o1dXu548mqOy5wrjzJXGTOCUoeVcBzs9lTP6x2A2bgH1k5J5UYHZhc6oxxgjHUqu6
         UJxUDDIAmY9gJQyLnBsCQU3gPp9O7cEZNkCXzWsLkoOjjAHpKOr3gKCG0j2dpHzuHDCP
         Ui1aYngu4FimFC3lSbEXhyOSuk1tM5FYrgImkPI0/6aUb3GM2oZ2d066uA6mj/iEhmh8
         2nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973755; x=1731578555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D28gpWJQyzf+Jb27JMYfEmpZQa1L1wKrWQ672EFcXpI=;
        b=tKSydxsc5f3Hq+ZXqRrcK8DyASVowzaLmVIlg4KfUcaxnqyKwDSxXQrNGf82F5hxoO
         wMQ6vP3kU/EdkZAEN87SPAQEKG+gcafLb6aFwBjq+z3kcCXxrd3NytoQh44jpVo3Myv5
         pNDXhFNhdrPZJ99RWBOCcdxkLJvOl/4pDptx4YJVY1S3R40dAUYV5kall0AfNatU2LA9
         vzW+/YA92lUTHVoTmxEqNx26geKC4n9WmgIH2L+6cb8QVo9NgiJ4yKZKwBhTcrGNwMQ7
         rtsviGQQbxdOAbCe6aT8zXJz7eyB7iSXPlwlkCgRgqdWTytaUeY1kT4E5eCIxh2d/BpS
         BicQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvMu0aUPrOaZVdHnAQsaCrgB5NjBx0nU4uC6U/AqClQjBEsxWsujFaKyHLILERUKzRDJWZWoZXFlI8Slu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gjuRasfjN0ZSwYq6Ag77Q6iyc2yAi5yYhAToRfWGO/kEkhu/
	RxjtiaTZh68126E/3fvFrMSklWs8OEkSdNLaZ8YS2hfRbkNceYbfPFwSjTBHpFpHtEgELPBjojy
	q0omq5kpX6a9GOK8ulyyPvUh5yS0bahIOE4j2CQ==
X-Google-Smtp-Source: AGHT+IE/N6BxHOgUlhwg4VpNEWtC72YuwqijRtbg0C1H/YYSnsHhIaLL0lXpHYSvoLQdz0+PgHQfBX6ghvJihbhPCnE=
X-Received: by 2002:a05:690c:600a:b0:6e3:2e4b:ad9a with SMTP id
 00721157ae682-6ead5fa0979mr4896337b3.12.1730973755353; Thu, 07 Nov 2024
 02:02:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org> <2024110729-trunks-hangup-01b5@gregkh>
In-Reply-To: <2024110729-trunks-hangup-01b5@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Nov 2024 10:02:24 +0000
Message-ID: <CAA8EJpq2Wp57vNoUCHKB8yVvscdMD-4m0k-OZqKjewYfxAvPJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2024 at 05:19, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 06, 2024 at 05:45:55PM +0200, Dmitry Baryshkov wrote:
> > Instead of checking if any of the USB-C ports have orientation GPIO and
> > thus is orientation-aware, check for the GPIO for the port being
> > registered.
>
> What is the visible affect of this change?

Currently no visible effects. In future it will allow us to specify
that portA is orientation aware, while portB for some reason doesn't
have a corresponding GPIO so it is not orientation-aware and can not
report such events.

> Does it fix an existing bug?

No, otherwise I'd have added the Fixes: tag.


-- 
With best wishes
Dmitry


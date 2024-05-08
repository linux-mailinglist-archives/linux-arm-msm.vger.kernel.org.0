Return-Path: <linux-arm-msm+bounces-19540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9528C0716
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063662834D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B592C13328D;
	Wed,  8 May 2024 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ffkh6TDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E262B12DDA7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205866; cv=none; b=JI7KYJp2kZYZwD5WT66i6ovwMV08aGAc9kVXPM8yOBYq25Sz97L0/XuTCVNTRfHUU00p/NzMv8mVeTaTV5ZTGoFJHIgNwm3N2gpIDYb9S34nk6BIVeiLOxeFY8OhKhJVFfE22XSLvGP7VL34RWis4FCT0HyQqnvusREu1ugw358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205866; c=relaxed/simple;
	bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jg6yPLPC94NLHiXMYw83DzcHAAdbWNOHQMIKyHsORunShqRuq8EAZRPBbhzTHlMlhaz9q3VysBWX05at+utmrP1PYg+QIGMdB2kLC1ZvBhe9bXDHan52t4g89RjNASeDI65xFoCQhWxmVrBRjqHzgHJTcC9He4STlX60JOP7gvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ffkh6TDt; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-deb99fa47c3so270866276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205863; x=1715810663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
        b=Ffkh6TDtNJxRiQzhkKqFgYKMDl8LaG1wF37URp2c9pcjhUftVdYOrwUxlosojIdCnW
         kfIm7Yez4o16DZTSjyObrs94dOfdm8gRKZmCR5xgjm97lH7a6fHKjZHQ0QwiPo+buL7+
         KWMOQwUgYEGXUtsMEUg0sxoveOELRlrxrT0Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205863; x=1715810663;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhiu1ZoqjVzMKdpVSz+tH1AGO0ixzx1LZClfO6+1N8k=;
        b=iv/0C1sjXqtPDMYgLbLgMvKP/5gmWB/9OFNL/8cc5Nq2Vx9U71Sfz9/zLA/zUIkE0H
         0lEfq3NCl2Bq7wOccBA+NNHND2N2jjL8yCFrzX6RPUUjEw0BI9v7Vn7i//6MARdXdwPC
         Yt6JfUaUeA3Z0TDYEByd7kxx2jXxT2YPCTKV/Wi+zwTJei3WlFPn/cvXGKiWyHCLVkyr
         M5m/jUqUxEdeLiLyv7XKAyuJwq++P8fb9iJRR1ql6RLOYaSKbFKF4IOUWjiSIP6rCbn9
         dly7z+D2s+R/avT9Y0PldlekiZpylHyGaUEoXxYnMn7IgFEMVOxU/SC2/yVa2xQWYnCQ
         E2QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWpoutSV4r3bBcXsLTMSwXDZPybY6UQ7mqBgCddZ8q+fNbhUawwva1IfKSKStyGsDJq9KSm5oCO1OCYsazW4LjidFfqWjnps1WzFzUlg==
X-Gm-Message-State: AOJu0Ywnk+NBGywsY/gI5RgZBNYR9TxmX/GTFF+9y+z/7Qie0qTiekKK
	1vo44ym/vqPH3jDi/yGtgudEkoBcEc+RQE8JMH95U0pxWeFiojc/W1eJX0cT0ykF8Z+MH0M8+9a
	p5fClSft2ILEQGwAUKUpf6hjdGNc+n0a+4Xud
X-Google-Smtp-Source: AGHT+IGNx5y2BY9D4mJMH83J8PD0rFPl4R1+a2ILIuqwXXx76mZzGSaEjAzEBuASx0Sxf34guJveW0UaaWBsvsBJ1t0=
X-Received: by 2002:a25:3041:0:b0:dd1:7128:617b with SMTP id
 3f1490d57ef6-debb9dba556mr3866366276.38.1715205863085; Wed, 08 May 2024
 15:04:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:04:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-7-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-7-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:04:22 -0700
Message-ID: <CAE-0n51B+czEMznAqrwzGyUpK0960q-HZDVqTUprvRwwnXuerA@mail.gmail.com>
Subject: Re: [PATCH 06/13] mfd: pm8008: rename irq chip
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:23)
> Drop the redundant "irq" suffix from the irq chip name.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


Return-Path: <linux-arm-msm+bounces-20636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06A8D0641
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 17:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C2B2A729F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6B361FC4;
	Mon, 27 May 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UgiMUSAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231717E8E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716824047; cv=none; b=eDTiVvsP7a9RbXq0Og9mmqZ3M7DEGjEO4S8uH6ZfLSzLLkf/jE2uPV1y24IgVAu9cTWaq4ajgH7O3OjH+X+oE9aUvkF4eY7usPD/yx/LtnE67uNUC9kRovXdmTfoHxRDOKk/2cEpm4g5No049m6x0x/2p+qL3qYrn5pKbcS8oWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716824047; c=relaxed/simple;
	bh=RRCuBh7W6wPfh49qqUiZszG8NXQpLse6WVAdpgbjefI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pc3KdiSwbFaOWXTlEGFleQPefOs0jIzVsv1pxaUjY3SWy8rkkL8RbKc73qLId83BYLXraZtTurLpr0xNKF/9gX/BuzhamCftM4FH4G6EAeytXzUXgy6MDuj01A4FRAYUyeuE/D+im4JbQuyIp6muKRJuLo7sQhGlu0eSd8soriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UgiMUSAx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e9684e0288so31067911fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716824042; x=1717428842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDBLdo0ivVawyK7Z7mv/FF9smz7XbvDNojAc6LLM8WY=;
        b=UgiMUSAxuX6LlR62CoEuerryQdfVanTs4n405LAYWdsHtsCMBGNTPMfLfywqtk0vK+
         VYgrAz1x0lq7UQ0oTkRuG4m6kilEvX6u9ScNuJ++PfRUHv1Em3NxXKOH0FjadT4kNqen
         vctY/zhfMnz1LVU7eTjst3XSziCwKtWWbSRHVSqRzcbDdo8YoI6NB/SflVOq9j/jwr1w
         9MvaDfVZw9Mavrdp7zk/8TBD0KmIjvVSrpPC90gimqYCWMErKFr172RLOQudumovP2qZ
         dvoebZ8AbRQYgwHW//kbTppfd9M3LyOHWhME5N6Ttyth0DFvEtpbKm4tD8gQwmwwn9d/
         muSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824042; x=1717428842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDBLdo0ivVawyK7Z7mv/FF9smz7XbvDNojAc6LLM8WY=;
        b=NdSNyXW6osleUGhweakERvSSeWcCYNfTVUMRyZe72jPnpZISyox/kTEucwynPofBB/
         fOnQi2Vf5a+y2+e8lw2UAayEaBBXK6iez6liWNSVabRDAU6JmMS1qajKehTwYmEeRvry
         ehktJFh0XZmtHIadizS0JzvrAOIS7lqGBMD/hJDQR2QkPlhSvXQUW0z/2qyeve8IDGxb
         fi5tyDrpHEQX4xbGMfZk+P/wFQ/7W1uowZkXZINjO57p1lkkOboZ0cfVdVl/qp1j80dD
         CIDBFZ7Fc3wCXsxUeaWXh50g/r+afcpwCUa9lSH58kbbZBEB5Jt4InnY6gqxnNsuk1zD
         SCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7nHPfTRaAZ53n7T8rwt3FLnG+a5SJry+1MCTL7ZzvcfMpKXFdEQMnofIOP/UK/WtwUFMJR9/5QBEtwpdzjw1YoIVXk0iNMSvA2fUwMQ==
X-Gm-Message-State: AOJu0YwmquYI2qJCJcQJ2sEXPKWMSghHKIVcaeqZuTpw7IRozAsSfvDt
	0a+UMgbFFF7qWqNHSjNJb77LbP5vPUBOIfnDC9afI6xDUziD87LMKC8aqWFtUEQqRLGgJfpw13y
	GHBZRpW9ySWkDkcBpB1w6+R1zNcotEyK6B62HgjBqkJgeFCpK
X-Google-Smtp-Source: AGHT+IFNHgFYbIP4SXVIdUe/i8k7EBKc9LawgfrZ+CMTfhw3ojlB2fJ9Ee12gO8HKL+EIQKiC8EqWtul1FeuKsbNg3M=
X-Received: by 2002:a2e:9c94:0:b0:2e2:a85f:f222 with SMTP id
 38308e7fff4ca-2e95b042c1dmr89433191fa.10.1716824042240; Mon, 27 May 2024
 08:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527144538.155704-1-brgl@bgdev.pl> <f709f17d-c20c-4777-b23b-8275f6d4f3f5@kernel.org>
In-Reply-To: <f709f17d-c20c-4777-b23b-8275f6d4f3f5@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 17:33:50 +0200
Message-ID: <CAMRc=McDRpwvTbVZVmzT45zjrZN+ZxYP8_9QVTScZCew+fboMg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: set minItems for interrupt-names
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 5:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/05/2024 16:45, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There's a set of compatibles for which we set a strict list of 5 interr=
upt
> > names even though minItems for the interrupts property is 4. One of the
> > USB controllers on sa8775p only consumes 4 interrupts which leads to
> > dtbs_check errors. Make the last entry optional by setting minItems to =
4.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>
> Can you also fix other cases? I found there at least two other. I missed
> that during review... or maybe we discussed it? I remember that commit
> was a pain :/
>

I can put that on my TODO list but I really have too much on my plate
ATM. I propose this be picked up separately.

> The commits from quicinc fix one issue and bring immediately one more.
>
> But be sure that this is what we actually want. Maybe intention was to
> have fixed number of interrupts (so no minItems in interrupts)?
>
> Also, in any case:
> Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in
> binding")
>

Thanks,
Bart


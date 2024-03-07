Return-Path: <linux-arm-msm+bounces-13597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9FC874C0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 11:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EAAC1F22D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 10:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7F383CAD;
	Thu,  7 Mar 2024 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiG00BKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D383CBB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709806395; cv=none; b=Ac7yBm8h02pqxrNyEnOxkzF58QjycgQof1gME7KUDUILP5OZttZh3CSiEgL18Z4aPVH+R9D4Y3qZ8vGiBeHa6jxFZ+Lrs3sWh9uy7JLJtuPIy7U4pI5KV4nX6k8fzERIWzC/wH2KusODwpNqoltDAVDNw3xkjXQvG7hfSV+/Wwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709806395; c=relaxed/simple;
	bh=8YdxXpNkuEwyV5gctfJURbHnkvOwyYECpGB8fspck6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnsybNqstF7tZQNpPFMBu3uM94AZbumzyIxgTxXVuegjbjY3EYovxDokbGkO9bhBpBdidVHdNC4eqg4pXRSEqaulBDIfxP5Ay5ZXwqS9Fmk+6MZljqy3JUJBlAYtIGhRZVrMpU1s0VHuU30ybx+FxCVmu7j1H4OmQU6MsZIV/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IiG00BKT; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609ed7ca444so6130217b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709806392; x=1710411192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7aOhcZHxTQGvbokl+x//A8IHaimRa07w+fuZLXjuzg=;
        b=IiG00BKTYqdKru/iPp/SEnlrGj3mAHvBtm+4xOpcTNacs0ZpT3J3djiAIOkZFWyETu
         DatCWojm13AuDqOmMhpN8KPnVHe73PYpsjrHfAXkHbdSgbp1Uv05r93VtZDIzc7kIHdZ
         BNJwkny43tMlNHxFz4Hl9Sqh7ni/1TjpVBS1Bs6VeNyVO0GGc7MPHmjnMmYCAXOFQ0Fj
         r9CfRzekTLXOg2yaz1KExr4Cz7j7tDDgMwPI4dH7k75BpZRBZUolLkyNl13U5lPYvQKo
         C1Cwhze+mqwI2BKwA6ViLbmlXIwCaGAx6/9S4p4Y1C4P0TF0WcHFIrYO6W17SE84ja7P
         7LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709806392; x=1710411192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7aOhcZHxTQGvbokl+x//A8IHaimRa07w+fuZLXjuzg=;
        b=b9VatOdkfj408Nwoz/FF5QH2ZWYySLjC6EgDcYbhsYjW7APxfYlsUTaltctbGCQ7TH
         vxsQtMus6EeLR5rTx6/kYMwO7Ta8OBzNn/Ya19nSWraOgoiesGcS/s77xQUALtEBWwXs
         K4JV8uoNBLaTZQWEXEkUcF/FI+9pchNPKveNTz1dc22QwkowwBOyq/wefw8/KwOrP2zk
         pcv+rl4odfehhKrlVv/k+C8MzTHfvEUMF5pnHBG/dkl0Bg45/LDVN/9kMOhc6PFlJno4
         x1JyrparmtWHbz/Qtt8KCxZpWNmVFdFc4DNLX6ZyW8oMdsG5g4iIb6FqRhXOoryWZtNe
         dluQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqidpVpsoeoXSi0BBG/Pu7HzPR3Yi9RzKXrYN/nk19QN0gaZdansYVnGG6jbJJvziUcuHu0ytdKAcf+FVvxJqho9wbgnicIZbs9vVmyw==
X-Gm-Message-State: AOJu0Yz9h9GWNB+lLPeY9CpC+GHBp+g1ETwU5x915Y3sQgQvhZ5jBHLg
	/P1Cs2ZiqwucZ7YEXkrWAlB7EiA1QVv5/+LHcuTLi1BzgJTDDtIQ79xGoHt+M+VOan6/2yuD0Yi
	C0pwdefWz1OZ6F6+TgbSnjysxDgDEtwNtjpx52A==
X-Google-Smtp-Source: AGHT+IHl5CeapJNGYmG4jcbrf0/CGta/u9Vx0DjHeSECpyJ/76TzCk8HkHkekirsWc2ykxiPbxF/R8BtaCyvIzxPrNg=
X-Received: by 2002:a25:3009:0:b0:dc6:ff32:aae2 with SMTP id
 w9-20020a253009000000b00dc6ff32aae2mr12290559ybw.63.1709806392540; Thu, 07
 Mar 2024 02:13:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpp++=NLZVv7we3Cwz+G7vL9xFoXqHgsMyQZ8tgdNHKcyQ@mail.gmail.com>
 <20240307100221.709254-1-amadeus@jmu.edu.cn>
In-Reply-To: <20240307100221.709254-1-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 12:13:01 +0200
Message-ID: <CAA8EJprgWiOyAk5rpaobsXET+yE1g=snaRqcW33hXDuu7DPcoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 12:02, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi, Dmitry
> > So... Do you consider this SoC to be IPQ6018 or IPQ6000?
>
> According to the chip silk screen, this is ipq6000. In addition, I have
> never seen a board with the SoC chip silk screen printed as ipq6018.

Hmm, then what kind of chips do you consider to be ipq6018 if you
haven't seen it on a silkscreen?

>
> > And anyway, this should be explained in the commit message. Otherwise
> > anybody reading the commit will have the same questions as I do.
>
> Sorry, I will explain this in more detail.
>
> Thanks,
> Chukun
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-41342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8589EB706
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB424281290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EE022FE1D;
	Tue, 10 Dec 2024 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6SpWtgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917122FE07
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849427; cv=none; b=XPr32l6JwwVk9UMPrbDLAUHnXKVxshRbP3etEhtjfx3HKbvXysKeyCnomE4ZITn78cdX0nWjknef0uQKwILlt3iEO+WBu/A6w8SbkRkzFZOZBCxtIpc1gQlZw6HUa/mPn3zE98XcXV56mBdHl1YOUrEgxW4a2u9xjEep7msA1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849427; c=relaxed/simple;
	bh=HsR6u5GkvXD7ULQKj36Umti20DpL+0zqbiGBiz0zkCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SutZLSPcj6+d8oipw0HC8lSZVSPYd5/gFTxvlNmT1/w3Pl2rPihrw+Y/3Hh2QJFtoczhh3sEqq20uo5YLD/7oeC7KYyttTaWE1b4my47Dj/tZQ6HgWTb8bLA/LHcXGX7PgslL5DrnfiRfMOpRqALAuj79lpANXbzEYR8HUuleTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6SpWtgv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa662795ca3so543053866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733849424; x=1734454224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DqC+MYPAbbx8P8+tjZh10yMabSG3vK45igpyvKpPMU=;
        b=P6SpWtgvXhHKgrUpT+/e4fjpT0O/APs5D5bdJWqnVxZJ6MUrQ/8VvBHtvwwR6ds62t
         JLjImABkpA45cz5Y8mQNsoxanWMXu6xocmp+rX7uYcHi6uryK0tksVWoe5QNBY8lPD2f
         zWuWirUhqHJPBd3FwdAxgOJeTJmstFS0zhN7pgHIzoeZC/p3lPYMKwW1eXS1sXgO8vm7
         j6Ho2Yi20dFXzsI0qxRnQZ2OY3A02eAV1sLImgNy6dWFKEgxAfDFAl63s4ixydIBF5Oj
         cNFkUQK/qTpo6N6FKlMHzmsnXLgefdaS4o+RPQrzAlZ1ChpU9+lI1uFKLEbK/E3z7sEE
         1gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849424; x=1734454224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DqC+MYPAbbx8P8+tjZh10yMabSG3vK45igpyvKpPMU=;
        b=SsMV9GLjbpfdUd9zN+xi84v/Yy+x/TQt+gVfqGo7s7paf4bHfnMjadXyqW7/Yw+wpf
         ZtFzgmza4ChD02kn2IC0MkPV3uam6+Z1pih6ulNS1z0NV+mEWwyNp/Qfwe7/2+T4cxrt
         Wt0VJ+8dyEquW765hHwxx7oMrCE8qONMuwdwl5CrU8EvDTVJphBuzn6Mq/bTbUt/toca
         bV9CRUKcVAZ7HAoxMca3pCP05d49TxVW7PGvDJ6fYSKn6U2RXBMoc7BJfydjYE2Fx411
         u3cG+mOU7BjV2CdZl0VG+fktjVPzFszBejntfe5dLaJRqtUtCcs0ImLmlxSkVNCEbAUm
         M+VA==
X-Forwarded-Encrypted: i=1; AJvYcCV+c1tQ7CcvCxXwjjISq1M6KaYERG6Fyp86FZk17N73meYlk7I6Dn9Emi9dkkIfheON4NL0km/K0jkZbJaj@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSf+BYQhcRQAZkMG+RdpwBXjRAE2OlK17aQsRJ20BfsoUHbC+
	2Z7Qjz5u71T8M7II0L9EuTNeYIWdYzGz9Kf3LA5NnQ/8yTz4yMuSQ3r6jlx9B7pRx1poZYHRW1a
	szBfM60Xc0oTqiLXGQg7eTw3GT5kL+i9IW9Xaag==
X-Gm-Gg: ASbGncv6JidcOe4KPWPxFjzVI0d9A4P+YgfuOGANvsGgLMaMR4PCgcH5cgYlUey56F0
	2aJ4e7uIFnV4MBDkupmqqL6+Y3hmnAPg0UFc=
X-Google-Smtp-Source: AGHT+IH1qOThi05+FQaxtQVOf1BOtPYsAHF4Eo2G34Soq2l2ruTqO8or8v0sP6hLQ+NYFOkce6I3HslaJ3ZMDDi5J3A=
X-Received: by 2002:a17:906:2182:b0:aa6:54df:6abf with SMTP id
 a640c23a62f3a-aa6a01c0fb4mr427827566b.18.1733849424185; Tue, 10 Dec 2024
 08:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 17:50:13 +0100
Message-ID: <CAEvtbuviHys9V6Fa7GveUP0mWH4fJf=r_5iLCVh0bbhy8x=H7Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

On Tue, 10 Dec 2024 at 12:05, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> be unstable!" is seen during bootup.  It doesn't impact any video
> usecase and is currently under discussion.

I also see this coming up on x1e (not surprising, given its basically
SM8550 for this part).
Any chance we can get this fixed? Merging this series and introducing
this error is not very reassuring to use the driver. :-)
Maybe getting the QC clock driver folks involved?

regards
Stefan Schmidt


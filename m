Return-Path: <linux-arm-msm+bounces-33408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A7992FA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23CCC1F22D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C094C1D54DC;
	Mon,  7 Oct 2024 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPB8vjqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B11D5ADE;
	Mon,  7 Oct 2024 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312184; cv=none; b=mj4fyQcbN83WhAWM9COCVAidvccz7oK4s1sIDGPF8DnWUq1sZybLUaEriBWB0LPRLNrjR9A9aQsbmxI4iBayDd2NT7S+QI7VCZIgKMEgg4AwEG18VSHmsZ4mrGhc3gZruhM+KmlmF9lh4FvPBi9yZHZZKpNjtQJQ3szc+Qf85Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312184; c=relaxed/simple;
	bh=a/IJHLJ+hchV/llL//h9WaQEnM9IRTMP078FELUxRZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8nZdf3zWiKAvGp701ehgtxZv58VfOHdMAGykeJIoubPVJHx9EsEmdCGY8l4iFFrLcxkWNqE3cdQ/+pGRlHEr8d6UfhYUp0skYw7LcF5mzfUF9JuEhshkV6rZENu9zbcnru7kO/1Vn2oy0aUSDBE7WrEh2Ts9w/r61lVqVzqjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPB8vjqe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a995ec65c35so114830866b.1;
        Mon, 07 Oct 2024 07:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728312181; x=1728916981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUKAf7JLnIEU+UjWXwhqjGWzJ4eBeyCwQGJ+qRQW9mU=;
        b=QPB8vjqetFIikelHwVy+Dt1DqmIFrjzYKGNyWyNC81fxQ7eUOEdBiHeNu6XO3lbj2E
         z02vcubXpDVoYggzJmyRnRx9R5CqK39Z2tIuk5VUm/okXgOlSdKIeDfNWNijnasnjWYO
         YY6tQ7shsV2CbQSpxXHRG8zWrt/ZltvAkLeErR9x2zcD2dK/r+LDbtTqVvAYSAD4Rkyl
         TvAA81Y1MkTDf5o/KJlGomedwgyJUJsfbJ7dkHIvKoHnQO+A6/YF7bnvMBEepqKeZc+q
         0HPHzTDZomduyOl1bNe1c3aUvbOw7y6XBfMScDo9kA5OxajLo7yq+5cg+pV+LQTLotkr
         XK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312181; x=1728916981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUKAf7JLnIEU+UjWXwhqjGWzJ4eBeyCwQGJ+qRQW9mU=;
        b=WiE1iQNQpcRailXzN88GggorOJsKz4uI3FpsUh6iY99SpEtlrKt0F5iF/P+cBsVsSI
         zi0WJKhmWiP+fKJ6o+MJ/e6qh7b7fAJVm+S0CsNAz+2WvGZiMEV+m+j5wi5th2hdeWGT
         OY0PV+nEZh9VsK2C435Ha/g+7KKEdB/csTpNQIfSJHyurUzVlORCb4seFFdtOL9qIl/p
         38wI91rCKTIoZm57EaXZ1a24YxXdhr3VxUYkizKcDl6h+CA9s9UOxNvdiLQnrUNct7cq
         z1sl7zKmpXDodlYlVvaibrLR6JhrTh6UU2LQ5Nrb2Y0RzP8V3WIzwEGYNnM4zYtcPbEy
         Tg9A==
X-Forwarded-Encrypted: i=1; AJvYcCU5qNXuz4HVjuBBYcW+VZGXbIe3pti+kfcJemM+1JZhnAw93MnI1Z4EDZKvlko0Bs+9+XNIlrue8Z58WnK4PQ==@vger.kernel.org, AJvYcCVNy+iobGoDQkC5m1UJNLQry0h0vV/rf4DyBWXOfgYtj/UHwdDr4wSlX7nGaOYicI79TjICcvxxHmaW@vger.kernel.org, AJvYcCWLHDP9xty6aOheNtqjKXzjxOepqjQ7g09oAG2LT8kw1zvFL6yJ5r7CmUoSVxFwW3+f2I5JPI97F3HANDSG@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhgS5aoySH7x3rFBksvL0njy0Kx2Gh0mNWYdiSl78sSe5E1ZO
	8NO5UKASP21JzbpTWkADas1k+E9vHmhfW6r3XMP9duYXAwrd5mCc/xQskd/J7J+/T6No5S4giBf
	mSUjr3FFKX5/I0t7ZSWwsnj2wMGpw
X-Google-Smtp-Source: AGHT+IED9irAlpfFRDYJ81a270PHC1nGll9+NQaqxWW9EV/wDBQUDL+M6E6/1ekYFVVwvgURR6U/+XurcSNL/ndUiZ0=
X-Received: by 2002:a17:907:86a2:b0:a99:52c3:e5f8 with SMTP id
 a640c23a62f3a-a9952c42ee4mr496058666b.11.1728312181184; Mon, 07 Oct 2024
 07:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com> <172831116175.468342.4376919481343564567.b4-ty@kernel.org>
In-Reply-To: <172831116175.468342.4376919481343564567.b4-ty@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 7 Oct 2024 16:42:24 +0200
Message-ID: <CA+kEDGFUX1Ra=nhbfrJMdO7qG4SbfTQVAX9Gk5_p7jEZKb=8=g@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] Microsoft Surface Pro 9 5G support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 07 Oct 2024 16:26, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, 09 Sep 2024 00:35:00 +0200, J=C3=A9r=C3=B4me de Bretagne wrote:
> > This series brings support for the SC8280XP-based Microsoft Surface
> > Pro 9 5G.
> >
>
> Applied, thanks!

Thanks, Bjorn!

> [1/5] dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
>       commit: e221af165910b8967f7c2788c34826f332f2cc7e
> [4/5] arm64: dts: qcom: sc8280xp: Add uart18
>       commit: 1e70551123d014b3a1c4b85da54d247243750e7c
> [5/5] arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G
>       commit: f6231a2eefd430b8b8798911f023891ea51d1d09
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>


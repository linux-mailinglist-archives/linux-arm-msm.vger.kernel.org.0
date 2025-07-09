Return-Path: <linux-arm-msm+bounces-64217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FC6AFE7DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 13:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEA01887789
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 11:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B351E2D660E;
	Wed,  9 Jul 2025 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="U/O3yJ0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D0290BAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060785; cv=none; b=BbD7T9eccKjtUBTL+4eRosBH87h9wGjLlKSbvy2hBOxM+98YKdOX5ANk/svtD98EXGUUaOAH1aIfi8PW8uKRmcuHmRdviAyGsZssyNz1o5H1Lbq4UzE0s1GY1f5SEifB026F7FH7l2S0oouGobZAG2UFnzukKlNFQUusdVLQ5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060785; c=relaxed/simple;
	bh=DnetqG4IpAFzDIBOiu8occs+wrG3pJXMqq/lD/+CZz4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iRt17myZSJ8JQB9bkxBGDhPO+wYm4EyTtF7P+J4UJLjKIJKqe280IX4oLJtR1gDWBUC+yeFtepT7lZuiIy8vXB7dqwfYWalA5tqrbvPUtGHLdT1gvJ8ig2kiuQVlq7gFstkI5orc+v2JOpfF7x+47OI4benS/dKYcytW3W1ghW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=U/O3yJ0D; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1167060866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060782; x=1752665582; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxzY42f4mxHddEBUOVLLBJrN9aKCSop49so8dLkLQco=;
        b=U/O3yJ0DN6baKxv96FqzOocjvo45nVp8hpkpdara9EBtCODvwbHYkh85hmgXQuepCQ
         6r+M7hwY/lWt7+6gGFPu/PgBusr4yBAW0SBJPSOjroaY3T/b2oY/IhMWRD0DHIc5FECB
         KEJkW4b2jbJlXiQjYZoNJqO4C5Dw9R5Cm5dnlNSxoT3SVMPLsiBWsApd3ArSED2iJRF7
         kNPCzd9j3+jTSuCY0CCcEdqhf5laX7gIPG24ABli63mSv+h+tw6Dl+HgQ2x5angC6rX0
         1h6oYofb4mNsVNb3jbyVYROXUtfcyHKdIi5b4dPflY+h7ge6u6z3C/7Y2+Qt9V+jLQW7
         awuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060782; x=1752665582;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxzY42f4mxHddEBUOVLLBJrN9aKCSop49so8dLkLQco=;
        b=YaOZKPGhPsLg6Ij+e0jZesXgBlprgFXpehrw11TyMENuJ5eWH0YBK/LSK2z3A9DnD1
         61Ib9AvwGIEPcF8AaRsNg1tVNkEw6hFBW/715V2Z8/2wfPZ3nytmJogwEl4xMqIPM1/d
         QgE1l7B5B15PsZxeTNZdXvQTCgjx/AFgWAE0NG5ub9aBLCBbeBaI56ZtQ+T/JmZX06Tv
         OKxIlPaIfsOELNnjJ4SJx9lN4MONHbvzrk1vAyP3RRj6xzaukWt2fjEgpfd+v9hhEHob
         V5/ZTm9C7EMXYMjyTOwv9U8M5Qerq8emtm8bjtoTdZmPJ9U4TM+n0FLTo3SVsAjAxL7S
         hWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIz1j02k0wvf7y9FYE+B974rz8Jx5MZ3yucLs7gy2gIpmtT9oRXw+xtAQ9/yLAG61FFW3Wb5gKK1S7YZCc@vger.kernel.org
X-Gm-Message-State: AOJu0YyDyuIpKI6YMLwSdjcHptoFV5JEBlv2qVOwXGCq+dWs0meXBUqm
	Lbi+dSP5Dmmn2VZ3qwO0AA3hh4wV9YbWiC7rqN4njQ2r3n5IcsAUXCZfP1/roj4Wy9Y=
X-Gm-Gg: ASbGncso5+YqVvasoGXWJxAyY58kKptd6YeF2D9mHIq+QR4DPraHqXbrKSdGYHcG8/b
	eoKLb4lQnJmOsyeQ4SccPcZjorXl2nXrUPlFLsbJSIkWcoaU+A4l4BZcXUJ7dAKg3/TI76SN/0h
	QV0L+3X0lJ2AwqlFGMXDE+O++ytHZdrTAiSIv6E7EgFC7cs3mmB8Jg1mAIiATj8CjFY7qMlNgmA
	ffff81B/yRTUnce893VqglFE1ji8vzv+B6w3E41Chitblx6LjX8JB1+VyWDrmus5NI4lHEnwd1j
	5/UQ2zN9EdA0otzaWguTCG5p3FsUm7p8Nl5BDl2rS3KKZnA+Q0eKbEMlVWdiP59DhYQqs9l1O0l
	13gkJcylIe/8Ef2jSwokNqk9IQnC0PYiiMP4pDLLePg==
X-Google-Smtp-Source: AGHT+IGHM8DEDRJmkix2Dsy2SirVJ7BbYv4bV5HgWFOqwJ5zCocvDi8X0Hn8U2z4qSsef7dQPV0KjQ==
X-Received: by 2002:a17:907:6ea3:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-ae6cfc3c275mr235877666b.43.1752060781983;
        Wed, 09 Jul 2025 04:33:01 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm1080433666b.180.2025.07.09.04.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:33:01 +0200
Message-Id: <DB7HPNBDW93U.2RC0AF8T8RG5Y@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add Milos RPMHPD power domains
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <CAPDyKFonLENQbafjo621hHPkoWjMNoQ5GRNeNndpezMNnM1=sA@mail.gmail.com>
In-Reply-To: <CAPDyKFonLENQbafjo621hHPkoWjMNoQ5GRNeNndpezMNnM1=sA@mail.gmail.com>

On Wed Jul 9, 2025 at 1:30 PM CEST, Ulf Hansson wrote:
> On Mon, 7 Jul 2025 at 12:18, Luca Weiss <luca.weiss@fairphone.com> wrote:
>>
>> Add support for the rpmhpd power domains in the Milos SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> The series applied for next (with a minor update to the commit message
> for patch1, according to suggestions from Krzysztof), thanks!

Thank you!

>
> Kind regards
> Uffe
>
>
>
>> ---
>> Changes in v2:
>> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-ar=
m-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
>> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-rpmhpd-v1-0-92d3=
cb32dd7e@fairphone.com
>>
>> ---
>> Luca Weiss (2):
>>       dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Doma=
ins
>>       pmdomain: qcom: rpmhpd: Add Milos power domains
>>
>>  .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
>>  drivers/pmdomain/qcom/rpmhpd.c                        | 19 ++++++++++++=
+++++++
>>  2 files changed, 20 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2
>>
>> Best regards,
>> --
>> Luca Weiss <luca.weiss@fairphone.com>
>>



Return-Path: <linux-arm-msm+bounces-63044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0940AED688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1A953ACC34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 08:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A5A23E329;
	Mon, 30 Jun 2025 08:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PuMVrUKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FD23AB88
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270514; cv=none; b=go2slkSf4DhOlIUsVod4+2LmseKnUuA63w4xGL07sfh0y2giW0WaAHRl9UptBn53cQaP8RjavhsoZvC0TfiGJiYIxoHUnMqsdaVs32if+FMUD2P9Dof0lGyOtjT0UrfLzGXGyhZg2X1aUYs/+IILavOVJtqAS+rtbuaSsoBzmII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270514; c=relaxed/simple;
	bh=LpPq0O9dCSq2yJKRTchcrI01CNwc9RMMB1sOdqU8n48=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hi2GuDrEunF+sOENqDH1MPYH9F7CxshA3jdm8Kkhf7js2O3ZWYj1RChRJD0kcpKUOoYHllTgZCvmQyW1TUz+uJilQJKSnrjhCkn3TVnchgC5hyrSoPxRLzx7EntRGkpmBXXKeN+10+PtbtrWdWhTxJ2cELUNXXKn5VFAhykdDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PuMVrUKW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0b6532345so1004701666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751270511; x=1751875311; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=PuMVrUKW32bEa9R7TQw7IHxfIrUhxO4ts7j1kHOE+OvGLv07I/8dBOcDKy5AwkQPsO
         Dm8P+rDqCOUjr1Xr12jvUEnRABphNKJNkYsbylIIe+oKVjipwSrCTDJe8AXHTW/p0PwX
         2fmZNg3f13y8TH7AnQcosPFDBBCNsvRu6q94CEUgt4nvkAU3BUlajfo9vKNbpwOQb1SU
         Q2qptM0wAmFx6VGpEv8a6dcns3XepjI7QEvfKvPQG3XXggWonB9PY6f8IyUt30asd1fl
         Wr5mPCnGzbC0S2BdxJA2rLNzLl0qORehS5OJQuPvOsMRJmJqIp5aR62vA0Bp9l+pI+xY
         kEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270511; x=1751875311;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=eaY4jbKm7u3cesX6Ft3nqnkDwktAD9KxMkRevhL8BMTDG9le8EIncz+6OVH2E1CrAy
         Q7RyHfaEvAvC17j/3czQM94z16GQizTQ4alwHVQ+yhEbypKZ9/9j5Rr79JzFNiYxVESQ
         DrFalDfNqdomE72qzzse0OPodKERIowFZihYGGqURAlCvOdRp5+yPbijaN5wgswidC0v
         AUHA/Y5RgEGV0W05MVvHHQUmIJ6/1GpqyjhxefuhoWmAZTkD/T6R25cd4gW2XtNCk3QY
         stzozWbU1JMATJrYJHQWXs/rdP5uSGqVp7NVa4MZSoj5LZBg9CybZYtLnS5uJjYywpv+
         7Ofg==
X-Forwarded-Encrypted: i=1; AJvYcCUQueFTFzs+OWLiSf+wJrz3USvne0UZJfQGNuG2qvbnT+srtqVNQ+Bbz8fERwzf+frZkOtz06/O6nKyYXI2@vger.kernel.org
X-Gm-Message-State: AOJu0YzssMmE6WuCs+32k/0d3rHpDribgPPyrqUiOqdnC5p69RHeUKk7
	MECLzHukVcK7ZCKK0tVekPXh9zqunh9mqwK1yg6CsdgCWLUqNsVAKysBYS75wX3hMu8=
X-Gm-Gg: ASbGncu1iKiLGdDI/YgK+0aCsdUBom79o5HWzpjWGQSVFtFQpPBCc4ic2LU5JDYGI7T
	ORpLOqMOzbFkokLeaRbWWe3X4ycHdDh6tIMaNIPhBRmChYTgEIBu04lt3y1DVcTyM6WcNwj3IFs
	HHDF2itf1j6K3nZYAPZmlhMkHKpIwFBHC0xJYxCYi3mc8d7LLGGX5gh5ZjGbvEU6yoUkKmtuouS
	eAHOFuAzNS0Yet7rr120anth6yeaBVfRkrmOI2GRRM2MEnZ6TpaTKKSJQo8/adn7qFzQ7Zo4sBT
	O16JgHewvphnUmB5I4K/VKFcqAGTXdvN1H0Mkr1rOgL1TuNt6PP4bq5zb51LyflrQ4/VhunyvLG
	3cLp/OzUscT4r+FwjP7T/kT+knahxAk8t4Ab5qhxqpnowHzyG36aFuOrYQQ27Wisl947Ow/rV73
	TkeEFRVg==
X-Google-Smtp-Source: AGHT+IEoVXPzL2X+o6hUB2pvWTzo7iX7ErTJsBfZFxmXtG6Mqo+mQVeD6+zkAYVim486K1lU9hLB1w==
X-Received: by 2002:a17:906:4783:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae0d27309d1mr1642905366b.17.1751270496717;
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01641sm630119466b.77.2025.06.30.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 10:01:35 +0200
Message-Id: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
In-Reply-To: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>

Hi Konrad,

On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:12 AM, Luca Weiss wrote:
>>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>>> VIDEOCC on the SM7635 SoC.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (10):
>>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Contro=
ller
>>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Contro=
ller
>>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contr=
oller
>>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controlle=
r
>>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Control=
ler
>>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>>
>> We had a massive yak shaving patchset go in this season, please move
>> the magic settings in .probe to qcom_cc_driver_data {}
>
> Okay cool, I found them
> https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982=
706.b4-ty@kernel.org/

For camcc, gpucc and videocc it seems quite simple to follow these
changes.

For dispcc I don't know what to do with this line.

	/* Enable clock gating for MDP clocks */
	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Do I just keep the regmap references in this probe function and just
move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
config struct?

And similar for gcc, I can move the qcom_branch_set_clk_en calls there
but the qcom_cc_register_rcg_dfs needs to be kept.

Does that sound okay, or what exactly is the desired outcome of the
requested changes?

Regards
Luca

>
>>
>> Konrad



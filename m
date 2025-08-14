Return-Path: <linux-arm-msm+bounces-69096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18AB2596D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 04:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B197687732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 02:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6E324291C;
	Thu, 14 Aug 2025 02:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7KnNSzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFA2FF651;
	Thu, 14 Aug 2025 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755137586; cv=none; b=qIYR4Vil0eiJ59/w30dF5plWml318XGjo1n3e2xNBPexb/D7yH4y3kpc/CS8HCUZnmGTJvqJhBDtCerEvosfaXAEEbRuf/Ego9t+/0GRYcafZWlK4PAWGyIXY55OFREL//ctAAeJDllF3EsQpXNRAm29N+rYgwH1XSwlP8Huq1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755137586; c=relaxed/simple;
	bh=NY3id39xokutzlhGXXKdTDQEutMN5UXLiDGyPVOSfTA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iNQDgHBC3bd8fRdItjJEBja5kL10p+6Ux4cbdL0uTSa6a5pLbwEMJ992mJ+1+yl6wjMBm9nUtoImuQpKr7JkmlwKvGAjqvhrZlP/DXVF0Y9ZfkAQAV1RnSx+dlHW/4876XOP7ijA4Y1KRPDKDaQ+wfsviG3l6Ql4aR3zyHUdwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7KnNSzn; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-24458272c00so6955575ad.3;
        Wed, 13 Aug 2025 19:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755137584; x=1755742384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYo8oDg3vb6/31GjzQVzBOJWS4Z3k3q/knVBOFK3fHA=;
        b=m7KnNSzn7ZloKBI4oFa+jXY94bScOsbYG38iJ2tZ68HJrSGsYGIkxK/2e6beXDubMs
         Vye7YrsTeYiDdEcMzRcXCPJRtVhHJnWkSf9lr7xYVaLKjSAWYKWPNGsoOVlZIxNDH8qw
         6NQo7JbTsSE9RbWf85jkzmpZQ3w9RKkN2WIBpJLmgIT14p/z+rANcvuYCC6t27aQwkLz
         BV7m7uemjv/CHAzpWRaHhEU3GWH94aUmCI3rgyWcedkROdw0sQebCHepHq/G9/2eJ9gx
         GCCeF38zdFdvV2UNOkUZ4dRbyvA6cKrtK/GMTdLLpLSJp8OI09k1hukLOwGXkXX4Pw1P
         vOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755137584; x=1755742384;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYo8oDg3vb6/31GjzQVzBOJWS4Z3k3q/knVBOFK3fHA=;
        b=DKd5jIccibpGUgHZzBg/dm/YlZ/aFklLvAgr07bRA/Lb2QkVLsI9320Nrk2Zo0bc5v
         nypWpbs01YvKohieitIEhE2JITRAmzetVOtlhS67rnrku7mP7E5qmyM4aZUzQ/E70cla
         81cwERl7weJDvj9fdI07mHwlMnLQ2to8iSj6uCm46xB2LsObmbfG3YI0d/WfDPnebst2
         /5F+Bs5VHkb+G44UDMeOSODb+0a07vK6S7dKWhbTEk9dWpoLibi9K9WBMsqX59n6aNui
         avON7VaZ+8dQGmV80VTObKBsVeyZdxTyco4+30bYATXRbtvyG0UVFAwLFQxFUUZZUWj7
         fP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+Q2ZSkUFJzmC0JO9nekCZ8OqrpzgDCI+yMAGIu+7Qhu8lyCi8QJFIUkQHQk0e23pGvu1+jp7HvOzP00me@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbGdJWd5CuaM5rRalt69Pq1pplGQRgUl3lLkJG40HLpn56yYw
	pLfpwcJjp0h0pLmVfhu2+GxhBwcjFA5gkNdpM9eITILGjVyMWdtnD844
X-Gm-Gg: ASbGncsPIhWX50UPmLButkWYPfeNYQdXfV/bJuCMEOKRw0t5UwLF1FBgFId2nbTDtJ1
	d1TqlyLboTIdPZkfQiksoCRa84QRHnvwXAKAqGk+Z5NB7isxXyxVY8wHAw3ZXqUvqs0JNvchkah
	9tfZtha8C+TuGgtbmFsKiVvH311lKWWWDvYzs4cO8VyQRstid++59WYlroIbs+DgrR/7Lr3h31C
	klOw8BLxOAoV8cnPfmKHR8PMpFzYSh9QbiZhlt4gNLJFx9NfAyTfr6zQtJ+Bl3udiiAoPoTqnKO
	v3d3PjYYoHVM5RZUYFRiY/jReasjoQx8KpBl5o9mbLV1wFxaepmmZ6dTBYSf9/pAy37WS0OeqOP
	OZre3XWmdSMFVszQ4G1vpOjUtzc1POgciuw==
X-Google-Smtp-Source: AGHT+IFgMpaACSz3aCvSNer4e32TCbJ+lWHMz6D/+3nV2WXS8s71Jt6cHFEz4m93PgFGcwf1gQteyA==
X-Received: by 2002:a17:903:189:b0:238:120:134a with SMTP id d9443c01a7336-244585240e9mr19602095ad.22.1755137584070;
        Wed, 13 Aug 2025 19:13:04 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:7f0:6883:5318:439c:647f:528:67e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242be41cc16sm152424495ad.52.2025.08.13.19.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 19:13:03 -0700 (PDT)
Date: Wed, 13 Aug 2025 23:13:00 -0300
From: Violet <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org, konradybcio@kernel.org, robh@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: document r0q board binding
User-Agent: K-9 Mail for Android
In-Reply-To: <175503322852.231048.4441689312374680275.b4-ty@kernel.org>
References: <20250615204438.1130213-1-ghatto404@gmail.com> <175503322852.231048.4441689312374680275.b4-ty@kernel.org>
Message-ID: <3685D796-B3E5-49AE-BBEA-A9F04C1B6BAC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 12, 2025 18:13:44 GMT-03:00, Bjorn Andersson <andersson@kernel=
=2Eorg> wrote:
>
>On Sun, 15 Jun 2025 20:44:37 +0000, Eric Gon=C3=A7alves wrote:
>> Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on t=
he Snapdragon 8 Gen 1 SoC=2E
>>=20
>>=20
>
>Applied, thanks!
>
>[1/1] dt-bindings: arm: qcom: document r0q board binding
>      commit: ebfe5797ac3e6e9fb56340b6b228d2747fdec912
>[1/1] arm64: dts: qcom: add initial device tree for Samsung Galaxy S22
>      commit: 46952305d2b64e9a2498c53046a832b51c93e5a8
>
>Best regards,
Huh? I got comments on this DTS, why was it applied early?


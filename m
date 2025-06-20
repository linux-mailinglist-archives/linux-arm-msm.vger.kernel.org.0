Return-Path: <linux-arm-msm+bounces-61876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D2AE16B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 10:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26EC1898998
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3807A2561BB;
	Fri, 20 Jun 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eElRhdTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEB23AB98
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409475; cv=none; b=C/+sl4OwFVTwjHhjCJGkBdBl0aYUNmvmJsZkyjljOJOvWznXn1gXkUdktIL1cyOt7uqQnkOgVmomlElD1eG+blGZj4YL+LvpOIxB0R586K2EeyPd4izostICuTlJVcCyIaPdNo6J2MtVxMgJ7WoSptkdGPQbYCtw2vrErmy/ZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409475; c=relaxed/simple;
	bh=41+NV6wm7M4BUwGUu5BfX6Y/1mglDykUJq2/D+L+bV0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dNCJJSRj640oKSrgeD2w9eku3YKVd18lh6LgrSbiERcxG6OoXIlzkQCS3P9jI7krdh5Hz3eraSlfogUU5EPEkHPAxSS4EAfu2nnp4Xg0o2QpJsMh3EX8AJbhPW8DImMgoY8LHtYLYWj62moy4auVYqf9KGzieWJzf5t+1+7IWAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eElRhdTF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so2650844a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750409472; x=1751014272; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQs46cNDxNcEM2859ny72mW8pcAVQ7BIEu+RAnGt+Uk=;
        b=eElRhdTFqyfet3zX6SJ1DemBoJg/QYIVepXir4utb5zKu3ZxnIQpSDe8Wb4f2IeYlv
         c6YoNmHPjPVqMTBfMpoup5C3PIFs+jAuldaiJy5wWPS/o9WohoWF5sUO/2aRQPS4lgky
         JxhAlYByweTDsfqvJ8OGmK+gNOvF48TvrdZVnH58kMiaVh4njA3jXSfF2AunQzjQ5jKq
         COLm+FZQSG4PMPsfsxeCNYl6mbsKwLSBCVrU5ms9jJKSiFYiMm1fBJbYLNhBA8yZeGXJ
         wIiMp7w4tAcggmF3uxO1ArOmUCHu8FHJSIyhKJnYGXi1XZ6cbfh9mWnlJlxunJ/kqXr8
         3KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409472; x=1751014272;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQs46cNDxNcEM2859ny72mW8pcAVQ7BIEu+RAnGt+Uk=;
        b=aEfGlKzpf8YSUkOdgiEUJPau1SiwPVTH41tMeKFf4iouOhc5ylGsx5QFfB2FqNbTvs
         85JIEz7LpWoj6rvYvr2C3vJtwNin0o3qDUN+vO12Px4FE6zr0zTXFJ90id6K0u60/lEP
         wdvLHomsTVWs89px5incZp7aK82DVZPumPffEsF6SUGpBj6G/9noZmUfm6JjYb7sMDqW
         8XZm1u270EiSaYmkvDwqR5XHrzCgk2stn9PxGHXk9NuahNfTC7k9TVhBBjIxUwU7vTVR
         qztaK6htZuRRk2XoWlvAiwkQBEg8SAD87ixov1XGHoZOUYsJ/gndW2uAfUQsRh9KLpgR
         ekWg==
X-Gm-Message-State: AOJu0YyENnTfGT6oZGPP1e+sxPz5jLassLp0qHqwNGLNcsBXYXBcoowi
	hmymRPMgv7m1OcuQz15OvmDxTC7In92kPCPQ+IX/ITc300uwSwCZ/k2AuzGk0xf23T8=
X-Gm-Gg: ASbGncsvpAGRMNAJlQu3vRQipkBl/J44TposudVb9iV6IA6ZsDKg6ho/av92u7XftVK
	uA/vo7x+wJ0D2rlLsrtMJ8KcVDgDyV6HyvxJtqun09e3ebEtGRcf0s/CAUnuS66vCO2L4u2ARqP
	GPTGiTYJpxVHssthnzhWX6+4VoHujQI8TiTYrgtQ0Sod3Zi+N8zsfxGqvyJ6G/s+y/AUmU+hwDk
	tJNz8BM8xkzW3g+jAmcpy591ENSaHIsNO/TA3n+jj2i3KBIYboIaNWmr7OczJB9CTlQrqnaY87H
	Mo+8LGN84/n0BkpqU0OzugaD6madczpPmM85KbDObEZ9kR5wUU25Qz/AQABDZmgWPorK7sRywbO
	RS7BOlhmiclMJBILzGHP4z/H7+XaKpo4=
X-Google-Smtp-Source: AGHT+IEmFiflCY72gns8BJi7+wHzY3UkumCt6vc+CYitRi/cG7BsMF02qzVY1w31/s9Tg+2mrG6kaA==
X-Received: by 2002:a17:907:f1c2:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae0635cad5cmr13076866b.51.1750409471648;
        Fri, 20 Jun 2025 01:51:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9a0sm128495266b.146.2025.06.20.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:51:10 +0200
Message-Id: <DAR8DDUQ8HM7.3IKL9TCT7SJM3@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 04/11] power: supply: pmi8998_charger: rename to
 qcom_smbx
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-4-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-4-ac5dec51b6e1@linaro.org>

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Prepare to add smb5 support by making variables and the file name more
> generic. Also take the opportunity to remove the "_charger" suffix since
> smb2 always refers to a charger.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/Makefile                      |   2 +-
>  .../supply/{qcom_pmi8998_charger.c =3D> qcom_smbx.c} | 148 ++++++++++---=
--------
>  2 files changed, 75 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefil=
e
> index 4f5f8e3507f80da02812f0d08c2d81ddff0a272f..f943c9150b326d41ff241f826=
10f70298635eb08 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -119,6 +119,6 @@ obj-$(CONFIG_RN5T618_POWER)	+=3D rn5t618_power.o
>  obj-$(CONFIG_BATTERY_ACER_A500)	+=3D acer_a500_battery.o
>  obj-$(CONFIG_BATTERY_SURFACE)	+=3D surface_battery.o
>  obj-$(CONFIG_CHARGER_SURFACE)	+=3D surface_charger.o
>  obj-$(CONFIG_BATTERY_UG3105)	+=3D ug3105_battery.o
> -obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_pmi8998_charger.o
> +obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_smbx.o

While you may want to keep the CONFIG_ name the same, the description
should be updated, at least in the SMB5 commit.

  =E2=94=82 Say Y here to enable the Qualcomm PMIC Charger driver. This
  =E2=94=82 adds support for the SMB2 switch mode battery charger found
  =E2=94=82 in PMI8998 and related PMICs.

Regards
Luca


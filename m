Return-Path: <linux-arm-msm+bounces-40407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCA9E481E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C4C2168EA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2761AB6CB;
	Wed,  4 Dec 2024 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NEoGi3lD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3631C3C13
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733352528; cv=none; b=imFKqwqOugwrvUnPhfqgpBxtl7AdpTe2jEibaTE3oZq8gD0sbLp6LkCaGdcjwf6tXwRVe3c+9QtJj6TyBBpLer9/+YpdOzClvgaXQGOd0uGs5jd9/CqVdLIjaCk3C1nDGmV9vrlC7C3l+8si3P8g4J4VYUtlOA2iUoXj9p1n84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733352528; c=relaxed/simple;
	bh=TSj4StKekoMWof/0a9RDpcEaVlkxhZJJcFqRiqpRSp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPXYB40cU4BFfiOlXz0vgjmbVawfWsC6jZ2+fjzqM/n/N8C0XBbaVaAI9JvMonf2BmI/cHfoP8nCwYLBLJJ+tpIC2Xd5cKmMPNAicy0ZyWBRcaXj61SYIOVextXgJTUfcQSRbOF+QaeHWIT9TBt93/KgHWnCX7zqLPYqHSWwQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NEoGi3lD; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so319183e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733352523; x=1733957323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS5St45eHSe24ISFP3PYGVU7STuxo7md32QjNE7kdII=;
        b=NEoGi3lDwp6W1/daj4d9A3avq1l4mkKCq4sqaRrGFS8YKoO149M2vlLirdwDPuxa/H
         NgCziL3wrG3mxLaZtQFTenhQJu32FbS1jtJQ6fSdlVl9j/gHRFTxF3DWiDuw1Gssi6r3
         FR/dUtKlAbIlbTHX4ct0qIzY36Ywv1SAb1xKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733352523; x=1733957323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS5St45eHSe24ISFP3PYGVU7STuxo7md32QjNE7kdII=;
        b=wSW+LPbQKHHphv7rQMxXhEsrotCTlUGOK0+CsfuFqVOstRImp+7wr6NWttBLWOhw08
         TeGDObJLLlCtdNytGXZfSEecT8Mw2I8VUcLh55hto89Baxx2sORk7yNH4TOcPfE4cG1q
         BSppg2J04EyyQHFBxI2P87yfFe8KcBc3ho1LltygClVwJQRxkNEnzoBPe7WV5crGdhfg
         os2lvV71ceSifrrz4zM49ODzIL+VhUkmqaU11tTrHLLKkVoPqMyo42kNWK29xby3LaTL
         kbbDsQBP/PcqpeZdqReMBGN2sGQKRZ5jitRmiPsiJY09KbeyL5Fq7OwG6kv90ZqrndC/
         OakQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK2is0kVB82OqPTM39Nl1r48q0Vg0CexaZAuobtd236/6pr89zsf/LzBWIH/WpKrZw64xhcbPpc62+uDuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42I08/5LzFouql12faC6H0wriwR3ECBMn1tk02ND+xFq+JyIL
	LpciH5rdH593h8mI2zKHyn9EzXsqnbMQjTC5puopmiCs+QoOWxYeqLFb8u90vPeC1orI8Fq0E1T
	n/D5h
X-Gm-Gg: ASbGncv6r7bkmUGdmuRkpSzEehoK4HOAQzPVMB5X3Mk9uq0lMtG0NYvK6L5/0nEOp5J
	2kdA4VneWrI4bb6VEANzSTAxlPJU4KlYh+NkuVDuT6/Z0SgmttBHZhbebl5Cv6XxKi+WOKNNdAi
	5mJfuzPqz+7MwsCpi4CMnP/hSbG48lTMnOmUyaEvq7NLHK93bWDhaoJ02FM00CGH0JVSSfy4V1u
	gFJfxrdb6iXK2dOqi/V8B3TjLf/+LGrzmHfzUopTKY9V2BV/pE6K+GNzCd6/aKljvD7Sop5s7UK
	j4BWq8s8iNk3TDeJEA==
X-Google-Smtp-Source: AGHT+IFvBIPTGm7iEU2tTP8PV7ObzOdeYT3DH4V9O+K+dMBkZjrCI8Q4ezYT5H+ouiuP3ueIzST2Aw==
X-Received: by 2002:a05:6512:3111:b0:53e:1c3d:fb2d with SMTP id 2adb3069b0e04-53e1c3dfcaamr1265768e87.0.1733352522675;
        Wed, 04 Dec 2024 14:48:42 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c22d6sm24651e87.219.2024.12.04.14.48.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 14:48:41 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so2175441fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:48:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQBSbxHQ1U5tKKMzaVTZUTkoEyJj3197m8vLmUTszDihdy2E77prMqMfAvteYxZH0n1DFWIM7LwRiJVHZC@vger.kernel.org
X-Received: by 2002:a05:6512:3087:b0:53d:ed89:d78d with SMTP id
 2adb3069b0e04-53e1b8785eamr2316814e87.5.1733352520879; Wed, 04 Dec 2024
 14:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org> <20241204-topic-misc-dt-fixes-v1-4-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-4-6d320b6454e6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 14:48:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMm5j60+jn9JFYkTDgm73NOHU5SAxbWvXOicEFbDySxQ@mail.gmail.com>
Message-ID: <CAD=FV=WMm5j60+jn9JFYkTDgm73NOHU5SAxbWvXOicEFbDySxQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc7180-trogdor-pompom: rename
 5v-choke thermal zone
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:57=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> Rename the 5v-choke thermal zone to satisfy the bindings.
>
> This fixes:
> sc7180-trogdor-pompom-r2-lte.dts: thermal-zones: '5v-choke-thermal' does =
not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pi=
nctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/thermal/thermal-zo=
nes.yaml#
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


Return-Path: <linux-arm-msm+bounces-16968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D989E2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC2F282F58
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF83156F2A;
	Tue,  9 Apr 2024 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+7syKAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F054156C76
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712687967; cv=none; b=Ci1qSRQ5ZIQzesy0D/I0hM+QrFSi3EK+S3g+sRA6RDNHj2wuQg1gHXhrUNSKGTU4n0hFFipsGSvwsnAjHDe8JqgFaHOOcdN1XOddkTsMziqXxnbqlD7+1k93FUCYiflCaSDrVaB81lRMlUS46nFI9CYIE0H4/DFxNmHqJD8JUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712687967; c=relaxed/simple;
	bh=BwPr7SrsQf4b7g+pojJ443HjHLELotWIZE/wilGloq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsAqkH/8iwF6HHTC8K32wj/xMOU1Y19QLHiAbqRgQU5L+lE5OetK6rCYcQRlv1fC7p2qfa2dEPIfdIYXLdIpP0n8cF6G5Y8iU85xvyv9x846K4e/PgMV2AD0Ebpu9PG/h/tjGybp3nd6iYR/Ml0bls/1IX3ai4u0G2Q7UhjL2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+7syKAS; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6181237230dso24484037b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712687965; x=1713292765; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hAdR0lfI/Ap3S0wzwjpUHjQuKqdM6aVtl85wb7tRnRA=;
        b=O+7syKASBx2JiFlsf6BUFWTgvb8hzJc1kYl/sTbv+8cPiBaRynz8Gbcm8FlAELTX+m
         /l0SKde+GrmSENTVJydNz3kLE420nx0i+Ang2TYm9BI0i4Yvbyj/6XrOEBaabpfK7TLp
         nR1+C0huxdZbrnNUdWg8Zdsq+I9VsFm/B8NYahsJpdIQ1cGqzlWHw/dUtwt5LaKoIVJM
         FZF7LiqqdVlwwV4gqB56ml1T7x8Utc60xBYQcFlNn7wj+z2UdvDO6UmdkqWHMeyGmBf9
         5unKzwqIU0O5N5Azvb8EvL7u151ziPbwU1i4UJJvP8NhcMY1OL78frGZyAGXGT38yvOe
         moGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712687965; x=1713292765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAdR0lfI/Ap3S0wzwjpUHjQuKqdM6aVtl85wb7tRnRA=;
        b=LAuquoqCRYO/7SvZxOo03dQ5lyAUTZYW/f42WJU/Usi9AyOzbvS/6EFMMyFx96HDfI
         Frnk4QBQkXHgZdZ/bvbdJchZatC1UuJ53NzEDVr/r0ddqVS7DVGDTTlmju7KYOAb8uQe
         koSN7OXhIR51xzfuvis6KuJaO0VFOB6ixGlOb2m2FwxIDna8yQSledc0bAw40v0Ennh0
         TLpE0H/P5XkhcwKpcpq7ETB/uigqLtZroRaCPaRC1vG8STNb/uhWSOGr3o5IUWcPF6NY
         G0ZMPDj1Z718JepCq4xIcyj6woQYw8wA7cmKQpUAtDBRDOfNFALchSxspi9eDSSbH6Kb
         cEUA==
X-Forwarded-Encrypted: i=1; AJvYcCVEHEVDpgzBS4Q/Li3hTN7p2OYqQtq7BXAEwbzbMNdacbW52ssp/ffNv4RzyTHQthBbVGjBWN3wzCXY5eJD5qTtqi5BgDLiFzmqz01JGA==
X-Gm-Message-State: AOJu0Yz7SlOnJC6vRjbl18a8SMKTT+4RkVyM9Bl1l3JlfVL96YFAS2UU
	xfTg2kPV+C/1NltH5IohHjtgWlXOwvJyMAIQKoUbbAy2BTaXM4vGH2DabUUB0svSEQcxoie4GbX
	bpnxcojW/QwgExlCsspxg0wxroqZrGXqQ4zfilw==
X-Google-Smtp-Source: AGHT+IHq5NVO+WfWmq3XyvBYt0xQLngoIVqzHjLiDg5l97bez8m7/Sp8OhTA5vGPOslEtZDyb+Woew1HHexx4xjD/3U=
X-Received: by 2002:a05:6902:c0b:b0:dc2:1f53:3a4f with SMTP id
 fs11-20020a0569020c0b00b00dc21f533a4fmr750553ybb.5.1712687965237; Tue, 09 Apr
 2024 11:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz> <20240409-qcom-pmic-gpio-hog-v2-2-5ff812d2baed@z3ntu.xyz>
In-Reply-To: <20240409-qcom-pmic-gpio-hog-v2-2-5ff812d2baed@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 21:39:14 +0300
Message-ID: <CAA8EJppzfBbTi7htJDmMowtXXTi3ASfzQpEpkCjPngBFH=TE-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8974-hammerhead: Update gpio
 hog node name
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 21:37, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Follow the gpio-hog bindings and use otg-hog as node name.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


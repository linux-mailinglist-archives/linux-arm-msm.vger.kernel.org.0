Return-Path: <linux-arm-msm+bounces-34138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693599A7FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 960511C237B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACA519ABC5;
	Fri, 11 Oct 2024 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlXuI00z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7961991BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661105; cv=none; b=i8gmkkuxPZ0IFulREhX3xGN1tCSJqC8g9lsBCru8lqtStkYLa5FlEFx7RvuKANRSKBhvLcVMjoZ7Auq6LzEpdMb/8SYSpRYpUbGmnfpZIO22882wYcoqtPSE6Zmbfj2KX8feMJ9GAs2pN72KKLgc1HOkjbaHME+dbcSiHk8rO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661105; c=relaxed/simple;
	bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aoD8KRo3y3tF65r8q2g4Y69C2XmHdMsC115d7FGti1AoweZh3sCVUKnvEkls8JRjsTUo2YG6COutDreBRBKCpIWi4DJ8jDk54LoVvzR3eptscf0uMkcKXTJLy56X7mF0OPSDSQy0WseDEGtHFitPM7wi6p6abmu0eSj3ozEn0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlXuI00z; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99650da839so363794266b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728661102; x=1729265902; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
        b=NlXuI00zVFBTe5bu2ArvLqRNAxiB6Ss8qz+1O8pin7rOljK3WW0QLSBwiDspTz80rp
         +PJaQCyY/+wrPgYV2to4jwR1N8C91Gvij0N0K1onkIGjACivnNDTzsahW/G+bw9cPGnN
         H+0ZalScydRWsPif5dNeUQKT3owdNsa2lFFDo8OeSIAInGjyee9ZXfyLsQo8Voujhr6Z
         mhSe+d/t3ETRtDkr6zGRz69/OUS8+oitB19WJ5dixcqg+Jhh8y5MsZ/MVXpqtzgVPG/U
         dfVTIUhcCooUqhYrwgkZ8EbK+lvsAhwK9H8YuDp5nQcFCarY6Kd2nQDt7+BEuTAyXWKs
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661102; x=1729265902;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGmlgzoYuoeXjf4/N4b7/dVovXvGFizGCIMQ61YHm/s=;
        b=nV6AGK0WWPKj8fMiybXNv40pW3CVrcoTNQzISWEDx8NFzHdi1HYDqJYG3oZ3+/b2AD
         AOj6UeHSrK+ePeviXzAvV00944aNIHx0UxIy93XcyjgtYI1ItHSSrznucLnNe2JJnKpo
         XwdSQtIHpggUBOPkc4idmeovvEB68GfWNy0Ju77NTKOWbbHeCnorCblZBoKKsHXzpe+2
         zM9Q1WtiIO8AZtyznrk4Y51LpwMniXupRhWYAIri1uQvVaCvYvRgOQ9mhYyncgEz2AMX
         W7W8FNuQOHAvcF19Qwb7A7k918hCOeFizn2VOB/5eZA4d9AlnFdIUNPEidXxMlGeEzoN
         QMLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvoN6cflcqKnVJYs7RL0rTylvNdATFhuxp8SCZKyAN+gF/IcyN3doEO4bPqfpF5SzhRyWZ/wrneUmIBSgW@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaODHEtImiqxqAx7lx5F23CqpWYlb+I9dwBNsnOHrmYme1TBL
	e+geBYU4VBwVTZZPHfmEaL6zEITtylIWfUusPA9tgGfCeVeE0XV9w6dOx/CtpFg=
X-Google-Smtp-Source: AGHT+IE4s8Q2Ca1GkHgtWLtOqANaHvXZHFNkqtGmRZ1SRo3AcPnPAE5BoCN9RPb+yOZ2GxGrHrFi8Q==
X-Received: by 2002:a17:907:31c8:b0:a8d:2b7a:ff44 with SMTP id a640c23a62f3a-a99e3c97e69mr8078366b.32.1728661102107;
        Fri, 11 Oct 2024 08:38:22 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99d3cc2c99sm20436166b.158.2024.10.11.08.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 16:38:21 +0100
Message-Id: <D4T37UMU6SH0.1IFHCFVO3UJ7L@linaro.org>
Cc: <stable@vger.kernel.org>, <broonie@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime
 stream alloc
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
 <f46623f3-b915-42db-a1e5-0427df310b8b@linaro.org>
In-Reply-To: <f46623f3-b915-42db-a1e5-0427df310b8b@linaro.org>

On Thu Oct 10, 2024 at 6:18 AM BST, Krzysztof Kozlowski wrote:
> On 09/10/2024 23:39, Alexey Klimov wrote:
> > During the migration of Soundwire runtime stream allocation from
> > the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> > soundcard was forgotten.
> >=20
> > At this point any playback attempt or audio daemon startup, for instanc=
e
> > on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> > NULL dereference:
>
> ...
>
> >=20
> > Reproduced and then fix was tested on db845c RB3 board.
> >=20
> > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: stable@vger.kernel.org
> > Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc t=
o soundcards")
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> We should fix this everywhere, not only sdm845. I'll look at remaining
> sc7280.

What about sc7180? Or is sc7180 one the platforms where soundwire is not us=
ed
and DSP is not involved?
Anyway, I don't have hw to test sc7180 or sc7280.

Thank you,
Alexey



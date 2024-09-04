Return-Path: <linux-arm-msm+bounces-30777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5696C612
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 20:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5D391C24F19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E406E619;
	Wed,  4 Sep 2024 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EddMyWSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA91E133F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473572; cv=none; b=i+HPBwjapkFoCZRrjARbJTtpp85iZ3lRPd/V718MeZFmLJZvzrmjqh5sAOY39d6hqPDExOqF2sXFXWpwYAJd9x1k7LJvdQ/gkkuGAFB/nShs6nYxJyUttoeP9Rp3lgXondl/kzasCG/WlRMf1H+0CfWyGV/sNb1hXfWAjc0AR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473572; c=relaxed/simple;
	bh=EDc4r4+xRzvXVV3HSRmgmHOsfqz56ufDfhO9wjnGKWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLqE7xqjlx+M0Ol4TjfHOFLJXN9jIdOGULgSDhOWjwfRRJppnPbHKsmk3yMCs39GKJhErecOKEaK/Vz8mZHdBZ7JCwWgOnFfita14lVHtVuou3vf9d70iKbTR3Szsdy0rTZH9SxWxUxoADSXsHGTngjkkkrIXjxlQeuqGsJzZyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EddMyWSr; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a7fef9a5fdso107672485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725473568; x=1726078368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9qNms9IqvULTHZLxrO4XAA8Z7D/Rr+IHxtM8XyaHUA=;
        b=EddMyWSrpODvNg9P/qhYGDpf0M14yNpq+qjjvzl7zFV5a0qiIOoZff41UReCfy5hGa
         SSZwN5e/0fi+t+IlfIEdMjzEkOFE3PJ+Gn32wG2kYNxqbqiNyw5Imo/CRP2PvUFAdtM5
         v8fgWCfoKCt8h1mJWjfUdoDQdmka1ipHohOD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725473568; x=1726078368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9qNms9IqvULTHZLxrO4XAA8Z7D/Rr+IHxtM8XyaHUA=;
        b=qnNTIr8ETmv+b0ninb9pI3jWRRyFGnvBZVO7T9Cgwqjx6uOET2jAY/8/+xK1DNuR42
         dVZ3+LRZkJ+QQvBSk5VRnVceEO1AEQPtSctcI+KO55Rhh4SIA8OmLHflLwoxEY+lcE/+
         MpyQ1svMYTPl1GqXsgdmyHIH6NY4dXP8duzCPw0vaeIweqSVVbCO7H+PDXb2Q8RqwxKs
         d6i4mN8BkikHy3r6pSyAAJB3Z0G7my1AUOcW89ZaG05mtVSoa5V5lXixOn/0ym4sQLcp
         R0VqSkxr1iP+C2HWaqs8MYofuA2iG+cswyDdbPbMA4z5SDtyyZv6tOzgdVpCxjxtYAhe
         YgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuNQ7VM+L0Y7hjLqlqb8NviKpa9C7coj6tPYM3inoJcmV1B56WijH9IHuMD9HVzUh3B17C9+OebU7altA6@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHRWq5sBiEKErmE9uLU+7JydExvltioCe3yg0xcYhq4jW9ZZf
	OiS4Pjamw/lH50r3Fua+eWVyZaMso/S7weU2Z6JU+1+DukbTkWaIF33wg9ulk/rFvEQ7hZZi2S0
	=
X-Google-Smtp-Source: AGHT+IHyvzoRFQx4UXZzYAc04y4OkjTLl8JrcOZx6n9bgSI3/EIonaUJwSL5HYGo6rsT2NjiyLeBeQ==
X-Received: by 2002:a05:620a:4149:b0:7a4:f17b:7583 with SMTP id af79cd13be357-7a9888f0cf0mr530380685a.25.1725473568486;
        Wed, 04 Sep 2024 11:12:48 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efed959sm3828285a.87.2024.09.04.11.12.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:12:47 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6c3552ce7faso9865226d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:12:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtKKacsswLXjMYy7fRV14tyFtSXo5pzPHuXw4/01xqmRPzPcmIfgyWBe8EPf8Lut/eAqgGI8EAiNghQIJY@vger.kernel.org
X-Received: by 2002:a05:6214:490a:b0:6c3:3efe:3fac with SMTP id
 6a1803df08f44-6c518de919amr63889426d6.3.1725473567119; Wed, 04 Sep 2024
 11:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904021943.2076343-1-ruanjinjie@huawei.com> <20240904021943.2076343-3-ruanjinjie@huawei.com>
In-Reply-To: <20240904021943.2076343-3-ruanjinjie@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 11:12:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vdcv4aSNGBOPoLELfTBW_0QYn2mnO0upmuHX=cTpZbLg@mail.gmail.com>
Message-ID: <CAD=FV=Vdcv4aSNGBOPoLELfTBW_0QYn2mnO0upmuHX=cTpZbLg@mail.gmail.com>
Subject: Re: [PATCH -next 2/3] spi: geni-qcom: Undo runtime PM changes at
 driver exit time
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, akashast@codeaurora.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 3, 2024 at 7:11=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> It's important to undo pm_runtime_use_autosuspend() with
> pm_runtime_dont_use_autosuspend() at driver exit time unless driver
> initially enabled pm_runtime with devm_pm_runtime_enable()
> (which handles it for you).
>
> Hence, switch to devm_pm_runtime_enable() to fix it.
>
> Fixes: cfdab2cd85ec ("spi: spi-geni-qcom: Set an autosuspend delay of 250=
 ms")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Given that this is a "Fix" it should be the first patch in the series.
Your ${SUBJECT} should also not contain "-next". Not only is that not
a convention for the SPI tree (that I'm aware of) it also is probably
wrong since fixes should usually get queued to an earlier tree...

As per my response to patch #1 in your series, the pm_runtime fix also
needs to be first in your series for correctness.


> @@ -1153,10 +1153,9 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>                 goto spi_geni_release_dma;
>
>         return 0;
> +

Unrelated whitespace change?


-Doug


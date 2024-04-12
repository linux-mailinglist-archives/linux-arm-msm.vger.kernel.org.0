Return-Path: <linux-arm-msm+bounces-17326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DE8A2DA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 13:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9AEC1C210C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 11:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7945466B;
	Fri, 12 Apr 2024 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLzIbBwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BB55783
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712921849; cv=none; b=eyc2iD403v0CFcOAJV68FZcm4ZMK83vEGtgWZJI07gAI2bKVI0g0u2h2T4UQeKuEHXWMHKk9X677NRNf8Fm4Ed/kSz0P1GTyoD3LpKkkn4C/8NQw0gCDrU64Uuq1Y0CXfYsPit7kFcgAjvENlSwTAzPfHJjzDuFkdVJRY7NtuGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712921849; c=relaxed/simple;
	bh=z+xZ/MGQ1uBHXBq7d/mmF+N6JySxCZtowpuRWXbFpQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSQufDomnnsMtjk9udAB9pS2deVIcPB4Mr8TVqlLnKgRt3TbNPgSBP4iRVtQc6mTNAdxaKrgvINS8anxYvfo4ihUK/NnRSoPA1fJIZMf7FXiDUrgR+xn4yXYeFhSxQ/8VclQItuVcYT/D15GZVB1BifPtI3e0jAp3Uvp/PVkPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLzIbBwt; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6181d032bf9so7956687b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712921846; x=1713526646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y2EmcugARuopJxe21BudCh2eyKfp2P9bFJ3RYfVe88=;
        b=iLzIbBwthotJCmDsWPOotAN90la12mV6fjvgpqDeICe1slAIcnQUVdYh38uhiEls1D
         hUBBz1ggGLsyScpAWQUTLBis52c0IdEoj1nVxc40NvcRKkOvCO2ZfheJqCmKzy8WgZLc
         Prk724M+HHvLEncYChlw7FJwpF0SrM+Xbhs3Xwihl/3Zrkr3Gz5VxWHApvxDHrfWwlnY
         SQgPj0DuutPLFwfWVmOsjIPVhcXBG4GYveFD3t+Vkjt/rqOJ6KHx8vUAcjcnU1zNyeBE
         vsuM2gYReHkEcRQMVkrzZUPJguP+70nYx9n/U0aQZpmz41qXeMxatmyvY2rEuJ2DIxws
         g9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712921846; x=1713526646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y2EmcugARuopJxe21BudCh2eyKfp2P9bFJ3RYfVe88=;
        b=OFppY/BL9siadw29uIYrmuiU6gY1f8Z6yemLLjnFQ3Ra5hk6RcoZTdjwPchemWUwct
         8UQXMgUrMshSFtRYHjrvok/EvbYyGPBKCSPLE5K8rmNJF8Uoly/xJ4uJwfruvjY3aPaB
         BJmAIipSsNQpZ2jct3JmIWlTXrtP+zRFPth92bQsidwwd1ORU4hOweSlqV546nnWyWsl
         Y760h1oTyrfdrjgx1nCZ8TSNpjxibMobhzhjwEjaCUoCNv78+YKHS+7r8QWhsYhDP1wD
         1X3CJr2tdCeZ/dn3eZLDDQET/tbVPsEj6uaPeAS8ZWfS7SnTe2lrfh5+3KbTzuwou/5U
         dfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUOEcTQWJS+FvsR16krJ3Muy9WmU2Gu06PWc5VNxSmpUgOiUsU9WDh9ysItQJAzDdCUtmvcjqAYFUe1AHwy73QXESvdNLO5dLPL9gIZDw==
X-Gm-Message-State: AOJu0YwG01FM+kIqrsqhojx45QowSg+FurVAIgXf/CaaVs/3CEcnVfj4
	1TTyWufZ7gHx/GhoXTG5lXNWVl4BLAvd5HBy483XwlCC+ClGsntzalCsDp9PV/gBvg5VWTmFcHJ
	PeTi8UbKGcnHUOHTmfUYVFfJQLehQujQPCTzeXA==
X-Google-Smtp-Source: AGHT+IGY9Q4cVT9kOsw+aAAUl5oRY2xc4SEvyE+uxv9uYxQt2cKV77gFayY9FMJewz3HJ0NspBTXStbzwsIsSZPmpME=
X-Received: by 2002:a25:1687:0:b0:de0:fb80:5c6a with SMTP id
 129-20020a251687000000b00de0fb805c6amr1951487ybw.60.1712921846161; Fri, 12
 Apr 2024 04:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412-enable-sm6115-icc-v2-1-12a35d5d4acd@linaro.org> <CAKXuJqh+0kyWXHpsyABi3=4YRHTzzg7Ezn4Mbru+ZTLeryec7Q@mail.gmail.com>
In-Reply-To: <CAKXuJqh+0kyWXHpsyABi3=4YRHTzzg7Ezn4Mbru+ZTLeryec7Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 14:37:18 +0300
Message-ID: <CAA8EJppk-vddZZU+n_01F6PoMFdLjpQenp++Pz0393xcw76tgA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
To: Steev Klimaszewski <steev@kali.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Apr 2024 at 04:00, Steev Klimaszewski <steev@kali.org> wrote:
>
> On Thu, Apr 11, 2024 at 4:49=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as built-in to enable the
> > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > Building as built-in is required as on this platform interconnects are
> > required to bring up the console.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Change it to be built-in (Bjorn)
> > - Link to v1: https://lore.kernel.org/r/20240409-enable-sm6115-icc-v1-1=
-bf894fb5a585@linaro.org
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)

[skipped]

> >
> Subject still says as module

Thanks!

--=20
With best wishes
Dmitry


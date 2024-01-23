Return-Path: <linux-arm-msm+bounces-7946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25826838F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 14:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5809B1C27503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCCB5F870;
	Tue, 23 Jan 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3hjJOW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230865F867
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706015275; cv=none; b=CZIgSm/Ixq2JkFzNUoCBSO7gJj/gjvKlX+lr4Tfh8fnN+uN4t9UL9NwTY5e0gHbr2KLwy3dyIyV/yloEBmZ9ty3a6xoghDERzldoI95SJDMML0zwrbP0d3Weg5u8Hqfxgo95dkInK6yI2Iz0Z/WtyO6MUkTjMJ1Gmi8Fh6kh8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706015275; c=relaxed/simple;
	bh=nENCJzfg8kLaw+xOwN6nVFSakH5k6qwqeLnp2qI/5W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8nmzNIrBhddBkLkcsl4L9xKcb3DWKyG2xEaKP9egedoMimLm9Zm8GgH8hDn/WwlfSJJtVqgszdqu3qPGZfDprS/ruizfhqBrK9xGBaAPq/q5+daByiLjigJkdA1UqpIakPnEANPFWnFixteqf+KzfVbNRbQpi4VxJRyIXQaCew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3hjJOW7; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-600273605a9so14169117b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 05:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706015272; x=1706620072; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0h+KxHo6zyFelz9bwRo7wSwVd6I2bFGua0EClSwuRfg=;
        b=B3hjJOW7By6jVRqpTYX8c/q92zWdSmFRr60FkRvBBPQoXrV//LmUOjR24RiNJGhObj
         xIvxR2T5MyAj5tPZvDLisOGI7c8dvi1M34QPDKiTEBwiJftl0OcCybpQAPNjPyRWDrhJ
         LrlfHomCjxSCo/T8q2AdXXJXwjRNCR0UOmk5hK18NcV+ElFAgISAt35fICWg6e5e6p53
         xEDhNj97v4/YnMaJJ0aEN3aJtnLNkC7tOyXKIa9h5nUbncYeYZl/5iFc6BgzM3/7YJHC
         pc6Ey+skJeFKkgu4aYsWKzs279hqnuy6ocBtIaz39Y2yQXnAg18rqObS1eWOxJxfDhI6
         F/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706015272; x=1706620072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h+KxHo6zyFelz9bwRo7wSwVd6I2bFGua0EClSwuRfg=;
        b=OWTkAVV1mnHLADx4rqxzpVuz/rl1P3+WaKI+qKSByf/j43XcB++iaEF4OSzU7GOInQ
         BMRTLN1ehrx0K7QGjTFqyNRCqZxsZ+uN/Bhnmdvv011o1vcGz8TWi/dIrOmw3+S4kBi1
         qy5rtxNgs8LK/gLbfU8mKjnvsmqX1eN+JupKgYaBQ3fMmtR+5xVoTvCYTug2OAbpRSdA
         yeNGxN5KRvB//wMEVnG6T7sXQ/cT+Fw9x1FtiKUniubRaX/lkt8wNGKtGSmmT/B9UQ/Y
         9p0SSDKP10ajUp2yi9ibf2zT0gCOmsNHRBX8Q2jZNRJ6LLOWvF8baMTFmXBx2jIzMlr1
         gpgw==
X-Gm-Message-State: AOJu0YwSNkBMXOWlNoj98+DeILkHwgjFhdvHJGCP5b9Oavz6h40wnG5F
	hr8OAySAcZ55l0OfXtIcwpMrXDEYbnFZusBy/INVSBr3YnHZGa/fENYdt5mTq3PRUrCIM48oKti
	zJfndFm06DEhbI/4LpEKcIKH6MT7PPKFHBf6n9w==
X-Google-Smtp-Source: AGHT+IH40SsVqCfKV7MCl5J25tlYVLHihl6geu98LpF3DgLOVi45HGE/066ut55wd5gnxEztUyh8umbJBgplDyJU0jA=
X-Received: by 2002:a0d:e647:0:b0:5e9:dca:1b14 with SMTP id
 p68-20020a0de647000000b005e90dca1b14mr5063978ywe.7.1706015272184; Tue, 23 Jan
 2024 05:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116094935.9988-1-quic_riteshk@quicinc.com>
 <20240116094935.9988-3-quic_riteshk@quicinc.com> <CAA8EJpp3WJ8132aB-tyzJPXsdczvQC+TvKemm9NvUNYNrEntow@mail.gmail.com>
 <b9012927-b357-4875-9e8e-90df5cc8d8bb@quicinc.com>
In-Reply-To: <b9012927-b357-4875-9e8e-90df5cc8d8bb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 15:07:41 +0200
Message-ID: <CAA8EJprdCdTVbL_vXWhcEVKgOwZHNCPfg8DPz8Ob01hnVcHRtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-idp: add display and panel
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 14:43, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
>
> On 1/16/2024 3:28 PM, Dmitry Baryshkov wrote:
>
> > On Tue, 16 Jan 2024 at 11:49, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
> >> Enable Display Subsystem with Novatek NT36672E Panel
> >> on qcm6490 idp platform.
> > Is this panel always present on the IDP board or is it an optional
> > addon, like the panels for all the RBn boards?
>
> This panel is always present on the IDP board.

Ack, please drop the gpu chunk, fix other review comments and send  v2.

>
> >> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 100 +++++++++++++++++++++++
> >>   1 file changed, 100 insertions(+)
> >>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-20471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B18CF12E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349BE1F20F1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A79127B6A;
	Sat, 25 May 2024 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Terk2D39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876C486240
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667442; cv=none; b=ICJXogWMLrW8exP9qx9OkbURCX1O3kO28UTnbltV1zZNFMIBUFxV5lEOxr5JPVXW1jfiCB5sI+DeNQjPRrQQxLckbPebEA/Kg0kqIktQVf/JWHH6sW24xfdhVWNNUWL49097uI6xbbfM95b6x3yL+M94/Nbey7M3gSmhipuzcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667442; c=relaxed/simple;
	bh=3H1Qh68+EVDSAFb8PydsksaGdeXzowO2wA/rKWMMvk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PozLuKggcmsXXThZz7a9HoQt9c51L1QOpCAbZO8LNoIyOPfEELWDYgilwjjNcesWQ/o8jTxKjQ70yzNejRYYth1pZn27DOF6O/GAUKSIN7tznz15qkVGBcPHLAfbprVJ/jWq8BqUm33w+fwpX7WMm4qIDGxB9fvTM7aWCaThZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Terk2D39; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df4dda88ce9so4593447276.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667439; x=1717272239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3/avKGFNBrd+/abFgXWl2ZL/PQRH4HTWTJ4CHLYxFg=;
        b=Terk2D39OWueRpajmXEfRXrw4HSenac5qX2dtcCBHrgKZXlnBjF6q8zAV3HiPdxPwW
         mXmPKNC9WyUHMvwUqPTSbop/BCh+vYNaGqpeoFJnLh8yEck5DvL5yjXWhEdiSU69tb4d
         27XBzdxvLJrvz/ZA178bUse3Xc+XdCAQMzpdsB2QGnR6A5FXgaZS5ApgJqJoZIO5973i
         bkljIO9tMQvBGTrm7Drv6LHkSXI8kYIry8VXzE57iTVLFJfhaWG2IlekgzkKFu21kJNA
         qtcsyoNLAA5U7iTmuSeIJ8pSL2AbDn7Oujy6PC1JOhQOCSwEUVYV1HNEdL98aV35pJ4T
         6YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667439; x=1717272239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3/avKGFNBrd+/abFgXWl2ZL/PQRH4HTWTJ4CHLYxFg=;
        b=cupyiU69sSEuRhFBInAahBfxfFaAYQ0rFh2LtQqaDsLhzmT6bcWOW93FeOiN2SXwrC
         Yc65JuU52p024+inSfHdjs+4ZQWPbQikeAHCer5D1TqpK62iauJvt1OD+4Pag+eEDE5W
         AtU2jep1Vrn1em9ImbsutPFs90dagdIwu7zRILeRutQZgDRGhLVya70+UiPDJ/8ATyQ5
         eXE2ufd0r0DZ6Zi9ZapB//+ctG5LH4roqy/9Z547FnkOFSpOfY6NDVJ1hzb2QkYZADHZ
         HBvhaZ3cd7SX7IjTU+5SilvePhj1HModoSYF0ZujuChOSdC2BG1ul3y3rKx1ge1w/iF/
         YcFA==
X-Forwarded-Encrypted: i=1; AJvYcCVHqGgY+XqPrM+MS/EP21w4mKrrKq8NDREHj3HV7EF2E3E5RNRkIHdx9Y10i+lwwNk3SUzgfAbqeZ2sx4iOc/ogdZIEJIG2uKReb8SMRg==
X-Gm-Message-State: AOJu0YyROaRyE3R0S7dIu/6zcaBXPrakbY2UTVL64/mICF9iXrTKtTwc
	KbLGpo6g7GEfz+jUwWoPVT/Mfcc0GtCePNvrBQ7iahYogRIi7xJ9pnbC9tAas6V/NuJQJCpOYU4
	BpR5Arj5mr/RJtfOCPvuO72aHPmUd4g0pVW5ti9fVy031M7Cf
X-Google-Smtp-Source: AGHT+IH6aycjLexVZ8p98AVCReKJom4mXgKLjUmGuUVk1KxhzKsOHttvJD1H7gKjGJogTx4Z4N9GyH4J2geeT49eNQ8=
X-Received: by 2002:a25:e310:0:b0:de5:4b1f:7e00 with SMTP id
 3f1490d57ef6-df77215f566mr5467796276.15.1716667439433; Sat, 25 May 2024
 13:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
In-Reply-To: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 May 2024 23:03:48 +0300
Message-ID: <CAA8EJpoGcXNv_tEJhNpb0n-E70ARxGRd4PHENZkTtqEKizVpCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add reset for display subsystem
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 25 May 2024 at 17:09, Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmai=
l.com> wrote:
>
> Add reset for display subsystem, make sure it gets
> properly reset.
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[No need to apply any fixes tags, it is not a bug that was present
before and is being fixed, it is an additional functionality]


--=20
With best wishes
Dmitry


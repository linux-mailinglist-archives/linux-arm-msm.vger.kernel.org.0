Return-Path: <linux-arm-msm+bounces-63581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F8AF82CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3AFA171B92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4FE1FFC46;
	Thu,  3 Jul 2025 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtafdVm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5EC28A1C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579119; cv=none; b=LLDkqM8oewt8Nq0mhN2sLEjsUyohGfj/CtBu5XagiO4y3OCQUsXaKDiCWr/B/bPac9k66v1+JbrJyJ526nGTFe8KWoZNOLSz7OjGhs/QSViV0gO1OJe1OnUnqSIMc6GARgj0n3/UptGOeZS71Hrwdw8HHBxGGOZBqVSGjmLrlJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579119; c=relaxed/simple;
	bh=wnFRRSRn4QeEk5iYoV45tJ39jqpMr6MRa9EtAX8nG9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWm6HFJ/fTP51dRkEnygp1UUGkTrZU7rrKOoQPiUs48UiCRIyE1b+qY9zdFV0KJF2CVIv2vT8SNxWi0jepLvbjJ58wGIZgWi9uUAJ+396msVgpy8TJ7g56ocLdq/lv2Xu2EPew0uFz3foi2N53L7DxkipGzhPG8XZLQX3ErmHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtafdVm+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553dceb342aso340120e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579116; x=1752183916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=WtafdVm+M/6VEmlgA1USgaJOheQUpmJIaa/CirH1BLDHhQn/R3Iu1ttRj2fsbBLUJ3
         V8XNtLSl4iMXhjoxyMKSPSeZ+G68iLqRk89NvTuIFF4MoB+RxiU3SNHEo4weaOQztABi
         1vN2jz4MoGnCnnrwrhiRUpIXBoBhSx9sg+ho5Db7FvRruvji0IGUQtvVwSMwLs5PwGUs
         fDtAFbkYYi3qat/tn24VSx82QFZeaAIaeS65PSgQuU4siOM4uodleg5GkkjUBDPxXJVi
         vEMnso27E/yeVc/RlIp27yB5lKLKFLWUKrk1ij6nJOq9gEqw0StfTgWFElwF0Zcw/w89
         R7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579116; x=1752183916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XRxLaEkudOmQp09BGpQ8QQ/Qoe1pmMzDleZt9KM+6o=;
        b=S6upXcmc8nqEGA27CB/nO5V/0RKu+5n+kfymu8Ie1j7X/VzxgMrnAJ04cmoS2lXHK9
         SO57XOGLTrD+RP+ZjQ8LxaNYQI8qGoz/kmjs5lWGN9HdqaSMOFM53fubJqwdoS3VWjF+
         0WYLzq4szlnSHKj5svjFHZ+mphkm9pfHHfK2uiAeAhroqPO5D9Yshw7tTDXsNhky8arm
         vmPZPbYROJ7WfTiJz7QYd4GRZqNvurvip9qG1AgEEc1HFTQ1strOA8g42q5vUq9ztjVO
         Whf1b9h22KpTNo6CdexpRCTQwkqqzTYFeXh8jzWgy3MqONKrhbndJYJgDzK8YkyKQIkc
         mWGw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUQmm7kQQGmGkf3ZCg5LRxCUf92GBabmK4fyDTtOjeG0UVo5YZ25gOtH1K/cbxGlPLdI6y9/X17EnO4XI@vger.kernel.org
X-Gm-Message-State: AOJu0YyEvUIxtxAv3hbeFPgWPFqcMfPb/X+rzmV3rZqH7QDnr62CRS+a
	IQlzRqaFtBhALOCSFi8Eu1of9FsBiqu2DaaPJek6t+FEkHWOU/Ytnxe01Wjav5uHBWDGXrZPC8F
	ondhBWSQ+dxScSvXdz3PIS44bqGCZMeqz9yLWIW/trA==
X-Gm-Gg: ASbGncsJUCMScL11M7zDLQAjEIChmVoqaeTV99/6mb1q0MsubpdM1qFwBo4zIzm6wz5
	et3SlpBQJgCuW8rtEQypaHDra9Iw/uDW89xHks00KKtVqmTfdYV0ga3cNe9lGNSlJt5OfovHqx7
	nS4eo+0VlAPKhjXCEqLDnILMDvq8oy17mcER+hKmA8czE=
X-Google-Smtp-Source: AGHT+IHMcHTI8t0jV1E/1yNFipjDMdG27d1r2tcyNEePv6L85lb9bKTV6sQs49+xKVP1ac6AIJvVTLJqEQGM2vza/qk=
X-Received: by 2002:a05:6512:15a3:b0:553:34c8:f6ca with SMTP id
 2adb3069b0e04-556e89500d0mr4749e87.35.1751579115885; Thu, 03 Jul 2025
 14:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
In-Reply-To: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:45:05 +0200
X-Gm-Features: Ac12FXyncS3NOy4puCpNTctASEAwVXKHDqvY9DdXOqM9ohOAbmxssvJ77Il8LtM
Message-ID: <CACRpkdbh1oikr=2A_ymAupE+j5nc2pfgU3m2DteEUdqY6=Ertw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: add multi TLMM region option parameter
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:06=E2=80=AFAM Yuanjie Yang <quic_yuanjiey@quicin=
c.com> wrote:

> Add support for selecting multiple TLMM regions using the
> tlmm-test tool.
> The current implementation only selects the TLMM Node region
> 0, which can lead to incorrect region selection.
>
> QCS 615 TLMM Node dts reg:
>         tlmm: pinctrl@3100000 {
>                 compatible =3D "qcom,qcs615-tlmm";
>                 reg =3D <0x0 0x03100000 0x0 0x300000>,
>                       <0x0 0x03500000 0x0 0x300000>,
>                       <0x0 0x03d00000 0x0 0x300000>;
>                 reg-names =3D "east",
>                             "west",
>                             "south";
>
> QCS615 gpio57 is in the south region with an offset of 0x39000,
> and its address is 0x3d39000. However, the default region selection
> is region 0 (east region), resulting in a wrong calculated address
> of 0x3139000.
>
> Add a tlmm option parameter named tlmm_reg_name to select the region.
> If the user does not input the parameter, the default region is 0.
>
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

I don't understand the test tool but it looks reasonable to me
so patch applied!

Yours,
Linus Walleij


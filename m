Return-Path: <linux-arm-msm+bounces-38789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A89D5AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 736F7B21E56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5F617C992;
	Fri, 22 Nov 2024 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZXrUHJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46C179954
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263007; cv=none; b=CxW7/iSRgl9K+KKM4ZMuZGW1hsfTZA1OncGpm1pkAabSD70lcOtxIrZ72pzRwv9ZXnqAqTBeObVGkniYmjIwoiIcG5NvhJhNrr/3KY0GH9eegmB17QdD9pGFc2uTtfvM2Ugf7ERoRu6WjYcYPRX3tCD6Vu5p5C65Axd9Mg6ECjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263007; c=relaxed/simple;
	bh=kAu22bgBiLxRVrdx00Z0uJHiLTAG3tckdwcOhTMUpaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKnpED5KH1SQjM7e3URIO6ckx4ejjky23t8CY33TgfBxC59ZfJZGwdiHQHH61dUuFD7YKt48A2vZTSVvgguAM5+Lh6QKstF6zKrORll1fT+Bii3fkKAvp8b/P+BLtSSu5uFL0TbzWKFKVfsERuCnrC1zpKS+PLejE/J1uACOCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZXrUHJG; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6eeb3741880so18199897b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 00:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732263005; x=1732867805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tgIMXXODwYuWcLjSiSy1iYq+uOPs5RvuoJt9+F5SWlU=;
        b=RZXrUHJGZkZFApYTLZBrswJCOhUnOoyOlJ5zh+iINz4sQbA1hkYuaSfktrqezlkhHX
         6SRPAKNPGM72sHtR/3P9cnxNG+qlBZW+DHJJJZg2t73VNQyJbYyNp8voWlqZlZmtv75G
         jOh5HBDnXNpr+Lhb/saCQfNaolstoS80Mn9hjk1Z+qNPVheaX19r68z6VGSKwNMYQzzD
         5oyOoTOxIo1hm1TVKS14okbxhP2PFFByjvZ3Qe4Q3FOBRX57NDtbaobSBYIjU8gP/WbM
         f4IH59aXqx0LPnI2ZcXnBvgpqR8E/TrBpH3YOKlvYQW/+l5exIpjP6oYZLIp+PcRhUFT
         BeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263005; x=1732867805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgIMXXODwYuWcLjSiSy1iYq+uOPs5RvuoJt9+F5SWlU=;
        b=RKQFCaCoAUGZ5khTl2PJb54Ueyem7DY1vuZjocC0NKjW7780YcuOJAb9sV5i6QExWP
         Xa+ddDjHpl74f4IkWNKZOVK/eOkWhMI7UeWp62GEyPsnF6j6yR5kretc/ROw33DX/79S
         Sv/Z5B3PU2CBkQoaV90ahrDgrJF2N21wC4Dr8HWqRXEb9tChWMImcpvcPJUSxcqYJI/p
         tafxLxMbPE+sgJ0IabcyntiuZ5RYHM3HJr+b0LJvih3X8UoZ07y9pOi6wHI6ghm6NN1t
         bq8pwDHmtMoFkx+OFtuJJ7VESAzkQXhNueD8u71nt+GQmzsheESQslNEO2OkaEHl6RaP
         A1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXAUABOhZXDKPKx59nkGuxp+IFHLKZj1zwgMveALaVh70NE00E4S4LcdFZ16uwLjDmXKkGo64n3EV6Ok4Qt@vger.kernel.org
X-Gm-Message-State: AOJu0YzRe3tYxlK8rEkGFzf7jfh7ryz8wjg0ea1IinWO8HrI5APGpgzK
	r/OBlmOZZqDc+kbEZDHEq1M6zHBIYgkqfWTy1Ix+HvyJiAk3nF3XyWgbYtJiY3fo1QHE8KBgY5v
	FRYFB1NEV1fGBXMOBr5h3yx1k6qaNit+ea00FyrtC364PYzJG
X-Gm-Gg: ASbGnctMiA/JDorYX+gz+UtDgOcadIbYEUPgThsJjsNpp+urtXqShRwxnTfolp99I2z
	yOmwzlT3ziPkV5WQwe6jTEtMNHYYUm6NURS6SPwR0gfoiLQ==
X-Google-Smtp-Source: AGHT+IEAx/y8HxWIL4Ar8eKu+JD10nit9wzYSRIJPTI+4VzMun5m+vybNsNr5WBaptF/4DLV27iJ+6mrAb+om6m5tJU=
X-Received: by 2002:a05:690c:690b:b0:6ee:5fb0:8caa with SMTP id
 00721157ae682-6eee089e85amr24054867b3.12.1732263004772; Fri, 22 Nov 2024
 00:10:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>
 <pd2pnnnlw2mxaxtdw4aelnngr6kznungvzg452jco6c2anmb7n@xj3zci34aabs> <a7242ce3-240b-43f0-b8c4-60574bf71d69@quicinc.com>
In-Reply-To: <a7242ce3-240b-43f0-b8c4-60574bf71d69@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 10:09:54 +0200
Message-ID: <CAA8EJprNbvivUX06wpFmcMw_CmQS_jSLouwPk5KNvDkgveU6RQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: Enable SX150X
To: fange zhang <quic_fangez@quicinc.com>
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Nov 2024 at 09:57, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/10/14 18:37, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 05:47:27PM +0800, fangez via B4 Relay wrote:
> >> From: lliu6 <quic_lliu6@quicinc.com>
> >>
> >> Enable SX150X pinctrl driver.
> >>
> >> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> >
> > Ok, even worse. fangez, you are not the author of the patches, so there
> > is a missing S-o-B.
> Got it, fixed in v2 for other patches, and will remove the defconfig patch
>
> and I believe all items have been addressed. May I ask if we can start
> sending v3 now?

Of course.

> >
> >> ---
> >>   arch/arm64/configs/defconfig | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >> index 76f3a6ee93e979e9e39cb0283699a2753b0dddf4..13ff005ebe0e9cfcf171b08add24465d0ab94f05 100644
> >> --- a/arch/arm64/configs/defconfig
> >> +++ b/arch/arm64/configs/defconfig
> >> @@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
> >>   CONFIG_PINCTRL_SM8450=y
> >>   CONFIG_PINCTRL_SM8550=y
> >>   CONFIG_PINCTRL_SM8650=y
> >> +CONFIG_PINCTRL_SX150X=y
> >>   CONFIG_PINCTRL_X1E80100=y
> >>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> >>   CONFIG_PINCTRL_LPASS_LPI=m
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >
>


-- 
With best wishes
Dmitry


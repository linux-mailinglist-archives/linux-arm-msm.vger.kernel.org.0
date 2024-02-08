Return-Path: <linux-arm-msm+bounces-10180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E884E162
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 14:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0511F27CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 13:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A78763FD;
	Thu,  8 Feb 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNt0guO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4301E4A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707397537; cv=none; b=QZ1jdzCJsE2gkyS2Gl4nXqEj4j8EZ/gwdDjobmzbnVooDdDRf6dy8RML+bxD/dVYpp/5YN/Ydl10CnV1+ZfQoyUb8mB3rlTDDWi0NnsRsE4iypjBfSO5lFDp0NgdXJrJ0xqZOyLxOTYoggBQqm4Gkoknjcz1XFLDwQB/VqAsi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707397537; c=relaxed/simple;
	bh=OOm3KwQlSkpx/aQ0RD1Q/n3/Iu+q+deGUZmDwakoQcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7/WpJbIhpyqv8Xt7P6Mg/NHrj5rSxTp//Mmf67u5QbW/vQTRlhp8EAAsJwv4kljvd7aBTmaYxDAUyNfPgFa59gwH+O7zfeA9UOSAqa3auc83bPUQAhY+u/vbZll9mz0/UUp+VrIUMaGJ0fWjOZCwZ9+fQ87llglvNAzsyOx89s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNt0guO+; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6049fc02a19so9751757b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707397534; x=1708002334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaonEZUtkmkL4+4T+nM7QfSGszePSMsGy31jLocXPig=;
        b=LNt0guO+zv8N1hp1QGPKyIX2TOshE8/9Sz7v+1IQDLCx1F9j1tv33TSSgeyxeWUVgl
         ak3B2gzAKOeK8z5JlQvUxng39OusDMd/IN7Lz7yr+1v6D3bysAZ81xZlMGA2MG2kCktR
         lvqeHM2zia7I0/PloRbzLKN/tFbawD1wO3OtjnVH/Unv6PaUWIk7ho6qrBxiVcLRscMI
         +mkSsx1d/VPAhrGk79dDhfAgiclb6BTAsMx2UdT9AkQiad+bZneN1TJweJDgilTXFfAc
         FTypQZj6pvj5YXamY/Q+hX2YX317WoMZh8g7Ni9zVGABCP0k822JWFlmpla8fCzTVfl9
         qnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707397534; x=1708002334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaonEZUtkmkL4+4T+nM7QfSGszePSMsGy31jLocXPig=;
        b=kdYJ3l9V0M2mqNQkK4tAB+xvnU4EszBvwQgnFf8LzmxEEqcQmhINyo1DYsAIwrBuDQ
         6FQoEPQUphU7OJM7fLmaf2I26ymX+IKD6xzXNMWkE4IsLugmEOqTzxSOwhrnbSk0LwwZ
         7hgiIcALEDS0xyRp4rcmoiEsefrn+AcRkUJpH14BXaxo+EzeyJc+E9c8QJk3/TI4C14a
         W1UWbwJTYLkh06HM1SC63yKLPuwbW0Pueh5fRinW7sn8l2fCSBSTU/zsxnCnwSKQC/Xb
         g04xk0BS2cEJZg/ih47c5/oFJxSr459Be7cyU4O1xoH5Y51mJfAXwiJnpHgDihN6Wrzk
         zsfA==
X-Gm-Message-State: AOJu0YxunBFh/HCdHWnfdyYVPVReun7bysHUxlHS9Uivp8aG7yyNm1eB
	1ibTUf+f/KI51/Y/uJ0wRZIodaLyDXpssYtXyBtwK+5wdX+6DOH6QscaxC2QrDAiwsxdhzCXwbu
	Ns1JkcY2tp3Bs6FHTO7iOd1+/cf0Oq6s0qjkikA==
X-Google-Smtp-Source: AGHT+IGfphzyQv/EWtNvXSUhZkKTokLhrAXhw2QIgrex5Lkm5/2iiFvKEz8iowkI5t4PsE48NVTAvoH79ulzgHlzIPY=
X-Received: by 2002:a0d:c545:0:b0:604:71b3:2021 with SMTP id
 h66-20020a0dc545000000b0060471b32021mr8488916ywd.3.1707397533831; Thu, 08 Feb
 2024 05:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
 <20240130-pmi632-typec-v3-3-b05fe44f0a51@linaro.org> <CAA8EJpqhfWsmUxwmBLtdtx-aFOmTo24erdNfRyz2ymi_y=yidw@mail.gmail.com>
 <ZcTA5hbcladmKuLh@kuha.fi.intel.com>
In-Reply-To: <ZcTA5hbcladmKuLh@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 15:05:22 +0200
Message-ID: <CAA8EJpqf_iQz5JWwEsZmUOV=VSY5y_RrO6JqEztr9Q2Fc2J-FA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 13:54, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Feb 07, 2024 at 11:54:50AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 30 Jan 2024 at 21:33, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The PMI632 PMIC support Type-C port handling, but lacks USB
> > > PowerDelivery support. The TCPM requires all callbacks to be provided
> > > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > > implementation to enable the PMI632 support.
> > >
> > > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Heikki, Gunter, Gret, is there anything left on my side to get these patches in?
>
> Nothing from me. Do you want Greg to pick these?

Yes, please.

-- 
With best wishes
Dmitry


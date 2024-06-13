Return-Path: <linux-arm-msm+bounces-22581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B1906D01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 13:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A9286216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727771448EF;
	Thu, 13 Jun 2024 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nG3ZGyzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B5144D1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718279506; cv=none; b=HAQ+V9cSm/3lYCy3wNUDp+3g1fSunHJG5Jx/Jtw1iQ6YZrw9i20V+A/6aE59lNonOxQ3z734hLRxXSixsyBk/DDLp70tCsLErDxGcqPeMbc7T2EBMX4ktiiiI3MJwAWsBkoSz0ou5HbqRgFOAV82SXB1AWtr81ZRo897ONLl8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718279506; c=relaxed/simple;
	bh=sZEKZfHubIqep01PYDDOG2DiKYyzvbmcvlOdh30m7Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mC7jw8f/z4LuCqUsq/WDdbIJFo//cLVpjxG7WaG6/YKT60ndy0594D7BSTdzAdcV8Rv2W8zBUzuZmWwoGMtXhAFlxUje54j8nngdjhbeTQIrBotxtevL/o0KpWVMyG+4rl6Z8W3BLy9w8x8BAgVde2/GaFcqWV5MPdCnOSRKro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nG3ZGyzs; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62f86abc8abso9918057b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 04:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718279504; x=1718884304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YRvIRe1C8JF7J2k72Eq1IoWCS+jAa2AM8+ph/DDThXs=;
        b=nG3ZGyzs0+FGeRWMyFqTafgjocV1ZCf4AZaydmP1Gn5Aw47SfjbW9cs6LMFL9Uz4nT
         8HdsLKEc4nONPnRJ7XrCGPpNLpX5iSySpz9aFPXdO5oNWbfrHTQHaZKoBz1zCYscjoVu
         s/URdGDMaVoGA0E8+QIE2IG0MAIvVGbTC5dVdJ7mFpycHwdIn54UtMeO4SNHA8ODWoVN
         qyoKIgQl+4wXQxkwunl64Ep8/WoGjzv+12IUaZVK3JUfBskRaEtUUW9a8OPARY8mh0XF
         4fV3FsknDPTcjrifA5j3C2nQehltVk4hTM21XtcPxXc4yl6VFEHqTSKgqEHdnEgE7TOi
         5Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718279504; x=1718884304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRvIRe1C8JF7J2k72Eq1IoWCS+jAa2AM8+ph/DDThXs=;
        b=t547Zfp/GSct4kLuX3PtoAKbbmIBApHCa8nDmbaYOlfC+8IM9aOIkKfgGvrXy21nMZ
         2kOfIGz/LBZ5rJ1pLiO9b4Z75NGtkSQwOoAv/0/UY1M0qs/9vczgLZD0uDX+gFqmLmmL
         FJ/nLB7XghgnORe05kQdQ+Z8sOP8mFHKeUuO75pdLlqwbP/WAFhOm6App/UA68Kc04Oe
         oGKcldJrh85Sk5J/0ffV4tHpLsQUL7I3oG/2nKisTcojKpiX3oBYgXn2EeH88BIYGQGA
         LfiqvSj9dBCneyKRc3t6PJwW674RWWCKwWM7zgx/CWdtNvqST6sLtYgwAs3BNp0rV9bT
         1VAg==
X-Forwarded-Encrypted: i=1; AJvYcCWEknIigOAlH5RA09aDcBO0LdszKednhkvez6eNvKyUyGai35fXAfLVrmrHGYewyjNSWr1Uns5AFkUTk2q7fUA0D/ECV27W1+eCmmDeIg==
X-Gm-Message-State: AOJu0YzjeGRd3iJPENNlu2e1k/nnDyD7iglL1LkcBaJ+L3oWYcfcGWXz
	hXMQ9P4qadMdgk7e+zleX5SIC4XDLzgDfS/+Dipq9mx4uwD71PVnqwutZb8DNkq2JmNBOF6VRop
	f0vW6br/GnTXM0GIpm1Hb9hn0OnBTDWnDypNNMw==
X-Google-Smtp-Source: AGHT+IHsbTNLvjN8WuDB84rv+zysR6fpgX/dxzhUTfN9xcKd94L2FQdMlBq8iWThBr9t45yXD5czpiz8aOD25S8hU38=
X-Received: by 2002:a0d:dc84:0:b0:62a:259f:74d1 with SMTP id
 00721157ae682-62fb847d3a1mr45680067b3.5.1718279503794; Thu, 13 Jun 2024
 04:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082236.24112-1-quic_kbajaj@quicinc.com>
 <CAA8EJpp9U-ucMAiNmVvWDuupd=OR_fLK9fQ+n21SVmktWMxhmA@mail.gmail.com> <ae289c19-2701-d00f-3f6f-5e87ec37e475@quicinc.com>
In-Reply-To: <ae289c19-2701-d00f-3f6f-5e87ec37e475@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 14:51:32 +0300
Message-ID: <CAA8EJpo4v1sfjo2nUEj0-kZ_0rrMh07s67LzhBs8POjkN2Nybg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage setting
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 14:43, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
>
>
> On 5/24/2024 2:59 PM, Dmitry Baryshkov wrote:
> > On Fri, 24 May 2024 at 11:23, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
> >>
> >> While adding the USB support, it was found that the configuration
> >> for regulator smps5 was incorrectly set. Upon cross verifying for
> >> all the regulators, found that smps4, smps6 and smps8 are also
> >> incorrectly configured. This patch fixes the same.
> >
> > Nit: see Documentation/process/submitting-patches.rst, "This patch..."
>
> Will update the commit message.
>
> >
> >> In particular -
> >> - smps4 is 1.574V min and 2.04V max
> >> - smps5 is 1.2V min and 1.4V max
> >> - smps6 is 0.382V min and 1.12V max
> >
> > Just for my understanding, will anything further constraint these values?
>
> As far as i know, this is going to be final.

Ack

> currently, usb device is not working without this min/max change.

-- 
With best wishes
Dmitry


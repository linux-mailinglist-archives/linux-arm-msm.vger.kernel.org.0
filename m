Return-Path: <linux-arm-msm+bounces-42792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C682D9F7C20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 14:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3765B188C998
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7DE224887;
	Thu, 19 Dec 2024 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSpLqMu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAD3596F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734614075; cv=none; b=ighWy2N+PyZ37p6z/tgjokh1nebLSy20sVaYDrpxAYLDHmrkqalcIQhGd1hXqTAvH82uJthlBvZrtNtllCkk8CqfnnUgJa37ofwCTSoVbj/dnx0M8W+vNEUGGhiSLDUAfvLRXipa8SxYJcIc/rX9h/zQfFSfnjmLVR/q5URi6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734614075; c=relaxed/simple;
	bh=GW2/KJjN04w8khdOlzLuwqCJRH59oP9AEwB8kVbiqqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTr2hsZBqJ00J8ESBkCZLm5FYXtz3RKCtUqxfZQDnBqPSh8u3bvP6WtVPGM5Q05vi7aYuuFhkT/aIbPatC43IbB5HyQG/sek9kfHJJPFPru5iIiRaqgEpI5ij7CgK3HS73IlUW7sUJgvPVKFMIg+j1KzWsLyxRcXpjgHFZpLNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSpLqMu8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3043e84c687so7268161fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734614072; x=1735218872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDxskw9f45RUSU86hbyjLbbAWKLThzhhQcb+B0wtv7M=;
        b=qSpLqMu8K4IG49Cq9tmONZQmOXmc0VEzoFZ64LDz+k9QI2YtWIz1sAABaBYnEfggNH
         65hWNmxd9NQ6LTN6U5pIh3LFMu3F5vLGu8+YhkWLmX/Wbv6gnXj4g13jOWLuyvJf2LtY
         9ikj031oAUHyY+2phUM94wxKAxSN7DhgZJWc73cpoLsoRck5Bc+BMv7/a//UuAex0CAb
         HyemzHzxNpW4Y493bW1IAr2QG3dAPjRcAFvIxIbSpMaO6yRp524WaEbzCbt3BUOhSl78
         aPTXk6Fk+7QHRyVJoY13XDV7eAwHdCCDkW/kHG5hzTdekjNTLCdtaaJKOG0l1hVs0v3D
         rZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734614072; x=1735218872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDxskw9f45RUSU86hbyjLbbAWKLThzhhQcb+B0wtv7M=;
        b=dwH0wGqMxF1yasI79/tNQyP7X7Ba0J48Ze0sdGzGhPdkQRLF0gkzoLg7v5k4FxtSho
         2XHnFVkCWMydpyMc2jrEJ3ZswTIUYFfQIv/s1OHJ1BURShNvh3/VyilK+FWK9iwZYQ9e
         H/8EwGLpqWuAw8rcii3GqlbIr9wgXCZdc67ePQzPduei2MNj3S5v1g7HoazwLuivhASH
         02gme5nPOAujXl6PQtBokipJW6UBU+2Udgvpu9NWcubNfObnmJpsvvHzWLmSZxZ/LfOT
         TDaBBRRzH/9cuLEaBbukotLFaZX3KlN2wPD5veGaRzlXdLklgXweKmSR2gHQ5bZxE8Ne
         6bpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMCqqasfd823XGk2HA9gjL9JGLwXXQNoLSJrwLf7c6NWOzf4fSMRwmQx/KrvbIFDPVcOs3g3fGbN1U+19A@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNZ3zSAjnmK0CELJZ0RlMLntnosIGtHWG3VyTZuAGyQ4Yqa1x
	hZdu3yU4dQ3Kw/cAoi324S5tdA16jgqGjr+6+oeAI8oFmr+9X9vAKRidY0l3X9c=
X-Gm-Gg: ASbGncuqpvAWMmJFqW6sjJNh2gVS5e6v6NcaYwSQa118Go5fTWrXot8Of8FqjjD0Ybl
	I/cf8WZgi6+TcIOk3afnhIAOryw9FQahxotGhNUDhHl+nsoo7xOySnh0iV72FO2GJA7Rj29sV58
	HCSqecaoBxJOJSggpOP3MDSRt/S6I1CZ0YMMkEhaPsrpCiG/YulZeukxpt85DwcGI7tFRppcf45
	QbUMkDiVWbKb1JdlAiVnlPusipMarj0gMQCQq41mt67XBx7UvhoepKda5fLIliJHIZVyknie6b7
	/12KOFJud8JhKjrYqb94VFfsoafYp8f/njZm
X-Google-Smtp-Source: AGHT+IF8AisnJgwFnkXU6DRymHTDSjq7pbCiGElXFGrbjnm7/GAEX/1jFZfMnRkeNxN9xRJqY8ZIsg==
X-Received: by 2002:a05:6512:1281:b0:540:3566:9744 with SMTP id 2adb3069b0e04-541e674c7f4mr2120568e87.21.1734614072005;
        Thu, 19 Dec 2024 05:14:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238216b5sm168924e87.182.2024.12.19.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:14:30 -0800 (PST)
Date: Thu, 19 Dec 2024 15:14:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
Message-ID: <h4e5jmbglic5aa5e3fyqr3elvso2lotekafqhu7v3h56nbfwf2@qq7lqpptyrai>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
 <nvhrhnfls2i4sb6rrlax2dh3hf5thfttrq54bgug2jc7ol26rj@cnk5dtampfes>
 <e15bc97d-eef3-4e49-badf-5b3afbc113d9@quicinc.com>
 <3h2ur3wv3tso3qxv4ws2af4vmvdjdpvhax5smngszaaaotvgku@bo2q5cmhds2z>
 <d6d176ac-e08a-4877-a5de-83e8b070fe47@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d176ac-e08a-4877-a5de-83e8b070fe47@quicinc.com>

On Thu, Dec 19, 2024 at 09:47:12AM +0530, Prashanth K wrote:
> 
> 
> On 19-12-24 08:37 am, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 05:18:50PM +0530, Prashanth K wrote:
> >>
> >>
> >> On 18-12-24 04:57 pm, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
> >>>> Enabling U1 and U2 power-saving states can lead to stability and
> >>>> performance issues, particularly for latency-sensitive or high-
> >>>> throughput applications. These low-power link states are intended
> >>>> to reduce power consumption by allowing the device to enter partial
> >>>> low-power modes during idle periods. However, they can sometimes
> >>>> result in unexpected behavior. Over the years, some of the issues
> >>>> seen are as follows:
> >>>>
> >>>
> >>> [..]
> >>>
> >>>>
> >>>> This series was earlier started by Krishna Kurapati where he disabled
> >>>> U1/U2 on some SM targets. I'm extending this to more devices including
> >>>> Auto, Compute and IOT platforms. On a side note, this quirk has been
> >>>> already included on some mobile targets like SM8550/8650.
> >>>
> >>> Why are you resending previous patches rather than adding another series
> >>> on top of it?
> >>>
> >> Hi Dmitry,
> >>
> >> RFC had only one patch with quirks (to disable u1/u2) only for few
> >> targets (SM8150, 8250, 8350, 8450). It was later decided to split it
> >> into per-file commits as per the review comments. Hence I clubbed
> >> Krishna's changes along with few more targets. Let me know if this needs
> >> to be changed.
> > 
> > No, it's fine. The text in the commit message lead me to a wrong
> > conclusion.
> > 
> Ok sure.
> >>
> >>>>
> >>>> Changes in v2:
> >>>> - Removed the wrongly added quirks from tcsr_mutex node.
> >>>> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
> >>>
> >>> What was changed in v3?
> >> It was supposed to be "Changes in v3" instead of v2.
> > 
> > Then where is a changelog between RFC and v2?
> > 
> > Please consider switching to the b4 tool, it handles such issues for
> > you.
> > 
> Ok, Should I send a new version updating the cover letter?


For now you can provide data in the reply. Just make sure to include it
in the cover letter if the patchset gets reposted.

> >>>
> >>>>
> >>>> Link to RFC:
> >>>> https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi
> >>>>
> >>>
> >> Regards,
> >> Prashanth K
> >>
> > 
> 

-- 
With best wishes
Dmitry


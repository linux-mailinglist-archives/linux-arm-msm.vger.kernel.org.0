Return-Path: <linux-arm-msm+bounces-23419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424619110E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C741F21534
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB9E1BD4FD;
	Thu, 20 Jun 2024 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTmoj9cT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DA1BD4F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907757; cv=none; b=pUZLntS43kUuppgTw/prZTItH5lHGzJRKfTF0uPTjHHTVq54VulVxp3hralphiFXyKzISeRx87VOh6/gFdlPnJeCqkSK+aQPtBPmiTAbhAQvU0LQG2Iuw88l90Dq6PEUFWKvG7hp8/oU4sax7wNJIcyCBdojiL09YuG+ANyTquw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907757; c=relaxed/simple;
	bh=8aM4Ph0eOvNFwrdP2WzLOXk6R3ipiL8t6qIpQ9eq3IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmZtdwU3ZiF18wOD7IjU72NuJ/CvBM/wcqMNBiuEQ7KrTphd3PLi3OY5F7RFnWgEbJaZ/XSJ2MbIsq0flj6CrjGzewUIJucsIQVhfM+tMq4u/ZhkyNIIe28oRJt5YwVi9hT8G2T9q4kbexNvkRCeHt0PpzHQcNFkXf6/OPKHD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTmoj9cT; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e02a6d4bdbeso1117384276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718907749; x=1719512549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y+/jeB60Bm2B2G46o3kb3rBx4IuCHoUReNPsRUwKQSQ=;
        b=sTmoj9cTDil9/LC7ftHUWLfA15nJFHix9hVXr0PzichaSvR0iHIuCmu9PCbd8Bxu33
         3LzEE5bQfkjTuoG32MivQzS5NL+FltP2AsjRS3fILazdmbRX6JOgYzCHwVD7nDrcfm7b
         Wbm7g0QvnwFWl6IUZv+71OjP6/rlXLU8XqV/w91vDDW0m3MV5TX05V9FpilOKw4ymLCf
         MXCNVIzHFP4zEDDq8ydZXCuEoy36bOcD2wk79oV/SW9/snJQV45MU7sgLLvNssS+rlkI
         7HeNbbbYBCDs5qyZ+uHSLn861RlxWRMCBGqKAk/wEwqMjRmoHj2CkLqrjCv8cHrC2RkN
         t+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718907749; x=1719512549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+/jeB60Bm2B2G46o3kb3rBx4IuCHoUReNPsRUwKQSQ=;
        b=wjG8a/z21rjbHv7mR5HTn9t8k508iIbP3BtZiEbmUjtogC5xDUybQYiCLe9zC9GW9p
         e3BqYXnHkd94FjS/X+/hoFAPqzBmy4mJOhbBARmpFYAOvXz1ThSFnntLfoBXJ1BU5XSo
         wKfWN3yWxMPM1X8sJ0C+hvbjm0MiVqapM77SMF4Wpj+3uJxYrYJ1mtFDG70MK4J+MQTk
         eNnae+Zp60qI9PV6NTFzE9mh1+ymhe7VG4tgyPLEPq3/UzAy7YicVoFl9Wyy7ZgLtJ5b
         ltqmv6oXe4DQBim/k80sA/dngM4+1y/5QYfpEBAuePGfFpP1T9JKMlDIVjebEg4wFrQg
         hMGA==
X-Forwarded-Encrypted: i=1; AJvYcCWziwvrDugo7hGpC74f3GVmWICPidIsSNfo4oD1c4sLV6XEw4nTeWq64CzJgxXeTfBrdg2moSNeD7r72obl2Hut7EKSj5NzlmAMXmQh8Q==
X-Gm-Message-State: AOJu0YwhHKPIobw1N+PHETXpdAYrYd/5eXBxrd6y72R7LDSdKy1uhu5Y
	wy5EiSAV7N6zhQhGsWMuA89UQnRCvYhaWYPbghhEWJnc60gslje2HKe/m9NZXV/f+qyAMbWvp5L
	zv3nZUscyWZARyvohRZiWeiZzJMyy8JkHvMe4TA==
X-Google-Smtp-Source: AGHT+IEZ6ucq7WUpXl7uqlICYldXWVE5EUSOoAVmKLtPOIw/yWqu639Qkfd8yDB3a9wxxaCLte6aHXlDElHhwozKVik=
X-Received: by 2002:a25:ad89:0:b0:e02:bd25:9ac8 with SMTP id
 3f1490d57ef6-e02be13aad8mr6866253276.18.1718907749227; Thu, 20 Jun 2024
 11:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org> <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
 <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org> <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
 <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org>
In-Reply-To: <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 21:22:18 +0300
Message-ID: <CAA8EJprLNZwTdKN8h_RduGMBJyCHY5CoiYkzru4bNfkzU6WCog@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set role-switch-default-mode
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 19:49, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 20/06/2024 17:07, Dmitry Baryshkov wrote:
> > On Thu, Jun 20, 2024 at 03:30:29PM GMT, Caleb Connolly wrote:
> >>
> >>
> >> On 20/06/2024 15:15, Dmitry Baryshkov wrote:
> >>> On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> >>>>
> >>>> Give a hint to the OS which role we prefer. Host mode generally makes
> >>>> the most sense.
> >>>
> >>> Why?
> >>
> >> I guess this is subjective, but on these boards the more common usecase is
> >> host mode (before we had role switching we forced them to host mode...).
> >>>
> >>>>
> >>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>
> >>> Would it make sense to set this for all the RB and HDK boards?
> >>
> >> The rb1/2 are the only boards which lack multiple USB controllers. For
> >> others it's fine to leave the default (peripheral mode).
> >
> > SM8450-HDK and SM8650-HDK also have just a single USB-C port. My logic
> > was slightly different. We consider these devices to be SBCs, so I'd
> > expect that they act as hosts _by_default_. If somebody plugs RB board
> > into a laptop, then it's logical that it should work as a device, but
> > between the phone and the RB board the RB is a host.
>
> Ahh I see, then yes perhaps it makes sense. I can send v2 with patches
> for other boards too.
>
> * qrb2210-rb1
> * qrb4210-rb2
> * sm8450-hdk
> * sm8650-hdk
>
> Any others?

I checked, sm8550-hdk also doesn't seem to have the USB-A port. I
think that's it for now.

-- 
With best wishes
Dmitry


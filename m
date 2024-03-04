Return-Path: <linux-arm-msm+bounces-13250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453986FE0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0019D2814E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4033611A;
	Mon,  4 Mar 2024 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcFtWw/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394A2C18D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545901; cv=none; b=UUZ6//IWVwbbO/HMzdwXUswV51vq2swMTmGWPyzmltBG+NAGwyR00IY9VbHfMjkV3qJHqbwMkaJWIeRCn3IwFTN5w4i95bfeeBDPMPrS+FsiW7iMIDN8wmCuXHCgPOhKWPWcQc8OYlOSunEJ16tlqMvB4bGsdfI1XrRS4pZz/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545901; c=relaxed/simple;
	bh=MGhgkMD/cjVPR3a+kB0C5eJxM17tMh3NQiA6g1OtcLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXDuDXujZjBU9sK5iQ+VBAIrv4sQJDTykI9BT3VtUhnrnn4SJHhe5cJdNrlZrZ+PhTEEN3THiCDIX7D174NVeY8JoEoxu5kNs6Y37YaV0vft6FZPX7fxqYperXY6yeMaKuO7Y7UMoqp03nhY+dOVNSfLTDnzVUbTfQ6Bvy/4h8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcFtWw/Q; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4280266276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709545898; x=1710150698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VnfOrWMwZoAPt5p92Jsbbn3jE/DBv9zEluClEUvIFsg=;
        b=gcFtWw/QeaQjEXNYOTtj4u72+Is6EmgIgtyA1dlOU3dGoq7fI+QQSW34vaejLIs6qM
         4kTKSF7E1QgLS1XcJ6HA/RldDR1NSeVWIMJdP5kw8BvgklYLIvULNzQREb/VHOq94m9R
         29RDXeEZxYFOFWf5ydbuMjiwJDdiWioA2jK6NQuTUwQKvo544KWsuvx0gGZF7KXnqq57
         nOsZZEQFQxxO7lj1kbTzM0NxDGlzjAQMEjg5k/YCvtLg3Dan5zmDs1znvENDbOlXCmat
         qeHrSdPjY0UuQD5nkiCM/J34D/sHK1tR0zIs3ZuiMtAVHw33U5l8LWizlYK6qL/xN431
         RfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709545898; x=1710150698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnfOrWMwZoAPt5p92Jsbbn3jE/DBv9zEluClEUvIFsg=;
        b=OwwqNbtZ49Wrgzn8SgF9IIkd0JgdBtXtktGmA5ohQoOfF4C+SLp5XPiLH4UWxdK7Bm
         g5xqzqlwArLydKAG28t5+fme33IUHH/EDRx2glHYr7X2jz+fZWb7D+pgOKdjdRFhlgxC
         BaQFkC+mhwY3tFRO3l7uiG9vNPdf7S2si96EbAPBr3NlnaKiL2dBuI/BDBhWe59rmzMd
         cDkjg2UphM5Utfp6f/k/bvzLfPh3M6LRFl+5zE9dul6HsKHDdQlG4dqVBpw8azQKgqH/
         v20be+asklEDaSb2X6dawVR9b0nj7F0QW1kk/5cRiw0IelTZtvKjj01syse5elejK5Uu
         MlUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0tHRABWzXHLYwrRA9G8W1Rph08GkSGkBA2cvwlsYhSWQ9paLrkixtxSWTjlRG5D0luDh1qP8La8oBRufLLOx6H55LTrhwNMmXInrBmg==
X-Gm-Message-State: AOJu0YwimzBw07cNH++61jdxsmx3pSt8ix7Ju7DGHKP1uEeeH6J4hH4M
	66bPUzpBhGO4o573SaQNihR16r8OLa43iQduAKP89bi3u+gnEHMo3t7Qx8z+ip1Z3PPaN+56S9n
	jvVEIXXQaeAloskLWQ4f05rusRWoOH1v1CLbCKg==
X-Google-Smtp-Source: AGHT+IHGpMgW4Nq+tUL0EpMm0iZyBEZIKD85dk+O+VJWc2BEPOdiuo1YLXxxsOZBGB5cYTCYqXHAmyECwavkhIzy2VA=
X-Received: by 2002:a25:ec05:0:b0:dcb:f7a0:b031 with SMTP id
 j5-20020a25ec05000000b00dcbf7a0b031mr5234974ybh.50.1709545898337; Mon, 04 Mar
 2024 01:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org> <2024030414-stark-service-ce78@gregkh>
In-Reply-To: <2024030414-stark-service-ce78@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:51:27 +0200
Message-ID: <CAA8EJpoCm+jqMsd6=pnpd+cCtqLYnMWLmrNQgjiyhi7ugeUjvA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 11:49, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 04, 2024 at 11:26:09AM +0200, Dmitry Baryshkov wrote:
> > Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> > Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> > Robotics RB1 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Patch 1 added, 2 did not apply to my tree :(

Thank you!
Yes, patch 2 should go through arm-soc.


-- 
With best wishes
Dmitry


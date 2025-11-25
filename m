Return-Path: <linux-arm-msm+bounces-83241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CDC84B03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EEBD4E92DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4F93168E0;
	Tue, 25 Nov 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrWFRG0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3A316912
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069294; cv=none; b=TC1k4bzXmW0TFDRLL3kzDD8cIVuNIs2us5tGjClEoNaZA0IcOFfFqKZpYiDaRkSGdKCFD9aMh4Aj1WHlONvMZRTJLXNmIS469Wy2b8IeDjUP0aQ4j9ovmOsjGRyV+zKkYuc+irFS4Wn8W6jP1JVxOMrUPDyrdz2G7NIcHF3Wec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069294; c=relaxed/simple;
	bh=2zviYWMpRPXc7yqUPhvqUBifZAL4AmGZqkh12A+yNQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1YFRlvqg2CQr+K8oXVpQU/1HihsgzeHoPfDiqZRzEEJ1UA2LPgmlw4jqyftUu4iCVewHvPh0apt+Xjske6dIn6613W67OTm1vTyuc4h7+c03ac+tfkQVHf/hz7ib85uVPtJMA9u/CpnCN+zaIG8NlfHlV5oubnbWn16Nq9LSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrWFRG0d; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-595819064cdso7514847e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 03:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764069290; x=1764674090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2zviYWMpRPXc7yqUPhvqUBifZAL4AmGZqkh12A+yNQ0=;
        b=VrWFRG0dKomuUzcS2XLhJZDCGANBcAE12w2w2kh0Xda0UDi0ZhycStdM7o+x4w2QpS
         +ZWg3P5i9/hMPPU/GYoIE8Urj7BW4xGtgbKePcLSyxBOSz165Fxe4MZo7mBUlp/RZ/CM
         o0ghC9HLrss2wvfdc21hgNdj9+u2P/JGtgDphLpHoEoABHotr7/yqu3pG6D0S/jBAozl
         HE4rH/7Jp6+mbqEZctfNi190Kn7iIU9nDRf5gk48X0zHpEK8uv/k0lu6s75c07P4MOlu
         57dbI01atHgk5T23xiIMS43+hpr6Xao7D7QIGm1ki5hKOCx58yMwTCY97T8qMSdMtQ5y
         MO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069290; x=1764674090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zviYWMpRPXc7yqUPhvqUBifZAL4AmGZqkh12A+yNQ0=;
        b=cRNzngSNhLckNRJ9v8fsvRxSm85/bW05agN3y6Ooy3zq/osoNqPU+KRbPXpdMjywco
         KPqmFCluQGMO/qtLfqqDHeQ3fkpTy8ussIgvRfh9rhWto/0bwSfjbC95GZNnIfV9LyTH
         1yNlixzFBy0e0LWunhQDGqYC1nEUbYI8HUkZ0aiWTPuzJSYbNFla+qrwm7WSwwBDIqnZ
         A4xYkqopm79dr5dfBqDfD8e6+Sgd8tkigH07ErHV9eanf2IvD3b9HNBw0Vwpcw1znwKm
         XNU7yxQSPGm1+0DJIEVOqmYihUUZBnq/0i2XCY8r5UyRGwn1NRryy0MOUuEnbX92AldT
         OzPw==
X-Forwarded-Encrypted: i=1; AJvYcCUrcqD98/jDdb/bS1cR+gJDwJaVPeDAhkeEq8BeRe7k/NQa1ABaT+G8rjkrHE3DbukwIQXmfPSgUelAIIG4@vger.kernel.org
X-Gm-Message-State: AOJu0YxdQZOwV6LO5TWUqy32HSyli8nr3vGIdcA8NEEOZR9RHmepLMVC
	07D1Cpuc8WXP/eLufLoE0LPIReAEkuRUakkuXweAWePeLz9YvZuEAUb8eEY7zoJ7VNBMvvttOKp
	gAXU0OcIWFmXRtcmu2a0gsPhUUTJVyiJVbeqYZ73E2EQsqWy4C8JOsEQe7A==
X-Gm-Gg: ASbGncv/SYMkkzeHn2eqPSZBV5aI8ymP+AxMWn+7JP3Liiv/+eo5NVdIDoKfUFxjzDk
	11mwo8V029ZrN8yIoFJYWnNElJq+4otARMzGnqd4H27rPIdmjEydPR4s3IGJvbHygk3ZiDlYlxg
	5WZkp+0gykHiXsrlQqPbsAcKC3CkDF87tJOAbIyBOIaSVCSaJgDgCOXhXnpkeo9KusTMOjHd9mK
	+L3XYdLvoF4sbkZWiuMzPEepKSAmQL/p7gRZ3oYHkPX9FiQwEVEZwsziUmj7r5hyMQBvg==
X-Google-Smtp-Source: AGHT+IHg2+2QxlVeXNyTPHfpqpewNYQ2OW0QcIQRhS9rdrtPTlPGG+LpQTObtaQA8pOcEc/dOqmtT1WQQgzDShvVdJM=
X-Received: by 2002:a17:907:3f97:b0:b73:2d9c:9581 with SMTP id
 a640c23a62f3a-b766efaded0mr1943285166b.28.1764068858360; Tue, 25 Nov 2025
 03:07:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org> <aSGXu7IhPDNSkYhi@linaro.org>
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org> <f8ebe524-1f0a-4f54-96ce-aa36f8659adc@tuxedocomputers.com>
 <7716b83f-409c-4fa8-8232-89d3d1be5dd6@linaro.org> <7a3e2e3a-1a6d-460c-846c-209474c2311c@oss.qualcomm.com>
In-Reply-To: <7a3e2e3a-1a6d-460c-846c-209474c2311c@oss.qualcomm.com>
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Tue, 25 Nov 2025 12:07:26 +0100
X-Gm-Features: AWmQ_blURkPornvVq9QQ5IxYAUQrQZu5rkeLI5vLb1vMNoivF5xocKd8GUSWksI
Message-ID: <CACBDSOWcacFoKFjrNpDm0zCEk0AJcYcgJPOfcDQxE3mSussQ4w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Georg Gottleuber <g.gottleuber@tuxedocomputers.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Georg Gottleuber <ggo@tuxedocomputers.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org, 
	wse@tuxedocomputers.com, cs@tuxedo.de
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 25 Nov 2025 at 11:50, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/25/25 11:37 AM, Neil Armstrong wrote:
> > On 11/24/25 15:09, Georg Gottleuber wrote:
> >> Hello Krzysztof.
> >>
> >> Am 22.11.25 um 12:15 schrieb Krzysztof Kozlowski:
> >>> On 22/11/2025 12:00, Stephan Gerhold wrote:
> >>>> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
> >>>>> On 21/11/2025 15:26, Georg Gottleuber wrote:
> >>>>>> [...]
> >>>>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
> >>>>>> Snapdragon X Elite SoC (X1E78100).
>
> [...]
>
> >> I understand your frustration, but I'm still learning how to contribute
> >> to the Linux kernel. However, we may be able to find a constructive
> >> solution. Here at TUXEDO, we have the necessary Medion device and have
> >> already adapted the device tree.
> >>
> >> Would you review a patch set for Medion SPRCHRGD 14 S1 Elite?
> >
> > I think it's worth re-spining this patchset for the Medion SPRCHRGD 14 S1 Elite
> > with a comment in the DT mentioning the device tree is compatible with
> > the defunct Tuxedo Elite 14 Gen 1, since the Medion is an actual product
> > people can buy it's worth it.
>
> +1, especially since you mentioned you have an actual Medion at hand

I agree, we can actually try to respin the patches for Medion if
TUXEDO is not worth it.

Regards,
Ettore

>
> Konrad


Return-Path: <linux-arm-msm+bounces-48778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4DA3E953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 01:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E33E19C509E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7D8AD27;
	Fri, 21 Feb 2025 00:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPbadOSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB11DA53
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098847; cv=none; b=Y/PLn9seCHh9e5k8YuMiNHXql7o6KBep06rFNLKhLbdmLgXvmDkEFX5qrbhAEpHVks+NMlDiVIqTgnMhQ6FtLc7AOmqpg8rd0w2xVCQnL8Z7AdzPqZiFkDjBV8pdKJpRejwDVMOd+byOLjrVEljoHvbULrgoqjTEacIRz313ALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098847; c=relaxed/simple;
	bh=AFMZD8xA79SrcF7qdF9M6LpkATxyi3gQbmTSSDjdeMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nIR+0ecviwkWRT/8EunpsRR/9SeqPg81UCrwuB7Or2ZHYv2XgU0XKWvoBRdYNSKJydZL15ppxQ78PiS9l46+pXaaZEC5/MrgFzuW8jMTJzXthORDmTV89oBaWNm997rEXnCAyoMmHYXovWlLWCcWx6NztIT8T8Rirvwo5lttepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPbadOSg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4397dff185fso13387855e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740098843; x=1740703643; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uwzXKEnNeEIPu52I2DCxojSGUOWNSCkUNKbC+s6sxg=;
        b=SPbadOSgWdR2bVUHmyVLYXoeXl5elxDHAqEFCVi8kUac67RWfOTSOTVAjcAXIvg1bj
         RUjJhIhMSgC1GCisOCUZ30bu/h9ylImmJ5y/R4Yv6TNX4WVzBTrgiDW0DH+n3HbzzH0B
         OjERvsJxu3TgXmgijW5o2RqaHPqEQgLbXYnETfqQJk8xILLLwa10032crjdT0hYeGlDi
         rMdakWDjCpL6Bt34zMn7L59lKTER5FTJG1p2baViBqWszVeLTObf1pPdYoNkP4EbDwq+
         7rsMGz1hdw7RgPMaIvBoROQ+XphYhwgXF8HTIgey+STtdeZYz58xltzxrharMTVrAzDO
         o0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740098843; x=1740703643;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uwzXKEnNeEIPu52I2DCxojSGUOWNSCkUNKbC+s6sxg=;
        b=R6cjhNYq+07Yd0UAxtLY5v2FNqQ9UUHE+GJxFmsyvHccCW76Y/q8Uqzeie8R4n3cVa
         CstzD+pYHjEmTBEhkoQDYkm91HGJ3RIbXeM2xAuzI993J1eb3VeDp4BKH0QhcyuGMhjA
         iUAxXlb/z5qND5CdL0lbwjlHuWaijSDoD0/qPMAR8fPw/ItO3tDA6YrQ4m34LvWEAheh
         I/hKg1I5Ak0hq6W+2KX9QaqqhLCz+5Q3gS1m4wi3nA0dUISu1nu/qzLyE1RbyFB4DIDl
         Yj1mruYO5J6SggsvfuPwbYvgkUmxodJ8Ivh8aKIexeLvvMELKmjmYJwyIuC4KSvByORq
         g9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVcjPWwyWyYPtObwBIb99MqczWBEaik+Nu1JugYpMcUlMye/CSgBIiIC8L5iiZSdmCB67elS/6od+sZAXlQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw16Rswa6rnZ9i/YRqqYwIz9yw3AlHkYSyGozlHyCdSF4OIB/sX
	Ytl8HcP+G98Scopp5MADpYX+0e/sNEWZnxIYHTd8mP7NwnjGgqXkAyahWK7cSXQ=
X-Gm-Gg: ASbGncvgnVCimYtWIW5QVMNrZZylo9VirDei8RzUzFB2plRbdPYC5qcaic0vAl3BjwH
	QiypAuX4Iphl4O9YA37UT1Z00g24+pqfozqFtVgbwvXYqR7e78bBIEtV70B5S2cl8kkjN35tv1w
	8et/0koiuY3jr4fxOx0dkVGaqrMONogGapXz7bJ+XV4vRNMRxtdclW6pAIQ1V1OPOnNW6VD0eLT
	C6qr9RUIGPAVyQVsqWNUJGk1CyCy8tSE7/6CzBYnpnkFleofLUKdQ3XNLdbLcAhTzblcj6vpmws
	rwsyUn7WtewtsdDENw==
X-Google-Smtp-Source: AGHT+IGP2COMTFmCb6NZD7IEUpBby+MJg1OI/LvEAFrSspNS5gqFhyuY2jzlf6BtHJjV5QSFOV34JQ==
X-Received: by 2002:a05:600c:1390:b0:439:8bc3:a697 with SMTP id 5b1f17b1804b1-439ae1d7e97mr9688025e9.4.1740098843201;
        Thu, 20 Feb 2025 16:47:23 -0800 (PST)
Received: from localhost ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0371c51sm877805e9.35.2025.02.20.16.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 16:47:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 00:47:22 +0000
Message-Id: <D7XPK4C7YYVN.2H85SNZIOOPAB@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <krzysztof.kozlowski@linaro.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Steev Klimaszewski" <steev@kali.org>
X-Mailer: aerc 0.20.0
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
 <CAKXuJqihpwnOTepgTkH3FaGB5=kXVCDOckPGpacJ7JWZXxsKWw@mail.gmail.com>
In-Reply-To: <CAKXuJqihpwnOTepgTkH3FaGB5=kXVCDOckPGpacJ7JWZXxsKWw@mail.gmail.com>

On Tue Jan 7, 2025 at 10:25 PM GMT, Steev Klimaszewski wrote:
> Hi Alexey,
> Thank you for this!

Hi Steev,

Thank you for testing. This really helps.
And sorry for slowly getting back to you.

> I've tested this on my Thinkpad X13s which has the wsa883x, and here,
> when idle, I see an entry, sdw:1:0:0217:0202:00:1 which shows ~26-28C
> when idle, as well as sdw:1:0:0217:0202:00:2 which has ~22-24C when
> idle, however if I play audio, both of them drop to 1C and do not move
> from that while audio is playing.  Is this expected behaviour
> currently?
>
> (out of laziness to repeat what I am doing here - I have bottom
> (https://github.com/clementtsang/bottom) running in 1 terminal, and
> then in a second terminal I either play an audio file with
> canbetrra-gtk-play or mpv a video with audio and for the entire time
> that there is audio playback, the temperature sits at 1C.

As far as I am aware there is some hw limitation resulting in that
temperature is not updating during playback/when amplifier is active or
that it is not allowed to read temp registers when the amplifier is active.

However, we should return the last good value here and not drop temp to 1C.
I think I found what the problem was and I will resend the new version soon=
.

Also, on sm8750 I see the 4-5 degree Celcius temperature diff between two
amplifiers (30C and 35C for instance).

Thanks,
Alexey



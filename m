Return-Path: <linux-arm-msm+bounces-32511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17B986630
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 20:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32394284131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 18:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80997129E93;
	Wed, 25 Sep 2024 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2/scw8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65CB1D5ACD;
	Wed, 25 Sep 2024 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727288300; cv=none; b=VED0bxlAHOe77KJQzCwfGGtNY4ObH/qpUSYdMD0P085qvBRnP/VJUWTNTISvKJEADbFf/lsKeWKvRmX5oR7GU3HakQ9Of3RpNWAaotBGRZU5FCuHlAnV+OyGFC/3Nj8r6+9uVQHQikZT+8KliuDwpQBKVcw7EKGyuTxyat1b9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727288300; c=relaxed/simple;
	bh=gWsy6H13VNTiSSRm01K6ax9aVmZD6+BX8NRpB0HYQ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgOl/DSw2TnVmUMU6AWbf0DM1K/uWGTHzrXQ/gtwV0gs21IGk3ZboCJtD2KMr6VcyriRRgYLnop9aiIFLBWcsZ/FM/wXwjQoEi5ESGn/BLWzGvMK95PBdQh+rx7S31sDijPOsMmnE5JNn5PAatxOlXb7TbQ7cGJlwuHBvQYIU7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2/scw8q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso698635e9.2;
        Wed, 25 Sep 2024 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727288297; x=1727893097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EqXz9qu83+EHOYAALTDMwiIK5hs6Ih3Fc29t/kJ0wUw=;
        b=c2/scw8qFclYaUp4y9jxBtSNQDNgaqYK4iHyG73Gnax1gfIRUzJ30DUVczU7fNW/PO
         4sJoGhl3ghntFyI/GKu7ZnAFb+oVxfQT3nCJnbeGM+u8krL3r0Unn8BExoPWr6rsdd8q
         uCZiU3rU4VgeLuN9gclncX0qDvhOJEc1EgxX341wHMsaEY0movkUbVvx/SIAB0qjB6wd
         GMLQ6kpSZ4LiQvUroXe+OCl49i8Fff7/NE6Bh0KGKGOYtyNRdz3k0U1dRF1epZAxAEbC
         7eTVFxXfdGqQrk+M/7Cvys/GpltnmfArBhoiP6fITcmaEBXKoKpTwWszb6pGltQSK3Xf
         m+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727288297; x=1727893097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqXz9qu83+EHOYAALTDMwiIK5hs6Ih3Fc29t/kJ0wUw=;
        b=Svbs1d8TJT8P0tHDyEcW2w3o0i8sJ3LdWhIQ98o6H9K6LC+k7z3rgCbudK6RHalQQX
         ihfp26AwRYFov+yvpOd3cmEj0lQzmmDm9Z+toIArGeyBGx3PS/kWZ/vY5IhKJX1WjUMY
         J01HMZVU2W4XFM3ZHt2LRLT7gpX+2yiUh1WYdVwPaPgKtvW1csAMbH3HaC6o7hn8g/yg
         f1s/uQ0mj62TPCdrrg5Uj8INyzKF+tQrawJ3+QNeHeUvQEGNIWcmW+2HZ8AN3b8q9/OL
         Ooespv3mkO5wcK5p6NnrXe6PYLu4/86KW5r3QvE4yJ/Z/fCQ3V5uAUOkNtdACLWS8z7G
         JAaw==
X-Forwarded-Encrypted: i=1; AJvYcCUEy1/FWWV01fVhGfCmqM1BNQzNLtAt1mEq7YghDK5H0Co/uAmsFXemKPtaqebq4bZZTviPs1Ac/28w4+b/@vger.kernel.org, AJvYcCV7Fp1NRHAaX8OyNp5mniuE+4CZlTrEfVskLIiDlQiXR4YMHMz2K9JCnqYazFjQEp+HcWN5pI/8skdIZc6odQ==@vger.kernel.org, AJvYcCVny0cabCs2F1rCHxYswKDhitC91EGd6TcD2QwdPSBIHW3/M13Vyf91//Jkm8FO9fXQh5tjdOoy/GVk@vger.kernel.org
X-Gm-Message-State: AOJu0YytQ2GpSkul+GlpTn5aWR5dUvhe4nM/Wvg3v9jfW3aQk4fwMUPg
	jIKF+mB1k7CjIbiNInaQzVykR2/LGgYYJ0NdpHiSwYZaw/agZKqvsurwCZiKIWUpI64gAWcyXQB
	EsCqjn3EQLR+AkyeslGIziRV1IA==
X-Google-Smtp-Source: AGHT+IFM/qKVjzFn7aqBWOmJl2qCkEB6MuNPyjE6a2MO91pvcCYTDKPiFRPY78zEW0ZlN8N7caPygKoxAPPHxJ28JsM=
X-Received: by 2002:a05:600c:1e27:b0:42c:ae76:6cea with SMTP id
 5b1f17b1804b1-42e9610c8d0mr27192785e9.9.1727288296541; Wed, 25 Sep 2024
 11:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921163455.12577-1-alex.vinarskis@gmail.com> <20240921163455.12577-4-alex.vinarskis@gmail.com>
In-Reply-To: <20240921163455.12577-4-alex.vinarskis@gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 25 Sep 2024 20:18:04 +0200
Message-ID: <CAMcHhXrwsBHQ7FeR7AFKp3NGufVQQK0O=PHRq+GZBh9SpVNqQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Peter de Kraker <peterdekraker@umito.nl>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Sept 2024 at 18:35, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
>
> Working:
> * Touchpad
> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> * eDP, with brightness control
> * NVME
> * USB Type-C ports in USB2/USB3 (one orientation)
> * WiFi
> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> * Lid switch
> * Sleep/suspend, nothing visibly broken on resume
>
> Not working:
> * Speakers (WIP, pin guessing, x4 WSA8845)
> * Microphones (WIP, pin guessing)
> * Fingerprint Reader (WIP, USB MP with ptn3222)
> * USB as DP/USB3 (WIP, PS8830 based)
> * Camera
> * Battery Info
>
> Should be working, but cannot be tested due to lack of hw:
> * Higher res OLED, higher res IPS panels
> * Touchscreen

A follow up to the display discussion thread [1] - Peter de Kraker has
tested these changes on his OLED setup, a few findings:
* OLED panel works out of the box, with `edp-panel`  compatible. Turns
on, turns Off on suspend, turns On on resume. Will update description
when respinning to reflect this.
* As per Bjorn Andersson's correction, the touchscreen was tested and
confirmed to be working with 0x10 address. No other i2c devices are
detected on that bus. Will update description when respinning to
reflect this.
* SKU/HWIDs of OLED and non-touch IPS models are 1:1 the same
* For reference, non-touch IPS panel is 'LQ134N1' according to EDID

Regards,
Alex

[1] https://lore.kernel.org/all/CAF6AEGtrQzcMFsWCd-JzVFmF1sRk3vgy=L1q4Lzp+K1a4fuRnw@mail.gmail.com/

[...]


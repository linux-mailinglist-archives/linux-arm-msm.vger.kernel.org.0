Return-Path: <linux-arm-msm+bounces-42657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D89F6457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3EA61681B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB0719CD01;
	Wed, 18 Dec 2024 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9S3VUrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416ED1990C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520194; cv=none; b=kFBGnZ9uEFFNxWKebJGxnnsoVhJEdrnvVLmkYuyIAwLYiye9Dhy2rqsdNdSHrtUJKHWxkFFjkX5iQYbhRGfNqVUraMLC6JEA3zgi3ZSTu5bfWMy3bev67Unm/clwLkCn/EoQ1RdWxx6LJ3XlIpi+CRhbGa2jd4GHkWoOnCpSADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520194; c=relaxed/simple;
	bh=9kgCYAPxYpAMRx9QsazTQfcEmFpIR6tF9E+jVSWI+ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQI7pbuY7xnbhpspwr1GxhUihZAAoPEDWN28mTVaMfUYolfucK6eJazZV/XIvNWNcyDbf25rt+B/XkT+m1qrUMZ9ItrOmabJgmjT7CyY0xzuqd8p7UueK3Rt8doPV99GoORgg+G5EYUHAgF/Mle17IjprgahEZAMvRnGSK5C+pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9S3VUrD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso5957208a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520192; x=1735124992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cysivQMCAup5VX6VRdjk63p3UWGwFhZcVxFfx15JYQQ=;
        b=S9S3VUrD67QypJQ2cTI1sO/9pV28sPhP4fE3pzbkuA7sOjV3w8rFpd0zWwRsmGrQMI
         kzLLclyNw7iJn5JwxKBsXVRmxVuLWahgWimdOua4olAcc8b/eJUxaIzODVQhV8Q5vuZl
         t4UncVCm0QQcsjbwXG7G/Y30ya7U0AX2ZoCzUtkwaYmXRIfyQbjLM9Rq+U57poQvotqs
         2p1t4vmniyfjmCUGEg86sawWbZGN0i8x5ENzRYZyjnm1zTF1B7hcjG6w3cIPQw9cVVTd
         LvAvUD1nAHpGZQnz05SjuA4kK9QMnIB38tmfzoF+08KfKEIovdonDa6sH1fzBe04Z5cr
         j5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520192; x=1735124992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cysivQMCAup5VX6VRdjk63p3UWGwFhZcVxFfx15JYQQ=;
        b=se2sc6CbeEOGqPkh41SzX06BMcS+BYO23+NxvCvIS6CXKNcL7YCV1NYOzILAVh0dhc
         k5Hlg4i44DCjOzeoNmWe/UORUIN4F6kcppokafYfUiV4z6zp7BaTU4LPoMx0QAImE/st
         pCPkwIjuVwgFNhENyriAwmalokViNU72aMOKKN3bhyl414N59ZLBistjHUb6vMxUUIVx
         vHvLOBpBSQebvM4XwHZq23lT/DuyAk0eA73l8zJuJaftCMQIvdwKr75avJcbiyGpvlP6
         SCeFGGrsj8B7inrTJ8Xl7sbohca+za7dFx/qvGyrPWF/1JqKB9DXkTSftFasrv0lyang
         ZO/A==
X-Forwarded-Encrypted: i=1; AJvYcCUWvXYV8NplQpmtyRJl4NXF806XE7xy3iDiZD/iVE+w1EpRSH4olVvQ00WqvUnl4KP6lOcnFCI8S69e3rVz@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+19Bh70Vka25T9EYffN0WkLmMZTlMfc+R3qx6rVoattNFHqY
	tCrzGQ/gPeTHGV+GLiUaoNG+T+WRcTIWdB+VekgGhjuCjHat6UInSPVuVR8+6Dc+fAJPmYWwGz/
	MA2d7QRDFzC2ew7fJv7cCtj53XEGJc9+mWBDz4g==
X-Gm-Gg: ASbGncsFQj8PSzgNHCx1uREvpL+6jVvxg3t3v8AiTAfAuKMOwSmo7bzCWrFBN08Xdkn
	32yXCCR210DugVyyz+hRfduoJjPhhJJw86MVOqck=
X-Google-Smtp-Source: AGHT+IEz+SwthpfmpijWHlgsc9by0AenGHkniwWORMm8lFz8mYBsn+oM1BmwW233q1MPW5LUjOnDSoaOOI/dEW+oQtw=
X-Received: by 2002:a17:90b:2642:b0:2ee:b26c:10a0 with SMTP id
 98e67ed59e1d1-2f2e9339c2amr3609913a91.24.1734520192464; Wed, 18 Dec 2024
 03:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-2-quic_jinlmao@quicinc.com> <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
In-Reply-To: <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 11:09:41 +0000
Message-ID: <CAJ9a7VhR5AX9QD3fHiT_aU5yHShcZFaHLEDDcBJbu2xcRbWGVA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: Add label in the coresight components
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Dec 2024 at 09:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 02:33:23PM +0800, Mao Jinlong wrote:
> > Current name of coresight component's folder consists of prefix of
> > the device and the id in the device list. When run 'ls' command,
> > we can get the register address of the device. Take CTI for example,
> > if we want to set the config for modem CTI, but we can't know which
> > CTI is modem CTI from all current information.
> >
> > cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> > cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> >
> > Add label to show hardware context information of each coresight
> > device. There will be a sysfs node label in each device folder.
> >
> > cat /sys/bus/coresight/devices/cti_sys0/label
> >
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK


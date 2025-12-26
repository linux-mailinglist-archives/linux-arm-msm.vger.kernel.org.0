Return-Path: <linux-arm-msm+bounces-86654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DECDED91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 345DC3000937
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 17:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065EF1E885A;
	Fri, 26 Dec 2025 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqnkZrNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C07125D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766770749; cv=none; b=FACJvwS+IbP7GIt2HYjymx1IrKkUJ3BnT8gKHXWUq/SvpkqNhBaAAdS1qLncmp68dVPNnlHkyrN8tkx9JV5dZ5Hc/5oOyLYpyDaAUFJ+RYect4O3MLh7bS5V2hMMNfLHvHCAAOA439JSPYYLUg/OyOOHCrvxxJHIyM3/pfF8epQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766770749; c=relaxed/simple;
	bh=6YYD3NiqUlPmAWK3AUob9yBsMIUQ9l9NPJyzY09TdMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sddozpQ28qumlDbhjWFX2GCVKvygAT90kzSSkwbYZdPYl99vPgwSGPIJY/Uu8Ykl1g60x0Gn8SuhW8FZ9oel0iJ4KIPaYVpPOZBUKECPQ7s+e3Eczcce7jDmTix6mhYpWpo4NbVZP+Lu4hStFXOUoiozQN3NhJ22LwLUuZ3uGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqnkZrNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BDEC2BCB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766770749;
	bh=6YYD3NiqUlPmAWK3AUob9yBsMIUQ9l9NPJyzY09TdMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqnkZrNmLmHrfBVxCxN6OIroW+niaulJGCukAakLdpMQ+LeBvSHR54HOgGf1AJ73D
	 7QsqjieLgkpeeaC49eN2lFwYwmDjG9b9RpUHDNcKHpKzfK3da+hDjxOK8wLp4YA5c3
	 M++83WkLTv3BaQAclqaAyeurvfyOLw1gSpnNGDkEcExyBNkz+j2UWy/p3/UgQDV98M
	 sCtUH43yPamhc4MCYuRKcyUA5Uue0TaTAFOcneXce5fhUGHceEPCqDs91FDMXWkj0Y
	 142atF8N2wBsfBj133sNeu5Z3LEKQwfoBXXp42oDJA9SFTbruX1rJfzfdw+PejF7oI
	 XZqA2iOLRtKcA==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6446fcddf2fso6393184d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 09:39:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlHw+Tm6VhbUq4VLI19wf36zBmBTifD7o3A1NAs8Bmov5tH8gNUw3XdKatKf3eYVVYB66yKqa91QaoZJv4@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcL8v2rE8xeHYus9QK/4j3YzgMIEkfiSlinY+2iCkR+vFyRDq
	PrJx5aBtq9BeJ4w8a4ofZhzvvKnO30HiMGY2+5zrckICqeqxCsFOIcS3O4pLWpwFwoM4e6x/z/L
	/XlyJW178fdIfHh6YKoyWVsLmgGYLCRY=
X-Google-Smtp-Source: AGHT+IHDy1SKmnvKbma1fh9m1+utF49KXr4QUbHRtfTU7NPemr+5A9AZffJNUNAn7nR6cxtsV0Un4UOsG/jMcVJ2CTY=
X-Received: by 2002:a05:690e:1892:b0:646:5127:ad5d with SMTP id
 956f58d0204a3-6466a7af275mr19716876d50.0.1766770748432; Fri, 26 Dec 2025
 09:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com> <aU6QxjOphoq9E1pL@SoMainline.org>
In-Reply-To: <aU6QxjOphoq9E1pL@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 18:38:56 +0100
X-Gmail-Original-Message-ID: <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
X-Gm-Features: AQt7F2pJa8cOfkNvqcC-Brl9cfuKQJqQl4-oX9Rm5tlmkSxZYnCVZqaJuwCkEe4
Message-ID: <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 2:48=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
> On 2025-12-26 14:25:04, Linus Walleij wrote:

> > They are clearly using the S0FEF01-M display controller.
>
> So you're implying or certain that these panel names here are always bund=
led
> with exactly the same controller (making the SOFEF01 part "redundant" in =
the
> compatible)?

Yes that's what I suspect.

See my comment in the driver that all s6e* panels are suspected to be
some s0fef00/1 variant.

> Also, divergence of the driver commands got significant with the last two=
 panels
> / three phones, though that might be down to vendor configuration/calibra=
tion.

That's kind of normal. The defaults suffice for a while, then engineers
want to start poking at different voltages to the display to improve
and tweak things.

Yours,
Linus Walleij


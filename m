Return-Path: <linux-arm-msm+bounces-20622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247B8D00F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39F681C24AD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D7D160862;
	Mon, 27 May 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcqLreLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23FB15ECEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814927; cv=none; b=XQvrJ0VxgH3NUYUVcTkUWgFNawoWj9Fz9w0pY7yR3QAPeNpJDQomzBIg6rqJxFK6mauWh78v8dQY6tvH3jhk/+0nhqbViDVRpYu/Wf5Xo8EXbvciWln9Sd0pI7P5BZLvAXcmFuKgYqS1dnkMvtDW+xqXZBSg1V8LUyJq8bFcHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814927; c=relaxed/simple;
	bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwkJ4onCIXGsfGRo7/bP3isTneAt2cjMo7yQupAVSI5x0iBSyfCuq+RVnU9JYTz3Hw0FXopEHpkGWCRmPdXk416P+ZLAajTV1EZFl79wFB/RewiLl8+FHy5Pq7Rz+143wo5YpbgQQxFo7hAAJN4+I3WkMkQ36TurqrJykIvAt4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcqLreLS; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df7721eee79so2134397276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814924; x=1717419724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
        b=LcqLreLSmAOol1+iWp/9g0SzC/1PUcBnGPP3KY5R6MZnZsCy6DA4f9yTcjS7x3A/NI
         GtSBvZ+XvQZJeWqoz4IP+LWsClzO2UjuB496CdfIe+ezaDVmy2mr1T533k27TIudY3o4
         LQwiZs9Ib+Iku1u5f6p748brGTcjmsEEOt8pbJan41KfKE7djDER8ZP74cL9cSm1aUtn
         QSF1G6q4uQWRHPLpEJ/VZ1N/Pd9Oroi80VFaO2RI5FM5gQoLr8LfvqtuQt64uCrkvqe6
         GZKz5zbMTSpXWZO0bayrz8NDVDvYbKXfT3OotW6XiK2WkxzH5owMJHxHHH29PxxTnrXF
         +xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814924; x=1717419724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgk7WXRbuBVOxXeNcCecE0I5Ssrmoyonz0n5453vRtw=;
        b=UVCpWjbW4x6HyeudzsTkJqQyZ9hd1pAVehkk6EjB5LmqCN3fL36A3qP5jNErhxQFvT
         3Z7cRQLPzGfCbB8i/WPxHdWJ+OPbg/2byVZUBQFE6I0RRLuZKk95CxxHQh3T1wblGfbl
         IqX4D/xS1GdX6N7uI0cBpsJ0dO+/1B9VxFjkvOJAHL+cTCIhxXP7TSDnDramAjlRNRRa
         cKDhvq9d9cQttuRQYFysbMZogbEPbNvCdU9zU4gGESouB6hDk9thNQqMnzGX6qgIxJsv
         7KjSWROsCyseIOwnsmjA+zd4U9iCM76YstU9O+ZxmRAXf04vJ26Nm8DtqkeSebpjpqsC
         N8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWlq2E/gahgd391P473c6rfr/NaseOzvzJMtGr32t/mEat7xOX8aX5IuX6EiWDWSHYY7VLdv7sPLNqRscm5yYd2ViNoH7gpJRXKQgUY0Q==
X-Gm-Message-State: AOJu0YxlDz+hWmQW2ZgxUxFjhj2iI0oy/+Ml6EHRr0WsxCa2wUEpQgxT
	E0+H/FQQAJrGfKl3J6+BrUj/c/Boc0WozfGyHRU4MKO2CkqDhY+Kzr1ACxDE/xdcV0a22ARZKOl
	wn8tsC6PPN+e2B0Cj6X/GElABpIuItT1DXVksyA==
X-Google-Smtp-Source: AGHT+IE7lfH95P9CZ75FsUEqTbZ6lMKUg3CE06+7S2ZlNbsftLNAwXmGR02nDIY6dJYKm+SYL7/4iLQAHH1jddPM7CM=
X-Received: by 2002:a25:838d:0:b0:df4:dbdb:40b with SMTP id
 3f1490d57ef6-df77094a5fcmr7149710276.5.1716814923932; Mon, 27 May 2024
 06:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507144821.12275-1-johan+linaro@kernel.org> <20240507144821.12275-4-johan+linaro@kernel.org>
In-Reply-To: <20240507144821.12275-4-johan+linaro@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:01:53 +0200
Message-ID: <CACRpkdZjG4FrKsWARpMO_Gx0Eo21EQyofPx9KUdut2ENxdwROQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: HID: i2c-hid: elan: add
 'no-reset-on-power-off' property
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 4:48=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:

> When the power supply is shared with other peripherals the reset line
> can be wired in such a way that it can remain deasserted regardless of
> whether the supply is on or not.
>
> This is important as it can be used to avoid holding the controller in
> reset for extended periods of time when it remains powered, something
> which can lead to increased power consumption. Leaving reset deasserted
> also avoids leaking current through the reset circuitry pull-up
> resistors.
>
> Add a new 'no-reset-on-power-off' devicetree property which can be used
> by the OS to determine when reset needs to be asserted on power down.
>
> Note that this property can also be used when the supply cannot be
> turned off by the OS at all.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


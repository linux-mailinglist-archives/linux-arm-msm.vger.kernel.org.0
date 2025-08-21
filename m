Return-Path: <linux-arm-msm+bounces-70173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDFB2FAF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D77585041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB240338F51;
	Thu, 21 Aug 2025 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBkuTnPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D08338F44
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783296; cv=none; b=K2Hxqr/dPkbFg9GOmXZPZQ8lKm45MyUPBxrDNCkGzd1WIjejHPPaenkr1BrJvRy0Fb407IWMuUi8fQ1TP3rvnWj5JmIFEFeQAdylmXrGvmJqOLnsiigotj6DJ8uycK/3D0HivvlPeRTATY0Y/2sPlsxY8e/yCuBCPzrAQ/eqxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783296; c=relaxed/simple;
	bh=kv6n6GOVWTADV8kGP5+6GEG5ThL+6nnGm9DljXi3Qxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chG+qxJof20N/Hql0YxP2nNkEfmj0Mz5yzaLQTiMCv3faH7LlcEwBFnClzv8JRAPEF7DeZsqHQTZ2haJmZBOVBK77IWg7wzys6evQDNf7T0Y5a6vdhC/5B9ZnFDSKvsXrIayijKwpJD17CrX/g3d5efNxEg47RupoxZv9PFK5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBkuTnPA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f918d71eso6914281fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783293; x=1756388093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnk1CgahWWI41MJxVYInV4yTmBrTqgMN7PmBauKY3jg=;
        b=QBkuTnPANj3BZINlJazP7frVb5LANa77kiv1wlh6sdJ1Rocs65TYZFopzIXJ7Gpo4E
         bt6XHcKCfPzrwWd26qjSGCGOD0OjzXiZTJ0uj5i1lBkPsIxheHzsRJnDnkKWTasUnh98
         w+xweOAbIQHvTKl0Y6B2wJsyMZ7sqxz6Ec85xNOUBKF60rZ2gc3Wc4/5Y/+p8uZtQJUc
         mv1JfcJ0DfZ122AHny8DVZSch22ZlQUos0ZzKopjrYJNr9+PM0BWvZgEet6VbEOQD8sM
         ELG1MnACc3LwbBnbAAYJv8VRmXmQ1e9pB8tUINj6oYmnnxhzxpG9Lr0zW4A9M93/d+y2
         QLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783293; x=1756388093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnk1CgahWWI41MJxVYInV4yTmBrTqgMN7PmBauKY3jg=;
        b=Bz2mF1sUtkrGdbGJf7lGKoVPIHj2RkL5bNGeuT4G3PMSL95vp5Bq3y9yRtX501GIBr
         F3XquUJGXbdGLYd38JEb3LFSMIWfk9fbXgPtIAG35hCP64pnc7/Qv9OKMXVrN8lf4eeF
         2DD/r6LBR9rDGN9lJtkvzrAeMTt0qcAk9kNlDN+hZ94n7ovylLLyCTV6C68LjDjnnVLV
         EwhdTxJjMcH3QBDAitvO5YX5H4nY8lrhLI7lWw9kxAo5txfaYcOTf4vl0CufanMPXQ6o
         g7lgXwDOdlC/l6ATsH3GS7vbZ73XcsTDT3goEYLJxmjtMB/KmnQZKGobiuSIapTCsvIs
         EA3g==
X-Forwarded-Encrypted: i=1; AJvYcCWaq7vJi5XPhqqV9H9LYlY0bEoZ8wZOWWOI28D3NZ5yHnqExEoKeYT+RkRtjkxJHdtZ4ONmh3g/wlM5eX5t@vger.kernel.org
X-Gm-Message-State: AOJu0YwQj2SW5BRvXX/flrv7C9M7LuRU/AVqDFAyIOLsvw7TgqLAUGae
	MdipKwIiklnbkSOhfGvKiaYZsPcpgwWHmgasUBHlCBO7U8r8M4i3jcFbOw4SZ1cTp5mdoDKF99Y
	YPtavBISWZiTX578WjpTA5n1lPUBO6O3uF9XxNx1bHQ==
X-Gm-Gg: ASbGncuYs9hj8f/K8yIxG0HC0X/bIJYWv/YNlGGgQenmkGujdFK/cMyxH0UVkPXkG43
	c2BeGHkf/jKWmc+E9KDBlmrKl6XsafLhfvVngiLRWoEKDzD8X/4CFt18ksb/MvX+LsPGt9u2H7R
	rE+lyKoPUmv4e7cphugsMZdcNPwW6TIxmCyk7MwFdV6GUctNpWnIi+SNmI4/FSmM1tmdP0YxUM/
	02eH4U=
X-Google-Smtp-Source: AGHT+IGKufYc8VS+JVO/RTN7GptvxunMWcIXqzHM88cXAswfPy/+XrvyTDd4OoGPmr6RyZIf76Xo3OAHmqvX/1JjcQo=
X-Received: by 2002:a05:651c:2112:b0:32e:aaa0:b06a with SMTP id
 38308e7fff4ca-33549e41fd1mr7866791fa.8.1755783292895; Thu, 21 Aug 2025
 06:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 15:34:41 +0200
X-Gm-Features: Ac12FXzZfdEuIXlDJunjHifIf2iPhc7L3Fxydb1EWGcglhWvXkLWa6PHYXSvLu0
Message-ID: <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 6:49=E2=80=AFAM Prasad Kumpatla
<quic_pkumpatl@quicinc.com> wrote:

> Mohammad Rafi Shaik (9):
>   dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
>     clock property

Can I just apply this one patch to the pinctrl tree?

Yours,
Linus Walleij


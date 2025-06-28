Return-Path: <linux-arm-msm+bounces-62921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC60AEC8D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 18:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03613BF224
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E0324678D;
	Sat, 28 Jun 2025 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXrLLTSi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817481E2823
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128977; cv=none; b=Xr5+zjq8ZtcX+73YnoHZOEionbGu5uSS/0e/G0CI+lV/1QrZXYCiZlWF8L+xMQ15kYGbdBdb+X3ZSigs8WnqSFhcdrfgaHjTGfnML9B4HwSTUgA9Kiq2WVWLnYmQoEJ84x+/kfgMbRIGmPoDW6pa5I952xVAP2XOX2GC7UHaHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128977; c=relaxed/simple;
	bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RL1arV5FEpgjnBSv0Ko9wbkuIlWnq4+rdDsjB+qhFYLqpZBp1W8/PwOJPffCyf+Kz8gXIjAMbMHKManS0rRZam6if0hRkjpJK4peIVx4FWzTdEgQQo7d+HEbI+0fviDil5HXgAY/cEeF+duByI5kD7TpIiNR003VlaY/8zSi/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXrLLTSi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a582e09144so523169f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751128974; x=1751733774; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
        b=IXrLLTSiDQ7PCOgZvs8/ngQy/O5SAjTF7srjEcwqjngnGHZ/VFA/rcJUEFl01dg8WG
         pqnO1WWYC0myEY2V1941MXEUzrbhvkPY7MR0bDHPvHdhlXJZmKjGhpszcD3Q53x9efaX
         wdHXQhteGQxWLZ4w14kSeLioSuap68yRB50Wk35qdWT0Ol/qYRqtPvp7LeoiePNdrQvr
         tZQSy57SqsFscCDtKvJoT7R7b1OkGVjYDM2Z0GZvVHFDCK9OsyS+UlsIa10WcNI1yhTb
         t9T+r7k7gpyLJWZxDWH0GiZgljfyaXdWvYbPkKKWp7j0yyE/S7RgqKSNmT9ZxPvgCJOu
         XGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128974; x=1751733774;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8+0Um3IyKyjV1O1yQIgBid/7yX2tEmqks0sJwHrXkHU=;
        b=RMR8wL7W4XJrKO/OxbbLLiJ3Xf30RoXxJrZXDaaJI+piBZAINCMrfuOiiQTy7FW1Ba
         f+YWeuLwlPn5yH66lW9GSd7UBN0uQabzlp0qnlLICMmojLXSNN5rwxVJQCLa84DrGNYc
         eBtwpLvN7exwHXnULsESAdMjMCftAcW5hsNF/jn0/FtcZvBRgvNF6YEGkUmH3AqZX3eo
         Rqg21V0g8PnAnENe4hqnvXLmpaOQ2+smef2Lc74LwCVSuJEI7YXL6CHesfKJrN6b8hA7
         FBHpmGb2UbJczSegGI0UMzCq6GRPT/eFSKw7fsaCegMyFv4DfmTvc/BqrGWzOHvFMv08
         FSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVXkwXQa9RKbfznjdZc33LHoBPnhy1nb7OuOYSmrxYATS45+hEZk91EGf2Z+iIlLhcuXlORumpbgSWRHTfj@vger.kernel.org
X-Gm-Message-State: AOJu0YySwNTAVmYxOexynPRhvokoWLmTS31QSgOx4ZdXX8nT6vyhok98
	bYk6c60m5wdY2sJL57opXj+JhRcmWQw5JZVryDZfvdwxeptewjXcSl5rVi9G4i8Opp8=
X-Gm-Gg: ASbGncspoz9cgeT3FfJZzq+SOjU9suFW6q0Tgh8T629z+0fACjtGnctTVQufpC55vE5
	PsuyOAP/TG0WeOko8sNcNRow1iW1OWYPdi4TZ9kwSuj5MxbPDvcq/9hqjT2pJeeI3qbX618J7pC
	M0merTC6eqWOxzHG1/gp9ff5s3hNKl8rZFsT740BKkiEasVmJauis2LhlCr3Xl4q8nXjr8CGjE/
	Xp2QRIsOIMxACTmLDw6FjIpRHC94YRclYeX53ajbAj0JumJENMbA+CcnGiiKyy3vZV3Iws+N7Bp
	9u89FFyq1K25VJtibRmtyLslMLtjVB/7BVw8Jug4Ou0wbDkwuUGbnPVyqdfPe714f//H
X-Google-Smtp-Source: AGHT+IGFXbwNYTSyjPQd7nh+H6Es9NPSjiD5mA2m1ub+Q2Abl5oNI0WlfEOljgb4IM3zbq46WDBVfw==
X-Received: by 2002:a05:6000:4404:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a8fdb2a034mr4733769f8f.16.1751128973831;
        Sat, 28 Jun 2025 09:42:53 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:e33b:a0ed:df4b:222c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c99sm5609102f8f.49.2025.06.28.09.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 09:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 17:42:52 +0100
Message-Id: <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio
 codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-2-e52933c429a0@linaro.org>
 <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>
In-Reply-To: <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>

On Thu Jun 26, 2025 at 9:48 AM BST, Krzysztof Kozlowski wrote:
> On 26/06/2025 01:50, Alexey Klimov wrote:
>> PM4125 has audio codec hardware block. Add pattern for respecive node
>> so the devicetree for those blocks can be validated properly.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> Remember to ALWAYS explain the dependencies between patches (merging
> strategy), because this now creates impression is independent patch. It
> is not and should be squashed into previous.

What's the proper way to describe such dependency?

Best regards,
Alexey


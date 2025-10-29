Return-Path: <linux-arm-msm+bounces-79463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A177C1AEC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A38B2586A2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E102C0261;
	Wed, 29 Oct 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hlOtlWVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85412C026A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743644; cv=none; b=ZouUm8omLduRA0dMWXkdicj3xN4/un14Z/8XzhH1aXCp7gRh6gOUf6tDPpaH1lswmggpY4IGqeIyll6GTOG5EKuML+SE+6HWjdmo+bsbjeVqySCqCMBZIvU8jaULaExPPasXN9vKEL29Vg0QRRacAVLpzsheTw06J7Em+JajYWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743644; c=relaxed/simple;
	bh=HXh8XVhftIlOuBLfg8NVk9leceRLV9HU/K4pAv4S7GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Ganit2uDJWE15UrD5lZ/lcM0knViPqzDY1INBCqwlDfLRhI035I2OOXune7WR9N9yyLu89lvboN0Tvn30LOKkG9+HUjPOQxmLxvc2E7m5uqYrej7Qo9krPpXpSqA/3ftuccoO+wzVNn2pqTmCoLZegzg370QpHSyoiQPq/PEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hlOtlWVn; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36295d53a10so61427211fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761743641; x=1762348441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqA6GSygQlCbGGE92uS1aB1PWjkaAYd841Sg4SieyII=;
        b=hlOtlWVnpwS3XHlygstKeC9HQVK9qNA2JkqB1DjoDbBqjJI28RY8aBgzwcu5zobn6v
         sjQKZ51sZzwj9Yo3JpjAfR/gZAs04ZPoLxvUkc0MZf4YpTU9O0erq77GdSZybw37WnP7
         IfJ5EgphNSGdC4Kr55/1gLYQkQ2fb+iRbNM4z7fVFcxL5D0bt72gcgGRbSX1tc4Pz0He
         f4lSbcZRI3eg6XPKLdtuJiQ+PJAuk5eTwYBfPhc8LP4zZtl2al59/lFALKr+pI86Jqow
         isqLqslnToa664tkOsZ4Texuq9tE6N7j0k/gFF8LE/O0HEo88CCre1sa+lOpNVE/vQ9A
         rZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743641; x=1762348441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqA6GSygQlCbGGE92uS1aB1PWjkaAYd841Sg4SieyII=;
        b=L27LUbZQ4iZSQH0Fm34UE2qIh8GPqxAfGNWarou/UaP2i+7UqtQf6u3+wtxjKMfvdo
         p3ZrKwaLxo/qsu2Cz+OvLuHlSnnC8WwbRQ5ujaFkPsRxeYhfV7iQ5zZuXlXOwoMeafaD
         QpELd9MoNT83wC1LIYglGurzwYFPkQS/iqUS+2C0oQFLvTxR4QGxFFMDLsR4PziCvyR0
         rBxZ0RoNAEz0bs1rd9DNwImsOt+ElZtWa9sSiS5N9JfLbMefruLAiI0x0SuP6Nrs5OvE
         TgXnx+V0aO3cMrqkWI3+le/Ao268R/cFZPCNMUNg43aY2rLxRR8vYXhc4TGHZGdqKVTw
         3TZA==
X-Forwarded-Encrypted: i=1; AJvYcCVZABS/UKhfYsbA2bqpH3X48HONgPYzzs0gNkIyJej7cThp8eX2rR1hJSYxR+82KvdzpCseetP1bGF9JCm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyl37p03KNEvfIFrSo5oUDB/023jvRHjhgaHUGnNNKY6pwFSoa
	AAu7/l94c97H59QV/W7R/H2qIDAFmtf9RS/KkYizjQaqcwZ/PaxkYNrgYCzh7oztpRz1vQUd4dK
	lK6WTz4ZJzLS2P7nV1hjq+8iJpaUsZIIIEKMkB77Lww==
X-Gm-Gg: ASbGncscM8KYDVNDkOjQYQidwMBtscvbICnqm+yZLa0wfiOzATauwhWUu3Zfttz5yep
	MtpKlWPX8fyE6EqDOCA6z+h1pgqwQYglPpauY2/1cyXNhoaWPfKHrsBCq7y+EX4MKvDNLPtTxRF
	T3uGuxJ9QPlYu1W58EqbQi/WfypeA2ruKYsm5jAzgpsAr7HFxiE5826R/U0U1pDnHdlf0v2kFYm
	Lu6xxYE4Vgj8toAKExR64FCgve2/2rE63+NLCBaobEksXHa0iX1k+ED/r2ZwVHTcWc18vBypvz7
	oKhk/6Yp0oyDux7o6LOq/T7LV/w=
X-Google-Smtp-Source: AGHT+IEDeO7pOWXIiKISaidNbH4GhhTTnet358H+WU8HbsJA+qhtiRiRxFILoq29B6HEL7w4GKQI73DKFNYwKm/mQwI=
X-Received: by 2002:a05:651c:1107:10b0:36f:4c94:b583 with SMTP id
 38308e7fff4ca-37a052cfe5emr7976601fa.16.1761743640602; Wed, 29 Oct 2025
 06:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 14:13:47 +0100
X-Gm-Features: AWmQ_bm2G7-iNhdxoXC19qDeGT6XRmVTZTDbAiHUQ68hSenSjedNVmrrWyCNe44
Message-ID: <CAMRc=MeGLUvyM5GGv=eFpKd8_KCcSOnfKXCtZqJwpTGuRTixxA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Bluetooth: dt-bindings: qualcomm: Split binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v2:
> - Drop in few commits the properties (supplies) from
>   qualcomm-bluetooth.yaml which are not used by devices left there,
>   instead of removing them in final patch (qcom,wcn7850-bt).
> - Fix dt_binding_check error - missing gpio.h header in the example.
> - Drop maintainers update - split into separate patch.
> - Add also Bartosz as maintainer of two bindings because he was working
>   with these in the past.
> - Link to v1: https://patch.msgid.link/20251028-dt-bindings-qcom-bluetoot=
h-v1-0-524a978e3cda@linaro.org
>
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qca6390-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
>
> What's more it messes up old (pre-PMU) and new (post-PMU) description in
> one place adding to the total mess.
>
> Best regards,
> Krzysztof
>

Thanks for doing this. I would argue that the deprecation of the
legacy supplies could happen before the split but that's not really
important and would probably be harder to read.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


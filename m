Return-Path: <linux-arm-msm+bounces-106873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON3MDhilAWpKhAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:44:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29C50B323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806493025C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403853BE17D;
	Mon, 11 May 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddzs1Sb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE83BD63D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491712; cv=none; b=LSsFtgRXxWaRvMztxNZX7Cg0ejypbY+1pRSvmayBXs1E4knTISq7eEcZzwCtvJpaBHO80YX90M9xiI0bz8aECDhsYzBolQ+qv5rAIrycdt90DCI4HAxMocfhqOw4U5DGTIQyJQk6ktoOBIUcix1sq70UUuvEcovdBJI/hwOXqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491712; c=relaxed/simple;
	bh=cfOlR5qjLH6F0mgDNpFieNzkfYgGlRYjxfxkEfFlJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G60dCGuR28QFnx0YA/bMvcbXAUXQPnhKSV0WfpzJBd3t584m9Fq3aVV+m1VBK1HJ8ETjQqK2RiQGIPyM1tUimO5o8cG6Af4T5IEnUJNojLR2fRSFI0NhfYmHRJTLsOzODxm5/teoiT7IXj6tYFuBWafpglGhpgv3z0U5s+OQ4uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddzs1Sb0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C893DC2BCFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778491711;
	bh=cfOlR5qjLH6F0mgDNpFieNzkfYgGlRYjxfxkEfFlJtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ddzs1Sb086my6dIKZgqiN/EeFZmQdx9QlBz4tkAhzs9PZXmbaHLiF7sWqczuM5tsQ
	 +Jc3sMKvi1qSkYHDCF6vqLNtpJbXJZm2B8kxVlFGD+giXkH9tNJXm1LS22OmJ28DZ1
	 8Ectj6WSv7i+IHManOlkReOjRZn0q/6AKs9b86FDZ2L+i9Yq0HycktBw+kf2Lm0PPD
	 mkqrTG5cXeF017qzQdsW1B48ZmCRatV6SJUnTyQ4rZ5MUKPBlOx8252TdgtZZ/GTzz
	 4uCk600DmzEIu3w6ZlhDDNpUaxPCvv9PTms+7p/ftctTZbLnADDwNy8zRWYFNJzqjq
	 40xes1uR0PMqw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso3690826e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8o8XexbezaQb7kJBOTPrvkueKhIIBxIgeM0mP/QG5BNoWcgUtd04S8xD0Kk+cv5sV3MN8Y005Dlsf4c+pl@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYf2JGKqkL89IHxKGPEa4f9MBNAFUY2FokzCRGmxkDyTJaEPR
	X07RM5YtVMkj8CEiTCAyPzmPxvvq0nYw9kJ56g1hPO1mHFq3H4fwoY8HmDZZtj4jLXW6eyW1skS
	cVuAuhGh+H2HR2RQX6UnLcKdPFAMS91E=
X-Received: by 2002:a05:6512:3c87:b0:5a8:6f4a:6a62 with SMTP id
 2adb3069b0e04-5a8b729150emr1970564e87.41.1778491710434; Mon, 11 May 2026
 02:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com> <20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:28:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
X-Gm-Features: AVHnY4IhqEH9lgst_x7YrGT_DKgqpsvJ-gMtJBV52g5yHUpPfofeDWqPW--0Ep4
Message-ID: <CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: qcom,pm8018-adc: add label
 property for ADC channels
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AA29C50B323
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106873-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 9:04=E2=80=AFAM Antony Kurniawan Soemardi
<linux@smankusors.com> wrote:

> Add a new optional label property for ADC channels to help users
> identify each channel when reading values from the sysfs interface.
>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Makes sense to me, nice with some roadsigns in this djungle.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij


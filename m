Return-Path: <linux-arm-msm+bounces-104904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JrZMwJs8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:12:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD747FB2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AB7531194F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3B633F594;
	Tue, 28 Apr 2026 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAg/hU5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD14133ADA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363454; cv=none; b=dLcNwnk75hC+gcaKE79g+SLKsiNRjWUd7JxzT7wTs5RznQXfX96pAqo2a/lf8Gbm0bR9QCJvAr7HYJdEOwHVJ+uye1m8w+o3/v4OKkeWlSVYzwOaT81AGSZBMmVcI9R9oukJ8TE1Lrw57VrBWkR8lCTfFXLRsOXJ75TAx6JTTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363454; c=relaxed/simple;
	bh=OYGgXT+vnZc4JBe0yph53GNPgP8L7MHQXOQ7rAwaRV0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN3sQAoq3H3MR8jO6JEfr+lYdUt9lq/eN0fJWa+63E3J3VQZsczyOM+jwkqFi8K5q8BOWwJV1sRrq9jEz+wOM0EpaYleob93s7UvZNxOxK6dQsdu0ZUD2tepJI9hvBe1YeBnK2cjrxOI2qgT9GxU7ygxE8/j/UOzS63cAi58GI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAg/hU5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2618C2BD01
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363454;
	bh=OYGgXT+vnZc4JBe0yph53GNPgP8L7MHQXOQ7rAwaRV0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CAg/hU5JJM2Spf/H8XS8WdFTmzGVaTQu3R8OEt7u+d9CpPF9Tj8WCTdUBU0Jqtp+3
	 T4NxUj10k+KwVkMt9oa98iPyUqTShHTnE/LETOAR5wjh/M3Lj9j9SQ38W5OSwLp01j
	 9N6+EnO9Wz7lMpiiVNSYuBQKxClmr+B+JtIOw4J7jBQ/4VyIgl/KJKA2yqsHClEEvX
	 nIXoYUOCV2S/ds7pklpqgnXryjo/leR3YoPHFR2+/kR+qgvhNL7m576ked88ng3snO
	 76fDHnw0IDU1Qsmj8C1lMmw4quJPOO4TQMru1aluuHXCiYJ1BqwL/7Y7j6uHRuaVgV
	 XYWN0dNcvfA0Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e9653b580so123346941fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tm1pT/5oarvEjKbBJehqSQoXxEewT02m0Qju+UxP09JvXlw6IFzdwmtpYtiottZb5IBUpcNy6FKXysUBR@vger.kernel.org
X-Gm-Message-State: AOJu0YymNp8EvrMGkpClinO+IT1AZsdjiLY9IzinMyzAJbYGXj9H4X94
	9TXGmPhxA4c1xY9H/BBaFN7KwsEI/J7O/4VATBy4t7pGCRB9P4ouzgiLYX8QlN9NtwWgLuxd5sd
	4+SZFUOUb3y9xklmlQk+fecZ+2aa0l9mAuFT4PLw9yA==
X-Received: by 2002:a05:651c:210e:b0:38e:af87:8e0b with SMTP id
 38308e7fff4ca-39240f8104bmr6202431fa.18.1777363453160; Tue, 28 Apr 2026
 01:04:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MezXrF=M-_sY7uPvLUcn6QG+2H0A5ynQnTKGVW5i3EJug@mail.gmail.com>
X-Gm-Features: AVHnY4L8wKLqhi2w7KQIry4FUuHfj7PF_dv_cFjyoZKwyldMdXdmEga3BQlyXGQ
Message-ID: <CAMRc=MezXrF=M-_sY7uPvLUcn6QG+2H0A5ynQnTKGVW5i3EJug@mail.gmail.com>
Subject: Re: [PATCH v21 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4EDD747FB2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104904-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 19:34:52 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
>
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>
> Support for these modes is firmware dependent.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


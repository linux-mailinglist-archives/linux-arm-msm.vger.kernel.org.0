Return-Path: <linux-arm-msm+bounces-104901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKAyAV9s8GmgTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:14:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5647FBBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A268300CC37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01291334C0D;
	Tue, 28 Apr 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCiU8DcV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4A31F983
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363391; cv=none; b=c1uT6uv6z0COHM0jXx9FHFcB8xvojE3Mgu4wZJ9a5WzbCnhGe05RepvqU1RlFozpWobhrTqFvujoqpndbkl5McRF8DbXpKpDBzl/4peL6w3Q9M/54TlPhhwByhzZcKktYO9N+J09FlTDXngtwEnfaAv0Uofkh0il0i021BtC36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363391; c=relaxed/simple;
	bh=gakvkReg0fVWUJryauTzFRkfayEeCg9clm8BNqJgejI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxFaOnKkrl3ZgYZp1e7ctbEZpNiZxdNXQkR3z9Mb1Wcq4l5V5RE2OIw6ehwz5QqCUliGOvigNefJQhoN2ZUehD4eBuOojKow5hgcAAjHC1OwU0RX+SGBXxitTMXasgZzsTSWsCixbxp7KKUC/sF1A2vSDLGeRkQUrrvadcSZT7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCiU8DcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E54DC2BCF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363391;
	bh=gakvkReg0fVWUJryauTzFRkfayEeCg9clm8BNqJgejI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=gCiU8DcVwQEowwEAwYG3MsLXklegyS09HYA2QCs3e6rYJLLSuDu4SxCyVK/2W3YTQ
	 c4OVu/MwPcLnaGuDdakQNX9jF3K7FgFpCtLxeCgZnYxexquRWElzbN8IiTVf7h3/sH
	 TjWwKhJ/vwNqnh6wMoUt0GXPslR3z+122nus16tJ8Oq2oSQUCzPvY6MNSq66TFLH6w
	 BLy/DF4wCtHjzGSaqjiuGe9opjrUvHVnP2yqkgtQTkjWx8vCcSVtfqr6BHlCNqgF1X
	 Jruz9Ja+u7JLPvVfJwGOu45gIIwSAx7oq8uVWzzStz7fIu2YHagpL4xuwlYEGrDnKV
	 T06kp866Vry+Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38be5e86918so122472121fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0mjZnHRUIjExMAv3K92UrjRkYKuem95goZgYywiElt+slI8wHAY77V1nAcdALVPXz1kV2KMWVTSrey6Fx@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgUXwVucI6L2gPAImD8YX40VK0O/G29Y4Xaz3LeYs7ts9WGG6
	NKppGVP9btVccvgn5zYgs5fu47sUTXhMgk63xovsr+/5ECavjOKHiQLvsSDJrX4pnEZuoAEacjF
	UwzypBCw/zY5ZxC7fwdhKdTLbAoyNzBlHPQF5a9KBdQ==
X-Received: by 2002:a05:651c:b13:b0:38a:8199:1b60 with SMTP id
 38308e7fff4ca-39240e2f97fmr6452871fa.6.1777363389951; Tue, 28 Apr 2026
 01:03:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:03:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
X-Gm-Features: AVHnY4KzpDYlkP_BmYQb8Tu_NftXGx0jC5UQCJ6_82FV8dMIjk5ibCMQsX_dXwo
Message-ID: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
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
X-Rspamd-Queue-Id: 4BA5647FBBC
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
	TAGGED_FROM(0.00)[bounces-104901-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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

On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> MFD core has no way to register a child device using an explicit firmware
> node. This prevents drivers from registering child nodes when those nodes
> do not define a compatible string. One such example is the PSCI
> "reboot-mode" node, which omits a compatible string as it describes
> boot-states provided by the underlying firmware.
>
> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
> child device during registration when no firmware node is already assigned.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

In the following patch you use this and violate the supposed constness of
MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
indicate to MFD core that - in case no fwnode was assigned from other sources:
DT or software node - it should reuse the parent MFD device's node.

How about that?

Bart


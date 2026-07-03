Return-Path: <linux-arm-msm+bounces-116234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KZl+GGJ4R2oUYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:52:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1E7004C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:52:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZNI4cDAR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116234-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116234-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5270A301A717
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A217F3019AA;
	Fri,  3 Jul 2026 08:34:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB233689A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:34:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067641; cv=none; b=ofC/27qOajbTQ4cXkM9iqUEbcpzVkHGlyAHo3+haMp3L3u3Y47J+4u6M20xctaYfBPpAxbbLaoAfwQCepicwBv9bUZHWJ2VR5ImbQwCT7SPXIyGYZH8Rr6cp36yZa6k2dyMWZVisnfUkEjy0RoOWkO9vul9vm/lVUg8WY48apK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067641; c=relaxed/simple;
	bh=heeEk6kNSz7DzysTsEXaatXI6Em4Av7gIo4guvkev4U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhLICU8F9keXsThSQP5LDXUQMCd75FiKX4FhzzPUPbXK/aFwhj8mgjiHhXD3R2thh70KAVuP+9zQ2HLc7EhZ9AyqEK1Tje88iWGB4+MMKCiw4hPs0cM75YAi/6O7+e4v3bptOaxYAcWCIvgra8SEGR0vw+sZzRIFPROuBAsDnNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNI4cDAR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743331F00ACA
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783067640;
	bh=heeEk6kNSz7DzysTsEXaatXI6Em4Av7gIo4guvkev4U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZNI4cDARmPKCAFSxaqmVeYbF1p+9XBDeOMLYf7TkvYjOExUn8xowCPtgD4eFPh+kt
	 23NTOVV54lUwRiu0wWB7p41kMvJoQ/lWD16fvnWqq/nB7SesLbJz5jQR1CIItQZeO7
	 KukYx+xYXGKjw2C6B5yw2B/1pLXBLqy71GGEffRXErw6Yx7MwpAX/49kQZj/vGUxUL
	 V1kk0bz7p20Un5HlHLa6q6gvsCTraBrkYXiWyWdI4O91YgoCHDWz3BG9i48d9Jm9xL
	 ee4ApOECi/knTK/Vs5MtfGiYx2eOicFp73N/CTuhDzVFGJxRfB/lUtaoLpG6Ssmpmg
	 Q/rd4Itzme0Sg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aec139da7eso344763e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:34:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCEf5yZzXEUvddcGqMjE4AVdaAhNGbjUV91DpImeT2oVVn91pnhmM7rn9jNvaUjMEqimHwXKItu8SxF9il@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFMGwNp1FzV5mvaoDTwZcgOruXpmPMEcb7lJKYK1hThQo0QvT
	IZOl+rS7Mc8Lg70Biqhe2YlP1MhtStrh+THSqioO5zPVhFhuMsKJirqXezQVcZr7v+viWSRm/G8
	0zIw+t39ruvhInVwS7J+ijhGeWdSclGim9bk747ED4A==
X-Received: by 2002:ac2:5bde:0:b0:5ae:badc:47d3 with SMTP id
 2adb3069b0e04-5aecf512627mr466540e87.28.1783067639185; Fri, 03 Jul 2026
 01:33:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:33:57 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:33:57 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com> <20260703-ipq5018-bluetooth-v3-5-62da72818ab3@outlook.com>
Date: Fri, 3 Jul 2026 03:33:57 -0500
X-Gmail-Original-Message-ID: <CAMRc=McfS2Kk=+-oC17YdBP1j8Hyi9VAMV=KivrP9aijgie2Vw@mail.gmail.com>
X-Gm-Features: AVVi8CfE_G3EXsiF4ujXPs5b52ftHHbsubqnhWEG3C4K2k50vOw-6hQv3NStrxg
Message-ID: <CAMRc=McfS2Kk=+-oC17YdBP1j8Hyi9VAMV=KivrP9aijgie2Vw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116234-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCD1E7004C3

On Fri, 3 Jul 2026 07:01:53 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add nodes for the reserved memory carveout and Bluetooth.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


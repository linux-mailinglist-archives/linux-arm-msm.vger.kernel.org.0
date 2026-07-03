Return-Path: <linux-arm-msm+bounces-116232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olfmCqV3R2rHYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F2670044A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RyVnfZL6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116232-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116232-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B04EF30095F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3A933CEB0;
	Fri,  3 Jul 2026 08:33:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D13264EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067581; cv=none; b=eUGzLh0AXrFcGYOn8OBPzD/qhJxI3z2dKa3bBU6x0/1UoZuBi8pk7/JgzZWWL7C1EBULgGKFPh27b8rTL757APf2V7yGrCy9+FdkC6TFlM9r0/ZGt6F3LAk64RNS7m96yZPHuYzlpZNKhFffoooXUetzamvDqBI2d46hLVJcjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067581; c=relaxed/simple;
	bh=BX2+Mfh4UHlpcFxgAxx5LFl1BquzeclLU3ZjHmLK7cQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jpi6G9QLReNNldnWmiAKrSUwUwIY8Uvza0QJosoltYquH4vk8s//09HUqIz9LfngGPqebRQyb2GCTgYSLBLMew1HMAJMX1bA9KPfuT9mtLLUCFksqEwRR894oHkhZ/j8+9iU41DPfDasqv+99r+CYp1d91YKrG04eu1kIkCS0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyVnfZL6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E73F1F00A3D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783067580;
	bh=BX2+Mfh4UHlpcFxgAxx5LFl1BquzeclLU3ZjHmLK7cQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RyVnfZL6/I/JwEeZTBBf+amQs92HXTWCwruQyfoiRixCTuQP8O0uHNvtsMG24gShb
	 D6QNd/pzXl1XkL0NUp/hEh8v8sNGNPpAr/lFR6PUQ0pxZPN6lTtBS7KGjF6zFGDAKX
	 P+X7sn99th37A96aHfwG6CmhMX5TU5cbkUXW4kQ2Re/6g85RL9E/+md/3y06OPNHQc
	 29J2h9mzGl8PIbDM/+28vY70iwTrwOnh7MWLHX8Rp6mnrKokyXxXF41T171ULtoJ/d
	 gT84+fNlbP7iNFVuP/GB8aBnH7Crqz5bM8kh48WKhllKQopsPfV2r4yszMzkRGBOox
	 pu2T9H46m5GZg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39af64026dcso2726961fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:33:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpbJqh0EAqdvxUbz7RiANcBMITG7zPrCxFbLlzyVwVKBJ7BHn+bYgPNSwtZHt5oIydnIbsc9hW25PSQwdJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwibtXPZHtp4/mhHWSliRbmMuYa2bXBoZIijgDm3TNUlli0fjlH
	TkRb0R4qJV7pq/L9wPCsbRmKD2FQnLmf4IoXd9zvOiuQi6R9jsrfe3uOJ7Hfw6lbu9xVbx7xkgD
	bvfmNepw3KTrCe96SgK3squfBfEz2Hil3ULaU0+CsPw==
X-Received: by 2002:a2e:8094:0:b0:399:87c9:45a9 with SMTP id
 38308e7fff4ca-39b34071778mr13977201fa.19.1783067578841; Fri, 03 Jul 2026
 01:32:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:32:56 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:32:56 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-1-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com> <20260703-ipq5018-bluetooth-v3-1-62da72818ab3@outlook.com>
Date: Fri, 3 Jul 2026 03:32:56 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc+nMjEwAiE7gHgFTD9NjwmqS7+1Wk-UKpCbQPyn-AcvQ@mail.gmail.com>
X-Gm-Features: AVVi8CfnRuKaV-kcx1kKH9jzZhKIbi1CmXts7IlDKU_0RcVJyvJ8qac7psYrHhk
Message-ID: <CAMRc=Mc+nMjEwAiE7gHgFTD9NjwmqS7+1Wk-UKpCbQPyn-AcvQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116232-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,outlook.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24F2670044A

On Fri, 3 Jul 2026 07:01:49 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Document the Qualcomm IPQ5018 Bluetooth controller.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


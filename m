Return-Path: <linux-arm-msm+bounces-92275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKcyKxzZiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:54:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B610F376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 871C3301CFC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD30371072;
	Mon,  9 Feb 2026 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iyc4b7cj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B237105B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636927; cv=none; b=TfsM06cbbIqP0JwhW0LgoXjw5/YFIWOzB0eO3RObDR+sQYIz4uTjXymCW1rryfywlLO3nAp9gf0DnpH5eh6AtvJNxsEw57KxlWE/N291wCWzQmWd2J4jZFzFM0nSHGEtM2oPdztmB9ghSBMb/fBdlBBjG079JmKJDrS7/uUtp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636927; c=relaxed/simple;
	bh=52ZnTTwCU6ma5VGHBGZTKykJyZwNc2akaww0BZAxEwM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lITSMpiNOJ9NGsanugxejS6oXv0Gafq+XPPPcu+vcD3ofnFv5+m4w2XPvPtOWAT6SnO8iqJ2m+LyG8pcxqVZoUC8IwJY0LC0wYSM+aYxmCvsOttJPXD7I7iFoAWwD+S6L/P5xlUnMbh4gDwI/W/D/gsz/SGXP2edqt67OGqay+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iyc4b7cj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC194C4AF0B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770636927;
	bh=52ZnTTwCU6ma5VGHBGZTKykJyZwNc2akaww0BZAxEwM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Iyc4b7cjpQ0xc4d7KPFC1NzS/nadMYwOxPiqGwgFY5ZjEV/N7+qU4l0bx+ymaAlJ+
	 isupo1FIVNnO9bmHKI/D+XPoWoZA4jN56DzvvfmLIhsH1ft/8/IkW1y18S3JFYKAos
	 lcefWhjtG11Jknz3WkR+EvKsEFdmoQKfeIiRFRMAoBqW0xFzV3/xa2jh0uhRhnWGog
	 wz5ghjTJ2ntRxraSWO0t2fVZMyfu7m9DvAicwZCax7QEuQ8I4N6DrABm8HzUB8U5hZ
	 4VajzJ1oq44L229V34kF1dlkAVropxNynu+VUJdbwORvn8CWKw+CAJQFLJUrXakOiz
	 YE5+9U1ddP+Zw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fd45a1feso43095161fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyxQzsFAQERsTJfCwXNAYywSq+01isJoafOhw/qHCAlS/NsT8Ya6HteSKTMPsKf/I+OrzLEHz+Qduau0Ao@vger.kernel.org
X-Gm-Message-State: AOJu0Yzus0kkQnFateoVEixRd6tOfOFvJSiYJ2QkC6/k7n5G49uHf3NW
	UMAvos7p9AusK1mZKfwpRs0ru3aF0EH+2RcT/2zI9CqC5N5EadIb8IenpV2vOciCFff1L1DuGqQ
	GRK3UsbIfljWUk2W6fDJPbyddPDUc1AAfrOEiL06RWQ==
X-Received: by 2002:a05:651c:548:b0:385:f202:a787 with SMTP id
 38308e7fff4ca-386b5547738mr43444311fa.9.1770636925624; Mon, 09 Feb 2026
 03:35:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:35:23 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:35:23 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <7cb9a945-651c-426d-8cc7-1ec1174ac68b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-2-vivek.sahu@oss.qualcomm.com> <7cb9a945-651c-426d-8cc7-1ec1174ac68b@kernel.org>
Date: Mon, 9 Feb 2026 05:35:23 -0600
X-Gmail-Original-Message-ID: <CAMRc=Md=f_fpfZ6i2PKOvhtgVs_H_XL9u_uRsjF1OfryR-0aVQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg5yf4vIpdAfGn9f7D0Ri5TRZ26eMgjRzKm34rnqwn3a6graqhIH0vI0Nk
Message-ID: <CAMRc=Md=f_fpfZ6i2PKOvhtgVs_H_XL9u_uRsjF1OfryR-0aVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: qualcomm: add
 bindings for QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Vivek Sahu <vivek.sahu@oss.qualcomm.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92275-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,vger.kernel.org,oss.qualcomm.com,holtmann.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F7B610F376
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 09:07:58 +0100, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 09/02/2026 09:06, Vivek Sahu wrote:
>> QCC2072 is a WiFi/BT connectivity chip.
>> It requires different firmware, so document it as a new compat string.
>>
>> Correct the sorting of other chipsets for better readability.
>>
>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml  | 3 ++-
>
> There is no such file.
>

Ah, -ETOOFAST, I'm retracting by R-b. Thanks Krzysztof for catching it.

Bartosz


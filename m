Return-Path: <linux-arm-msm+bounces-105961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOuOIy3r+WkLFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:05:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887EB4CE253
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23AAF30215B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E57397E8A;
	Tue,  5 May 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiuMh/PX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D9355F4E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985696; cv=none; b=ZqEKOIPtYX9LZZ9TOu71bGgPZaWdmqQKDFav8EmMnKyIt65QwCwGsJXkKF6GuzgUy7iGfHTfNujdL0PsvInNEQILl/tkcvatwBJYRN3GuwY6wQ+k8G7SI87M/OOtDYXDj0LKUOQU/O8zqmKwpyBhvMcl23QIet64ci7Fwi30+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985696; c=relaxed/simple;
	bh=Sh28J4VTj/Gu7tafyIE7Eggfn+Ua5Ea/FbQ2l5rPXB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjECTLUw1beDyyVXrOXibsvSknsZhHHsFYFMMEfiuYpP35dYzCKXxuZDOMvW9Jc+LOG0l0aimqPCSZ/tb9sdBUh3KAHatRf8OrSuB5HM1F5GkTY2ByzqMb0hfVdP47V+NGwjnF2Wj4cc0EyNa2s8iwyQbhUTtnZbWAdQBAZAnsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiuMh/PX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65485C2BCB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985696;
	bh=Sh28J4VTj/Gu7tafyIE7Eggfn+Ua5Ea/FbQ2l5rPXB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DiuMh/PX4rQDUL+GxhBPE72jr0WyPeizrZujrEZW8hl5fijkxZwoPkcvbpER5gqF4
	 9ksCEYEWKOGqB3kei7omj1RCAcuwpidRTh/sXQXZ0P7FdbCZguTICdCCnwQINI9ABz
	 q2jXgexKYJtQv40Yd7I97mt97QV3vQpX2FSWeNxKnwqZrWXT5jxl+feg7ElxUnn39z
	 wPJ6Xd48trnC4Q98851hw0Gipbmszn0MYrS1i4ESQAqngLRY2tjaqYYZa9b1vNU5pU
	 Ie125EabuZCIfu+MZ0JSDCQq/1k0vBOabQv5ov/rUgnGoOLebxVWwaWTKj2N+nyVag
	 6JT4LzNNsvbUQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso5750475e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 05:54:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9/ELJqotdyZQA/vqQOv5YbOgAGCi11mfrk2knAZYG4h7VAMO8wISKU0jjZ9bDXwDINO7A7SEcitBT+c95z@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVjsQfBaYph9us9ejkta1JxV71xKXkYpyQvD0uROCrX6WmLos
	i+XhbqDrCRyKDko899cTk6CFRMGfCw1aUGyRL9kBJIXGQ9dbftreYRG0JJs0ulfqnEI/p31qZBb
	++R/6+k1aKODROqdIyIKj7CzTaUDI3EE=
X-Received: by 2002:a05:6512:1093:b0:5a3:fe60:471c with SMTP id
 2adb3069b0e04-5a862fc123emr5138835e87.16.1777985695146; Tue, 05 May 2026
 05:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:54:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmftqH4dZ-KUuWAy7rCNHv+88rFhaKOgQrsjRVhP8_RqA@mail.gmail.com>
X-Gm-Features: AVHnY4JZvQcynYlsHpntup0LWb0piRJ3MjZc6fGn30J0Ndq_DorGjjph723QHzw
Message-ID: <CAD++jLmftqH4dZ-KUuWAy7rCNHv+88rFhaKOgQrsjRVhP8_RqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 887EB4CE253
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, May 5, 2026 at 11:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Some Qualcomm pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Some newly merged drivers may be missed, check linux-next.

Yours,
Linus Walleij


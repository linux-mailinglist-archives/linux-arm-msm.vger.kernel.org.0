Return-Path: <linux-arm-msm+bounces-102493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPd6MBGq12kMRQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:30:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F853CB39C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBC333062F1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6952749DC;
	Thu,  9 Apr 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8X4GOC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29913957E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740926; cv=none; b=W/gQubyLgv7xTqnUlIODLjnUO38JLTk0gJxhTmM5oh7AIBU5lNfnJ68V1ICfxYpi22I5Bdta7J4NG6sdGcbQWWFZod7STF25iMH0tHtU5+JqX9K5d5UpEKlNCrXxSnKY9fq5OOLhx/5XyQXo1BJWCKbxEFibwlnPwuwJFervT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740926; c=relaxed/simple;
	bh=pyoavoBz/+SPMVJWJKEhk8rkYm5D3u/d1Uqy8RrpCTI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+2OzMRfA96fQECCBADi5BEM73xzB7XA4+SZOcpIAJ8pjcD/IqToolyVuPvqPwEV6n0ouCtLVZEfC1WvyDdgKX6SE33WNlI6ikOEaCRs4mfCywAuomTr5h4OPLCBwsHHiZDNzemVzTiQH3rkxdcAjm38CdFJgDkq0oVLkLmlfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8X4GOC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBEF3C4CEF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740925;
	bh=pyoavoBz/+SPMVJWJKEhk8rkYm5D3u/d1Uqy8RrpCTI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=K8X4GOC057jm252IWdXBlJenWm6rg0BJ0YXoHF74eqZOxYv50YVSCQQr9bUpmOShn
	 lHfGUUyeApGjmJYXvMv0dUaFEMTgps6G+Oj/IzJ/nTU5gt/eb5mLzLE1Ub3mLm1Kaz
	 a//ba++Iz+kW5ICUYECQ7LedVM0EGgIspvqR8WWOz8RZoOc85EsqHMSrDpQFuTH5fB
	 8hchKownE9Yv+LA0htfdDxFpFXSYTWYY9uvB6BYafwoT06AEAVvAt0K6Vfhup2fpU6
	 PFpepeQM0osPr3xtK8VamrF3OKiQpLpo+LQ4PwLOefCQshT5Em1qb+afZAoJ+blcuX
	 GZoDBPEI/x9dg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870778358aso8083031fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:22:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YydJB7+FGF3vsKPNGUF3dkdV0sQQMtyLFkvy82eVQLwkfkl/T+l
	Z6p9Igg1ifw/zEkIif09yUCB/lNCm4dsMxacibxUl4tKQjx9TXxc+w4dytJYNr6OkHJGlJ8Cx77
	zu+v20zsZ/YdJLIfb+zOgkxLppnC4yL6GYDJJdGcT3g==
X-Received: by 2002:a05:6512:220e:b0:5a2:b903:3b43 with SMTP id
 2adb3069b0e04-5a33754f95fmr7843308e87.7.1775740924544; Thu, 09 Apr 2026
 06:22:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 13:22:03 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 13:22:03 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 13:22:03 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mff0jK5qHO9NwNaXjL+OGzK6zh1GH1d04SksB2zDnOAEw@mail.gmail.com>
X-Gm-Features: AQROBzC2F2aW-rUr4nEnAQgpPDSxFmZpc921gbfptwLURkkESbjxv0MvJpZAuCs
Message-ID: <CAMRc=Mff0jK5qHO9NwNaXjL+OGzK6zh1GH1d04SksB2zDnOAEw@mail.gmail.com>
Subject: Re: [PATCH v5] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102493-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,holtmann.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86F853CB39C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 13:22:33 +0200, Shuai Zhang
<shuai.zhang@oss.qualcomm.com> said:
> When Bluetooth controller encounters a coredump, it triggers
> the Subsystem Restart (SSR) mechanism. The controller first
> reports the coredump data, and once the data upload is complete,
> it sends a hw_error event. The host relies on this event to
> proceed with subsequent recovery actions.
>
> If the host has not finished processing the coredump data
> when the hw_error event is received,
> it sets a timer to wait until either the data processing is complete
> or the timeout expires before handling the event.
>
> The current implementation lacks a wakeup trigger. As a result,
> even if the coredump data has already been processed, the host
> continues to wait until the timer expires, causing unnecessary
> delays in handling the hw_error event.
>
> To fix this issue, adds a `wake_up_bit()` call after the host finishes
> processing the coredump data. This ensures that the waiting thread is
> promptly notified and can proceed to handle the hw_error event without
> waiting for the timeout.
>
> Test case:
> - Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 26`.
> - Use `btmon` to capture HCI logs.
> - Observe the time interval between receiving the hw_error event
> and the execution of the power-off sequence in the HCI log.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


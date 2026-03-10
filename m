Return-Path: <linux-arm-msm+bounces-96466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFvwM4mPr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:27:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E073244CA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D2C312CB7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD42E399007;
	Tue, 10 Mar 2026 03:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBSWzME5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07364399019
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113049; cv=pass; b=BLkpB7kaGBEKNUdBpUwOzqSN5k0s4tA7FqWqQEe3R1BquhO2nlEVJ8tfRvYFFZkpiShkercXvzTQEni6vBTeVETIBLXzz0tWY+RoSvjvp7wsyJ/wzWRwaEdDZEOatKA+ZutJQkI2Ntoo7LLcpHpdf8EhaeREd5vaa3PQJhARrnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113049; c=relaxed/simple;
	bh=Lcr5dVXyCC6NuA15tJ5l/HwAKYVsMmOxotK4MXcexts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPwXBvXLZymGrBFk2mZ+Y/7z9Cd2wJLgItBZYCU4Bh0nFV/FJzwXgSnxYUbTLKa+fkovWT6cq1K+x8FbwNIM+f45+unuReU7vw2IH6aLue/NKx6h3z7WJ6i1kUaw26XdhI3N1cTOGuSxWmSptzKPeMq01nc4aJlFg1+KJQ7Raa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBSWzME5; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-404254ffe8aso4766237fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=iI26sYnWRETjpoFDpqJRflR1UsHmQ7EfJpCg8nC3GpaCaby3hXfrQzmdMveLvsGaXU
         QT94vsvS+z+Kt/Z4cI+J1lzkEVkbaAZRygTLGjPpQeTjrOOi7uRK86QAZUifFdiBH0ht
         3Ag2kYZADiE0shtLJ/+J914eHbYll/jSyQFr8gU1TVk2w8UVjo0NFKtTZ8YyJlNj0Frs
         pw4q7/VS72FAyP+jPzoOhE//MWk/Q5R+QDDDD0N6iPJ2UKtOn1/Te3H9iqTulBbPljDq
         ODzZx3aOSp7VV6xsFMwz8JrsxUGuTDaLQY+dpzNzO7UKEGsew3AZv8ej3ZaDLEdzrB42
         0hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=ehkNoWs0OpHsVdZ/xBufVOTpV81WGi83Nqm9HoX6Ngk=;
        b=fdlSLIUB75hFluF3yZjmqIPwQFl2CfuQyS96JP5LwIsdnxPVqMJzgHDT+rG71BbpZ0
         CX1N62SZ60z/OghdF68tYsM2HTzqccU7Vf2WXf68zyGK7bD42ShdvnOj+KdzNTw+SXMn
         avqG/61LuXP96dV+D++IV2zvx4dR2f2oHEk+A9J/kwQ7zlEI1K03aqrk3w6HkOn6Fwzm
         54djdKeBjF4ayMbFZcbBFXeHAm4FykFG5uCIm/J9nuwQmvlLpK1GfhL2cuqvwS4MbPOx
         +TiFUMsYNwrSLT2wjrOnqw/NHNvo3WQAly2XCxI7bd2F9kriiKfE0ot8f8wrrrXu2XJk
         SqZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=jBSWzME5mmDt+P73t+DCqn3BR9/LRYmvJLwD3COsdTW7jJAeGeMD7vWegQm0kO1jnb
         eposRxG/wfW+/sbnaM4TG9QD1wZBVQPsBzT0GUBOmLWmj7BVZmKAu41tyRm0eZ8d9dvE
         c4mknSfMgR6NUzyqe/8wJnqLpWmRshN7I9+LX0AHpop3O3zEvE9hH6cZL7XoGSlgfgx6
         aOlisPIL1Gnilx7ZE+GObnfzLuLz4q7C+gcPuOhjjwpMyHnX+Ns995kFh30BvgeonYDy
         SXhEHm9/ml0cG6yEFdQpyAmV4NOSrM1kvI2NFWmJN90zz54ahqvjYjMMbBVrl6CyqGq5
         4m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=GmwWRwto0s4jPxqIMdY93o7aEYeuqKChgueFJUmCk9Z7P3STSTCDbtLQSH5jrthWaD
         7tKMH73LLgswOjzvgEzUA6yZn2JcWq58EjXQ5kUPoA3DsFKAhMvU1QXU+9ioA38d/8/7
         a0qOq9cac22GAe5LCstablx78Dga2P5lV4MljCTkzDaVlh8+ql6EN6Vxj9rBZ01KtwMk
         0lZNZL6Q3p23PRUkwuSTDdjraPWAYkeXJK8E2yJMqcVZ0HK2DEUqY8tRqJqFiNn/N4zz
         AmP68fAFJ7UXD3NgFL7C+1FTifzdsF9pV+p9Zpy0tHp6znzCmKDspOhYCo+6Ak2ggVu8
         BtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa/ImZiMeKMU/HK/iZffJe2Q00vQjPDinaea7YNvALg7S8NAnmId58yJ5pFGE/LtTBHI9Sfo3tuUDQelqx@vger.kernel.org
X-Gm-Message-State: AOJu0YzihKHj+ySN3ciw+LBAFFWQvO0+iXy8y56Q9OxmMY7zuxSYA7ow
	1ykF46leEteFCIocCaKEVowIEqntEy55KUJtAlKUXCM9u8tfx/H81K6u0t/+7b+2mjrSLDnQ05Q
	X1lbbp1Kh14KX8kzW8Tu29uj84Dr+vIs=
X-Gm-Gg: ATEYQzy955fT7pbfPpsddTLSRozKhWr01jU3Z3ZtLYT88K+2coGprzGFGfjOT0s1ac8
	P0pPYVDkrc5RZLaA5HXTKCzD9AxAnCQmT6YOD6/eHlO7lrjynfA3NJKb6QSy4Rmu8NebssVLazt
	l9Re7Z/V13QoWbXhh2skped/vsCmdgGMAF6IV6m+xr4FInJ4Kdl86+RoqoOEz6uJceknVycEQb5
	owNpPmswUPILMEegVH3Af53pEzlk2Wzkqbxn1x2UFTRmn3x5nGKps6yaK6uT8DDGCKkr+LS3l3G
	WaocJFML
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7E073244CA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96466-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,vger.kernel.org,arm.com,gmail.com,lists.linux.dev,amd.com,nvidia.com,pengutronix.de,lists.infradead.org,google.com,linaro.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi


Return-Path: <linux-arm-msm+bounces-109366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO+sI0+EEGpJYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:29:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B855B7990
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC753007F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD05342501;
	Fri, 22 May 2026 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcRC9yO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83364352037
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466954; cv=pass; b=U7XCTYkbF219662k4xsstmMYat/OhAeyyvd3qEs9f+IfxppXrOfNqWwMY0loCJRC13GXwhl8ljhq9SIKNSxmMe+vJSYOSlfSDSYAOdy/BDm3Wp8UhJ2gRzI/gdasJy9VSTaUOqiVm2Eq7xpxfD2/oI4X3HGs+H6zr62AxYUeXeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466954; c=relaxed/simple;
	bh=nxDL5wbIW5pkhBBgQjLoIFOrjNVlK9PS1v0vc3/+klM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf3bonsbl/oGSQ3T/pphWoor2VvUsUT2wytrlKnZJpfI/2r6zf2xDjiIhcAA46T+kmdZGEnDBv5Uk3qEMeDbHo6S3/4n8jpTxF0YGZYLgpR7LhOaHV4vtDzqwJv70QINU0+Ypq4zLX+cvmiJ086nYxPQd4AynzMQ/VgnJnsKP1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcRC9yO8; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6587cee8b57so8656069d50.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779466952; cv=none;
        d=google.com; s=arc-20240605;
        b=FZWkAYD5412F5iQ+bblqTVxSXn326NWvQtJMabZKZaMbcwEdODqMdojTzSidDVu8Bs
         TKkjZOgNsuHSXu5dWh10AYKG2YlQ+F7NchWZwQw553KfshHWcVJs25Lwrgfifd47xwpF
         lY5ZBCZeb73HOPcN0AzA5himYd6LxQhydWuZcW4MijnF30fkqCrJV/dkfQY0zJwCpFJr
         xnyiLYt2QChGULeAeKvW0vAmzIOXmEja+tVbpooCJBQSaJ1UJOWsTLRBYsGDiTLbqb/G
         C2dhy7ip3b9S0Y9nwb0DXvxvX0zOy5XkFDiwYlLzALiu4EYvRE+hWhpWYAayFeNd4Ktq
         KVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vimbPXonM0vzfVvoUxK3iQItdTAAHoqaETC2qpf4r48=;
        fh=3RvloCdFNkuPsMUUN26ArWkN6E9ce5FEGkvZPGhqntw=;
        b=Gf91ZVqyU1g+7IYXhSpKn9cgL1DpAikE5BWYSKixZAiupWrZF3Y7ytfrQtsVEuZax4
         VBoxmiPs7lLDiu5LaGKHtea1/OmcyYkFDtucYBqDL7RK9NsmeHUAu1IGyYL+jLnCW8pX
         OU1FhoP8I68zYtfsdPKFGFj08gdRAR+2lP6Egj/MLUK6d4TGFs1iR3IyQPcv+6HT7gJS
         VWRXkbSkZRUeJ7/jSdHizBlywdN5tyCInia27AiPpwUqoKZeTCkabxKrkJPKpddZoIMh
         i+qx+SGM5MCiTCLZsKyqF48GheEnAkbiZiFRL2+M3kRnAm3PRM9113HQSv+PO46iedtO
         bDnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466952; x=1780071752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vimbPXonM0vzfVvoUxK3iQItdTAAHoqaETC2qpf4r48=;
        b=WcRC9yO8MfwgMcr8gL/GJ662vWIJtrsLWM9Az6xWycu4oLhECy2p88ldJqlRgVQP9r
         zbLg+Xuq7rhwXutbL2ve2uM/QY3nLCoZ+Wf/sZ97TInnf+1SdpKvPETww5tl5AXlQB1i
         OjwS8iWuvOFj1eqEqdE5sbeCvL+rZjWPyzytNpXKqu1aBnxXW0Y2w4E0RvDYpxnWjAgl
         NiFAgR7dg1anAu+Jk6/X389XP2vTop+SFnbhMGCpYesc4Bo7anMBxIXRItLOytg/FQ8K
         4bZJh/fb6Hx7VbVpFGpbiDe2CwKlKU2pKa6Tx0XXj0EeYXpxVy2un1mucme7XZzpNEr8
         G8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466952; x=1780071752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vimbPXonM0vzfVvoUxK3iQItdTAAHoqaETC2qpf4r48=;
        b=RF+xMxQtfNP8/MZbLLmdKQQ8Xv+rYMyZx+BJdwe0Mwt4XV32EhKH2tlhZS29fmLMtx
         iu1DwolqcI4r+OPIJTW6DK3+Q1e0ymaq3VmECvbnBBRGIGpuXwPhw70Ywmb/vTjVJGjo
         uqLZSpXICC0LF48OTAHdiPjVhh5BwkyLfSq6hDfBAnvrN2n6LPzd7Nm0rkdo9DBCw51h
         yJGBBa7f/k94GEDDztvNGhA58nmir5sEgTMJL1xtyZeXSD/edOWWvJRwBaAgLqqaB/Ux
         d9zMKkjCkvoq4BGgWT8AbNj2V9bV807HzmGj8hc+1Dxh5yewpJfgwPiA4iEOJ3Hq9/Av
         V5dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uQKDhmE8nXiDD3jvXw64MddoEWPBOv30CkTtOejVHS4MUM6DEraiL4tHXlZ1zP8FzXz8xElw54IRWIuG3@vger.kernel.org
X-Gm-Message-State: AOJu0YyYYwX6v3Kqa+STsvwbERZ41R49zVQEeABgGywK/QIQk9N+wXod
	xTqO/BpoJiSTjBYv/T6zv9yh9331SdJ65kkANSxBA832FT2DsvOzcAfzJvVhSSYbRDuLVEsTmoe
	+QhLj55VCLbg5KBXvQQggOf3JIyTg6Ss=
X-Gm-Gg: Acq92OHN6t4QIbOkT4BNA9Lq5q3W9/p1+gaRa6ccDVPR9vGNr81bxFY9vwa2/dqcZsm
	LKJrpg7YN36nuhVKELbjXWM4yLkXAFlqrsR6f+0DDZQgIrZceEeg7v8Gte9QYi6I9nh3YvCrcpE
	IB3wODQ4GTTVlpp9CpyKBZUd0uv85TKl+x5w8+/6mFhqLZWDXC6uEEodjxnfvXYMz1Pc2n24y+M
	uuTxD7QeqI2XzTDSqV0x6/5ICtpO48NPjr8eJkgh+iK06aYPfi0oC/tdehZeBkqkT0SvYi8+mVX
	mrM/GLqHWx0EMIWcu+8njnOkkAkuU/nvSS9jR9OhsrE0Tc0SaZ23bde3FEKCdFRtAII=
X-Received: by 2002:a05:690e:2505:10b0:65c:2360:dfc8 with SMTP id
 956f58d0204a3-65ec97cb46emr3504100d50.19.1779466952292; Fri, 22 May 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522110838.1158643-1-shuai.zhang@oss.qualcomm.com> <1b8e8129-4f42-429e-bd70-5e368551739c@molgen.mpg.de>
In-Reply-To: <1b8e8129-4f42-429e-bd70-5e368551739c@molgen.mpg.de>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 22 May 2026 12:22:21 -0400
X-Gm-Features: AVHnY4Inv2WF9EZ8468g95mfpM_6fOpWwRbf-9-010PGY44gyz3kDqoT-LBJp3U
Message-ID: <CABBYNZLQ5m-24twTZaHXzi6QHqgGdvuDt1aaYwbEi0Vt=R2Dfw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Increase SSR delay for rampatch
 and NVM loading
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Shuai Zhang <shuai.zhang@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109366-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mpg.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 06B855B7990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

On Fri, May 22, 2026 at 10:50=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> Dear Shuai,
>
>
> Thank you for your patch. Please mention the delay in the summary/title.
> Maybe:
>
> Use 100 ms SSR delay for rampatch and NVM loading
>
> Am 22.05.26 um 13:08 schrieb Shuai Zhang:
> > When bt_en is pulled high by hardware, the host does not re-download
> > the firmware after SSR. The controller loads the rampatch and NVM
> > internally.
> >
> > On HMT chip, due to the large firmware file size, the
>
> Please document the size (> X MB)
>
> > loading process takes approximately 70ms. The previous 50ms delay is
> > too short, causing the controller to not respond to the reset command
> > sent by the host, which leads to BT initialization failure.
>
> Maybe paste the log?
>
> > Increase the delay to 100ms to ensure the controller has finished
> > loading the firmware before the host sends commands.
>
> Why can=E2=80=99t it be increased to 1 s?

Why would increasing it to 1s be a good idea? Actually a _proper_
driver should be able to detect when loading has finished, not just
use an arbitrary timer and hope that works and the controller is
responsive afterward.

> > Steps to reproduce:
> > 1. Trigger SSR and wait for SSR to complete:
> >     hcitool cmd 0x3f 0c 26
> > 2. Run "bluetoothctl power on" and observe that BT fails to start.
> >
> > Fixes: fce1a9244a0f ("Bluetooth: hci_qca: Fix SSR (SubSystem Restart) f=
ail when BT_EN is pulled up by hw")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > ---
> >   drivers/bluetooth/hci_qca.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index ed280399b..184f52f9c 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1680,8 +1680,8 @@ static void qca_hw_error(struct hci_dev *hdev, u8=
 code)
> >               mod_timer(&qca->tx_idle_timer, jiffies +
> >                                 msecs_to_jiffies(qca->tx_idle_delay));
> >
> > -             /* Controller reset completion time is 50ms */
> > -             msleep(50);
> > +             /* Wait for the controller to load the rampatch and NVM.*=
/
>
> Missing space at the end.
>
> > +             msleep(100);
> >
> >               clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
> >               clear_bit(QCA_IBS_DISABLED, &qca->flags);
>
> Is the time it took to load the rampatch and NVM visible in the logs?
>
>
> Kind regards,
>
> Paul



--=20
Luiz Augusto von Dentz


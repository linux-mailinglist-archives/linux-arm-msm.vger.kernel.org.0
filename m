Return-Path: <linux-arm-msm+bounces-100394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJECNnbHxmm8OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:07:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE15348CF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 029F330A1B00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF8E3FEB1E;
	Fri, 27 Mar 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7AGaXO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D43FEB15
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633918; cv=pass; b=Pr546xZzr8QUs+2H4rZvpDii0gd7WRH95fiKEmiRudQe6mNubcIWpW9CuA7O/OqbdSql3bZL4R79YMErEORa258znd8dVsM73HEuh56WeILxAlUzLGi43LhVMj++TwbW4agcVtYTU1CwQyRDqKuHluAABYC5pv02uReP/XqPWMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633918; c=relaxed/simple;
	bh=3OUvfFHGuHM2QBTFO9WY8r9kR1/cxJMORvSKgUjxTqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czLTlCWGBpQiHgNnQVublyBnmqBq0WzJRGdoGOWBqzoafH6/w12td+9WFRuvKrOw7HJOZ0atTuJ0OJ4dRVDDAmNucOqoldDtdbEbol1yES3xcm0VOrwpA1HgE1fIu7naa5ptFyCESgdRrGnvhcUHfyjZWqvVuaqLxzxpW4Af9yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7AGaXO+; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so2434762d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633914; cv=none;
        d=google.com; s=arc-20240605;
        b=U8Q4UskNPTuvIaAP02eWFdReAla5TsTliwIidSJig7+fhC6X6NiMtYqMjWJBgquuxB
         jEZyrhNnGnQbhypLgGUJ9Vf9fu4nPzzLdoqjKpDBGs/5NuxIpjN6yKtV8w+ShsfQHNfr
         Gk858NeG58sgM65/4MqzFzmwDC3ygL6FcbH2uMvpz4GwAgMkVP0Ad1t2SwpN+bJyKKdk
         p5IZ8P1rxX9sSkuRvYTPtxLNX+304gNsw7xOtWedeJZi0vQ0uPWek9X6db/Ri5NKLEvB
         LfCjgT/mzYI3M8eAi1FWQ5sdItVC62PM6UgL8DJtPRDODO9AB0u9p8QVmG1MNeoczc8Z
         5jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IF9FRhjmH8zSwIBkeE7rltrcgfchPDGu/fGIAYdHEUs=;
        fh=U0lbhxAahVgtAAgYyCZJ4EobPcNuWlMBQMRBA2DuYtI=;
        b=aKSnrKdZ1f6a5nEzT05MMKq+Aomrwc8jgABiEM9cRIm42sp0Qkkn3+obduMEXXCthC
         nhbAABNfjoYb1r0n/xBc5ePaHvCXSv0T83vDI8uzQ5B9SJfKSG7TEm3Vh6t7IeDDi3Kh
         jLAyinuyHXlHtl9TLnZDOweQlfU80jrXr5wZ6w2MNKcZdFsYSmPgIxYWPDprMkiznp99
         Z487cs8eVtxIS5qFx16DT5OMk8bPzQFFdok4qJ6dOVu/3wTgG2J+/6R+v5zmLAGCsrM7
         eEgBxtQJeGMCpR88+LG5hvK3zjYeQu5Oh/UMiSDeVb91hUH6zmHMEFUis4F0Qq6MVxYp
         bVag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633914; x=1775238714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF9FRhjmH8zSwIBkeE7rltrcgfchPDGu/fGIAYdHEUs=;
        b=o7AGaXO+wzt0deTZP0fraClJolZs1TXFkoq2w1zMzhcsV0HusSyOiJqhaXoKKtPgAD
         Vl0PjfUhVMUKjvZzs2Velz+cr6WEeWlwb1wOX+zISLHV+OFMt5eUrOBKv0B+KzNjK6W9
         3ceQFxcThwdMtZWnFmw+wNmvj/lkFBEUfCEYSSIXtAaNqNcN+MdoJLWPAsTi9x1CvgFB
         ZJojy1mfJ8wmtDap/mEsd5MmAXgdpqcUdGBzrlbQjN3LYMKQks9ZpLxIu3jkqQZkxU/E
         6UvUOkgodxO9WhfqxM5qTXWmH6hWBLm7jrXtCc38emAR0Nu+UJ4lp7AyiG4JQvvnXa+Q
         GDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633914; x=1775238714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IF9FRhjmH8zSwIBkeE7rltrcgfchPDGu/fGIAYdHEUs=;
        b=ccU4PzWrEimAMX2IBvvXghQRluhcn1a//ccaXXNhUAKskobGGdqmT48+oGdt20o3Ry
         goIYTn/jQx5/vpLZOiQ+MUB0CNPlcvhLjObVEmp2SWsF2aynRt5NdYNoseufgSR7yPw7
         eLPMCv0I4RpxHL/myAvAz5sl0z/TC8vvC3fhcdWLg7wlUXVKcDGb+YVNNFxkcsz4oP+3
         a5C8EKj0BAjaJfovki2v2nF7BuwnmJ5EWzU13ao4JgYW7thK/GjYMlVjdmgjwHALwa7U
         pDUIKpiW3lAfcuBOwHFq8Hr3jsKFkLKr0WnIJJuohOeEMG4kDVnr3TXO8zCG3mI+IccE
         3vVg==
X-Forwarded-Encrypted: i=1; AJvYcCXMVdkqEa9ZCWgFvA7JwapAdfIZuvFSrJU/JEmBG2RsEAKx3txTps08VbT8bO7+70UY57d1glvtANDkL9P3@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJqrTTRtqLSUxhwmcHdUQOif4IJmH6DxI2HP7FxERA6xWjXN3
	xv5rzQpA34TMzYAvclqv5+s/NDbwBqs/e0mHbB7TDXiQXbW8g42UmmJ3kiFqXOmGZN5sQAPNDJO
	b696W2U3h1i2T/9PR9GykoXAUOqSFER8=
X-Gm-Gg: ATEYQzyBDAl9gCEXA+Wpdo6WeOj5jVWcArZDbljnWwl5Ff9rk7VALgUEkeZKr4dczpc
	Oh/iG12fFUd18YXVvhtRnUCajkILmUFl4RHdbA9uBEful6w1gk1g9Cic+BBtujZL8HSbgJ5E/SL
	aDdqnm7ESeEPRfitqTX5zMTJMPHc9FYZciZqQq2j+yWgEoZcYtbrk3iI1v2EkK4h3sT56BxTyKk
	6XXzE6jwusuw/W1xM+uKRKRmhFNBbNsr/pw7oJUHAYRxRzPnO74wDJOTrsLvz70UgppMM/MKeLb
	4yFUkjQXgWcWWcHsqCCPncIXXl88fCxEmh1UJV60v1e2ZuH1tCz0s91AHN8g/sjLImsWUw==
X-Received: by 2002:a05:690e:4843:b0:64c:a4ab:e4d8 with SMTP id
 956f58d0204a3-64ff720cb83mr2835610d50.20.1774633914461; Fri, 27 Mar 2026
 10:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260327083258.1398450-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 27 Mar 2026 13:51:43 -0400
X-Gm-Features: AQROBzDahLri4nXUWvYxFtl5RrxDtiNo6y7zoELouPOJAeBfQtf-OGwuWxOEQLk
Message-ID: <CABBYNZKwxh1R=EcBpqNpsO=pyJ7Z47qgYUQtrpG9QSC6sK3SpA@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, Shuai Zhang <quic_shuaz@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100394-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,qualcomm.com:email,sashiko.dev:url,quicinc.com:email]
X-Rspamd-Queue-Id: 1DE15348CF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuai,

On Fri, Mar 27, 2026 at 4:33=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> From: Shuai Zhang <quic_shuaz@quicinc.com>
>
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
> - Trigger controller coredump using the command: `hcitool cmd 0x3f 0c 26`=
.
> - Use `btmon` to capture HCI logs.
> - Observe the time interval between receiving the hw_error event
> and the execution of the power-off sequence in the HCI log.
>
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Link: https://lore.kernel.org/stable/20251107033924.3707495-2-quic_shuaz%=
40quicinc.com
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes v4:
> - add Acked-by signoff
> - Link to v3
>   https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc=
.com/
>
> Changes v3:
> - add Fixes tag
> - Link to v2
>   https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc=
.com/
>
> Changes v2:
> - Split timeout conversion into a separate patch.
> - Clarified commit messages and added test case description.
> - Link to v1
>   https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc=
.com/
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index c17a462ae..228a754a9 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1108,7 +1108,7 @@ static void qca_controller_memdump(struct work_stru=
ct *work)
>                                 qca->qca_memdump =3D NULL;
>                                 qca->memdump_state =3D QCA_MEMDUMP_COLLEC=
TED;
>                                 cancel_delayed_work(&qca->ctrl_memdump_ti=
meout);
> -                               clear_bit(QCA_MEMDUMP_COLLECTION, &qca->f=
lags);
> +                               clear_and_wake_up_bit(QCA_MEMDUMP_COLLECT=
ION, &qca->flags);
>                                 clear_bit(QCA_IBS_DISABLED, &qca->flags);
>                                 mutex_unlock(&qca->hci_memdump_lock);
>                                 return;
> @@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_stru=
ct *work)
>                         kfree(qca->qca_memdump);
>                         qca->qca_memdump =3D NULL;
>                         qca->memdump_state =3D QCA_MEMDUMP_COLLECTED;
> -                       clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
> +                       clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qc=
a->flags);
>                 }
>
>                 mutex_unlock(&qca->hci_memdump_lock);
> --
> 2.34.1

https://sashiko.dev/#/patchset/20260327083258.1398450-1-shuai.zhang%40oss.q=
ualcomm.com

Not saying the feedback is actually valid, but if there are other part
of the code still using clear_bit(QCA_MEMDUMP_COLLECTION then perhaps
they should be updated as well?

--=20
Luiz Augusto von Dentz


Return-Path: <linux-arm-msm+bounces-116857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fwwiMYm3S2p6ZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:11:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA72711C47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DbE8Vcui;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116857-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116857-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB532305CBFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28936367B9E;
	Mon,  6 Jul 2026 13:22:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338F41A760
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:22:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344122; cv=pass; b=f7tOOEBCNRjNAQzbDixdhYxlXyTb6UOzUe1i0qeoMoLEWRkbokaGDikSpsg63L6+UICNjdZ7Nb1SjAzY7mTpuv5NyTe/UQFMOCdRZn4bgqsGjiocMNrIwmy9AmB6fcliXbeB+Ofxttolkpl/IF4HbtQlXMbGp8W1T5VizgoRk68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344122; c=relaxed/simple;
	bh=NRpkEVsrO11eq4CxBW/dXRw+VTRn2w7uSQ1EWJH5sLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT7lMzuwK0oQLXDLjqfwryWBq2dLRqSY706U5fpd3oQBtt/1GsDoR4YBFRKMr6MgBIkLKZIhgkvPzyOd3hy26VlfdG7Uo+wXeTsHvloiqW25ibqKXAxSwa47E1g3/mBKAsre3SOTCsF6UpVY2+NNQhvjMhxAHE1IRXESFvWmHlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbE8Vcui; arc=pass smtp.client-ip=74.125.224.49
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664d7863920so2218656d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783344120; cv=none;
        d=google.com; s=arc-20260327;
        b=CRIhmV6kmaSCjUcGxbm3/R/4BjHTI/mvZ2/QqRfGfquQGIKT4pUeq70TgzxJ694ZuY
         aU1eEolNaiSoLZGyOcsAU/TghTahcRQT6UuD0bYCOURDKA7rpM6mzlia56ed/oqKSaPJ
         sxVMi6M6zretPAbZGftjsF4w8P4quUSLjZSoFTQvJsCcLJxOzqI8ALM+h9dOuqSdZsxF
         Njgc0LAHZOU+F3Azu6MOKXO88rwdqg+ne9MTSWix6Q+zS4++17fskWnj9rT6QNGTN+Vo
         9gr3/Iek9cBCrXLfz9xguZvGCXAdy8j0W8eFugjUjtRNy8ks40q2QVvQdB7UZp9YSaHp
         yfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Crk8V3NFGTDCyc22U0OiJpfYC0BId6QVuYdAFk61QFs=;
        fh=s5D1ynUGr//G150wPt1vZihXVVHb0guaMRG/GBOgo08=;
        b=ijdUqhAufPZ4HzbtcJH/tO159rAZ9Hco/R5FtcFVPe9tBk5/xifI45lz2shT6N6gio
         CzKe4wwrEb/g5l/jqirn8JDJ9sMU+CMIUMZcOTKIDraAfH+osxDc/8v7ORD0Ba9yFEHs
         NHlJeIVbuQDDRFELxGaGqsPMgZu1ApIyefjKTok6WGSGsTNeJT15UeAMrc81wXeIOsM4
         cw7c+IrWFEO3DMN8F5uI3pX3u07zjWpnt8hxlpEC5iRLabTkvvbLL49YdK4X23TRqTRT
         XBY9HshRYPsj0RlOFEpTti11CJ42nwaswLZbYxGJvlANHbLR063hYlvpXuzkFR+JAnFE
         ucsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783344120; x=1783948920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Crk8V3NFGTDCyc22U0OiJpfYC0BId6QVuYdAFk61QFs=;
        b=DbE8VcuiydVfXlBkInQvRmwiawHbdxa/Ni2S5ZH30k1rcJ1LRWoAtD3wTUHGlJa18o
         WLhPv6i1fF6p5mmOOyhcJNobnkqSNOTVCu8UkOFf154u7T2GoDyVDcUBKiuPESrzcV+f
         jKJ8HzOL9d8M/syqO6CI1N5tjtrjck/uzo7IPXa884jDh9B5llR2r9Yj0mxZCHHH5of+
         JhRjrJq5JF8jL+H7DJDR7hFK+kbk+sWSbyd1VfEGtR2sxE0rfZaoJOT4weNM1NzNEx46
         Kv0r5fBNR9I+VF4u0mbaKeaS22m/EHhEoSDtWY3ti3MXXj3B4X0uzO5UdXlfebn4S2S7
         NlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344120; x=1783948920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Crk8V3NFGTDCyc22U0OiJpfYC0BId6QVuYdAFk61QFs=;
        b=AKXyiXbYrbu+1QTHb8x9NO1UscNd493ZKui8uTg7fWvDW6mh/mx+zQkko/fxGX2BKG
         fe95XyqPSFaq2k92gmLtQv9g/oSNEt8XiQCgtlyAImFLEO0oYSyJcFVwQruwYDk8FHis
         P4xdCq4H/Ubyqiq72c9KR4amJkx9dcLiXo42U4XDQXcAQfqmDEWveS1rjd/YLyRGTS91
         N7Mi9ddAk9x/AN29R61htw6qg99ThMPIDKO9FatpNU2konE6dYFma4Mwktu2XzgXFK4B
         kiblFewmTSpHoLJkjBjsmHMSQCOj7tJn9+qumF20qoeaaAPD7ACqQo/x+rU6Nkw3K+8b
         GXwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrejr+RbdAHQlEqk0g80u6tDota1BBAjoxmc9EpLyQdEiBLHYLih77Qf/XAEc+NnTqYb2OZFm7rT7Jkfpu8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3ftNxJyDzq+lhe9Zn+XgMfFcsaad24SBSWaeOaiAgPneiRsr
	C31YTT7NdQD3TKIrri+4NWYZH5zTF+xVf3OOaJ697HbzFSsHOC6OARj+VVNBCzN8yJ9hb7KVji/
	b5Idf+OBm6tYqyegke+tB9/3TfVFqhYI=
X-Gm-Gg: AfdE7cmufDuDReAOH9crNKlUBjkCUZF2qrw/KRTqoWn/7J8YnZIRDO/4iIa1SEOcQys
	FPreYwP2GzhkPXZ1sVlpBMMeQSxuDqeIgtIvPqEzAxsWsaR9Tv9NrvCdVwENh+F3ETaMkLlKu0T
	wS2lLE8qtFCRA6PA08EVXU3riNvKHuTtqh9lGS05pEFEfY1q05xQf6KUG7rDrFFY01z0+Y0bX8z
	nI/QrqHpmPUywM2fiHGUDPtvuOEpobrHnVskZ08LMKnHNlXNVYkZ8AwAj7nbEHUSJruFWe9S2WG
	vXU9fZN22kR6h4qoc7+y3GxOVIJDLRF/T7g6ijZJW8MsJwDZmI22nJZD4j0=
X-Received: by 2002:a05:690e:d4a:b0:664:ce2f:faaf with SMTP id
 956f58d0204a3-6677fadaca9mr563422d50.31.1783344119481; Mon, 06 Jul 2026
 06:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706121525.2717691-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260706121525.2717691-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jul 2026 09:21:47 -0400
X-Gm-Features: AVVi8Cf-YDNoL4XWaUnO0AcjXOX198k_S_3iGuDieL4X7Pj_zPzTnJZtt5mCgGQ
Message-ID: <CABBYNZJTdONXJqKa5oR9EKAsZkLQBZ+w74GYQfKna79B4RCUMw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: Increase HCI_AUTO_OFF_TIMEOUT to 10 seconds
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116857-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shuai.zhang@oss.qualcomm.com,m:marcel@holtmann.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:chejiang@qti.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBA72711C47

Hi Shuai,

On Mon, Jul 6, 2026 at 8:15=E2=80=AFAM Shuai Zhang <shuai.zhang@oss.qualcom=
m.com> wrote:
>
> HCI_AUTO_OFF_TIMEOUT controls how long the kernel waits after an
> adapter completes its initial setup before automatically powering
> it off, in case userspace (bluetoothd) has not yet issued
> MGMT_OP_SET_POWERED. This avoids leaving the controller powered
> while unused.
>
> On platforms where other services are ordered ahead of it, the
> actual time at which bluetooth.service starts and issues
> SET_POWERED can be delayed past this 2 second window. For example,
> cloud-init-local.service can perform a network metadata probe
> during early boot, delaying bluetooth.service startup by several
> seconds:
>
>     $ systemd-analyze critical-chain bluetooth.service
>     bluetooth.service +594ms
>      `-basic.target @9.342s
>         `-sockets.target @9.335s
>            `-snapd.socket @9.267s +58ms
>               `-sysinit.target @9.025s
>                  `-cloud-init.service @8.377s +604ms
>                     `-cloud-init-local.service @7.000s +1.340s
>                        `-systemd-remount-fs.service @3.257s +44ms
>                           `-systemd-fsck-root.service @2.803s +394ms
>                              `-systemd-journald.socket @2.223s
>                                 `-system.slice @1.772s
>                                    `--.slice @1.772s
>
> Once the 2 second window is exceeded, HCI_AUTO_OFF fires before
> SET_POWERED is received, powering off the controller and losing
> its firmware state. The SET_POWERED that bluetoothd eventually
> sends then has to reopen the device, triggering an otherwise
> avoidable repeat setup and firmware re-download, adding several
> more seconds of delay.
>
> Increase the timeout from 2 to 10 seconds to give userspace on
> systems with slower service ordering a more realistic window to
> take over, avoiding this unnecessary repeat setup, while still
> bounding how long an unclaimed controller stays powered on.

Ok, but we have no idea if the system has Bluetooth enabled. Making it
a 10 seconds timeout might leave Bluetooth powered unnecessarily.

> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  include/net/bluetooth/hci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 50f0eef71..ee3f295f9 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -483,7 +483,7 @@ enum {
>  #define HCI_CMD_TIMEOUT                msecs_to_jiffies(2000)  /* 2 seco=
nds */
>  #define HCI_NCMD_TIMEOUT       msecs_to_jiffies(4000)  /* 4 seconds */
>  #define HCI_ACL_TX_TIMEOUT     msecs_to_jiffies(45000) /* 45 seconds */
> -#define HCI_AUTO_OFF_TIMEOUT   msecs_to_jiffies(2000)  /* 2 seconds */
> +#define HCI_AUTO_OFF_TIMEOUT   msecs_to_jiffies(10000) /* 10 seconds */
>  #define HCI_ACL_CONN_TIMEOUT   msecs_to_jiffies(20000) /* 20 seconds */
>  #define HCI_LE_CONN_TIMEOUT    msecs_to_jiffies(20000) /* 20 seconds */
>  #define HCI_ISO_TX_TIMEOUT     usecs_to_jiffies(0x7fffff) /* 8388607 use=
cs */
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz


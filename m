Return-Path: <linux-arm-msm+bounces-102503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLl7MSbE12mdSQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:22:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD63CC908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0580300BBBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686513DEFFD;
	Thu,  9 Apr 2026 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2PxuV1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030E3D88E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748128; cv=pass; b=WJ7W/QkxpPINsdnNWFWoHfkjNYcjuxZUsBKKx2Gs57kHjkv0T/yt7/Iih8stK2e9UBd8BVVHBgHbk6gq+Kw62iw8/JgtKPsLhj6wmXk89tdC3pkjgyRYjSpcfXP/SdGPmEeIjjPBbTJdGrOSOFbKGeR+jmar9NhRDyJOhn+qA+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748128; c=relaxed/simple;
	bh=meMgMr/h5W+MS/0Yh/1Per24DLP0Ws3LCGTS9OJSr5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhx009wGhpvL4cu7StMm4zog/RlYc/qEeYjU7WcB2M6daPOujBIBoKY/C6V+mgSypEt2V7P5kTCRCEpFQgMsyWCIDz1q4u97egxkAmuntiDqkFmIsMsQojSGm1REd8K4sm/A4+dhXzcnRMq7Xg4szEfIe7jQeCwJTZpvzv3wBrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2PxuV1I; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65075c2ba66so1221576d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775748125; cv=none;
        d=google.com; s=arc-20240605;
        b=lsqIJn4ZvlDj72nsWm4iwkHVrXvyVVKQdqSb94Gt2Nm94PschmLPiNdA0Rsl+6K2b2
         DgoKhtSYvS9jxNzRILkRdOUdQVRaXaHILCh5LnhEcnrlc3V9cH734g8e62k7152Gx9fN
         /Seb8YGeUNxQG3NL4q5XYNZEUHKWcC7SB1x0oXA40sZbtV/Mb/qvqIPsLQxCik+ZbXuS
         dV00ca0zLSTvszl2A70p8wOKijAPTmGtvmywddRDl3F9VVKq/zef/X5iQny2xTn6tLC+
         XxiOvDKSRSA/IQ/oWR9U6c1QIfinuqaDB+agCf/4RWcmxHCUzIztu87Q3yGst4KJd9ic
         BxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x4X5CmZAT1pVZBOn/ctm5Alifxeb/7sxa5gdbd1aUPo=;
        fh=13mqWPZWlEceXDqgHcTUxlCZPtYWTYPJWT6Un/V3qyw=;
        b=FFGwW2ZNz9RuTFE+V4jqhUzZ6WpxKji+3TUUF7ByiKUiBELau6UZQS+uXe7pQOk2gc
         6IVMUPZ3TGcTHnRSlM366R7a5dqO3dFCs4lyxABTkNMW//5IeicrKP4C77EUppKmNHe9
         gL9BOSW6juDmxnFT9pCgxsXUhUJyLyCmpxtTYfk876BZa/ljeBAK7FS8ZFhPX9vdNORv
         AqfCdU5j1Q5vItslodVsjfkB6ajQcTFfcxiC9lwIt2+CSQ+M23Cb26kmRrNuzOJeahW9
         OUx7byRb/qhmZlriWDSvDfEhmiIieOs7+6Wt45r3BJhRXF825lDEDHshCyEjPBEnUp+L
         PIrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748125; x=1776352925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4X5CmZAT1pVZBOn/ctm5Alifxeb/7sxa5gdbd1aUPo=;
        b=O2PxuV1IbU3qNEACyWmEOH1M9p9bVfznNpOoN/mBF7alEmGQKGoErxdPCxprgysJkq
         X/80XAsnAOiddH1v2FGRgL89g3KkNxqqbnIoJDR745SIn1keFpVQXaw7bZzX1nPQ9Dvd
         tdzLEGVmo1U1myLUj+uOZrviftO2o80+EJ6CVFUiyEMFLeTpoNMWeBW+rDL2NQxL+dT+
         MaoQPhns3t8Y/5O2H3jwgJ9qaGTUk9zRxgVR0vKxaJdALFhGK5rW8+zmtwqCnp8n8pCY
         B5I/nCb0wICNiSTNkKqxXYe5Rs68lnwxNJ76gk6QH3MwEOsHMiFZoJ+GkIPj7SOO41Bf
         H9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748125; x=1776352925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4X5CmZAT1pVZBOn/ctm5Alifxeb/7sxa5gdbd1aUPo=;
        b=lKca/wx8b6GMQ5+VRi71cs9BJUofgMbYl4IV5PbhpEc5L6p6cLxw3/gBScsn1vKvrb
         Dp2yVw1PomLz5nByLshofGjwTPCD5KbzWxbV5J4FXFSoL+9rxmlp4zSaY+kBeV+SS4W5
         Cted0ItsaBTEdbpuuEQwFVUalOcagTdl4drHpZGDeHomNxje9buIqJhaX2PO3/WBFZ6L
         bEWjSPqxplX38OhY3h0eWqiqqKV634+hLX1M4c2x1qaP781l2XyguBtLg8jEYJmHIwoq
         ht2gm0pVzOIhoDygZaVyLu0C91qWfQH9GAaWGrFQuYRQECkLDC9HbURpy+YauIQkLBJQ
         MPRg==
X-Forwarded-Encrypted: i=1; AJvYcCX4OokGcnp3JdAR2ryb2xDYGEXF2W8xiiUxbtyCNHj3ZbWW2luZt6kFrmGK6YOTFyimCgsRq1BbIr9ERyBa@vger.kernel.org
X-Gm-Message-State: AOJu0YypSIogDyzjWMrTQ3jn6jEmvaZKesQUcX2ghRZUBbvSBRKPjwFF
	ZZ453jFoLi0DHx4nDVqhSQlrdeh6dF07yJ81lTP4q0dG1aCyAex6bcDlTbAV/Cqc/IK/b+fG45V
	26RvkEcM3akTvXE0tle9MzI4R5zEOJA4=
X-Gm-Gg: AeBDiesiZz87nfBxM8HpFwUDKi/4VchUQXa5YVcZSWGLDL3shpf7rzjXHFZiwhVpiBD
	M5wlv4fmhHfcCBaS9NZHs70yfTZ8k4LHq2yLGZpMkZgzQDUjgv+YoGIKkaAnCFG4Bs7QgVlWgFO
	v1HPi2yjDLnXMPG7HMjW7g5zBReyGh81GIPsIkWKcQ44J88mwlP/So+dsuFURw/0RAzulXZFJZV
	dV2IGvccnSA9o77vWi6v83cZnmgZiqwkvrpKH/Qkzqvw1qS+tBcWtRCUz+KNJFjB1bXi0T9msNa
	eYTn9LLy0g1PyIsh+N2EPAR2X048we4K/qpItJEll3Ims7rVU4nc+ZJPzfr0x03QaHU=
X-Received: by 2002:a05:690e:438b:b0:650:3396:52d0 with SMTP id
 956f58d0204a3-65187573d7emr2456882d50.13.1775748124653; Thu, 09 Apr 2026
 08:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260409112233.3326467-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 9 Apr 2026 11:21:53 -0400
X-Gm-Features: AQROBzCmtoBFJywFV2obk7F71rv-m4o5gJ80-OufF2THW4vlYHJC1HnPRJKppvY
Message-ID: <CABBYNZL25=Q6cR5HKf202D61oe6pYL-2NR3vb32ja+5W6xQcXA@mail.gmail.com>
Subject: Re: [PATCH v5] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102503-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 65CD63CC908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuai,

On Thu, Apr 9, 2026 at 7:22=E2=80=AFAM Shuai Zhang <shuai.zhang@oss.qualcom=
m.com> wrote:
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
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes v5:
> - Replace clear_and_wake_up_bit with wake_up_bit
> - Link to v4
>   https://lore.kernel.org/all/20260327083258.1398450-1-shuai.zhang@oss.qu=
alcomm.com/
>
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
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index c17a462ae..9fffe665b 100644
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
> +                               wake_up_bit(&qca->flags, QCA_MEMDUMP_COLL=
ECTION);
>                                 clear_bit(QCA_IBS_DISABLED, &qca->flags);
>                                 mutex_unlock(&qca->hci_memdump_lock);
>                                 return;
> @@ -1186,7 +1186,7 @@ static void qca_controller_memdump(struct work_stru=
ct *work)
>                         kfree(qca->qca_memdump);
>                         qca->qca_memdump =3D NULL;
>                         qca->memdump_state =3D QCA_MEMDUMP_COLLECTED;
> -                       clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
> +                       wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
>                 }
>
>                 mutex_unlock(&qca->hci_memdump_lock);
> --
> 2.34.1

https://sashiko.dev/#/patchset/20260409112233.3326467-1-shuai.zhang%40oss.q=
ualcomm.com

Lots of comments which Im not sure are really valid, but one is
considered critical so we do have to pay attention if that is valid
then it should be addressed.

--=20
Luiz Augusto von Dentz


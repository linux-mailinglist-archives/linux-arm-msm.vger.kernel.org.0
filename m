Return-Path: <linux-arm-msm+bounces-105254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHjHDAQw8mlvogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:21:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B3497A95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 18:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2209230866F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABB4406279;
	Wed, 29 Apr 2026 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmgGSNHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59363402BB1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479309; cv=pass; b=jF/5cio99Yv858DvfswRm3nF+RTozCqYxW7WhnhYgx2TIDukvtg5wePjW1DXVcWpHWHJPlozEFh50RLQYKk6bxhT8qUO4VVr78eAALV50c5OlSOLOma3VlOjkUASRLsmDXxmWHY5xN1mz9LNat/MQgEH7dufdAT92amDQglon8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479309; c=relaxed/simple;
	bh=UPLJnzuRXE0jM27gAHduCD71+a58v9ckdqbBE9VNhs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6euw4PnA8sOZmQieP+G4EYbmCxnLSmMY6Lvpa0+d2JWwB3r4ShiEyOjWt+pODyxF7RHw52ZbVFrNZXb4Y2654gPr+n81jiqmh1elA9ZN9xXTaIFtm05qIRppV7deQ/T/1D4te/t/HM7ueFJfYHv43sLCFYZSQ1e4S6JB1QgDco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmgGSNHP; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65075c2ba66so10765982d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777479305; cv=none;
        d=google.com; s=arc-20240605;
        b=gpICBYeiFAPTssN6M2Y0Itmt3QipcoHjWeuYk1/At0UJvZ/YIbYDeOxkErXxkGbAIU
         HfZ/vCjuYrtCTJGQM+ofDNnX47cqWUmK6dOJUV3Fr8WvOTRWbDI1Eli6mQJelDXm9EkT
         75J2Pg/9ug9lF1rJHjHZoIqaXNsOS37w/BY/FUw7oWOHpEu8f96tO3DnCCQ4MZnBWikh
         J8mpJntPWJbhj69o//LkCld5lrPV+9ea2u+11+WFFfkgMgQ0/O9/dv7/Dvuy8CuZ37Lz
         WR25UPPDYXKarMLNvW3Kf5lJbU2kHS6WsGAA7IBN5I9/8OuA+QrVxI3ckLno5kiKWNks
         s5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5rUkZAOipt+mPbY1AIV2H0jbdpVyPhjj9wOoigCLOxI=;
        fh=GzvduvfpqDt3JKg+UB+irDmLzIflMzEv9RmnL9fa5oY=;
        b=Rk5OxdDy93YI0YIOnvQDmgdIoFkGwxxmd6RVEeUW1psWBNYdoZIlQUKM0FdX4STP+s
         U5eTkIXV58NONMjRCK4w3qTRMP0LKOohVyWrM4KhswHkTRHVVt54n7Nr36FBzUY9vOzm
         HbGDSlVVU0HCfH8wmxyAiUefi+1+vlnQdkMhFF1lNiAuJ1lbQrMA6lYHsiYlCKNG8G56
         QDVp27MoNk5ypiQQ5iYzl6VkgiKl98tTQVJ9I2F9YqOrZnbv6bZUWQxGXvGKA5HpQ/Ia
         eUmCnyL09W8B6LyvC9VwIWwAPcjjSlqkc8Fy111/AFd+JZCBnYpaJ+5Ia4Cmv1aIAXn/
         lL0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777479305; x=1778084105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rUkZAOipt+mPbY1AIV2H0jbdpVyPhjj9wOoigCLOxI=;
        b=DmgGSNHPJQd8z9oeLhROIe3souBHmr82QlvKa8fZfnN34/t3sG1IetpDL2Sd05p/2a
         seC6ydAaG6p2Ny/jRMOJFVb3V7T9vD/yR4B3Zl+t+wQT7VQruDc5F05b1efeEhb32j3z
         xHZs3Luus1DpbA/hgDRKz//FbY3wXxSpyE71qYutyezixnRbi3Wscig7LaLT9a2q+oJT
         0H60oOewU+J++B/iB0jIGNFrEifvH3oL/1Wm+AMxeO5c8z1L5M2EY8luYcQBCRJ0ZG8N
         9aYslUm4oGpgCr0EJNyhF0hgCJG5mNnrMvolVJzscmQfNrq6kt5yEuDqoXmH92AjqAle
         qysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479305; x=1778084105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5rUkZAOipt+mPbY1AIV2H0jbdpVyPhjj9wOoigCLOxI=;
        b=DEUNBifqjrN2F7mWM1bRAnqW81GQMptBEbY4q2MonwyAUIzIuNZBoz5jUKjF05ksjw
         +fXv0n5Ka9OQ1xVUSbQoA8wLocaO/kjgeacg0WvOrsqNNdou/AWWVUpPzBcljfTLMbMI
         l75nwrO4RN4R+4fYMkT/nTWDBagbOb8bPr/8NbnYHsRyPTFOZoihUtUzS3Gph2hOWmbj
         0oxVqMT/7WWSfjx1BEYsSnYzUOCsIKKOcKUaOrfZV7cV0sE1EMWnO4oxi2VDJgkqrySw
         s7f9IMOWpz3CipdJuwA6z2+h2DAzENLy/FCl6LJclrviWfoP9nmJ3iqdcrQN2P4Rk2nL
         sfzg==
X-Forwarded-Encrypted: i=1; AFNElJ+tz4J9wg3JyE3/uABzS0c84w8wXvlC7hfgZYAwO1AhGtb8mqsidcCkr4JelMRimGh8XZN000Nftbk/iXk4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HGmzx8ntfMFCL5ftkk2pmFi4UPH5pX8c+KZsyslZFjT9vyiL
	dXu+H5Hxs5sV6sQhNi/xycqpKKFasJiq4C5SO1OQtQKPi9xuRZcCvXou3/LhXcOp6aYwpxLERF5
	yEwByb6h88rVVSGRDAgLjCODkPmRd4WY=
X-Gm-Gg: AeBDies8Ht3lHkyve5975vzNVeDi0xvC6DZ1m7Py1YVuVLi7gL/gwfVHJHEVEVFY9qD
	jtYaVYtmdiMuChc9PzkQHzpZzMKPeoIk/cxSil8rehWYqkitzJjhvY2PC65ovbkhLPcGx5CLAQj
	aDxOUWY9GCBSPzzWThj/UYq1f8Psa1SHSVrilKCRPNkswoWv1SswVMFEqoiGGLU1FJ6WLC7RKeC
	mZ/R8NULX/e7ziS18MZAZId/ejD6UoYFw47EAmockvJPgba55gzKhSC16T00hmMwaJy7rF6gVHW
	T3LgW7KdFxXrmeCkNP7qTEvnqiq48LGkF7NGgeaYC3FWREcncpfmY4uIv+tokC8G7OdoOipHVG/
	X6PDc
X-Received: by 2002:a05:690e:4253:b0:651:c71d:8a4f with SMTP id
 956f58d0204a3-65beee95f1bmr5622309d50.51.1777479305063; Wed, 29 Apr 2026
 09:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com> <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
In-Reply-To: <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 29 Apr 2026 12:14:52 -0400
X-Gm-Features: AVHnY4JV2GGTpDCEOLEPMF8tGxsFSpeGXdY9sYwkj4hNwRvxAWwRpBteg7c9K1E
Message-ID: <CABBYNZKbVT2xXqedwoenuU0YroJO-3gyhJGSixt0zvodLez0qQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CA9B3497A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-105254-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sashiko.dev:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Shuai,

On Wed, Apr 29, 2026 at 11:17=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Shuai,
>
> On Wed, Apr 29, 2026 at 8:12=E2=80=AFAM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
> >
> > The Bluetooth host decides whether to download firmware by reading the
> > controller firmware download completion flag and firmware version
> > information.
> >
> > If a USB error occurs during the firmware download process (for example
> > due to a USB disconnect), the download is aborted immediately. An
> > incomplete firmware transfer does not cause the controller to set the
> > download completion flag, but the firmware version information may be
> > updated at an early stage of the download process.
>
> Hold on, if the download has been aborted then the version should be
> reverted, or rather just update once the firmware loading is complete,
> so this indicates there is a bug somewhere that needs fixing, not
> worked around.
>
> > In this case, after USB reconnection, the host attempts to re-download
> > the firmware because the download completion flag is not set. However,
> > since the controller reports the same firmware version as the target
> > firmware, the download is skipped. This ultimately results in the
> > firmware not being properly updated on the controller.
> >
> > This change removes the restriction that skips firmware download when
> > the versions are equal. It covers scenarios where the USB connection
> > can be disconnected at any time and ensures that firmware download can
> > be retriggered after USB reconnection, allowing the Bluetooth firmware
> > to be correctly and completely updated.
> >
> > Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> > ---
> > Changes v2:
> > - Update code comments and commit message to reflect the correct logic.
> > - Align the commit title with upstream conventions.
> > - Link v1
> >   https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.=
qualcomm.com/
> > ---
> >  drivers/bluetooth/btusb.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 572091e60..70abbabea 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct =
hci_dev *hdev,
> >                     "firmware rome 0x%x build 0x%x",
> >                     rver_rom, rver_patch, ver_rom, ver_patch);
> >
> > -       if (rver_rom !=3D ver_rom || rver_patch <=3D ver_patch) {
> > +       /* Allow rampatch when the patch version equals the firmware ve=
rsion.
> > +        * A firmware download may be aborted by a transient USB error =
(e.g.
> > +        * disconnect) after the controller updates version info but be=
fore
> > +        * completion.
> > +        * Allowing equal versions enables re-flashing during recovery.
> > +        */
> > +       if (rver_rom !=3D ver_rom || rver_patch < ver_patch) {
>
> As I said above, this sounds more like a workaround. That said, I
> wonder why it would print an error if the version matches, it sounds
> to be that if the version matches it should just skip and consider it
> has been loaded already in case the actual problem is fixed by setting
> the new version only when loading has been completed.

Btw, the following also seem valid although not introduced by this change:

https://sashiko.dev/#/patchset/20260429121207.1306526-1-shuai.zhang%40oss.q=
ualcomm.com

> >                 bt_dev_err(hdev, "rampatch file version did not match w=
ith firmware");
> >                 err =3D -EINVAL;
> >                 goto done;
> > --
> > 2.34.1
> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz


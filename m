Return-Path: <linux-arm-msm+bounces-105238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKuUCHgi8mlmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C499496C55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F042307F546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9B1377ECF;
	Wed, 29 Apr 2026 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQUGQkI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC78376BEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475839; cv=pass; b=S4Kaw3fYJJwZfvpy2inAeCvbHZH9BZ9z6tJJqcXITsu18u/YpOvOa1tOqlXEeLwoX1SrgproWjtWzPqfll1FpAarCRZINtAtngztz2dlFaACZ2Pveuf5XLafVdDCoGob2HBhLOftOMK3JNp3Efj57zBVKREY9FOysQMfFb4qF/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475839; c=relaxed/simple;
	bh=gesnTlu4hyV6gMLS6l+n+8XkG7Hw50kNCrHbJ3tSTGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7aMaUisEiOBol6FD9nlbpx3ULiWOc/XnB3oNmR/9xweqSyxN9wJt6bQ6PRkEQXfeFQMP98x1zrIVDVq3b06wxywLUn8jFmV5Q8aZ9x80HdJlrbGaJpVMtrHjXKnaQ9TM7+Vw2WG4pe3MVHLWA6QxNPV0if+8icsIztTWgHvSJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQUGQkI0; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-651bf695701so11677084d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777475836; cv=none;
        d=google.com; s=arc-20240605;
        b=CpTaKobcCcM8BB5ACuTxSxobHm0db+5OmJUVj15x9mM8F9hSRTIHioMhddgOUBXJR+
         HY0KB/o6z01Y+4j8RwhvT23oTbbV4FvmFGa6WeWuAopx4pbJJP1iWRXCfQ2EI6CwVC18
         BItTAl4CoZoud43DV1+M7I94Bys6jC2m58ag6KkWOOFwgYsEoX71dPmj6p/1zTzM7ZCE
         dfv2zHa8R04MX/BNuw5xUU629IrnwCg8wXpAB0LNr9p+t7pFSSrlLgLreuA5GX+kPXai
         UEG0uh5y/0IqEoGtrGIXTjD29ubpSzpEmJ+wrlceovFZ34SldTqUlaZckbN/HuzgCvdu
         +46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GrVlJCjs35rXK/giQ09CcK1pSolcwhKpHybH7qA5Bzg=;
        fh=SvhhQRK8SMYbN7m9h9gcB53DUqx6JxooXHwTlR73lF4=;
        b=PdbugUNdXXNTCZ/pMuIiZQ95gdS3z/vzhpxwft26K8UbVqotvkG67C4BTpj8v06PD0
         UHyvJxjHfTUTwjJUHNnV54XOebTedw2+8Qs8oviMvkm0y1VPiTrfQGKvxzEFxy7Zgsrq
         qXV9mPW81ShcaitVERs7CRVzNq0V8+CmO0qkjzBjuxmMjrrEb7Y9DYqnCyrsFbuh6utj
         7LAirF4lq3Ap6EQLIQ0CNXKk2zuTQTpa4Il5XNYra8lxHB35/YaGG/UjgKRK7z7Trdt6
         tM5ejrZKl0pl7sXXLc6iiH0+0wWTOaWzgfbJPQ8R41zKnZPEzXLJIh5JTwU4LNhwaWnZ
         CJrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777475836; x=1778080636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrVlJCjs35rXK/giQ09CcK1pSolcwhKpHybH7qA5Bzg=;
        b=GQUGQkI0zEaLhVvk7XsVMUeqdNjd0rwyRM4Qp3SCWKS/nriGZK2aoBMYYhjQOc44Yt
         Kom0EaAWZPIRcQ0Z8QknpaxoJUtfeRiNc/4CY/s3QDX1S8wnzRCn7gIwMV0qQ2T7Olwo
         lTvSbly4973S9tLCkF/ihkZST4Xe+Jm8UxFdVApDBNrmm8uCWWlcNLQhu/Au+Ev7OsYI
         F4TbhVSFwsFmpLmYmLrdqPaz6+djug+qk4MTXtF+1Jutq0QzMGZN2Xd7i9RJaqh4ccP3
         mc7IgbJ3zO/5ZT/YHLTqEJv7I5G2SoFBXD+jrSirdzd53Er4asZo0iKP+gZg1O05x1my
         Sjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475836; x=1778080636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GrVlJCjs35rXK/giQ09CcK1pSolcwhKpHybH7qA5Bzg=;
        b=H5WhTTtFxHh3XYlV2zSurwHQ2aaR0yzuwHJvMRyqBQGVRD3i0qG++eOzXSlfLbOeZT
         NPJE5va34UucWkJa0DNUIAh0ZsBwrjZ9nwpyHz2zTkhQBy4sO3qlNNaa1WZn45++FFon
         vTP1afdt39nEAnGbtk/y0B8w7lLQNEmKrgwk6lSh1UiV0YgOXlGYnCL6B7PgQ4mGGqqt
         vVYxiZKjpnacUNjTbIZgfijmItHAt+2nUCJFemEo5g7lpHJNnpw3RDB7Jv5oC16hRCPb
         APQH1cfswa6FSng4HfepTeC1i/z9/Sv6W0d8SBWC197lSM/+Pf4l4PVpWGveDjMXKmId
         fseA==
X-Forwarded-Encrypted: i=1; AFNElJ83hMe0zztrnDsj8mR4VwwtSMwHpXQrDkAsYn5puW+2k7CDv0ETOU6FIj1iF06QhrOXmVFbICSRgv3i/nL/@vger.kernel.org
X-Gm-Message-State: AOJu0YykdqYkdISjDl9iLlLonCobJD9PRbaxxbgySH6LSdgLzKQuE5Vt
	K7k7NVsHWZTKvA9/b1/W7ywIvxvZoYUNEMTQtAe3JXLImHwMznitJfC95teJ6H1gNDSm+HFFNcF
	NQzRmehdYRg0Ed8yUukWGRag0Cp0GtFw=
X-Gm-Gg: AeBDieuoxjfSYOoFNWeRvX/pgg+Ze9MM/1r3UksmjzfYzZDA+0pkxyA9cUlZ1zHqUSu
	yvrHjkP5C0oUOu6x8RF/tunGqzApNU6OQNy9XKBDcMSO//V/kAK0+fv2I8h+i5tlrOZFp25Miqi
	svbIkW4MZP/8U6CKpCSRJczoXfnucJRn2YJWE/SCD3oYMAst6jGFSIt0I7IiyA8n52FoZZ/Sq6K
	lMw9d8zDZUJzvbWFUpwry6MfazuSL+rYBUK7I/n7FTIFOHnAE9DVpCky3KFn58XcJgW6Xp1E+T/
	EekArJe9sGoK4uCI+hPpJ8lJv5z9b/42d6pCd2R3fDTSiy25j2CGU559hMZFFcWa7LSIdzLxZ7p
	AHFXSLOclDyacki0=
X-Received: by 2002:a53:bc8e:0:b0:653:11d9:b0c5 with SMTP id
 956f58d0204a3-65beee816c1mr5399415d50.46.1777475836382; Wed, 29 Apr 2026
 08:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 29 Apr 2026 11:17:04 -0400
X-Gm-Features: AVHnY4LLCGwmWY5t5Yl8gvjRfu55DEoQrqy5OttPVCrNQjYv-xFl1m6ozfxW-Zc
Message-ID: <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 9C499496C55
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
	TAGGED_FROM(0.00)[bounces-105238-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

Hi Shuai,

On Wed, Apr 29, 2026 at 8:12=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> The Bluetooth host decides whether to download firmware by reading the
> controller firmware download completion flag and firmware version
> information.
>
> If a USB error occurs during the firmware download process (for example
> due to a USB disconnect), the download is aborted immediately. An
> incomplete firmware transfer does not cause the controller to set the
> download completion flag, but the firmware version information may be
> updated at an early stage of the download process.

Hold on, if the download has been aborted then the version should be
reverted, or rather just update once the firmware loading is complete,
so this indicates there is a bug somewhere that needs fixing, not
worked around.

> In this case, after USB reconnection, the host attempts to re-download
> the firmware because the download completion flag is not set. However,
> since the controller reports the same firmware version as the target
> firmware, the download is skipped. This ultimately results in the
> firmware not being properly updated on the controller.
>
> This change removes the restriction that skips firmware download when
> the versions are equal. It covers scenarios where the USB connection
> can be disconnected at any time and ensures that firmware download can
> be retriggered after USB reconnection, allowing the Bluetooth firmware
> to be correctly and completely updated.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
> Changes v2:
> - Update code comments and commit message to reflect the correct logic.
> - Align the commit title with upstream conventions.
> - Link v1
>   https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@oss.qu=
alcomm.com/
> ---
>  drivers/bluetooth/btusb.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 572091e60..70abbabea 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct hc=
i_dev *hdev,
>                     "firmware rome 0x%x build 0x%x",
>                     rver_rom, rver_patch, ver_rom, ver_patch);
>
> -       if (rver_rom !=3D ver_rom || rver_patch <=3D ver_patch) {
> +       /* Allow rampatch when the patch version equals the firmware vers=
ion.
> +        * A firmware download may be aborted by a transient USB error (e=
.g.
> +        * disconnect) after the controller updates version info but befo=
re
> +        * completion.
> +        * Allowing equal versions enables re-flashing during recovery.
> +        */
> +       if (rver_rom !=3D ver_rom || rver_patch < ver_patch) {

As I said above, this sounds more like a workaround. That said, I
wonder why it would print an error if the version matches, it sounds
to be that if the version matches it should just skip and consider it
has been loaded already in case the actual problem is fixed by setting
the new version only when loading has been completed.

>                 bt_dev_err(hdev, "rampatch file version did not match wit=
h firmware");
>                 err =3D -EINVAL;
>                 goto done;
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz


Return-Path: <linux-arm-msm+bounces-108747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJoMIYWuDWr31QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5D58E3C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEB48310D5DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB433DDDBC;
	Wed, 20 May 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C59doYWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87AE3DCD9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281140; cv=pass; b=LgFuYIs+hvJVtE0apDc1Hg2g+0qcVhsMw3rd4yANOtdKPv72ZCgo86OjwFvXt4wXt8InpM06aGqXhGn1e0/OkW/PLoOjZ+GefnoMLU/mb2hNDoocxBSajKiK1LNjGm+6IDmMcaRoCVAbc1DD8amu9hgMk4/LtlYFtL84EYYO84g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281140; c=relaxed/simple;
	bh=Zr6fDgtgqQ608ihSJ4zPlo5bJFSyQdqQcxPawOC0o4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFRUfxbDMKsOPw/h2Z+RA2yfrE06eQUF8oSrWMeudQpxvyhN5ilp0NOV2O3cPXUNy2jqUzfP16ivy0Ma+tN/43aICiJKA3l6+am1YH5v41V71S2eTLBEWnoGyOQpm6D0Jg3fu4r/A4iAZiYe/T6hcnLH6ZLoKGMVMGnzOGqHbFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C59doYWf; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65dead17c24so4496769d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779281138; cv=none;
        d=google.com; s=arc-20240605;
        b=gJDMPtRqZADlxmBkXAsgUR9s5ObbuazpUOFVtWj4vN9h1WvbEIauwV70mQncYj1s8x
         jGAg/HdQP27pnJIt6rs8ysfQlKmhIUsI2eNWL2P0oS0kRPK91JFIiE2J6RI6yFsd8tR1
         PbkP6X1BkIF5eq49dS9jmOo6q08BZ8O63NUbvnLPpfC0htgRHwT6Qa64iQwxeX0Ji9Ed
         Wwyvxy7jsZWvdnXYMAUCg7fVi1Hz9G0mm9uHZVreuWY8xQyytGN6cGqB1Lh1c0c7yM7Y
         y/PEUMl3Exqpmoiq3NyYgKxYzlW9ZMDIhOyqZpevQG54RF4ax1KcE076PWoktSGHptkf
         onhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=owE6/rk6CV8oIG5RVGVmceXWUUptpiMPhTe83gMGqsk=;
        fh=NdfQkw5N3iVy5dYFu3H1P0z/+lzyG0VsQrn7v4C9m8I=;
        b=QjJO6mc8XlVpSiP4YaQKpWEuYZqll0q+pgLsJ3naBohuiJ57VQSDDagW4hyNIq06LL
         ffNMbK9CcTv1Fu72Xh7qg0Y69S9WT+8f7c+1vaF4PrsXEA671WtsNfrwymqEU7EKwsFI
         Q0FvosGxhTTUmlYGn2uqWSDd5PM09uPBNiSW1hMey0YEgX/Sx2vpuY5AAgy0TmA9kYBf
         0C2YycGgbr6/x2PcAdPeUIiGVD5mkiTp4oGoYmeUscgieZ9z0iEUMH+uedd5DCH85LeQ
         XZTVpEjqHjmUZhlyeMp9HnIJgL/KEKqcIMKghNmXadobSIH3dO0mSo5yu4MOB7xz/Dsp
         Pb6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281138; x=1779885938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owE6/rk6CV8oIG5RVGVmceXWUUptpiMPhTe83gMGqsk=;
        b=C59doYWfAs/TqTaHrPNRY8YydQQJwKmlmax+EbsBH6HWM0021uc5j7Za6g61yvL8AT
         RfXRJWjtBVV7FIexpH5bvLtQAqG/Nw4rEpccNM1rK4uhFT5rGaF23xjI5A+WAMG/G9U2
         8QekOqfRawtDifzQ/HqTNGl584CaS52ZNu6WNe34xyDNm6uJinIW9ww0VtlGZvQbxr71
         cJDEL2lSReg4LPu1q1s9hf8NH7GIdir3xgcnrco3hOkWMTHbkqKX2G36njsALVrbFMSI
         uMj0hh3W//RD0tyYVrUqtctbY1qY4l0t8q47R1yAW69QZWsgpoGD3QconFYCS1SaCm80
         nzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281138; x=1779885938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owE6/rk6CV8oIG5RVGVmceXWUUptpiMPhTe83gMGqsk=;
        b=iFzJItd3e7SOAMoVrEqPw/FPsa9Dw6GsOS/T6ivylGmUDXqe08GUvJbirFw+boJ60E
         9Yez/VmgkMn0Ps+vwzZwlY3Dx4V+G2wySOGWX37euDt7JNfmhrkANXa2agphvaZSDasR
         MFbvbN0GDv1Uq3yxksHaGnmTHbx7zmt0Z3aF6zq2Dt+1tU/1a2N0Z55k0TjJJC57p//d
         Y4b0qHXQ0+kxpKvszwBlAV4eZRJQIgERFjuPSZeiLKTAsrivhJ22HuouXEq2UKu6KG36
         KUMN/efxKPdpqG1Fz2Vb8Ks3OaeD1ncS7BqLecwS+zVuf5GyJbiG0X5GAvNz9IIB4JRl
         TphA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y1xC7zc7URsRsGLcTXeUicCaw6y+nu6YfxdwF974BooMUHshoYoWfesg/QU8NMhaC/XSaWphvbwGIGw2z@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqaH9hy8cSwZoLoRW5PZOmJYSDGgRPZItQaVZNKZmkOz7VHCC
	kElJAhuRpJoZ90RokczMox34pFDPb9LG5Ku7Bs7Ney1UdBjUQNaS15HOv+oz3b7nsdQgEbzcNbm
	EktqMIehqGePC099yFIR1nWVAgwlIzs8=
X-Gm-Gg: Acq92OFxedz27pVYR0UdpmbVXdHJwTW6ksRjo3roEXBPMzZJDl2L35//LwZrJReeppI
	jPqPK3suSm771HTxbNryLjAPP1OEXlmpFA3R9g8kxzSldrW58Q3iKZDrPJu9myDEGPNFgI9tdM2
	2MiZ/vrnfB1heUGmxfdEIN7A9ZfjfmsiQcuBO/5XXX2yQmCVYziILB6wkYMNO02rpX9KG3MDSC7
	QhNS9l4Lc2DWZElnzmULnTZEEznvFczW3f+hSo2iEoTahXb+i+3RU7azBQbP4ZGbND50M3P0Xge
	qIc0zsrKXvoXl9772UuMRia6b9etsRvIgnf6+c2dFNYhBeusaa0LLHhFPp9RM8pAcASJzw==
X-Received: by 2002:a05:690e:4290:10b0:65c:2208:8c6a with SMTP id
 956f58d0204a3-65e227dfa70mr18799613d50.42.1779281137588; Wed, 20 May 2026
 05:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429121207.1306526-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZLP+rBrjhdKJLE7N47Bg-g4-6E3vS3yZXvMKwYQ2rMcUA@mail.gmail.com> <cf77b8bb-5427-4d0c-b212-51947704378a@oss.qualcomm.com>
In-Reply-To: <cf77b8bb-5427-4d0c-b212-51947704378a@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 May 2026 08:45:25 -0400
X-Gm-Features: AVHnY4LANykzFlJjohSPf1MUwg4Jd1zV9n22FmYZBRYzx2u9wrls38xdDxN_sf8
Message-ID: <CABBYNZJpW8=KtN9_G2QOp1YqD3ZJhWGVriyLBh7jUGRFEHPyYg@mail.gmail.com>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-108747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: E5F5D58E3C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shuai,

On Wed, May 20, 2026 at 2:26=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> Hi Luiz
>
> On 4/29/2026 11:17 PM, Luiz Augusto von Dentz wrote:
> > Hi Shuai,
> >
> > On Wed, Apr 29, 2026 at 8:12=E2=80=AFAM Shuai Zhang
> > <shuai.zhang@oss.qualcomm.com> wrote:
> >> The Bluetooth host decides whether to download firmware by reading the
> >> controller firmware download completion flag and firmware version
> >> information.
> >>
> >> If a USB error occurs during the firmware download process (for exampl=
e
> >> due to a USB disconnect), the download is aborted immediately. An
> >> incomplete firmware transfer does not cause the controller to set the
> >> download completion flag, but the firmware version information may be
> >> updated at an early stage of the download process.
> > Hold on, if the download has been aborted then the version should be
> > reverted, or rather just update once the firmware loading is complete,
> > so this indicates there is a bug somewhere that needs fixing, not
> > worked around.
> >
> >> In this case, after USB reconnection, the host attempts to re-download
> >> the firmware because the download completion flag is not set. However,
> >> since the controller reports the same firmware version as the target
> >> firmware, the download is skipped. This ultimately results in the
> >> firmware not being properly updated on the controller.
> >>
> >> This change removes the restriction that skips firmware download when
> >> the versions are equal. It covers scenarios where the USB connection
> >> can be disconnected at any time and ensures that firmware download can
> >> be retriggered after USB reconnection, allowing the Bluetooth firmware
> >> to be correctly and completely updated.
> >>
> >> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> >> ---
> >> Changes v2:
> >> - Update code comments and commit message to reflect the correct logic=
.
> >> - Align the commit title with upstream conventions.
> >> - Link v1
> >>    https://lore.kernel.org/all/20260108074353.1027877-1-shuai.zhang@os=
s.qualcomm.com/
> >> ---
> >>   drivers/bluetooth/btusb.c | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> >> index 572091e60..70abbabea 100644
> >> --- a/drivers/bluetooth/btusb.c
> >> +++ b/drivers/bluetooth/btusb.c
> >> @@ -3550,7 +3550,13 @@ static int btusb_setup_qca_load_rampatch(struct=
 hci_dev *hdev,
> >>                      "firmware rome 0x%x build 0x%x",
> >>                      rver_rom, rver_patch, ver_rom, ver_patch);
> >>
> >> -       if (rver_rom !=3D ver_rom || rver_patch <=3D ver_patch) {
> >> +       /* Allow rampatch when the patch version equals the firmware v=
ersion.
> >> +        * A firmware download may be aborted by a transient USB error=
 (e.g.
> >> +        * disconnect) after the controller updates version info but b=
efore
> >> +        * completion.
> >> +        * Allowing equal versions enables re-flashing during recovery=
.
> >> +        */
> >> +       if (rver_rom !=3D ver_rom || rver_patch < ver_patch) {
> > As I said above, this sounds more like a workaround. That said, I
> > wonder why it would print an error if the version matches, it sounds
> > to be that if the version matches it should just skip and consider it
> > has been loaded already in case the actual problem is fixed by setting
> > the new version only when loading has been completed.
> >
> >>                  bt_dev_err(hdev, "rampatch file version did not match=
 with firmware");
> >>                  err =3D -EINVAL;
> >>                  goto done;
> >> --
> >> 2.34.1
>
> Just checking if there are any updates on this

I had the impression there would be more changes needed, if this not
the case than let me know, also perhaps we should consider adding a
Fixes tag since this might help users experiencing problem if they are
dual booting or somehow got the wrong firmware to be loaded.

>
> Thanks,
>
> Shuai
>
> >



--=20
Luiz Augusto von Dentz


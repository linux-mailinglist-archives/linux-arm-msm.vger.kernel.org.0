Return-Path: <linux-arm-msm+bounces-91713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ML6IfUzgmlsQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:44:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B094ADD01B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 18:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C000F3018792
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 17:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77914326923;
	Tue,  3 Feb 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfFxqrok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73531A045
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139896; cv=pass; b=Rkci61ySbG0d2fLjqUBeTWDcsZ1W06oOJcp4fLf1wcCoyosMa13Lq0OGa0854kJ+XTmo3MFJ77BpsBGc9joSp6/PcYuwBGvP1JZLTkXkKSwe10JfB11yvjeix4pN5Yq5/CDfM1mMi8jocw1H+J2yH1HL8gOOhks5k9NEnHB8eHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139896; c=relaxed/simple;
	bh=utyrFtfNtewocQ8me8HVWvYwYp7dnSAAinXkGfI4czY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS8E3IZ1IjEFE7FjO16y7o7vrgpIUAeDszvw5nSRq9RR2Xf50ywhQCm/PKdh9IZpyB4QFdqpP/yiD9QLxJkMtbe3veSPfhncOwEfZfYLKQbyTgByV8MqNRjRPnyb+w9QjBSJEGxhfpH0F0/uBrTYuinqjhr0zfWiB5VCIdpE9gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfFxqrok; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38316445a67so51487431fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139893; cv=none;
        d=google.com; s=arc-20240605;
        b=bKkCzXihpRykNHqDIyI2FsxRCtbnlnqDPgn2hDLbhVIzSU1s+7MMbltDx9xghcXx2m
         EqYlFI4v1jLsIusyqxPYO+TNrZgapVbD+zmoVn3r6xQ5MKDsNDGgF8ELD3jjqoGPFq6Y
         Zo3nv10xur9thtm25dddUFaVelB27/O7kTc7+K5AttZ/Lf/DYLFdQAUwwqfbPuBdOZB8
         01rlMW2h1Mmc0n25i2gLlytVwc4xlkXw7xxiH6WEFS9U+7H45n5e5YPI1Vr4SKlsXIYs
         ujjIR6fuUvzXXZ3meScJppY0aaTUOuoon5eRxt1qhe5kCZjHO49E94fpc4oRQ5OyWkir
         Qt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utyrFtfNtewocQ8me8HVWvYwYp7dnSAAinXkGfI4czY=;
        fh=tQWoptCR9ukBybEjs4K/EujaVZmF1DL7tpfWgXafXlA=;
        b=QWc6qKSihjKerLY3UNPh6ugCNzAV5lomO1C492RKUfrLdehibfGHaiAROQj7nZHOI/
         lOSDIz8jmUVfJhU7EkJ4S+M0jbjwYlcD0R04ALgLp6clM6ga03HHp3qfLWa4/KqKf7h9
         tmU6ceEM9G5yfiwo7zxhRp5bw7GhEHRvfmzFs981zKsUudub3fIAVoB0Rm8gOpfSTuP7
         ozba52ZmBpH5+wRACKlZZXbK0byH5PBTvb0Fun6WfOHyh2A5MAnh0BnNg5/wCEtQflB7
         1tbDRZkw2ltrQ3Vrm21m971RWBXeljJnHSCrSsKmxpCZ1/UTVTAIIwuQvC4xhgvaj11y
         9roQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770139893; x=1770744693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utyrFtfNtewocQ8me8HVWvYwYp7dnSAAinXkGfI4czY=;
        b=UfFxqrokyZtnugQ4zJbM6KnKhdN04C+ruWVwQtnbK4XsO6UI52dB53URaMEeTdpbOl
         Avdu8nHOzlXo/HaTIhCi19+skhakGe516CB8gRyZ8yXj+FlRTjjgMyph13Kd8G4B4p0Z
         hzkMDvXIEi7eh0vOjfNiYyYGt+YDDCZ/K3bb2ghTYZ0UfzPw84lvkWhrqy4VejQjVrdS
         IJwqnvGv+LpKyFR/nfDzUNPP23hipE5vBEdNeuQ/SLcGSx2QVHY6pgA31LjF1hIbfp6K
         Y0wCH9jamZOT+tSDuXnnhcne9vH08hOYMPxgj9hUWzMVPnXSErhYGbWhJns+vz1nZPmU
         2TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139893; x=1770744693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utyrFtfNtewocQ8me8HVWvYwYp7dnSAAinXkGfI4czY=;
        b=EPsr5qpBo7qT19/pECL5CWqJFrjWa+x/u4/T6gpQrSD3gFudfT5pClO7nLmGAPG0LS
         K4oNtxiQSOdsu7XmVmODTQwtFjhdLu+v4DzIPSxT9yHms9DbIo0vTwqqLlAHS0Qy3o4x
         3h1bTrraEA8qmZHaWlk6CCn/HXNG10XUtZyz5tHqw3CCRVLYxvvgj7f21AKSC//6ZLAV
         jZ3+yBsejRGNUgJn8G/qEOjeXWnRrKkoCfSIakv0/vydoFoD7JYpIpBsI8jEr5QqfGox
         wj1bV+U/kCQtu7ZPGxA/uxu2EEwqwYaqbbplnlYDLLyhQnkZzsNJUBuPvLUeoEPLNm1t
         R2mw==
X-Gm-Message-State: AOJu0YzTrfD2j6ycymzhPsdPirZPP7H6SgY+qbYJIugE5vxHOLj7XxNj
	O8EaIODyGy4Miq33zBi3HPOgXk3X+tkI5HPj+h5pp1mHms2R8XVfGP1TLqRe3pJoBOqMX7L6Fbd
	dO3O/2A3tFf0IouRVNpoR8nXj+IG8Zgxys8kqZsY=
X-Gm-Gg: AZuq6aLmITL3JFGJAnByA4Lu0GlowR8ge09Yc20N5uaa+qv3jHHSLlIL/VVZOl8zUDw
	JrK/Zt++Vg78iJzrQKtIW6XjzbRIUDHIcGmm+s9xqy4IUTfjXLeyD13wdd1TqDhHabq9AiIYiB3
	sUnvyGAQ1z9l8zqhPJFQBawKQM3ymmVitt1AwdceSop8yWIKqFisFqAjOQ2oOu88eFCMHtj6CSO
	lUqn3einGHxMwpmPGQjRBgxB/PIBei0DkBHNCzd5r7ObE8wzTK8wV9ka3/cSvuiMCV8/0Y60QNw
	VHnWk1RZRzBkZwuIs6PuifdFgCCB7JgLyvwVjxxxfEweowdd2FREwbbT
X-Received: by 2002:a05:651c:1990:b0:37c:cf34:536c with SMTP id
 38308e7fff4ca-38691c4c389mr1690361fa.3.1770139892552; Tue, 03 Feb 2026
 09:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com> <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
 <24f770ff-e4a6-4f8c-be72-26ff5cbf8d1a@oss.qualcomm.com> <CALHNRZ_79_SvsgeFu-n4txsRAcj5Tw+UOza12vZC0=isWA28Bw@mail.gmail.com>
 <6dc6a2ea-e812-4966-af32-96cb776717b8@oss.qualcomm.com>
In-Reply-To: <6dc6a2ea-e812-4966-af32-96cb776717b8@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 3 Feb 2026 11:31:21 -0600
X-Gm-Features: AZwV_QjwO7uWcpYrE-KTGEn6jJ5uoAMR0FsxeQJ3007gFWw8XYBqlmcds3Jsm_g
Message-ID: <CALHNRZ-N-2QPPbqT4bciqhgTyzqAa74qbsL9LVLqdX3oOOa+-g@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91713-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: B094ADD01B
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 4:31=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/3/26 12:12 AM, Aaron Kling wrote:
> > On Mon, Feb 2, 2026 at 4:36=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 1/30/26 6:13 PM, Aaron Kling wrote:
> >>> On Fri, Jan 30, 2026 at 5:01=E2=80=AFAM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 1/27/26 11:48 PM, Aaron Kling wrote:
> >>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifica=
lly
> >>>>> for Android, using mainline kernel drivers. I have come across some
> >>>>> missing functionality and failures that I would like to inquire abo=
ut.
> >>>>>
> >>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> >>>>> mainline. Using changes described in the gunyah watchdog thread [0]=
, a
> >>>>> dtbo loads and the devices boot as expected. If any of the changes =
in
> >>>>> that post don't exist in the base dtb, abl will fail to load the dt=
bo
> >>>>> and go to the bootloader menu. This appears to be an issue in the
> >>>>> baseline abl code, affecting all devices of that generation. Would =
it
> >>>>> be allowable to merge a change adding those changes to the sm8550
> >>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>
> [...]
>
> >> I'd consider building full DTBs for each device
> >
> > My end goal makes that difficult. I'm working on LineageOS, an open
> > source AOSP fork. I am attempting to make a single build target that
> > supports all four AYN qcs8550 devices. Android puts the base dtb in
> > vendor_boot. The concept supports multiple dtb's, but the ids the
> > bootloader uses to fetch said dtb matches across all four devices.
> > Even more unfortunately, this is true for the dtbo id as well; the
> > vendor did not set unique board ids for the different devices.
> > However, I can pull some tricks to use a variant dtbo image per
> > device. That concept isn't feasible for the vendor_boot partition. So
> > I'm taking every reasonable effort to support dtbo's.
> >
> > And to be fair, beyond these node name and label requirements, I have
> > not seen any breakage. Once the bootloader is convinced to actually
> > apply the dtbo, it works as expected.
>
> I see
>
> It may be that I lost some context across various threads, but IIUC
> we're down to just label changes, which I suppose are generally fine..
> Am I following?

That is correct. My post on the series yesterday [0] is my current
understanding of how things stand.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/CALHNRZ8j4XWg_oVdPTTp+RPhsEtYrjR3=
iGusACgoa76dGL0U3A@mail.gmail.com/


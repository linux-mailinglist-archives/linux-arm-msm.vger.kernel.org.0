Return-Path: <linux-arm-msm+bounces-101582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJtFL/PnzmkRrwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32238EA16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 00:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B94930222CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 22:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C85B3AB27A;
	Thu,  2 Apr 2026 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELRPOklY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E483AB28F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775167470; cv=pass; b=eHvZN2zyoGfsbtUU4baHSWjD5C+3ECGV1qMDoBreN0ov4M9JAWUOYYyI73yAwR++XRrjelm8YUBn7mdoWgMJmxynWxdtPEgWBW3Ygj4mi7MGGWcTsboCW5i7HVyPW/Nn7/N0ZHur5FHgEMe9708OI9sjk/hSy91MoJkP3hcDoWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775167470; c=relaxed/simple;
	bh=Q+knnfU7dMFDAgjTPdI3wDMsHWDR0/Dwy5tPJlLOv4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnQm/ihajK6ex8M31wrCTSRy7xwapfqLYQsF5tyGau5MSK8tbc1h/B9Hk1jzYGQKmt2+kFDl3Xd/hKlFKI+YbVqXXtJVuYBLld+tGppSV7juW8OLPGTdhO8P+e6a2GUIQmUO2HcVBLV+HUo943bEIXW+fD2AGEI9jF/gdQciEqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELRPOklY; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so1550978e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 15:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775167465; cv=none;
        d=google.com; s=arc-20240605;
        b=LN0M0T7WEEloQfmBuXuYbKnlx1768IhFos8KfahFVQjmqbt60nKAjNgrHx6fJg034D
         ZLrRMpAVBq49bdpzYTy0nv2pvl8mWR5gDQBoc9TT9rMjd2JQtVugCW18XMzMKangJMR0
         HDbeDL2QgfW62htgJaSml12+TdhHBi6yzjRmFVKYWAhthxQYGaFHiYnEb/HoZ1tcp1it
         lJszBO018MQ9rQD2LQWu3txQxuYpHwJJdljXiKSrWi/prHmks4Hk7UgSosSRglm1lQue
         WQ0ih3+MlkioJpMuWFQY2VkqAzj2uoVi66Icia7x7M0NPKOVwXMc4ZJOla/FykMiZ5cF
         mahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        fh=ZWAF8vSoZGbreofZ9MAgwegYjLjLxT9yrtmJxt94+6s=;
        b=jVT3jFP1ulmUrIyi9YJsdiIgpdY4eq5lYyUfwJwWuHg9ur0RR26JZfJSlMT9zatIRJ
         Ab/XwFBpVdmM2lb9OniEn6NOZKR04u86lxtqmIsHGbiIsUUvUQGOD3iJcOv/Jqnxzpkq
         Ovah3Wr3AU94kD34/xs397m8BFMpsYndAGadn5oqV1Rj8nMUcZhtGV2xYgJPGhmlRfqS
         umBXqz8q4+Wh+4gY6rATXhHs4dTn8UbxCSqqnlzh2fk0dWpM5bYHUS7mEKtrl05v7zXy
         mYR2xGAMT9cFxe1mhCPBf9PKaamBaCuwGdSEGQB3eDfVmq7Me2tTfh837k8hI/68WVOE
         I+9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775167465; x=1775772265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        b=ELRPOklYO7s4ZQQSc0FQuJgVYNmgqYIMkiupUiuxGyEh+TMZhKwL3yrdBruR88NHRb
         3XOrvwnJNXzGTAlE+I21ai5y3ux1WYcRsQrNrMES3MLCC7HS9FLN/vp54vJfZxRTPIRD
         IBbbaTyvbxbd8qBVLAWwzNmWLOFFuXrfHhhU2UpCvPTxNjylmsQQz4xuUAUywavjX2ib
         NDL+f8LwR23tic7PC9usZneWO2popHDCI8leGczE3NGQJEXofl9pn0ALhT4E+ZLqe5d+
         if72MNZpKUR7hUmEGgKyOO/7tE2a02fhnOUOJ5txyOCz8s1RM1JwPJjaYFMhIyYg7rAo
         vHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775167465; x=1775772265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        b=TjbxEBefFzJMtp0fcbcNGT4KgTOfD2s3tnhw9kd0JQfyyuxDw1/tALSEnRaecARzgW
         I5/KRKhguLiWU3Am9YMabIWUPFhQ79L4/2s9x7NEbrZ/J/LBrKxbJmKftCUVd96gKrYo
         cUshG4sqzR4JxFTHbmQf7782ckFnKlX4uH1P/zv5Rz+vUtTEd2QttUin6kalJ5vOFEr+
         PnIVAUwroMWbNi/KzUpr5/2DgM1sfWJM04ZRkUSBXUmKI4/w81zJoKXrbl1FHztZ4930
         m3P3AG3T8v71XXiUEm7yH0i9d6LxmsShsSI/VzwmpiCtApoZ2yEdCiQtliJ0XnsGgz+S
         QZXg==
X-Forwarded-Encrypted: i=1; AJvYcCVf26N24w5J7D/Oo7wGrXeIgDAkXboyrlskWOWH31QL1VbaOqVTA1FvEfdQvXnLRYBTh2Fg/n7WOcilO4oN@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8sypjbbor8Jdh21Fwz7CZRpopw/+T8HZf/SaW+H0yKWOqueN
	dErVtDWyY1OnEi29wfV8IqybHZ6IeKuVTNKwwcLSzfub3ACqPXki7sVy45vqJFGDjXYa4L/Rb6M
	5NPksCykIh3KaeM/bMPhj/y6BkD4ci8w=
X-Gm-Gg: AeBDieu3inKQxIyNkMswf3qn7XREfraiZ5F9+FM/CFVTg2LjtcpNwaZaiyloixZBKQj
	zwt5JIWDzhqr0rOvFN+d6cg52A8BQrkGcPFmyCyOERbHWOABexgp9GoOv9cvEKBc830qsNqEyDM
	n5LihspjK44QP4ll9omGgGUqVGJ+6MKrKMWR+aohZplGucjecb+54gVuz3ftkgr4BY3mtGIxsv7
	Gafppu5cJm8d/4nonIRHAOswgGDO67NT106GgptDl+ak+QfFa1zF6Mpw3lFqVe5tzrAzQaCyVsv
	hdGjVB1dHwck6jzIvHOBVYqEzlEMpTdzBKH6IDEydGNKG6Pb5fJuMA5Fz75IQIaYciF6
X-Received: by 2002:a05:6512:1152:b0:5a2:bf05:be77 with SMTP id
 2adb3069b0e04-5a337580953mr211204e87.23.1775167464301; Thu, 02 Apr 2026
 15:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com> <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com> <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
In-Reply-To: <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 2 Apr 2026 17:04:13 -0500
X-Gm-Features: AQROBzBYbm-XDpG7pIHU8lYphnaC1dfFr1Ege7Wlckv5ir5ZnCX1PiOmiFDEAhE
Message-ID: <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
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
	TAGGED_FROM(0.00)[bounces-101582-lists,linux-arm-msm=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,sobir.in:email]
X-Rspamd-Queue-Id: 5C32238EA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 6:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 10:26 PM, Aaron Kling wrote:
> > > On Tue, Mar 24, 2026 at 7:36=E2=80=AFAM Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>
> > >> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > >>> From: Teguh Sobirin <teguh@sobir.in>
> > >>>
> > >>> This contains everything common between the AYN QCS8550 devices. It=
 will
> > >>> be included by device specific dts'.
> > >>>
> > >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +     sound {
> > >>> +             compatible =3D "qcom,sm8550-sndcard", "qcom,sm8450-sn=
dcard";
> > >>> +             pinctrl-0 =3D <&lpi_i2s3_active>;
> > >>> +             pinctrl-names =3D "default";
> > >>> +
> > >>> +             model =3D "AYN-Odin2";
> > >>
> > >> Is this enough of a distinction? Do you need to make any changes to =
the
> > >> one with a HDMI bridge to get HDMI audio?
> > >
> > > After this quesstion, I tried to verify hdmi and am unable to even ge=
t
> > > the connector to come up. The lt8912b driver complains that the
> > > connector doesn't support edid read.
>
> Looking at the driver, please drop lt8912_bridge_edid_read(),
> lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
> lame and useless.
>
> > Which per the current connector
> > > node is correct, none of the devices list a ddc node. I am trying to
> > > investigate this further, but vendor source release unfortunately
> > > appears to be missing pieces related to this. And no other current
> > > qcom device uses this bridge to take a guess at which controller the
> > > ddc is on.
> >
> > Go through the I2C buses that are enabled on the vendor kernel and try
> > inspecting them with toos like i2cdetect
>
> I'd second this suggestion. The chip doesn't support EDID reading, so it
> is (hopefully) handled via some existing bus. Does downstream handle
> EDID / HDMI at all?

I have been unable to get the stock OS to display anything on hdmi at
all. The downstream kernel reports the head as DSI, and is hardcoded
to a 1920x1080 mode in the kernel dt. We have been unable to find any
kernel handling of this bridge at all for downstream, in the source
release or the prebuilt kernel shipped with the stock OS. Best I can
tell, they just hardcode the one mode and nothing else will work.
There are reports of hdmi audio working, though; which I'm not sure
how if the bridge has no kernel driver at all.

All i2c nodes used by downstream are already enabled. And when an hdmi
cable is plugged in, I never see the ddc address, 0x50 if I understand
correctly, show up on any of them. I tried enabling other i2c nodes to
check if anything shows up on them, but that causes kernel panics
during boot and without uart, I can't see why.

This all seems rather broken, perhaps by odm design. Given this state,
should I just drop all references to hdmi and leave a comment in the
dts where the bridge should be to explain why?

> >
> > >
> > > On a related note, I'm not sure hdmi is covered in the audio topology=
.
> >
> > Since this is a DSI bridge, I'd imagine it needs a separate connection
> > to the SoC's sound hardware. We've had similar occurences in the past,
> > e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):
>
> Yes. Unfortunately, the driver doesn't seem to implement audio support.
> I'd suggest pinging Lontium for the information regarding InfoFrame and
> audio bits programming.
>
> >
> > https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm=
/sm8250/HDMI.conf
> >
> > Maybe +Dmitry could help you out
> >
> > Konrad
> >
> > > What I'm using is here [0]. This is in a fork of the topology repo
> > > with aosp build rules added. Speakers work, headphones out and in
> > > work. DP works only with the pending q6dsp fixups series, which I
> > > should probably narrow down and ask for a 6.18 backport for. The ucm
> > > config [1] I'm basing tests on doesn't handle the built-in mic and I
> > > haven't been able to figure that out yet, so that's also unknown.
> > >
> > > Aaron
> > >
> > > [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-top=
ology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> > > [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93=
e9560e8d9e08a024cc84c8055bb7eb9
>
> --
> With best wishes
> Dmitry

Aaron


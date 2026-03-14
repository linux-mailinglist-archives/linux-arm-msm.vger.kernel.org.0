Return-Path: <linux-arm-msm+bounces-97659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGGTOeK+tGk/sgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6628B4C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB039300C6D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D788C4315F;
	Sat, 14 Mar 2026 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bA8cQ90E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CE2773CA
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773453021; cv=pass; b=Jx5gU03I1/SkdDkcPO9XMzxFLtQo6mNdWRBpJKk/F2vmmPDwnkNFmU0NlUeB/WDOm6fZ9Mdu2af+akgXAC26fx23iGnZslZDtFUWy3/pWY3vBxsZ4YrNfE89TYYJ4JKkJXu5/EjTR+pfL3pay16A+jk10fJREnyYiWYAeNKY6B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773453021; c=relaxed/simple;
	bh=rVE5ewjcH5qWdhMHZs8Ad10FOpOfDspK/YJDZNkG/oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+kTHv9iqF0sUOky4kpPlfPR+6xkak4W1sGnyaxHlIXV85LvlbNmmYKF8ehwzdCzYzB4ELiolzS34mKZ0YwxAugfb+Xc1cIMKDSzzsVyTWcsrJz+QK/zd3GofDGRptl7VSR+eBD96MxHalWHFeXWOBG1OPVB6f77eudhUL2kKKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bA8cQ90E; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1330ac6c3so2979122e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773453018; cv=none;
        d=google.com; s=arc-20240605;
        b=jezkNPUggKvvochTIiQPixrqQf4XeDuXGRoo//zZ7fTm34XxueM0Z7PcPNVcapmWT7
         XdE9bcu4zlZK0/hV2NmSPx6Nu/gCxyvig0uPzZys/APyWpxSNGqxqw9bIpMxJBiZPBQH
         N43d/dcWKLI3tvNwKhCLiMniD6sDhQu/kNmAIIkn/rCoPJ0FjcURCdSB3aOOuIpbciez
         KWdgWHNNYd5Mxl/MQAUWokK8g7JMrEfvnJlJCWkWMny3FaO+eKesYdSf3wGMez6z56I/
         nqMq4JQJk2Abv7OGe/84YK3Hu6M2cCiLA9hgvcyB0/xnq5UJsxhNjhAsY1bn7SnpsMIv
         4acg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99cofb1KudahkwvDFsorLnP67GLLdISpRqHfNmgJjnc=;
        fh=ncULW6ue9rx2Ts3kGXYerg4R1+upL9T4Jy8mwQ7U96c=;
        b=PZjN/RaQLLkzM/UaSKWvHiuAmx/X4FRcJnGzoGAmWHNku4FwdUnNqgae7b3mWwcYHJ
         Fux/yFG/u01nxZliyE8sCyJ8MR4dFPNHm4joZeeZy+rviA3qtJSs+iWJB+1n2N25lpNU
         KlsW+vscP30UNVyaJVsiCfpkebwAbDHI5Mfz2wTILxmr2et8qoBV6/UqBadbINTCWYge
         YpdXIlVRXgBHFx2aCHOn7NP9ss/b5nNsqkoSqkSlP242fpFlqC+JmsJY88pXXYEsWMEk
         E1BlWKl/XBFRzDgc89XU0q6tUVAbsC66IJFXQeCqVVdO8sHItcd2K0JkYUqIx33Hbb6v
         cXyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773453018; x=1774057818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99cofb1KudahkwvDFsorLnP67GLLdISpRqHfNmgJjnc=;
        b=bA8cQ90EGZHdQ3JYXOkMUzmanJVWZluUByCsPATzxnYBB5BsbCI0XaCZdAjz1XjSJN
         iHNNriQUuD6sGv2FEgetLtB6M7kUeeKg2GYV/GefaQFqt10IrJuw3BaL5UdBxjZGbvpn
         b77ENDwKbtcDuIE5kNp0UfDZhonFxPUUR5t5WyZZKGQ1sylBGiPUe3YsGXOSayFzeIzF
         5DIQYjk8ELgNKaUdvP/cAQb/zTRhUWouNvIX7qQ4DSttIkVyWIwSqZdiqgNX9/XLUW+o
         gD4NK0ulJwPwpLonKBNYdABvUXkMEpyUqmk8XALkf5uAVsg3BUSnub9dDkEGG/YcHlkt
         yrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773453018; x=1774057818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=99cofb1KudahkwvDFsorLnP67GLLdISpRqHfNmgJjnc=;
        b=WlaOAvPxIVKfWekB7VN4Ix78+gh4icYJkfFJVhx3rg36Ms+qjxQXV6B7tGE+eWD/Wo
         QynSYSvJu6PYgVx5bEkVospXcdoi1z/bJ2myxcE9s7ifwNRVGof/1jV8YoG99jcM6Cgy
         de5ATWVC0eOCmC56UYsTsVpCemquAGGWmgz2wqC6s0fWfKsoR/j3BP+fbphFiEXZwfB+
         +Sxu7is2v/zBJfzh3xl0K1Qn0tpP6DGruJhvPQqhMKRuC3wdMl/P8ts9mhDPo4pwkZxc
         Ufq/qB9MUAdjYpPYBiOZwo6oMvNqZz75r9fqHzDLmlyO2GgBgP8jcockA1qpvhblHRBi
         favw==
X-Forwarded-Encrypted: i=1; AJvYcCWYbarOtWtZ1eYrjGfckAMt6Te9KONyr270iey/q5+sIxAsR/miJhiGTB634LB0qqtMWbBVPuQZQsWIRIYP@vger.kernel.org
X-Gm-Message-State: AOJu0YwIqbpabLTUpG9W15Ku//88JRQWBY2tYceZBLhO6zgqmMDj2vts
	fTmI8lsaDBN2dHMX7Sw0bmfM4RSsoQWE9xl7IhCUNaplnDmigNlwDbLQzcOXS5X/esF0BTrnz02
	SvHszhjZ9REbRt198xJDS7ir11SL7UII=
X-Gm-Gg: ATEYQzymyxeiAPlkfGqVjJC74+o6ap2UIE4sxsIeLllrFrF8b+5T+FfZqxmxYJik/Wt
	tj4F3hhGnfMcz+qWguRkuj7um2yBJP/9uBwC8dYtsZdz3xaD1yLkKMrdInQIMcRQo5kiO5aRHIJ
	Tm0G/QrakZ9dWy7dqeHpGP07jMF52PS+8lMX71CdUAZFlpB2GfHDsh2mPzr35+A+qbmW2suKCDS
	XZVLMSABtios6N97F7iLdE/YP9836Z5BcK8+ziVw7Ykf5N0ew74nbvdzxpSALLax52Uha3PGwa9
	kxgNavPgIhbp1EuWXdU10gGL2OnOhw/YDS1fHGUibVEar9D22cfuMxyUKPR9ea9Yahm4pVuhWMq
	+CoU=
X-Received: by 2002:a05:6512:3618:b0:5a1:4bd3:7b8 with SMTP id
 2adb3069b0e04-5a16270f8d7mr1569371e87.17.1773453017289; Fri, 13 Mar 2026
 18:50:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
 <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
 <20260313-urban-prawn-of-success-cff01f@quoll> <CALHNRZ8iBqGGRDKhDNOasfyf8TY43ne1N82irkuzDZfWUuV5sg@mail.gmail.com>
 <wzle4bdmemfknhflwhxikq7rk7x3ao3z474bhsr5zdkvtp67cc@jddzjpzwlfrc>
 <CALHNRZ8_Lzn=mr89dezkC6hVwgxh9kYmg8ntLf5RDuNydc9VLQ@mail.gmail.com> <a045299f-9be1-4e91-8b3c-132a30613f41@packett.cool>
In-Reply-To: <a045299f-9be1-4e91-8b3c-132a30613f41@packett.cool>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 13 Mar 2026 20:50:05 -0500
X-Gm-Features: AaiRm53-p_yjr1m4biSBf9Hd9oX0gSvuW45ASNIKSHT640CSE25eHMPknY38Dek
Message-ID: <CALHNRZ8ei06Fxivm1+Su2a+tCxYK8-3mxgJnULTA_+bwbfcGNA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Val Packett <val@packett.cool>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97659-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: E1A6628B4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 7:11=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 3/13/26 3:21 PM, Aaron Kling wrote:
> > On Fri, Mar 13, 2026 at 12:48=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >> On Fri, Mar 13, 2026 at 12:34:21PM -0500, Aaron Kling wrote:
> >>> On Fri, Mar 13, 2026 at 3:37=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>> On Fri, Mar 13, 2026 at 05:19:27AM +0200, Dmitry Baryshkov wrote:
> >>>>> On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> >>>>>> On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.c=
ool> wrote:
> >>>>>>> On 3/11/26 2:44 PM, Aaron Kling wrote:
> >>>>>>>
> >>>>>>>> From: Teguh Sobirin <teguh@sobir.in>
> >>>>>>>>
> >>>>>>>> This adds a base dtb of everything common between the AYN QCS855=
0
> >>>>>>>> devices. It is intended to be extended by device specific overla=
ys.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> >>>>>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>>>>> ---
> >>>>>>>>    arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> >>>>>>>>    arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++=
+++++++++++++++++
> >>>> Common is not a board, NAK. This could only be DTSI if you provide s=
ome
> >>>> sort of HARDWARE arguments explaining the common parts of schematics=
 or
> >>>> hardware design.
> >>>>
> >>>> Not enough. We do not add compatibles not representing actual hardwa=
re,
> >>>> just to streamline boot image handling.
> >>>>
> >>>> Plus this code is not even truly correct.
> >>>>
> >>>> We do not write DTS to fulfill broken Android boot process.
> >>> I have been trying rather hard to find a reasonable compromise betwee=
n
> >>> mainline requirements and a normal Android use case, something I can
> >>> actually ship to normal users. This seemed fairly reasonable to me,
> >>> since it can generate standalone dtb's transparently. But if my use
> >>> case can never meet submission requirements, then why am I even here,
> >>> getting shamed for working on Android? If I have to fork the
> >>> device-tree anyways to fit my requirements, then there's no reason fo=
r
> >>> me to put the time and effort in to submitting something I can't use.
> >>> I'd be better off just keeping everything out of tree as googles
> >>> kernel-platform supports. And never look at mainline qcom again.
> >> Well... It's a tough argument. Getting your DTs into mainline would he=
lp
> >> occasional users that would like to run something else than Android
> >> (PmOS or some other distro). Also it ensures that you can run Android
> >> even when Google (Qualcomm) EOL the current SM8550 msm-something tree.
> > Oh, I'm not working on the downstream kernel either way. The question
> > is whether device support gets mainlined or if I keep all support out
> > of tree and only update when Google forks the ack from a new lts.
>
> IMO landing everything with proper upstream style and having minimal
> customization/patching during your Android build process to convert it
> into a base dtb + dtbos setup (or a blank base + everything as dtbos
> one?) during would already be really valuable.

The end goal was to get everything possible merged before the 7.x lts
and use Googles Android Common Kernel repo as-is from that version on,
no vendor specific fork. Perhaps overly idealistic, but still the
goal. There would be a few android specific device tree things needed
in out of tree extensions, but that's trivial with the kernel-platform
build setup. Including a common dtsi and extending that out of tree to
a base dtb is trivial, if said dtsi doesn't get nack'ed as was already
threatened if I don't provide documentation I can't possibly obtain.
But if the device specific parts are a dts that already include the
common dtsi, extending those, cutting out the common include, and
turning it into a dtso is potentially not possible. And even if it is,
the method would probably be approaching a crime against humanity. And
if I have to fork the main kernel anyways, I'm losing a large piece of
why I'm trying to upstream things in the first place: cutting direct
maintenance of that repo out of my workflow and only needing to push
fixes when new issues are found.

An empty base dtb is an interesting thought, but I don't think it will
work with abl. There's been this whole back and forth in other threads
about how abl will fail to apply any dtbo, even an empty one, if it
can't find certain labels in the base dtb to apply changes to. I would
expect even more of those to pop up if I tried to minimize the base
dtb. And then there's still the issue of extending a dts into a dtso
that might not be possible. Which brings things back around to having
to fork at least the device specific parts out of tree to make dtso's,
if they can't be a dtso in-tree.

> >> Speaking about the boot process. I remember that historically it was
> >> possible to pass several DTBs in the the Android boot image. Is it no
> >> longer the case? Is there any way to identify the boards (I think
> >> historical code was using qcom,board-id for that)? Then you would be
> >> able to squash all your DTBs in a single boot image.
> > That functionality is still there, the concatenated dtb slot in the
> > vendor_boot image. Unfortunately for this context, the odm did not
> > change those ids per hardware variant. I think they just left them at
> > the hdk or qrd default that came with the bsp. I do have to jump some
> > software hoops to slot in the correct dtbo to the dtbo partition
> > during inline updates because of this, but it's not terrible. And
> > that's not something I can reasonably do for the vendor_boot image. To
> > my knowledge, there is no way for the bootloader to tell these devices
> > apart and any attempt to do so would require a custom abl build,
> > probably per variant, which would then desync the boot firmware from
> > the official OS, plus make first install more difficult for users,
> > both of which I'm trying not to do.
>
> Leaving the default board ID is a classic=E2=80=A6 but on many old Androi=
d
> phones you (read: an intermediate bootloader) can use the cmdline
> injected by ABL to distinguish between models. Nothing like that here?

Maybe something like the panel params, but two of the variants share a
ddic, so that might not even be sufficient. But if I add u-boot to the
boot sequence, then I lose a lot of things that abl handles and have
to set them up in u-boot. Things like loading init_boot and
vendor_boot ramdisks, handling bootconfig, avb parameters, etc etc. Or
drastically change the aosp device tree configs to disable those
things and in doing so become non-compliant with current aosp
expectations. Long story short: chainloading another bootloader and
staying compliant with vts is a *lot* of effort I really don't want to
do. Booting android on qcom via u-boot is certainly possible and I've
seen others doing so, but those have deviated a lot from the OS
expectations, and the more deviations there are, the larger the chance
that unexpected things go horribly wrong.

Aaron


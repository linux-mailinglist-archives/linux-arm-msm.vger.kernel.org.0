Return-Path: <linux-arm-msm+bounces-91363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMw9IMzGfWmBTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 10:09:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE36C1523
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 10:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7620B30010FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4AA2FD1A5;
	Sat, 31 Jan 2026 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyBRJPkF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C6E1D6AA
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769850567; cv=pass; b=c0ggFysdaimhkLBn3i6XYcgL9fVZo03MadJmuariBMH/HsA/Se/2ZV3kKQHPRlt9Yb+TjiE2cqARv9FU37NgiEbWVIrN6KFkaYDzqsaqkU+tQkLegAYbgwnUU9B1DFm4QYjedD+Ik4izmmL8MLapfBok/VY5FiNG6w6aiEIcYi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769850567; c=relaxed/simple;
	bh=nCj1OAarCxZdxbUETmSh2uXCHGrkZqQoz13cAYyo4/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7eHt5KnqencE7f0BExB1Ie/4orgqBPaJpkZH7icJXEdSqbqdY83ifgM2umAggnBNgfAjxyNmCzhDRmSvOze5IcouzTJEznweX67nIx1GikrKC2pFaQzAd+fkbYa+UvcTjz9rJ5YG4JIsBdNvAm/K5ByxAfxWBpJM/AjAOO0IEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyBRJPkF; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso3776173e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 01:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769850564; cv=none;
        d=google.com; s=arc-20240605;
        b=Dw3Xa1ljzwLHJqIDc4sIMxue3hxEdJamiqf29gLG/IjuN86XAOY4pIQm902Vyjjbie
         w/DN/qyKnipMF1+krrya8Z68TOswGe65gimH0Yyi9PH9ZQSUgfbCAh+UNt7VHQEQlSTy
         e0N5d5uWksywlr89H+mn4ReUEboaFULyUMYEmjr9FqKmSBQWDM+wGkwRQ2qUp/YGQI4K
         QgoPGQPaYmKcIVE4hUlIp1gns1O122aqE/1zKPDPsvUBJ61CSrJHISPAGxqceeRKnB1C
         MKy3sQL/Y0HaMarOXBlgBBXVDKwxf5NvDs9IJ6qMyC8CKUluJxOtwipwIb+teeevmcYE
         kd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ErL27rQjlumXcD5kCcCQtYknf95rNMXp3vNt9xcdPgs=;
        fh=v/XPfotDLV3k6kZJcdRTvc1SN6l7y/f77alIniLH/Gg=;
        b=MvoP7CXxdvNKaEQRrl+EGP02CsUly8QE9mbzXqlfpmBQGdjzYeJ4iv3auQJ5ED/1h1
         IE130kvzw8oEKLqVsl/r2/MiaaSqMmq3znmw/SEme4cNgFstCk+tdE6eG84V6pbaLyL6
         i/nmn8hPqGG4anOm/O4b4JhX6SFwErI5tQ+94MQBT0WA3Sqh73i4QL7IKqOFQHc+dAUV
         jtHzXfh2AyXnFE+B/o5waYupuRSiWk7ma7/5O5rvibwJqiX0Yq7nS+Fq0MZEwis+vEvk
         hJI9ZefNlQS0AKfqe0DafDfkMb8GZPsteSAGJxX29klL6R2OYyNCsSPFsFrVjjdALBpO
         Diqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769850564; x=1770455364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErL27rQjlumXcD5kCcCQtYknf95rNMXp3vNt9xcdPgs=;
        b=lyBRJPkFZk48v5W0uOrCpqtF/IxFeZ3kEd3ahcojfCGECAJWTr8I96gtS30oe1i9uh
         Eiw14qIyyycJ/MrIaj1rM1fjylEmK/faTwPzupc2wygvbsn7gR3UyQcMpUmXC4wsph/V
         rGorPL89Iicz0Mm5Ogr6hGjtE3edxR5YMnqO8IEBhBKM8JnDOOaONGmIne9clD9HAc3d
         qcgeao5L9gFMRXKuMQhf26b8ORc1kK+uwPdnoBY0003R6+ilv2jQ/HFf+6Mb3nf+oGCE
         GbnHe6pGf4GVkgDYYYY98sg0KN/p4UFyas+KABTVxygMaEFlD0K0cBA36zh9mvNZXwTp
         08Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769850564; x=1770455364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErL27rQjlumXcD5kCcCQtYknf95rNMXp3vNt9xcdPgs=;
        b=NwUttZA4XjykfK6uLfqPeixUzAHbS4WatcmmBZ/24ZVbHpNZcToACbGgnUyMJpsvp7
         tyHF81pCbi1iKTqruTlf0+Yr1V9BObnaZn8SeRhqhlzyZ6RmAqr/uYqPBMCymSHKMGR9
         DkOAp8XqKdLyYFojUedoRAWTtmOZtWxe6cROXZn2xaiD/FTtmK63chVf8tHY9MigDl8/
         KOu7FKfV2dwtu7B4lElUPyLC9Y56Ph6kWaIeulAhRuJyN9c3ph+KWKslxHajGH4JLTw/
         PKxkiHLaO/3eq6d4KIKz9/0h5jof5/HxLnTJrw95Xvx+uawU7TQz4lF1v0kvvpcaCBVo
         7xMw==
X-Forwarded-Encrypted: i=1; AJvYcCWMtIxZTGpcoIpMDzdxVeGmaiSqkQBcWP4kwpBYBbLP4JN2lzAxO6XBdzoCMzWKymUuyM48n4PPw/gDy+on@vger.kernel.org
X-Gm-Message-State: AOJu0YxNeO693HgFukmpD7q5QbsCyQbizDVgdGkrmpofoVCrRphb/uvq
	vPMWEHnhLhsBquuR2fbfdux4atQn9ZmRDydQzQOuZAkE8jovJsS6BpcUTrd/HrC3Vb+wZ7NZLvT
	XW+IK8YRsvWh/n6n37bcDrFDGxij3QdA=
X-Gm-Gg: AZuq6aIuscTDhoiNoMtiQlH6sbWehEvnUuZ59S8LFCbD9QqxbQFu6q+XXe39uhPlN6T
	vgA5wB58arAzyIVW5RcHReT5dz6vLyXoTv+nUGGjQHL6yqetv9vKErIf8wIbeQP44Dl1VsT5Inf
	SjSdTJxmCr+vC59zaq0ttvTB5Dd3ICe3RZe7CZ6TvDNntlmiNd6iHAIWnyUcAL+TV7qTvHOKQDP
	kp3CPV1kcqOZHKOZbO+pvaRIpP1k3TPIVw6StswERZW2lVqaUQT+8qhJkvfD9fbgncsU0BNcY2K
	i/9IuJW2vfOEy0lxR+dogfOsGuxifeY1GXm0vQZBDA/B1Ubdx5NYarGa
X-Received: by 2002:a05:6512:b0f:b0:59d:ec9f:b663 with SMTP id
 2adb3069b0e04-59e16402044mr2083187e87.18.1769850564010; Sat, 31 Jan 2026
 01:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com> <7d473eubnez5gcbou6mguomeetpotp73q7cjol3kfjlg7pz5r3@yjsh4rd4mwbv>
In-Reply-To: <7d473eubnez5gcbou6mguomeetpotp73q7cjol3kfjlg7pz5r3@yjsh4rd4mwbv>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 31 Jan 2026 03:09:12 -0600
X-Gm-Features: AZwV_QhI2wslJSs6FGb4rEwUKvBqr5b8LTNl4MaeH_JhV7NT8HJXuEbe8azVqlY
Message-ID: <CALHNRZ80+KAfm2YHEoodBv_7jDZPZjtr-koo7q_N+aX+i1OfnA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Sharma <quic_vksharma@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EE36C1523
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 1:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jan 29, 2026 at 01:46:32AM -0600, Aaron Kling via B4 Relay wrote:
> > From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> >
> > ABL requires certain things in the base dtb to apply a dtbo. Namely:
> >
> > * The scm node must be named qcom_scm
> > * The timer node must have a label named arch_timer
> >
> > This aligns the sm8550 soc dtsi with those requirements. Without these
> > in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> > the bootloader menu.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>
> Did Pavan provide an SoB to the patch?

No. The change comes from the gunyah watchdog discussion here [0].

>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index 740e3c238e8ed0f162dd168291f6e307ace66e80..d7cc20e1931904e7c603b80=
0089f00955ecec3b7 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -329,7 +329,7 @@ cluster_sleep_1: cluster-sleep-1 {
> >       };
> >
> >       firmware {
> > -             scm: scm {
> > +             scm: qcom_scm {
>
> This one is a definite no-go. Device nodes can't use underscores in
> names. It has been told to Qualcomm for ages. If we didn't comply, it
> doesn't give us a permission to break the rules.

I have not been able to make ABL load a dtbo without this change so
far, though I have had a suggestion from off list that I may need to
try a different method of flashing changes. I have not yet had time to
do so yet, however. Given this list came from a Qualcomm employee and
worked as advertised, my tendency is to believe that it is the minimal
required.

The devices I am working on are not fused and thus I do have the
capability to use a custom ABL with fixes. However, doing so would
make the user transition from the stock os to a custom one more
complicated. Plus this affects many devices that are fused and thus do
not have such an option.

In the likely case that the bootloader dtbo functionality does indeed
require this change, and the mainline kernel cannot accept it, then
what are the options? My use case involves using out of tree dtbs that
include the mainline dtsi's. I could do a delete-node on scm and add
it back as qcom_scm, but I would very highly prefer not to. The less
downstream changes I have to carry, the less work I need to do to keep
up to date. And on the other side, getting android vendors to update
their ABL seems extremely unlikely.

>
> >                       compatible =3D "qcom,scm-sm8550", "qcom,scm";
> >                       qcom,dload-mode =3D <&tcsr 0x19000>;
> >                       interconnects =3D <&aggre2_noc MASTER_CRYPTO QCOM=
_ICC_TAG_ALWAYS
> > @@ -6764,7 +6764,7 @@ trip-point2 {
> >               };
> >       };
> >
> > -     timer {
> > +     arch_timer: timer {
>
> Please add a comment, otherwise somebody might decide to drop the unused
> label.

Ack.

Aaron

[0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicin=
c.com/


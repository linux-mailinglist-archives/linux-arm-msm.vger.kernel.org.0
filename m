Return-Path: <linux-arm-msm+bounces-112615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ajPTKK9IKmoClwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:33:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1949766E9DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:33:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XXE8OmuM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6677930506A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B622848BE;
	Thu, 11 Jun 2026 05:30:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA54FC0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:30:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155836; cv=pass; b=pZ5/4wcO45vz6MoLAIPMZdmHNluN4Iod9m19yvPsdYVj/X4mBELWCY/RIKNOLBriO2oPxOIHIi1PqK3JsSPC2IbUg1NTr3hipzKHT9KzX0CanoxoYravJdmBqacN1gQoYkzvdFYf8vwWuQQx3i/k9mB+sh0WQ0ulJawEWQYtw7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155836; c=relaxed/simple;
	bh=Q773769O9P0PEkWxz/hUK6moYfjQ705w9ViRAFQaflM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3X9rgQSEjC7V75cLcW7N5IrCbQogla1Y2NHiQXUSUT4RpYa58QauSTWeLdz0NpF3USOecRsr1nj/QkSgyVqv/+1iKpEovlHkkZXdKD6xj2UyJtG1fN5Gz3A3yEEGbfN1AaFoFTam9DPx/7ziejPq6zEjkepFmal0M3D17iII9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXE8OmuM; arc=pass smtp.client-ip=209.85.222.45
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96387977596so2531645241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781155832; cv=none;
        d=google.com; s=arc-20240605;
        b=NL0TH/JOv/N9Z8mlJnWSdHPxn16O2OJ/EC8ERxhn8D6le99sn637bQAgHpFr5O+N9J
         Mbr/az9GzjZzanog2EkEVwFAkCfYsB1AwErXDqPAy9xKRudIR/CLBEx6izgxIltLIFKe
         +qwvKTccNOEQSbC58/wOdGHYwWCh+6wfftn5QbHENB5Yh4LK9yoxto30fF5r3MHGpGqo
         t0p/jnAVO6MtP32G904TH3sK5sAQ0bEgCAuwKPbAW20qvjHlGLR3fwc28wyrXT0ENfqi
         PdA84VUse/mCh9e4afmrnIYGC1/1BsP0LNsb/KgfKv4bgXBPqzJXP6yF9V+WAXp+h72e
         hMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        fh=rdIa98ygZHUiwyX+U0+VNP2qOG+i1U8Q4JjyvHmZuc8=;
        b=bKXrrsi5FL1V1Sht8e0GJEefkQkEEvGTIGRj0vCy/7evnWya2MotQY9s6Tf0weMIAm
         c+m2Q4a4RxGzJX4V65hmoGvkwn0DMa6dQLgL6esyK9f58E18c2qgComOfvexcqjIMP/t
         BUdtzIHnij9s+LhUuqbjpdNpc7n+5VxokdQnmadfeBymyBtyUw4d4mB8g8jzYYND7x/C
         cdHPvjNEogAG8jStWlFtXbWqgT3eMUk4MGgpzhzYPJ4+S/BYW+bsh0J0ScvXemBG/srB
         yr5Sx1oPAnYwNyRIbtmwTMM4nCBZZEPpbyybo58tkAdEzeRpG4d31C5AytEbuD+7k9rD
         UP3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155832; x=1781760632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        b=XXE8OmuMKDC7wNPkumHHw4B7pkKNYbwZDEs6j4IXCRsRDI4w+mNnhYwkUxK0t21WOF
         DOZwEpADmNpkKblzH2Q8d4NplfONwYArxPKH0BgWIPE+8zVak5Cww2xKS1XZox7hahyX
         8sVZt0PNtdssKx0q3QjgfZbfbKI4GP7yMx3YrRRP7PCb9IcIWKim+bRaPCa3nd0731mf
         KssWDJvtoBH6RIZfPjUqp/mN58ePYwRwxp7McqllhTvjycr6WJnEdu9Cv3t/wyPOZCNX
         cwFeLeciBxxTKiK7d3IdC1gHTB2SvacSKYE+ScUowmlt84Vpixc7MNN7gWYfcB0mbJtI
         wAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155832; x=1781760632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ol4aUhvNk7Xou2fzcXcwE2NJZ2PFeOEVI2xbr2T74rc=;
        b=DfYhAaQWS9YPd7vM2ZbUESljXiTa9V7q7XT648s/49IsL6bD64WcY2No8sO6oCyhNA
         MXFuPO8LcB3ju8dZ0keYXWpSUHySB1p1FiQAs8TkoaSiFPudGkNHS4CLXOC9cmYM8YF9
         eI3dfQGcfqPpbtzt9TXSasuZrWZ1AeIM6Rzu6DhSqvNIsdNl8/VYXANRGgWAW1zf22Ho
         A5XZcbDtaFwJkT0xvL+izTRBOeZshywVx7HPtJLKAePPR3GBnXdhmbJSvfg0r2isF+VW
         ki/DTq9eaUzlR4UNy5FDLI1xBy2oXBukDSgsJbtXNaSGNp86tqG80vR2Kl4oxFzVG1+G
         x8pw==
X-Forwarded-Encrypted: i=1; AFNElJ9lCzoEH5xgcgQ5JmAyJWmMJW+6o8TABcs8BCEalczqEIEeKBFMtInMtZmLTemcCZvZEEJ3n1kJHwxDAV2T@vger.kernel.org
X-Gm-Message-State: AOJu0YxBu3at1lmIz9cB0HYYMVzZiFiQd/Ylwa7HglT3HHDdkjgBPt6T
	rHPzPRGl8lKLgr/HW16AE7osSsQFL54MB1h0Fl9YoH661uSTRzL/c5XIg0hB4IUOnsbYOaS4Ubj
	nkqOgR2QJM7ajYi5ELgzXPGiD1riwfPg=
X-Gm-Gg: Acq92OF0LvgamBi/oS4OGs3V2dgCSKHEg5AUD/UQ+9D5oQX5I9p/EIS+xW9ilDzyZUH
	iXEBDZOUyCaJSzS2tYGkNzaQpd8uCM7d/Rm05jfRfkDFz/EDgbp0cwI3xVKuzoGJFYFLxZVzm7n
	tk8S61NUc5uDG3eLPWuC8CZAkg2xeRbctOOTiE9iy4twKnSGIDn+c8gA/YyBcuAbgNpCVrPHW4q
	sHFBCo6goHuqx0tjuOvzv9FM4YzLWuH019f0Un6u56R6UVXBxq60MMCVkp3f7iD17qNWTZX5tBM
	VFyXcNVvrM3JP4j/Tjzt2+PhJ3t5vUcg5W8pr7nSfwh4LKDnj0BTiE0HHoS0
X-Received: by 2002:a05:6102:374c:b0:62f:39a9:ae67 with SMTP id
 ada2fe7eead31-71d5ebb6737mr324066137.17.1781155831972; Wed, 10 Jun 2026
 22:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607160435.36546-1-mitltlatltl@gmail.com> <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
In-Reply-To: <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 11 Jun 2026 13:29:12 +0800
X-Gm-Features: AVVi8Ceuyu40o3HD-dzKwp_kGIQyqB8dXPSn6NI0LymvcdUS1bhUSGUemAnaeFs
Message-ID: <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112615-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1949766E9DD

On Tue, Jun 9, 2026 at 8:17=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/7/26 6:04 PM, Pengyu Luo wrote:
> > Define pinctrl definitions to enable camera master clocks on sc8280xp.
> >
> > Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/d=
ts/qcom/sc8280xp.dtsi
> > index a2bd6b10e475..0dbcd3069a3b 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
> >                       gpio-ranges =3D <&tlmm 0 0 230>;
> >                       wakeup-parent =3D <&pdc>;
> >
> > +                     cam_mclk0_default: cam-mclk0-default-state {
> > +                             pins =3D "gpio119";
> > +                             function =3D "cam_mclk";
> > +                             drive-strength =3D <6>;
>
> Other platforms set this to 2 by default.
>
> What's the value set on Windows when the camera is in use?
>

It is 6mA.

Let us get ctl_reg first on Windows

lkd> !dd f111000 L8
# f111000 00000284 00000002 000000e2 00000000
# f111010 00000001 00000801 00000000 00000000

ctl_reg =3D> 0x284

in msm_gpio_dbg_show_one()
...
drive =3D (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 =3D=3D 2
...
seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 =3D=
=3D 6;
...

x13s should be the same as gaokun3 in this part.

--
Best wishes,
Pengyu


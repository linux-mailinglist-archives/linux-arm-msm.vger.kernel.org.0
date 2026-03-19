Return-Path: <linux-arm-msm+bounces-98808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHc2LNxCvGmAwAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:39:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B0E2D1270
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFF433004DB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357A930F816;
	Thu, 19 Mar 2026 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKnJUMj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877742C2363
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945556; cv=pass; b=P8gAR3LOvCrNHf9owATGTLoTqDTEiVN7R04CsXmy8sMyyjYdZieP9UgJF/TlZj4BNHqBznYC/rgsvHhTiJuaHY1pSyQeT/1xKETpnzd3cUF+RuA997IkLDD/X6m5vL5vAK4+SxdLPdN/+skpCKOy6j99vWX+U2CizrAKHRyGBKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945556; c=relaxed/simple;
	bh=wx98uaVcJlbyPJHok3qOz5VS+w/Uyhd4kectCkHQIts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBOloZyjSQY10KEEsLfuAhTHT9rrut4blA3duqv+ptKOQWMD7baMLaQZM9ihijXMDykzvLHZTISEaGCmlMnizwQkxe+iTsGZLGjq03+XzJVVvNvkfRlLnVFOvFlFjWhM2YGFz2eWL/5Nydd7VR+Js3KqeNw3ESyTVlk1gB8HpQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKnJUMj1; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a27a90a7b6so1486240e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773945553; cv=none;
        d=google.com; s=arc-20240605;
        b=UR12XA1sTc6NVWlQMetZpSoB667WHYz36hyiQZJAHhS5rfyo3TGU/cwH88rNKCzNTc
         BSa5yLOB5M0ysWPYNnaq2pCvK0oGLg5lAy+p+PvSrf8sR85QMZRtkWjj6TBflr7IqxW3
         oNc/BLv84LDm4QEQLkBHnGlwQEFxDP9NZCm7xKXV48VSeWuIaYU5e5rXvO+zdp/H/59l
         HhS3IZnjsZeWnHk2othQHhtksshlg8u2OUubtZ+GnI7Ozzy5OdPcnEHBgolE26cyYbda
         7cf88WN08KIdtffmEqNfDjMiWdko0r4ujftrOCqyCXyBytOSTX0htL5c4lz/ouX198R4
         OlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dtSkUt/0+k+zkoTrKcW+DOXMi+N2xx2OVINNsqDh8Y=;
        fh=y7HaHEWjKUbWTpN8sb1ytNCfbk7w2FDIuyFgggNO9NE=;
        b=AwlOb74Tj3ulmCkKwdldlNNra9h2FwzaRENdNEvhcUkmBOw3frApjGWYKCZvX+6V1z
         n7lsVxJztbYLSX7Nil/JduuD1ytYF7eG0mE8aDRf/vu0Zfkryx4H4RHdQxYgO6Vy6QCs
         ZjedBt+XEBXY8CuPRd8xlvBStifp3NjR7h2+JokUMSDNqzXlJ78C5yvxGSnC2EQAN4vf
         CD/0ga58X8T7qw/LYg4+ZFlBA9dXFopYqjW+Nbaua2HCzauxON4yG3qXuMtXD72ftUFj
         ZfyV/rCjFP1TaEwta7iRr6XybOnkpdQ6YkrA3aGA5iCu3jh8DsqpEl6ekcxz0V/Kbc+C
         voww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945553; x=1774550353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dtSkUt/0+k+zkoTrKcW+DOXMi+N2xx2OVINNsqDh8Y=;
        b=UKnJUMj1JfM2IsPyFvtJLT+HVnlnjjv1dRHVhfXsU0mMPsZUhDGm/yQ/gtYatuogtb
         4G4xrig7N3So0mzDef7w2wx0ipr5XLtTkrfo59cBPuMy241/m3rOYYL6c+2ioqG2t5Lx
         AzZviZTLHZMt2iIMBFq+VZkqG86yXmUOl+g/wz8lVQLU39Uswv+5MGKMwoTwgesFTsz7
         LIEKbivT/3Q8nehkBG07nBb9sD4VP9zI6TBYAnG9iDFsyt0FHrhCqYRty9YNMoEcOEDl
         Le6pSfkapgxaPsB+y2eDbDgBrSE1xys3rViAcIrQ8gPBVqHg7rZHnZXzae3diZCxEyPy
         L7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945553; x=1774550353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dtSkUt/0+k+zkoTrKcW+DOXMi+N2xx2OVINNsqDh8Y=;
        b=bgelVWnMF+uhRNUJ1cYYyVnsiXnli0iYRV2uazoacTzgUV/XfiVaiIijMpTFs93oQ4
         ZIXTJiNQ5V0PkJgioX9+7/8WC+kGYowclaVL/H9MWe+Pcyyt7FzLTCrgh56o4J+y2taE
         Nt9ZzCW4wQPmOnCkOKP30ZVDK1KBx6IY+fM3KeieK5VuENk1KI5GiDiTleyF2rjmwnJu
         Jh3qjO2X/bxo2dSnSmNm95d8HwcEw5FnBQtfv0+gx4lySESz0YWEVAYfUc6ZKz3wiOT4
         QMhot7yUUKLD8UgGsuUjnrNhF9vItv3q2IJP/UlYkmhlYxyLVisgBRO/h3XWgUDm86Lf
         WPQA==
X-Forwarded-Encrypted: i=1; AJvYcCXlSUKRt/OUK4/pbLKgK0wZ2je26S8xtQNwsVFQ32L1mAGCL+vNTmxY8zs013enYH7u125Wwbl6xzjxLQy2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd7RssUu/sinlK4Vc0HmKGKaIiZTVEiUQRo3lBE2p8nr1C3FMQ
	jIoE45miQpHp+IWtSxrvSe9F5XFpcVtX36MaYnzv/SyczqZfGVfl0Z/s0mYzykFRs/YZUyXkhwM
	ILaYTo7tXzMz3BwmgnxE8XjMM9i9kCWPLJQ3h
X-Gm-Gg: ATEYQzzVpP2lGoSaGj/2kJQFZlW1S3nh7qjtAODOc0dtH2VIg+Bd7lN/6KGZLKmIf0t
	/XmBvOx9mdH5y4SLGr4LPL+cTPl6j1lPpFu3Q9TdXloiB6WF0m2gLGRHKwSoC3MewWByDjuiGoj
	RaD1ibNPwzrxy4+BdpG0Of9Fbt+LAE48F0nSJQZiBm0lyfIIM8QbcsHZMnnt82p6E+5DN8IEEc9
	dAChlJtnRdVg40IpotUu/t+tQdSVv1X4+SWl57Sc52YlEP+880DK3Ai9+msJa83HO7KW0Bi3jCM
	s+fSxTWMEFMqEvp6GlNMOaY2I1KK58ymPzjciyVZxW762qkpMxnpm7kjOuq4ciLARrSw
X-Received: by 2002:a05:6512:23a9:b0:5a2:7a56:b30a with SMTP id
 2adb3069b0e04-5a285b6cbedmr30959e87.26.1773945552458; Thu, 19 Mar 2026
 11:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <c464d106-8e7b-41a5-b76c-ed5e7a82fb37@oss.qualcomm.com>
In-Reply-To: <c464d106-8e7b-41a5-b76c-ed5e7a82fb37@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 19 Mar 2026 13:39:00 -0500
X-Gm-Features: AaiRm51t4avwyvzvLcAlaysld1xiugTPcZDvtm3iHLmSQI4lsTYBRd_nmd64Vzs
Message-ID: <CALHNRZ-AC+0+JdjvvQLREE-nXAzV+kJc_9GMNjVs=tT8GxKBzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98808-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.718];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.34:email,sobir.in:email,qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0B0E2D1270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 6:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This adds a base dtb of everything common between the AYN QCS8550
> > devices. It is intended to be extended by device specific overlays.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     pwm_fan: pwm-fan {
> > +             compatible =3D "pwm-fan";
> > +
> > +             fan-supply =3D <&vdd_fan_5v0>;
> > +             pwms =3D <&pm8550_pwm 3 50000>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&fan_pwm_active>, <&fan_int>;
>
> property-n
> property-names
>
> in this order, everywhere, please

Ack

> > +
> > +             pulses-per-revolution =3D <4>;
> > +             interrupt-parent =3D <&tlmm>;
> > +             interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>;
>
> interrupts-extended =3D <&tlmm 13 IRQ_...>;

Ack

> [...]
>
> > +             model =3D "AYN-Odin2";
> > +             audio-routing =3D
> > +                             "IN1_HPHL", "HPHL_OUT",
>
> Let's drop this empty linebreak

Ack

>
> > +                             "IN2_HPHR", "HPHR_OUT",
> > +                             "AMIC2", "MIC BIAS2",
> > +                             "TX SWR_INPUT1", "ADC2_OUTPUT";
> > +
> > +             speaker-i2s-dai-link {
> > +                     link-name =3D "Primary MI2S Playback";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai PRIMARY_MI2S_R=
X>;
> > +                     };
>
> 'co'dec < 'cp'u, please resort

Ack

> [...]
>
> > +     vdd_fan_5v0: vdd-fan-5v0-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vdd_fan_5v0";
> > +
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +
> > +             gpio =3D <&tlmm 109 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&fan_pwr_active>;
> > +
> > +             regulator-state-mem {
> > +                     regulator-off-in-suspend;
> > +             };
>
> oh, I didn't know this binding existed.. but it seems valid indeed!
>
> [...]
>
> > +&i2c12 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
>
> Let's uniformly keep a \n before status

Ack

> > +};
> > +
> > +&i2c_master_hub_0 {
> > +     status =3D "okay";
>
> Please add a clock-frequency
> (you can read it back at runtime running a vendor kernel if you don't hav=
e a
> better source)

Mmm. I'll see if I can find that. But I don't see any of the existing
sm8550 devices setting this either.

> [...]
>
> > +     spk_amp_l: spk_amp_l@34 {
>
> underscores are no bueno in node names (between ':' and '@'), and they sh=
ould
> be generic, let's try amplifier@

Ack

> [...]
>
> > +&iris {
> > +     status =3D "okay";
>
> firmware-name?

Not needed. These devices are unfused and can use the generic firmware
like the devkits. I have verified this as noted in another response on
this change.

> [...]
>
> > +&sdhc_2 {
> > +     cd-gpios =3D <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> > +     pinctrl-names =3D "default", "sleep";
> > +     pinctrl-0 =3D <&sdc2_default &sdc2_card_det_n>;
> > +     pinctrl-1 =3D <&sdc2_sleep &sdc2_card_det_n>;
> > +     vmmc-supply =3D <&vreg_l9b_2p9>;
> > +     vqmmc-supply =3D <&vreg_l8b_1p8>;
> > +     max-sd-hs-hz =3D <37500000>;
>
> It's already in 8550.dtsi, you can drop it

Ack

> > +     no-sdio;
> > +     no-mmc;
> > +
> > +     qcom,dll-config =3D <0x0007442c>;
>
> Is that changed in your downstream tree?

I honestly don't know. This existed in the mainline port dtsi mirrored
by the vendor and I picked it up as-is. I grepped the downstream
source release and I don't see anything named 'dll-config' in the
sm8550 dt at all, only in older soc's brought in by the kernel fork. I
know the fork I based on was chasing the issues with high speed sd
cards that seem to have been recently fixed upstream. Maybe this was
part of that. I can drop it given no one knows why it's here.

>
> [...]
>
> > +&swr1 {
> > +     status =3D "okay";
> > +     wcd_rx: codec@0,4 {
>
> Let's keep a \n between properties and the subsequent subnodes,
> also file-wide

Ack

> [...]
>
> > +&tlmm {
> > +     gpio-reserved-ranges =3D <32 8>;
> > +
> > +     dsi_p_rst_active: dsi-p-rst-active-state {
> > +             pins =3D "gpio133";
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> Let's order them by the pin index (it's a fairly new development so other
> 8550 devices don't really have that)

Ack

> [...]
>
> > +&usb_dp_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l3e_1p2>;
> > +     vdda-pll-supply =3D <&vreg_l3f_0p88>;
> > +
> > +     mode-switch;
>
> Already present in sm8550.dtsi

Ack

Aaron


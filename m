Return-Path: <linux-arm-msm+bounces-97104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL1OH24ZsmmpIgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:39:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 814DD26BF67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB61E3013C84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 01:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AF335B658;
	Thu, 12 Mar 2026 01:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtK95c2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD6374E7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773279592; cv=pass; b=S2gcEjdNJJfOxqBPMei9gRerLQY+uZ2pnvUJdmnGzltymvlRxx9OvNgr9RTmczHUC5HoN0fv5Pz0B6PcUV7QZaS+1AE57iRSUsHC7izyjSYUa1c78fd6g227NWmFa/rUvAyB9Tuw+u8hN5VGFUzR6qLHgoGJiS60yVWrS1pGyeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773279592; c=relaxed/simple;
	bh=0SXtsTgT9IuFByxCXdT7M5qT+FlB3U/D69kQlXMNq3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UY3V7u8mhyUqd8N7Z84cUIv1VatvdCN1wa+ZRytietGrBSKCMWpPifdTlo2xlsEVctc3KnQIysHyBM2tVM4YXvQlHBwu+QC/EUhIqWj+XPwQ5zzhol2994Dk8kdvZG7iZcvXdFi0jMWjU+vad7psO8Zh1spEIWO9jkTVBX+dkC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtK95c2p; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a43f1f978so4749931fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773279589; cv=none;
        d=google.com; s=arc-20240605;
        b=V+f7FwF1pVijbb564djYgPeOlma2k0aKgzjTzDd1pZ4fBqx3LqieDJvd8x9a/A8FdY
         ct7J2fEK6qWljTul3FiShBP+dXe0q/uhGLwpx10pcSRAmXD9C/pur32ewOJoSzMgE+5m
         djxkPIBrKEiD8Rl7ENWXXRiV4FCZbeFaRdkBL71w6sWBcvmH66VfdfNBYkFcLKjXI66X
         D9XbSxF4jn2z+GdZAX6jER4Jjy+gJm5GXickwgaSOxjKZvHob2A3XkVIz/EsTa4C9MXd
         zB1Nc2diQ1X1/Rk1jvjKYa3S1aH2gqEAqsfgz+poXN+OrSJKG8o37vUG/9KjR3I2FL7J
         n7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FM7n91Oq4EMi0Qsnljin2+dvXPrnJtrAjN4kRXM5Rvw=;
        fh=ULiVF/hHnct96RNurT928hwNGJ/9TBSBtKA8nZ6PDH4=;
        b=DsKrEvzhTxVltGcHyrMmS6H9WZwHSVG1B6y/o3+AFoiKfiJFkuv/5ljODTrKzR/M6/
         tKlsNthky6WGocLDSie0YqHy0jl1QrnYStdcsf4QnXWpvSTmwWHogzm1BZLVQD36c/DK
         qXhVgagUUcrpoJMpnMVd34Jsar/c2K47gGGL+xc22ZBM2Kp5f5Vtx5dXjfuzjHST1gCp
         P3ZclCgISa1JwbJKi8TuZIF1aTjaQBhUJXub3Qmjq+U0Hu1mwSNipnPe1PZTNlgyJavR
         aFElibZiIgf5Xd5LtW9GoCjqVVadvm9jGh/cwfAgUPV85S5sH10AnqlzQZSgO1DgfhMv
         jOWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773279589; x=1773884389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FM7n91Oq4EMi0Qsnljin2+dvXPrnJtrAjN4kRXM5Rvw=;
        b=UtK95c2p5qR/qa8g2OXqWTT4RMKj2K4XsxGsVd59x2ENuoVoY0Nsbezd5i7HRLqBOT
         fcL5/WlxjH4gR2onlkHKoahzY1rknH4VYmvJpKrIaeZf3e6AvmwcKeZ0/Cor7TB4m/8E
         ONgGSF8fIm8ObHCjUsodq3W5flktmXAk7fHT4Bj6epQKFwM2B6dFrgioIbNGXN2Z6nJp
         CY/dHic+PbHM0kuFlGJhLFmEvgAIf7M0H6tmOtzQvhOerFTTnNhWbA0wYEEuy0gLo2MR
         nTJhBwyGUO3VRL1Ik1zLyPiCXFmJd+A+TgHX7gbvN8Pwpp4ZQkskIniz/sV5vWyAgdi9
         NPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773279589; x=1773884389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FM7n91Oq4EMi0Qsnljin2+dvXPrnJtrAjN4kRXM5Rvw=;
        b=e7UImHnKiL3hdpRvZ8uc5FsF7GprxJElWFjvRSgweX3Q5gjDDXqe3/NRO1cQT71JNH
         bbBpcHaKyY7TRRDPrjb9f+Yy7vIbYxiJQdWy++QpWm0P5RCncPGEWuurSnOo6sD54RUo
         7rqtWGqLFTUrvz6tOPOEPhyvqGfOB0wuOCR2pxy9tARSaHhaDH0SpLFVLMFgsGnqYnW5
         Ywc9e6N/SNczxpWlNIkAPQmqWI3ygkLkOcxzO62To5tyUwL0DlE3fT6vhcOwtQ15qg7u
         O/SMeVRunFBHaMHbUiOCG00LWddqIVmbeBSDMSVz0dSdUWeOK2sxUs1X9zMhtDTajp6u
         /h7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwIm54hizXIVmoMXbDwlY9DgApDC7FM8dd6FTw4W+K3PnAciDRVkVXDyEtJZqQIcRF1kDiOr0ca+9rmjmg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzag7bBBenKhHNbwEJEU+0JXHEen+9apcnDbl/gTql+RdsgADOS
	6kkLQRG1iE8OqTMQ3iUYYmKFtOYDdypyfRYwoNh+uIXcdnawTmZ1facVgfi2jVwFW4Z9BPzcQbJ
	ioCQeXIA7sJC3LrzKy7Jwd+Sxgxb+gdM=
X-Gm-Gg: ATEYQzzq4pEDImZBRMa/WWf2nmWuLtjiigqxt9NU9on/Ak448t15BbpCtdBzuGEBaqb
	XVQ3yDcpS1fbfewLJ0Uc7Xjh6AMDSkXK1JH6bZsfYkkvurPY3t4Uauxc1XGJIM0R3rhlaMf7QEc
	Ydm4KugAwZhJK6Inv9b9P6GVAzrizh/BDbkD6GOkS8LRc98S/ZYITIjaAtFoEF+Uh89o2etEhKZ
	YVdRdXzF5op5UHFg5BZxqnQkQdqSKNRozj+qRro8RYPcJ3wFfvMgaIGNSBJ6AiWFg92DPgFPucP
	LKyCqUG/IBeVuGqtS/kKuBt6jqg6WDz13mXjSg4C1Wxd2BB3y0aTMBrxlVEXpwlk8Jcv
X-Received: by 2002:a2e:b892:0:b0:38a:56cc:628b with SMTP id
 38308e7fff4ca-38a67e6565amr15562361fa.29.1773279588636; Wed, 11 Mar 2026
 18:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com> <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
In-Reply-To: <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 11 Mar 2026 20:39:37 -0500
X-Gm-Features: AaiRm52jcRebLOKGRG6II1wULJvyLW9QFFSf8ozsKj12tdfaNCNcaE5_33htURY
Message-ID: <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Val Packett <val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97104-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,packett.cool:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sobir.in:email]
X-Rspamd-Queue-Id: 814DD26BF67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 7:49=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
> On 3/11/26 2:44 PM, Aaron Kling wrote:
>
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This adds a base dtb of everything common between the AYN QCS8550
> > devices. It is intended to be extended by device specific overlays.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 +++++++++++=
+++++++++
> >   2 files changed, 1778 insertions(+)
> > [=E2=80=A6]
> > +/ {
> > +     model =3D "AYN QCS8550 Common";
> > +     compatible =3D "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8=
550";
>
> Huh?.. All existing -common files are .dtsi includes without their own
> model/compatible, and the compile-time "dtbo" support is only used for
> EL2 where we want to apply the same thing to many many devices without
> polluting the tree with extra glue files. I don't see why this should be
> a "common device" with its own compatible string, and not just a dtsi.

My use case for these devices is Android, using a single base dtb and
variant dtbo's in a single software build. Given the aosp boot image
v4 setup, using individual dtb's would require different vendor_boot
images, which would require multiple build targets. This setup allows
for my use case, while also having individual dtb targets for a
standard Linux use case. To my knowledge, the final device specific
dtb from this is the same as a dtb using a common dtsi.

> > [=E2=80=A6]
> > +&gpu {
> > +     status =3D "okay";
> > +
> > +     zap-shader {
> > +             firmware-name =3D "qcom/sm8550/a740_zap.mbn";
> > +     };
> > +};
>
> Please use the &gpu_zap_shader label.

Ack.

> And does the generic zap actually just work?

The devices boot and the gpu works, so whatever code path is being
used works. These devices are unfused, and based on what I understand
a zap shader to be, switching a gpu from secure mode to non-secure,
I'm not sure it's needed at all. I have not tested just not setting,
though.

> > [=E2=80=A6]
> > +&i2c0 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c4 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c12 {
> > +     clock-frequency =3D <400000>;
> > +     status =3D "okay";
> > +};
> If the individual devices actually use these busses, better to enable
> them inside of their .dts as well I think?

I can move them. I think the idea was that all variants do use these,
but for different hardware, so might as well commonize this part. This
part existed before I started working on the devices, so I can't say
for sure.

> > +&iris {
> > +     status =3D "okay";
> > +};
> Works with generic firmware?

I have not been able to verify this. Unfortunately, there is not an
aidl v4l2 c2 hal for aosp. If the expectation is that device specific
firmware is needed, even for unfused devices, I can drop this section
until I am able to use it. Or maybe Teguh could chime in if this works
on ROCKNIX.

> > [=E2=80=A6]
> > +&pcie0 {
> > +     wake-gpios =3D <&tlmm 96 GPIO_ACTIVE_HIGH>;
> > +     perst-gpios =3D <&tlmm 94 GPIO_ACTIVE_LOW>;
> Current binding is to put these inside of the &pcieportN (renaming
> 'perst' to 'reset' which I just noticed I failed to do for one of my own
> files :D), see x1e78100-lenovo-thinkpad-t14s.dtsi for an example.

Ack.

> > [=E2=80=A6]
>
> Thanks for this work, very cool overall!
>
> ~val

Aaron


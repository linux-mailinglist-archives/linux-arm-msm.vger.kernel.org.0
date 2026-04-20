Return-Path: <linux-arm-msm+bounces-103727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN9fNxL45WnjpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:55:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB74291C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6D25302EA90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A3B38F938;
	Mon, 20 Apr 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlsYNnM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE28346A1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678883; cv=pass; b=p/bbqBJqhwdzaNOrFudg+bM7AOcZ9uKMaV2Bf3rorl777BMep04MUl9Wvj6ayq8fOjHv1SbjqlKoo3qFzPiA5K5M3negqNjmD39ObKaE/Mz5GIHcvVObHZrzihpXPTzGmvnDdodxt1COhdp0BM8qXL7CQj8MW/v3WgQ6reBnPH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678883; c=relaxed/simple;
	bh=7UvExbIeD3tlsWMAYfT1uc+7TrjaOP43XMCCIIitSK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqmhAO2lhR7n+8q4SpSagIIhAMro4jGg+3at1oI4PNQcJj49MjqUqLS4D9EeB+MDVkk83VGJNY2VGx2F4oyvfK9OiJVBBcGRn8EcDTGYr4IU303PXe1vylATqB9zNTg861ttat+hmfhM+Yj91vn0Sa3GlAtqpsGCBpXO3TqdCAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlsYNnM2; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95697b46831so1737353241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776678880; cv=none;
        d=google.com; s=arc-20240605;
        b=KqNbmmtL7+gP6PIafk9Met1//vkf/96Wn+yubILN1ckq4+q7P4ltb5063UoCEFA+yP
         opS35UMmkY9cCPKeRauh1qT4SOzWRmLX+btWYWW3Sk8KJTUAs0/0sqdPq/+Obb5waI+Z
         9ZmNrTWdHy7E4MikDPm4BzsoePRUwaNXPKwaOdo95G4AT9ubFBgcNt9d/EhQcERaUXhp
         HN1C2+CzRjd1fTmvErC0Hg/R9ju5su1NsIW+iBBIYKuwDwJ6yFIVtFrBXv7KPJYb5o5v
         aIk90yC5qfbIudWsFIHj+KowWogtHAHwgZJuw0wdm9NW9AyStcGARG4CiSn0SljXbATB
         8I/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        fh=1wETvvYy10cM905CNLM90WQN3EEaSZZrGnLlacuDuNE=;
        b=dKFmnkxalqE4jjBVD/gCvMHy8sXIkVHEg4qOV6wCiAty22rveifbcBl5XY0rVKF6TO
         /ZnYHNHRYqZ6QLgdCMe+i06LKFA9Cpo/YK7Xm7KzTWrFbiJjHXVSbdCgpibxzsWDFrRB
         3UG98z0nOHV6Qm1uos1QTiXO7LwdQw8e5nq6CFlF63iaL8c+mOtlImmTjqxYScsw9GsZ
         l5P0gCWAVDj10foHKO9qDy1GeEhBRuXPLj38g72gZURzO77hO0Q9ZpjFZjSQXG5hfC52
         utF1X6eLn/kPgOiNFdBAf/1IsnZjbWvjfbwADgGPQ4E0Qw7EMsBr9Mh550ZOHHBhdS8S
         eOSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776678880; x=1777283680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        b=nlsYNnM2O6dXdIejt/3Xmf92//ez9DJxREJhTSgKV4i80ak7L/tPcCRJ6wNvEuzkLl
         J2yLQNBHyrgXUDdMks5fP9/2BIjptc0lfhS4XQU2yDKzzezcqfb0OAoftRMmJIshfNiY
         t5ajr27I1JfxAGDJyukQLO02Yor2XHGf7gzf7fl71Zrwab9Q0vAZy3FGB5YrzyovOwO0
         ldbbC+d6XOqGokt5vaUEiIpH0S0njq7aumj1BmJsSAs3qxIPlmuqmhJobPVl7DT+VWdl
         677tGGj6DfrwCD2JtKkVScQev2yTGW0WoHxijhsPfBAA1Na5P2A9JPUdFv7WYWJxbfid
         +lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678880; x=1777283680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4d2tN5ITOouglEb8hvRsznm+CPRPu6AedRhwFpCSryU=;
        b=LmPDfsomNDd+YBiRuHwLKgfEl+GMAQdz88nxW7vd7ytsA1/68aTUqTLa7NL25bRHfW
         QD5By0tPYe92wFcUcVhhb1RtanJKGGle+/EUczc0XZsR2MY+//fwPQSXfr/24Wc5wEeg
         bTbQyKoYmusVpKixHeu0IcE9BYBInPDL666JuP+dJ4VOJfBfZKq4u96JHZpXlji51u5z
         a60fBLlEO6cp7/rLhTuDddlesrREzU5oPEipHUVylUPAAM6kvzSZfT/dxLDAcNzW04GU
         UxDD4hNk+8gmAh9yKxV3j5+2zfTxuCfVvwq5csE8fAmqAw/MyxmO3duTP3JYzrFZcr4T
         QH5A==
X-Forwarded-Encrypted: i=1; AFNElJ99+ByNNmZa/IiaXbITDu/ZH76yZw32WGphMi30Xfm/yKladuihphA7NHoZidPu4qvHHytRuXPUCKUVECVj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FfjomOO7S0twFGE7rLyjBUD23mA7rqZERvT3nPyNg5lc+AQi
	goqKVeKeKMI7Xz08jc0GwTOeWk7Aad8MSHmEiZVCylsOsmMDvNrfYraxttCC4PSrQEo3Uc/Ur3r
	TsIBpf6lJ/JLniyAXn1GFaJYBEiuj7X0=
X-Gm-Gg: AeBDieuqRj2S9jeyPbJw7dzbyv4cxV6cO+cC0ArtN87m5qGBcDtF+mcarIfHwLNJDDC
	6S4xVw7tr0ceYhl9moycp4tltCrQU38Pfcn6ycGbDWldXhAls8BaCQk/n0Jd+4myThigeWA71Tc
	dYLM+BuA/cV+VGr+VCoH4LdsmIDZU4KS9rBSMJULFub/p2rWkFGHgIvVszCLvx2Kb1CIJSzTbYw
	3C+dth1+5sNEVGPF9nIjhUQIWfLUm3YtbHSiNSUUcyUqcPQ0Cjfun5H4Kf4+0+5JAMWSwK01ROt
	qJlZRA7Oe+DKv0PI2SGjy149ne82qwFj4CTLl68FSLOX8vRc+Q==
X-Received: by 2002:a05:6102:2926:b0:610:76c6:b74a with SMTP id
 ada2fe7eead31-616f67c64fdmr5489740137.14.1776678879944; Mon, 20 Apr 2026
 02:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419173251.1180026-1-mitltlatltl@gmail.com> <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
In-Reply-To: <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 20 Apr 2026 17:53:39 +0800
X-Gm-Features: AQROBzBhXvAo0BDTZ4zuVvzNm5aZMhjKtq6C0HLFOMa4Mr59QCzjQGURp_WG5hk
Message-ID: <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,b220000:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 54BB74291C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 4:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/19/26 7:32 PM, Pengyu Luo wrote:
> > pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> > are mapped to them respectively, so add the map entries from pdc to
> > gic. These entries are reversed from .data section of qcgpio.sys
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
>
> The below change on top will fully align it with the data in the docs
> (no functional change)
>

Glad to know. Could you please help to check the tlmm map too? When I
was parsing the binary, I found

tlmm 65535 =3D> pdc 70 =3D> gic 520
tlmm 65535 =3D> pdc 174 =3D> gic 733
tlmm 65535 =3D> pdc 175 =3D> gic 734
tlmm 65535 =3D> pdc 176 =3D> gic 735
tlmm 65535 =3D> pdc 177 =3D> gic 736
tlmm 65535 =3D> pdc 178 =3D> gic 737
tlmm 65535 =3D> pdc 184 =3D> gic 743
tlmm 65535 =3D> pdc 185 =3D> gic 744
tlmm 65535 =3D> pdc 186 =3D> gic 745
tlmm 65535 =3D> pdc 187 =3D> gic 746
tlmm 65535 =3D> pdc 188 =3D> gic 747
tlmm 65535 =3D> pdc 194 =3D> gic 753
tlmm 65535 =3D> pdc 195 =3D> gic 754
tlmm 65535 =3D> pdc 196 =3D> gic 755
tlmm 65535 =3D> pdc 197 =3D> gic 756
tlmm 65535 =3D> pdc 198 =3D> gic 757
tlmm 65535 =3D> pdc 199 =3D> gic 416
tlmm 65535 =3D> pdc 204 =3D> gic 462
tlmm 65535 =3D> pdc 205 =3D> gic 264

If 65536 means the pin is missing, I will send v2 to remove the tlmm
map together with the pdc removal.

Best wishes,
Pengyu


> (yes that's a removal of one irq mapping)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 761f229e8f47..23e80c765384 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -5310,7 +5310,7 @@ pdc: interrupt-controller@b220000 {
>                                           <66 438 3>,
>                                           <69 86 1>,
>                                           <70 520 54>,
> -                                         <124 609 28>,
> +                                         <124 609 27>,
>                                           <159 638 1>,
>                                           <160 720 8>,
>                                           <168 801 1>,


Return-Path: <linux-arm-msm+bounces-97154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J+cEBdgsmlmMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:41:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D516C26E000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8851D301BCF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0769F3A8736;
	Thu, 12 Mar 2026 06:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eapm8q3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816A3A6EF3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297682; cv=pass; b=D+O7+EvrvLN/OlZOksgsMIJvA6Wokg5vmf+gkDB9zye1a7Kk3+zIdQVE6m2QbcE2uhKiBYxjBnhIGCQu/gB+IsymBp6Yym1KDA0nDk19nAJW5QG0rBFxCsowPsMVtqDYWLpwaW958Og5zo4AyRCDRTiqVdszIi48GK81LIUzudA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297682; c=relaxed/simple;
	bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkUDeXdi6MqFKVJjYr62ceua7kJVQP7LnKRYL0QJcmBaBydoHZbSoyvFHBRZRCWPw/z1NcupUQV0+4LsM6N8QZstkbCl/2sA9SFCIJxNQS6J33rF0/cedFWKYkPPpg9kafXlmaf4cquRhJwfSnIso22XVjRAxKve0rhOl7sM1fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eapm8q3E; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94dda16ff9aso161833241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773297678; cv=none;
        d=google.com; s=arc-20240605;
        b=LmaIaXD+tim+GGG4mL8KuNhZC4auUkS8oMDRtlaKEHLVTdetGI5b/mukli6orAgoJy
         c3/cZCz4ajS+QsQvG+PRbpvIP4pjsobokzpbcBpOnC1PPVmvr7gEo9BlEZkQKwdueI3i
         bz1WtS10u+46yN4H1pJTF51T1MXT1WyJidQIXEqzPpT0mm966i52XIkDCCXxcvgJtnaL
         eHhs6ZeoUvcCPjfzpAr/GABnm9LUyBeAemaTZjFKGMLZggFwlsc2g/FnYFfUA1nPTfUG
         EQd+6G6RGvaigw2zaGdR79M/nxKb4WjxM/H388gtk9V2gKmZ38CrgWeT8sveo7XbItOx
         Gf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        fh=aFqr2J/Yq7LU1wXJVRg7MDI/D/s5tAinLzcbJ48GERc=;
        b=Xk2vOClmoji1JnEY+7QTaYclVrXn0pm6p6HMFigblX6MaFGuw9+F4KA4j87+ygJ3JJ
         Rfy7veuCDUTXeQ2XVLYxNL/MRkpwiGhHxPsVNqvs3SNmcLgLW0xIHCkuCRQwD5Li63yO
         inJyYUq+m4hl0Dsrc87fFSK8eFCvHF5mpqh8ywKlCgE9nLR5RuLwsmRutVhYXmk8j2Kb
         h25oESIMi3udHi+zjpLFk2Tu/8ua1oGIrjK2ozxePGH4/M7ev1ZL13dxfxascEGC52uK
         GWYpIXgncQVTygIDVUpUppJxE2ozn+3MBo427zfYa5x1jEWRcPKOiu+CaWxofCY/u0TY
         QQcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773297678; x=1773902478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        b=eapm8q3EK1SFDMUx6sCVYTTiHPWhq1cZUUR9TVZ2sglxTNXndvaz3TIWtFczNCaJSz
         yWkAcPSypiKssA/7J7C2wk9ep1D4D4IFKl0qasLHySpk4hFor0X9o/FLC92NmbvyZKB3
         HrGu3kO/meF3+hF7n7hjWnyaUFkIEjEz3S3PuOviCMvAavVatmuqK008wzWo6q/P9tfP
         xGPa6eNn6UNKizJAAxW+KxqYxrAZygXvPJRUjx0RrHHOPH2VeoL85TE0dBeX+N7+NyE2
         9lrIOEAAERQaDHgJWnL9C1E/xNN7hKFsdwkwWnH7aIzAirZdJFH0Hzpu0h12qsaceTOg
         nq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773297678; x=1773902478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruqRuW5SL/WOPbRDc7f8nNsrXjE37PMZPlSi9lQGPBA=;
        b=nw/Uxtv6aat5636oR8aeEdku8jNnTR8d+qeYY2shsn1i2b0kvn0vHbweSD6TX76Ttr
         k4JqWPJ9Ywp2lln0MaKEbfRDuxc0VCnk4OZ6Co93WzmUnHuTmyPEiVhjYTi1cEUFgY+b
         3znldQRyMaqg9vC1mffY5Eu96x7bixl1BxwspZh7Biu2oY+BHyLt7HfIOe4iwxH5Vw9I
         ztnhJNw23L/MmocGJn4qPNKPcU5s3geqLEZNbh7Ok6p1NCB6NPnieWjiVA7fNnKDKhbE
         cXoXdIKmXTHuUl+LFgz0AiFDQ6dTM39Uj+aMA7KiOI4rCKMjezP7tNS/J/EpzGKawG/J
         5KFw==
X-Forwarded-Encrypted: i=1; AJvYcCU67lT6rrHHgcgSecICgl04A6kxpWQ2acq+glxgxJQ/8oqOrcsRIPuvtx9Q5zo/LrQJVH6Z0me9q26+NCcq@vger.kernel.org
X-Gm-Message-State: AOJu0YxwYzl+0QMt+mbejI2hXOFeVTSYbAqye/UVEjIPe25tI4WW4ggO
	n+qODxWYLIIe/5jHIDCZHIAxj04JOggZZIsGZw2YxBTnwwzNPajYx/CA7Ln7ByA6BXGZ826Wzk8
	Y4GFhq8/fDUjuozRStvMfylP5D4+wKMs=
X-Gm-Gg: ATEYQzxJM4sLDpk+pvQQovXUC/DrFKphqAShOp3iYExY6OCnGErccCsydCA+z/EW5+o
	yXBGU8VL+sr4jFlYW7k2teQYXv0oMAw6R/XFY/YcWvBkFryTqQjKwKulX36Lcck2QcwdoNX7kk/
	tI7ZgEeaZPgoOjToBsajbIPzF8KoZaD/veWStg80F+Ls5n0EXQ2LDhDhNd4Ek960oAj8toOaVva
	48mw0nGKR1jCIs27iU2CUWitGvSkWdUhQGrViMavYNhyBfbJNzvbNSaQvEO4EAsCbJDr/tcGbZR
	hK5bl0qd
X-Received: by 2002:a05:6102:c0b:b0:5ff:dd9f:3ea1 with SMTP id
 ada2fe7eead31-601df08a60amr1728016137.39.1773297678151; Wed, 11 Mar 2026
 23:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
 <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
In-Reply-To: <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 12 Mar 2026 14:40:54 +0800
X-Gm-Features: AaiRm52ANSGIe5raH-Y5MaxjaPKZX8myZRmP4R9pHNsa95fTfc0HNUXVKy8RQA0
Message-ID: <CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: taniya.das@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, 
	ajit.pandey@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97154-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lkml.org:url,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D516C26E000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 9:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/9/26 11:27 AM, Pengyu Luo wrote:
> > On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wr=
ote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> >> is simply a separate block housing the GX GDSC) nodes, required to
> >> power up the graphics-related hardware.
> >>
> >> Make use of it by enabling the associated IOMMU as well. The GPU itsel=
f
> >> needs some more work and will be enabled later.
> >>
> >> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>
> >
> > Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
> > the raw register values are
> >
> > 0x3d68024: 0x00000000
> > 0x3d68028: 0x00000000
>
> These likely indicate that some clock or voltage rail is not accessible
> at the very moment you're reading them back
>

It seems to be harmless. In the downstream, they are always zero too.
TB322FC:/ # devmem 0x3d68024
0x00000000
TB322FC:/ # devmem 0x3d68028
0x00000000

In [1], the commit log mentioned
The GX GDSC is modelled to aid the GMU in powering down the GPU in the
event that the GPU crashes.

> GPU support for 8750 is not yet upstream (and A830 is somewhat different
> vs the supported A840) - there may be something wrong in that sequence.
>

Indeed. Chances are that I can't enable gpu. I must reboot again and again =
to
match the sequence by luck, then I can enable it[2], and I must
disable register protection.(I just noticed the hack from here[3])

> I heard it's in the works though, so you may be better off waiting a bit.
>

Glad to hear that. I am looking forward to it.

Slightly off-topic, do you know if anyone is working on wcn786x/wcn7880,
sm8750 QRD SKU2 V8 Power Grid uses this.

[1]: https://lkml.org/lkml/2024/1/23/1408
[2]: https://postimg.cc/xJr11DK5
[3]: https://github.com/gio3k/linux/commit/f96512ab05a1bcc6b7e82b27f44d9072=
38fc64fb

Best wishes,
Pengyu


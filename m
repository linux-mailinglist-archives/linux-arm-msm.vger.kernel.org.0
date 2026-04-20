Return-Path: <linux-arm-msm+bounces-103738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLxtOWUF5mkIqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:52:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88F4299EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA07B3057D52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FF4399344;
	Mon, 20 Apr 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl0XGhGF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805438AC85
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682077; cv=pass; b=DTyS0M6E9dXvrgB0Yk7MUdeUGGId+HLpfnfD4DVkB/Q1YmwfU4IpNFSI/ldkfmTzpF/eOYwtC0wDwq4OOKCy6GciqsPcGZKQmDCPetqRu0a1OWOrkg3BPrAt2PyT7IKbgqeSigJ5dEwoeimFUHUOgLn78waONEXjOgiQ1DPkdIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682077; c=relaxed/simple;
	bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyE1Atuqfj5FjtrzrDdTd+hpcrsevS4A2FqAPrFq7NYx+MKH7kWEwDttxxCoP7uXw6dKd3ycQRNwyqUnk9B6GmDqQBcNB0wq/4uckZlz0SBDIs8BmTbAysMlzCfQsE6Uc+joel1D/9OyaKs+E9Va9JoVbuSoMzJT2HpPG19jSL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl0XGhGF; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9589125e047so1033605241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776682075; cv=none;
        d=google.com; s=arc-20240605;
        b=KuH8a+RwgVQ/zoLLWvvjlCWIn8lHFywLuQCM2yBEhnSzh6Y+pUldrSK5v+dDDzHXxY
         5SN+F9xiayPOwv29hohpDqcHB7xsaf3pHjaupFVYFMndyKJ4zDpc+aOBqQJiyVF3039H
         pETktPB9EudTTbbKTm4MnjWkoaLfIReyou2weEUKvbWTwXZCnPimq+nUc1i4uzZovHi8
         cRPW8Z353oqzOYb+xnXXHfK+rn1qE0ESKiyUOirjtSmjQxJEWHQKbtzeKU3V8mRoI6Y6
         k94ixYftVaJPfHwuyzCWChOMAMaO1VPDwIQWfOkpwkCIhX1S9lUrLDodghhqDksM66fh
         0JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        fh=CVTi/zHzu892VnvH/7/vc48FIDkD0fY/3EiBCRLXyPw=;
        b=e5Q+SA5jrYg/nf632Iss3tEPzpAiSNxnMVt8oR7+PTPbn1P42RebbVJdebz5dGYbCO
         ND4Y6aN2TilTojsVD0GR04jBtinY74Xgj8zl8JVmdnLLznFr3brjpzdAVGzPUWw4xdME
         a/cE0+v8EknDMKy30QvSjd5tdf1H6v6FgyAqcPAeO7JKaOulv9eYxhHSuyAUH4NXzE76
         2mc6vBSKy1XRvo/FDvXIld6Uijpq2SUt2umT2cppCKEALFy2wUHoGbTv9p4RZWI7LYyX
         jRRJetZm9Y9d5NqQU4S6UWguvqNOOtBJKDpppfEQj+Eb1Lz0eiw9EyMTxNGz19RW96lF
         Ga9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776682075; x=1777286875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        b=Hl0XGhGFUOoGL+h2gvW2/uCGWUArhe7IyzNyPqEv7R6bFANFcbNEN66UKFrsKkL79D
         FLtJg5j6du64n+AwguX5AcIJHjs6etqUXjz3iBgTIAQkocZIs0PUu6/obSRdiWuYfMDO
         QUrqQPWsSO6Ih+OM9NyBrcAiN9PQxfqJPycgTlPZnmBquQ+uHrdvoFvOye4wAWM2XWn6
         72YDs2yQGp+SGBgu9WEM9JGImyxhhJAvIg4DBEJjK1ImBPptVRfq8m81TXuENAP49C06
         rucpuKKRM3tSvtv9o3zw3PyPSNq+MSoSOM2jBHFlbh+tpJTkhiOmhxIeN1hrDti66Fjp
         KIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682075; x=1777286875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BuXpBZf0PEuPT4+OxXy/9cCxBlbL135WGtLgJcfyrsM=;
        b=Loo7HNKGQy5Q3itxabebu3AmQ+dDrQ+zeayFupDVv15KKory+XTxUbh/efJt7OAVj6
         jHABxbo7hPtwFbijQd9CYgUPkVEM6Z3AKx/puwQmU1u8QgEzGQDzmQZXgyQaypd00GUf
         48Y97cg56esE90oo68sejbFCpcQ7EZZKnhn4mXbOc0iO3jrOau8kyF8LtJX5KSp/f9XO
         MinLGXWNInPfNSh1bH4q380R16Bl7eux+nrP+52hsSo7mHxKn2y1r1Gp5AeC02r4cEwJ
         UWorUAtrH/iI67WqqaargrMkbwdQZDV0AFMjJwTJE4rE9LFokxA0Vg2DfhOIQGgcNcBQ
         NkqA==
X-Forwarded-Encrypted: i=1; AFNElJ+hS315E/OjQZQEyCUJ1mvmLrr2jYaD+JgNsqe1LUoIGvv2aU+BpAVHrVONqEhpuRrQSPTH1GIUFN+xu+RH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJrq6Sur1K5blLBZrFCa6Zzm1dsWkJ9WQTt1CEmMdEjK2gzyo
	5nKJiHX5bugkpDJLT3DlMaefZOJhAzQCmQO33p/jGYX53Ex0q0j4b5zaWl6UVgknx2mdq5PaSrp
	XHqYmnrk4TYNL/HVRRI/4vqnxAn5cWhw=
X-Gm-Gg: AeBDiet2mPXhdFjMp06if5BF5s3qpDP3JfXGqiFRmI/uxfQK9xz+1WlZt2PVzRRaAP/
	+cr3wprDheT0/vHyatfl5thJpAMipMNA7VZoADI63ZiG2eSIwnAS6YDvuk1KH+QVsFh7bhqBOUX
	iWG/0cLBm6HkP2b5E1LhnxdQ3ACYNT0CdlZ35svEYOg6DF+bJYuM25PKcQStwb/yx2bytC/Crzi
	pmlCOLquRHlEGG+Iezto6nt4CgMcf0bG0JEV+TrTzzVexAA9Ag0WuMy+Ljlr7JzZyk3Zm2Sckgj
	Inrq+KQPYFEmA6UmSFrxmcus2iBpJ0z49BbRu5glcSfEg6pWaw==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id
 ada2fe7eead31-616fe259128mr4162320137.16.1776682075457; Mon, 20 Apr 2026
 03:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com> <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
 <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
In-Reply-To: <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 20 Apr 2026 18:47:10 +0800
X-Gm-Features: AQROBzBXeuTko6XXozsGKebKRRWjUWdntml9cNUG_m-eg2R5qI2_Z502Jjjqav0
Message-ID: <CAH2e8h49SxvPtSXB1AWcNNfqC_ZV6-V2YKbN2_rwSemh7G3b6w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103738-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 8A88F4299EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 6:21=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/20/26 11:53 AM, Pengyu Luo wrote:
> > On Mon, Apr 20, 2026 at 4:32=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/19/26 7:32 PM, Pengyu Luo wrote:
> >>> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
> >>> are mapped to them respectively, so add the map entries from pdc to
> >>> gic. These entries are reversed from .data section of qcgpio.sys
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Konrad
> >>
> >> The below change on top will fully align it with the data in the docs
> >> (no functional change)
> >>
> >
> > Glad to know. Could you please help to check the tlmm map too? When I
> > was parsing the binary, I found
> >
> > tlmm 65535 =3D> pdc 70 =3D> gic 520
> > tlmm 65535 =3D> pdc 174 =3D> gic 733
> > tlmm 65535 =3D> pdc 175 =3D> gic 734
> > tlmm 65535 =3D> pdc 176 =3D> gic 735
> > tlmm 65535 =3D> pdc 177 =3D> gic 736
> > tlmm 65535 =3D> pdc 178 =3D> gic 737
> > tlmm 65535 =3D> pdc 184 =3D> gic 743
> > tlmm 65535 =3D> pdc 185 =3D> gic 744
> > tlmm 65535 =3D> pdc 186 =3D> gic 745
> > tlmm 65535 =3D> pdc 187 =3D> gic 746
> > tlmm 65535 =3D> pdc 188 =3D> gic 747
> > tlmm 65535 =3D> pdc 194 =3D> gic 753
> > tlmm 65535 =3D> pdc 195 =3D> gic 754
> > tlmm 65535 =3D> pdc 196 =3D> gic 755
> > tlmm 65535 =3D> pdc 197 =3D> gic 756
> > tlmm 65535 =3D> pdc 198 =3D> gic 757
> > tlmm 65535 =3D> pdc 199 =3D> gic 416
> > tlmm 65535 =3D> pdc 204 =3D> gic 462
> > tlmm 65535 =3D> pdc 205 =3D> gic 264
> >
> > If 65536 means the pin is missing, I will send v2 to remove the tlmm
> > map together with the pdc removal.
>
> These seem to be LPASS/SSC GPIOs
>
> There are missing pairs of:
>
> TLMM 151 -> PDC 264 -> GIC 191
> TLMM 143 -> PDC 261 -> GIC 402
>
> and very interestingly, GPIO 190 has two mappings:
> PDC 70 -> GIC 552

PDC 70 is connected to swr2, which is wakeable. Speaking of this, in
qcom,pdc.yaml

Drivers requiring wakeup capabilities of their device interrupts
routed through the PDC, must specify PDC as their interrupt controller
and request the PDC port associated with the GIC interrupt.

But swr2 specifies GIC.

I wonder, when should we use tlmm, when pdc, when gic?

Best wishes,
Pengyu


> PDC 178 -> GIC 769
>
>
> Konrad


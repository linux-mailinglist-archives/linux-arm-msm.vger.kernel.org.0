Return-Path: <linux-arm-msm+bounces-105192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LrGHLHq8WmalQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:25:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F44937B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB0BE303B4ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603683F1674;
	Wed, 29 Apr 2026 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHJYPyLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07483F0777
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461891; cv=pass; b=TWsu0Nrzgs+/4qmjVsAnkSITp69QMsqBN0FRYovIPLYdj4jclmI4YiN10C300lKmmCPpxUEwT7nfCLokCFHEHjDQcxy3bZdMt4wGzk0BuJnUKEB7H6Vi/X8OgjtauGjcGBrizDDEnznJbIa32Nncbft7LDS9TsZTs6FjrmxXnq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461891; c=relaxed/simple;
	bh=QbqXT4tTrrdjuTLkfmMqgyWw3/qNy/1JnUwKAJmmVXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pC1ABfQMfS0cx0P72sbbQW33/VOOa39ff8iMGOvyQwyCvg1XAgAq0A89f+pd2sOcZ+68swg1VJJQIYOSkoq6LFO2ndEcn6TzJ33udy4e97XDCUP7epI4OVyhncem5iivRTjadFhbLsXhydujlWWGWSfr+JWKi2oXi+8cHl67P2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHJYPyLc; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-954997c9014so5759865241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777461889; cv=none;
        d=google.com; s=arc-20240605;
        b=DlW1362+wR9aN1srkPFeCQtx8cq3ZWTfIc16k7ur3+0LXHK8NjH/i25uppgvFSHmX2
         1RHh7BiCASBrvte+XFbjS6D+kJAUHoZznfjLUOpF/DY4pPG+/u9LDre7cXai6v/JtbsU
         EpyI0SaO600ARfv8opYFcOJYrjbw/Gg9LB3x2Mc0BRu98Uq2PsYULBUgSdAXnVyhTBOc
         S5XX8cSQh6MBra5YoAg+0gZRtIfvoPlmRkT5b6NMtIsMfMPw+n5CpmVmowuicGgZocgQ
         Ak0IYLq4jhBIlBQUlrKSV0Fq0AzQbwKgqyVXjJlh2IStAOtirTfOaRGgmd2El/s0j1nW
         hGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        fh=sXJ3Ag6vFYGAXaR9d/OHEpGTW/fVQ+NrKG/Fz5tJZCw=;
        b=cqHKVk00wuFSpc8XY5Kt8I22luLDgFYZOlUW6+WkoUqjqlTfHUW4OSscTcTonGe2Qx
         jTLQIw7y03yAfh0J+seFj8yaQXFzYde+YymSIrbkxUOcts37ssMxQ3EnQ3ORBB09V5fY
         YqjB8HlKN3yI7xJa1eP8XLixrK7NcdDVZB+xwc+SV5hRaDB384x4eYlplffUyBqP8D+j
         k2roxJIJ4Os9Ou6LnVxWsQbXpj0Zc1QTjGC0rrCZjGjOe0FzIdhivPm78eRDTLtxnU7S
         ZFU2mBvR7bxp6chHnBU2myT/fTXQ16wd34Zm2CtSKLeVDGIyIdlYasOEBR0PRPu2gURQ
         EGKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777461889; x=1778066689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=DHJYPyLcfCack5RDNBh/WbrKv+wXFEVM1ogNbJePRh65yBH+9P8v4lakenfWlxAmUG
         gEqwnP4iem6/J2IU4ISlhomYEyM1i2P+F4X2ClbHh+mRSsCj5tigzw0i0OZx2MCW5fVi
         d/w21fuXq16Ul2O7iJHGpkYMM1892ghWW9xpcwsf+4Ko+E1uxg9zj0OP0F/ytJUty35E
         R2YtSCIep4y1iuIQbK+/mdMLVAcxU2TKIFPxihta1F9IJCzeTU509pBuMIMJStw6hDC3
         CDgH3q6Oim510t4nrUkPPrBDNdVjt7Hryf5wT9jd4saWoqRoBMCEr+mVGFwEt9d9lSj7
         XQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461889; x=1778066689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7gz2/nVmfgvH8AxcwgS0YP5YxZm2HnbLT24tkQ8ZyMI=;
        b=P5Rw52N15yjAw0PtYBqv0Hbvm6pzqs+13IR6l3X7uTIpxYixiBmz3HzzFuyD9EmoUD
         zsg+zIhaCt28yzIKkFgbzP9x7CqE0OJMkREA6gt22d7OGRT2BxcDv6+sWgEZZTWwrdmD
         GJx1K6V8v9MprM+sVFiIkwhf3Ni1BGOeDxCDPsQhgG6ozXQLWrtfSYF0kd+wbzTuby7H
         u7+GEVdSqtS7hzjgajE1TMfvmJONIGIZb1itepCYLJCuWpldF3a8gvbL1hNCoqIvzrp6
         9bD6V2KHlIthH6QgF15pyOIn2bGW0feo9OAfs4BDiN6DSXTL/V+wYWZW2B3gB8g1fVpq
         5Rug==
X-Forwarded-Encrypted: i=1; AFNElJ86jYzA2WqPxYDs/2T9JNwjXJNCP/fH0gIfIHJQyKTPGMNTpcaAWtlnGHF6s0lFgFtH0FMXLs6zOZ3Kc70w@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRuf6HKJ4I1CHc3Sh/E24BWNMi2i7gizXScbIsJt8fxjNQD+p
	zugaYIXFZZrOKvf6MiZQcoCrslPG/O2PDjeWcSbLciF8OCHdfYAhaA6ZiKmLqNJCS7O5d4hSpf3
	wEkxWj4kzF1Fh1/de3Y8V/1lxWhOBqoA=
X-Gm-Gg: AeBDiet308OGpAzZRurPfuMqVemXUhquG5yWa6ojfNtYyNWAzt1OQa0Aj5XcSu7vk40
	jNTnayikvr8xaGw1XhkupwjfBZfKwANTxC+QpSo6vJODNBmccxwv3D3QZ67QUMaD+mF8jSsKN5l
	oABL89awaWjGqZCHye+oQnL+kaw/S2tvpL6nvAzWbWWOckuadsiq5xZ/OCotgLPgBpBUfUj+bWA
	OiehlVgI1hjOc78wxUJCKVNJg2A/UIr8TWFIh5Oe/3Fgmxy8MjiXYRp8NQCRg3p5EQc5Iq9dJuI
	1MwQHwRgrT/zbyZd5O1ejehXHUEMuDM6ZU5qYKCQ1DzUdnfzAQ==
X-Received: by 2002:a05:6102:5e8c:b0:609:4d86:81b with SMTP id
 ada2fe7eead31-629278208bamr1936529137.27.1777461888827; Wed, 29 Apr 2026
 04:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com> <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com> <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
In-Reply-To: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 29 Apr 2026 19:23:57 +0800
X-Gm-Features: AVHnY4L7oPV5ZetIKykRzVLPFjvo6DuPoYEk-dDEME-xpa-a28o8EUMduxtFbTA
Message-ID: <CAH2e8h4MNsaFiYmO_y8Pn8XVREGtGam5xY=yeFCK7p6BkD4y1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1B1F44937B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105192-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,qccamfrontsensor_extension8280.cab:url,qccamfrontsensor_extension8280.cat:url]

On Wed, Apr 29, 2026 at 6:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/29/26 8:36 AM, Pengyu Luo wrote:
> > On Mon, Apr 27, 2026 at 9:00=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/25/26 12:52 PM, Pengyu Luo wrote:
> >>> Hi846 is found on my Gaokun3, descripting it.
> >>>
> >>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> >>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
> >>
> >> Are there any other noticeable hw differences between the two variants=
,
> >> that could warrant the DT to be split?
> >>
> >
> > Except for the cameras and cpu, I think no.(But I couldn't tell all
> > 3.0 variants are equipped with hi846) Before camera support, this DT
> > worked for both of them.
>
> Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
> two nodes defined for both cameras and the _STA method referencing some
> object?
>

No. It may poll sensormodule binarys, register lists are in
sensormodule, the slave addr may be here too.

In qccamfrontsensor_extension8280.cab

CAMF_RES_MTP_ALT.bin
CAMF_RES_MTP.bin
CAMF_RES_QRD.bin
com.qti.sensormodule.hlt_hi846.bin
com.qti.sensormodule.xinli_s5k4h7.bin
com.qti.tuned.default.bin # for hi846
com.qti.tuned.hlt_hi846.bin
com.qti.tuned.xinli_s5k4h7.bin
qccamfrontsensor_extension8280.cat
qccamfrontsensor_extension8280.inf
SCF1_FRONT_MTP.bin
SCFG_FRONT_MTP.bin
SCFG_FRONT_QRD.bin

in SCFG_FRONT_QRD.bin

Package ()
{
    "com.qti.sensormodule.hlt_hi846.bin",
    "com.qti.tuned.hlt_hi846.bin",
    0x0000000000150041,
    0x0000000046080F16, # id, id_addr, this can be found in the binary too
    0x0000000000000000,
},

If this fails, then try to load com.qti.sensormodule.xinli_s5k4h7.bin?

Best wishes,
Pengyu

> Konrad


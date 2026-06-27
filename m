Return-Path: <linux-arm-msm+bounces-114720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4CoaFWNeP2oDSQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 07:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF616D12B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 07:23:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mi5qKHdF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A5E23004DA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 05:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84B62F5A36;
	Sat, 27 Jun 2026 05:23:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D61CAA68
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 05:23:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537820; cv=pass; b=nKNCDlt9z+GlQHE9sH0d6abkcLZapcVqecHaLgZIxSWWahBIvvqAag5hef/JZM4kkCUG217TsmzvQJ3l34swfCvl9KKNQ8sQl+ocls5m9QzSi+8zk/uJXXhwL8PKuAIXJQNUrl0qhIj/nN7q+/ctvyqrjY0qBQhpYQVwPpexDW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537820; c=relaxed/simple;
	bh=jsTJV3XTeyptIuiFlh+MCtigFwZrx9dcmVg4Nn0eF9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmzzBPLBhGXn+ffNadLvBgxeCGH0FID+wbs10Jf73sE87G71c0j3eEDYfD+wRXZmq56herqrmhIby/tysmN2kbMs8R2GRRscHK3dn9+RwNp4xbHf4Rx+S6aCNKvnhqblNrkBKk9KkBKdl6zbsMTRUFtQPOJpwmGhk6j0F5B1LzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi5qKHdF; arc=pass smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bbd26a2729so1520184e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 22:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782537818; cv=none;
        d=google.com; s=arc-20260327;
        b=C2y1UFyk/qiRptFg+l8Uf/eufVjqrHEB75NihIMObKyyIfN89Ul+5+UaGy2NbpSwq+
         BobkXXwv0Cc/zJQENvL8muWiN74kSf92hXW6CHndPF0pqNmxMZihGDxm9XSJ4wVoLWgv
         vaCF1A6kgWXZTyukf+55AqV3eA2+xbea1f8b5nM+xBSTAJ7owA+SRX5J77ecX3sZfT+L
         1m0SY4u2GWX6epOWVnHrV7n5ITe50knZots8o7UCKnYRmAwxaGTK0qm1pik6ckhwtaM5
         sED1HqIURxFPb2LF49MR/94twwuxjCcp5432BklPt40eEFZueBmp3aZl/Y1QR3p2F2kp
         lDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        fh=cQK4jTP2YZkb8C8/QqomkEa8jfN7yvzAhuhTRpiZvgE=;
        b=FDMgZDmttBHSUnsgtQMwO4fSDPyMTRdd8tB/Oial5k/yLrWP+xyUMKQxc14t0ILmks
         bn0qK/i4dkJnbTaq8fhkCePMCz4gh4nGG/229xGzhovgToOT14adhypnyIsqV6wc+GHH
         acK1H9ZYlUwo8gRiwflExPSBKvfdmV22+rFNKvIvEQGKCFoc4k3IdlVNWJJyfIutj0s/
         j8mxAJD8Uhns4djHMS7moCqwkTDOhwAYcL5K5k3InVVFpVkSVV3wV/lWHepQ+WbRFqI8
         JHJR/fCONLApPTjhWCus8Z7jDFFWmh1+R7iJ3mDRijIuH0/NqVJcLjNI+2u3ZHtZeRD6
         2Vrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782537818; x=1783142618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        b=mi5qKHdFbfDSLrN3dz260EsRobwuouOVmn13CfyyUbWJxw4axnJ3dFQhC0oW+gQLp4
         ICINy18OFgBkd5WaoWLjoqaANWrJrZ9MbwingrA2OI15ZEkrm+6L3f3UJrG3BkBinRhe
         vAb90FwC7xzl2bMWKnw6Yiyuj/g7seqrRMNTqG4yoPANOdj3oePXuAn/zcP0SyO+3sQI
         OkyBxB3+TVOdS2E9kbGHq09LkD5zRXz7G1O84tAZvRFqLv7OCqCKj8k38Qe2XwAyCrFv
         1OfEhXee52A4pU9Rz6+wTDisdTujZ5vbJUOVjnqSep4OJrAadWNoZcURQxqnpFv6qMxI
         AP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537818; x=1783142618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        b=WJjtM5bMc2KiAbuTcTEDu0pCu1OYZ0hnTe8geI8Vt7EktLKaK8Ge4h1HrjOLByCRN/
         uCfNBPHC+KNwjw1UvwC1BPMtj0UgaOAqRrZUWXHqRxyIKjaU5DA3LuNEhez19ljJ9Pe9
         O0/AOn5hDO8TdzKWUSn2XSpNyVpNgRIyDXEGfIVhk+SC7ZYRdCXUa73HKuUUPYofoVl7
         8aUJxSgEcIQnxvaH3XNrhquzKIEIxytKAzmLpDKs0hefXD1Dzn60Gp+TFfK3kAlMz4Rc
         c8u0GjkOsOtfuvXVW46CYenRpgQObZ4TCtqcgjapUQVMUJDGfEzKQba7qjgTp658VhR2
         dTPA==
X-Forwarded-Encrypted: i=1; AHgh+RpOcP9pX0Nd4DpB/cDHn0ByLmvfAvGHqFJLYe0GM66jnGk8BnEno4U68X2gSxTgm/64V8TuwEUZhzSeGgyP@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSSWpJ4ORDjhGZ6Ypwsnb/6x3Jld2NOhyrDNtEP+HNWvDv7Y/
	8bP5WGZ9ZyeRCT24wgm7LKkLnH/VHLO2I9cVytQsIje27/6/ynndiKnQONCxNDVj3UGFN7MG7RU
	RF+1gb9Vpzxk4Dlb24rfN/o/xI/VRoRI=
X-Gm-Gg: AfdE7clzwta9gi5iDhM3htFX3JrF03C6E7ghspI8O7wfWaVxjZEHUtUYH2ZrQmpLnHX
	XmrBU2yXwxTRp3Fb9DPuR4o9tiA/4aUHMLO9BEBaNZUDEdRXToY/eO8LXtTvjT5CmsFv/HKuDSQ
	RGzbFueq/N86u89hRDj168AJvsFdSsW+18AME6PY/5fF1bKfcSqeh5UAEOPz3zLVlsW5nFntobn
	QmFLOUQuEhajEpjAG2LtwVDncsjCH13Ee3TPBCfnLoQTGxaN1+JhW6LfxEW/Hjyn1MqFgi+TUVV
	T7VzWP/DHfASaDYcXFXT/jLP33/G
X-Received: by 2002:a05:6122:1d0c:b0:59b:7fbd:39f8 with SMTP id
 71dfb90a1353d-5bd69d7d046mr4605137e0c.10.1782537818557; Fri, 26 Jun 2026
 22:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com> <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
 <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
In-Reply-To: <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 27 Jun 2026 13:22:12 +0800
X-Gm-Features: AVVi8CfrwkCaZZLoTfnJoyzeKn04AJD8vvCiej82z8jd-tcuH5ak3SMX7LH55bc
Message-ID: <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114720-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FF616D12B1

On Fri, Jun 26, 2026 at 11:34=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/26 11:06 AM, Mukesh Savaliya wrote:
> > Hi Konrad, sorry for late response.
> >
> > On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
> >> On 6/15/26 6:25 AM, Pengyu Luo wrote:
> >>> On Mon, Jun 15, 2026 at 5:18=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing th=
e
> >>>>> driver to fallback to FIFO mode by default. However, these platform=
s
> >>>>> also support GSI mode, which is highly preferred for certain
> >>>>> peripherals like SPI touchscreens to improve performance.
> >>>>>
> >>>>> Introduce the "qcom,force-gsi-mode" device property to hint and for=
ce
> >>>>> the controller into GSI mode during initialization.
> >>>>
> >>>> Ideally, this should be decided by the SPI controller based on the
> >>>> requirements. Another option would be to prefer GSI for all transfer=
s if
> >>>> it is available, ignoring the FIFO even if it is not disabled.
> >>>>
> >>>
> >>> I have read reviews. Can we check if the compatible
> >>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> >>> presented, then we enable GSI mode.
> >>
> >>
> >> This hunk is very odd:
> >>
> >> /*
> >>   * in case of failure to get gpi dma channel, we can still do the
> >>   * FIFO mode, so fallthrough
> >>   */
> >> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall bac=
k to FIFO mode\n");
> >>
> >> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
> >> you have any insights?
> >>
> > GSI mode is preferable but if for some reason it fails, we try to conti=
nue with the FIFO mode. Just fallback mechanism.
>
> So, would making GSI the default and FIFO the fallback option
> sound good?
>

Yes, I have sent v2, please check here
https://lore.kernel.org/linux-arm-msm/20260616122605.668908-1-mitltlatltl@g=
mail.com

Best wishes,
Pengyu

> Konrad
>


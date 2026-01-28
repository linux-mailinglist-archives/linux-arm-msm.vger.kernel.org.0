Return-Path: <linux-arm-msm+bounces-91070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGixJ4BTemnk5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:20:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB2A7B26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D014300B3E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 18:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196AD36A03F;
	Wed, 28 Jan 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDaerUj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7A1B4257
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624446; cv=pass; b=F3GQpI2/H1rY/RCt9dgM7+MwFXjbaUsNwQgoLwwqn1YYYscI/65rVC3+H/XytNQoGWCpB3B21V86jDtLRdXv/xCUygte5rxpubTjhO+4hScvc6H2Jk8fANaj/DbP0UnKDL+fev/08+raFrjo4LJmOklkoSisYC+u2+N1Po5+m10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624446; c=relaxed/simple;
	bh=CIChRHQmdF7APA3Xmnz72d7Y0JgTDsTDC5BuOlHyDMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQlVMRKfqEcVUP3N/FceQtKyrGiiWwo3SW34beZxKqNubHwulAaK7XvFXdKL3IeEEprL625W3PHKL9xjM9HOLrwmJufN+xm0AmSPhDxOrTRYOAj17xRkb9MFuZVYLMOK/eUu4gD9MrIxEMxaLw/QItGXUY3lKRT66pnXfpJs8uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDaerUj7; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso95563e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769624443; cv=none;
        d=google.com; s=arc-20240605;
        b=NVgLypTuUIFAuT4wsJqB6D2V/Jbt/9wDrx0YrRdZud0irC0egMYId0ezhgIQxqJ0Eg
         SZs1iBWWyEMb56ySZbj4yg3ra+hYvRNHFO8cih2MohvYlN2EwWfVJawc89LFSRYcCBDO
         je3zX1szQcqQMrfQHfjC9e2Hw3pmBxxbs26xhkLs6u/MtMbYNy/r/I1epQMBiT2jhck8
         ZcosOaGSa4e8bFLDFIG2BYz9AfbaPx62HQQU0ql06I3F3SldYE3fpC9Qz8Rgmkj63n1N
         ZVVfHypwmcA1RqHvx4FkFC3rIngoS8iot+w3ygsKCiZo0jAHOMRje2keGl0wHRR0gQ9F
         A0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VJ5xUhxk874RdziiGPivUh7Y1eK+QitmDEC3I5cdhDc=;
        fh=SpU2Dky+RVXisF1lGyr6yjc0VNqTlY1kYkT+UVH1wWQ=;
        b=UPqyNCc6rzLZWh//8y488/EUI+VkNg8HmyNsN+CqtrWDL0qjfqZe4o1G0YZrq+vpEA
         cc5HmaOZxwdV2Tn2r583yUUcBckK141GUymdekMnvolM3bNi5MASgFIHFl6Oe7C08bs2
         oKgvcbaVVzbPURzu2lk+I3lBbfwjHvn63hRcARpk551dvaTdIw4pU5yynDRso8Kz9Pj1
         xsxk21eUUJxd/27LexCgcQcCA5ckTOmD3OUrIpMuMWPCk+9Z5q5mrkK+sZOrGRj18HFl
         BgCg3uJaYTgPtSn4MoBs7+/CJ8IpBlKU/y/nRSqOIb1VAVhzLwTGMm4r87ezVY3sa3Qv
         JoLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624443; x=1770229243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ5xUhxk874RdziiGPivUh7Y1eK+QitmDEC3I5cdhDc=;
        b=kDaerUj7TfN6D/4zujEkdRsAwtgBLzRrJtGQDD6i6WS6wkg+WbkmpMbn/We+E1WccZ
         fysT891/0D3QpRSxh6uxprVwRvOZzhhpNa71CzBw5ywNxCbFOGmzQd/6CGcGwpPEswmP
         NM4rasq/G6ImelWqpKf+s6TchxXWNULt9/1mKVQSoT1lUK8EVZqoUHyOOVMf8ZockN/u
         o7IhX/cF/qtCyn/qq4Z4cGUdZ4D0QhIvRnQ3o8zRW9P40SZ4MsR3z9yw3U8iJjI2VnlY
         gjOaOwq47hNCSK3LfNj9O3/Fpk2mJ++U1iBb+ANN97T8DLZOD4t/BKPyt8Or0rDJQHtl
         a+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624443; x=1770229243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VJ5xUhxk874RdziiGPivUh7Y1eK+QitmDEC3I5cdhDc=;
        b=qRfYLDQYCfwq/bu7194GHN59dQu9vrShxUlo+PIWGl8KUnxxoA38A8Vd7H4p3sWQy7
         zvA321WDOhosQk3PV+au0G+ToGxXZRYGrBtpTkDukPqxYvPsWwjT12HqRm+GIxCk6fJG
         ZE2jQVVrui1DEcF1j+COyRhQvIoBRGL4LqdqPWuV1+KWeDXll9LJA9Lu77ft+mhVFVPS
         eMZ1qsQuvmKv6uoy+c9MhCTuNSn98cP7W8BPezuVDXMBIsAoHDUDSe3EDz0DcXcrbcTE
         Kde2x2YkpdNQ5WMnwdZ1i+/2hZ3pYZpj6S+HNHyUZxvh1Dj5l6AkfOtUpkKXIaTTe5ay
         ddtw==
X-Gm-Message-State: AOJu0YyodeWl6fYNeFmnosB1gO4k8y1KRjV4B0xOwy9jYHSUcVJ5y0I7
	yX2X4isQFytPodsZ6HTgB5VrP6Oc8nh3s6QT4clDNn1Dsq5t1M211VGGJDVvTH2yEq4WBK+JGZ9
	lXIyLMNt9LplKhSivo2Q3G0ixlbwm9hk=
X-Gm-Gg: AZuq6aKdFfLXHdn8giQp23U/0Hz5Hjj9LSydyQbN162q1ANsApjEQpLtJ+xHdyRTQQk
	fz2fIPHziC88ev0TVnUpB6rFtjcINIZzonnbrArZQS+8wspGyBFHyMNLZJlUC+i1Ko/7ZpTLmTL
	uP5T3EgsqvhHaTltr+MUtH7IxP8I8IJCdpTjhe94ubxcVk5JR5xOEFpHfULye1FJ9kkVN2ENoU8
	fKJWRvxnhjbgulZ7syRXC0SE3nBNlc7LF0zhMP4LBmjYXEZ0be8EE4YIgVtDwHA/pFdL7VNUUje
	bQDtsApnDbUEGge6WBlU4EC3F0XHwUqwpQJkvSufNyEVVszlr/rqhWaAdmwWyodIR9htUyDeqcb
	rwCmMYpPiGngv4w==
X-Received: by 2002:a05:6512:234b:b0:59c:bf32:d72e with SMTP id
 2adb3069b0e04-59e04017940mr2153665e87.1.1769624442349; Wed, 28 Jan 2026
 10:20:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
In-Reply-To: <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 Jan 2026 12:20:30 -0600
X-Gm-Features: AZwV_QhPmlq2kZFer7XTvqk0b8QlzyHnkGU2RpREKRSsmt3ID9R2U2PVRLwxQjc
Message-ID: <CALHNRZ-2+b7-XQUR4OE+CW1w14ssxcfbt0+LtfQP11g7DCv1hA@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 16BB2A7B26
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 8:03=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/27/26 11:48 PM, Aaron Kling wrote:
> > I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> > for Android, using mainline kernel drivers. I have come across some
> > missing functionality and failures that I would like to inquire about.
>
> [...]
>
> > * Some gpu related clocks complain about being stuck off during boot,
> > causing stack traces, but the gpu does work. I tried to do some
> > research into this, but quickly got lost in the weeds and I have no
> > idea where to even look.
> > [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>
> I'm really scratching my head trying to understand how these GPU
> clocks could not turn on, they barely have any dependencies than
> "the chip shouldn't be offline"
>
> +Taniya ideas? This is 8550

Mmm, mentioning dependencies reminds me that Android does manual
module loading, so it's possible that some dependency isn't mapped
properly in the drivers and I'm loading something in the wrong order.
The *cc modules are loaded in this order:

gcc-sm8550
tcsrcc-sm8550
dispcc-sm8550
gpucc-sm8550

The full list of modules loaded in my ramdisk can be seen here [0], if
more context is needed.

Aaron

[0] https://gitlab.incom.co/cm-ayn/android_device_ayn_qcs8550-ack/-/blob/0d=
3b3fe8dd8f4671062f3f3a7698e444e1700658/modules.mk#L139


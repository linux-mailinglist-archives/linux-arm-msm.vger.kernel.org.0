Return-Path: <linux-arm-msm+bounces-91566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNN1JlUvgWl6EgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:12:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF6D29C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C13300638E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 23:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F2C388869;
	Mon,  2 Feb 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFMlGa5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6AB38E138
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 23:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073939; cv=pass; b=euBvkTGfjVFKHpBqYJKDT58/5JvC819howS4pgxLG0CRYj/KM7NQNRlt6Hdi2k6JQuKQ0kIjOeYKvmQ/1n/ErMy2ZUinwiXPH5+Dgi9NaI12Dvse+XDt9ShyCi+jF1F0BIoDW1ynzu24utg3i1he9JNou0KWU0AR9SYL86nbliU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073939; c=relaxed/simple;
	bh=EfK6DcBE6eevbHz58EN6/+MyCdckwGHF/ICtR4f7Nak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Slan9173n9pWXZgr3OooRKfBXMNJnYRfBf3xcHzPpvfmUU5y/jWQfV3wGrcuOBBdRrAge3p1yd/Vs6riSiKoRdPZk9bUBRxtphOt6Z08zoP1Jb4rQLBfWtF2bjlFa9u4pgQAQfYQNko1Obv47VPjCfPqe8/FlowH++oozy12sds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFMlGa5R; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dd490be5fso6510542e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770073936; cv=none;
        d=google.com; s=arc-20240605;
        b=coYCsmUj6/ixWXXLYqxYmQDxqCmAVkT7c+q8UCNN8d50DUxzpTRUbiZl+kWcpdQ8EE
         XIhTl1Jms5zB6SEGT06jinF+EuNLtj+m8ZIkSdahLgAhbtkG2R93c7wVLFcI3rLVHYtD
         c8cZMwcThY3iqEFjX11PN31SHYsbQP66P+z5RUIGgDw9X5jCt3NN9K0DMJdfoPgph7W8
         0zdVfEdXh6UQVn3ejTzA86d6u38FByDGvFAAxyJvzfPBEIzVxMObGwkDfxGy5MJnyj+q
         t1FohWvNGwKtuKcGSspJFNF0/RcIng8jsQoEZfDBfCjmHnS0FRcHmLeibT18ybHjnT2u
         w9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EfK6DcBE6eevbHz58EN6/+MyCdckwGHF/ICtR4f7Nak=;
        fh=tQWoptCR9ukBybEjs4K/EujaVZmF1DL7tpfWgXafXlA=;
        b=FK6RUuu/vxE/rHnBGLawV7ZaBBYCMkEked5lrNg+puddvv5NxAAVQnuMrBEYZm8MJc
         5arAMFfMsYoGtlj+Q/q1n7Rzsp13j1TWFy+jcZeXXMt2ID2bBTeWAuAW1DIixLA9yUSP
         z2oYzOuQnl2I8lm1SsQLdw4/h1IhPMm/2dHmyxQiLIAc+8mRcU4LxXew2gXK0EZztkRM
         BuJBvyR2frOEMBFdQmVWCk77mlDmZphlWAUXAhtsuz38E/mFVH8TuTgUVP0SAv2jZM4W
         5czgNLOprtWeijVwePrkZs4BSSeIU2r7N9ijQWmLHIYiFNfnNYKXus2jVnybtkHNvSgr
         iPNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770073936; x=1770678736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfK6DcBE6eevbHz58EN6/+MyCdckwGHF/ICtR4f7Nak=;
        b=eFMlGa5RVILiNqIvlZIUzIH3N1UJ3h6nS9zqARKzpqXNxfmNxoZXjGAlOt6lVnyzdP
         bCuiv/8NSHDQT5g75sNNs4hL3GMJIAoc4IeezWzP0bblSxtnQrU9UZo95B2b00MUgfq1
         BIbapBtliNQPgY3bQZfWNbRj2LIVF6arwq/pKxMKhsJAevAaGfa8t4LcjTvZR5kZJz+G
         PGdsECS4XWFZGEOjoM4Lxo85NFo4cj1JyK3BqsQ1msE9kr3JVnR+j9sFtRkiAimELYyH
         9Wkq4g+ZdamaHk8ctuexSS7oTaC/ZK6mOt5WVLnq4NUAaaYX2/95EcUVdNneX7tKVEK4
         o+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073936; x=1770678736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfK6DcBE6eevbHz58EN6/+MyCdckwGHF/ICtR4f7Nak=;
        b=PZv4UG+yuU3/Qqz2QBRNeWjPHdt9EsE1bMtpalSnNGlLMT9p3DvfRmBiImJnIeRRl1
         fHXfdtPF/0T9LokrrLd6QZdMErXzmSXm4ugF6WNQZuUGVg/Gb8+LKxr0vzG9B7kNzfXT
         7tMXi7Rxck5RKyDgycAikZUaMu1uf2ZY6Cr7bkhuwsu2ZhXVkKBnaLn5rGIFiXVXCM0O
         iTmK7GaYM3KVGbpKJcgzApID2fi2RSkHCBt7ApW6OO4ddEizKEyoRdz3Gv4ahn1RWr+x
         jr8DoyVdQ5uv3rjAhXDOT2BO2BbcgM+ELBAsis4hyIft0y8Po1HGZFFE4p4XdXwnCaca
         hS1A==
X-Gm-Message-State: AOJu0YxiK0eS3EfqLNM42w3MJYGeiWpqZ20rlWZ8rNeRX7n455oira1Q
	UNJHQwYemfJDXULtBXefD7Fu/wucy2+5hVNmcjNdyY1ADFDpqNq8OvLUI9DTbIAKygHkst/LIKC
	TWWo5iped0uJ85+VpeR2scIKAzpRsCfs6og==
X-Gm-Gg: AZuq6aKumLeCppBoGdKPNbBFQOTSg8UZ/kmVVVgaWjbAKyDlyq7ilSM1Qu6OPvUUdUD
	ZkQhclpTU0R+R+g/0yC4EgQqiQXUIppF11DH4B9MR5f38NaQX1frQjtJHhQceRhPFru6/5CkR9p
	wEz89jWVZ9UFITHODlap7tZNP03IgQLymSbjIxJ3IfQgQMtCBHctaoKy7RZ0Wj0sQQblAiiwdxl
	t7WNXuXZ0qa7UcfNW2EMmOeGmz7l6m7Oh3N7KURlJSLsVNYdC/9L5XkjyGPQyVxKTxWZzigQ0mI
	4/d7elhoeVlf6KzdWuEwCgyfI5nltGktzeffclbs0+bRsZNq1DxjoEEowHy1wzHMEgo=
X-Received: by 2002:a05:6512:23a2:b0:59b:9ff8:468e with SMTP id
 2adb3069b0e04-59e1641aba6mr4576759e87.31.1770073935428; Mon, 02 Feb 2026
 15:12:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com> <CALHNRZ_SjzLVoZ5qf1tzDFqRtnZWRaBWyytyrjA=dbyHWekAQA@mail.gmail.com>
 <24f770ff-e4a6-4f8c-be72-26ff5cbf8d1a@oss.qualcomm.com>
In-Reply-To: <24f770ff-e4a6-4f8c-be72-26ff5cbf8d1a@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 2 Feb 2026 17:12:04 -0600
X-Gm-Features: AZwV_QitExTF5ww8P-DTj9JcWiVrzMue3Fw1hdCYSO6n-pJzZi6a7oAcTz021Bc
Message-ID: <CALHNRZ_79_SvsgeFu-n4txsRAcj5Tw+UOza12vZC0=isWA28Bw@mail.gmail.com>
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91566-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECEF6D29C3
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 4:36=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/30/26 6:13 PM, Aaron Kling wrote:
> > On Fri, Jan 30, 2026 at 5:01=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 1/27/26 11:48 PM, Aaron Kling wrote:
> >>> I am working on the AYN Odin 2 qcs8550 series of devices, specificall=
y
> >>> for Android, using mainline kernel drivers. I have come across some
> >>> missing functionality and failures that I would like to inquire about=
.
> >>>
> >>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> >>> mainline. Using changes described in the gunyah watchdog thread [0], =
a
> >>> dtbo loads and the devices boot as expected. If any of the changes in
> >>> that post don't exist in the base dtb, abl will fail to load the dtbo
> >>> and go to the bootloader menu. This appears to be an issue in the
> >>> baseline abl code, affecting all devices of that generation. Would it
> >>> be allowable to merge a change adding those changes to the sm8550
> >>> dtsi, allowing an unmodified mainline dtb to work with overlays?
> >>
> >> ABL is.. picky.. to say the least
> >>
> >> Could you please try to check if what once worked for me on a
> >> 8550-based Sony phone would happen to work for you too?
> >>
> >> 39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")
> >
> > Is the question if the devices boots without dtbo? Yes, that works.
>
> That's nice!
>
> > And fastboot erase even works too, though that may be because I'm not
> > using appended dtb, I'm using dtb in vendor_boot. The setup I'm trying
> > to use is a base dtb that has all the common nodes for the AYN qcs8550
> > devices, then a device specific dtbo for the diverging parts of the
> > four devices.
>
> I'm not sure if that's a good idea if the bootloader is (effectively)
> broken
>
> I'd consider building full DTBs for each device

My end goal makes that difficult. I'm working on LineageOS, an open
source AOSP fork. I am attempting to make a single build target that
supports all four AYN qcs8550 devices. Android puts the base dtb in
vendor_boot. The concept supports multiple dtb's, but the ids the
bootloader uses to fetch said dtb matches across all four devices.
Even more unfortunately, this is true for the dtbo id as well; the
vendor did not set unique board ids for the different devices.
However, I can pull some tricks to use a variant dtbo image per
device. That concept isn't feasible for the vendor_boot partition. So
I'm taking every reasonable effort to support dtbo's.

And to be fair, beyond these node name and label requirements, I have
not seen any breakage. Once the bootloader is convinced to actually
apply the dtbo, it works as expected.

Aaron


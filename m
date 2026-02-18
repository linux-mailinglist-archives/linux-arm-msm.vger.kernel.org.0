Return-Path: <linux-arm-msm+bounces-93243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mTGMFL8elWlqLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 03:06:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D9152A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 03:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BBC8301FAA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 02:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6B72D73BC;
	Wed, 18 Feb 2026 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvJn3KiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06FF3EBF32
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380412; cv=pass; b=f7rxhTJSodwAwOJ2kImXPYEgHfubdhrTmFtL1bym+Hl3flKKS6rkwMDl+17iefycgaqBBov8SrNqKutN57ebR7jkhzdaWV5yHxyk30rv7BMOsTG208O6iDm9aMuNXCKnb8WsGkz8x2P8V99HuGd+0SaJnfkrzaqxfqsI4z6l8lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380412; c=relaxed/simple;
	bh=M6NCi4rhy/mIRioIeYnEztP+rrp7HjoTf4jpdqUafkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rssE25IvJOrv64CvAxshNZu7ujcF2ZhUR4RkWosOwUHS7Vfqr8Xf3F7JKJ/lLRNuIHjjsw06Ar2mg6b+tQDXL3pMnjL5Zgs6MEENVsUWHIac6TWoE89BSuxQ6tpDF1z/Nw5gf4LuzreUZpL/ksD5fhtNQVtF7ASgzqaW4wur4+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvJn3KiX; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870902760cso39092141fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771380409; cv=none;
        d=google.com; s=arc-20240605;
        b=SX1nQzV22QlwmndzlFeUI3j1dPA5qjfiRB8H6q0iQd6TBnV65DYh4CzhX9jqY/XdVj
         BNcdHo76t+esThlkQdVXEn0F/it00Jznt48oYctAxH+lOoC8fz1lvBcHb+fTMMgveUgx
         sqQeo3lKIUSgIDlNyu5Hx0ZSynxoRhxmbcV6KOsS/zoNiXB+zhHwn+Bxa5GxyWvfPu6Y
         dGIcRZUb/EVXsFOlvCNNcOwYZgA4nc4ry+TYlfecQH6i0uRIVKM86EQ0tgzZmBUWbahf
         R41J4mIj6MEm9GtQoKGZPOZYUEZiqsVVDht1pwe6D9hNDC5MouViOdwvoc0Lb19E7ZV6
         UqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCF0RDcQyUaSEbuyiR76kjbm62t96nDS6KjleK6rA6I=;
        fh=gFmfTTnEA/5rhmueFhiX/3CIpdPRPzzpabherTe4jfI=;
        b=BKa7vNSnvaB9FQZiR/d5W9kfrhCwd4LNGQ2RBGCbqnlpCXGXaMO2s/RZSsTFeUg4Ad
         X4mYnwt0Qgy2jhgJimsFJ1jn1rjHVHCqNIT/lfUNPKgtmSloESlCuhoYFsnk5s4juN+X
         X2BMVNkJ8MrZyhgkVVFQoEGgREgmPWTJmCX//Lir4y0SDX+QQm2f9nIoFTm90HzbPpH7
         BjmrPhSrpdmGYAy+yqgQ4uwuuGnmnv9d+On+JAJQWcxgTvyjOz+evr3A2viOKue+LeCV
         wM7XMVivJuuRuHBEWPPoEBmSk5PGxyHkkX9Y4qzx3VL4BgbOHBnWg3oTWUzXZ/t++VPI
         CLJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771380409; x=1771985209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCF0RDcQyUaSEbuyiR76kjbm62t96nDS6KjleK6rA6I=;
        b=cvJn3KiX87igytLvMCwopyNPmY4ZN5XR/01sZ2uY13EzJKr3blbosweSa973qqbnKO
         iGtBJqtaQzLxbIa8ISKrg5dbGXrRAQhwSIyN/Wbe3z8VQvzQOM9FZzDM2rLawW33kmms
         g7NCxqg6MwmlW9xwQCoeM0DSAZAqli5Jz4JToiRbU5LJJIKg24CUkJlADDathSNQaxR8
         zXWUf083hp15PY6A9iohOZV+u5CXxMu8bOycd1TV5r4rVWBI92d/1q59Wp4A7oaCSFsS
         whCpT2ohrB9kOkpY16sKRuS5jEglT37y5TwN5oOa2uPHj8/s7ZQT8OxhufnPmmmO61Xc
         1HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380409; x=1771985209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCF0RDcQyUaSEbuyiR76kjbm62t96nDS6KjleK6rA6I=;
        b=ZajrT0Sd2Xjd1U1lHZ5H4/64ZxMPFbjM7u/hJi5vC1AnLmeiVeqEN1mUOSXyLMzmSS
         bfeq92bWWVB+11zhPuISvjk4GWFLdPCrk0x9jg7yyr8s1qiZjaxifWA3p/xY4EtQ7rrG
         QoAJWWEuuiZ2AWoYnsWJbjfQnvqdQqYMjDEkvcNC03WwX+3C3eNFIHCuaKnxq88Y1dvz
         eYRryPw39giVob6GumheVp9W8EbJdsKwe3t9PON2wetSgOURBJehobFpyIdCHFub4Us1
         REiJhUaZe5UR4es0hTZmSkjggaM5iqJ8yEbIiwo1CNdgZ7OXBd9818lUVbZXKQVZGn1o
         154Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpB4JOVXvuj2z3jf5a2CUIXZ9VY3BBW4buxz2iUKSbZ0qRIHHn9e//mm/5GKHUZg8CcT1BKb7lCy1Na09T@vger.kernel.org
X-Gm-Message-State: AOJu0YytmTf0m/Yscr32pINVmvNqxyqLymOLaCvKNPcbnOV54Hn0r4Fb
	A4SkIsrck3JHmAsYvLlEtPZkSjexvIemBS2KivOhBi1Sc9YE4IFUqVg9QTi41vRJLwwtMwtJ56K
	E78BLX2w5DBVFLoQbZu4UbSt8BfAY1wM=
X-Gm-Gg: AZuq6aKi/r6xBGOMccZhRfHxpXYnKX2kxErlq61b6vDfKV/wA/lyrHfHIq8xDW1UobR
	614s4j3cqHUVipmKKlFesQau1SLIb92jHsWV8OVENP5lnjTb2j/K5OLbGa05nJ6l2KaiyRMrkuv
	R60qfDctHuOq+nQNt5BG1wrWJvdFswUwN2lsmxiEVzpAaXvdihc8qMV+x3ZFSURM6NRDKc9T2ew
	I/l8zDlrj5bl+M4HaeHD6bNMHjbpN5v5y7e/9PN3uYYYX2vzG2m+lWDOir3o+DoOBMRIDYly4th
	5xn48BdfY/pi33nYOPvHbiwUNisMfq2CqfTbAcOxre1FGDQpvqMtmqgIoZdEYYYEWnOSLDYrlfF
	fCLo=
X-Received: by 2002:a05:6512:1052:b0:59e:58fb:da42 with SMTP id
 2adb3069b0e04-59ef97fb163mr4855112e87.18.1771380408876; Tue, 17 Feb 2026
 18:06:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com> <2c2a4e27-fea6-46f5-8d8f-b5869e8dc54b@oss.qualcomm.com>
In-Reply-To: <2c2a4e27-fea6-46f5-8d8f-b5869e8dc54b@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 17 Feb 2026 20:06:37 -0600
X-Gm-Features: AaiRm53CguSsQgntYlxtDYA_uwi5z7LMqcd0-2UNQ6k5OWG__siOmUzm-gGs_wk
Message-ID: <CALHNRZ98kp_uymSrjAGyCSus17tP9iGMYZ6T5HaAecEFyrw3mg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with DDR,
 LLCC & L3 bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93243-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: A03D9152A1B
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 5:59=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/8/26 2:28 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> > to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 ca=
che
> > frequency by aggregating bandwidth requests of all CPU core with refere=
nc
> > to the current OPP they are configured in by the LMH/EPSS hardware.
> >
> > The effect is a proper caches & DDR frequency scaling when CPU cores
> > changes frequency.
> >
> > The OPP tables were built using the downstream memlat ddr, llcc & l3
> > tables for each cluster types with the actual EPSS cpufreq LUT tables
> > from running a QCS8550 device.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     cpu0_opp_table: opp-table-cpu0 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-307200000 {
> > +                     opp-hz =3D /bits/ 64 <307200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
>
> I think that entries below the first in that memlat table should use the =
lowest
> frequency (i.e. if (freq > tbl_entry.min_freq) { vote_for(tbl_entry.bw) }=
), etc.

Let me make sure I understand what you're saying. Given the following
example from the downstream dt:

        silver {
            qcom,cpufreq-memfreq-tbl =3D
                < 1113600  547000 >,
                < 1555200  768000 >,
                < 2016000 1555000 >;
        };

you're saying that everything up to but not including 1555200 should
using 547000? So in effect, round down instead of round up like I did?

> You can retrieve the list of supported frequencies through debugfs if you=
 apply
> patch1 from my my in-flight patchset:
>
> https://lore.kernel.org/linux-arm-msm/20260108-topic-smem_dramc-v3-0-6b64=
df58a017@oss.qualcomm.com/
>
> via /sys/kernel/debug/qcom_smem/dram_frequencies
>
> Konrad

Aaron


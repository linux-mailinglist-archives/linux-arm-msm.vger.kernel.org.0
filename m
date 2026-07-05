Return-Path: <linux-arm-msm+bounces-116548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6dcKJBxSmruDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 17:00:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D624770A670
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 17:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FkM23AsP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116548-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116548-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFD583018D61
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 15:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECD9433E7A;
	Sun,  5 Jul 2026 15:00:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3673859DE
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 15:00:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783263606; cv=pass; b=SVvDK+31HRGXcA15L++IcjtI4Ltfp5zNsyE+kPdkkcyQ7Gv50zCotNOPvGpMaS41PMmLY7OoGlcmPlUSXiEAZr86EgHWOH4Zypc9XsJ0ry8vFf5OqQcASpjMmf3FoD6Mgcs7heJEELm/3P9+NI+oQGvu4zrRv6qpEWqg9pwUO/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783263606; c=relaxed/simple;
	bh=YNM/vGviPReJpIQvyDr/8KvWx9iAGbxgQK2+lD2HkV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpqDBn35kFNB+pcNeRTCaIvEPD+T6ecEKTLE0toQF06qF0cXQzZcc2uVUysSuyydvP+92AO4cflGRX2CYnYJRtABC9WzJHUCT4MLPRXTYko8/DMDuzlZ4G4wMi3mEmHOOFSBprSgMFRR8gN5VPqt01QYP+tHf4lVZObvt1w92UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkM23AsP; arc=pass smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bdaeed0d3dso324792e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783263601; cv=none;
        d=google.com; s=arc-20260327;
        b=EGOh68I1ZkNSjxVJXQjcZLmAlP9GrEoJxIGQ5he5MamB3CqQthCfYGz3peGDhM18wO
         QJKlQxSRolW8/7FPU81E1ZuN7qzBzKt3xlaqPp5odETmzFAMzyHWymExCo1Xb+LNO40s
         Eq09XPDEmqhm0VR8awrn2IKsCWc1YZbYqubHM2dqm144sudE8tXlRMu4L/BRjBhDL5Vi
         qrrXoIYOcbpxXh9UENaXyhXzZVfjc1gYSz5d0r40OVUxhl2GClv5pBXw1Zi5SQ22gDUR
         CNyOegE9dc6C/bSUewLI6OBK8egsGZ1LNemXdeQxoN8/9oycuUTqW6TK1vlHeeLQu3ml
         MvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        fh=KA+QF4JvecOmbbSZCSkKiLU1aKpBWnsDL+lan0s7hHg=;
        b=XRoQreuid0m3LYq/ZWtMhzmjj74+RMxJsGX4inCzfujkKw+MphP50+JAlkSi/g3vh2
         17SjHIYOTWJIu1pGai211IpSPXZcEdEau7oTFwdRlDhDScLlLIMqzeUlwGsbjRWwMELm
         e71qg1dpO94XoVNtXG6+zzIlMG9SQW1MBqOcqZTzdFchLgUj0Z1itwXNf9DCyt1ii2oi
         hu3nyWRwmXNt+pXMZRJy70KuPBm8kFYDeqy0Xmv0wI2GZG9XdJpQUf5eE6fhlN5NOmmu
         9itBPyJgX7o6jIhLw7ugJPxg1x9vjRExU1Q7E0Ee8iLCUIp9xs+j1PxI5GjHHpzggntm
         GYng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783263601; x=1783868401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        b=FkM23AsPAwLj9v59z+JlZzEgVMG7dAjv1KPONGu3q6a55vazqKVN45TymLCsu0ua4s
         cRbqQUa5JOdFIcf/8OHopTp2d/0y/5JOTcXcZWVL7ZdRL5sgDc+8rtj/4x1COVJyX84h
         /F+1SqzT0Q3poSTvrWFTm64uQH04toulxemalYtqF4ViBPcYJhU2Trht5w/hKmeOfTdP
         B4DdO8sUgMuzKC9NktW/FMfy+x2Pd1Yhyvs6p4Hu2AsA8gbrdnZxmYllMv9q9HxEv+4P
         G7uquN3B5YxYXIbnRfyk5kAzKQNwIO/dMaYdsw11jPqq3Jxp6oAkZQVbO0KCg9LXxnSj
         P+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783263601; x=1783868401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        b=X/TvZ1zFWqXLFPo19/6k5q/BCJza2aH+lNdZ0SbNBaTVhewVKZLv1RbJoTMtvmFkA3
         7SIfPONA5ih4TvyppS3bPZrw00pTpI6cC2lgB1GRScq6iYySvkx241uZ42a1KcDG90Mj
         JbLSbo/tCvda9qGEKPIfYvmhkdvdtGY34btEqkAljaZuNnZgeeqn993jJ48FJAI5TJ+y
         ZB1HqMLcYlles8Km5fPASnCVeArm3pZye45fAZS6fsN7FkTR3UWYviaHbAKCQNvVR7IN
         zrz9mlleHAI3ZG7TcR5EjPEsf+y+54T49e3I8GJVvaXZeFZCLWN0QzlvhOwu//XkCSt7
         grqg==
X-Forwarded-Encrypted: i=1; AHgh+RoiROscCQgTKHHtgiubmhiU9WMLi0PV3uWHDJwG3Yp6ODG/1kJolDsFt6RmHi5ecvskUPBPgPwWvX8BFhwB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3brDPsqXvqWSBApDsjt72h/s2waxg8oy8gU3TWN2lpF6t/eJ
	WyYAbZEsU2t+isSXobCUb9hfb2DIEm+nSqO7D3omQNSMxlUepI9MX3UP8JfftQ1hdzsrj7d2aG4
	iiYI0USs2+6Aai/6F2+dEWoOKir5+mmX5Pw==
X-Gm-Gg: AfdE7cnBlzKa3wVbG140AFYXZAZOyFDdUKvltsWjjghDuWqkVo0omdhqkspD0AtPcX5
	rP9bFdAkkqMjK1pmAvfJVMOxHFN6VLYbBBn3k1BQCJT733FEc6OdXyHNUO+DtuaaX8/goI+gklC
	zrkzwJ2hR1s0/4m3rvdv3GIma3vkTavZ7fnKwJLwt5QXRi7Jmff6XTokCH6yWl8INwKmzVDlQEu
	ppekN59fyO5bmw3NsAz3VyGHNGS5GTwRXKWHvxAIpFFx7aZgv+JZP/j27gUytvSFwEiaceBUM0g
	OXLuk738i/AtppMC59HWFn7nJM7W
X-Received: by 2002:a05:6122:2897:b0:5bd:ac45:5b04 with SMTP id
 71dfb90a1353d-5be1028ec7emr2109443e0c.9.1783263601282; Sun, 05 Jul 2026
 08:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com> <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
 <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
In-Reply-To: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 5 Jul 2026 22:58:31 +0800
X-Gm-Features: AVVi8Cf56UN-czz2LV8u-ataD__A2T2E9rPAdcaIT9OBGB5ySshPSFhzEZ13-4k
Message-ID: <CAH2e8h5tDrpcB0ekfSVUPG9EPgtswOM2tn1eKfqoQHEofMpCOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116548-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D624770A670

On Wed, Jul 1, 2026 at 7:45=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:41 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>>>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>>>> DSI panel driver have been added for a while, so add the DT node =
to
> >>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the D=
SDT
> >>>>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>>>> supplies.
> >>>>>>>
> >>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +&mdss0_dsi0 {
> >>>>>>> +     /* real vdda is unknown */
> >>>>>>> +
> >>>>>>
> >>>>>> L3B: DSI core 1.2 V (both?)
> >>>>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>>>
> >>>>>
> >>>>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>>>> safely (hack the regulator driver to add a sysfs to handle these
> >>>>> regulators), the panel works well.
> >>>>
> >>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >>>> ends up being on), UFSPHY and USB1_PHY
> >>>>
> >>>> L6B additionally powers the same components, minus refgen and USB
> >>>>
> >>>
> >>> No, I confirmed they are totally disabled, since there is a way to ch=
eck it now.
> >>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c1=
52e6c958@oss.qualcomm.com/
> >>
> >> This presents you with the status of the votes casted by HLOS, not
> >> the actual hardware state
> >>
> >
> > If so, non-HLOS will vote on some critical regulators to keep them on,
> > IIRC, once I disabled L9D, system reseted immediately.
>
> NHLOS will generally ensure that the hardware that it needs is
> powered. This does not extend to hardware that *you* may want to
> access in Linux (or which was left online by UEFI), which I suspect
> was the case here
>
> >> To get the latter, you'd have to dump the SPMI registers
> >>
> > I will appreciate it if you provide more information.
>
> Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
> the actual live value of the enable register and the voltage selector
> for each regulator
>

Thanks! I will look into this later.

Best wishes,
Pengyu

> Konrad


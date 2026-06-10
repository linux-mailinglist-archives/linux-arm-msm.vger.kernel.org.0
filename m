Return-Path: <linux-arm-msm+bounces-112283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G4qoG6G6KGolIwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 03:15:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2B665260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 03:15:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=qMjegCCc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112283-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112283-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A83E3016836
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 01:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B89A258EC1;
	Wed, 10 Jun 2026 01:15:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE024DCF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:15:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054108; cv=pass; b=Ved4iZadt34E3BnM1y51xzOLvehID1vK+gyZZrKIQSCVSxzLG2coAgJSKGaYCok+dJIJ3iLz68/v9U5BeBYwYXXGaqfCjgqomBkVzCA6xRNuTegMvVCgkMG3iX2NymONY2nThhmynRYvw+kAx4yZvMbTqR8ub/CkMEtCLzapbVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054108; c=relaxed/simple;
	bh=UeAssUqYMd9I/hNomjKDWuBothPBNmM7nGphuECKV1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1hCBdohnHPef55KEtTsfHIVsohKHI3er19vs1FeIU9ics7ocwFREip0Cxk3TQ0dSW1rD8Jk9LVZppGkV1YOvcsHfDWpAy4aapkeSUfSLWrQjC7RaJ68i6yLXuZVctQcPi7KgR/YIooSJdaG4z4HDmdUzsng87k80og71KEPEiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qMjegCCc; arc=pass smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf30d530bdso62152475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 18:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054106; cv=none;
        d=google.com; s=arc-20240605;
        b=kaubur3vmDg1ePR1GKVcoov8dpDn9rc8kHtIgVpsWmwx1JFuJakETkrkqHMQQoix08
         i+QYIm8ibtXUb3FTpBsuHu/7K/eMxsdexEzpLV+ebOMCQZbPxZLuMmkvjbxMMDHvygAK
         GWPBjGL4NOQjYFYPFl+3q3F7Qz7TgxaEk8HUsRsGuuk65lGAbZ1F3uEYn1NK8v6HqC4v
         Eh//j5LuUWmYB34C+jvz9xpueBh+WYKw8BBUrbwgYY5D8c2+dNJ7jzFQZcKt/OiffWur
         xqgDTlIbLCnXGauZ33jYmLaboNLuQE05pyFEWtIUZdDJxNtHwC/yzur/k1xvqJ33wYf6
         h6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        fh=BJvnQ7vI/D3aY48Br1lmNELCoKj7Suky5yhLlXhNHDw=;
        b=N0d3HdZwGHhIULTrtgxLQt/RjlN/ZBPIDJ8irABOGZLy7gdi9lNIzjx2jwhL0iHIbr
         auCczZ2wQvtXGXeF7ZtlXLQgTOCOebWK5P9Ybk4qRiv2zjWZ/n2eR4Fm2yJBkcUo1hxR
         78hKk4ypSDD44R+dR7Hd+Q+GUmbLqvgq/JN/2ey+qb9k2yXeQmMArotkWn+htWxfdetU
         e8F4MHKIIJ+oZLeZ/LsdryRw09ffsTMHb33CQVI3P0DxaaX00ntDe+N4RXWFBHUE8p0E
         il/d/nZs54zV5GKDxTErsiihJpxtnkhlIr+jCEJQpap87AjgOh+7EZwGp+Kqu6CneVBy
         hQ0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781054106; x=1781658906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=qMjegCCcUBDxXDPpfJ9kUjrMc0PeKNq3qpNPV4QavlcRiZSK99bDy4G24FJO3temQ/
         f7Zv3uYHOTUIwARONd/StE6tPPjor/oI5kCeJZ7TFLqJn5c/8P0M0BEh1vLajwJaYBUD
         Myg4BfP5r5PX5ieSW2QJ6eVoar+LkRDgNl6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054106; x=1781658906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=Dum0lrG4TGi1gG/AHm64O7Vl+HCoplfp65nWz2Pzj+eJNtYea/vbguNnu2UdLj8CJH
         qqBWDbjg6cYPuqtiTzBbCwmb49uZAygKQVTIxZJawl4Ue3rHhwLuYoBsTnIAAmFcqOIX
         LFNvhyu6bW1LE8/KktHGi8wU0gZEHu+b97UXgL88PywldMDg7h3ylZkt6xu3boz+65LG
         pauwBCQ+gyB3mI0Ks+MWm96v/luMKMn2LkAjXPsSj8koS5UCVEo2ZfSZAMN1dD0p7NLt
         6Le+TiqKKH6mQiBCIqo3BUbm+GOOly5YvrqHynhLVqPk5p7QrEYv2Puf1d+SvhEpkPdA
         MWww==
X-Forwarded-Encrypted: i=1; AFNElJ9M+K0l4GqOjSXw/tWmbG66HvH/2sT3ksuXm+S9J5zOqGGleUjkylo7bx4NDTvjnR/WI3x2EBaWkjVVYATV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2sfEU1d0sRSZPSLpsGZDu83ldrt5xkCqc7/H+pw+6JficpI4t
	/+aLKAz7ehrDYMXJqWdbGMUIh5K1ZVMe2AFu7s0g0pt9doBom8z+0HpZyF+v51UijzwL/8MCF0C
	zaawBVgozun1gYqcmwCIp1wPXS0dn1ZVrknq/IFzXEAA7RbjU2GwC7FrjUuGn
X-Gm-Gg: Acq92OGT+9GrxGZWYdWCHhJcuckr0iXy+8lD0Ie/rDUatXdgw9xTMl4Z+T7yDgIHspf
	3nQWwhLm1fU7G1JixGE2RIyWrVSqTH5/fK/DdWmoS2r6SAHEdgHU5djRNbK0Om4T98GaJQ/TRav
	xNUXkM62EI5Kqg0nmjDJl4+OrJQ/9qWlbSS0DnaN4/W7usP5C9t64QLS4qRtRKO3C/tocKJRe/N
	VugLMwBI8VqVHkzNjVPJ4jri/lhM76ebbPLArjfc2I8j1uufdtSctEsG3pPDQmy0byVn+4ayImZ
	IaLGQLW0U+LIDqwY7PnsB/+E+P2uN4+n1YOAYW9D1bYVby2k2r1MrXb0nw0lt0Hdqr9hAn9s/f8
	1ChAa+nWmSeexUfWrsnxUj4W8AiaEPHPuqO0foHajGfMOYUJ/yf1F+GWHf0BorjV2oWNOYUhzlL
	Z9kGSpWb4ZGgp/VrLXUrgv/wrQ40wA6dPLqk2bJCS2BYgJWHszQ1Jvej/dgUEd
X-Received: by 2002:a17:903:708:b0:2b7:abc0:3bd7 with SMTP id
 d9443c01a7336-2c1e7e3adb6mr148795125ad.9.1781054106527; Tue, 09 Jun 2026
 18:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com> <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
In-Reply-To: <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 10 Jun 2026 09:14:55 +0800
X-Gm-Features: AVVi8CdzfDox6mz_iOGKn72MQqEfSSNkYmI5x8N9Awxjs-n8z1eY5R0tOZeJjNw
Message-ID: <CAMVG2svgnGKix5vSe8kG694Vm1dU=0Z=MZqR4M5LFOxCXoXYXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112283-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,ui.com:url,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72C2B665260

On Thu, 4 Jun 2026 at 14:39, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> > On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
> >> On 01/06/2026 05:13, Daniel J Blueman wrote:
> >>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> >>> triggers unhandled SMMU page faults
> >>
> >> How do we know that is a correct address - does it come from qcom
> >> documentation or trial and error ?
> >
> > @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> > source for the different stream-ID <600MB behaviour, and share
> > specifics, eg if silicon, firmware, or driver and constraint, defect
> > or otherwise, so I can include a definitive description.
> >
> > Also good to know if my workaround is good for long-term, or on the
> > other hand handling streams <600MB is important/useful.
>
> Thanks Daniel for raising this patch. Did you also try the memory fix i
> mentioned in the bug [1] discussion ?

With this patch, my Lenovo Slim 7x spontaneously rebooted after
opening 3 tabs of https://ui.com rather than 1 without it. No
crash/reboot is reproducible with the patch I proposed.

> 0-600MB range, VPU hardware would reserve this to generate different
> stream-IDs primarily for internal (non-pixel) buffers.

Thanks for the clearer description; I'll respin my patch with this and
the DT fixes shortly to get the X1 user experience under control until
a real fix.

@all I appreciate the ideas and discussion already ensured!

Dan
-- 
Daniel J Blueman


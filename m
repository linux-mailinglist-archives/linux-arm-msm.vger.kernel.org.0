Return-Path: <linux-arm-msm+bounces-103532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Mb7FR814mm13QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:26:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6141B9E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F7043043D30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C665397E8E;
	Fri, 17 Apr 2026 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAcksszp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA93822B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432311; cv=pass; b=iCIM4Z2A8iYIV+Th3TlNp/fyHTt4Hki/xI0Uds4GkKL35QTJ6e9Kw7Qza5VKnIVvgSDcIgfhymfzYYsYkxmPBPazd+tlxfBxe8OA0AfNJhLkHd795R2rZ87970EM0HiZyBLjhPIH392n924CKmvaT4XFrc9XpFzm+/kIrKSl1Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432311; c=relaxed/simple;
	bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1kLZGMeJ7zqRMW1CdcSwGrSSLXz8XS0TzzPvPKUtYnHuSwOMQTFRyfKgQBvmnlTIJ4VBnpxSq9v1wcMfWCEruF+uRx0bvZ3Y5SoQJYSVeiKATIccVCvIdsT1qKgOM+C0Dph2jtx59yyjNAbdJzLZmJLCuVpipts6R6yU8deZAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAcksszp; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d9ed609d2so200230e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776432309; cv=none;
        d=google.com; s=arc-20240605;
        b=MXwoqbCPqxRMVMwho0wFuLIq93qyZbsZMoZiYtCvgWV8OLvJqTnHhHGCgDT+ADAz9O
         WKvwI8+RMuYXDFjNd1zZfruTDSqZvJ4h82An1AzrYBiOsOQTTOsNv3fse2TZeS7NWIaH
         mCNmuZAbSnWf4FmyLrbRrlicqqQ29pDUvOyhT8z4SLNwDykIn4wnb5+IXaTxbV6wF++Y
         8UJ7JY9nNmFnDtpcMzvO2bhrKNYSPipdVadiJ7WjXVgeoOG4i+BgTGp1wnbngruJLJhw
         mkeSTDHyVHpElLh5+eGj7Fi5yHN4Q6eo329xcRaCQwLZXaGMV91hmH3pmqy3pN36Kpkg
         JNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        fh=XjGN2TEH4l+dGAK1aiq6NHR8wg4pOeCWiMA1wb+Svlg=;
        b=blkR7scAo4JuwjAWAvY2WIae9xqaasabhVRlGTXiA9t4FQEoAVWR4663k400vMY+5B
         hlbLTFvU+Jef1+HEHCuMkgfJ0SO/Gy00kAXxkl+2gw5LpWGHz+7f6e4p1jYlXv7S9pr7
         eOMki5EYTMDLuCWbulFTeNtglfrxLfItzoliewggWIsQZqlI6vLRinTeNkteYZ3RGLH8
         vw7F502ilqOKGp/W+ns8q9ELHlkVx2+uOOwoRtmI9kzyjulmz6C6A//drFq+nyWSiLbb
         v7RTCzCyMfIOdBGtb7rksnu1GJPSh+8xhsfWqEDqSsd5IVotsKLJrtDbRz7WMq/+gJAF
         QtGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776432309; x=1777037109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        b=kAcksszpNXLTUga+cGCMP+QRMHGvwycgl3U4wWZ5qG+s6Ppy/SZdQ54rKSJM7T5bjL
         yqx6t57yr/yt+RiIp6jP6ZaqdpU79M8nJmkYadIjS8FIQ1JESpLy+C14oCEnxrCkmu/J
         ap3zcq+qwmuvggfxdK/uDXA/or+uAjpzLoId+K+My5+8Yl7sbQZVPCVx5hRq+wElJKe1
         CMR7Jx9yGjb7ss6ESVpUZXGpp+PfodrDjtSL8TUaSyxXm7kHOhM5VD1qyZ2xK8CDne0h
         9kjmITdlMMSBen5Sbl678E1+JlKFd+V9UDJd09TlZWViIRqMMOPMEf3OI2niv0M8Lkkn
         NsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432309; x=1777037109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqK1UZBlpNmMZaxyfQOlt2VMUPTDu4n9BsnDzyyxKLg=;
        b=dMBXRUafF59LhvXxeZRrvrzuVKwvgyFf2TATVLuWSCgbjplvUK1kswEBgQTzT5yD7q
         vyHzKsiCbHh4zanPcvg0eHAKY0riSRWI2lx7qZFdO3/0PPvJstaRQxAtgH4vUrNZVAM9
         aBGpOgE1EXQgFj/+4bzLDGNoCUCG+ddZkFvMMYMya9EywS2NfNY3aZ7m6h3wEm5JbTeW
         mk7Mf5W3HE8LsjefRYBknIs4vVPTTOZISbsBeJw1ezMVL0bTUyyrXcuUjolScPXvUsgP
         9aSk0oI8f6cZ5r3mTU3nBOq0QK5Drgvd0jM1aHSIiL/YXcsrknJuv8HrkOUcaCgCNrCg
         gBnw==
X-Forwarded-Encrypted: i=1; AFNElJ+QsF+8TM7PcQAP1ENbG2i+F00jbpeRBoi1Ibu2b3YFwOXWFUx6v5uGZpQDkKoqELQPQffJaKRG82Hv+vQk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ecxYEX/z/J69F46XaWfEhPimcxo+67YhDypOok2P4vyY3vye
	arTPEPNSZiJZd89CGpkpbkKM+JCyTqSiXZ3cwnTO/F0xYusONaPOPTIn/rSwIoBulgrROoOKpME
	BSOEvtNCIx7fQJBp/KZYlRwG0wnz7Qa4=
X-Gm-Gg: AeBDietnNKNAVLABYCYNXMEJqJCVdVqAO4m0lbiBT9HGuyIwL6QqDgkEoIi3uvgZkSq
	/yKwqIoHzBJKuR4dhfiDIUprfKH+LwNqifjuG8/YRJddp2Q9xDdrtRiLaI2KoYclih46NW2az4d
	IMlnV71TDsDiOtLod9l/glbBbr8MBwqXgQPam7I+RzWPU1lHHOLrN6ZQpalYHEZCfw0IUxTX+bH
	stS+D0Ig3x3Wh5OxaEbOr98nwd1gUSXPZJpS0gom9i/+1jiOMz17Ltmrgy0DcWZDEbrsR0y76nZ
	sWjjJmRQ0d/UPcaDFQ==
X-Received: by 2002:a05:6122:4893:b0:56f:1ea2:8609 with SMTP id
 71dfb90a1353d-56fa57d97fbmr1146988e0c.3.1776432308496; Fri, 17 Apr 2026
 06:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com> <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
In-Reply-To: <54ab414e-a33e-4cdb-a125-5a980ea7e851@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 21:24:25 +0800
X-Gm-Features: AQROBzCDLJ6v8mDcdpHtTggoUqR10R3kOuBzHCUGMT3dT3PMhuihMf-zW543gGU
Message-ID: <CAH2e8h4byQCMxAO9aR4SHUbm8GJeXmDJ3jUuayGPf0s1CQh32A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103532-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0C6141B9E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 8:37=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/17/26 2:23 PM, Pengyu Luo wrote:
> > On Sat, Feb 28, 2026 at 9:13=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> >>> Use it for the DSI controllers, since DSI nodes have been added.
> >>>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>> ---
> >>> This patch depends on the below series:
> >>> https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlat=
ltl@gmail.com/
> >>
> >> Why was it not squashed into that series? I'd assume that DSI nodes ar=
e
> >> incomplete and are working "by luck" without the refgen supplies.
> >>
> >
> > Today, I did a casual read. I found the register(0x8900000 + 0x80) to
> > enable refgen is always 0 on windows. The refgen driver may be not
> > compatible with sc8280xp or the DT configuration is wrong.
>
> The Linux driver casts a software vote. Most newer SoCs should have
> a separate hw line between the PHYs and the REFGEN regulator to take
> care of it automatically.
>
> Even if a little unnecessary, this won't hurt
>
> I *think* base+0xc & BIT(3) should tell you whether the power is
> actually flowing at a given moment
>

I see. Thanks for your explanation!

Best wishes,
Pengyu

> Konrad


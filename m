Return-Path: <linux-arm-msm+bounces-101956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGxsHbS502lDlAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:48:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AF3A3ADE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EE553006B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 13:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D500012F585;
	Mon,  6 Apr 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bODBIolZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766222D792
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775483312; cv=pass; b=DiC4oJ0AT3VUUQll13ZINqTrRP40cgaq1DthLAISH5pUz9u42IOrrAuSVhvrnSXVMDTm6qPdoovy5kLAzHWPGXOxtHuvqwRLtLm6c2i/etR3+B1J86Uy0onW0y1IsKn4+DUvAqFbuiJaNWpzbgbAT9Unsfqpy5CkdvLtNIOGI3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775483312; c=relaxed/simple;
	bh=Sqctb5UTnmYyEZeCGHx90H/aOmJZv60DnVHDncuO0X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMnQUzFXhcouGoyG8pi2YBrDi3r4pb7fIbw+e8PUT97AGixpEEoO/mzT8MJk+yMFkkTycbdc7GAJguYMJSwyr5ubvq3h0ouzU7UPOmRiDQsR+6Aq//diCcXRvOdsAMVEOs3HLFZDRy6R2ThfjUjAbTVdWWIFNUpOckWOewFd7qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bODBIolZ; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so4489084e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775483310; cv=none;
        d=google.com; s=arc-20240605;
        b=FRsAOlYPbPWbSkEtfSjZ4DkuAJDZbfV24S6rnFNt1xTJzss7SnFJwsUkqZg/sWSAod
         7x73mVNyCEFijBAHrybDKw3/D6QvMO+yKZCnkd2aESekWFxSmSUyTZVvS8QupoJdcaIb
         hB7Eb8l7D1bfBlumL0iQ1JFRXditrZmLT0bN2bQZM6Hw7YzZUn5OZ3kIZiNUPgjCqqxo
         +5h+xnJKyKozza8r0GDlU/fYOQ0GUgySNfrwUdtl2WOAQXuF+rGmQ2uimH4U5stIiIfz
         5y9919TPFWR/ojwYdho/8MihY9yM7FgcIN0IUd7D3Mo9BfgBuJHRQQ/F5NRIikCScrcc
         61pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sqctb5UTnmYyEZeCGHx90H/aOmJZv60DnVHDncuO0X8=;
        fh=ttw+4lTeNJqyTKOdLbJOrMRUpSZzfCSoc3oKA3M6LR8=;
        b=D5S/9f5Yb6bUzsaQ3K3fki+dYfoG5ElmhAHKIt09/2apwAAnvv4EUjFQ/PcmrHCeNz
         zI5x2lD7R5v25dI9/NruSm/4vfZFfDBnN2ctLExTIprEm+CnPeUFA+140m4Izen393r5
         0WFWkcvO+ml07xB318LXKYbybznrPv/ZRuSTcadiqyHRDTIP2FHWeDFwUGLtQ4AJOMht
         4yWCOHtfQUOPYwhukvZGO3/DGhNlE1I9Yar77jDaPlgafdBZ+lDIK888fnDiaseB2TTq
         4axKz3wPt8D3MFOKaRq+rsUw8re6JexktqcQm87LRWRYtG5HUYN0TF1Qf0Zk7fi3sWOm
         qyWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775483310; x=1776088110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqctb5UTnmYyEZeCGHx90H/aOmJZv60DnVHDncuO0X8=;
        b=bODBIolZaZh1Ro0hLQI1kIeHLGHLYBANwvEjsuu003WsGOZQOmkO/9GgpIscrIfqt1
         rlZ3c0IGYpz7SUzejylc3EiumPk8Mk+P1pJTRBGGq1r9srr137cI0bgN4Y0aOwPpX2aL
         8H8PklDFQAD5XaUw9S7O/VYE7NYCyt258K/xmW4zvZ01RsKs/cqhW1a8nO1ThFwX+wFf
         Vm1ESo5NXIQaq0CmBWHFwcUibH15zIhLGBjx3gC1fIUAfnM3DXbEEX/oI2Sa1aKIqTzz
         iF6mMg+HtPNsBh3rnYKUl7HC/V+x29PgJONumHSnjIl0S+9M62zEsLyhxchnBToB4B7M
         yQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775483310; x=1776088110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sqctb5UTnmYyEZeCGHx90H/aOmJZv60DnVHDncuO0X8=;
        b=MGAHU+X09uZ1acjRXkMHhniN2ipy3cybwSKmsdHw7OhUVM1AzzTMsexJl3rk7QMzHY
         YWJF+zrImVE/YoKMHgOFKRYTUkmodbU0cbriPaYCmAjMFImHBi2jy6KIPYKkRKVlcBLt
         7D0/C+siWV4IKPUyZrpjHd71xubo0G8sWKEqcAwjqRf8AzVB8W7KYCdrPrUA9W7ei95m
         ut/NV5hwDEb4pJZ7x85oTO7/lQdUUGFJwR17WuF/nkEhu+lkoU2Lg3eWlyvP4XG37rkZ
         B+sR27WW3Cz764/2FEYhbuKdf3S/6rj6UIAQbL7pZRItXFAE5TkH8Yx60cXCBo23AxPF
         qigg==
X-Forwarded-Encrypted: i=1; AJvYcCXA/zg7G6DbOzSe5hdGDUGLJDehLrGwqn1fv34T3jbxBenfZpgUIu2RtgWa5XXVvLGBgeDMLDpyTOKFXeM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54MrD0Yn3zHxMZgw+OkpMEg3owaH9GC13S05P5rzF7Ac16e3R
	OIBzi2n7PvhuggdxeYYekld6rRymO7vKixvU9oYwTK8eQM9jiTTQCNvhmsIGPQ8RTTq5QqBEWMz
	DDTJFO52RcxsTPJ2qd/mq2KuFjrjbvmVGJ+TWAmjHwg==
X-Gm-Gg: AeBDiesy9MdpvivZRd1RyMX+8uhVAoYezkxvwcnbwCYYblBZWc51g4ptZjAmRl7qC+A
	ljko6fuzkRUVU5ooAajxEdgw1869dRQwRjeZeEV3DLixaznZSN+QAyJErvqHJn+sqPLsWGjR6cM
	aJZDB0C0+Ll5gSsCBy9ldzHI/Szuh0yb1GDsRqNOJPqLHEBk9NrnAoGDmD6105+kMri92j6NeR4
	f5dCf1FjQuDL0FqyhQLDDMtoUR+aMTgufy2eEDcyahn10Fk9kJvkhwB6qqd1NkIYQyEjeiDPYM+
	aJp3Gwp/
X-Received: by 2002:a05:6512:1387:b0:5a2:bebd:45b5 with SMTP id
 2adb3069b0e04-5a337556025mr3843205e87.4.1775483309545; Mon, 06 Apr 2026
 06:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
 <x2mmttyg5t5qjo2tyrwqbynqylqqlulu7fhoyxl7vd54geubqx@qna6vzzr765y> <dd2c0522-91bf-5375-f5b6-7c9ff5304fe7@oss.qualcomm.com>
In-Reply-To: <dd2c0522-91bf-5375-f5b6-7c9ff5304fe7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Apr 2026 15:47:52 +0200
X-Gm-Features: AQROBzC6Z4geQHlG5qxG5dgsYbEDZ2VqEZWbRlCdpWNgrW30RabdxBUoa27FfzI
Message-ID: <CAPDyKFpXRPx2Z8Ro3f3BU3ApEn3rHtXhkO09-qjGjHwSEH5dmg@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, adrian.hunter@intel.com, 
	ebiggers@kernel.org, abel.vesa@linaro.org, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101956-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 145AF3A3ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 6 Apr 2026 at 09:29, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>
>
>
> On 4/4/2026 1:30 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 03, 2026 at 04:29:49PM +0530, Neeraj Soni wrote:
> >> This change was originally intended to land with the patch series:
> >> "mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
> >> till v4 but was accidentally dropped in v5 while rebasing.
> >
> > Don't describe what is being changed or what was intended. Please
> > describe, why you are performing the change. I.e. what is broken.
> >
> Ack.
>
> > Also, likely you missed the Fixes tag.
> >
> The SHA-1 ID for "mmc: host: sdhci-msm: Add support for wrapped keys"
> is not yet available in tree so i did not add the "Fixes:" tag:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

The commit should be available on the next branch in my mmc tree
git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next

commit fd78e2b582a0 ("mmc: sdhci-msm: Add support for wrapped keys")

[...]

Kind regards
Uffe


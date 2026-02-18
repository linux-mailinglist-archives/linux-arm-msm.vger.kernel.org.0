Return-Path: <linux-arm-msm+bounces-93296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKfnC7/hlWliVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 16:58:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D212157893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 16:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CC43301627C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8450534403D;
	Wed, 18 Feb 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLKyhgsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB134321B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430328; cv=pass; b=Q9FbRPg3wPwYfYe+TbmU0fLEDWfR1BaDAlMkVF4/Y9No2WE7KvGfXTEIkNPKy9YNqvAIjuQuFwFrvQ0gyGi7DkJa55Q5d/Ue5SGSJAac5tg7p3dSywjSc5SLnh5fCLQ4AaeJzHYfXVDk/hgZ9MR5LlrwMBmTP+dAaiQDD1Aw+ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430328; c=relaxed/simple;
	bh=VvEIHm0CVh76Y0ezSpIJTHt78UdN0D6dnlpEX+o5yqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYwBu1KdyfsdyKQoLEWhST1f2ths2Nkhlwl7PT4VnTj3KhsiOsplPedsdRxcrhlS27Lqka6DlNUTM42Vp+P0BstzCtk/IL/6VVu/vEaBv0SpabDZjH9zhsX6RI1ptjXx0CovfRGfUXZptADk8UtpDU4ptyB8IfErpiEhwbi9nxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLKyhgsm; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e7e3f92adso359518a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 07:58:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771430325; cv=none;
        d=google.com; s=arc-20240605;
        b=SqZPn2V27PMMpawiBnzyD+WP6+Jcb4NFSzRg5USRjOkcUPYH5MRwEWCeJdxZpcJVKz
         YToms4iLIFcyY7wYs+LORVZKqT9uO636VWmy+YTy+ISSi7X3WpHSIf7pCupuUwoWl5JM
         NFfLawecTRfj1NAf/2fhkus9AiwGvDQXyFyC3s91UXPtuOYaZsc2oivj29Pb/llVEWFn
         m/V+fMrgBwdK4xMEMXNpj22E8mM+vD3IcvAefGUxwyPcF3PsmBC3tyC58XbA5OI89ni/
         dDYo5hInC4JZXp6XYWBcOS74ZQi3oS8rqhxOZyCZCNI6ukE+LjzWUY4rGkVqIBrCFeWy
         0smA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
        fh=49WbULZb9EkUQFwhpvXfuq/ZarNY88oPM+NPFXdJXZg=;
        b=jzhDJQS9oq4NYW+IeSWBLKqObI6UJ8na1tTzud27uymGuPY5wdvI5o2fHbTiv9+WdU
         fL8AWYUS5CXiCFuzP94GFffjpoX7Pm90taTzSuSHLcwiIirsEmmAJ8zwNTA5tYBmByQ6
         q+R77oSFCCCUHxLcKcHE18I4gCXl9HsHLPErvVbixbl03i2ex+xNC3R1pRsw4szOxVsu
         DTALksYZ31r6+zsakcN1DsejCpVyjlOMQcKLnZp3xnXI/vb8tp4bD2/bRYTGmTHBKoz7
         h4Z1SUhnE2S6/REXd1rZSdWPLO7X+8LtrmiD6Vph3a52LMeDqgpgAAImLAUN9naUEieX
         NL2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771430325; x=1772035125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
        b=hLKyhgsmU3C00LOD59FISoEb9gpmq+xcs3mUTJWIMKiyrDupI2P5CllTFwCUebeEao
         KvRKb0YuUvnMCwcIVyZfgb5SouImFffixR3tidO/iBRrsRPgGAjgtawoD22w/MuJnmDe
         g6p2mjsdomLEzKaWo2Uo0QutEfVg0BVBP5LNxSuBVafgMjldf4r7L6zcmuxrYNJieh5s
         k6Hxx4tj4L25HET5rzypilxHi7CCDdUprpY/l5QY6FucbRiATtwqc6tqglrMk79rOMtg
         6P/LwjCvkwNKedBYv4AH5dUMR9oRhkeMxpSlMZ33OW5J93SKa7blc3gfoYbwKGOIe0Jx
         0cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430325; x=1772035125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jEZRhKDKJOk8SBTSDYiUNsfqMbSOB+ljt4JuK9uCrE=;
        b=u75LaPiQD/bm6TYrLRpWcY9Aj/BRGWXRwYiJXA+mtayf7+UmyHYsPStFRQ7DkYpKPt
         p+voC6/nNAq83vqT+len4IGEtrCaKRLy1hMcxrFy3Q9ynW9V9Xcg0H4iA2bgVTYY/jDQ
         jtPar1dyf1OS+qBgiIh1Bs4nNtl86L6rkv2WZqgLOKokLB6ar86EQZd/WK45EaTXm7CQ
         qKlci9YiyDr3pDCdA+Gztman4J6FoWIa82zL6L0gFro368d5yy+wSxsqbskAlJJ905K3
         ZZJJpbdfqSWeiss9NUlHXOL0YFgHZ2PC54ZbDB5wd/QPZd84kkx/wP+ZVzPEwwakoy+X
         x8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7suK6JqLtVdiPcg9VeEnFe/RHqMCYz+GD0j/xfCBR8CmQG38F7h6EXkmjiqWYnhVWaCtVFtOhih2w6B2A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+uKvCpcXpmXzDyh8JHmeTNB3vxxfnIbSgzD+t1mQFv7E/6Uyx
	lYSv6IW8Vv2VngqGtjPPxlsINDKjaMwPJVzHMPTLrxpPoYoAW1WtDqAnQyZ/B42rZPVHNGbh+jM
	58562lXgeCnK5xWDJI1ylOeZTA8Wl/xw=
X-Gm-Gg: AZuq6aI3vIB6tQthsA78A86KExUvfc/C/lC2YMFIcKa9RzypVUNwNwrNSm/7S7zct6D
	q6aNcpiYB3CrnXPriLpUlxFjNSpji0VHGS3xjZ46lsu3z7Xp7yukcNHbaPVdn6Beqc1URTV25eP
	LjSDrL0vCeMb6M4AsIuWPHRNXfs/qo2kjdlhfx/k3FWw08GpOP5yCe1r8i6jyDEz2nP5/soihm5
	Jp7ImwHIWVKSM30GY16PbWQUvgkwUo9S5DmNLp/KFaXb2koOS8YRJQRAJw7sxEKGd7IjBlQbc/h
	SSzx7/M=
X-Received: by 2002:a17:90b:28c4:b0:340:bca2:cf82 with SMTP id
 98e67ed59e1d1-356a7a44588mr12483278a91.4.1771430325136; Wed, 18 Feb 2026
 07:58:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com> <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
In-Reply-To: <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Feb 2026 10:58:33 -0500
X-Gm-Features: AaiRm51N5SpqVVJUQBLh2elCdDaV2cuIU7D7DKaGqf9-QJjihmDNYzh8f93hCZk
Message-ID: <CACu1E7EnveTSzi2QD83xEgsqrM1H33KCqMqcaLE-VebgOMbh0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Sean Paul <sean@poorly.run>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8D212157893
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 6:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/9/26 10:03 PM, Connor Abbott wrote:
> > On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcom=
m.com> wrote:
> >>
> >> On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail=
.com> wrote:
> >>>
> >>> On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@ker=
nel.org> wrote:
> >>>>
> >>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>> Among that information, is a semi-magic value called 'HBB', or Highe=
st
> >>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>
> >>>> This series introduces an API to retrieve that value, uses it in the
> >>>> aforementioned programming sequences and exposes available DDR
> >>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>> information can be exposed in the future, as needed.
> >>>>
> >>>> Patch 3 should really be merged after 1&2
> >>>
> >>> No. The HBB value currently returned by the bootloader is *not* alway=
s
> >>> the same as what we use currently, because some SoCs (like SM8250)
> >>> with the same DT ship with multiple different DRAM configurations and
> >>> we've been using a sub-optimal value the whole time. After all, that'=
s
> >>> the whole point of using the bootloader value. But patches 1&2 will
> >>> only make the DPU use the bootloader value for HBB, not the GPU. So o=
n
> >>> one of the affected SoCs, it will introduce a mismatch. You can't
> >>> change anything until the GPU side uses the new ubwc config as its
> >>> source of truth.
> >>
> >> Hmm, how is this even working today if DPU is using HBB from the
> >> global table but GPU is not?  Are we just getting lucky with
> >> compositors that don't know about modifiers and end up scanning out
> >> linear?
> >
> > It works out as well as it's always worked out, i.e. we try to make
> > GPU and DPU config match and pray that we didn't mess it up. At least
> > now we'll get a warning when they don't match.
> >
> >>
> >> We do log warnings when the global ubwc config does not match the
> >> "fixed up" config.. google search for those msgs doesn't seem to turn
> >> up anything other than the patch which introduced them.  Idk if that
> >> is conclusive in any way, but I hope that means we could just delete
> >> the fixup code on the GPU side.  I suppose we could add:
> >>
> >>        *cfg =3D *common_cfg;
> >>
> >> after the warning as a first step.  That would maybe get some bug
> >> reports along with enough details in dmesg?
> >
> > Yes, the plan was always to delete the fixup code in the GPU config.
> > And even that first step would be enough to prevent regressions when
> > switching to the bootloader HBB value.
> >
> > There is a problem in that ubwc_swizzle isn't as well tested. Older
> > parts supporting UBWC 1.0-3.0 partially or entirely ignore
> > ubwc_swizzle, because it wasn't configurable back then, but we rely on
> > it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> > textures. So if ubwc_swizzle is incorrect you probably wouldn't
> > notice, until you hit the HIC codepath in zink or some game using
> > sparse textures. I think we fixed up all the cases where it was
> > incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> > check again.
>
> Just to double-check, is your expectation to just double-check the kernel
> settings, or would that require some intervention on the mesa side too?
>
> Konrad

Just to double-check the kernel, and I double-checked since then and
everything seems to be right.

Connor


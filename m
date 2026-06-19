Return-Path: <linux-arm-msm+bounces-113872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +v91DXebNWrQ1AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 21:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECF6A7900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 21:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=IQK913hW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F421E303C7D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 19:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7529F3B7B8E;
	Fri, 19 Jun 2026 19:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91263A7D6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 19:40:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781898059; cv=pass; b=owQGstyaPMHONG+miEcfXsUaT8UFStFV7iltSdXBpM3lBGNmWVnSwWdx2ubqEXQv6AsLBd6b/aKoUaK8XSGj5g5u33vONEwz3crIfpH4nRdwmxXWdZN0snd237bDLlgcF9O8VKUyQn41RZ08ivSR9Xejw9EhektUGzFz7WRDZk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781898059; c=relaxed/simple;
	bh=urugoTsq/yWR4pligPKsz1qk3EaXU6x5HOdKG2W4ADM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlIAfI503uyf/zhd+k6HQtwbDRKN6L3O8DDHEuV0wBupi4SyK164zTTuvwGLpDxoQM5jBp/fh/qauWsxkRuk8Q72MbodOlmTM1yGm77IMuGkSxMvfL9MA8yx/9vwDrhgyFLSzFGaHdEzUADJH3CCyTwIYELLfQRbtAGQHlTnJOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQK913hW; arc=pass smtp.client-ip=209.85.160.170
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-519ed52bcc6so255521cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781898055; cv=none;
        d=google.com; s=arc-20260327;
        b=Pxh5Byl7q0Lz1gki/xfijT7iRLVcUZrEzPunNd0EOuGfSVVf4q5XOhSnQ26GmJFPy3
         o7Ve/EMLLDmYORi3j1JdL9Drg2KyiczjGz4/2teV1XX6aIWgeGUn9m493vHdEHZs24f7
         q6KX7HAiMn+K6i9u5i3v5XjAsaxgQTrUZIFYc6qTFNR1PBUU5LiMsgLYlRgk8HZtqXs7
         OQW1vJ5EDHwg73RiGHJyi9SBNcAqBFdJ8fDPlpP0OMiR5TuGdngfuMynB6ZQbZPYfUA+
         L2wBt1wODw4GeppEqKZhWNuKckVOtYnCkp3Z/OIQK0SDycdbuckNPQmhh+GuwE7nAIph
         /TWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        fh=CyrYDfvnOPdEWAxasXb/kkt/0xdMo2RALWahC2KfwwM=;
        b=PiEu7qX/f+XA5KggqX5Qtx0ZPB9wSiwnPUQD4laXLMZtcq0uME1bAHk5yPPbthO3mz
         MK4nmpEz9eQoTbnDzBQqZS/hUwCu7y3h8e7GLvmLZNoCNUa+bkK1UDcQDt4r6Gjn8+0E
         bKulm2o6MGfBSJp22YHPkwyjaoCC8TtLTVrcQl6BdB71EXJazTRljdiUC3IOgURLU3uz
         x/0a3niDSAyLlwGtySCBm0SQJdSLthpiIkxHtQCfc8hXuAGGWMy6LljBVzg+iKOkqRYe
         QRrXwULb2rx7hRGfoPUFA7dJPhQ31iChJC6h3jeyJ53N+ZEPJeVq3dxpR04zrgt0ThJ9
         soVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781898055; x=1782502855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        b=IQK913hWydOVIL2ZiDRkI07BgJug9U0W5eNe9fXIuiABFv8+au8WiQr4U/pATw8MI7
         MkqspHDB9Ap+JBfR68SyRfWkvYIEODcA/zr+gqm81GoBmK2URveoqodNQfo0Iq8ccBv4
         mvyZqBp6W6wrdc+NYd1044LF7qw7SQgWbifltlo8Eg34PCAMYMlVLzt/sdxo+WyDsbeh
         JSRdWZk8itnOzK4fmrQVpEvJcnhxMl2VaXgzzyRSWgwoT+JuFSq/cvlBm6QxEa1L5g/H
         mhkQoTm8lWsQuNL7bxP3ct2Ju3tzICAwC+b//MPl2mGvYWGviOMcZqQSOEqxTr7Co+QO
         nG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781898055; x=1782502855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJE6cIYV1OOaFfhZSUjqsaXExfjdxdplzfZm/ifnrlk=;
        b=SfOh/3aaKQ/KF0/mV8rVyKU7uPXOC9rEYZatq3JKMgyWZWYV1yUsJrb3Xk4I0PUjNy
         MIor9P6/sbQEFvGCeCpP8H0zRUKMr6FPkUmFUrOqFwa3kPuqCChPMn3t3lo26Uf+BjKE
         Rbqt3hv3j6tyJdgGGpc4ZraiijwX7SV0DHCAS6b4iV/OFvHZxxuRWDj/2SPP1EtG8fBQ
         FRdU5S0cw5KDtF/ZnQyE9EG3ZigMF+qEpdYDIx4OqWN14zjFa4rmLFkzCRrKDdhS9gfv
         dNVih8MIC9ErcE1wrwNTzFjay5quVhgzw/pMqhUOlLr4CrE+sFf09RJ663ZPN5zdouZz
         ccAw==
X-Forwarded-Encrypted: i=1; AFNElJ+lwaKpN/V9kg/l/tPOyWwaSn2UEtzCqhY3p30I0NKWnTppUAdFlegfEgWFlWMgC1D46mB3+yCsZ9//mtDi@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJ5tsYzP+001pEBDPL4zlRG5h/Zaa1WT+6XyDqKfUuGbz4ue5
	1YpN/mPhTOT34zuI9C+enL2vqPcs5Jf3HHbniDnxPvtqp1yAukh9lFkGZMzJJWtvZedBAI3U6nz
	ajJcFKppTCv7lp+OyAN41nZ4vNeUHPLaUgfwdJ7Rf
X-Gm-Gg: AfdE7ckgrKiJDOs1ljgC09ahEMFIe9t97mm+Cstdk6HWzXUlvb1eSdO4UQjLCai/iQG
	dxiq6hpP2ihlP4BWGzLfz9aDtPuLbJaFhF83qDtEoJ+mkOB3rgTGsdZCPmh4ZDfrUCle+qhySJd
	7HGwzKWfymSaJFQYsYdxzaCJ1kAJqt3kkMR75oo4OyajcCbL+gEVRY735N3O6omdoUVyFWGQunv
	Y+2928UfUPg4rpxUG8Xd56efWon9g5UTflVoFSzEqKAMmD1hljlwHG07H57wwz55GHdKg==
X-Received: by 2002:a05:622a:11c5:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-519e891bc2bmr8238871cf.9.1781898053871; Fri, 19 Jun 2026
 12:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
In-Reply-To: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 19 Jun 2026 12:40:41 -0700
X-Gm-Features: AVVi8CfGMSn6U3ZYxuzVWyR1AQuFNJS8d4-0Q4Dfsm2iT6SBHKVnQMNx3er3cMg
Message-ID: <CAE2F3rABU2_d+e+NuFJ3ngDCEnGuVCsmE612V9RAKmyAX-R9Mw@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113872-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[danielmentz@google.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmentz@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FECF6A7900

On Thu, Jun 18, 2026 at 2:06=E2=80=AFAM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> provides a compile-time opt-out for hardware affected by SMMU errata
> related to the contiguous bit.

Have you considered making this a runtime option? Compare this with
arm_smmu_device_iidr_probe() where the smmuv3 driver disables certain
features based on the identified implementation and the errata
affecting that implementation.

> On the mapping side, __arm_lpae_map() detects when the requested size
> matches a contiguous range at the next level, sets the CONT bit on all
> PTEs in the group, then recurses with the base block size and an
> adjusted pgcount.

I would perform this check at the current level not the previous
level. See comments below.

>
> On the unmapping side, the CONT bit is cleared from all PTEs in the
> affected contiguous group before any individual entry is invalidated,
> following the Break-Before-Make requirement of the architecture.

My understanding is that for unmap operations, the following rule applies:

The IOVA range targeted by an unmap operation must exactly match the
IOVA range of a previous map operation. Partial unmap operations are
not allowed.

The iopgtable code previously had a function named
arm_lpae_split_blk_unmap() which allowed a block mapping to be split
up. However, that function has since been removed, which aligns with
prohibiting partial unmaps.
The other concern I have is a potential race condition: While one
thread clears the contiguous bit, another thread could try to unmap
the same descriptor.

Consider dropping support for partial unmap and just triggering a
WARN_ON() if you detect that a contiguous group is partially unmapped.

> +static inline int arm_lpae_cont_pmds(unsigned long size)

PMD is not a term that is used in this file. I advise against
introducing this term.

> +static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int =
lvl)
> +{
> +       if (lvl =3D=3D ARM_LPAE_MAX_LEVELS - 2)
> +               return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data))=
;
> +       else if (lvl =3D=3D ARM_LPAE_MAX_LEVELS - 1)
> +               return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data))=
;

Consider supporting the contiguous bit at lookup level 1.

>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned lon=
g iova,
>                           phys_addr_t paddr, size_t size, size_t pgcount,
>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *p=
tep,
> @@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable =
*data, unsigned long iova,
>         size_t tblsz =3D ARM_LPAE_GRANULE(data);
>         struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
>         int ret =3D 0, num_entries, max_entries, map_idx_start;
> +       u32 num_cont =3D 1;
>
>         /* Find our entry at the current level */
>         map_idx_start =3D ARM_LPAE_LVL_IDX(iova, lvl, data);
> @@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable=
 *data, unsigned long iova,
>                 return -EEXIST;
>         }
>
> +       if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_co=
nt)) {

I would recommend performing this check at the actual level not at the
previous lookup level i.e. not at the (lvl - 1) level. Imagine the
following situation: The granule size is 4KB, the initial lookup level
is 2, and size is 32MB. I'm wondering if in that case, it'll just keep
recursing until it hits (WARN_ON(lvl >=3D ARM_LPAE_MAX_LEVELS - 1)).

> +#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
> +                               unsigned long iova, int lvl,
> +                               arm_lpae_iopte *ptep, size_t num_entries)
> +{
> +       struct io_pgtable_cfg *cfg =3D &data->iop.cfg;
> +       u32 num_cont =3D arm_lpae_find_num_cont(data, lvl);
> +       arm_lpae_iopte *cont_ptep;
> +       arm_lpae_iopte *cont_ptep_start;
> +       unsigned long cont_iova;
> +       int offset, itr;
> +
> +       cont_ptep =3D ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
> +       cont_iova =3D round_down(iova,
> +                              ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont)=
;

As a result of this round_down() function, you are accessing a
descriptor that describes an IOVA outside the range targeted by the
iommu_unmap call. Consequently, you might race against another thread
accessing the same descriptor.

> +       cont_ptep +=3D ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
> +       cont_ptep_start =3D cont_ptep;
> +
> +       /*
> +        * iova may not be aligned to the contiguous group boundary; incl=
ude
> +        * any leading entries so round_up() covers all overlapping group=
s.
> +        */
> +       offset =3D ARM_LPAE_LVL_IDX(iova, lvl, data) -
> +                ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
> +       num_entries =3D round_up(offset + num_entries, num_cont);
> +
> +       for (itr =3D 0; itr < num_entries; itr++) {
> +               WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_=
PTE_CONT);

This read-modify-write operation is not safe due to the potential race
described above.

> +               cont_ptep++;
> +       }
> +
> +       if (!cfg->coherent_walk)
> +               __arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
> +}
> +#else
> +static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
> +                               unsigned long iova, int lvl,
> +                               arm_lpae_iopte *ptep, size_t num_entries)
> +{
> +}
> +#endif
> +
>  static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>                                struct iommu_iotlb_gather *gather,
>                                unsigned long iova, size_t size, size_t pg=
count,
> @@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>  {
>         arm_lpae_iopte pte;
>         struct io_pgtable *iop =3D &data->iop;
> -       int i =3D 0, num_entries, max_entries, unmap_idx_start;
> +       int i =3D 0, num_cont =3D 1, num_entries, max_entries, unmap_idx_=
start;
>
>         /* Something went horribly wrong and we ran out of page table */
>         if (WARN_ON(lvl =3D=3D ARM_LPAE_MAX_LEVELS))
> @@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pg=
table *data,
>         }
>
>         /* If the size matches this level, we're in the right place */
> -       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> +       if (size =3D=3D ARM_LPAE_BLOCK_SIZE(lvl, data) ||
> +           (size =3D=3D arm_lpae_find_num_cont(data, lvl) *
> +                    ARM_LPAE_BLOCK_SIZE(lvl, data))) {
> +               size_t pte_size;
> +
>                 max_entries =3D arm_lpae_max_entries(unmap_idx_start, dat=
a);
> -               num_entries =3D min_t(int, pgcount, max_entries);
> +               num_cont =3D arm_lpae_check_num_cont(data, size, lvl);
> +               num_entries =3D min_t(int, num_cont * pgcount, max_entrie=
s);
> +               pte_size =3D size / num_cont;
>
>                 /* Find and handle non-leaf entries */
>                 for (i =3D 0; i < num_entries; i++) {
> @@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_p=
gtable *data,
>                                 break;
>                         }
>
> +                       /*
> +                        * Break-Before-Make: before invalidating any lea=
f
> +                        * entry, clear the CONT bit from every entry in =
the
> +                        * contiguous group(s) and flush the TLB, as requ=
ired
> +                        * by the architecture.  arm_lpae_cont_clear() co=
vers
> +                        * the full [iova, iova + num_entries * pte_size)=
 range
> +                        * via round_up(), so subsequent entries read bac=
k
> +                        * CONT=3D0 and skip this block.
> +                        */
> +                       if (pte & ARM_LPAE_PTE_CONT) {
> +                               arm_lpae_cont_clear(data, iova, lvl, ptep=
, num_entries);
> +                               io_pgtable_tlb_flush_walk(iop, iova,
> +                                                         num_entries * p=
te_size,
> +                                                         ARM_LPAE_GRANUL=
E(data));

I believe this is inefficient. Consider the case where we unmap 2MB
worth of IOVA space mapped by 512 4KB page descriptors with the
contiguous bit set. If I'm not mistaken, you're running CMOs
(__arm_lpae_sync_pte) twice for every page descriptor. In addition,
io_pgtable_tlb_flush_walk() will submit an extra CMD_SYNC and wait for
it's completion.

Additionally, you perform rounding in arm_lpae_cont_clear(). However,
io_pgtable_tlb_flush_walk() is called on the original, potentially
unaligned range. Can this lead to under invalidation? Again, my
preference would be to drop support for partial unmaps which would
also remove the requirement for calling io_pgtable_tlb_flush_walk()
here.

> +                       }
> +
>                         if (!iopte_leaf(pte, lvl, iop->fmt)) {
>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg,=
 1);
>
>                                 /* Also flush any partial walks */
> -                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 size, size,
> +                               io_pgtable_tlb_flush_walk(iop, iova + i *=
 pte_size, pte_size,
>                                                           ARM_LPAE_GRANUL=
E(data));
>                                 __arm_lpae_free_pgtable(data, lvl + 1, io=
pte_deref(pte, data));
>                         }


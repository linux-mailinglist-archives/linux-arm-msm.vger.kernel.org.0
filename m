Return-Path: <linux-arm-msm+bounces-117428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gf9SIxOGTWqD1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:04:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8498720531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=FMOLylbJ;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FA89301C6F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D142C21DF;
	Tue,  7 Jul 2026 23:04:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BA221FD4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:04:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783465486; cv=pass; b=APZxLtFv+NQUs9nS/CNkS+kLd4QXp6SXKkD3Dm6vzwsggteVFZMnYhNmB4Y7RwKYw1FurNbSZf+/gMuWPWMLS9jkiXH/oNp7xidstk6LD5uRr5Tt5YI+1AiJrxF3pMGRVWiZrs6PwGPX3VLk+lKQNbXwh0Fi1c0A6fN5VlBGfbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783465486; c=relaxed/simple;
	bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlHHWOFgvJVKZ2LTLn4UlcPz4gYVChmihb8Byzp1a5i2YE0OPxdTFKQk5sK8j+UmhV4WanrVGvwY0SINJAfdgsO2k/OSwIDtgRs+r8uPZia+E3/yQmc0QiZObio5JMzfKdUVK3YriwnhJZrysd/cqSbb2rVMtCPXjQIgsUDx7Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FMOLylbJ; arc=pass smtp.client-ip=209.85.160.179
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c10e86e52so45081cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783465484; cv=none;
        d=google.com; s=arc-20260327;
        b=gDc/e0PBxZlQkMo+yUyHeev8Sd37Uw/apTozjqdveVADDC7eB3okdtRTEVyzPTOqbJ
         +JHdUYu/fLqRM9f3xZPzNGJjDembMq8S46fQcv0kSC0hjJGaix4uQ+SojQRwG5Dk0bNl
         I0Z4LLToy5HmbK2DFeOjpMT6+mJ+3rDwfHkfcLoOeoEIaCN2FxNvHY2BiPrmlx5YPkSd
         BZe/MX3V+rsXDE+OAD56Ak5wlUrIRPRppvk6Q56vI8/ARbtkbgWK3f42wbmrMMREYLh/
         xYh0R6umQ3w2GcZl01zS2QPVH3KpsWJXWoXFf3ajDSvyCVHER7BVPi21gleEBeDMIOgb
         HXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        fh=7WBMiWgnK6gSkNOM77M61BCueCt0S9r+G8bwreqwOaE=;
        b=pWxs+FEKvdiIP35dwFTXgQh/d6nXgBGBIin1BsJkwM1KEtdNQ14mLH9ef8RMaOqWF1
         MeYqo7ljkZm4xav0ZV3Fbtvv4fqXtM8mhNpe6R4u3HBaQ4nWejFNFF4nzL4qkD5H+PlC
         21VBs8yMhomWIoOJKipNZGI6lw7E1Xb1DAsOZ93FNFDbVbt/pW6K/taFoafbUyohd7SE
         fIwyYva9ILoqGzvrg4lupRjfO0HlvpKosAM187kEI7yxZtnWFOwFCx+khKNIaijLVKTh
         0hY331/qmT9wn7YtyF2Irr6/+4kwUeAaI1m7VDUrhL/H1lYomiwrgXVTQlKUokd6yctE
         qQNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783465484; x=1784070284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        b=FMOLylbJhw9JAxad70hgnmYZHpLkbiUm2/TXRkse2pqBGoHAtQMbgcwCtH3UVCdX1t
         psCpCcoRx0Cc3IOBzTJ2s275MYc+6yPgqemV9hk+a+F5nu+ssZTR/VqY+o+8NPFlY4gO
         ZxMqCIv72KYqqIci6Nl7YKA/ruK34pbhNs5H0JnmamY9d9sfYV0GIl7asLUnkTiOnnTg
         NZph8NRkl5XWWJrWumHwjfNmivZy0d1CV41DMLHzccFC2JZciXWh9uzKEy9q+O8cO1NN
         UnxycQhbLN9ziV6HDNSiyNl/GMGHLljZArPcwSdG/6cvt7xSEuQ26GDbuEpHmJRl8AkT
         s7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783465484; x=1784070284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        b=WKSbz/nzg3s+bdxeZ5V70eScQEvyImD53V9kQhh9rrIwKHAHF87xtY91nL3vhc6u2X
         kAO6tIPb17vOhd3rnAztW4ohmiiZUEPTwANrSvKn+p7K/Wqp8l06ySavwHxrlEXa1il+
         lYv2cv2HKeh2ZPCPVAqB/AdpDYjLdHZzi+ljuLqJVDF/jUWRGo/9OUfzmkAnLxp1n3DU
         i72l3YcXvTVJg813eM9beDeQlLU8jf/ZXo8zjBVHqP8Mj1ZTV72nt3kcpHgr+lzKK1Ca
         ntiW6MkLNr3iNzNSrV/VKMN8wzKB0Wfh7AEKGOtyRWgpsQKmbtzw4Cv0JCkxq6ELtwWA
         pjEQ==
X-Forwarded-Encrypted: i=1; AHgh+RolnzZHkQpFb4nF3Bj5aHufvflTuS8BtTBcUh3CXe0oYEPYR3cGAsW3NrBH7gcvLuhV1vHWXzK9k18Ed1hi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz25bWT6LEfce5kscxNzPTc+PdATZjnJMu/gbzn05KtsO5CGrG
	7gshNDUXD/L6c32YqVMKQ7zsqAc2Vk1ZO3jZim2MKwrICXw+Qw9YMWIoxWOG3ZiUPGBd7X6Poh1
	usMvI8K/cOXrqYsmE66EyuRi1O0S+4hXcjPtTvlQv
X-Gm-Gg: AfdE7cmYXQ2lmOSC4zEGLROcbt6cKmA8+057EOdL8a93LepfWkEt7k+c09G7J9J8Mlw
	V82FR0yY3h1eO05tKQGN78OC2J6772/r0HA5FaNHeMq+IrdBd1xRP2RX43KMzJ6w4DVTsO0wel0
	DnyY5n0zlHTZI38aTGYkly5LKql6+5i3DwcTm31+ibKcmN/PPRsKJhJQ/PXEggVLkrJFucmDHGZ
	L8N0n/xd+fEXvOXcgcbRhcJmboofDuNxaUMc/ZiitBiW+6+B49jyVgTku9gks99YEaVFVNz038T
	u8TEZLV7SfpMyX3hIZ2fwfYn1Uy8r04bs0yh
X-Received: by 2002:ac8:5f4c:0:b0:51b:fd5e:e81a with SMTP id
 d75a77b69052e-51c7b43344amr11256661cf.20.1783465483775; Tue, 07 Jul 2026
 16:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com> <20260703161228.GA1948451@nvidia.com>
In-Reply-To: <20260703161228.GA1948451@nvidia.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 7 Jul 2026 16:04:31 -0700
X-Gm-Features: AVVi8CfuI8cp_vTcATMKW7PcdPdPcCuC2smvbVMutN55JZh4YqKCDGaKUlDmCMs
Message-ID: <CAE2F3rDR3PaiHo8KW26jTqWYD0EfG2mqbfEHhupEzHYENxz=Vg@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117428-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:vijayanand.jitta@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:prakash.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[danielmentz@google.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8498720531

On Fri, Jul 3, 2026 at 9:18=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.

[...]

> > Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> > provides a compile-time opt-out for hardware affected by SMMU errata
> > related to the contiguous bit.
>
> I reviewed the errata and didn't find any related to contig that
> required disabling contig, the driver was OK with the ones I
> found.. Did you find something specific?

Arm MMU-700 is affected by erratum 3777127 ("Under invalidation in TBU
possible when using contiguous page table entries"). However, if we
disallow partial unmaps of groups of adjacent translation table
entries, we implicitly apply the workaround ("Ensure that contiguous
page tables are removed using a single range invalidation. Arm
recommends using range invalidations to remove contiguous entries
anyway for performance reasons.")


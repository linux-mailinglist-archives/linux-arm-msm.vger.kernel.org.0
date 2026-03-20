Return-Path: <linux-arm-msm+bounces-98917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM6iBpYuvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:25:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD312D97EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A45630215A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED8736EA9E;
	Fri, 20 Mar 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ed8NYnUR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mkmieFkl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B463A75B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005907; cv=pass; b=tzbFtFVUNgvaacVpuxGi9MmOzBVLKtHvPEEXQ7vPDuq76fVQZN/W1JzC+2I70OBhjxYwhpxOIopBlQaUYZUU4yNhgOVkMuLqkLFiHdWZsUXgkDSwJdBngOI40U5xNTfksk6Rf9wmqrTHcIyG92gY6nmqhf3oUlvGIR4WzpsbXjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005907; c=relaxed/simple;
	bh=/S+n5+jDjLpz4fxKEVi/GbwQPh1O47WJlI1nyJ7FmsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uce6Wi1iNc8lu1WkuUDvseUm8adrot92hFZiWIDfouQBVqo/dTo7k1pJ5wASggwTsvuZ+0pcQfO5OlhBbmI7TvaN8MkykBjQVYDsBCYwg+fGM4uts0H7WBZlRs5jw/ZpRp79Sm6LoM5v3pMxlmlOX/jNBeT9Qqn/ioBSZM2JAtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ed8NYnUR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mkmieFkl; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774005904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/S+n5+jDjLpz4fxKEVi/GbwQPh1O47WJlI1nyJ7FmsY=;
	b=Ed8NYnURTs2KdwVLTSOWiFCMHaDrj3m2jI0zWhEIH6CQHOhjUZRQLRHc6EvdJHuFeTTgYu
	cDQhUMu2+BILv0FL/3NFzZZfWnb7EcATOa4OUbfayL0t61T+0uf1dMio7tC+dmHkU4KNta
	7rHwmsmJfoDnfV9GZwVf0MRNNDcJO9k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-Y3pu2ixgMPWMZSrfYqb6ig-1; Fri, 20 Mar 2026 07:25:01 -0400
X-MC-Unique: Y3pu2ixgMPWMZSrfYqb6ig-1
X-Mimecast-MFC-AGG-ID: Y3pu2ixgMPWMZSrfYqb6ig_1774005901
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b056b2f0cfso26586685ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774005900; cv=none;
        d=google.com; s=arc-20240605;
        b=UUTeP4fI6ZSZqOJXOKOkTkm8s7fZk0ec5vA/IOmkX/IqI9IVYllNq62Yv4Iiy30+YJ
         jEtTn2e+p46edGpJlUto82FTxUxvkDtt+nK3jcXmp4uE8phZCvD5GoqlleKKpoqEbjbl
         cFTCQbonwcOW3q3Pe9Cy+peK7ByNt7+CBu+d63Gg6Bb0fVWNpaga+kkSXz0XTIslpIJE
         jvodZ8ZzenrvMaSvGWAZxoASg5BSOiIF/Z0uTXIpG3zSev1edeiewE3+s0YztxXaqbna
         2MPrLOu4DUMHd8k9DDUINcx30ZtaNNJWDc5ni7f73IiyldpRR7CiR6Bhg7k6vjI9GI1g
         K9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/S+n5+jDjLpz4fxKEVi/GbwQPh1O47WJlI1nyJ7FmsY=;
        fh=8ASHwdHw7pmQLZokN+6BwNpdhlPGwWMUh2RxTLgv/i0=;
        b=I3ClOe7mpaaB7TeHLnVE+yVY6Q4W4L87AeJQ/micgsAtdCS8OQCpqcjXB6IHt+Pc6K
         manLqwBfISRV878yGeS6YpBdIvq8+EdDUUcfh1/CqCMqID1ykaZu9jZc03x3KOnVqedl
         uc6r2O44qPGFuxVMc412M7CkrzHbQO7ymA8yvIuioq9tM0iNgRf8JOU9ouv5zuqlSike
         CxAHawI6Hd7vZxRhP8azQaSLxB2rokgICV/fjh2T5sXvMipnORMeb1tVljtF+bg2WUbK
         /PfzCUccy/s2gR2kOjBSB1vIPOyxcVQuBfZ6GYl8UU2qHqEUFp788+TJs67nltA3cThe
         GYvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774005900; x=1774610700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S+n5+jDjLpz4fxKEVi/GbwQPh1O47WJlI1nyJ7FmsY=;
        b=mkmieFklMwtYM5eUxC5kaYF6n01q3o7syN5KXKZ2k+q7lWUHoRC7Z4QTLCTqyhtj8O
         IBW5TVkpGNo6dwnYeXg5s39LypIvaLsl349oNcaOX9VO3Zt2q9/T+w2Hr96Qpv8bNFfz
         qaOhPy5e7edRqMZc+1XgZH2m4w67Oy4j6A65z0yNUaIlByQq7TroagKBoFu4m44NCU7T
         1/KKEwkjqrjTsdbV8vdAWvW37Jdo/JS535rq1h8ug+3LNBfWk9PaFgAWI+hqZsF0ziOy
         5krvhVjKCSEBj0Owp2fYIz2B7TegQxyreIwHWOzR3agiM0DjGsurK98A0AfEP87Q7VDp
         fqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005900; x=1774610700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/S+n5+jDjLpz4fxKEVi/GbwQPh1O47WJlI1nyJ7FmsY=;
        b=KuvqmKluvV+zIQut/TFm06yupoWFPjz/T0BojumYGqyLuSUZyGutcK0QGpknIJ2/8v
         DcfqGs2IMX7QiDdSsXIWpS8lwyaUj8dSyZv/gJeaA+r6K2nrjVm42QN1VQjgbn1KdxHs
         kwjE6T29TM8dDVM+IEf3EQjBNoXYEc2DUst1vJ1DYj2+CT+zvp7KnJ0gwzyqUrc0Kkx9
         n07mcCKWXKsizl5Px3hDxhsiJ60Tk0myRtHCNI34zSNpFJS6Yq4MLfmNkbH3R2WWhknT
         sgZeaXnFxN9St8S2CUOdhHRXAiHnaQlk6c0CTYSEaiJMJnDMuhsRml8gsA/99jjpesrN
         e3nA==
X-Forwarded-Encrypted: i=1; AJvYcCUBlzv6s7QopNN77yXO3jsxRJt+bPrzU+NTKorIRt8ux1MqAp1cqA6+aEsbcDIiwWh2uesOdLV4U/hpbyOC@vger.kernel.org
X-Gm-Message-State: AOJu0YycnQyXO3PtG69SyC0FTs/q62/LSFh7goa7FgGsYmNC/TpEEE+I
	4KMh6JcDrwwX6dG/esdf0FWNPEquRRcsZnQYjv21eOCANuf0j1NMmLOKMRI5lNpkysK5yNhzAOv
	2aX2ayztezO+IGSVhjPJHEDQiDuJjPrfuMjAkLG8pBwzkOwGM/9PAN7DkB1sx19oRVl3cokRVgL
	WQAuUGqo+bQhKDYUwJbq2NlBaFI4MMJIjn1N+OVZwFPg==
X-Gm-Gg: ATEYQzxnM7BsfuPif1SpmlUJS8ON8K+j5ZbIh9biXANlFDeuYZ0cfxF7NbebDso5bef
	IO2Mge7Ea/noiNrUbhlTg+AVu89WJgX8TcwABtZagMygotkXDHoXZHcJyTiXi2xYoxl4Wga1JXg
	v6pl2f5I3EAVFvhpOSc2HoftQspqWdtRC+GSZKQc6amYCRiV9FlGKey5WJaIzlcjs7n7krULrMX
	oZLN7U8hUs5QrEH6fFwcF7LmWQfmwJxNODuYnA=
X-Received: by 2002:a17:903:32c3:b0:2ae:7efa:c8a7 with SMTP id d9443c01a7336-2b0826c3d59mr24401755ad.9.1774005900676;
        Fri, 20 Mar 2026 04:25:00 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2ae:7efa:c8a7 with SMTP id
 d9443c01a7336-2b0826c3d59mr24401585ad.9.1774005900320; Fri, 20 Mar 2026
 04:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316102618.7953-1-gpaoloni@redhat.com> <20260316102618.7953-3-gpaoloni@redhat.com>
 <384e46f3-140c-4b88-a3c8-6cbb57ecff99@oss.qualcomm.com>
In-Reply-To: <384e46f3-140c-4b88-a3c8-6cbb57ecff99@oss.qualcomm.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Fri, 20 Mar 2026 12:24:48 +0100
X-Gm-Features: AaiRm508Jbm7lPT8c_Kk2Oo4cgMy2LohcOArQZ5lP4OFDVjg_pOnHr1LK-cmnBo
Message-ID: <CA+wEVJYcY0nD1exUtDXmmED_YxkiCpkMrLjZJeE=B5C5p6HhFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to
 report errors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpapini@redhat.com, dnita@qti.qualcomm.com, 
	rballati@qti.qualcomm.com, bijothom@qti.qualcomm.com, wchadwic@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98917-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3FD312D97EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad

On Tue, Mar 17, 2026 at 10:13=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/16/26 11:26 AM, Gabriele Paoloni wrote:
> > check the virq value returned by irq_find_mapping(), also
> > check the return value of generic_handle_irq(); return IRQ_NONE
> > if either of the checks fails.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
>
> It certainly seems useful to inspect a function's return value, however I
> noticed that out of 47 in-tree callers of generic_handle_irq() within
> drivers/, only one other driver (intel_lpe_audio within drm/i915) checks
> that..
>
> Similarly, many other drivers never check if irq_find_mapping() actually
> succeeded. This makes me wonder how you discovered there's an issue in
> the first place. Could you please add some details in the commit message?

Code inspection spotted the issue, and I could not find a justification for
irq_find_mapping() and generic_handle_irq() to always succeed; hence
I proposed this patch to follow good coding practices.
However if there is a justification for these functions to always succeed
in the context of use of the Qualcomm IPCC driver, I can drop this patch.

Thanks
Gab

>
> Konrad
>



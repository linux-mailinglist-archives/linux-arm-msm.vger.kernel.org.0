Return-Path: <linux-arm-msm+bounces-46934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F3A287AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF617A8273
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F1E22AE65;
	Wed,  5 Feb 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XLVN661S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D922A7F8
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750077; cv=none; b=iSz/iGSfLbXu6PRJC/WIc9PqXKK5UpM2sHcPNrTUtgX8AF+6hKiE6ZBy3whJTNrqF9XP7tC5IR2T/+7Dssg/vU0FIZNiK5tlnxcm6hpRHP2p4C3FpR3I63Vr5vBPybhjpEJ9FMWDIQ7TtNqARDiB0QSvn2+ZdpUVZdGDWiJG/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750077; c=relaxed/simple;
	bh=E6EZPUORHVouaAmZ2iEF63ewgHz6Zii9/w1uu6nphJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT8SgO4CTJr6R+rukXDwRbueJ5bW2eDQLlAcK4+6skbTGWQP96EQZlayaZNHmOljpApjGFR6J678MB0E0cgrEOgoJj4NMHgFQEX0BlUbap+0r0rUI02EZ4ztcgBfpING8AnQ1MFG1fc5LX8iFjzMAo/FiFMIxUTw8Q9DVSxcBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XLVN661S; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so560141cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738750074; x=1739354874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgieNQDWbe6UJ/a3VoJuSb/hrlwJAKxq/2FZo7aK9C0=;
        b=XLVN661S18XdBYN0F8aZRnrW7t9p/hXvKGNaw7+3EdoXey9XK3rQt7+N8xC9IROe2A
         9YMJ6GV/qoovhR5JcHDPsrGiMQ1mqkMQ4NsZk07KBg//a/krQifJI+vu75/YNkZeADiC
         aTrfdSVtPtzGNPN7UNX6YCR33sLHCoq1/4WM+QxcFvHfsXi3Zz615ONR/PznDGFRkqPK
         jxrxe/IIOaKmZiRfoJ61loBAByZR4zrbfzO9iUaJsTzIVfV9d/DJKco0uJeABjwGz5HR
         hu8Lhm+ofwEBY8Kv2AYF4mvl6+sKle2V75H332hce+k/MJH8UT9xzQky6pn6OJC9U0yc
         skCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738750074; x=1739354874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgieNQDWbe6UJ/a3VoJuSb/hrlwJAKxq/2FZo7aK9C0=;
        b=uLYcszxPbz5kTXOwGblPyKejbt+X823H3ip7icthGyT5tQgbAtF6AtoDzTtFr4bSUi
         PazkDa08T77TYlDfpoPfHf3Gr7wE4x9RKCnZiDGXhlGMIsEdh0cqBoC6NmE3pbc0skCb
         F6qXCOWm9+8VRqwmUuCvWfMcdODO5O6vDXINDFlyXnOe4vtdY8nLQj40HyleJraYkuS+
         TZZPrrMGPI/ERqKYcdKWryTWalpI9kZ57oFixq2T+MX1STG/9N73dGHy9QXgaplQS05b
         /ZikzlYAxptWhhsRAvSDvzyTN2zb53E2lLD3754QxPMKtgJzV+Y6k8gAMcuF1HSGXezw
         yrfA==
X-Forwarded-Encrypted: i=1; AJvYcCU4fBL2BEjiRvtGDISko9+uksG4PTCDcMokAOfWFFoF0iae7ORW87i5q8/DnSJpJXlrqWSjzsVsFcxafQT9@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsFWH+QjG/kE8i1O5shYn+JIgygveuJiqXX2vDWewUl0OXOAg
	LAxeu/P7HMJS0gBJ4QBXSNAw0iolWGCpbTu9w2610quNeeevdyp4JIaHp18TPQZDMswv7C2IiMw
	grcJmdsbGUTeS74Mbfg1eDURbIXWiX05nIGWG
X-Gm-Gg: ASbGncuIuTX3sGvEsISUpHdwMZgv/C5YAj/fsFcg6kMzRLK+IZplOL3aLeSDTbTcPXW
	oxscRUDg1jkWQ8eOKmtKohQViPzr03REbs2c7iBwa75gPL6tnveZRc9DEoCLLe8rnj56R3M9+HD
	2CoIuOjMob4blU65uk9bzVNfDyPQ==
X-Google-Smtp-Source: AGHT+IG4G08H6SaXBG9SJQq4wOUQkHhFq5TVkaTFoYC9nSvxNxVx1eB6lZEAlM3Dy7awdhwgGaeQi6Fwr/JMOjowJPA=
X-Received: by 2002:a05:622a:34f:b0:46c:9f17:12dd with SMTP id
 d75a77b69052e-4701ab77f50mr7422001cf.19.1738750073369; Wed, 05 Feb 2025
 02:07:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-7-tabba@google.com>
 <CAGtprH-R7g5NNLZhO0hTs_RWML_pLafT8Wy=f13qTrHO5LscGw@mail.gmail.com>
In-Reply-To: <CAGtprH-R7g5NNLZhO0hTs_RWML_pLafT8Wy=f13qTrHO5LscGw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 5 Feb 2025 10:07:16 +0000
X-Gm-Features: AWEUYZkIkkLRXyaTMrVhdDtLzD6dWJnmf8Pfc1flZ135xg6YsQDlRYh3poiT-4Q
Message-ID: <CA+EHjTx6SHfpW_LO3My-iy2_z_T4NvLuGz_W+1pddnu4bUjUQA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vishal,

On Wed, 5 Feb 2025 at 00:51, Vishal Annapurve <vannapurve@google.com> wrote=
:
>
> On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
> >
> <snip>
> >
> >  static const char *page_type_name(unsigned int page_type)
> > diff --git a/mm/swap.c b/mm/swap.c
> > index 6f01b56bce13..15220eaabc86 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -37,6 +37,7 @@
> >  #include <linux/page_idle.h>
> >  #include <linux/local_lock.h>
> >  #include <linux/buffer_head.h>
> > +#include <linux/kvm_host.h>
> >
> >  #include "internal.h"
> >
> > @@ -103,6 +104,9 @@ static void free_typed_folio(struct folio *folio)
> >         case PGTY_offline:
> >                 /* Nothing to do, it's offline. */
> >                 return;
> > +       case PGTY_guestmem:
> > +               kvm_gmem_handle_folio_put(folio);
> > +               return;
>
> Unless it's discussed before, kvm_gmem_handle_folio_put() needs to be
> implemented outside KVM code which could be unloaded at runtime.
> Eliott's plan [1] to implement a guest_memfd library can handle this
> scenario in future.
>
> [1] https://patches.linaro.org/project/linux-arm-msm/patch/20240829-guest=
-memfd-lib-v2-1-b9afc1ff3656@quicinc.com/

Yes, not just that, but there's a lot of KVM code in guest_memdf in general=
.

Cheers,
/fuad


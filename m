Return-Path: <linux-arm-msm+bounces-58132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6BAB9046
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 21:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0090F16D299
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DF325A646;
	Thu, 15 May 2025 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSFzTJkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E31F3FE3;
	Thu, 15 May 2025 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339013; cv=none; b=PoZm89HOGArWKrCGJmCpVsYVPfk9OFReX9BXtskduTOYIRnEL4xV9jODxApiEJ7JNnxBkni6UIIa9fPdmTntv69ba28sadCgEuAg7rbAh7iV1kbtBtAAPZzYENSp/uJSjGLxc6Lokt7YHNlmI8qK7WfldxN2kT27S59mwDCIsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339013; c=relaxed/simple;
	bh=BSk6HMXbHqy4bmF2p4V47cUoMUq5f+6F3jsfiwPTCqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQtCSXa1uAFumKsuqYLnv7vO/ISDXERDKOot+Oek5YkplVmQsvvgKUKn5AI52bVTwei+uFv/ff+ioPJ/jF/vFeXk8RqiRPty5JIkCpfGotSJZvNZvYV5SrQLCp9DjPBv/9FhgXsNub1cqyFga0OJonJBC8trQnJ6nM2wR3Ty3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSFzTJkx; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85e73562577so119341939f.0;
        Thu, 15 May 2025 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747339011; x=1747943811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMAdLoMT5L/a1MOnGEYuM9x+axh2zb+MjQ/Qq0Mzs2g=;
        b=eSFzTJkx/Bp4aZsHqo/NxJ5F9iCGJoac/adBSHKWVt+Am1ssUm/WJFdzqFZDr0iSyE
         P8t+TawyFOy/5uUdMHwbAurmc1qoZt6TOUTDdx20DeYR9a4tlnWRLjrxUXn3T8HzmuCZ
         xQiZoVHBu1bmGoCtdDlP7LMELVPyrBqYxm8pc150Z3j2Tx6WXSY5/KTXeNSoKJqr9vTX
         pVItT7IVi0wLzfVLhZuAdZrj0LqODAqa5fYs0qHuKTlbwf4m8K9tjorF8voDGcG9eOpV
         2AHOvdRxvjGFXrZ+PbJANnbKbi1tEcNnBt1+w+xD9CbiwiKcZEtlO6OsfTHcBh0jb1Wf
         U1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339011; x=1747943811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMAdLoMT5L/a1MOnGEYuM9x+axh2zb+MjQ/Qq0Mzs2g=;
        b=ml03JUZ5CU4N31U3/Jltngf4guQaeAPRJIl2F52w1de6S9RAXfLJ9sGTS/XNRH55iA
         5Py8TGYsGTrXHxwidrm+nlmZLnCu4x5jk/oCv7wv7k/Kzx9Smw0k0B1KDnnuHx0zLtp/
         VBZyzt4VRvObDbfbOCmfqOZTWnoxJD1GhkCtsSp7TwFBp4ba2m4kQ5JO9Zb2GpxqhFHr
         eDGb6v+jpwwSHX1ImxeT+tpylGoxP1dlPTJTBN72RhqCewQRZM+eCa55/e+raVlkdcZN
         XXTUTCKwvu9dB2myAem8oawUsdjd1MIg7kUo+4j/vnjMe0ShGNvkKMkJvfCmmOQax1rX
         Rcjw==
X-Forwarded-Encrypted: i=1; AJvYcCUX8L9qdntGY/wTAKhA6JfTPI36waOL8QkPGv/sHDKZAR+cNlSf9nV8rYx1RO60Ko2U4iCbj5Onpsl7gqse@vger.kernel.org, AJvYcCXM7O6qS0ub30ugJro3VL+0PrAKiumY88Xhn1tTD1fm/aORfjeUeS1v+x9FB/k9uAvualVYcWWDHyIbBN2b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TzkT3/laZVLcDLyCx3kkLUHQOHL7TSAjDlOBNnwiSltioVJ0
	VHGZqKSL66Ka+aZfv0kgogsSJ29gswTpl9XpiUgq17T7d2rUWp/ytU600kSTwV5GlKOkXkHspFv
	o1cwmHwakghhMTqAbRUU64Xs/FsRWl+8=
X-Gm-Gg: ASbGnct9nJx2fPMzNXOHnIv/QDj2Zc+Q4osSrfy4RoyorBf+FL6v5zAMlOyBuKhav99
	01tXxDr+etBMuF6BzNQlx5rMPX7A9zSe2NWgyoVDa/C0DzujjCfdy41uvms1QmEZWWLSPpMKox3
	s0yRe/H2NfZ5AabCrbgpykjd+lKL9NtXE7VJE5G5NUMFvu7TYjqqukk16ES5fap/BfuFg=
X-Google-Smtp-Source: AGHT+IFPCvF4LukcF3e+PrLa/e7+Ptn8ausMxE8i1Ao10DvbOVg+94kocFag8Mx84gWnNCqcKrfEOwhvTgh/Bgnpj6k=
X-Received: by 2002:a05:6602:2744:b0:867:325d:6247 with SMTP id
 ca18e2360f4ac-86a231c39d6mr191572739f.7.1747339010947; Thu, 15 May 2025
 12:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com> <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux> <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
In-Reply-To: <aCY42rgJC4sQ4tp4@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 12:56:38 -0700
X-Gm-Features: AX0GCFvRdC4lKpvLHD4k1lEo4Kh-CGTqFLXWxbdj5_u0cbuv5zT5opAiGIP9Ch8
Message-ID: <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > (Cc: Boris)
> > >
> > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > > > For some context, other drivers have the concept of a "synchronous"
> > > > VM_BIND ioctl which completes immediately, and drivers implement it=
 by
> > > > waiting for the whole thing to finish before returning.
> > >
> > > Nouveau implements sync by issuing a normal async VM_BIND and subsequ=
ently
> > > waits for the out-fence synchronously.
> >
> > As Connor mentioned, we'd prefer it to be async rather than blocking,
> > in normal cases, otherwise with drm native context for using native
> > UMD in guest VM, you'd be blocking the single host/VMM virglrender
> > thread.
> >
> > The key is we want to keep it async in the normal cases, and not have
> > weird edge case CTS tests blow up from being _too_ async ;-)
>
> I really wonder why they don't blow up in Nouveau, which also support ful=
l
> asynchronous VM_BIND. Mind sharing which tests blow up? :)

Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_s=
ize_2_24,
but I might be mixing that up, I'd have to back out this patch and see
where things blow up, which would take many hours.

There definitely was one where I was seeing >5k VM_BIND jobs pile up,
so absolutely throttling like this is needed.

Part of the VM_BIND for msm series adds some tracepoints for amount of
memory preallocated vs used for each job.  That plus scheduler
tracepoints should let you see how much memory is tied up in
prealloc'd pgtables.  You might not be noticing only because you are
running on a big desktop with lots of RAM ;-)

> > > > But this
> > > > doesn't work for native context, where everything has to be
> > > > asynchronous, so we're trying a new approach where we instead submi=
t
> > > > an asynchronous bind for "normal" (non-sparse/driver internal)
> > > > allocations and only attach its out-fence to the in-fence of
> > > > subsequent submits to other queues.
> > >
> > > This is what nouveau does and I think other drivers like Xe and panth=
or do this
> > > as well.
> >
> > No one has added native context support for these drivers yet
>
> Huh? What exactly do you mean with "native context" then?

It is a way to use native usermode driver in a guest VM, by remoting
at the UAPI level, as opposed to the vk or gl API level.  You can
generally get equal to native performance, but the guest/host boundary
strongly encourages asynchronous to hide the guest->host latency.

https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/693
https://indico.freedesktop.org/event/2/contributions/53/attachments/76/121/=
XDC2022_%20virtgpu%20drm%20native%20context.pdf

So far there is (merged) support for msm + freedreno/turnip, amdgpu +
radeonsi/radv, with MRs in-flight for i915 and asahi.

BR,
-R

> > > > Once you do this then you need a
> > > > limit like this to prevent memory usage from pending page table
> > > > updates from getting out of control. Other drivers haven't needed t=
his
> > > > yet, but they will when they get native context support.
> > >
> > > What are the cases where you did run into this, i.e. which applicatio=
n in
> > > userspace hit this? Was it the CTS, some game, something else?
> >
> > CTS tests that do weird things with massive # of small bind/unbind.  I
> > wouldn't expect to hit the blocking case in the real world.
>
> As mentioned above, can you please share them? I'd like to play around a =
bit. :)
>
> - Danilo


Return-Path: <linux-arm-msm+bounces-26475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D56933EE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 16:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8ACD283861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 14:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A10918132F;
	Wed, 17 Jul 2024 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHgMmR9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547018131D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721227991; cv=none; b=Uw/ZDLqbdUEGzOd68iD+iVkXPHF4L5NhTpCm5UFG1zbVMFy5MBvlyRYuNpfUCR07BR74GtUP5CuhmtpvHSKYRgwVMGSsss5BT0fdKL1/bsbcgbJRU/TGMQJzuj7K2om3bIw6wYgvfcvhxJjjfeJcqBOOwohAu/OsO49/QMpXfvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721227991; c=relaxed/simple;
	bh=JziZDjsG6LOb/nh+pRC1wlWrRoiHH7m+IBmRCYO+IjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYDF1I1vKndiQBU0uh+jAk1YvyxG4Maa36ph6VM62U/fHyFZbxg3Oyceahc1MrgTcdvonru+V4OWD4NjUTNF8qs8IUIkEPgNUabbaFdpF4iO+JuBzoL74jPCHxv+7Gp1cXDVcgnrVFBvnyMifDXxUlrk3GDOfPr42am8oZjVQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHgMmR9R; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5ccfdc3157dso413952eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721227988; x=1721832788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLSg56uLBgIG1pUx/npQNlUjYeDmmkZxvAYtL+3WPWU=;
        b=kHgMmR9RoQBJRbtMb7qR+X1j09ECyKhZXmteg6Y2ZOoyaqmhlm8d5IfRJ43ebmWoZh
         m6XKoV8N0j1chmKjZC6F19FPyLUH7AHlJ5WqR2Pi4YbgQNqVNrSpk6Vs/r3Iloxe45+0
         3NQ0/79rUzyptUMVgZbhaUB7u+Rxsbz4O8rxppGscOL/UDfRgwLdAdzRGLGwZiA/pmla
         UtQrSle2erS5KNFcTZQWK2TNK0tVeVyuUf3ARQn4roBq7Sh6IxpP9GHWQMioRS6lxcH7
         Qz3iqHgfRtrSPn0w6kXK/dJwxzuk5pwAt58nLqptphMVZbFM1Esg7HiBeEn1h8omJYWp
         x9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721227988; x=1721832788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLSg56uLBgIG1pUx/npQNlUjYeDmmkZxvAYtL+3WPWU=;
        b=himHCMLCD/Pn7Y4/QAeibTYlnXwXthjgv8DW+gaqEiIdTAthtc/m69ufiSR6ECdk66
         i+hG4G0QIlRMcN91rp7TfWNiUoYx/oBj5GC6UZ4Taqrn4v4nSvTGi3KIzgkhwhbNd6fV
         qPBJwIf782Le3ncGSXHnFRx3HePfPQs1GPkxWOPRSR7fh8qgXENLThUmUPoM/9tWdzM6
         PGxhdWBN1Hhnqc+g0UG3omwk2NYx65SiInARaKCTH4kBIWXp7okeJEOyOnrWXhtOgRlC
         xMsdQ6+NyQrPgSHN0ZCoz05N8QhN1uyJJvv1wpr2EU9rlkay1SkwdB/8F1CdqYY8FF+D
         BhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnLBUK2NLGh68+ATi+YKhYGypnxjhKZ0UDoJ1riJg7BUBmQBkLgYDId+aHebD6jHSJ3ZRkVfKeINU7TsvWFi8AxST37Jg2FB9YAPf4+A==
X-Gm-Message-State: AOJu0Ywvznuq2UUDJizs5t0/p4W9nkKzJV/a+jrLthdH912bM5Q8zTk5
	DMHX3HXlRRp05AlXCxX/k5JSZ7vss+95emcKCNghYexIdN38gn8PP54EWqthlY44ege9GnqoRvq
	1xFnGP8RSV4+sjN12VOjDtS7ZZlaJe+9iOSkwlA==
X-Google-Smtp-Source: AGHT+IHSW/ERmdKlRdS/3UJ5tV2+Zcr4D6m8ewWBnNCa8m8z0SAB5njGSxIiBhM2pYbqbhheegFlpc9TPw5jhgo6S5E=
X-Received: by 2002:a05:6820:d04:b0:5ce:5d7d:f46d with SMTP id
 006d021491bc7-5d3cbce1058mr1375171eaf.1.1721227988301; Wed, 17 Jul 2024
 07:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge> <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
In-Reply-To: <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 17 Jul 2024 16:52:55 +0200
Message-ID: <CAHUa44FXT6VREMUkNsY943EfhFoMSEsWKb5vyx9SwOERXitDbw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>, Sumit Garg <sumit.garg@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 10, 2024 at 1:17=E2=80=AFAM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 7/3/2024 9:36 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
> >> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> >> the secure world. Access to these resources is provided using MinkIPC.
> >> MinkIPC is a capability-based synchronous message passing facility. It
> >> allows code executing in one domain to invoke objects running in other
> >> domains. When a process holds a reference to an object that lives in
> >> another domain, that object reference is a capability. Capabilities
> >> allow us to separate implementation of policies from implementation of
> >> the transport.
> >>
> >> As part of the upstreaming of the object invoke driver (called SMC-Inv=
oke
> >> driver), we need to provide a reasonable kernel API and UAPI. The clea=
r
> >> option is to use TEE subsystem and write a back-end driver, however th=
e
> >> TEE subsystem doesn't fit with the design of Qualcomm TEE.
> >>
>
> To answer your "general comment", maybe a bit of background :).
>
> Traditionally, policy enforcement is based on access-control models,
> either (1) access-control list or (2) capability [0]. A capability is an
> opaque ("non-forge-able") object reference that grants the holder the
> right to perform certain operations on the object (e.g. Read, Write,
> Execute, or Grant). Capabilities are preferred mechanism for representing
> a policy, due to their fine-grained representation of access right, inlin=
e
> with
>   (P1) the principle of least privilege [1], and
>   (P2) the ability to avoid the confused deputy problem [2].
>
> [0] Jack B. Dennis and Earl C. Van Horn. 1966. Programming Semantics for
> Multiprogrammed Computations. Commun. ACM 9 (1966), 143=E2=80=93155.
>
> [1] Jerome H. Saltzer and Michael D. Schroeder. 1975. The Protection of
> Information in Computer Systems. Proc. IEEE 63 (1975), 1278=E2=80=931308.
>
> [2] Norm Hardy. 1988. The Confused Deputy (or Why Capabilities Might Have
> Been Invented). ACM Operating Systems Review 22, 4 (1988), 36=E2=80=9338.
>
> For MinkIPC, an object represents a TEE or TA service. The reference to
> the object is the "handle" that is returned from TEE (let's call it
> TEE-Handle). The supported operations are "service invocation" (similar
> to Execute), and "sharing access to a service" (similar to Grant).
> Anyone with access to the TEE-Handle can invoke the service or pass the
> TEE-Handle to someone else to access the same service.
>
> The responsibility of the MinkIPC framework is to hide the TEE-Handle,
> so that the client can not forge it, and allow the owner of the handle
> to transfer it to other clients as it wishes. Using a file descriptor
> table we can achieve that. We wrap the TEE-Handle as a FD and let the
> client invoke FD (e.g. using IOCTL), or transfer the FD (e.g. using
> UNIX socket).
>
> As a side note, for the sake of completeness, capabilities are fundamenta=
lly
> a "discretionary mechanism", as the holder of the object reference has th=
e
> ability to share it with others. A secure system requires "mandatory
> enforcement" (i.e. ability to revoke authority and ability to control
> the authority propagation). This is out of scope for the MinkIPC.
> MinkIPC is only interested in P1 and P2 (mention above).

This is still quite abstract. We have tried to avoid inventing yet
another IPC mechanism in the TEE subsystem. But that's not written in
stone if it turns out there's a use case that needs it.

>
>
> >> Does TEE subsystem fit requirements of a capability based system?
> >> -----------------------------------------------------------------
> >> In TEE subsystem, to invoke a function:
> >>    - client should open a device file "/dev/teeX",
> >>    - create a session with a TA, and
> >>    - invoke the functions in that session.
> >>
> >> 1. The privilege to invoke a function is determined by a session. If a
> >>    client has a session, it cannot share it with other clients. Even i=
f
> >> it does, it is not fine-grained enough, i.e. either all accessible
> >> functions/resources in a session or none. Assume a scenario when a cli=
ent
> >> wants to grant a permission to invoke just a function that it has the =
rights,
> >> to another client.
> >>
> >> The "all or nothing" for sharing sessions is not in line with our
> >> capability system: "if you own a capability, you should be able to gra=
nt
> >> or share it".
> >
> > Can you please be more specific here? What kind of sharing is expected
> > on the user side of it?
>
> In MinkIPC, after authenticating a client credential, a TA (or TEE) may
> return multiple TEE-Handles, each representing a service that the client
> has privilege to access. The client should be able to "individually"
> reference each TEE-Handle, e.g. to invoke and share it (as per capability=
-
> based system requirements).
>
> If we use TEE subsystem, which has a session based design, all TEE-Handle=
s
> are meaningful with respect to the session in which they are allocated,
> hence the use of "__u32 session" in "struct tee_ioctl_invoke_arg".
>
> Here, we have a contradiction with MinkIPC. We may ignore the session
> and say "even though a TEE-Handle is allocated in a session but it is als=
o
> valid outside a session", i.e. the session-id in TEE uapi becomes redunda=
nt
> (a case of divergence from definition).

Only the backend drivers put a meaning to a session, the TEE subsystem
doesn't enforce anything. All fields but num_params and params in
struct tee_ioctl_invoke_arg are only interpreted by the backend driver
if I recall correctly. Using the fields for something completely
different would be confusing so if struct tee_ioctl_invoke_arg isn't
matching well enough we might need a new IOCTL for whatever you have
in mind.

>
> >
> >> 2. In TEE subsystem, resources are managed in a context. Every time a
> >>    client opens "/dev/teeX", a new context is created to keep track of
> >> the allocated resources, including opened sessions and remote objects.=
 Any
> >> effort for sharing resources between two independent clients requires
> >> involvement of context manager, i.e. the back-end driver. This require=
s
> >> implementing some form of policy in the back-end driver.
> >
> > What kind of resource sharing?
>
> TEE subsystem "rightfully" allocates a context each time a client opens
> a device file. This context pass around to the backend driver to identify
> independent clients that opened the device file.
>
> The context is used by backend driver to keep track of the resources. Typ=
e
> of resources are TEE driver dependent. As an example of resource in TEE
> subsystem, you can look into 'shm' register and unregister (specially,
> see comment in function 'shm_alloc_helper').
>
> For MinkIPC, all clients are treated the same and the TEE-Handles are
> representative of the resources, accessible "globally" if a client has th=
e
> capability for them. In kernel, clients access an object if they have
> access to "qcom_tee_object", in userspace, clients access an object if
> they have the FD wrapper for the TEE-Handle.

So if a client has a file descriptor representing a TEE-Handle, then
it has the capability to access a TEE-object? Is the kernel
controlling anything more about these capabilities?

>
> If we use context, instead of the file descriptor table, any form of obje=
ct
> transfer requires involvement of the backend driver. If we use the file
> descriptor table, contexts are becoming useless for MinkIPC (i.e.
> 'ctx->data' will "always" be null).

You still need to open a device to be able to create TEE-handles.

>
> >
> >> 3. The TEE subsystem supports two type of memory sharing:
> >>    - per-device memory pools, and
> >>    - user defined memory references.
> >> User defined memory references are private to the application and cann=
ot
> >> be shared. Memory allocated from per-device "shared" pools are accessi=
ble
> >> using a file descriptor. It can be mapped by any process if it has
> >> access to it. This means, we cannot provide the resource isolation
> >> between two clients. Assume a scenario when a client wants to allocate=
 a
> >> memory (which is shared with TEE) from an "isolated" pool and share it
> >> with another client, without the right to access the contents of memor=
y.
> >
> > This doesn't explain, why would it want to share such memory with
> > another client.
>
> Ok, I believe there is a misunderstanding here. I did not try to justify
> specific usecase. We want to separate the memory allocation from the
> framework. This way, how the memory is obtained, e.g. it is allocated
> (1) from an isolated pool, (2) a shared pool, (3) a secure heap,
> (4) a system dma-heap, (5) process address space, or (6) other memory
> with "different constraints", becomes independent.

Especially points 3 and 4 are of great interest for the TEE Subsystem.

>
> We introduced "memory object" type. User implements a kernel service
> using "qcom_tee_object" to represent the memory object. We have an
> implementation of memory objects based on dma-buf.

Do you have an idea of what it would take to extend to TEE subsystem
to cover this?

>
> >
> >> 4. The kernel API provided by TEE subsystem does not support a kernel
> >>    supplicant. Adding support requires an execution context (e.g. a
> >> kernel thread) due to the TEE subsystem design. tee_driver_ops support=
s
> >> only "send" and "receive" callbacks and to deliver a request, someone
> >> should wait on "receive".

So far we haven't needed a kernel thread, but if you need one feel
free to propose something.

> >
> > There is nothing wrong here, but maybe I'm misunderstanding something.
>
> I agree. But, I am trying to re-emphasize how useful TEE subsystem is
> for MinkIPC. For kernel services, we solely rely on the backend driver.
> For instance, to expose RPMB service we will use "qcom_tee_object".
> So there is nothing provided by the framework to simplify the service
> development.

The same is true for all backend drivers.

>
> >
> >> We need a callback to "dispatch" or "handle" a request in the context =
of
> >> the client thread. It should redirect a request to a kernel service or
> >> a user supplicant. In TEE subsystem such requirement should be impleme=
nted
> >> in TEE back-end driver, independent from the TEE subsystem.
> >>
> >> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
> >>    interface. This interface is not suitable for a capability system.
> >> For instance, there is no session in a capability system which means
> >> either its should not be used, or we should overload its definition.

Not using the session field doesn't seem like such a big obstacle.
Overloading it for something different might be messy. We can add a
new IOCTL if needed as I mentioned above.

> >
> > General comment: maybe adding more detailed explanation of how the
> > capabilities are aquired and how they can be used might make sense.
> >
> > BTW. It might be my imperfect English, but each time I see the word
> > 'capability' I'm thinking that some is capable of doing something. I
> > find it hard to use 'capability' for the reference to another object.
> >
>
> Explained at the top :).
>
> >>
> >> Can we use TEE subsystem?
> >> -------------------------
> >> There are workarounds for some of the issues above. The question is if=
 we
> >> should define our own UAPI or try to use a hack-y way of fitting into
> >> the TEE subsystem. I am using word hack-y, as most of the workaround
> >> involves:

Instead of hack-y workarounds, we should consider extending the TEE
subsystem as needed.

> >>
> >> - "diverging from the definition". For instance, ignoring the session
> >>   open and close ioctl calls or use file descriptors for all remote
> >> resources (as, fd is the closet to capability) which undermines the
> >> isolation provided by the contexts,
> >>
> >> - "overloading the variables". For instance, passing object ID as file
> >>   descriptors in a place of session ID, or

struct qcom_tee_object_invoke_arg and struct tee_ioctl_invoke_arg are
quite similar, there are only a few more fields in the latter and we
are missing a TEE_IOCTL_PARAM_ATTR_TYPE_OBJECT. Does it make sense to
have a direction on objects?

> >>
> >> - "bypass TEE subsystem". For instance, extensively rely on meta
> >>   parameters or push everything (e.g. kernel services) to the back-end
> >> driver, which means leaving almost all TEE subsystem unused.

The TEE subsystem is largely "bypassed" by all backend drivers, with
the exception of some SHM handling.

I'm sure the TEE subsystem can be extended to handle the "common" part
of SHM handling needed by QTEE.

> >>
> >> We cannot take the full benefits of TEE subsystem and may need to
> >> implement most of the requirements in the back-end driver. Also, as
> >> discussed above, the UAPI is not suitable for capability-based use cas=
es.
> >> We proposed a new set of ioctl calls for SMC-Invoke driver.
> >>
> >> In this series we posted three patches. We implemented a transport
> >> driver that provides qcom_tee_object. Any object on secure side is
> >> represented with an instance of qcom_tee_object and any struct exposed
> >> to TEE should embed an instance of qcom_tee_object. Any, support for n=
ew
> >> services, e.g. memory object, RPMB, userspace clients or supplicants a=
re
> >> implemented independently from the driver.
> >>
> >> We have a simple memory object and a user driver that uses
> >> qcom_tee_object.
> >
> > Could you please point out any user for the uAPI? I'd like to understan=
d
> > how does it from from the userspace point of view.
>
> Sure :), I'll write up a test patch and send it in next series.
>
> Summary.
>
> TEE framework provides some nice facilities, including:
>   - uapi and ioctl interface,
>   - marshaling parameters and context management,
>   - memory mapping and sharing, and
>   - TEE bus and TA drivers.
>
> For, MinkIPC, we will not use any of them. The only usable piece, is uapi
> interface which is not suitable for MinkIPC, as discussed above.

I hope that we can change that.  :-)
For instance, extending the TEE subsystem with the memory-sharing QTEE
needs could be useful for other TEE drivers.

Cheers,
Jens


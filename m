Return-Path: <linux-arm-msm+bounces-32805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716D98AC47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 20:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32871F236CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 18:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5BC14A627;
	Mon, 30 Sep 2024 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="Zw91s4Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B1198850
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721862; cv=none; b=DkBplN+ne5IfLa+kR9vA78uadUMxbpD4LZF+LNlI7duJ62bn6h8eMzFJC5v4AJaUnU+0L9Ec548k8YXPLI5+JuyMwVOYi3Rx7w4Rj5gtDO1SU3gM/rdJkXszFWXRS5JClXc/MBaV2meIU8al0P1x5VFI+mLA/LpzwmSyJBCtN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721862; c=relaxed/simple;
	bh=Jpl4jI+JpRyg9NOOut78/nE/+eMWUZn6/0PAUHcWDCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSeCz0aj68o4X0adQVwW4M2IRtg4WanBkKK72Hxpy7H0JpH4ngk9x8P0tVwkGaonN7A7nKlxGK+2+u43SCm7Iign8snjzb8PIt8qszgyJ4jWEVN+wJIv2ER+OFKdLcmZyPcq2k4prg/LUqyS1VgDn+FvKbDwrCwIhZXA2DDcgbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=Zw91s4Y4; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UGaWeO006434;
	Mon, 30 Sep 2024 18:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=h8WTTHLDO6+nZTqOz8F9jwtmqZJCxUS15PL07amh7DQ=; b=Zw91s4Y4zmQk
	ZhG6/HL/pWXyscCSQtlOgb+ZTLfdlhb31K5j8287Bf0l3CtLuQ9Pti0hf5BRxzvk
	Es57zX6w7v9GoL8T+VD1O3YBilWcDpsloU3hOMN8/A+9E+6gkOHRQya0WtR30olv
	svBNbR1mArO2tdbxyzkC/11MlnlW1U1OPJsmJZ6Z2pWGmfUGu2kaHCyzsN0jqOeL
	iY4W41Spb274Hu8ZvtG4KHv95qnLqgFpva/MRGNk8/AakBiEYJq2NnRonu/3k3pl
	qFjgCcfh9t+/6uVyD5EUiUBsN3BhBy7x7TW/uyZfnKNE4cmGUr+Px4B3ilFoZUhD
	wmfBQ83dkw==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 41xxbn3f51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 18:43:53 +0000 (GMT)
Received: from ilclmmrp02.lenovo.com (unknown [100.65.83.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4XHVMr0YPpzYkjQw;
	Mon, 30 Sep 2024 18:43:52 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp02.lenovo.com (Postfix) with ESMTPSA id 4XHVMr504dz3npb3;
	Mon, 30 Sep 2024 18:43:52 +0000 (UTC)
Date: Mon, 30 Sep 2024 13:43:51 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Maxwell Bland <mbland@motorola.com>,
        Neill Kapron <nkapron@google.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andrew Wheeler <awheeler@motorola.com>,
        Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>,
        Viktor Martensson <vmartensson@google.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel-team <kernel-team@android.com>, adelva@google.com,
        jeffv@google.com
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <gbaorjakcdaxngzlrfbij5tvrqembwmfwctvkax7wpdjbkzbvr@n4shfyvwkvqy>
References: <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
 <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
 <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
 <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
 <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>
 <ZvqJ7rAc_pRUdW3b@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvqJ7rAc_pRUdW3b@google.com>
X-Proofpoint-ORIG-GUID: 5JZ06UtFGl9JaO5S-ur_kuSZti6jtqec
X-Proofpoint-GUID: 5JZ06UtFGl9JaO5S-ur_kuSZti6jtqec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409300135

On Mon, Sep 30, 2024 at 11:22:22AM GMT, Sebastian Ene wrote:
> On Wed, Sep 25, 2024 at 12:53:11PM -0700, 'Maciej Żenczykowski' via kernel-team wrote:
> > On Wed, Sep 25, 2024 at 12:52 PM Maciej Żenczykowski <maze@google.com> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 11:16 AM Andy Lutomirski <luto@amacapital.net> wrote:
> > > >
> > > > On Tue, Sep 17, 2024 at 8:08 AM Maxwell Bland <mbland@motorola.com> wrote:
> > > > >
> > > > > On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> > > > > > On Fri, Sep 13, 2024 at 10:30 AM Maxwell Bland <mbland@motorola.com> wrote:
> > > > > > > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> > > > > > >
> > > > > > > But don't let me distract from the issue, which is that
> > > > > > > cBPF/eBPF/however these filters get allocated to machine code,
> > > > > > > bpf_int_jit_compile ends up getting called and a new
> > > > > > > privileged-executable page gets allocated without compile-time
> > > > > > > provenance (at least, without reverse engineering) for where that code
> > > > > > > came from.
> > > > > >
> > > > > > But what if there was a mechanism to *cryptographically hash* a BPF
> > > > > > program as part of the loading process?  Then that hash could be
> > > > > > looked up in a list, and a decision could be made based on the result?
> > > > > >  Would this help solve any problems?
> > > > >
> > > > > The issue I have seen in the prior Qualys linked exploit from my initial
> > > > > message and from talks by security researchers elsewhere, for example
> > > > > Google Project Zero's recent "Analyzing a Modern In-the-wild Android
> > > > > Exploit" by Seth Jenkins, is that people have the ability to target
> > > > > these pages during the window between the page being allocated as
> > > > > writable by vmalloc.c and the update to the PTE which makes it
> > > > > executable, so a signature does help (creates the requirement of more
> > > > > than one write to commit "forgery"), but doesn't totally 100% solve the
> > > > > problem.
> > > > >
> > > > > Right now, every time I open up chrome on our latest flagship the
> > > > > browsers sandbox filters trigger my EL2 monitor because they are
> > > > > attempting to follow the standard W^X protocol. If I were to build one
> > > > > of these exploits, I'd:
> > > > >
> > > > > (1) find out a non-crashing leak for code page and data values
> > > > > (2) determine from vmalloc's rb-tree where the next one-page allocation
> > > > >     is likely to occur
> > > > > (3) prime my write gadget for an offset into that page
> > > > > (4) spin up chrome in a second thread
> > > > > (5) attempt to trigger a write (or two) at the right precise time using
> > > > >     prior empirical measurement or my read gadget for kernel mem
> > > > >
> > > > > Which is messy, but people have been known to do more given good enough
> > > > > stakes. Hell, I spent a few months working on something similar for
> > > > > airplane communication management units.
> > > >
> > > > My vague proposal for a "better JIT API" (which you quoted below)
> > > > explicitly and completely solves this problem:
> > > >
> > > > >
> > > > > > So what would a good solution look like?  It seem to me that the
> > > > > > program being supervised (a userspace or kernel JIT) could generate
> > > > > > some kind of data structure along these lines:
> > > > > >
> > > > > > - machine code to be materialized
> > > > > >
> > > > > > - address and length at which to materialize it (probably
> > > > > > page-aligned, but maybe not)
> > > > > >
> > > > > > - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> > > > > > sure this is useful
> > > > > >
> > > > > > - a "justification" for the code.  This could be something like "Hey,
> > > > > > this is JITted from cBPF for seccomp, and here's the cBPF".
> > > >
> > > > Even ignoring the origin and justification parts, there's no WX window
> > > > in here.  The code is generated, then it's shipped off to the
> > > > hypervisor/supervisor, and *exactly that code* is materialized !W, X.
> > > >
> > > > Of course, this still leaves verification to be handled.
> > > >
> > > > > Returning to the idea of origins, at the end of the work day yesterday I
> > > > > queried Maciej to "have Android choose one compiler for seccomp policies
> > > > > to BPF and stick with it", because if I knew filters were chosen by
> > > > > libminijail or some other userspace system, I could pretty easily figure
> > > > > out what EL2 needs to expect at runtime. An "origin" field would be
> > > > > equally as effective, and retain flexibility.
> > > >
> > > > At the risk of a silly suggestion, what if the entire JIT compiler and
> > > > verifier (or a sufficient portion) were, itself, a WASM (or similar)
> > > > program, signed or whatever, and shipped off to the hypervisor?  The
> > > > hypervisor could run it (in whatever sandbox it likes -- hypervisors
> > > > are capable of spawning a separate VM to host it if needed), and only
> > > > then accept the output.
> > > >
> > > > I, personally, think that this is of extremely dubious value unless
> > > > it's paired with a control flow integrity system.  But maybe it could
> > > > be!  Something like x86 IBT would be a start, and FineIBT would be
> > > > better, as would an ARM equivalent.
> > > >
> > > > --Andy
> > >
> 
> Hi,
> 
> In response to your previous message (this is Seb from pKVM team):
> 
> 
> > > I've heard rumours (probably read some LWN article perhaps
> > > https://lwn.net/Articles/836693/ ) that protected kvm for Android has
> > > some mechanism to start the kernel in some higher priv level (EL2?),
> > > then move most of it to EL1 while keeping a protected VPN shim in EL2.
> > 
> > s/VPN/KVM/
> 
> Yes we do initialize the pKVM hypervisor at EL2 fairly early at
> device_initcall_sync (initcall 5) before we depriviledge the rest of the
> kernel at EL1.
> 

Implementing code page integrity checks in pKVM as a reference spec for all the
other EL2 developers and the kernel to "do the right thing" for
hypervisor-based exploit prevention and kernel integrity checking would be a
major success for ARM/Google. I am hoping I can get Moto to release our code.
                                                                             
> >                                                                          
> > >                                                                        
> > > Perhaps the answer is to leave the bpf verifier + jit compiler in EL2? 
> >                                                                          
>                                                                            
> What are the gains to move this at EL2 ? I am a bit late to this party.    
> We don't have any init at that stage because it is too early. We do        
> support some EL2 vendor modules loading from a ramdisk but this is a       
> different story.                                                           
>                                                                            
                                                                             
I see moving the full JIT/verifier into EL2 as problematic because of increased
threat surface. We've seen many project zero originated and third-party
exploits targeting EL2 SMC interfaces on Android: *cough* a certain
galactic-themed phone manufacturer's claims to have a system protecting these
code pages, who never seemed to mention the complications seccomp creates, let
alone the impossibility of filtering page table updates on snapdragon chipsets
without reworking vmalloc infrastructure in what must be a GPL-2.0 compliant
interface they never made open source, had serious SMC-call based CVEs in the
past *cough* https://project-zero.issues.chromium.org/issues/42452502 *cough*

From empirical evidence of implementing hypervisor-enforced code/data
integrity, the only runtime interface needed for protecting everything but
dynamically modifiable data structures (e.g. kworker queues) on Android is the
standard EL2 page-level permission fault handler.

---

I hope it was clear from my base PoC code that to ensure the filter is a "pure
function" it is enough to reproduce the memory access semantics and protections
introduced by BPF's verifier.c with additional limited scope. This at least
practically ensures something using the mechanism of CVE-2021-33909 (_on
Android in particular, generic linux is another ballpark_) cannot transform the
seccomp code page into something breaking verifier.c's semantics. Though it may
break the intended seccomp policy itself, I think that level of checking can be
added on as an additional layer once this basic exploit is resolved.

This in mind, as of last week, I've gone ahead and gotten my earlier, buggy PoC
for an EL2-level seccomp verifier (in another earlier email in this chain)
running on a real device. After I fixed some other bugs (they are pretty
obvious once you look through the PoC code), I discovered empirically a QCOM
hardware abstraction layer (HAL) service has a filter program that uses the
stack (uses a store instruction to BPF_REGS_FP), so my initial hope of
"banning" stores to memory outright *did* end up a no-go for one empirical
case. The clear solution seems to be to relax the restrictions the smallest
amount possible: check that stores in the program are in the predefined stack
memory scratch area.

Thankfully, BPF_REGS_FP is read-only. And I totally understand and support the
possibility that a filter program can load/store from its well-defined stack
space as a scratch area. Additionally, bpf_check_classic and the existence of

        BUILD_BUG_ON(BPF_MEMWORDS * sizeof(u32) > MAX_BPF_STACK);

Seems to communicate to me that the intentions here are that the BPF_STX
allowed by seccomp's verifier is limited to the defined stack space relative to
FP. My gut says check_load_and_stores and bpf_check_classic are not technically
as strict as they should be for the intentions of SECCOMP, but just happen to
work. I'd expect to see some code that just says "every store must index memory
from a well-defined offset from the read-only FP", but I don't quite see that,
unless I missed it (I think something to do with how fp->k is decided for
struct sock_filter in the classic verfier), despite there being indications
this was the intention elsewhere.

But maybe I am incorrect to assume the stack is the theoretical limit on what
can be the destination register for a seccomp filter store instruction for now
(and into the future)? If not, why? Is there an explicit exception I can make
in an EL2 verifier for filter programs that do not abide by these rules?

For now, based on what I am seeing in the kernel, I think it may be fine to
assume BPF_MEMWORDS associated with the stack is the theoretical limit on which
memory should be store-able, and "hope" that all associated instructions are
FP-relative.  If not, the alias register should be readily resolvable back to
FP, though having a formal contract that it would be FP-relative in the
kernel's JIT for cBPF would be awesome.

Regards,
Maxwell Bland



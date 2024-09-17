Return-Path: <linux-arm-msm+bounces-31923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3897B1DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208E01F22F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3292317BEC1;
	Tue, 17 Sep 2024 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="x2i6UrAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2DF17B4ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585745; cv=none; b=XG7sbYNQmpZaLh58nhX1MHXvaFkPB8VCpiCQ+SprkINm03TWyhYfbdOIb0nhOq9EwVl1oy4j/xK3UR9lSwdMpdPkvR7x5I+WSTQyzo2t36RUy3agVPHDAS4GjKmkJDIZ4hKtzOFqf1KujXr2+cRLx32+I/nC3zV2JbHXd573I+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585745; c=relaxed/simple;
	bh=K9CbZOlIFbHyfe/riYAica4L2F1hj/I8GaXmKv667co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNiynlI99TqhF2f+SU7OUwCchfc3vXr98cz/U+6u2bRaTo8w3PSKQcPVqvsH1oX2/x30lxsI+PbQ404qCAKOhFbkwL1jS4AfHi4XDvb4Fnrf1ofyqbkoE6lEs4Uw8SRlNOsXTHx8OMcAXUF9MRwkLf08gzHOc1JmGFIROI8UiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=x2i6UrAg; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H6nWn7001740;
	Tue, 17 Sep 2024 15:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=YS1J4M61DrVE3txwhgQHPlqlLP1tUpFy0HDv3atDPF8=; b=x2i6UrAg5wW5
	E6qI2oK6vMUlg4uqwG70jNL2zyx4eh2of20rEPwVLmzL0AkdH1AS3tvjWYz50Ret
	JZEshyvWCrYRX3qrTXQnvGTPlXHl+IemVBdzoJ6ds2QzO//l6NJ+GcW5rpJA7lNg
	1CfUGsEk9wLfrBnICi5z5glPLpG53EVEpjlbEhfxZ42akgseJxxsB/kKNHuwdQ6l
	vOvopb3PoYz7mBrpWj7F4v8EeNiS1VNdm5MozQohn67mCx4pat4yxvdl9+uL4gJu
	8HcvFdO2eJ3FrhWsZ07tWdzq5cpFiBtmSveWuaoajxuFmYDnA6AwwOqAZAhhajnb
	liC45QQr9A==
Received: from va32lpfpp03.lenovo.com ([104.232.228.23])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 41nq1nby43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 15:08:49 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4X7QCj3qvLz51Q9v;
	Tue, 17 Sep 2024 15:08:49 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4X7QCj0VNwz2VZ16;
	Tue, 17 Sep 2024 15:08:49 +0000 (UTC)
Date: Tue, 17 Sep 2024 10:08:47 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
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
Message-ID: <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
X-Proofpoint-GUID: l6g4YSisx27Py9ogYr8ue5KapC2OUCx1
X-Proofpoint-ORIG-GUID: l6g4YSisx27Py9ogYr8ue5KapC2OUCx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170108

On Fri, Sep 13, 2024 at 09:18:58PM GMT, Andy Lutomirski wrote:
> On Fri, Sep 13, 2024 at 10:30 AM Maxwell Bland <mbland@motorola.com> wrote:
> > On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> >
> > But don't let me distract from the issue, which is that
> > cBPF/eBPF/however these filters get allocated to machine code,
> > bpf_int_jit_compile ends up getting called and a new
> > privileged-executable page gets allocated without compile-time
> > provenance (at least, without reverse engineering) for where that code
> > came from.
> 
> But what if there was a mechanism to *cryptographically hash* a BPF
> program as part of the loading process?  Then that hash could be
> looked up in a list, and a decision could be made based on the result?
>  Would this help solve any problems?

The issue I have seen in the prior Qualys linked exploit from my initial
message and from talks by security researchers elsewhere, for example
Google Project Zero's recent "Analyzing a Modern In-the-wild Android
Exploit" by Seth Jenkins, is that people have the ability to target
these pages during the window between the page being allocated as
writable by vmalloc.c and the update to the PTE which makes it
executable, so a signature does help (creates the requirement of more
than one write to commit "forgery"), but doesn't totally 100% solve the
problem.

Right now, every time I open up chrome on our latest flagship the
browsers sandbox filters trigger my EL2 monitor because they are
attempting to follow the standard W^X protocol. If I were to build one
of these exploits, I'd:

(1) find out a non-crashing leak for code page and data values
(2) determine from vmalloc's rb-tree where the next one-page allocation
    is likely to occur
(3) prime my write gadget for an offset into that page
(4) spin up chrome in a second thread
(5) attempt to trigger a write (or two) at the right precise time using
    prior empirical measurement or my read gadget for kernel mem

Which is messy, but people have been known to do more given good enough
stakes. Hell, I spent a few months working on something similar for
airplane communication management units.

> So what would a good solution look like?  It seem to me that the
> program being supervised (a userspace or kernel JIT) could generate
> some kind of data structure along these lines:
> 
> - machine code to be materialized
> 
> - address and length at which to materialize it (probably
> page-aligned, but maybe not)
> 
> - an "origin" of this code (perhaps a file handle?) -- I'm not 100%
> sure this is useful
> 
> - a "justification" for the code.  This could be something like "Hey,
> this is JITted from cBPF for seccomp, and here's the cBPF".
> 
> Or there could be a more indirect variant:
> 
> - source to be JITed (cBPF, WASM, eBPF, whatever)
> 
> - enough relocation info for the supervisor to JIT it appropriately
> 
> - address to materialize the code at, along with maximum size
> 
> and the supervisor JITs it and materializes it.
> 
> I could imagine this being used for userspace and for hypervisor-based
> kernel integrity.  Does it do what's needed here if there was a
> hypercall kind of like this?
>
"Origin" to me seems like the most significant part, as it should be
possible for engineers to hack in the rest based upon the implicit
contract provided by the software that is trying to compile the program.

Expanding on the other points, right now, I'm trying to see if it is
possible to orient EL2 so that there is little to no standard "runtime"
interface to the security monitor, as Samsung historically had issues
with respect to these routes leading to exploits because the engineers
(like me) were not super skilled. That is, pushing the verification
effort to EL2 will be more dangerous, since EL2's code now has the
possibility for error in the JIT which has an out-of-bounds write.

Returning to the idea of origins, at the end of the work day yesterday I
queried Maciej to "have Android choose one compiler for seccomp policies
to BPF and stick with it", because if I knew filters were chosen by
libminijail or some other userspace system, I could pretty easily figure
out what EL2 needs to expect at runtime. An "origin" field would be
equally as effective, and retain flexibility.

Here's what I have now that is actually enough to lock down most of everything
except the seccomp filters and dynamic datastructures (kworker, e.g.
call_usermode_exec_helper, queues will be the motivating example at that
point):

case MARK_RANGE_RO: /* Set the RO bit on a stage-2 PTE/PMD range */
case ADD_JUMP_ENTRY_LOOKUP: /* Add in exceptions for static_keys */
case LOCK: /* Prevent any further SMC calls outside of *_TUPLE */
case SPLIT_BLOCK: /* Demote (PMD) hugepage to PTEs */
case REGISTER_AMEM: /* Preserve region of physical mem for just EL2 */

Maxwell


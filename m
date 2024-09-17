Return-Path: <linux-arm-msm+bounces-31925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619097B201
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 17:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6571C24704
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABD21CE6E7;
	Tue, 17 Sep 2024 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="uLkt/Azi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9876C1CDFDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726586318; cv=none; b=t2JnMTaOM+Eb2bB89khlbwfo0Qhp992LBTsfASH0DakVQkXNFxmizdNaOuQobpHXHjBLZGHMNIKZMfHV+V6pjf2+HDwiASnk2eIfx8apm7H9zgkJBmT7SFwpCS1xHaNnOS0uZS+mOLAHj1RevIxZ7WWy/R8rq6QWLcpi2JvPqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726586318; c=relaxed/simple;
	bh=0OqSLERFxVcXKizcsEYDTN1/NTZ7HEdmewtOSQT0tQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boVQfIEB+twX7IIawRrKYOOA162ihVtwEYQwShNz1sqnmKyj6onL4LETcxPFwHiDGh1Jhp2T4hHKFiYhnDacrZ68qyqfudUM+rSIBAjP8hKanqduq28I9WxZqjYi94qJMNfq7On8OjZoJLm3VT7z2zkjllKereQhg6WCzHFq94Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=uLkt/Azi; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H7sEkW019576;
	Tue, 17 Sep 2024 15:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=mlVGIrqy64Dc9eUSBnKjtZmzWncJaw1NjMKPONvPhT8=; b=uLkt/Azi2B5T
	0NWE+4MAkIPgnfAA0eNTX3nhWH1WVhB+ck9xMdfdaM4LPhUb41u7kuHNiBY52+Mr
	Y9ptX/5el7Zh4sQIFzpqz1D4Uroe0KquH4cl66A+tKy1I+n89CSmzqk89vi9hk9l
	iMSqz5eDvt+zQ77t3JMhNzHQVPocJUT6H11XZ26a2RQhQH46pFLSX0CaTmT1LB1q
	M2MxeY4QpWX4fw2rlrjq5zPgoJncRpjBE+iTPf75VAuHhuYv1UyxloeoG8Qx1NIR
	1XHeTcxbxnHJ1AP2zFybUJfPzVpQVZNun5fOE3S0XK1jlvBQMd0Dh616A/xSxVJF
	h9Pq7VUg/A==
Received: from iadlppfpol1.lenovo.com ([104.232.228.80])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 41ns0fkupu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 15:15:10 +0000 (GMT)
Received: from ilclmmrp01.lenovo.com (unknown [100.65.83.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol1.lenovo.com (Postfix) with ESMTPS id 4X7QLz2TvFz8fgF6;
	Tue, 17 Sep 2024 15:15:07 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4X7QLy3368z3nd8C;
	Tue, 17 Sep 2024 15:15:06 +0000 (UTC)
Date: Tue, 17 Sep 2024 10:15:05 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Neill Kapron <nkapron@google.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andrew Wheeler <awheeler@motorola.com>,
        Sammy BS2 Que | =?utf-8?B?6ZiZ5paM55Sf?= <quebs2@motorola.com>,
        Todd Kjos <tkjos@google.com>,
        Viktor Martensson <vmartensson@google.com>,
        Andy Lutomirski <luto@amacapital.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel-team <kernel-team@android.com>,
        "adelva@google.com" <adelva@google.com>,
        "jeffv@google.com" <jeffv@google.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <viztnjhxjfc5asyzpxlbsjgkno7jmgs3so7xf4q4y633nncjz3@kp27s5ktxydk>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <CANP3RGfwL1OigoSkhmnRFDy=y+sstabiRAREPxEbEiEfuDaweQ@mail.gmail.com>
 <rlgx2zq3s6vs6t26fut3ez6bix5jphvofyuw2amnbdpyb6c55m@kxzqput2rry5>
 <CANP3RGf_WoEOCgJ=X_nVBDYuwDty0BDiCSZQxONLX-dVbd2-UQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGf_WoEOCgJ=X_nVBDYuwDty0BDiCSZQxONLX-dVbd2-UQ@mail.gmail.com>
X-Proofpoint-GUID: Bf-bPnnNI6Pe4_IxKzC_r7PK1QG85c5H
X-Proofpoint-ORIG-GUID: Bf-bPnnNI6Pe4_IxKzC_r7PK1QG85c5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 mlxlogscore=917 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409170109

On Mon, Sep 16, 2024 at 03:50:04PM GMT, Maciej Żenczykowski wrote:
> On Mon, Sep 16, 2024 at 3:18 PM Maxwell Bland <mbland@motorola.com> wrote:
> >
> > #define MODIFY_KERNEL_CODE                                                     \
> >         do {                                                                   \
> >                 fake_je = (struct jump_entry *)kallsyms_lookup_name_ind(       \
> >                         "spectre_bhb_state");                                  \
> >                 attack_addr = kallsyms_lookup_name_ind("udp_recvmsg");         \
> >                 if (register_kprobe(&kp2)) {                                   \
> >                         return -1;                                             \
> >                 }                                                              \
> >                 arch_jump_label_transform =                                    \
> >                         (arch_jump_label_transform_t)kp2.addr;                 \
> >                 fake_je->code = attack_addr - (unsigned long)&(fake_je->code); \
> >                 fake_je->target = stext - (unsigned long)&(fake_je->target);   \
> >                 arch_jump_label_transform(fake_je, JUMP_LABEL_JMP);            \
> >                 return 0;                                                      \
> >         } while (0)
> 
> That's not valid cBPF

It is not intended to be: see the Qualys exploit from my original
message. People are not loading bad BPF, they are targeting BPF code
pages for modification during the window between JIT and execution,
using a write-gadget exploit, e.g. UAF + Heap Spray.

Also, I read through and responded to Andy's message on this thread just
now. Andy had the really good idea of rather than Android saying "use
this seccomp->BPF compiler", the code page or BPF program comes with an
"origin" tag, that is, something saying "this was generated by
libminijail" or "bionic libc". That would work just as well supposing
that if I were to see a tag for something I did not know (likely one of
these QCOM services), I could email someone at QCOM to get the compiler
spec, hopefully.


Return-Path: <linux-arm-msm+bounces-31769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FE9786CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 19:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BBE31F22CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 17:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D7A82D70;
	Fri, 13 Sep 2024 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="WvwJNz4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D498289E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726248643; cv=none; b=OYivhQafhkM0DYVTd625jj8ir5Hcc/EHX5o544E3UPoVmoxHuw6GK56V0kl63sJyS1V9Ca44rfOdfOEopRSNHbiq+Ykd34jtTUqYErb1CiLModVJdtIzrcHuGCuswAIgw4NRpxDEuVCmSFYy0Yg3fj6yPThV20GIzreElFaD1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726248643; c=relaxed/simple;
	bh=d1Y5c/DmQSX02aH/1kqpBXR43u4Fp5dQDfMNCzwRav8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLtyy5LADZOlRlBpiYwzK7Dxw1tFvdIQ/MZ5tCFHPbrovLSRj8PoY86vBmuhaHrTtB8ipaDol/0QnWy5qH1jkjAEX5YNKYJguhXdC3zJi+OX698PLWYc5seRNm+9HWPe68yXJM/9vPuu0AX11z0esfeNi8iaWY//4Kb3YaZaqLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=WvwJNz4d; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DBCsIl006035;
	Fri, 13 Sep 2024 17:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=XSKuDrjhDFtl88kbJhUayeT
	L5U/0c1xDN3LlmUhbeN8=; b=WvwJNz4dSp/dhSTDrwFn+IfsaeKTsv8VD/muNB+
	guYWZZgl1tFKAdyW9h4MIOFRs19eQEJwEDPMPh1mpoC/hIX3a/ESPVLK4wnfdlQQ
	8a56nCVwVOYhEjVRdLg5TpqNagnvfLmHs+tVAPRUuuc0p9vIW7nlsweTvSD1U4YZ
	oVunb83bYbwkA4n2QikBkgRGmP/TcoikalM80wha5mc8UcSej/ZgKjlZPEgdxHgD
	IDhjGB8WGyVGb2Pl3BaqbCqrO/112pSUX6pZ4HAzizqNpW+cC/n9Qvp0auTKnbZC
	B99n+LmoHFvoF8rQyLq0A2s7roFYwiFBqHPhHvBZbtDk/eQ==
Received: from va32lpfpp03.lenovo.com ([104.232.228.23])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 41h3pg6e72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 17:30:31 +0000 (GMT)
Received: from ilclmmrp02.lenovo.com (ilclmmrp02.mot.com [100.65.83.26])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4X51Y259kbz51Q9y;
	Fri, 13 Sep 2024 17:30:30 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp02.lenovo.com (Postfix) with ESMTPSA id 4X51Y23Sjwz3npb3;
	Fri, 13 Sep 2024 17:30:30 +0000 (UTC)
Date: Fri, 13 Sep 2024 12:30:29 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Neill Kapron <nkapron@google.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Andrew Wheeler <awheeler@motorola.com>,
        Sammy BS2 Que <quebs2@motorola.com>, Todd Kjos <tkjos@google.com>,
        Viktor Martensson <vmartensson@google.com>,
        Andy Lutomirski <luto@amacapital.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel-team <kernel-team@android.com>, adelva@google.com,
        jeffv@google.com
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
 <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
 <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
X-Proofpoint-GUID: VriVTwwdimu6eXGG14-yJxLRA6QcFpLs
X-Proofpoint-ORIG-GUID: VriVTwwdimu6eXGG14-yJxLRA6QcFpLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130125

On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:

> These programs will not print out using PTRACE and are difficult to audit
> without patching the seccomp calls yourself because the ptrace call to
> PTRACE_SECCOMP_GET_FILTER will fail. I believe (have not checked) because they
> are not cBPF, and seccomp's logic makes prog->fprog evaluates to null despite
> prog existing if it is cBPF, at least on Android 14. I spent a whole day
> getting frustrated with the failing ptrace call before finally ending up my
> patches (attached to the end) that instrument ptrace and can print the
> programs.

LOL, this paragraph is a mess, apologies: I'm referencing the failure of
get_seccomp_filter in seccomp.c here:

fprog = filter->prog->orig_prog;
if (!fprog) {
	/* This must be a new non-cBPF filter, since we save
	 * every cBPF filter's orig_prog above when
	 * CONFIG_CHECKPOINT_RESTORE is enabled.
	 */
	ret = -EMEDIUMTYPE;
	goto out;
}

Though CONFIG_CHECKPOINT_RESTORE is not set on Android 14, so I think
the ptrace probably failed for all sorts of reasons unrelated to cBPF.

But don't let me distract from the issue, which is that
cBPF/eBPF/however these filters get allocated to machine code,
bpf_int_jit_compile ends up getting called and a new
privileged-executable page gets allocated without compile-time
provenance (at least, without reverse engineering) for where that code
came from.

But I think instrumentation of the BPF JIT compiler (which I will work
on next) should fix that.


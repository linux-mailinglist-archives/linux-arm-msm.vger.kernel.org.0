Return-Path: <linux-arm-msm+bounces-32899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA398C381
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 18:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76791F2249C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D471C9EB3;
	Tue,  1 Oct 2024 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="4rYT+MnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D31C9DCD
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727800498; cv=none; b=QT00+9eoacQoblYlkmbHSaRlQDJY6+tbFmmV+iztzOC35iV1avr488UeCTPO+LilJs992tl5iPu+KqKvt93S5C/BSC+dqKUOBZ36DSHTJpcCHN2scASp5FTDc8vc+sHmVyEuUxfTZnXP7IpNiEhujI+DlZ4L4Lm7ZgjNyBLUYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727800498; c=relaxed/simple;
	bh=PZr9TB6wEHDeuv3q3ZTsF+qrD9VnGsKjGNQSiXAjlSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ckpv9DKv5x4a654U72fEcHLWNjW3hC/h/IFl2zfaGapV2qhQ9r5HaJSmijiwbtEKZlg/p2uWeDvLjwd+UVqA+z4hTgYZCOsPSQLHgojiN0IVCXQzy2Kqv0MaJ5xKXPOTUMrl938jPlti5rovUx56eZMsElyOGYG5AU1gerzyleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=4rYT+MnW; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491FPcVQ012903;
	Tue, 1 Oct 2024 16:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=NE5Ma6xw2MMNNjh3fp9pGsYDyaViwSh9snTM0GeO+5g=; b=4rYT+MnWLH+T
	XZrg+ZkQ6nlAR1eN/ulDvC5X0wpDtCYNIi8/yWm/DfLWSja3CWraTXFmhKogYqg6
	bX35YB5/uGOiSW7vTzyqG8ytSA3k+kAQbfaE2drSZJGw3O0jRnZlQwO+E65IXK7d
	SKv7GfScyBQq+Ywo27heKcU2icqV2aRE01v8wbCRx3aA360AJre+sC7+wsliZrRB
	wWpqkhHNnq9nr0mCSV66MPHylXdI+YuD1MgxCyP9DsfNb0ptR+AsTpHCdEGmUOht
	cXDt+10osGzDbjRZLHxFaDxPblAkAqGCv4HiO0TGZB+eDKf70d1D1smzq7hmlHSC
	TEkiM3HTJQ==
Received: from va32lpfpp03.lenovo.com ([104.232.228.23])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 41y0afw427-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 16:34:34 +0000 (GMT)
Received: from ilclmmrp01.lenovo.com (ilclmmrp01.mot.com [100.65.83.165])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4XJ3S90LtLz51Q9v;
	Tue,  1 Oct 2024 16:34:33 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4XJ3S85zW2z3nd8D;
	Tue,  1 Oct 2024 16:34:32 +0000 (UTC)
Date: Tue, 1 Oct 2024 11:34:31 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Sebastian Ene <sebastianene@google.com>,
        Andy Lutomirski <luto@amacapital.net>,
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
Message-ID: <rsk6wtj2ibtl5yygkxlwq3ibngtt5mwpnpjqsh6vz57lino6rs@rcohctmqugn3>
References: <TYZPR03MB67922FFDE5C9C925D8274677B4652@TYZPR03MB6792.apcprd03.prod.outlook.com>
 <3zxgxxa75znxfvoufhtg3wm2vamjthogyacoybiket5js3kquf@yldiyczms4ou>
 <CALCETrVVo9g=v8dXN_Z1pBPx_194Mcanxz9_CgYUjJ_138_4LQ@mail.gmail.com>
 <tazl5khrfdxifmosasadhexsmm73oolnooevkjwlncydqz4lvl@dxlis7ipxozj>
 <CALCETrW4OkWSc+QCsW-x2OyL0rzbw0-guiN3jNgcr6WfwDMhCA@mail.gmail.com>
 <CANP3RGcYSEd5h_2mV+EAB_ohCKe7zaf-82UotN40wq3K4V5OtQ@mail.gmail.com>
 <CANP3RGceK4sxfk7YP-petxY+dmpD+SVCM9Eb79Fc0u1EwFAVVw@mail.gmail.com>
 <ZvqJ7rAc_pRUdW3b@google.com>
 <CANP3RGcGrP3ppuC0FVAmKdWwbtnfPMu48mmDO=UfJi6C_XmS2Q@mail.gmail.com>
 <CANP3RGfBarmSZ7ixTUXz04jOH5=VMxTEFqTxec9UzLvhE+DcXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGfBarmSZ7ixTUXz04jOH5=VMxTEFqTxec9UzLvhE+DcXw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: OttxBn4AUyf9a_HpyQ24tzWwnscb-wff
X-Proofpoint-GUID: OttxBn4AUyf9a_HpyQ24tzWwnscb-wff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=830 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010106

On Mon, Sep 30, 2024 at 04:41:19PM GMT, Maciej Żenczykowski wrote:
> On Mon, Sep 30, 2024 at 4:35 PM Maciej Żenczykowski <maze@google.com> wrote:
> > I think the OP is trying to verify the 'sanctity' of EL1 code pages.
> > (ie. prove via signature that they're all legit, which is hard with jit)
> > Presumably he's doing this from EL2 (I seriously doubt he's in EL3).
> > There's been talk of
> > unjitting/rejitting/regenerating/peephole-verifying the BPF jitted
> > dynamically generated kernel executable pages - to verify they're
> > 'safe'.
> > Moving just the 'bpf verifier/jit' into EL2 would seem to solve that
> > particular problem.
> > Though of course that is a fair bit of code (though the only untrusted
> > input to it, post boot completion, is cBPF which is pretty small in
> > scope)...
> > Compromises of EL0/EL1 would no longer be able to write gadget over
> > the bpf jitted kernel executable page prior to them being marked -W+X.
> > I'm not certain how much of a win in safety this is though?
> > I guess it depends on how easy the bpf verifier/jitter is to audit.
> 
> Note: if the full blown bpf verifier/jitter is too hard to audit, you
> could potentially write a new EL2 jitter just for cBPF.  It could just
> be a trimmed down version of the generic eBPF jitter.  cBPF is much
> much simpler.

As of yesterday I confirmed a simple version of the above I was able to
whip up in 2-3 days works on Android 14. It operates at EL2 and passes
standard tests for camera, browsing, etc.. cBPF is, in fact, the saving
grace here! :-)

Cheers,
Maxwell Bland


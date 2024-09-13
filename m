Return-Path: <linux-arm-msm+bounces-31770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C89787B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 20:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65007B21F67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 18:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700D012C473;
	Fri, 13 Sep 2024 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="fni6zDjy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9A12C470
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251443; cv=none; b=tdKe+dVZ0jJCNiCS91FMrxdxWzG2UKF7JViclIWiUHj8EVT6JEvAUcFoH/c86xsfNKYaTj4LVXqPF+krRn9GIGzMRcMJtRhFR8KhOpMTDZkVcjQua30LVE0OsuXf+h3SVkcWluEYMjJzrLrLrRexIPxb+lcKOoIOoTArQG0H0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251443; c=relaxed/simple;
	bh=2sKHyM4ISFQ/O2qQF8mo5YC9SpUbnEjLfMB3UGpH+xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4jV2wSB8VirqklgM+9/KhM6JiteSL8vQIiYaM5qBAuSXm5DdppaC573ZVMfkY/F6NrPoItMqEXScxZ5vYPdgW4prbp0Waw+cCpxwaAPMyYVqyu+zV1VqQzqmjbzqNOWkPR4IvC6TAc3WCgDtCTDHDzMmifUN4nMTQhQin1kRko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=fni6zDjy; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DBMUOg030067;
	Fri, 13 Sep 2024 18:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=EaVW6zOap4UAs145RMbgOeV
	rkQoVIyyvtI3tcf3x3Jw=; b=fni6zDjyEf2sWZ9D8GdbWn1yA+SCfCWCa8Te1p8
	AZPZXByAJk5FATHacYPAM25ELmOOceV1HPPUKef5UKxGh5Ld8D+Y4JW4mooI6A3J
	L5admAncVZ5/fLo0bj1USrvDFGrZsyTEj/BUegnl0rsfNEHVAnsq58u5fXoQ+ArG
	ekVfhFxrEhucvifxyZEyw9LADdTF1FfBNsYxilddyw2cwpJCEVjiIz2XQzKR1Tpu
	VGL9k8mzksCwTa4VyiNWHhkji5A8P6Fknoee10e6tqkE8ahikhP8MOTGcA5sfizV
	L0xcuOV30uIr3YUFYEINC30ZLTFpe3anoNVKF09R3sSBoFw==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 41h3cm6g24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 18:17:10 +0000 (GMT)
Received: from va32lmmrp02.lenovo.com (unknown [10.62.176.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4X52Zs3DkgzYkjQx;
	Fri, 13 Sep 2024 18:17:09 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp02.lenovo.com (Postfix) with ESMTPSA id 4X52Zs4Y2Mz2VZ3r;
	Fri, 13 Sep 2024 18:17:09 +0000 (UTC)
Date: Fri, 13 Sep 2024 13:17:08 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        Neill Kapron <nkapron@google.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
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
Message-ID: <nvzmjbpb3igw2rfezawkm6y6epw5hfdwwrp7g5xxlxp62463ho@pis2edi3rdiw>
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
X-Proofpoint-ORIG-GUID: m4fXsUPXMGSFuU9qJHe3J-r2js-M2YV0
X-Proofpoint-GUID: m4fXsUPXMGSFuU9qJHe3J-r2js-M2YV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130130

On Fri, Sep 13, 2024 at 05:07:46PM GMT, Maxwell Bland wrote:
> make a standard framework for EL2-based kernel protection open source, then we
> have a counter of the 29,000ish writable datastructures,and well defined
> mechanisms for preventing malicious modification via write gadgets

Ugh, this is a complicated issue and I wrote this email quickly, let me
clarify, apologies:

1 I am worried about write gadgets (e.g. UAF + heap spray)
2 _Some_ modern exploits use write gadgets to modify read-only data
  (e.g. code pages), most target dynamic data, such as device struct
  pointers and kworker queues.
3 I'm working to build an open-source system that will reduce the ARM64
  kernel's threat surface for write gadgets to the _just_ those targeting
  dynamic data.
4 After that point, there is still the issue of developing a
  verification framework for updates to approx. 29,000 dynamic data
  structures (based on our generated vmlinux) in the kernel. Attempts
  like ARM MTE are the most promising approaches so far.

That is, I'm suggesting empirically measuring the set of datastructures
vulnerable to the write gadget stage of current exploits and then taking
steps to reduce the number of datastructures and impact on those
datastructures a write gadget can have.

Hopefully the above explanation will help remove some of the confusion
resulting from my poor writing.

Thanks,
Maxwell


Return-Path: <linux-arm-msm+bounces-27584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763379438BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98A971C2191E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5E216CD1E;
	Wed, 31 Jul 2024 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lLiGyYxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF9114B097;
	Wed, 31 Jul 2024 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722464540; cv=none; b=jzilGAp62LFFk0dbQ9AfqeQzgt1PvzsZ0OiAQ4OtaVVcVR5tmWxisF4UrWjKNWAXaEgZ0eO6mU+58LeSD6lasCbjgiXld00jTFjVDPEgW2yVggcK42QhY/kLVYbTpEzqoIJN22V8msjRpMUsskcbGJLAVoHr/u2E1lBOViBjB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722464540; c=relaxed/simple;
	bh=3X7f/hW80XyZc/FI4+gk68GjQ/vH3hQbTVI2mw7iPSw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwFhmDe9p5p9rGWJBgyN3Dw+2rqwgblxrp4XyGiJcSKRKUEKTGihgo316FWcSjYzKtDOQ4j9OPQ1BAkyr3bpazbuAnqmcvPz4G9nz6izeyMKip0QDTBfTYTS1aWKSUjAAa3ZUf+yPY7SYapZ8WqV5zSGkiianAYY2x0GdC4j+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lLiGyYxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VCUhJw010022;
	Wed, 31 Jul 2024 22:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PkS1pxyTMdqdnnXPAyaaYeM/
	WEVnTjm0ZKicIg64RXU=; b=lLiGyYxHehouvl1UqcMAWVkvaq9JNGwuc7yqF4H3
	qT9Dx4aAWEUV09yH/M/3gppkk6/++E3DREgr9NW1RvV/hm5PwLCR55Erm6CAmHx2
	lV44WrTyI/ZCs209FfyLng72CxW4i0k+Zc8UBRcsXud/kcEDrM3Pk35tPMDaxyRl
	uY94O3tmGuWJJzC2MaSMHOEc9eVvshVMnMgJUspPsg2cv8C+eWSv+ATUdr5rU4e5
	HcpAt8Xi/DeVY8ACpwxm0VEi5ymiE0OvPUnPz45HBEujHPEy75l11W+tYSEo5nf0
	KEKkZuCNUpMweIFrqZJdeURK+I3LMdpnET7TkKWOJEA0Xw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qnba9k50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:21:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VMLsqj014520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:21:54 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 15:21:53 -0700
Date: Wed, 31 Jul 2024 15:21:53 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: David Hildenbrand <david@redhat.com>,
        Christoph Hellwig
	<hch@infradead.org>, Will Deacon <will@kernel.org>,
        Quentin Perret
	<qperret@google.com>,
        Chris Goldsworthy <quic_cgoldswo@quicinc.com>,
        "Android
 KVM" <android-kvm@google.com>,
        Patrick Daly <quic_pdaly@quicinc.com>,
        "Alex
 Elder" <elder@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Murali Nalajal <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Philip Derrin <quic_pderrin@quicinc.com>,
        Prakruthi Deepak Heragu
	<quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Fuad Tabba <tabba@google.com>,
        "Sean Christopherson" <seanjc@google.com>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v17 19/35] arch/mm: Export direct {un,}map functions
Message-ID: <20240731140323693-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
 <20240222-gunyah-v17-19-1e9da6763d38@quicinc.com>
 <ZdhEtH7xzbzdhS2j@infradead.org>
 <20240223071006483-0800.eberman@hu-eberman-lv.qualcomm.com>
 <Zdxwo0abvklfam-Z@infradead.org>
 <2f4c44ad-b309-4baa-ac21-2ae19efd31fb@redhat.com>
 <20240226092020370-0800.eberman@hu-eberman-lv.qualcomm.com>
 <49d14780-56f4-478d-9f5f-0857e788c667@redhat.com>
 <20240229170329275-0800.eberman@hu-eberman-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240229170329275-0800.eberman@hu-eberman-lv.qualcomm.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j4I54y4kCbHW5wCFqcXe9qcnZqg6h32C
X-Proofpoint-GUID: j4I54y4kCbHW5wCFqcXe9qcnZqg6h32C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310157

I wanted to revive this thread based on the mm alignment discussion for
guest_memfd.

Gunyah's guest_memfd allocates memory via filemap_alloc_folio, identical
to KVM's guest_memfd. There's a possiblity of a stage-2 fault when
memory is donated to guest VM and Linux incidentally tries to access the
donated memory with an unaligned access. This access will cause kernel
to panic as it expects to be able to access all memory which has been
mapped in stage 1. We don't want to disallow unaligned access simply
because Gunyah drivers are enabled.

There are two options I see to prevent the stage-2 fault from crashing
the kernel: we can fix up the stage-2 fault or ensure that Linux has a
S1 table consistent with S2.

To do the latter, the obvious solution seemed to be using the
set_direct_map functions, but you and Christoph have valid concerns
about exporting this to modules since it's a low-level API. One way to
avoid exporting the symbols is to make Gunyah a built-in, but I'd like
to find a better solution.

One way I can think of is to create a "guest_memfd library" that both
KVM and Gunyah can use. It abstracts the common bits between the 2 into
a built-in module and can be the one to call the set_direct_map
functions. I also think the abstraction will also help keep KVM
guest_memfd cleaner once we start supporting huge folios (and splitting
them). Do KVM and mm folks also see value to using a library-fied
guest_memfd?

Thanks,
Elliot

On Thu, Feb 29, 2024 at 05:35:45PM -0800, Elliot Berman wrote:
> On Tue, Feb 27, 2024 at 10:49:32AM +0100, David Hildenbrand wrote:
> > On 26.02.24 18:27, Elliot Berman wrote:
> > > On Mon, Feb 26, 2024 at 12:53:48PM +0100, David Hildenbrand wrote:
> > > > On 26.02.24 12:06, Christoph Hellwig wrote:
> > > > > The point is that we can't we just allow modules to unmap data from
> > > > > the kernel mapping, no matter how noble your intentions are.
> > > > 
> > > > I absolutely agree.
> > > > 
> > > 
> > > Hi David and Chirstoph,
> > > 
> > > Are your preferences that we should make Gunyah builtin only or should add
> > > fixing up S2 PTW errors (or something else)?
> > 
> > Having that built into the kernel certainly does sound better than exposing
> > that functionality to arbitrary OOT modules. But still, this feels like it
> > is using a "too-low-level" interface.
> > 
> 
> What are your thoughts about fixing up the stage-2 fault instead? I
> think this gives mmu-based isolation a slight speed boost because we
> avoid modifying kernel mapping. The hypervisor driver (KVM or Gunyah)
> knows that the page isn't mapped. Whether we get S2 or S1 fault, the
> kernel is likely going to crash, except in the rare case where we want
> to fix the exception. In that case, we can modify the S2 fault handler
> to call fixup_exception() when appropriate.
> 
> > > 
> > > Also, do you extend that preference to modifying S2 mappings? This would
> > > require any hypervisor driver that supports confidential compute
> > > usecases to only ever be builtin.
> > > 
> > > Is your concern about unmapping data from kernel mapping, then module
> > > being unloaded, and then having no way to recover the mapping? Would a
> > > permanent module be better? The primary reason we were wanting to have
> > > it as module was to avoid having driver in memory if you're not a Gunyah
> > > guest.
> > 
> > What I didn't grasp from this patch description: is the area where a driver
> > would unmap/remap that memory somehow known ahead of time and limited?
> > 
> > How would the driver obtain that memory it would try to unmap/remap the
> > direct map of? Simply allocate some pages and then unmap the direct map?
> 
> That's correct.
> 
> > 
> > For example, we do have mm/secretmem.c, where we unmap the directmap on
> > allocation and remap when freeing a page. A nice abstraction on alloc/free,
> > so one cannot really do a lot of harm.
> > 
> > Further, we enlightened the remainder of the system about secretmem, such
> > that we can detect that the directmap is no longer there. As one example,
> > see the secretmem_active() check in kernel/power/hibernate.c.
> > 
> 
> I'll take a look at this. guest_memfd might be able to use PM notifiers here
> instead, but I'll dig in the archives to see why secretmem isn't using that.
> 
> > A similar abstraction would make sense (I remember a discussion about having
> > secretmem functionality in guest_memfd, would that help?), but the question
> > is "which" memory you want to unmap the direct map of, and how the driver
> > became "owner" of that memory such that it would really be allowed to mess
> > with the directmap.
> 


Return-Path: <linux-arm-msm+bounces-40556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA59E5B8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684891631E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFEA192B63;
	Thu,  5 Dec 2024 16:35:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DB421CA18;
	Thu,  5 Dec 2024 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416539; cv=none; b=j7uTQ+LZakq2zVDNRz61aW1Mn7cndrd+T83wZUa1rdtQtv6u+EoVfG2nAc5NIFYT/eAhEh5bNX9KhgHA5cbjpvkAJjPIZH57k1iIdjk8CbHi76J55WJK6u4NAp99ZFRHWZbb2LiXqMVw4Yk7SixeiAx1zCFH35la1J8SeyGl9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416539; c=relaxed/simple;
	bh=K3Bs2RtR8o7MWBW9/HZ/1xV56uM95Nq9cdHJeJ+msnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tna12rAnXC/lHIO0MLNy6vlKnRL0JHosYRDzutwGHFgkOBfo83aSQZP5S2zz75QhPGKb99ViGOtvv6sMYCLRodhvDCxWXp1FOOrYbLNoHCISrvBvisEpW+gTs5e3RhMwP78JScp4rXlBddPU9lAbKX6sPKoIn290AisK49vJrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41ECC1063;
	Thu,  5 Dec 2024 08:36:05 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CD9A3F5A1;
	Thu,  5 Dec 2024 08:35:35 -0800 (PST)
Date: Thu, 5 Dec 2024 16:35:33 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: <cristian.marussi@arm.com>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V5 0/2] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z1HWVfIS-w0OXQHl@bogus>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-1-quic_sibis@quicinc.com>

On Fri, Nov 15, 2024 at 06:45:13AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling)
> through a mixture of pre-determined algorithm strings and param_id
> pairs hosted on the SCMI controller. Introduce a client driver that
> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> to detect memory latency workloads and control frequency/level of
> the various memory buses (DDR/LLCC/DDR_QOS).
> 
> QCOM SCMI Generic Vendor protocol background:
> It was found that a lot of the vendor protocol used internally was
> for debug/internal development purposes that would either be super
> SoC specific or had to be disabled because of some features being
> fused out during production. This lead to a large number of vendor
> protocol numbers being quickly consumed and were never released
> either. Using a generic vendor protocol with functionality abstracted
> behind algorithm strings gave us the flexibility of allowing such
> functionality exist during initial development/debugging while
> still being able to expose functionality like memlat once they have
> matured enough. The param-ids are certainly expected to act as ABI
> for algorithms strings like MEMLAT.
> 
> Thanks in advance for taking time to review the series.
> 
> V4:
> * Splitting the series into vendor protocol and memlat client.
>   Also the move the memlat client implementation back to RFC
>   due to multiple opens.

Sorry if I missed the rationale for the split here from the previous
discussions, but I would like to see the DT bindings if any for all the
users first before I can merge this. I am happy to get this series reviewed
independently but my views might change looking at how it will be used as
I might get better idea looking at the users. I really don't like the
interface as well as the DT bindings that might be enforcing us to define.
I have given my initial comments there.

No need to respin it together immediately or even in future as along as
there is a reference for me to look at.

--
Regards,
Sudeep


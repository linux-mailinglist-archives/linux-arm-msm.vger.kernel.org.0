Return-Path: <linux-arm-msm+bounces-74096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5807B85954
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 17:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4181C6243B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79FF30CD99;
	Thu, 18 Sep 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TolEN6m5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921A2F5A3C;
	Thu, 18 Sep 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209010; cv=none; b=kUmIlcXUdyfb+I7IBUpva1/wLHp3DcnUE/0XNu6SU9Me7xXjzcaoJVhvv+c6viooe9JW9sJ5UOltfggw8A5pazyIg971EXuWtGLtSwKC9/Cnp0hg6zBFqoT2wDm2GmSKZNV4VNTvl5zbHOYlAoXufFh18OxSbnkKuBZmiKfakGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209010; c=relaxed/simple;
	bh=g3cS/lZwgVcclRY6ZWivvVKvmwA2sJzfeV9D2rWS388=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9t3KGN52q//4K0h2vJWDTiyVSFQosjQD6cTbjK249OtsDOM6TTCmEod6Mw47Nja3YlJxMgtdDCh3WU3OQZBAZybPV2Cf5SWC5s6RdIjOJrn/3/oJzU1h0v9oFra1aY0bydWj/PaYqu1jNqALipottmr7T/R88a2XH9+uuFeaqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TolEN6m5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758209009; x=1789745009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g3cS/lZwgVcclRY6ZWivvVKvmwA2sJzfeV9D2rWS388=;
  b=TolEN6m5aRZWnXtMKj4BnnvWR0fy4INhtVY93RnYMZB8fD1rPoYEPfsy
   QDKNkvRCZucLWjrpddB8Qavvji2t0smVlgfHF9meu5h3lWvwlofi/qNro
   tO7s+ZcPQh1AWY16BGKj37HXJM6ircdA2asMa+UBAtQk1RPmkop4x3sa0
   +Alrqk9pJ7b6MWrPT/FZFPl+Poc5vl0vbbhPFtFa5KeHLHFkoCJ/adS3d
   HpZhvafmFIWDlmUuzYUi4IEc4HSfFbMtXvL4Sk0HUlZYyreKG4WWfa7OL
   Hdf3XK0I1QysTyxCUbx5yQMTy1whSnWCq6bAYoaeKBzVX9UHVCnf+QzAw
   w==;
X-CSE-ConnectionGUID: rg5qYePjT26T13vObs+LgA==
X-CSE-MsgGUID: XbgtlJz1Tja6I9Wt1nqCUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64348587"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64348587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 08:23:28 -0700
X-CSE-ConnectionGUID: t8SDyEeiQE2t72SKnVtbVg==
X-CSE-MsgGUID: FuLKWxRXTZC60UTTdFY3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="180684283"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 08:23:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 21C1497; Thu, 18 Sep 2025 17:23:22 +0200 (CEST)
Date: Thu, 18 Sep 2025 17:23:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mayank Rana <mayank.rana@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
Message-ID: <20250918152322.GK2912318@black.igk.intel.com>
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
 <20250917061236.GF2912318@black.igk.intel.com>
 <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>
 <20250918051244.GJ2912318@black.igk.intel.com>
 <035c0d66-bddd-495c-bd23-e1d98570ba7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <035c0d66-bddd-495c-bd23-e1d98570ba7f@oss.qualcomm.com>

Hi,

On Thu, Sep 18, 2025 at 11:05:42AM +0200, Konrad Dybcio wrote:
> > I it hard to change these DT bindings later on? If yes then I would
> > definitely think forward and make this support MSI from the get-go.
> 
> dt-bindings (attempt to) promise an ABI-like interface, so bindings
> for *a given IP block* ("dt-bindings describe the hardware") should
> not change, unless there's something critically wrong (e.g. "this
> could have never really worked").

Then I think it is good to think few steps forward and make sure when
Qualcomm adds MSI to their IP it can be easily desribed in the DT bindings.

> Adding new properties is always OK, marking the new properties  as
> 'required' is not (unless it falls into the aforementioned case).
> 
> It's also totally OK to add MSI properties to e.g. Apple Host Router
> bindings specifically when they come around, as it's simply a different
> piece of hardware. It's also OK to create a usb4-host-router.yaml down
> the line, which will act as a common include and perform any
> maintenance/code churn, so long as it doesn't end up in the bindings
> for any specific hw block (e.g. this QC one) becoming more strict
> than they were on HEAD^.

Okay thanks for the explanation.


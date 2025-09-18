Return-Path: <linux-arm-msm+bounces-74100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A67B86020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 18:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ECA67AD4AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B123191C3;
	Thu, 18 Sep 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSP9qlFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A32244692;
	Thu, 18 Sep 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212642; cv=none; b=e9Q1aEzOvKeogH3YwZFmynb+bjaZ6mOHRye3CJAak8ODndFNBctJpO/7Pl8mbhih3YN73LR4tcZ/ieia9T4LxbJZcCgonc4Mks4kehZLd6eaPFoKbbC7gHdiLUjdxaxlIvmmmCp572PTE3dEron0y03YCXOqYjkokZu+QPRXUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212642; c=relaxed/simple;
	bh=qxZffvEGZk3Ux/d97kUEpFcAYo5rdjWgeV+BxpkYyq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRLfMauYoyGEwXJxg2JtINdbC4VPRzYN5fwRsDMun2pqD/WhiZ9JSmdyqo5zyZJ7PYIc3NSi15pXapZ0oLhaIoD4Jvf5o4FaTKLm6rCJm9Ps8x8z6ODNtdW991Rwyq9NhxCGiu68+9gKkqTLFJu0VlfekiDAwKNKKjneNn0c2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSP9qlFE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758212640; x=1789748640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qxZffvEGZk3Ux/d97kUEpFcAYo5rdjWgeV+BxpkYyq0=;
  b=hSP9qlFEtpBSuNKXCBklel+xwh6tHl7p5xQTSzfsutH1EdpM8eDxdUpf
   QIkuWQZxZ3J4MbqnpcJuny2vWB02Q1w7syMhEgDaL2jZDWVhvlD52riA6
   CHagN3WY1Ce1SObxfhB0a+dEVu9UfXdpphUgI3LCguEBmu45RZLS7V2xz
   /zruHD9lg4aa48tBwyi3OCetElnRPpHmZKxQEAwcRrQBgtChnoNm0a7AV
   E3ZWt/VZVR9hcojoh7dFr5UGfCJWNy3fyNiaAhxI13MBM1/IHFaQTeQM4
   FxS6g5pbVPUNv+r6VihWCWdg5FJMzwFLP9pVA4SuYYocTHurPqdO8Rtzd
   g==;
X-CSE-ConnectionGUID: X/PnW/DSSKOk3Cgu0IzGyA==
X-CSE-MsgGUID: NZsu+535SVO5RMal9iqXqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60242233"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="60242233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 09:23:58 -0700
X-CSE-ConnectionGUID: eKrlZOwzQNCLAbp65zkapA==
X-CSE-MsgGUID: PgXR132hTEWTscTPsQZC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175508435"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 09:23:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7142C97; Thu, 18 Sep 2025 18:23:52 +0200 (CEST)
Date: Thu, 18 Sep 2025 18:23:52 +0200
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
Message-ID: <20250918162352.GM2912318@black.igk.intel.com>
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
 <20250917061236.GF2912318@black.igk.intel.com>
 <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>
 <20250918051244.GJ2912318@black.igk.intel.com>
 <035c0d66-bddd-495c-bd23-e1d98570ba7f@oss.qualcomm.com>
 <20250918152322.GK2912318@black.igk.intel.com>
 <af749f54-1406-40c0-97c3-2a418f29b55f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af749f54-1406-40c0-97c3-2a418f29b55f@oss.qualcomm.com>

On Thu, Sep 18, 2025 at 05:38:13PM +0200, Konrad Dybcio wrote:
> On 9/18/25 5:23 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Thu, Sep 18, 2025 at 11:05:42AM +0200, Konrad Dybcio wrote:
> >>> I it hard to change these DT bindings later on? If yes then I would
> >>> definitely think forward and make this support MSI from the get-go.
> >>
> >> dt-bindings (attempt to) promise an ABI-like interface, so bindings
> >> for *a given IP block* ("dt-bindings describe the hardware") should
> >> not change, unless there's something critically wrong (e.g. "this
> >> could have never really worked").
> > 
> > Then I think it is good to think few steps forward and make sure when
> > Qualcomm adds MSI to their IP it can be easily desribed in the DT bindings.
> 
> Your reply makes me believe I glossed over an important detail..
> 
> If qcom,x1e80100-hr doesn't have MSIs, qcom,nextsoc-hr can add them
> without any issues too, just that the X1E80100 binding can't be altered,
> e.g. "binding" refers to the (compatible, allowed_props, required_props)
> tuple

OK then it is all good and allows extension in the future generations.


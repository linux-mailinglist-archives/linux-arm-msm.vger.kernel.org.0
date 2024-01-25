Return-Path: <linux-arm-msm+bounces-8237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15883C066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 12:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6284E1C21117
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 11:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FDF45949;
	Thu, 25 Jan 2024 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAEJgJyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B7A4503E;
	Thu, 25 Jan 2024 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706180646; cv=none; b=Z7FASoeo3QhrYh9LSRsd53KyCD8cvwlb9lxONF/UhR+endR74KPU8c85k0PDVD2BEJncTauziQDvaKV38C2zt3Q18wIuVZjWsurnFr+hYr7e4NNQz618uxoI4DGQJXEecFeLLtt4RKZ81n/nLS4VO/XpmKZnbfqE56KVtnLiZnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706180646; c=relaxed/simple;
	bh=a9NXweH9qUd8G7a734VJZg6C/IWxoVP+919kuw6amkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlnBQMjEWVrana1TVr99nA02Z0ZFZGiahHsCSmYedTomyyG5o1uqH14uzu+Diln1xknhAsZdDMqKxaUAKuME8LQ7AIqlABpmK6OFv5MF+JQ/nRPc237lA2CkTfehZprBgdra2F114w5hmli9BKiyqFND64bgJE8MS7Xo64eQjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAEJgJyv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706180645; x=1737716645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a9NXweH9qUd8G7a734VJZg6C/IWxoVP+919kuw6amkQ=;
  b=DAEJgJyvU68LVGL5SVgBAolTUVZMzCa7xgNovNXePwuGoa/lzfSCBznD
   Ij2izLWiTjtf9Kc9i0O+YcClelP7KWIgGjo7VMUYOOMCs6z6uUhmWTkLN
   pG4wpj9nRqAVrigkt8oU5gCaBRo60nDB3C+dPygciLEdYxgZ6JCJMNhDW
   yIa56TT7obNrUEQnJLTaGCk9pEURd55SqadaoAOAv+WdbvDptwr6dGSO1
   8yFfsRvK6Y2iH5GhpV1ytwEQH+HdaLk3fBu1dTr3rYiBsJKDcCJCMzQjs
   /Futv0+khgKo5bVQLjaUdcjqUyrhdr52YoqG1h3Vyz3/KjYFETzt+CzRS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9509256"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9509256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929985015"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="929985015"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 25 Jan 2024 03:03:55 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 25 Jan 2024 13:03:54 +0200
Date: Thu, 25 Jan 2024 13:03:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 09/15] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
Message-ID: <ZbJAGmq6AWxgr47o@kuha.fi.intel.com>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org>
 <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
 <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com>
 <ZaaRZ/xi8vyIKD5d@kuha.fi.intel.com>
 <CAA8EJpq3LAzrdTXtnCskc0Md1e39Yo1+AQLHmOBVfgax4HEjKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq3LAzrdTXtnCskc0Md1e39Yo1+AQLHmOBVfgax4HEjKw@mail.gmail.com>

On Thu, Jan 25, 2024 at 02:07:59AM +0200, Dmitry Baryshkov wrote:
> On Tue, 16 Jan 2024 at 16:23, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Tue, Jan 16, 2024 at 02:56:11PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, 16 Jan 2024 at 14:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > > On 1/13/24 21:55, Dmitry Baryshkov wrote:
> > > > > The PMI632 PMIC support Type-C port handling, but lacks USB
> > > > > PowerDelivery support. The TCPM requires all callbacks to be provided
> > > > > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > > > > implementation to enable the PMI632 support.
> > > > >
> > > > > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > >
> > > > Still not a fan of stubby stubs :/
> > >
> > > Me too. If there are better suggestions, I'll be pleased to implement
> > > them. Greg, Heikki?
> >
> > Guenter, do you have time to look at this?
> 
> Heikki, Guenter, just a gracious ping for your opinion.
> Probably another option is to read pd_supported (or all caps) before
> checking the callbacks and then instrument all calls to PD with
> pd_supported checks.

I don't have anything to suggest here, but Guenter should really
comment this one. In any case, FWIW:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki


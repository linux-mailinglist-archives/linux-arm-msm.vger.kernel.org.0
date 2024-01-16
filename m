Return-Path: <linux-arm-msm+bounces-7365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8082F07F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 15:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 319EBB20C98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9DA1BF23;
	Tue, 16 Jan 2024 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUnzJwZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C7E1BDC9;
	Tue, 16 Jan 2024 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705415023; x=1736951023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Na5eWQh1Z258eSgFghhYRXbSbOGbUrO4q4Hww3wmrL8=;
  b=DUnzJwZQ1PucwowjWUOVv7UkKttMtJtdgLEP8OKYdJW0/JhOdRM2pocv
   YMqyp9OgIBl/Vt/fCeuymwR7oTsTj3tsu/yg+onvXXsZ8/6IcClwQtKCh
   fRewa5Gs37pE7zPeokJLGBIlH9VtAYCtw0KqNcl06mp+ee0kz/6JeKx0f
   SMTJaM0UUJeUCmwJ/F4y3Hnv5md3srqHzeOH8d7WeHweChl9oowAmZP9h
   OGcz7MpjeiWBVtr+MWoOHv3XBy8TbuZ9AIxA1SMNLduhUpP9mFC/ABuTQ
   lOQECnQxWlFND27Sb/l2dBrzwnyrU6OyIrIJ6r668TpkRKR6wBgsVODSi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13376539"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="13376539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 06:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1115308365"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="1115308365"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga005.fm.intel.com with SMTP; 16 Jan 2024 06:23:34 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 16 Jan 2024 16:23:35 +0200
Date: Tue, 16 Jan 2024 16:23:35 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Message-ID: <ZaaRZ/xi8vyIKD5d@kuha.fi.intel.com>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org>
 <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
 <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com>

On Tue, Jan 16, 2024 at 02:56:11PM +0200, Dmitry Baryshkov wrote:
> On Tue, 16 Jan 2024 at 14:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > On 1/13/24 21:55, Dmitry Baryshkov wrote:
> > > The PMI632 PMIC support Type-C port handling, but lacks USB
> > > PowerDelivery support. The TCPM requires all callbacks to be provided
> > > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > > implementation to enable the PMI632 support.
> > >
> > > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >
> > Still not a fan of stubby stubs :/
> 
> Me too. If there are better suggestions, I'll be pleased to implement
> them. Greg, Heikki?

Guenter, do you have time to look at this?

thanks,

-- 
heikki


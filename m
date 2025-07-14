Return-Path: <linux-arm-msm+bounces-64884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D70B04A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 00:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE4734A1225
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 22:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6BF1B87E9;
	Mon, 14 Jul 2025 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fecDBq57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B028E0F;
	Mon, 14 Jul 2025 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752531317; cv=none; b=Gi0HvEMejoEUQj3L3uD/mfr7ijvqAYWP1IAAir/49VycpgmhemX8iEbSMAu9Qk8RGr3Bjt53Ba2bHgbiF7F3fhW5uSw+D/OlF6bwexSux69gJVm9K3MWOoM70/3F5JtSAT92/uwrUPOchEW1K8E6CY0pBjKsTIFIjGEsorf52v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752531317; c=relaxed/simple;
	bh=3hSxTtkziUSGFdZ/QE79AJcoYavoz4VRQvR6zKD654o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmKfj5dKMglCvTZWvTbpiiSdCuPFmrKXhfU1HW6Fh9a+w1D4YUtj/E5LOBnzZ0qO2xucqx5DXVV1n5TFV2qUVgP6onIpE4jYnHII4tQklhoWTU8JUyYdOxg+OHtNPAiLCKYq9fxAa7KGjvY4+NRpTassEtQyVn7H9k3UZeEZEh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fecDBq57; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752531316; x=1784067316;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hSxTtkziUSGFdZ/QE79AJcoYavoz4VRQvR6zKD654o=;
  b=fecDBq57ufPTvuG47uG/OlF7c4Uu2JXSN3yKWHdrR1T9OnItUGvabPlL
   5Y1ISkuNYnGZMhleIl6WKpAStpkHqS1pzlMZtp3QXbh/Yz9/qVXnv/CJN
   52sJ9k6szcWrla2rscV+ZI18W8GqB0faQuzw+kP3cWv+zRhLzqW9BXgWH
   drUcALdm7Umu+QtYpLl6qqqjI3BrrIXN5CwCMObDf7J+Lj5ii47ygvQSw
   pwOSBCPSaQPrJViJtYJbSwxw5N1nDrGtISTkjziPgpAv1CiHkk2L8OdOB
   0ebFzGPtZZTrdBNwLcL8JHnht/MJE4rZwd0SzkeFz0t268Hh5e887OAX3
   w==;
X-CSE-ConnectionGUID: iodbTMFRTM+xWrm+uW+anw==
X-CSE-MsgGUID: L+t1n7vmSjiMV+HaAQn6Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77274274"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="77274274"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 15:15:15 -0700
X-CSE-ConnectionGUID: oACIzgexQJG57d5u3/RD8A==
X-CSE-MsgGUID: gO4PIoEuSB2JtqOHNp9bdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="162593975"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.142])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 15:15:13 -0700
Date: Mon, 14 Jul 2025 15:15:13 -0700
Message-ID: <85ple2ju6m.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andy Yan <andyshrk@163.com>,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	p.zabel@pengutronix.de,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge detect hook
In-Reply-To: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
	<20250703125027.311109-3-andyshrk@163.com>
	<chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/29.4 (x86_64-redhat-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025 14:27:43 -0700, Dmitry Baryshkov wrote:
>
> On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:

Hi Andy,

> > From: Andy Yan <andy.yan@rock-chips.com>
> >
> > In some application scenarios, we hope to get the corresponding
> > connector when the bridge's detect hook is invoked.
> >
> > In most cases, we can get the connector by drm_atomic_get_connector_for=
_encoder
> > if the encoder attached to the bridge is enabled, however there will
> > still be some scenarios where the detect hook of the bridge is called
> > but the corresponding encoder has not been enabled yet. For instance,
> > this occurs when the device is hot plug in for the first time.
> >
> > Since the call to bridge's detect is initiated by the connector, passing
> > down the corresponding connector directly will make things simpler.
> >
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > ---
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This seems to be breaking 'make allmodconfig'. This is what is being seen:

../drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c: In function =
=A1ge_b850v3_lvds_detect=A2:
../drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:145:16: error: =
too few arguments to function =A1ge_b850v3_lvds_bridge_detect=A2
  145 |         return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->br=
idge);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:124:1: note: de=
clared here
  124 | ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge, struct drm_=
connector *connector)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:146:1: error: c=
ontrol reaches end of non-void function [-Werror=3Dreturn-type]
  146 | }
      | ^

Could you please post a fix for this. Maybe do 'make allmodconfig' to check
if you haven't missed anything else.

Thanks.
--
Ashutosh


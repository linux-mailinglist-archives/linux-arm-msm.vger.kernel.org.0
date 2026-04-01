Return-Path: <linux-arm-msm+bounces-101308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6mo+FJz4zGkKYwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:51:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01966378CC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B6763020FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2E43F1669;
	Wed,  1 Apr 2026 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL7S8Tal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA237998A;
	Wed,  1 Apr 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040278; cv=none; b=Toj0FrEUO+IAmTM5+eIZM6sYbTk/tJ6a9N0gBD2pe6F/cb7y3h3x76TjovO7YxZDYbCt0TumrOMoeWdLVRHiRbHzBJ/jud66qwh3hKePRM1RHFHVbrNf64fw1rF/kV2Hc78XUgoj5wzHnCysNb+LFiKoHx6a+SPFGsDOssZb2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040278; c=relaxed/simple;
	bh=Od6Yjql3wyUH4LEOy4mFj4V5RTrmkvJWBdk8k3pqDYQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fXhhTlvTnQrA03MVOvMS+DZy45YT3s4ggbHE/GnnlRtCPmAFA7sr+v0YAuxc9P/quq+rT3EsvV5yESWlqOUK33rf6FVtWGYCim01xA9X8RLaEBS0WkwMm5XN4+gIbWCSwdH43hef5bs4x6Yvg0kAnAbDoRHJ09It1IirdlhmivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL7S8Tal; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775040276; x=1806576276;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Od6Yjql3wyUH4LEOy4mFj4V5RTrmkvJWBdk8k3pqDYQ=;
  b=eL7S8TalmTynxdofWC7+9hDT//pnS/FUr7PDkCegBtY5fdFIDKsHdNLW
   /5tfTaZfdIaIZS/ORwiEI2xaIwwSwr4y9AKbgLQ9hldQoSeyznJHPat4f
   bpF26bjO9Y2e2NUhT0JXf3IrVBjWaEpv6c0iHOXpioWesITex8HKCHypL
   8kqrOHWHasNotup/NiF0Zk/KSaq37zKGZcEr1q50B4B6sCU18nTg7Hho1
   g5u1q4AprZDzl0fmt6ImST08wtII1+N8Ks4youVrRqpCGSTrEtrY0dJTu
   jtYDtxUU1MemZoBwCiuQ5crRYGLAFijFgS9NvSwQgPwA6maAPx65TlfeF
   A==;
X-CSE-ConnectionGUID: aEdiqP5NTwyMBJzeLaUybA==
X-CSE-MsgGUID: t219rT3YTaS2DTPe/CCshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76189251"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76189251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:44:35 -0700
X-CSE-ConnectionGUID: wa+v4mGeS7WF3NunK+EhYA==
X-CSE-MsgGUID: tIwWRzupSrC32i6s4jL2pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231436451"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.192])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:44:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Apr 2026 13:44:26 +0300 (EEST)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
    Tobias Heider <tobias.heider@canonical.com>, 
    Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
In-Reply-To: <328acf2d-988e-45b6-9553-240108caa91b@oss.qualcomm.com>
Message-ID: <94180bf7-71a2-05c8-823a-ec25b5802650@linux.intel.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com> <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com> <328acf2d-988e-45b6-9553-240108caa91b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101308-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 01966378CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026, Konrad Dybcio wrote:

> On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> > Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> > partially of fully compatible with Snapdragon-based Dell Latitude,
> > Inspiron ('thena'). Primary function of this driver is unblock EC's
> > thermal management, specifically to provide it with necessary
> > information to control device fans, peripherals power.
> 
> [...]
> 
> > +/*
> > + * Format:
> > + * - header/unknown (2 bytes)
> > + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> > + */
> > +static const u8 dell_xps_ec_thermistor_profile[] = {
> > +	0xff, 0x54,
> 
> This is super wishful thinking, but 0x54 is ASCII 'T', perhaps for
> "Thermistor" or "Temp"?
> 
> > +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> > +{
> > +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> > +	int ret;
> > +
> > +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> > +	buf[1] = suspend ? 0x01 : 0x00;
> > +	/* bytes 2..63 remain zero */
> 
> buf[1] = suspend
> 
> (since it's a boolean argument)

I'd prefer boolean -> binary conversion is done explicitly.

-- 
 i.



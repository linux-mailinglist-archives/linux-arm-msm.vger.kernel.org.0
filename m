Return-Path: <linux-arm-msm+bounces-112205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wxPfHEYkKGrh+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:33:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B19661192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:33:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=G4UjsT0W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1808307B0AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E17B33F58B;
	Tue,  9 Jun 2026 14:24:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E352E040E;
	Tue,  9 Jun 2026 14:24:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015099; cv=none; b=H8W1u1jxQdIRFibsaEFBZ90PdmC9d6nItuEq0MkrLna3+4230bCw96kOmTNbh6k4Z4iwCeBYYmpSfyoXbgW+fOIgh8GoL99TI57zW+ByrGEvNpuItr3jkZpIsHMoAPlRlg1gRSHEo68Z1yeiz1SCnhUQDZw513YpEhSSWXSLUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015099; c=relaxed/simple;
	bh=BHLRMWIn5GBjiRN3tikjUoHnTdQKmy7LmrYluNRDeN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=otq3vvL6zQk7NrPrc6B/Yy2TvMcHzCwaGi/Dcanqvexwky2hbODm6PFfXdxh12wFtpyNcsR51BvgzciB4p6fnwvPCWB9woKlr/UBlT0xkERQj+qZVZFyUOgUG8XagqueGw4+/kRWbY56OmHTmlJEJ4G4Sgkv3nIoRy8Ds2Kdohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4UjsT0W; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781015098; x=1812551098;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BHLRMWIn5GBjiRN3tikjUoHnTdQKmy7LmrYluNRDeN8=;
  b=G4UjsT0WJyeCdnvjn07vfajxr6WmEHtbUhoymXAs2/8lCAO4idE4URL8
   tHiSvSXCaqeDRFbTm5NGlLGe1zW51cNuWZ9wjb9kB6V3KPJNqS/Rfy5p8
   rlaA6x4Uvewsg2MofmOXgFlDcQ+BIIafG0/emSwmfck5DCmvZ86iA6pcj
   p62i13azA6h66lZCp/Uh2Ab3QhKnDX318WW+zMDidBj2GtSwRqVpejDvy
   0bViRzQ4c5P7FNbNqHjzX4ApA3UWPiNxvpRNl2eUW2oiWiJbUuwRP7p7a
   ftqNZMIR5TH5EESQRnG8pWsr2m8yz907RKb2OuluAUzQURsC1p21vQzR8
   g==;
X-CSE-ConnectionGUID: 9QL2vcLjT7G89Jm9IvjX8Q==
X-CSE-MsgGUID: wx18YwAEQvKlNANHCzYX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="107212764"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="107212764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:24:57 -0700
X-CSE-ConnectionGUID: LDbVJ3I0SwiKeeVvzU1+vg==
X-CSE-MsgGUID: huvzrRQ7Rf6t3Apcmup3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245970889"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:24:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
References: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Fix indentation in
 comment tables
Message-Id: <178101508964.11417.17451315853725171571.b4-ty@b4>
Date: Tue, 09 Jun 2026 17:24:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112205-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02B19661192

On Mon, 08 Jun 2026 16:23:48 +0800, Shawn Guo wrote:

> With tab=8 (Linux Kernel coding style), there are a couple of lines
> misaligned in the comment ASCII tables. Fix indentation for them.


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64: qcom-hamoa-ec: Fix indentation in comment tables
      commit: 3b9f95b5a45786f1ca3feff7a736f30f60af08c7

--
 i.



Return-Path: <linux-arm-msm+bounces-35661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9D9ADE10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 09:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5972829CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 07:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C541AD403;
	Thu, 24 Oct 2024 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQP9V+V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AD1ABEA8;
	Thu, 24 Oct 2024 07:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729755875; cv=none; b=hcwH6z55i11AvBjdp0WXhRzYyEeB7fr0JamuGn9wL1WHPI8PRv9zEURANRVPdGFiH9CN6oSx/HfoPMwqeeq5zeTiEewnky/pE2iR5q5xSar6JcBYFXRttgl3wlFYkVZF+jF4ptmUgJsmNE3tIdXpk9lhDiP0/fct6tbVVZJOJeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729755875; c=relaxed/simple;
	bh=Gdai8nHRN5zx4u+tGzkD01x+sxyu92Q/k5sZiqGt7LM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aL4eHw1OQTaTIWFvhgoKa4EVdEeMNU3jhmK6NQdqGr52R3+DE4ZQevTQrBD+xxDEFOunyL4/uIzH62QpvUKV1lz6dOuOquiYY2x393aXTP8zmxmQ4yePGj65l1RnVNSd5LcNOV9TXH10Pz7ujUMdJg6jWnqnI3Wzrwme95ov6lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQP9V+V7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729755874; x=1761291874;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gdai8nHRN5zx4u+tGzkD01x+sxyu92Q/k5sZiqGt7LM=;
  b=mQP9V+V7cmIgX/4NP/G7o0TWfG40X1Ckn9/S4eYOOPkYeQ4WIS6k/ZZw
   TdJNLZ4M9A/hSgLOPBcEc8PCwfvnBGHa+5pImdHSH4P1EAV0mzgwuZ4FI
   0vOPwRZy0VjjFHb5bmUrXZ1Q6ghHc3cCIxzOd75uL6fdPz/0vx9KYBXiS
   9D2oaG+q+r8B/2um4AaKD/ZHg2CwT7GtADaGaTij6xlqYSdUThN6TzP1q
   grj81+7T9LFcw0z/WybiVyGEbUYaOg0h2L7myUxFKeVJzqTHV0691ress
   c7No4RYqzAjX/A4ig2WnwpEnYozwv9BmB0xtLlRNcIF+IfH3axZHyrSCw
   Q==;
X-CSE-ConnectionGUID: kFJCsGhlRuyrQ2pq+LpSZA==
X-CSE-MsgGUID: BuqqaoQGTK6Ykhc6PFkfsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28832598"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="28832598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 00:44:33 -0700
X-CSE-ConnectionGUID: dCd9/2W7TjGUWRhD8mzvcA==
X-CSE-MsgGUID: oV4LCQYYTV2X4Ii0PjBowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="117985665"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 00:44:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 24 Oct 2024 10:44:20 +0300 (EEST)
To: Maximilian Luz <luzmaximilian@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?J=E9r=F4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
In-Reply-To: <ad9fa9f2-7f97-401a-8e8f-ae633ab1932b@gmail.com>
Message-ID: <c85afd9c-8ce8-44d3-5baf-a557ec43e769@linux.intel.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com> <20240908223505.21011-4-jerome.debretagne@gmail.com> <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com> <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com>
 <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com> <555f8a3a-ae5e-57e7-f176-96c52e1a5d45@linux.intel.com> <ad9fa9f2-7f97-401a-8e8f-ae633ab1932b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-882061270-1729755860=:1315"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-882061270-1729755860=:1315
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 23 Oct 2024, Maximilian Luz wrote:

> On 10/22/24 10:56 AM, Ilpo J=C3=A4rvinen wrote:
>=20
> [...]
>=20
> > Hi all,
> >=20
> > I've now applied patch 3 to review-ilpo branch in pdx86 repo.
> >=20
> > I'd appreciate if somebody confirms I got those comment edits right.
> >=20
>=20
> Hi Ilpo,
>=20
> looks good to me. Thanks for fixing this up!

Great! Thanks for confirmation.

--=20
 i.

--8323328-882061270-1729755860=:1315--


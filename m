Return-Path: <linux-arm-msm+bounces-107083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM0/FiYYA2p10QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:08:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9951FCB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82C27301107E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4684E3761;
	Tue, 12 May 2026 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn4bCRYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580639934E;
	Tue, 12 May 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587679; cv=none; b=G451X4Nxw4cLZyZ9VFIPszvGzzqKMvJQdzrW3N8mzsqx/bg5qteM2fWdrdXwE4H0ByvavGDeQbnA98o8lirB4VktstiKw3RCisiYOUYHZuEbq4NnL1KuzylwnjRbOLoYUxdLm9JP0y63MITJzt8iDJ5sKnoFG3wtbH0thukpeC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587679; c=relaxed/simple;
	bh=XRvu2EAGQKJez8lKSh7BUoZ+vPlqUOlqHaCW8zoUhBY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Quv9PQob1xaf9KZn7AX5NYx5jnGqzl8C4+BejMhl6fwzVpThYlMcM2rT9cPQXlPSoEdBDQ7p51pp9LR0Dc67X8ozN7+cQqjDqaQnLKlZmaDDJcLJcF+doEsa+HuK25O2/Pt6mpXeb5WAcSbHIhpq05FGNNdHb0cR7shw8mIk0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn4bCRYa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778587677; x=1810123677;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XRvu2EAGQKJez8lKSh7BUoZ+vPlqUOlqHaCW8zoUhBY=;
  b=hn4bCRYaDAl8BYRjYYLifeSl74WqKUY4+YhAUt0pNLrxzVHrEypuR9Qh
   4m/Qbkl/yvN1vC3SdK6rxncQzcWOVjJi7yBUs+NXn1QPnOIGMTeXUt3KI
   ccl+XL+PPnfy5SCF5jBjftooK5QKV32Lncz+JlK/g6kqZlzfEMNToOMyJ
   d+Czz9dVDkBOf4/ekGkdtJNCUVaAkjIQnB0Wkl8luULwy7WeVgbTo8Wp1
   dFqpuzty61eoMEnELxRMpXlxGdPvDh84DeTmdjky0gHeeRnGqaGx9k/ag
   FLYQblZXAaRlpulNALFhwV8ZcuvlPlOqkEk6/l6dWBRGWhhZCZ4SSiYcu
   A==;
X-CSE-ConnectionGUID: RTBym9AJRqiSsraiBoRlcg==
X-CSE-MsgGUID: /rr+jOSIRvaHBQwv+1aVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90957067"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90957067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:07:55 -0700
X-CSE-ConnectionGUID: JB3cB9pXQw+XmpPy/2Q+Yg==
X-CSE-MsgGUID: a0h9lT7SQAKb7P4kkEj0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="268095879"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:07:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 12 May 2026 15:07:42 +0300 (EEST)
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
    Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
In-Reply-To: <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
Message-ID: <a29448e5-2998-6555-4ae4-a10f69c4e2b1@linux.intel.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com> <20260511-add-driver-for-ec-v9-2-e5437c39b7f8@oss.qualcomm.com> <84949728-7d0a-4ce9-f37c-8200ef792baf@linux.intel.com> <58b7b983-b717-49c7-9019-8862fd47695a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-92730628-1778587662=:11125"
X-Rspamd-Queue-Id: 66F9951FCB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107083-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-92730628-1778587662=:11125
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 12 May 2026, Anvesh Jain P wrote:

>=20
>=20
> On 5/11/2026 7:40 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 11 May 2026, Anvesh Jain P wrote:
> >=20
> >> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>
> >> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> >> reference boards. It handles fan control, temperature sensors, access
> >> to EC state changes and supports reporting suspend entry/exit to the
> >> EC.
> >>
> >> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >=20
> > Thanks for the update.
> >=20
> > Patch 2 applied to the review-ilpo-next branch.
> >
>=20
> Thank you!
>=20
> Will you be taking care of merging the bindings changes (patch 1/6) as we=
ll?

If the bindings and dts changes go separate ways, DT linters won't be=20
happy so the bindings and dts changes should go in through the same tree.

As such, I only too the platform drivers patch. All this should come=20
together in linux-next once all patches are in some tree (and obviously=20
eventually in Linus' tree as well).

--=20
 i.

--8323328-92730628-1778587662=:11125--


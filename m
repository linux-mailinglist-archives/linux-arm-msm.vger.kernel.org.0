Return-Path: <linux-arm-msm+bounces-98377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INjWF0d3ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:58:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22A2B98BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAB16304A595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B5B3B4EAF;
	Wed, 18 Mar 2026 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="irDfAeLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D693ACEF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827654; cv=none; b=D9w0BhBfQDbawpYNj81IvZ7BwVaG7FNGeVABet71GVB1s3B47YZAwfJ6amNMfB8LqGXExMkIZpuM4nlpF8kB+QMFu8PyZn+D7DkvewwNYNq6r6Hitzoz2kMXzHCVeXciwxIy+HCYByjzt/oCbjBPHr1l8jr5FRG7mVSJRDdvAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827654; c=relaxed/simple;
	bh=os9VWlXYYTiqTkqynxb5uh+nHqpdwsDqxYz6KCBHjhU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X56h5Wa/2z07LB47DsFhTKCvuVwR4mT2YQJ+qj2NdtPmbVVCoap00azC6Hbb7yKfqnRQErdO9+Mw4bWuYXG+PjRBCkeL0zxRj21drI2Z+MJnjClLqFu4JSeqAzTLU7dB29UyhhoUxp6+55dnq/gaENIEznAyBv9Wqs8qWNdSuFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=irDfAeLS; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773827643; x=1774086843;
	bh=/DBPVzSeb4VrhNH0lorsdARa7M8CrP0iWr42p6FQ8QU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=irDfAeLSbw86DSbeb6ZtDKukJp738/Mrp89f8XDkMsor19uIBlpX3+H/cWv+NpKSR
	 agigRpz69o9jsbQlN/ab7ubdSX5SRRh8beKOfifEVuHS1CQVegWgcwoC2hp+2LesOd
	 KuIKd8n7XdTeVtLl+PDLXO8BmASl6UjgeAhm5ptxgOiXYy7pgFxILDljG1mNeeNqdF
	 Mxby1/cjkWYo8YvK4srwjgoEakuz4JsyIJEm4i03E1O9RCfrfSQ7bg/F4OqxNviKpF
	 FBWG3eerRn7QiNJMR1svhvIV/99Bm992DDUKoUYwsDii6HD2fZF86orbilLgHF0DFz
	 R1zmhnUkJNT2g==
Date: Wed, 18 Mar 2026 09:53:59 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 0/2] drm/msm/dsi: support multiple DSC slices per packet
Message-ID: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e9bfe26bd574d27c262a3401e5d2c43704de793e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98377-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: BB22A2B98BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for sending multiple DSC slices in a single
DSI packet, which is required by some panels such as the JDI LPM026M648C.

The MSM DRM change was originally authored by Jonathan Marek [1], changed t=
o
use an 'all slices in packet' flag which derives slice_per_pkt from slice_c=
ount
instead of manually specifying the number of slices per packet.

Was also split into two patches so they can go through different trees.

[1]: https://lore.kernel.org/all/20231114174218.19765-3-jonathan@marek.ca

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Fix attribution to Jonathan Marek
- Link to v1: https://lore.kernel.org/r/20260318-dsi-dsc-slice-per-pkt-v1-0=
-1bd66b7f9e0c@pm.me

---
Alexander Koskovich (1):
      drm/mipi-dsi: add flag for sending all DSC slices in one packet

Jonathan Marek (1):
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-dsc-slice-per-pkt-f828429fbf0a

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>




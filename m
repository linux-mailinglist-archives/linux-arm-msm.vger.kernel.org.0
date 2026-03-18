Return-Path: <linux-arm-msm+bounces-98378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HJvE8R2ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:56:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A02B985A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B4A8307F9BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E732F3B95F5;
	Wed, 18 Mar 2026 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aWRM4hem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951973ACA7D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827656; cv=none; b=LAnuNKrkcDi7UMcVQdhwLVtBnKEV4zOzE0njh78cqlqFviTLLrUOAVVHNeZFiXNMxjDncpwo/28H6ei76hso2YxYpeXsTgiCOebapxoqRaPgg/Ti0/7CFs/xs0R90vFMTfDdhpNLR8JPtU+MDlGQA+SanlMDCWsV8A0B6ul2/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827656; c=relaxed/simple;
	bh=c/4GQSK74Nj7byIPfrD6C7RHq39tdQptNxSSfTG64gk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fq1wMKYQmh+X9fC1XXBR/vwu+EEJ7kHreseGkYWHXFhTSk3t1ggAGa6xH89kfIR1XIAMczuQsaYxkOBwVxwZd0Jq0UcelzzUHNiKaj7nEIKbMTWb0doZRQjmhKOZ+HEZvgeYwlSXwyUpIQoaN54VvAz3lFrb0ErhuzCS/NE4B7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aWRM4hem; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773827646; x=1774086846;
	bh=c/4GQSK74Nj7byIPfrD6C7RHq39tdQptNxSSfTG64gk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aWRM4hemV9x/6hDvLzsjQj8VEcXDS56y82N91aHItnLARgJu/9WSvMbdS9c1K9zP6
	 M6Jw3PA8trPzbFbGufrjJXPp8LQeSXRJcgGZFnUjfk6cMhokZzmE27aNMYhz52nqSE
	 Qr8dalbQk64+ZAvkfGbbx3myoW5ji76AYEGKg4rYRxm7aThy2kHOnSRCrOzM0Kr4by
	 BnBNTGs7wuhTv0qh4MFGEQuOezt6Ra20pe7uEvSG/IPAN0z3roxTgcAOyjUhG7KT6+
	 ahjTD6Dni12AYosH87gozOoXaW0qrx9JjMRIr8Q84LfR2/EGGJdcN+g4KQPtLhN4p6
	 rpiBlJlcQ3cGw==
Date: Wed, 18 Mar 2026 09:54:04 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices in one packet
Message-ID: <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d9e4f2b0396d9e14ca6fc797b00728c85c384ee5
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98378-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 043A02B985A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MIPI DSI v1.3 spec defines two modes for transporting compressed
pixel data: one slice per packet or multiple slice widths in a single
packet (Section 8.8.24 Figure 40).

Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
set to indicate that all DSC slices for a line should be packed into a
single packet. When unset should default to 1 slice per packet.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..d3ad8c5d3ebe 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -138,6 +138,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(str=
uct device_node *node);
 #define MIPI_DSI_MODE_LPM=09=09BIT(11)
 /* transmit data ending at the same time for all lanes within one hsync */
 #define MIPI_DSI_HS_PKT_END_ALIGNED=09BIT(12)
+/* pack all DSC slices for a line into a single packet */
+#define MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT=09BIT(13)
=20
 enum mipi_dsi_pixel_format {
 =09MIPI_DSI_FMT_RGB888,

--=20
2.53.0




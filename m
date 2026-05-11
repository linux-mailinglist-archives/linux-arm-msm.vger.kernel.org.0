Return-Path: <linux-arm-msm+bounces-106832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKGtDlJJAWqKTwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:13:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 923BF50785E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 064933006B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 03:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0071E492D;
	Mon, 11 May 2026 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bPdMvDO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B536EA8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469192; cv=none; b=UNzm8YPJsoBfTxGRqw3ojW/OQ2qOebYA7whNEaoHKQ4l25IpsuY80ePWPCrXaOBxIyjT8GjbDKv07agsuuJNaslpwLtTXLT4WtXqnbHnCkbwVi5ovPo8M2POwF5BK1OX9n1lmdNjytFfpML6UCILMm4crO1I3+vkpiRhFo+GxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469192; c=relaxed/simple;
	bh=WJwzTm0YuwLSMaDyoiRRuNCPG1gC1nH+cV5+Agd31+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JS17cnEVcYwhxoRUoHhd+/YxFZmxD6fgn0OgoAHwA5f2OQ46Ac06plUO8ng8E9aWBgX42ZcrO8xbynK3RwznjKRzF/LD+U2oxkLpSDGOD4V20xGVSGjPOhO5o73v9sCOqSxR3na5KNq/FLuUXp1c5/cu3Dw2GnrNL1FyUnN1860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bPdMvDO1; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778469188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJwzTm0YuwLSMaDyoiRRuNCPG1gC1nH+cV5+Agd31+M=;
	b=bPdMvDO16rGgWRyRR7cJMPbbIe6IEhY1XvNMcAvEwUBMmyrqloWqG1Yl99vSS0uUgQKLpM
	tIVHkqFwefoWez8FtOF2a+kxuP2/7OZlOsNddG6nHYyqNlurcYpZLOueSTAxCZwIjiaq/c
	BYmQwwQzQYwICDyv0YTiS9rXGhWcsWM=
From: Junjie Cao <junjie.cao@linux.dev>
To: akoskovich@pm.me
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	konrad.dybcio@oss.qualcomm.com,
	jonathan@marek.ca,
	neil.armstrong@linaro.org,
	thierry.reding@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/msm/dsi: support multiple DSC slices per packet
Date: Mon, 11 May 2026 11:12:55 +0800
Message-ID: <20260511031255.8630-1-junjie.cao@linux.dev>
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 923BF50785E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,marek.ca,linaro.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106832-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junjie.cao@linux.dev,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_TWELVE(0.00)[21];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Action: no action

On Wed, Mar 18, 2026 at 09:53:59AM +0000, Alexander Koskovich wrote:
> This series adds support for sending multiple DSC slices in a single
> DSI packet, which is required by some panels such as the JDI LPM026M648C.

Tested on OnePlus Pad 2 (SM8650) with a Novatek NT36532 based CSOT
PPC100HB1-1 panel (dual-DSI, DSC v1.2, slice_count=2). With
MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT set by the panel driver, the panel
comes up and renders without artifacts.

I'll be posting an NT36532 panel driver on top of this series.

Tested-by: Junjie Cao <junjie.cao@linux.dev>


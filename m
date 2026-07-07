Return-Path: <linux-arm-msm+bounces-117074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jVIzKedWTGp1jQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:31:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EDA7169A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:31:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZqI4oX+x;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117074-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117074-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EC323085AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5F1318B9C;
	Tue,  7 Jul 2026 01:27:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127231326B;
	Tue,  7 Jul 2026 01:27:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387667; cv=none; b=Zqbc+svSIksxucDgpAuCvrd3JLx1kyCO7n/9oaIk5pHeJx7vlbnPMKpzzkWih43ZoqmG6P9275Wcn4J/9HRasSMz+agMjLLrzK4t8gAIsqF3rMlvW7SfSV0L43JSysQJrLxUCSjaFhIiKr1wdJ/tbBPkQnmqLV3GAbUUJvsrRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387667; c=relaxed/simple;
	bh=f25h+csVmfKSnqhYObuMgXHJ8lG0awKdL89Vcb6pR64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKYSjAo+cItj/VwwVIQYFYBQroMazbsJabPLdQDdwAEyvHr0LV/8acD120+qAoPspTTRwBj66vXM4gYRq1lGvp6pZVWN2pIEYnR5k1OLe8PofzjF/xoco7g+zBCtCO/c3QCbx78GNHXNXhYPMUzg742Y3362ZCb2azsh7Lo51hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqI4oX+x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CAB1F00A3F;
	Tue,  7 Jul 2026 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387665;
	bh=GBn2l3iCjIWokc3qkGy1EHIjMHgxLeHlSFT8FB4zHHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZqI4oX+xQRRVaioGvZEkbTW2cpckGe8RBMpCsU40cZl2Lh/lM0IRhKXmx1/1wZiBx
	 oAXauGK45B3StXtIKOt3diIUWKQ4xKp8YuKmP66fNj13RaKjqfEG7DVkMwqak4+DtS
	 Czq2UvSrrmDRYszyaXkB3lv0TV25Jqi+v6JFNQJuPTK9Jx+Qg8bfGwTjHkrtBFrfs7
	 dAt8c4BqqR8xGhqcaRK8988a/BsZIGpCTMOUybrQBgVQaGm/+8Qlr6Xx7cXrD3+TY9
	 sXCazRTZKiu9Ou7WG38JkHLIevNAF676mjQfcam7qHvF0XoM8hWdPfjCLW8BGYit4Q
	 hKUos6po7YjgQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: (subset) [PATCH v2 0/6] qcom: Refactor GPU GX GDSC handling and IFPC behavior on A8x GPUs
Date: Mon,  6 Jul 2026 20:27:27 -0500
Message-ID: <178338764560.1558388.7832610679796697421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:taniya.das@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:mitltlatltl@gmail.com,m:akoskovich@pm.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117074-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,gmail.com,pm.me];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10EDA7169A7


On Mon, 27 Apr 2026 12:08:54 +0530, Taniya Das wrote:
> This series fixes two closely related issues around GX GDSC ownership and
> rail control on A8x GPUs, where recent hardware changes and runtime PM
> interactions violate GMU and IFPC(Inter Frame Power Collapse) architectural
> expectations.
> 
> Problem statement 1: Incorrect GX GDSC disable by OS
> ----------------------------------------------------
> GX GDSC is a special GPU power domain that must be exclusively controlled
> by GMU firmware during normal operation. The OS is expected to force‑
> disable GX GDSC only during GPU/GMU recovery.
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gdsc: Add custom disable callback for GX GDSC
      commit: 0661ee1d650facefdf61401c7d00eb96fad40b10
[2/6] clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      commit: badf361c00c802738c776fb5f4e8b08b4d0bad1c
[3/6] clk: qcom: common: ensure runtime PM suspend completes on probe
      commit: a5da6c5697a50a5956ae7645e52d0007ac8b3395
[4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
      commit: 1c99638642c2137d7e699e7b2ab400df7ef15774

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


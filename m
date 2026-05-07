Return-Path: <linux-arm-msm+bounces-106534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOBIHBD7/GmgWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:50:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE04EEF24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AC353227472
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2241A4A33FC;
	Thu,  7 May 2026 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzUU5UXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB345741;
	Thu,  7 May 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186122; cv=none; b=XnZhxjEijJHM+tET68yp/29YnsH+gxpGJsDgd+3urnFMLC7IhbiFTr/IrMWpKCZf6IAojvfHqm0epQjGDwhzGstzF5ecxd5zoghlGvwOR69bZzpZsdNtKkBNEQO05RH/u7V9x5gCzgMC0tSOtILkVKlpdbZ2nZnRoDOCEzRV5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186122; c=relaxed/simple;
	bh=pFaClC15A5h5LUxiUTMKOYJdhEY+xd8nzrtmaKHEWUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnQnQdpdjz4EJ3wDTA4m5AW2K6RRPQHigQ5ERsj5ohxkMFaVtk6ONLA5ihwR49Yb9MYYrkUMWEkpoBtl23EdNfU2gmL1RZymVLEHWV+MdrBFG2wlIAyxVT437EwPOcesE+ZJ3wFmrJkhmwNjHrNkIInPlVWP5Vrc9/iCIAdxCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzUU5UXX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3906C2BCC9;
	Thu,  7 May 2026 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186121;
	bh=pFaClC15A5h5LUxiUTMKOYJdhEY+xd8nzrtmaKHEWUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzUU5UXX5wSYlnNfXgszAc7TvILW8ETeeN811kNIK3vF65q1U793fpkIVRO34Pd6I
	 uC57JzslFIOWalDcCds0tLSp0ubSVOnQyEMz5nHrTQvU7lhKm8lThuySUmRykCq7L0
	 /OE4SsxzRBAHdUyV5Qy8OO2m5yigCCCWdj9p3zmErFwf5DnRgmD0nG7oaWgGXVoCOR
	 4arC3RntCzbV2VFTi0ksRhPpfkpKbdlDjsd21+WqvN/MFSOKx24dF2gteqoNeOhUUL
	 C/S7zzdiYijWbuk9n+2+2nNww6N+xYnfW+T8NQN16lmSaDxQn95sGmG9Ls4138q6OM
	 W9rON2FdbJjLw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Kamil=20Go=C5=82da?= <kamil.golda@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI and M1906F9 display panel
Date: Thu,  7 May 2026 15:34:32 -0500
Message-ID: <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9BE04EEF24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106534-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FCO DSI controller with the
> M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> generated using linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
      commit: 493cb869874cd301c370adf9a3f9577942c4f0f1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


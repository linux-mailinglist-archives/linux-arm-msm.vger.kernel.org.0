Return-Path: <linux-arm-msm+bounces-116600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h+XlIuXFSmqdHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:00:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0D70B60B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:00:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XY7rzHzT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116600-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116600-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE7F73023AFB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45583A901F;
	Sun,  5 Jul 2026 20:58:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200C3AFAE0;
	Sun,  5 Jul 2026 20:58:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285097; cv=none; b=hzFHcI5sOJMaUflejEOWPGfIcVDvM19TEjZ2rRvbNjgxhgWwcupPMD2gMoccfi04xtebhybpRhwNU96bhcK0/UdVCEemIgtqMcaY51+uR6QytWPHizv1Gh7IdXk0+/ljtUfBS7m57ZH891vWfuQZ0C0R4IK/hjB32GFLxu6SxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285097; c=relaxed/simple;
	bh=SnzMY4GeOULQDWGh9MY4DqNlK6BtUy+8ep7qqtAi1ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhAUNwars3Y77uH8zkLYkV83jnPDsOCkoagC5KLGRYwHr3pqLRWgMDRMq1WSDLkZ9JAyQeoLktFB4zEbQ3MPoGyLcBQT74upfx0n94CRpwoyznEY+gyE6SL7nLUyzyjoS2gVr4pMc2bk2V19rwTkLnDbxQan4t2TB7BllUIbdbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY7rzHzT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344EE1F00A3D;
	Sun,  5 Jul 2026 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285096;
	bh=zCq6X1dlbF+t+eqnnLurf/o0DayEF3TCPF87L8CKbW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XY7rzHzT/9XkZVvLosxNYcGKOHDM1RZiCn5FcyRZbh4nibpnmWpVurTI+sYZ+qqlW
	 uF9DITfi7ihZTXRyMfZKbGlecBp0e2pZSOGFqn/+q/LbX1oXaCBEUspT+lHOQPw2Nh
	 Nn1x1BZPlKt/MoAb2aQ9MvAggjZ9NSL+hBZFFHCcprKBnLL7fjFgTexSLFTclCFrLy
	 D51os1xMt9SgIzp4WLsS7BW4OTxKmd+3+LzBcfrb0hqNE50/IV0XJQl2NDBoelvoSK
	 0eYsYZySGB1arPI8kiXoNZm/mM+k7xM2OkRCPgAMlSfp9hNBBVopj2HQLAqyTEz8qz
	 eeKV1Yz7mDovw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
Date: Sun,  5 Jul 2026 15:57:54 -0500
Message-ID: <178328508284.1157743.15860736623678958445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116600-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:elder@riscstar.com,m:cros-qcom-dts-watchers@chromium.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zstaseg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BB0D70B60B


On Sun, 17 May 2026 17:56:06 +0300, Dmitry Baryshkov wrote:
> For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
> requires a corresponding memory region. Move those properties to the
> SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
> a per-device bases.
> 
> 

Applied, thanks!

[7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
      commit: 273cec70d297885181977ad37a2192f73bfe373d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


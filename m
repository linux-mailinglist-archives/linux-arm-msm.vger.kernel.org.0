Return-Path: <linux-arm-msm+bounces-116599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IsnbN7LGSmrtHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3770B693
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 23:03:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="YF1tD/Fc";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116599-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116599-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E4930696FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49D93AFAE3;
	Sun,  5 Jul 2026 20:58:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FB3A83A8;
	Sun,  5 Jul 2026 20:58:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285096; cv=none; b=tRamPEGJHjGp0kU+w2QBpWoSuR150bqMlb8BmLDKYZmm+LueI0H3roDXAb2IkMaZxrn7hzp2pncysG1zaWeObDVVRfRYGClfZXmgWuqktObiqkbcNvhMgs1Ifc9HovjFfC92tOwnlC83SO67JJG4tTtXCFU1o84N2K6HbHzSA7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285096; c=relaxed/simple;
	bh=VwwHoIss0frRDJxQmQ2BVmx7EueTEibiuY89lnGIm8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vErRo8dJCq70rNxqWjmtJtTAehqq9ByLgdMZXKJrahJHAbPDAL2f8tDS4HGCrYonLcc9JESB4m3GGV9PnpVQDdWYLySaSFYUR2SwcZQmzpMtyonPboKPg9U7drGwwsmlrxVIAvd4C8eXtlVmhlPo8pk4oU+0irFKGtxxyXmQnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF1tD/Fc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4F61F00A3F;
	Sun,  5 Jul 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285095;
	bh=g1awgb9U5Ce1AtxDCIAvPJsraFnJzO3wDcFsgF/B2+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YF1tD/Fc1L9CrjOdJHc+DxfkGqEy79ayOR61qDLlHO4pwzcbtCKNHrW53/4WVBlfF
	 FfT1zfSGCRFkoKMFhrYk3EFpmV+xB6+C5cHcaZMWJRZhyQd8D0+9tfQuRCdIJzdhvW
	 l/uOv8zNiimlvDGhPsiRUdZYn6bIIaajg3/bxlx5wPxd2NeTB2vMLekSJevC+NA6A3
	 OlWSdEUkvLI8Yq0bnudMvds+DI7ovTr/cve5h5JYVOHUjUUusFNfucPrG9bPGhpADT
	 RC/gObrH6UqoeM9E3A59xtmMT90Wj0aC4pVUluQtQSgBgw/eCbydgLwjO7WIDOAYZ8
	 6Tnvcj8mlXKDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dipa Mantre <dipa.mantre@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices
Date: Sun,  5 Jul 2026 15:57:53 -0500
Message-ID: <178328508288.1157743.9115805131090198438.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116599-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dipa.mantre@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DE3770B693


On Wed, 15 Apr 2026 16:27:08 +0530, Dipa Mantre wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices
      commit: d9b05c984304740699d7e47625d5e093b014c76b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


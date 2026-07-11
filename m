Return-Path: <linux-arm-msm+bounces-118467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d1WbNhNyUmp9PwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:40:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59C742320
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:40:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CMMZZi4r;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8ED9301545E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6A33C7DF0;
	Sat, 11 Jul 2026 16:40:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373D175A98;
	Sat, 11 Jul 2026 16:40:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788049; cv=none; b=TRTj6icYjflqwBFVqedW7mz0nxRVDRp9ifJrwOvpdlIFamXifV4PqqVwwO7GIaIwAp0ofQLConiwMk48FSRkoNzumOGiNU5cAHtmAfw2oqqint2vubDS/IQ2p6KvrcCohyAF/4H8UAKY6Ww+0ew1j5XW2MTvmPMugJ/nA6doNg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788049; c=relaxed/simple;
	bh=DkbF6FsyD6boBATCsY6ugJGzZ2/97+BBnZba1ri/aas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKQh2KLk1DOyKGOUxXCAfktTQq0jV3rNCj61iHN/goX/8A5ByGL0m7ftcTFr2LsCQTr9JEo2vB/COxC9OgVOVQe70xd8TB6MxnVGur4qkZqE+HJghS/1alODtsOBzfk9+RwzucV02IM2wvZ/cBnLfe8oTUP4V4GDsvZYdAOnRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMMZZi4r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8629C1F000E9;
	Sat, 11 Jul 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788047;
	bh=pKM4pvakO5SiHDc5KMHZHjgkwz//HxCUmDGbFQvqit8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMMZZi4rpHHYFODn+llPr46W9izZax5FZ7zZNhKISMtRRmq7fBQoGGrd5Ai4tNje3
	 6QSYGCtR84H4sggtzxY/FXKhZXL64ac/AOIXFkQe3rsjKa9iVSRSi3X9Xg5zYUaR0f
	 kZrCR6Wb5WmW7ItuQwfhlyK2V3fQjOewenB6BdhABnUCGoJeNzY5rgKUw/5KClUbmU
	 dsRkwMKdFGHTg5Lu5Bf06CYnIHYVH1NHN3iF5L2vRSE3MDnVNqWtEY/3jbc6Q7JY0A
	 TWgMrihVO/YzRuarxVLjU+oZ1ODADBpCGRnbxKYfO//OD+Fvu2r/+3Q9BOfKUW++qb
	 vcEBClV9edb4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Ajit Singh <blfizzyy@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sat, 11 Jul 2026 11:40:34 -0500
Message-ID: <178378800443.138068.8763713563230008567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624125443.18729-1-blfizzyy@gmail.com>
References: <20260624125443.18729-1-blfizzyy@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:blfizzyy@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118467-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F59C742320


On Wed, 24 Jun 2026 18:24:40 +0530, Ajit Singh wrote:
> Add initial support for the Vicharak Axon Mini, a QCS6490-based
> single-board computer.
> 
> This series adds the Vicharak vendor prefix, documents the board
> compatible, and adds the initial board DTS.
> 
> Tested:
> - debug UART
> - eMMC
> - UFS
> - SDIO WLAN
> - USB 2.0 host
> - PCIe
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
      commit: 36a8878d309b86538c6a71ba8e9a90fc74bf410f
[2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
      commit: 38547879cfcc85ce83ad2145dbd6a17da2094e22
[3/3] arm64: dts: qcom: Add Vicharak Axon Mini
      commit: 0cc8e47568df339adceaa0b0c6167c664daa88ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


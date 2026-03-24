Return-Path: <linux-arm-msm+bounces-99537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LQCGusAwmkjYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:11:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A971301931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 702B3313E55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A68338B14B;
	Tue, 24 Mar 2026 03:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwxVuRaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EE378D64;
	Tue, 24 Mar 2026 03:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321578; cv=none; b=OraFzUvqGomZPprsuQw8kS3UQ5ku6/Eh5Pbz6KKD8wQI9ALwlHQLC8uESFqfKrvw7j8aOjqa3CCb+Zs4kMFXCOqDBojH0BzTJXRWH//EFcQ+9U80cTKRBMwpPL5WmPoJA1HfxcPS2Y5YW+GOAjju0I9KakI6Qok/eN6+rSFaK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321578; c=relaxed/simple;
	bh=KpKBoBnsnUcWuAVS/8GR555Tr1BdyUcqf7SxT2r6mzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J47Vo6t8ryl3dfSa7QFjLRXqLIcMA39POhGdDEjAfO9wiakGC1KUb6B9JQgYCBwLHEtVleLvn5lEuLsjbstHfX7h4+poc+/7opiVqKCPYOEuX4rJvTFYdgYdBLGT0rtXTsUX1XITM4h9AzWi0saWKQT6H8lKfR030t+1VsMrKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwxVuRaw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751AAC2BCB0;
	Tue, 24 Mar 2026 03:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321578;
	bh=KpKBoBnsnUcWuAVS/8GR555Tr1BdyUcqf7SxT2r6mzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pwxVuRaw0zmM4BMZR4vFE5NHNSD6Pratm3BGBHSLZI5wh+PPXxfmxxe86PK/TZY3V
	 7PhLDPeo1ku7uZewgUClt4vlqmamy3+ueGWRU9qdPQqBQcnEIl8bvDz/bsOQ2GCeOi
	 wjUPqiuoBuevdzO23WhK+LsSo4UxsDjzLbr4iquCdeOW70uom45DqpY249sLdIpq8N
	 ELfFLhPSQ78o4/EBRnIRrKBmk1SFbdVq5z4Win6CsWeXmTyafQ+8oCnKVyOe5wPlzI
	 ee95EDXQ1MkfLK5cf2HYOcFSjrZxlA9BKPGI5dKZMSJsJq2ib5h/zLwwH3scXhPskN
	 61x3e3mfq7nfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk board
Date: Mon, 23 Mar 2026 22:05:58 -0500
Message-ID: <177432155627.28714.10035028614227662848.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
References: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99537-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A971301931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 16:30:17 +0530, Sarthak Garg wrote:
> Enable SD Card host controller for purwa iot evk board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk board
      commit: abbdc2876300a1e911b31e2c8e2e5ce77e14a65f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


Return-Path: <linux-arm-msm+bounces-106523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEtxE8P5/GkrWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:44:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA34EEDBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBFC313CFCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DCD495506;
	Thu,  7 May 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC8tPLN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5C495501;
	Thu,  7 May 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186098; cv=none; b=DWSx2gEICXWVngdeoQwQiTDg8dp0ChjHN4O+SDn/fUe1oY2i7GhDY7DDvAQiC2R6cZn3KlZR8XoMa6ok8KSDIJEAcjdbKXh7MMsYnIF8aPsQCnkKtRqvBP5L/8rFTo64yYdd9310xGEAQRvBOOsyZDi99AayO17d8iKDqBAJURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186098; c=relaxed/simple;
	bh=h62Q0FpYPFTRTCXVdAGxLgzYEwmPSuhgnH5p+uXsBes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCX8IKXMnruyJW9pm4IrSYelCf9Y9L5/1gtk6fC0oP6SfBzGgxGKrJSaVW3hAxPEXjxDT43HytwhshKRND53soHVKGFNH1Xaj4fXbe2fTu2UWOwDF9ZrzSMImM0Vs7OxN4ma8oqBPMo4yaemnNG9ju/F0ib8yuMSZJl28Gs4wd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC8tPLN7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FCC2BCB8;
	Thu,  7 May 2026 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186098;
	bh=h62Q0FpYPFTRTCXVdAGxLgzYEwmPSuhgnH5p+uXsBes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZC8tPLN7ZWDgpW2QlSXFvi8jD1JnxSnqAx9Gpx0wH1QNGLqAejzaxIrsbvmwPkpP5
	 l6ppOfyTFeLvOTnxVzkrjdgMp60Azm2yMx2OrCAE+/4W9klUYfmj+Kp605pY+it3ZK
	 rpsjhLll6wFvkcGoaAMiMBIb+OAWq09YRIHJe4tG2RlXnfrBbRc4zkI20CXz1s3Axf
	 456Ofd9hC7RNxgq4yYfhRpWTejC3JWQuHwPZP7NiesPJ+38/A2a5wuBOrVLCLJCxh2
	 yHomRmHxAxQVcobQDBrI+JU3g3n1ckNYx8sa2U9OlbAWWnyy2x1HVh+dnxuQ/o7ila
	 qwIAPIEmnz4ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add USB support for Kaanapali
Date: Thu,  7 May 2026 15:34:21 -0500
Message-ID: <177818606039.73000.16836662504744309232.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6DA34EEDBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106523-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 06 Apr 2026 23:16:10 +0530, Krishna Kurapati wrote:
> Add support for the PHYs and controllers used for USB on Kaanapali SoCs.
> 
> V1 of this was a consolidated series of many functionlities on Kaanapali.
> The first patch is patch-6 from v1 unchanges. The second and third patches
> are parts of MTP and QRD specific changes (patches 14 and 16) and commit
> text modified to indicate mtp and qrd specific changes are being made.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
      commit: 3d395de80a46cc2e046c106841c7aa4e1259010a
[2/3] arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
      commit: b2f036a675805812c475c917846320949c2b0c6c
[3/3] arm64: dts: qcom: kaanpaali: Add USB support for QRD platform
      commit: 01d15f5f69964de3d947abb5e4c550397db68c70

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


Return-Path: <linux-arm-msm+bounces-107195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAQxDFGNA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:28:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E21AC529249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE684308B870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293B3D3301;
	Tue, 12 May 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRKyMXlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8763D2FFB;
	Tue, 12 May 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617430; cv=none; b=OkmAlchDP0gkBebuS+4dFfhI8Bgzf9qnAbwlUZU0XFocC7i5VnH02+GWQqJ+JgTnBYmkGroBA/SO+Hx6mYLR6pHHTQxfQw9BpcAl21jXHLzwE1njyM9u4gJmW2KZiHq0CDe06nvRtWgh0RTitcC3N655W68C3p8s5blKQRA7IrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617430; c=relaxed/simple;
	bh=nbSHQv8gW09vuTpaCC2+Tzw5q2rxQPlFOnvJh0Dqw8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZO2a8mwbGEIk8I2zEmoWtG7zszoyzMm5tKYT0z+d6ttqUCSw+ft1GqfC1Y4jOP+Pq0EZOQBUnD4MtgD5cyXtrRmwRzpPta74vWdB3hBqYB85JWqCN7wwg89LdM6njV1+hFsq89aqJ/gt2j6iWw8ZrRbFKqf9mxGfNhXtjKz2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRKyMXlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AE7C2BCF6;
	Tue, 12 May 2026 20:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617430;
	bh=nbSHQv8gW09vuTpaCC2+Tzw5q2rxQPlFOnvJh0Dqw8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XRKyMXlHinX1lzz0ZzMsPgt6yse258Rj4LwRoV7IomLPKhKpBW5GItautR0+FqoGJ
	 oyWOhh3ZQ+rUJtedroEDCBbRtL74jPW9ztLnAQZjNs3B7QrVRAJ9/O8230eFu+wuDh
	 nh1F/jdX6BrDHM8iPhf9Ib9Jg6yJfbRVVRKAWhOfPbM7Mj3rFA//73IoLrxTqou/KM
	 KNMStV0KsUlRzW5ntu9aLuDNNycwZPfL7irQ6vC9ExSpbLVieLIBWcHZZZ/NcXIoEH
	 64aGkRbvva5blhu2rHjXb8b5QJ53lqLAU4X2P/Qw9Pk9DulelAMDXSlaflIPI7xlBq
	 8jbhEnBbJwDPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Tue, 12 May 2026 15:23:02 -0500
Message-ID: <177861739362.1242344.10016245485746063538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
References: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E21AC529249
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 09 Apr 2026 11:01:54 +0800, Le Qi wrote:
> This series adds initial audio support for the QCS615-based Talos EVK
> platform. It introduces the GPR (Generic Pack Router) node in the SoC
> device tree and enables a sound card node with the DA7212 codec on the
> Talos EVK board.
> 
> With these changes, playback through headphones and capture from the
> headset microphone have been tested and verified to work.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
      commit: d962cd7c49fa210e53dfeed04028ac9ef112ae70
[2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
      commit: 141d7ea5036e70f670aba1e6704be74552a3c964

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


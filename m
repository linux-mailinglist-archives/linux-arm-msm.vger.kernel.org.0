Return-Path: <linux-arm-msm+bounces-96438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DsRFc6Gr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C024468A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A93A2300E716
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B84633DEC2;
	Tue, 10 Mar 2026 02:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVYOWHrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FB1386C9;
	Tue, 10 Mar 2026 02:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110802; cv=none; b=fcrHrU0r8sBFlxUCL0yrIQfQkflihqqde/Y90dA8MdFEJe2CTX4sHepWrPN4d6afyQADW+H3ZHIUdTtGc2xXiUfTSQwRqAh2KRudfVY0REQIyP8HTq76K3m4v2B+Z7yNIwX1u6Glsh8EoUscZL++IzpD4fd+CgzRQ/LeaTBzo8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110802; c=relaxed/simple;
	bh=06niMJWFnj07nxKmZpzR2P4gqLeBZSsXsNCFmMAhEEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3B41PFxwU6Q9vWkBgxG/wM556IN/D/zsP+6ueec2NX3i5j9bIvSUQBEK5o6KMAH2MGlCmknuWJad9R4OmqsarkR8bc46B6V6JnRAiSSz5onC/CZxfDzWl7655TldlBoqtzZQFkZLPBijKuFd27eAxJ1HTzxfpn5LD7LqlDFA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVYOWHrp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575C5C4CEF7;
	Tue, 10 Mar 2026 02:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110802;
	bh=06niMJWFnj07nxKmZpzR2P4gqLeBZSsXsNCFmMAhEEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uVYOWHrpVdPO2xweccL2uIahSSXucitXbI0k8SrdCS87n3pBaUunTcpejb7+oL4ur
	 HWIRFMzRkAALPiDlvJ7bP351EYQsMCN5gvBbAhc0pakZxvtP5INfMiJw7zNs1K3r+N
	 UzmrS0ro4Els9wmBJczIHrLQSnS1AzpYBEYn/iCTUkLBXhldtBNMJsZAwh38b/u1K0
	 i6vFFS6BxD1hBSLLKh8QsCN8nfdoTqkqC54uh2OTqwZ2lzQttaAIWmyPCjSVLybH9M
	 MClNagpxXnfVhOECddNHabyynnWLYNGw1wlUxzVbd2AJ7kGubb8xDV4t6Y+BELrYmK
	 JzQUqHLs9FN8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Shimizu <rosh@debian.org>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DSI Port B input support for LT9611 HDMI bridge
Date: Mon,  9 Mar 2026 21:45:27 -0500
Message-ID: <177311073305.23763.4962748708227215164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA3C024468A
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96438-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,thundersoft.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Sat, 07 Feb 2026 15:32:53 +0800, Hongyang Zhao wrote:
> The LT9611 HDMI bridge has two DSI input ports (Port A and Port B).
> The current driver only supports Port A or dual-port (A+B) mode, but
> some boards like RubikPi3 connect DSI to Port B only.
> 
> This series adds support for using DSI Port B as the input source by
> utilizing the existing ports mechanism in devicetree:
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B
      commit: ebcf2240a2494faf202ce5ec80ef159a38b1e542

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


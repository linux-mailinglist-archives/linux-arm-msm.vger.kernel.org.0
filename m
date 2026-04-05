Return-Path: <linux-arm-msm+bounces-101885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBMlHbC70mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:44:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E639F938
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A8930484C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D0C35F18B;
	Sun,  5 Apr 2026 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAiorilD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA1E35AC2F;
	Sun,  5 Apr 2026 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418044; cv=none; b=Gf+pwuoFZDywZQsZWWA14UxhkQmS07uJLZ9U5AWrQaktFilIbeggxZR7PQjTfy8WC9LmQN2o80a6BHzyEbprPH6a8tPQCTACSgUC8BH5Qzte4G0yhvCDbdcQmSarX3ml1NUz4S218/8+HDP57pbf1OiEMwIW7KUSrY7ZnImagFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418044; c=relaxed/simple;
	bh=s14akoiYE6AItWVTCLfNsOj1qvKu5inJeD00kzVA/Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZzk+4cjRQKGoajQ43A/08ClchYaJEyiugqiftjH53Urnf2D7hj5WRLksLCBGtYCkIbFrv1XWC0dSd9XV4weYq0S1p7LCLxgU+5+WiuPvv/0Brzm+jmPhhN+IZMYK7jGTWcm5/DC9Wrzs8QD9KbWMsq4qPpKJF44eFoFuFbY/oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAiorilD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD56C116C6;
	Sun,  5 Apr 2026 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418042;
	bh=s14akoiYE6AItWVTCLfNsOj1qvKu5inJeD00kzVA/Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAiorilDO4IghE7Dz7APuREAw7VjTnqXpg7RBgxuUgIpTfRstB+5hG5yHtiE3/apR
	 +Z8krvSJfwOg+l5FxEF8eq29S6nKkpBEWdh8Q/j1hE/L891UFjGKsgzyQzjmygyi7v
	 7sw9THHB4j3K3OQMZgoJPd3DftJoE/vBhIJ8ZFBOfYCMLz5DEk7shFaFSpQTrtBbhU
	 pixvOadIVp4zQ/qVF0Daj4/eSD/vYKDHAOwyey7uaJYBPVNqfSLw2q6WO2GA1kDQKv
	 f1mletfaTSzYTAcFCQER95syyiUvFPD0XiR4nemkV0I0LgwEXQBsNp42LBLqXWeikN
	 MaXN8UUaBslJw==
From: Bjorn Andersson <andersson@kernel.org>
To: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Enable QoS configuration on QCS615
Date: Sun,  5 Apr 2026 14:40:22 -0500
Message-ID: <177541802152.2061229.9414750574233334991.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
References: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101885-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 197E639F938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 16:05:45 +0530, Odelu Kukatla wrote:
> This series enables QoS configuration for QNOC type device which
> can be found on QCS615 platform. It enables QoS configuration
> for master ports with predefined priority and urgency forwarding.
> This helps in prioritizing the traffic originating from different
> interconnect masters at NOC (Network On Chip).
> 
> The system may function normally without this feature. However,
> enabling QoS helps optimize latency and bandwidth across subsystems
> like CPU, GPU, and multimedia engines, which becomes important in
> high-throughput scenarios. This is a feature aimed at performance
> enhancement to improve system performance under concurrent workloads.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: talos: Add clocks for QoS configuration
      commit: 9b7d6b6c5cef6c578e976a1a605985c255779327

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


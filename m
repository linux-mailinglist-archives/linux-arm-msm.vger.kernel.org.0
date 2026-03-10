Return-Path: <linux-arm-msm+bounces-96442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGISDzeHr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:51:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34A24471C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E183069D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CE93AA1AE;
	Tue, 10 Mar 2026 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prfxaqRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4282F3A4F49;
	Tue, 10 Mar 2026 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110818; cv=none; b=FFN2aQFzDLD/5U9fVnQa8R45f7v7MhjcTz7mrXUK0WFo2K+alHV+8+1VIyyJIDqmqgYou0S9YbHe8431D7JpEpsXIi2ELfRW0F8ghItxgx5U1/N3xC98SB084XhQgrBWNNHRYTI27RuQbssqZ+nl0f62t1rxBXdvTtx7PZLILfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110818; c=relaxed/simple;
	bh=uVGmmiid7oA5uTt+Z55TPAl+BZtpVzckNaaKuI5zLRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XalrP4Wg5OSqu6mGhBRyqQczNGatgt2P9DnL+0n+J9Ei1RYsTCi/o+/zUCEDfzRVh9IJLDm0vfAohXpv5T71RNGSLPMJcPweT1EskfVh0nzB5/gwqn63WwFqm+w8RdjQT9jY05q+GqdzTa8SKdDhfi+h38NFtFtON1OQB1gxtRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prfxaqRN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32526C2BCB2;
	Tue, 10 Mar 2026 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110817;
	bh=uVGmmiid7oA5uTt+Z55TPAl+BZtpVzckNaaKuI5zLRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=prfxaqRNiYUbYGbKbn1+ktCMTjO2FhGzSSBGRCPh16/hfmPL3smEFEXJXaB/7GOGd
	 u1aEjjGEaHn1Ve+5qfp8ZF3sBC4D4lqtd7E6Mn6dwA/dpioIt+yo34OXWSgMUrWZ3i
	 U+p5ugiX8f4wq7GRDyddY+FShPdqstmdo2Ss0VO4Rve4ubLPrQxg07OPNkrTimgRVA
	 nefL4thD2OIAeRwGNfoH8AcVX7Tm7Vkyckx6v4RNY99m5XkbXLy+V7QCTRmZhFmKUA
	 LwhFJvaDcT4FAtn4ZeSn4j/eyxrENSzfo2PjyMfxJkq/7cJ+G4zz8WqWGNNjhL8t7I
	 /yZrVsA/CvByw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] DSI byte clock setting fixup
Date: Mon,  9 Mar 2026 21:45:31 -0500
Message-ID: <177311073297.23763.17772084203065134209.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CF34A24471C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96442-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 04 Mar 2026 14:48:26 +0100, Konrad Dybcio wrote:
> There's a conflict between the byte and byte_intf_div2 clocks trying to
> set_rate on their common parent. The latter should follow the rate of
> the former in one way or another anyway, so the fix here is to prevent
> the latter from ratesetting the upstream PLL.
> 
> This series does just that.
> 
> [...]

Applied, thanks!

[1/5] clk: qcom: dispcc-glymur: Fix DSI byte clock rate setting
      commit: 98ea9eda030587601db56425efcd32263d853591
[2/5] clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate setting
      commit: e892f4e3f3d558ce5d7595dca7cce2bd170a19fa
[3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate setting
      commit: dd5b76257b4048151006620c9895e2f5f0d997eb
[4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate setting
      commit: 7bc48fcdf9e77bf68ef04af015d50df2a9acac00
[5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate setting
      commit: 2851b6c6a42e22c243aa4cd606a49e2b9acfb6d6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


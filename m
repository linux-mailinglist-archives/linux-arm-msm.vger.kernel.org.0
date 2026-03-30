Return-Path: <linux-arm-msm+bounces-100825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0As+O+Kfymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:08:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221535E682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E5F3075EC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A56376471;
	Mon, 30 Mar 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0UuEGI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39775375AC2;
	Mon, 30 Mar 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886508; cv=none; b=p3RlZvO4DE36yfYPapYm5shmlSAh0y4stbEkKeR/TAa6fsUpDO+CoEs4NI5xdkij9BDw8fKGcW0jfocVkSM6ikC6ByzlgvrfQQImZNaYd8rg75RLqT6caqC+RuaPmHXkaFj+uI5aUGxWGq+jBIW5axU53TqfGxq4vpACsNnH+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886508; c=relaxed/simple;
	bh=OXuMsa5n2Xm/MI0IxFyk8N0gF9byKUiTVNZlEV+LcuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omSk/EXGzKxRC2K+P+vcRZPAUT2go55skEBt5OqQoWzRV8JAE17JJFTdg6AYrYP9suiGziqWrDgcd3lSmQfilFThIu+0sqzXm3etEjPQFlP+wibFEVsOiXiHdAgidF0L3MegPyk+tdY70BIE7sKSIbnPggprn/rOx5ddYn7f8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0UuEGI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7377EC19423;
	Mon, 30 Mar 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886507;
	bh=OXuMsa5n2Xm/MI0IxFyk8N0gF9byKUiTVNZlEV+LcuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0UuEGI0jABnNRrXlv4iLb93kRFcuQ8G3Sluf6kHe18VDty1zvm6AXK8kGagwg5Dt
	 AP56FqNfwHagcsOSWDirCbPdQalO+Vi22KeWWkPgJjP+aUFpaYCT6mZ6Ab3RfbpwQp
	 Q0b85fn52jdtK499HkgS7Shn0CUpUg1hpNPWPu6zgKVkxjlOQT3ZK8UH6GjmzGF7YS
	 AlGtFhZhRH1KsZt0DSvxjUT/R317hBfcFeB4DlyfhjnNqPNWDePkfNMY8ndARIOwsa
	 aUlZYs28C4NHd05he1Cjk3w3xLwzh6n/+9FMpYuSfXwSmasSvSbh2Z2Y/Ol675qXMa
	 x6jSYTD8Tq+hQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: milos: Add missing CX power domain to GCC
Date: Mon, 30 Mar 2026 11:01:06 -0500
Message-ID: <177488647757.633011.15043645952501993441.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100825-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 7221535E682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 14:13:39 +0200, Abel Vesa wrote:
> Recently, on Eliza, the CX has been tied up to the GCC.
> This leads to dt-bindings check failing.
> 
> So the schema needs to be fixed. But the schema is same
> for Milos. So instead of adding an if-clause for Eliza only,
> tie the CX power domain to the GCC on Milos as well, for the
> same exact reasons as on Eliza.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: milos: Add missing CX power domain to GCC
      commit: e46b48b853122626806d989d5db4ce97eaaac2ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


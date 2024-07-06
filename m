Return-Path: <linux-arm-msm+bounces-25435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B63929589
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15EA0B219DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FFC146D59;
	Sat,  6 Jul 2024 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcgBbiKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EB2BCF9;
	Sat,  6 Jul 2024 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303304; cv=none; b=kD29kplYJhFFwxxwnI0dV/tD92KY9wGeT/Y3wojQXdg1FxyIG1euFUW/OEki3n/PzoPfS8Z94JKyy5NcVziDdVsD/b+J92P4O4OP9/2Qv98VDRRTZFLctxrgT6gDMUIXnTjwhQV3Cl9L3uP36WCQQMAV6lMCMe8z81jgtAixTQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303304; c=relaxed/simple;
	bh=4RNuJ7x9wqIDUwrus11KgAmxZ8koMeKy8khMbeqi1gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9g7PdWCNTBc8dm+jEP/XTFhjJZPEdkwePfN3R/7Cc9iwIb2I7g1ZvFBo3KPvyiD2HCDa+iAC1ddb0zPD0Ong4h02Z523+zWHHfzt9Fu0TIqhB5Cyl1cuJLIaY0rSAkrvtN481YKWwC8NS/x6THQCcqh3gqYeq7sQHlSHCSvlBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcgBbiKk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03D8C32781;
	Sat,  6 Jul 2024 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303304;
	bh=4RNuJ7x9wqIDUwrus11KgAmxZ8koMeKy8khMbeqi1gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pcgBbiKk0YTtSOTMzgNSzDQ5m1+Wl4k7izgB3YBCkNvq6QLv8VUCzJuERto4evrb+
	 NHVC2E1sfFAxxdqeNDFt2yFm/wUFmEhX+ffwY43VGEmdUMpKT664LD7TpwgMalp1Mt
	 jfo4wdUHkEYR5UX57B95nZ2jTO7PlRpikv3p488KKqsxQvKDpQAyPggLnYObR9uzze
	 NeIc7HuPpIDBGkc09jPLj3wuGSp+6yhjfb9GjKex/+eBNzgYVuRPBBCdFjqlz5KtbL
	 xIV+yp1vjfh1s1989Ird5Z4eY0qk3XEluNhikisjGinLvlFch+u9KOyILYUXNOQ+Sv
	 RbHB467ltRRUA==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Sivaprakash Murugesan <sivaprak@codeaurora.org>,
	Andy Gross <andy.gross@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Iskren Chernev <me@iskren.info>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 0/8] Disable SS instances in parkmode for Gen-1 targets
Date: Sat,  6 Jul 2024 17:01:26 -0500
Message-ID: <172030328808.28909.12287943929043586307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
References: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jul 2024 20:58:40 +0530, Krishna Kurapati wrote:
> For targets that have only USB3 Gen-1 DWC3 controllers, it is recommended
> to disable SS instance in park mode to avoid HC died error when working
> in host mode in situations where the controller is stressed out:
> 
>  xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
>  xhci-hcd.12.auto: xHCI host controller not responding, assume dead
>  xhci-hcd.12.auto: HC died; cleaning up
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
      commit: 4ae4837871ee8c8b055cf8131f65d31ee4208fa0
[2/8] arm64: dts: ipq8074: Disable SS instance in Parkmode for USB
      commit: dc6ba95c6c4400a84cca5b419b34ae852a08cfb5
[3/8] arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
      commit: 0046325ae52079b46da13a7f84dd7b2a6f7c38f8
[4/8] arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
      commit: fad58a41b84667cb6c9232371fc3af77d4443889
[5/8] arm64: dts: qcom: sm6115: Disable SS instance in Parkmode for USB
      commit: 074992a1163295d717faa21d1818c4c19ef6e676
[6/8] arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
      commit: c5d57eb7d06df16c07037cea5dacfd74d49d1833
[7/8] arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
      commit: 44ea1ae3cf95db97e10d6ce17527948121f1dd4b
[8/8] arm64: dts: qcom: sdm845: Disable SS instance in Parkmode for USB
      commit: cf4d6d54eadb60d2ee4d31c9d92299f5e8dcb55c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


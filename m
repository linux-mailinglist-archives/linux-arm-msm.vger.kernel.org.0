Return-Path: <linux-arm-msm+bounces-54860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61613A952B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 16:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E2E3B5022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 14:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9409A19F12A;
	Mon, 21 Apr 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBCDm862"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672EC19C54F;
	Mon, 21 Apr 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245534; cv=none; b=hfEwTYVHD2U2UH+x/cs+InwECOV6dO/0ET319yGL5HcrjyNIGwlS94WLWOpyqnd4/jPaNRA/bCOaKHHk05TDro9p0VVxSheT9JwSzFWwKGiKdFD5HIV7rU4tobyz1NCOej/i+rytCvYSg2klhmOzOhgriuevw0PF2UC5C2ow7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245534; c=relaxed/simple;
	bh=skd62dpalLZWXUJdiKwpfIWagvy4y2K58d26DVJQPmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjCyuINL37NPDgNw2FukYRI5W+tSPWTMcLcbPoa66dgX05/q3kiZFKPsRESrR6s2ANJ4yioblNXa4wirLzU1llhthWdLw+yzqnSM0WQTFOQ1DTOomTy2l//uj1gwNA6B3ToIxKaoXzavwUf9IdzQsTSnmqo/DNgwyBmtNcxSZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBCDm862; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE73C4CEE4;
	Mon, 21 Apr 2025 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745245534;
	bh=skd62dpalLZWXUJdiKwpfIWagvy4y2K58d26DVJQPmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBCDm862HfvLbG5MdyF7ibjhjR7GXh9emTU72wb4IFAlKMj2UHsURKdvlyPpie35v
	 G3/4sHVxNSYjY9T1l5Hdkv09EBt/oe30m5Kp1RJOPqKVIB26Cvi+GOZ9keJAz1V8ZS
	 puzV1Jendi/tL2mL2gRV5B0N6vacT8BpQkLnwdTJ+cjTR0+yY9f4FxSXnaP+OeBSjv
	 +g/67HCLGaaXPPLO5QmodvVjJzNbdIrlawHA9SDGmFTLk9zOWdcya2VdL7SbotogNI
	 IoxmyGx+v0VZUfkd8rLps1HoUne+qZngDQt+D0Ap6gQoBQNgFwz/AKDAnowMCmX+D9
	 lYgBFw+xISlkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove invalid bt-en-sleep node
Date: Mon, 21 Apr 2025 09:25:29 -0500
Message-ID: <174524552573.708487.4711929802014076756.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416-fix-omnibook-dts-v1-1-2409220a7c6f@canonical.com>
References: <20250416-fix-omnibook-dts-v1-1-2409220a7c6f@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 11:13:35 +0200, Juerg Haefliger wrote:
> Remove the invalid bt-en-sleep node. Not sure how it came into existence
> but it seems the functionality is covered by the wcn-wlan-bt-en-state node:
> 
> 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> 		pins = "gpio116", "gpio117";
> 		function = "gpio";
> 		drive-strength = <2>;
> 		bias-disable;
> 	};
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove invalid bt-en-sleep node
      commit: c9e3129720104ce9f8fa556db9d83cb05e527bbb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


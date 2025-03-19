Return-Path: <linux-arm-msm+bounces-52030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC7A69AA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 22:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B50189C212
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 21:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358E41F099A;
	Wed, 19 Mar 2025 21:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NKKATCAn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z5NzrRAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37A213232
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 21:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742418658; cv=none; b=VXg/w+g+EyP8GgVvgvlKLKy47z7mDH/XbMRTQ3z3bgPErBw6aVRI1GxU8fozkgDzZCNS/wnFd4wIVf90OY2PyI77ksu4VcSSJZwNukfS+l3/l8SCE382j3g4ueZyBc3p39zKoAScrDsx0X0MGMJvaT/qP0aWwu2RkNANtVNg9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742418658; c=relaxed/simple;
	bh=MgD3HLY2HGIP0HqnoemlcRxxKSFENiGEGKcBl0GOzPI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ds1ejl7sHj31vMCc3ieFRNcYqGrTUt+m9YaY+FFC3+ipm6Om2XgoIVAunJoTCoznYhY5NlG35dIFamSRXUj6QS7ZIC2SEJEBxl9eUtOQ5hA5o9s/JSYQt6sBU1vRvHRN/X0TdYOlELVbak37lhPA5bZXNjM46A8T4FEA2ms4CQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NKKATCAn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z5NzrRAA; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 39ABA1D41694;
	Wed, 19 Mar 2025 17:10:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742418653;
	 x=1742425853; bh=W/CPU9v6dAGBa5E9dwjyEzCj7Km+PD0nJH8uf/bu4jo=; b=
	NKKATCAn0VX7Ihv8xuf0fnvj3bsQiQRRutFV6XkWJ65/pq1IM7ThfVy33XYOSJHt
	dTDVg11aJs6+wHWPjkTwKztahAbtZfGgYI/Q9R0oVDlJb0PyuAukPh72Aw4qu0LS
	hZaCF0F5kqgavg/UgZuqAPsGuIG2dLI2E9mdvMttzItimqPxrAYFHoYQ0LLQ2yvT
	JlEZ3qmhFBW5gVKtkqca3GZ/V0qr/5gq8Zpp8U/jlRqrlSQ7KqdJskc2/3CyFA9I
	GaTaT9htC8gHzQp6n+EtcGEAEOmvdSzI2Ruzk/kdxk4FDfX8FePSP1G7kFUeyE4g
	3fy4xGqdZFDKu9ewGeyHqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742418653; x=
	1742425853; bh=W/CPU9v6dAGBa5E9dwjyEzCj7Km+PD0nJH8uf/bu4jo=; b=Z
	5NzrRAAgQzF65e6QYHOxMfnHavEdq6p0phDF1GDyt0rEeArdNaTBDLRpZrIVg2iM
	YNlJuwL6VFyQkhfyG6jyraO0G8KanVyapFXV2jxJCGDKXyVkPnJ6nYmEMEjCyHMc
	i7dvwasL11mVWV/XdMlR67/wylB1MFcO/cNEL0YrEwMxRGmARJhjbUvuLDHrrM5G
	QmOLjoZEkHWXkP2rhs4v39PbM4hrBiEau6hGWbcsxxRHyI1infxc4Qc04hY/jJib
	tbykM6tdlalgl/dki7SqjkqC/rhEIvMQNC5bhSE8+aA7TY3vt4r7J1MG/CK87RUY
	MmLkcbhcUl/JbX0AGR3fQ==
X-ME-Sender: <xms:2zLbZ8TYWBr923ILGRDI4nXzyCFBKFUI9qP2-kpihxcdNzLKPwZU0A>
    <xme:2zLbZ5x_Oh_JENN_Y10KBTs6n3d94KDEk4kWEiY1h9bwfCQBAWgZ15iSE-f8QEmHw
    _ItovvA8C-4bqbSpnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    fedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehluhgtrgdrfigvihhsshesfh
    grihhrphhhohhnvgdrtghomhdprhgtphhtthhopegrlhgvgidrvhhinhgrrhhskhhishes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmihhtlhhtlhgrthhlthhlsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepfihojhgtihgvtghhrdhslhgvnhhskhgrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrnhhilhgrsehjihgrgiihghgrrdgtohhmpdhrtghpthhtoh
    eprghmrgguvghushesjhhmuhdrvgguuhdrtghnpdhrtghpthhtoheprghnuggvrhhsshho
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2zLbZ53Vvr2l6NIOm3qKZGZyvVj-CyCoqEwprSlhiIi_9rXNm9SFmA>
    <xmx:2zLbZwBuy5UzuJ3S6L-dwBAver38lEXufQES6EfCaHYLBmO8XQfZrQ>
    <xmx:2zLbZ1iatTC3rBPg_gDfxAFQUdiKwQe9GR5ePUCssPi2ixaUYZsZrA>
    <xmx:2zLbZ8pjBAAMXHJ4L6Kw2yipjWmIv5bol3F_QuOtnErVO_SzuM4q5g>
    <xmx:3TLbZ5A9xvJcehRcNbNvP1fAi4uRuiZm9MbXa3iN9Q3C1txCmT0H9S7C>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 933112220072; Wed, 19 Mar 2025 17:10:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tb672cc3182dc66af
Date: Wed, 19 Mar 2025 22:10:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 "Aleksandrs Vinarskis" <alex.vinarskis@gmail.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Pengyu Luo" <mitltlatltl@gmail.com>,
 "Alexey Minnekhanov" <alexeymin@postmarketos.org>,
 "Danila Tikhonov" <danila@jiaxyga.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
 "Nikita Travkin" <nikita@trvn.ru>,
 "Praveenkumar I" <quic_ipkumar@quicinc.com>,
 "Tingguo Cheng" <quic_tingguoc@quicinc.com>,
 "Cheng Jiang" <quic_chejiang@quicinc.com>,
 "Janaki Ramaiah Thota" <quic_janathot@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Lijuan Gao" <quic_lijuang@quicinc.com>,
 "Luca Weiss" <luca.weiss@fairphone.com>,
 "Mark Kettenis" <kettenis@openbsd.org>,
 "Maulik Shah" <maulik.shah@oss.qualcomm.com>,
 "Rajendra Nayak" <quic_rjendra@quicinc.com>,
 "Rakesh Kota" <quic_kotarake@quicinc.com>,
 "Viken Dadhaniya" <quic_vdadhani@quicinc.com>,
 "Wojciech Slenska" <wojciech.slenska@gmail.com>
Message-Id: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
In-Reply-To: <20250317215921.2031880-1-andersson@kernel.org>
References: <20250317215921.2031880-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>
> Krzysztof Kozlowski (17):
>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
> sa8775p: add QCrypto nodes"
>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
> qcs8300: add QCrypto nodes"
>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
> qcom,ath12k-calibration-variant
>       arm64: dts: qcom: msm8998: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sc7180: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sdm845: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm6115: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
> qcom,calibration-variant

This seeems to remove the properties that the drivers expect
even in 6.14-rc7, so the branch is currently broken and I'll
skip it for 6.15. Let's see how we should handle this properly
in the next cycle, since it's too late now to fix it.

      Arnd


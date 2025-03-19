Return-Path: <linux-arm-msm+bounces-52031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68692A69AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 22:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9B117AB668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 21:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798271DF26E;
	Wed, 19 Mar 2025 21:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CVMaodeo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZoaMtmrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BE3219A6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742418724; cv=none; b=r/hqcPlLi5b2XJo8N6g0N9HVQ3/LgbfcRLGPbWtcOXCuns+z6wIJE2yuPcLyQPEutFDrGriJ3KcbNbu/VcPoE7XS4n4yv54mxAX3dw43+IeQnKNF9cflURJXhdtEFEjJRNXLux6rx1uS7P/Cv9DpxiPu6RJ0cHR6QeV7JAXFs3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742418724; c=relaxed/simple;
	bh=GOkB4PD6ye9AY2Ivc72sgBqrAR26YFHLtLzAVEtXNa4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VfCiAsKMLd92yGCxCEOpSHhdqHd0INTnCRfRx36y/13V6egY51XH3aAnd9fYGnkQ1anHYqIHoIfFIxt4gEEiIZEm/u+ZS1YeFNGyC4UeLycYCcc0t9wuV1FfANOwa1wW3fM1gZKYeMe6PTFPoWOQI+DWCKsfLrR9vnbafcTz19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CVMaodeo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZoaMtmrs; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id A598011400E4;
	Wed, 19 Mar 2025 17:12:01 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742418721;
	 x=1742505121; bh=W+rvv/CD9vxLz7lV/reT4sf6e2D22+QxuR3L49Wvlok=; b=
	CVMaodeoCrj9PJuR/Fn7jstiwU0oDDK4F07puUGNRMN3FsD/+Usnx6DUpzs+qVT0
	ffTf4tnjQ6ojHHQFr3aMk6MTnimJdCM+H/z/1j9IQ+ePE3BO2Blg9nh6YFFvZXs4
	WyrAJTGRjEfJkdaaIh1G4Oe0KznzP/nz7ASjuVt3kl3qT0vdNsa1bd60TsCy3/1d
	aDdlDVNa3x7vFHcAdwgZJJE58ygDR5ZQF0GIBFqHedgjT7+OGXi0Hd7DykDxW1dF
	j3mPRLSD0/4ZA4afCF7zUvI1K5dpAINIkNbZvfMNuPEPnHatH5iARuuq/tBKZ7O8
	l8txlm5B8fp70wMFi4uRBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742418721; x=
	1742505121; bh=W+rvv/CD9vxLz7lV/reT4sf6e2D22+QxuR3L49Wvlok=; b=Z
	oaMtmrsjcpU/JSQ2BB4JFcVkE78+aCeNBpZbP7KA+mwwWcf8VNQdjwuix7sCFUsV
	ck8YwhaS+WzMc5SgnKrgN7shVxlkkKs9oWFOUKUMiCud2u1gBg4QkBcn4pgsTo1A
	VLFp2a6Y9NGHcERFG80SLyjnqp1Em9+q58ZRlCdOJi5ZeW2I83RdboQtpfJ2Ewbw
	uIM2Q9Mn2S/a/cxrN+t0qIh0RDIMUf3TWLlzTXsAH8yARcVmhQmOlpgLNySyonFv
	UCRHmjOoUv1Zj+f7WmIIFBqxjancnE4JcFFPlpLwmBcNkptXlGa04JYtc3LG+D3E
	4C3Em/gUtaJGRD/SDTLjw==
X-ME-Sender: <xms:ITPbZ9Jzs85nCNESZ2qdgR0JP32GmPT47YfEh7RIKCgZ9lL0z3p7BA>
    <xme:ITPbZ5IYBWZm0JmnCon87fJ9bTx4m-RW1070wOj2qI2Sm_EuP6nyenbXh1S6XVyw7
    CjJPHXSeeUXp_CT7kE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkh
    hoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epqhhuihgtpggtkhgrnhhtihgshhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ITPbZ1v6Nj6qRgtdx62zADek5hLjortgoTmChHNRlt5EYY0XEK3bBw>
    <xmx:ITPbZ-bGHd1BcWZa3HZS2lnGezc1oMlqeLienbaf8FDvNHJhU324tA>
    <xmx:ITPbZ0YYrPIUhuPTY_F3M3l_PDBxVcRF3dkdRryRgLDHeXP0UJxVVw>
    <xmx:ITPbZyDWg4bCf4b0hEkAAPG4cCluN3OQJudocg554wP6mejhQ7bfEA>
    <xmx:ITPbZ5NxDck9wB0wRFkTwR-pS_ds0AdxuwbyppQmCmmzOteK9NVggMfP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1BF412220072; Wed, 19 Mar 2025 17:12:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T49c643150bbb3781
Date: Wed, 19 Mar 2025 22:11:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Sanjay Chitroda" <quic_ckantibh@quicinc.com>
Message-Id: <e817e828-7ffa-4114-b957-35552cb16cc3@app.fastmail.com>
In-Reply-To: <20250317213630.2029212-1-andersson@kernel.org>
References: <20250317213630.2029212-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025, at 22:36, Bjorn Andersson wrote:
> ----------------------------------------------------------------
> Qualcomm Arm32 DeviceTree updates for v6.15
>
> Cleanup indentation issues and a deprecated WiFi property.
>
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant

Same as for the arm64 changes, let's skip this one for 6.15 and
do it properly next time. The branch in its current form is
clearly broken as it removes the properties that the driver expects.

     Arnd


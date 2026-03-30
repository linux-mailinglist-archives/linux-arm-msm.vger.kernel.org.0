Return-Path: <linux-arm-msm+bounces-100856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jqKmDA+jymnj+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63A35EAE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D60DB3105D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747AD3DA5A3;
	Mon, 30 Mar 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE5Qgeuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF23D9DC8;
	Mon, 30 Mar 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886539; cv=none; b=eOOTWtLIYjrlhwjNOKaSXr7azyHCQ7prARuJTFIf+RDql6mOn4AIqc8DpqgWg36XmaJwxfd7mzk4Cz1pKSZ+xTHe+JfJXeKI1x9uRwTQIyDx81gFA3z0ApXMsmeHVhvEJ48LQ8mUcvJCxoGrHWSHzVVervEi2lYc4IHh4dKzwfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886539; c=relaxed/simple;
	bh=xKRk+5z07NNFWqSLPTnCI8pn6XqNUxPH+058mZEVQF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xu9Ik8Ui+fL5+4VdEWqH2GF4k5jFGup4PGq4fT5ieDD6cdRHqFP0mmIJs095INiwsAU/J9nwVOwHVaYrsZb0XDP9KKzozwVwO5Y2dsv16j0oKVntebwA5t7AaNvulHki2uUpXtG+7IK8XFfynLd2wGMQmfS9yIgHam4YL9qZR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE5Qgeuy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034F9C19423;
	Mon, 30 Mar 2026 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886538;
	bh=xKRk+5z07NNFWqSLPTnCI8pn6XqNUxPH+058mZEVQF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CE5Qgeuy4eliuvLT3EqzrnM/Db1Ff6HXj+LLTMsuc1eL/XebAgYvXTHsT4kUvrbNE
	 5EuFGZPmDDKuV1ymmSGeCTuJ5QiauoE15vErXQC2QhlKrB+I+QaYbI1a6UqBmRHT3s
	 KD7UDOQlMqrYQm7ZN7sQcRurgTznIamBj/JfeMjc6PWpiKHJZML28Fbk0S7eyw78QM
	 ofGCVtnjBxosnpk1TM/+dvda7LNdLytrmEKugHbqDcWkKEOYlUAN2nnwycyVXdZldB
	 HdSIIuyJ4SqFna/k+cDrN1qfiAeIqZ547XKl8bgAvV6ITAF2+bWbbkuKM/OGO93HMJ
	 i1Ydt3mQQKVyg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
Date: Mon, 30 Mar 2026 11:01:37 -0500
Message-ID: <177488647780.633011.3942997076237860691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
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
	TAGGED_FROM(0.00)[bounces-100856-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 9C63A35EAE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Feb 2026 22:05:11 +0000, Raymond Hackley wrote:
> Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
> They are similar to the other Samsung devices based on MSM8916 with only a
> few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - USB Device Mode
>  - UART (on USB connector via the SM5502 MUIC)
>  - WCNSS (WiFi/BT)
>  - Regulators
>  - QDSP6 audio
>  - Speaker/earpiece/headphones/microphones via digital/analog codec in
>    MSM8916/PM8916
>  - WWAN Internet via BAM-DMUX
>  - PMIC and charger
>  - Touchscreen
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8916-samsung-fortuna: Move SM5504 from rossa and refactor MUIC
      commit: 21450547506ece7e36bef75681479a52e518c53b
[2/3] dt-bindings: qcom: Document samsung,coreprimeltevzw
      commit: bb0a09a4fa4821a5a1da1b707e0e169d6a4e8cd2
[3/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
      commit: 2ce450f77f1de5eb7b489fcd829a7f494952e1bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


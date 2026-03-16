Return-Path: <linux-arm-msm+bounces-97781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN3ZBe9kt2kMQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D7293C28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E41CD3006695
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866B830F7F3;
	Mon, 16 Mar 2026 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmjMRYX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EA30F532;
	Mon, 16 Mar 2026 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626568; cv=none; b=Fg5wmzIaibzgOkNaZfTXeZqcVuI8n6Hu+hKK45/ZaFGvbAEonyWn73wBWpfizr+VBwN+uAiKPJawdyYECAhOmnv+pU7SzYBJnFW8oSGAouIpbS95SY3yg0+KfanuwEQpJXc0XM6iBYPTnfBsGZE88SH4316I/nB7CbRFozTtlsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626568; c=relaxed/simple;
	bh=bb2whBo4MkETTAuB7Qkikcyk9GMJXh92PDQ1hgUGPoM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDFVncacDRCkKaSIhqXz9624wNJFMLL6JQHMh1XvhWg44QCVM+1ZABFqC/ypCqarw6aaSznPL5UBKKR1oKAWf+aCFDYAc2AhCB0sV6IzFRGcNfNtxGNfO7dtq3Jx2K2Rij7JMP1+543Xynwrv2SkaXS8nVmyIAxCIfEl+inhTS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmjMRYX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BBDC2BC9E;
	Mon, 16 Mar 2026 02:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626568;
	bh=bb2whBo4MkETTAuB7Qkikcyk9GMJXh92PDQ1hgUGPoM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JmjMRYX5OrXB0SORotKuSKCPP/oyyGyLmBZnz5p2Nfuc4Gdo7B7F8ym7Zn4x4raAu
	 Yc/zKIltHnxeR3T+CxaD892umbm3+G5Mc4dXM0G5YFFnjmPFdw7tPRxG5k7M3Y6lp+
	 4AHOBSTVCGjfMVS8Omho0oRbVNjiOm3PGPSWy+2dGTN1rQ70kKUlhzV/vdUO8vkI1r
	 mmUsQ606FwdUEoynBr3X5Ui89dDeF4XSYMRhp3Wzy2G1mwHP+nCJBNpc057rKWPzzU
	 mF5yabD5KFEwkvLxqcFIc7309/2TP4adbiqVjWzgLaeVeuoH6j+PKwzD+0P8oNj1pA
	 mv4w3UwVtHynA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] SDM670 cache controller support
Date: Sun, 15 Mar 2026 21:02:31 -0500
Message-ID: <177362655070.7429.10166175242150328507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021957.13357-1-mailingradian@gmail.com>
References: <20260210021957.13357-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97781-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,huawei.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 017D7293C28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Feb 2026 21:19:54 -0500, Richard Acayan wrote:
> This adds support for the Low-Level Cache Controller (LLCC) on SDM670.
> 
> Richard Acayan (3):
>   dt-bindings: cache: qcom,llcc: Add SDM670 compatible
>   soc: qcom: llcc: Add configuration data for SDM670
>   arm64: dts: qcom: sdm670: add llcc
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: cache: qcom,llcc: Add SDM670 compatible
      commit: 12cf1b5de820bc302f92221d87ae13ec1c760c84
[2/3] soc: qcom: llcc: Add configuration data for SDM670
      commit: 11080cc4af8f0ee4b88d0e51384765bb78f05bf5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


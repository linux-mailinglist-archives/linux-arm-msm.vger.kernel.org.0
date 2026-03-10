Return-Path: <linux-arm-msm+bounces-96452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JMpCreGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD98244673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4641430451D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2753B9611;
	Tue, 10 Mar 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF1Fo7OH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F983AEF23;
	Tue, 10 Mar 2026 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110861; cv=none; b=O6I6LSKxXx3/C01gkJVFAWaBWQPkMf4M//BIlMFnggpql0HxFMogp69iYR+2htE5T/Xeg/QQ8A7Et5Gjw4+5MOfGilSAb8UlQKmkY9anDS8S3oJxnBzo6ShCwm0r6nclQFxaxn4JmugMkVmgqy/ElXh9Dkeucl8yy6B9RZkzWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110861; c=relaxed/simple;
	bh=6mcRcqz6B9RAVnEMiUIvXUDEY8IgBGFeCLWjp8qQhvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUlOkaFYXY2zUu4nIz0Tk6zRZg693zwxIGJya3b1hDMPvW/cDYYeqUijtcZsns2y7koqsUDC4c52lPCNrLtCunIktrnUiq6Lrqi020gkPF10He5mXJrRhG2yBd179sz8vXSiJhzUTfP7tuzsXXnCoeB824lQyVHBRpgFVH36kZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF1Fo7OH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0E2C19423;
	Tue, 10 Mar 2026 02:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110859;
	bh=6mcRcqz6B9RAVnEMiUIvXUDEY8IgBGFeCLWjp8qQhvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PF1Fo7OH6ajwx25UUfCKTMh3VbNyrnCYiPgAduXWoIBqz5bpMKkGLhatnuhki1Kkx
	 TeHjD+6m9ugLWdSjPsjh1JbALiUiPBlnkn7rHZNqgtwQFea18UpmE1azYOBuDyo4Fv
	 434hP3jzGOAmqD0Bezlj4KNwceWWtGiPK0OtxER51jJVjD796HIdOpU3yD4hfdoI6W
	 SeiNNi1sj2c2FYozF2fVA+eWQJL+MlHzCMH3d15TQd3h/nEUMEGawuKovK7QA6X3fK
	 YyCmXPdgz6INNz9HZ95HYRkiM9eP0n1Oo9nDBeH9bA/vi0zJn22jDy5wxy63QszDIS
	 OMwTv71oHOeVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Add EL2 overlay support
Date: Mon,  9 Mar 2026 21:45:41 -0500
Message-ID: <177311073315.23763.2004308327563144008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BCD98244673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96452-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 17:13:47 +0530, Mukesh Ojha wrote:
> We have recently added initial EL2 overlay support for Lemans and there
> it was not disabling zap-shader as GPU changes were not available. Lets
> disables the zap-shader there. And in the similar lines add support for
> Monaco and Talos SoC variants as well which support EL2 configuration.
> 
> Talos GPU changes are not merged so its overlay file has dependency
> on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
      commit: b3e0db9d8ec0fbb7367313d888b1bc3cc32cdffc
[2/3] arm64: dts: qcom: monaco: Add EL2 overlay
      commit: a3e3203d04e6d25bbd2ee678d82b833af53461a8
[3/3] arm64: dts: qcom: talos: Add EL2 overlay
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


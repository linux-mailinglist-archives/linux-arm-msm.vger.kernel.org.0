Return-Path: <linux-arm-msm+bounces-101967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI3zKITN02lpmQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:13:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3FB3A49D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3DD030209D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B90387588;
	Mon,  6 Apr 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Szp85bO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C1387578;
	Mon,  6 Apr 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488214; cv=none; b=Lr2Fn6anhMCXoyoYr3FlQeu9NGhoQp4huW+IM7/xqYJfrH8Z644qVw5NQTvmyT5Zg1jl2bKqT7JMsgWdOL1F0EpGPSWyiSLD4UcJoi5uSlUbxWTvzCGOIBsjLoLAaR23JtfE9XpZK5nSYLy1Xb2Xgcpxj/xSP9GLI85fMk/66dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488214; c=relaxed/simple;
	bh=0N/zosB/ood8NYUBNew4d5pVfknPYKqRSkHBHsiOvfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRopJyl0lJZ9l7BAUfIQV2/pb/j2pkQa53ioLbEZrGmHaC1jRFULYQaM6xZ6s4hpBV+fF3IW1gUhdl9NqcLVb6ZlgYYU0SYx8A8kKVIltLkI8p2RPjYWeCbTP8P4fXhkLO8qQwBwWChvNjrGh6S49jnjhJoCnLvXrbVYHerIK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szp85bO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2044EC2BCB2;
	Mon,  6 Apr 2026 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488214;
	bh=0N/zosB/ood8NYUBNew4d5pVfknPYKqRSkHBHsiOvfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Szp85bO1BR7P3OB5HALfTwPgB+mHAYy07EZZ3FHpGeMYQLVKS1QIqA/Msiv7n3W6/
	 lJ8hXAbBYW3A3p1bcHR/j9Jxahj4fxxYRNHgvMW9CmCm2zP9qHd6OCWpL30r60VoM0
	 Sla4bjLn6lbJrfqhy42xd+z9qfTmSZ1a5RC6PpPZCcBncsIfISevsVjeS788OMxx8t
	 oqb3MaEeoxxby1k+lBQbyZ+v8XuCM+mFocmVHCN18CzPYy7cJCGLAkQky1zvzyD0/+
	 93GYuVYT3dESPDRjSzI/aCNx/PHc6PT966Nf2xfJgiTwioH1d5BpPGvI78caXDN0l+
	 I4G+87s3sfl3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom: Drop types for firmware-name
Date: Mon,  6 Apr 2026 10:10:03 -0500
Message-ID: <177548820156.2290739.16749619194523233528.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
References: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-101967-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 0B3FB3A49D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 09 Mar 2026 20:33:57 +0800, Shawn Guo wrote:
> The type of firmware-name is already defined by core schemas.  Drop it
> from individual bindings that have either a redundant definition or
> an override as string type.  For the later cases, constrain the number
> of expected firmware names to 1.
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom: Drop types for firmware-name
      commit: 74eb6cd91aef968ee792575f10b438ae2f2a2bb2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


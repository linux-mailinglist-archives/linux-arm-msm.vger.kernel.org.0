Return-Path: <linux-arm-msm+bounces-102330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOKSG7hY1mnLEQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:31:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE323BCF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 583F1308DC3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA6D383C93;
	Wed,  8 Apr 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPSTqrSc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079A30EF7C;
	Wed,  8 Apr 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654792; cv=none; b=nI7rE9mLttKfX6ALjc8QbGJfTX43GktAvy657PFkm4FSpvbydDdBtQA7r8q5GlttL7r14NwgL+FoPNDH0PHF7CBmOOi7I+cV2nE2CEsswfEDnl356hGf7m/v2lsEcN3lWsCecyMMFjI6C6wcOsJJSOsDW7we8M4KbCeUTUhNlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654792; c=relaxed/simple;
	bh=a5nIJr1UB07rcZ3omlJT49wKBe9k8TpVEb/oUaLnzuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrGwgww1aUmfWYI4zrReLhd+N2mT8pV+9xzIOjo3LAuVbQSJPg4QNckFnzOCHXXEya2zJiSaeNWPtOH4h5BI2wnkSEGkaj7RsQaMK3ZAEfAxP5KvPIGt5XbCUv4NNxoiw5zWlnbi6c3iy13szXgyI8D/ImvEqE/Qamy+W33sccc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPSTqrSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619ECC19421;
	Wed,  8 Apr 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775654791;
	bh=a5nIJr1UB07rcZ3omlJT49wKBe9k8TpVEb/oUaLnzuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPSTqrScXrRnJ3q2fpJX+ilLkSnXiZGNk0m14bk4joCRNseNkOeJ23VFWCFq7i/Sk
	 OyZmd7xREzDwwGbb5TCrgYwkoHt0N0SRnShtjyAFztuQL2PY9nNrCAXWO4Z1n/YFd1
	 qQiWXwnhl46NHc0XZmNYRRNY685Jks/OUwsgWmAqbApLaK/+4lAZUw0Qg+wKilVTv8
	 0hA3pDD3upSusC7ubv/RYCO0IepZyzf1bjJ/BhR6tFxjtwI4FZAYJg+ns76tuIx6E5
	 Qq+ov/tYpQIdfZ4bxpUH+pOoTmSJO8yQQhQqmNzqmmrI1QzeQcGXAzEjcqQMYsPZvx
	 zPBApAGWvmP+w==
Date: Wed, 8 Apr 2026 08:26:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Message-ID: <177565478920.1937336.9973281833945371148.robh@kernel.org>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-2-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-clk-hawi-v1-2-c2a663e1d35b@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102330-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0CE323BCF71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:34:57 -0700, Vivek Aknurwar wrote:
> Add bindings documentation for TCSR clock controller on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-msm+bounces-102332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM92DMJX1mlJEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:27:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E93BCD94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 100CE301CABD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA393876DB;
	Wed,  8 Apr 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdevcLKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11C33F394;
	Wed,  8 Apr 2026 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654815; cv=none; b=eeX5VLKvh21T3jo/T5REZyOpKslf0/CZwIcxspuMD/sHfmVIFcPeh9GIOqqunZxBpaGxcIzRn3XP5QbU0eHtDbXvc5AaDKnRg8ENbQ+rNvWgzWdqu94qs63LuPYNBbzy/3S/CsQjg80FqPt9yagocgFxsw7A0f/wbZHUQRFqmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654815; c=relaxed/simple;
	bh=OCSoadxZtqni/jgtdCYSzWmmG4ei58FdgX1Pi//r0a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZeZks/mR3ESZnbfmYB7mrR3BOtx8Io0pejqi2vjs5k/9SrwmWNWYpnnnALEi68mtTVtx7Cp5K2vARS9GCZcE7exmdI2cWxqZbD7b1UiUHpRH/4RSCaBJ9A5V61pYkmD/JOSGaX/yz8wZfhwVzDOc1lLzuTys4WqqwyeeY6VrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdevcLKS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B85AC19421;
	Wed,  8 Apr 2026 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775654815;
	bh=OCSoadxZtqni/jgtdCYSzWmmG4ei58FdgX1Pi//r0a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdevcLKSFF1weksIuVTzdoScmuS3QBXJ8SQrg5vNkXwSmAub+dZMj4IK4UvFIr4/j
	 C5p281lWuTvzI3K5090DDuzXiu2XX4dS16AodD+65feXxUEvIYJrfd0oaBkTm3euFN
	 02RFQ7xrAsndbwI+pvide3AypTbSD73MoTf0Z4obboBk86A6V73BI3cMywjvtTnrFt
	 g/l4vkHJG+dLxyKAEeVdL5a/7OMXKeT7rRs9BtIZcImtwxEbnGmEPAxsdqwBPZm1d4
	 ejtF25YT9e3bDiJWUX/R4FEvHDQaG2GhBRhChFY7c1wEUfrUixTAqGcct8COt6ekTm
	 CY+bDgkWzFJVw==
Date: Wed, 8 Apr 2026 08:26:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mike Tipton <mike.tipton@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Message-ID: <177565481323.1937957.14659753430225608280.robh@kernel.org>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-3-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-clk-hawi-v1-3-c2a663e1d35b@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102332-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 211E93BCD94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 17:34:58 -0700, Vivek Aknurwar wrote:
> Add device tree bindings for the global clock controller on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
>  include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
>  2 files changed, 316 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



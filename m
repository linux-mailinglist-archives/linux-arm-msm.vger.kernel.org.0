Return-Path: <linux-arm-msm+bounces-96147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEHJB8t5rmm2FAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:42:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF710234E96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176103051446
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5451B366DDA;
	Mon,  9 Mar 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2KcXC96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F32366DB7;
	Mon,  9 Mar 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041950; cv=none; b=Xck2zA4Wwj6dQa0LfnmBDAwpy6ActaF6QkVQ8w/UiYn/imrJCpATQdKMD+C+8T7j0jNL6e0FHybFA/+bqVIjYberngIHprmb6WIMEJGBFvqNv/zn5M4Q2MQezA45VGZ7PNqlabHcvr7D1korKrMNaBCMHQ2Qj2kBbCYCRtbF8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041950; c=relaxed/simple;
	bh=LfthzEhNdO6EQHdljJzA+RHQtd+u41eHEtqfcftzvqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/6F9kRALUoub3F5iG/v81du2dc5Lb0E958IgnO1qX6UKNIe9ISfnD6s/fM7LADuTHHSGEFnzx+CVKnpGdvdhv/j+gjoesjhVUWh05Lapg+8gT9oRJ5rGvVpvwrpf6hd04X5gDFWtXC7y4Q4brUhD2FaNDL57l2cNwyzu9x7rxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2KcXC96; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E57C4CEF7;
	Mon,  9 Mar 2026 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773041949;
	bh=LfthzEhNdO6EQHdljJzA+RHQtd+u41eHEtqfcftzvqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2KcXC96rgaNJ8ek1mOiXImpMvCsqNvs8O5/SXlDV1Uiuthun9LNqhlY9e/rN5mty
	 chte9ksTkzdRSv9nUEruNBeDCBxA044tdD4+a1eRQJ5udli8Bs3+7Fjoi1uYD4lrHs
	 +UeE7fUg/Cm+Pnm85qD1Z5Gxvtq9HWD+TbZ7Tx9KcYsRwmZHNbIwmvjNCuBSU+xC3p
	 mTJOgBVGdEZxRIBRpp8gLjvrk1uNEcZpgCfT1JebpTu8OcIcskFGSGz3k6Pn3p2v7q
	 jRaEiFPQ2HNehTXHNOE3jVs3Im0AcvWqD4NQZdtOaWvXAaeA7uY+zU/Zou27/RFBGZ
	 l9A3aoU/zuBlA==
Date: Mon, 9 Mar 2026 08:39:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@mainlining.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Document the Fillmore RPMH
 Clock Controller
Message-ID: <20260309-quick-eel-of-reading-da78db@quoll>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-2-976d9a6bebe7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308-fillmore-clks-v1-2-976d9a6bebe7@mainlining.org>
X-Rspamd-Queue-Id: AF710234E96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96147-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 01:39:28AM +0100, Aelin Reidel wrote:
> Add bindings documentation for the Fillmore (e.g. SM7450) RPMH Clock
> Controller.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



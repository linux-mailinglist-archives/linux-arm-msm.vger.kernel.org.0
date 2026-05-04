Return-Path: <linux-arm-msm+bounces-105689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPQ2Oj9x+GkYuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:13:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F214BB808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC9B93012CE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1954B38D69D;
	Mon,  4 May 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/GLT+GK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350A37D113;
	Mon,  4 May 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889597; cv=none; b=I3YKyfvguiTuml2Fp4LhJzj4clage+ywCyozy6JhM2cz3ILSjkc/ymJ8Epa68PO+fYLXV89Dnr1QSTvfPnUZnI6fgqxD52aUOZ0utsB1qc87ABU8ItanRT1RiWG6KXEWRaaIyWl+UBzAQimEXiIjoK6IiaY3BS6Ao7kxTFU4v5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889597; c=relaxed/simple;
	bh=HZUUPBL7Z4E9vSMrCphwJqkVEsdGZieR22pOXMD+3Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4nuyL5Igt4SJueBgxNCOuuIIdaqRv4hEdtp7C91YUmXMOEKEcY8atEknhKx+FuqSQPv0jOUnIx/Q0GzmoBV12+NTOKRVbgc95ueF77WgdN0Tv7obcaK8NC1ofkWRrnh+Nj0y8GTNcEJh5p1CQVcuxv290zC9rlGa5KIl0rBiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/GLT+GK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AFFC2BCB8;
	Mon,  4 May 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777889596;
	bh=HZUUPBL7Z4E9vSMrCphwJqkVEsdGZieR22pOXMD+3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/GLT+GK44wPcHIXfRtvkjC7/q+evcpPHeKcU14aKbUIa/LhFHLk1++/Ao80wicWA
	 tXs4MMcHFGs5DOTK3l93md3lsGNuPoUcHWrHrAwebu1t0sPhyK+1HJWNKE7u4UIqG1
	 o4jBLdWknmHNqr9DCd3g+NcYDSIg0TBbgPCpFOidxI5gOPwoeFeitjJkrUikXyu1r1
	 8aaTAd0ZXwuIA4f7DLcrNZ9e6nyMqPuA8mn7Dlzgj6ITB8tQpEXAlpjNH5uWDxek+w
	 1YjGBADx58oK9xp3jMuiYMaO5ncUlvKFsrzyybAOaYjBr5WQZX2Ipwh8Ow/34AsiSr
	 gkVNgTzPwKDWQ==
Date: Mon, 4 May 2026 12:13:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Message-ID: <20260504-amphibian-cunning-horse-dbb413@quoll>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
 <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>
X-Rspamd-Queue-Id: 63F214BB808
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105689-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 05:20:26PM +0530, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Introduce the compatible definition for Shikra QCOM SNPS DWC3.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Please do not mix subsystems.

Best regards,
Krzysztof



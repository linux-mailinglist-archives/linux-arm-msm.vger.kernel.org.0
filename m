Return-Path: <linux-arm-msm+bounces-90052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOEFEd4XcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:15:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25C5B240
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A27D74E010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7144418CE;
	Wed, 21 Jan 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ffqnw4sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A9356A03;
	Wed, 21 Jan 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012615; cv=none; b=MjOECqXbDO50qXn2rUMtIak0S3CmPbxbp8Ij2AuNH62PtZckhIKfI384o0FqfTUDb+87jkmGSQs8CPRI23RAGZvVOSRmZXy2FFzpJff5UE5s4MWHRL6Hq7S85HfAWFqMw1kaqC6sa/TphlSyAeQtWUDzW9CALnInqxDErd3VIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012615; c=relaxed/simple;
	bh=bIf1hSAehXvelGh7tRJjYgRP/qy4r9s6XZQmhF0P7HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+DbH8Xv/AtiuZElKss/zcXLv92Es4MbkZJ8cG4mt1z8U36doIZUAaMEvIiGKX4oZVY+7fTsrVP1Gbfso3LGHqe03v2qmgd5Wg0TXUOJFJbWDE8gBbXBno47y2DpnXrix6VPDESAdmUv8WcXX8fuGe4uvtEXYGXH0Oxbo/se4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ffqnw4sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6820C4CEF1;
	Wed, 21 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012615;
	bh=bIf1hSAehXvelGh7tRJjYgRP/qy4r9s6XZQmhF0P7HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ffqnw4sd5nsEGpdQ1IGDaV3DFMlf8Ze9xEyMm18zoaEe9DEjZtrLlATwN1wxg273g
	 loWhZ4QsGwaVGzhXhmpT8DiYXQsHaxcYpgt+QM/ZjJWQYYV2lLUCsrOKWKvy/mNIP5
	 HafxJd6RfzHF1pMga3+vQAw9cPm3Dc5bZZ8Q6wQtRxibrF6YRmb+4Lxbx003a4Rt6O
	 Q9hq7Ak5QPYZVq42i5rngrr416WZOU5x/0wU18lkSWDaxYHqsjg+SbEmxeXikHVZhp
	 0fUaD1U7V5pOtdFSG3Ngq+9Vqu636dRZ6qQva83i3sATs8LUEhROBytDva1n/A5yeC
	 d35uFGtyZBQpQ==
Date: Wed, 21 Jan 2026 10:23:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
	sibi.sankar@oss.qualcomm.com, vkoul@kernel.org
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Update max interrupt
 lines to 16
Message-ID: <176901261366.3407431.13319294932078987448.robh@kernel.org>
References: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-90052-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ED25C5B240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 21 Jan 2026 16:38:28 +0530, Pankaj Patil wrote:
> Update interrupt maxItems to 16 from 13 per GPI instance to support
> Glymur
> 
> Fixes: b729eed5b74ee ("dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Kaanapali and Glymur SoCs")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added Fixes tag
> - Link to v1: https://lore.kernel.org/all/20251231133114.2752822-1-pankaj.patil@oss.qualcomm.com/
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



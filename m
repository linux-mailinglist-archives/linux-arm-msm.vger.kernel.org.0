Return-Path: <linux-arm-msm+bounces-90251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIq7AhpjcmnfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:49:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB556BA86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 18:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F244D303B46A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35043921FF;
	Thu, 22 Jan 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6ywry8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98CE342CAD;
	Thu, 22 Jan 2026 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102562; cv=none; b=pHqZcnMqoIM8/pD5m+/quH0H4L1fJoTiPk2kZDW1XrB623PNxNL2sVxYOFMwF632NXr9Lp2cRiCkt4XkCAG/wbni3fbKYDIB9PrAyinFq3EUlateO1Cyedzsi6ypkivb2GNEobNOeBO/rxhApW+FOmxHq/imbqq8tMrPcCaPijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102562; c=relaxed/simple;
	bh=sMLaYLJ78eep4zbdoNtm/cxRNRSmWkkMcb2HgiB+77c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtaNzr1N7BFajo4FUSM4qZsMCx8tDKi8gBMGpLuu7ykB8hPaj+fabkY87uSSxEF3Z8aPvmeLBMol3wGKVz+kXJworXrKJhb5j5OWNr9cDLTvJacNta7/VGa7hdvDm0hUE2mNqMfbONF0duPdhDkczufqwfJcBQAqgjbxloGmnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6ywry8f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8187C116C6;
	Thu, 22 Jan 2026 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102562;
	bh=sMLaYLJ78eep4zbdoNtm/cxRNRSmWkkMcb2HgiB+77c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6ywry8fjNRqwTvN7jGLM3A+O/bmse2OWXl6tMHTZ79qfqNt7zM61cvUPJnfZPr9W
	 P2OO0H2ZpU3Oixak/SQdqQKPA1SeADN1bJef4RgLd/Ctvsx4hxrW5pVcGi37gy44wl
	 B89fNWTB3jvVrKi2gI3CxpEtNOTkrOZ0GfMAsc6TmLp8xXrFCE+uksxDeYDN7TmqlW
	 +BylLo/nfD7mxmVPNgYTb3wPDwmHTMO7rkgpVGuHr4WCzkMcd2qdzLkixXdbqsAA5u
	 gXU1SljlC3atmMmbj2EBixytDcdTY0dPsAYAJpFM8kxDkXM9h3pO/1v3BM0IvKp/QM
	 xke59NTGJeotw==
Date: Thu, 22 Jan 2026 11:22:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, robin.clark@oss.qualcomm.com,
	devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, konradybcio@kernel.org,
	jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
	lumag@kernel.org, conor+dt@kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: media: venus: Fix iommus property
Message-ID: <176910256037.2771424.151392945334839336.robh@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
 <20260122121042.579270-3-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122121042.579270-3-sumit.garg@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90251-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6EB556BA86
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:40:41 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propety for venus via dropping SMMU stream IDs which
> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> to secure context bank stream IDs is incorrect. The maximum value
> for iommus property is updated accordingly.
> 
> These DT bindings changes should be backwards compatible.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,qcm2290-venus.yaml      | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



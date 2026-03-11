Return-Path: <linux-arm-msm+bounces-96879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAYHDFMKsWnhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:23:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B980A25CCCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC1C23123F9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9C9367F49;
	Wed, 11 Mar 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCEQ2nK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B157B652;
	Wed, 11 Mar 2026 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210163; cv=none; b=FzRDK7n5v/gHSNc9mnf2X/k6qdfYvI/quXZ7VndxvoMXiertLHRMciSIsMuZdkIFxErecfLK4fH3ltutaQ7AxP/0ByxGxSZSrfif+/nWlHXB9U7ashGIg0ek8lsXzDXmora0BnwTqxQUEw2ZXawkEBoZ4XxYua4T8heI4dUI2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210163; c=relaxed/simple;
	bh=J+Yv2AjB2McolzoBkUIV05kHQMlPbhhlQ9GjJ5zmf6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF49fVmrYVPdgpsybZvX3CNIGNwd28a2KmCzJHbWwbATHhU8R/KSAZBt9P0zhMR3PG/pGBiJIPEDXkXXPuudbS1cvT+wIl/b9moOzcd97W0W0ins4b3qLdbVY7RwpvGaQOY91kGLLHnzBdBXZNp4fQhQfdBQ4JT5i48CKNPgMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCEQ2nK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52190C4CEF7;
	Wed, 11 Mar 2026 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210162;
	bh=J+Yv2AjB2McolzoBkUIV05kHQMlPbhhlQ9GjJ5zmf6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCEQ2nK3MTCYwI5vsKINgfzINNpClvIwMW3M+GT2jtjFphR+L3bTmQSnCG7ggy+3V
	 PwV0zZSeaX7pYnHqG3b47h5ZYvQRaZBYa1dnxyOIIxAboXrIYzbRV/tEej+X6hjM89
	 178WDTH0Z96EYhRggTx7Ooc66Lisa+s0TN6JDzpFWDJOpxWRSvPtlzVWfGfZjGWeCL
	 Z/PW2iXfTkhiVSsW01F2X4RQ+PgzIXJA6Mxb24BvmP1LwR47oApUz0BfgU76iKoihJ
	 Y7dpXv0PBIXavSg15nIUpQJ+7ixRGHFVX0M+nCndPSkoDQlC96vS/wQaeK6ZVBIyd0
	 0Q4XEX1eE0Q1Q==
Date: Wed, 11 Mar 2026 07:22:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: remoteproc: qcom: Add smem
 properties in documents that reference to pas-common
Message-ID: <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
X-Rspamd-Queue-Id: B980A25CCCF
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
	TAGGED_FROM(0.00)[bounces-96879-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 03:03:19AM -0700, Jingyi Wang wrote:
> Kaanapali SoCCP will extend the list for smem properties, add SMEM
> properties "qcom,smem-states" and "qcom,smem-state-names" to documents
> that reference to pas-common and add maxItems constraints.

This change is no-op. pas-common already defines all this.

This should be squashed with the change changing pas-common.

Best regards,
Krzysztof



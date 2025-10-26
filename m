Return-Path: <linux-arm-msm+bounces-78831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A35FC0B579
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 295FA4EBF5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BBE239E7D;
	Sun, 26 Oct 2025 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifq/vfL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB872633;
	Sun, 26 Oct 2025 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761517010; cv=none; b=IZ9YZ2/kzuJJJzoulGYaPQ4JWQsoVkmqSzkNPBqVdb+AK+EzwtX0tClPqyRLvMWoOJp73rEK0316TPqODm/hWcRmxawClyIwzmkLjNqOilXObLalmK1quRxNfbCk7/iuA6GiVyF+nyokNSqaGqLC2hpeOh/MW6QxQ251tig/YkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761517010; c=relaxed/simple;
	bh=SF+4QXNF6APVFNNV9mBrR6jHIP0C1N+rkYZB9dgTym8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/jCdmy/zabyXETxOnFM62PuG+Zb2dQj0N6D7p3MEYXYw+xi1a1V7WCkDz5NH6ru+afnI7zY1m1SQJQRZTHbZu2e+sZzYO7Bo5FjSdDvikeL7b1uFvb6m7ceweufnamBxu1yxrBYm9MyvVYBMqhb1eA4krvePIHAnFg0CPHtpNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifq/vfL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DD7C4CEE7;
	Sun, 26 Oct 2025 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761517009;
	bh=SF+4QXNF6APVFNNV9mBrR6jHIP0C1N+rkYZB9dgTym8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifq/vfL0gN+llh1SytO/IHHUpIkmveBXN+iIevk5YhrZI8R8Rgr2PcTZBBeN5qx+Y
	 pxwWhV5+zH4urwD9/F44+dwJGV8qEgkgE6JfTyNh06Ad+cZQYJZAFIgRCrLVVfOmgE
	 t1MfKIAUMO/bJhQxF2ozKv82glc4Ot8RTBLMR6JQan080SSIb8mSYqC7CfevSA3a93
	 +5TJ+KwUY2JpPtqlBnNwZ+rljUxjZLtNhcDFGmmDAMq+PBPUdaz2ZySL9swnN8tjPP
	 Ow7X7pFoHHCWUapV7gMTyu006ZJm1OaEiHrLthDpKjl7XKFHYbJRchO+Cc4GY8y323
	 VvBCCsTNIczDw==
Date: Sun, 26 Oct 2025 17:16:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
	devicetree@vger.kernel.org, Das Srinagesh <quic_gurus@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 Glymur AOSS side channel
Message-ID: <176151700562.3033709.5033274965710844560.robh@kernel.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-4-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-knp-soc-binding-v2-4-3cd3f390f3e2@oss.qualcomm.com>


On Wed, 22 Oct 2025 00:28:44 -0700, Jingyi Wang wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Document the Always-on Subsystem side channel on the Glymur SoC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



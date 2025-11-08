Return-Path: <linux-arm-msm+bounces-80833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E08C42C13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 12:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BA014E1855
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 11:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BCE2586E8;
	Sat,  8 Nov 2025 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEdxv21q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00964283FF1;
	Sat,  8 Nov 2025 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762602239; cv=none; b=NIsIlJPjlVmB6ygIJMjPC2NOL89WiJdWjnIt62fw3CwUMPivP2D/fh4I/7T/E7PXvyHle4QC8oYX1ZwkIPCy+OSR4qVc8XCxSShoORjFbTSzLPhZXZxszdS3SSLtEY3mWUud6ks9rqW034Gt/I7/X1cPZgci0O0zs4+MkeAr2Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762602239; c=relaxed/simple;
	bh=E39zBR+/q8Bg8pTqde3U5WC0/GsvxvWX3vKNLyHS27U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSMfU8jvIIqxqvEZ2yTwP4ghQ0z19kEu8fA8XSlXUsjJrf2TEr0xpbTRYZfgllkBb+ui2xNt+ChtfWx7NAfioIgF1esZSQzMrVZKdZ+P6oYwlh0HYBZlp+OqlCyvMNQ71HtFdKefPBPlsKsUSyd00KcjA4oEddBP9WfIcCqDEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEdxv21q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18E0C19422;
	Sat,  8 Nov 2025 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762602238;
	bh=E39zBR+/q8Bg8pTqde3U5WC0/GsvxvWX3vKNLyHS27U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pEdxv21qocJeC0qMkvDuMhfJwTqyYCCHbgEJd2v2eFxjz7zoOrw91Nm0SmX9c41SG
	 bSEKsZS7n7wUK2zBQUQbzNFjPsB0pHOxPzjcx9TgIv2tMSheVD0IDDfIxunixiTSnf
	 7tUTJJD/mSD54PK+C2S7POiZ6YmlfskIWxL8PcY9m8/bOGHJ6zs5vDrriwTKYqkist
	 e1Vc72tkibEThvA1oG6+GVp1aAJsIHr9mDQoGrpmssVqO9fGZR25Um54J+FdBkZMJl
	 f4qT5bd7IRb8phRSsmhks47gcAuE4TeyPGIc49o/wATCcbSSFlZy/ZPlItyv1tx1UZ
	 S6NQcVhnYumqg==
Date: Sat, 8 Nov 2025 12:43:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_svankada@quicinc.com, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_nihalkum@quicinc.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
Message-ID: <20251108-khaki-shark-of-devotion-cf4bce@kuoka>
References: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
 <20251107162521.511536-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107162521.511536-2-quic_vikramsa@quicinc.com>

On Fri, Nov 07, 2025 at 09:55:20PM +0530, Vikram Sharma wrote:
> Add missing vdda-phy-supply and vdda-pll-supply in the (monaco)qcs8300
> camss binding. While enabling imx412 sensor for qcs8300 we see a need
> to add these supplies which were missing in initial submission.
> 
> Fixes: 634a2958fae30 ("media: dt-bindings: Add qcom,qcs8300-camss compatible")
> Cc: <stable@vger.kernel.org>
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



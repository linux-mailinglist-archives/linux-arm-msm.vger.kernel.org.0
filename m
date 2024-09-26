Return-Path: <linux-arm-msm+bounces-32535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844D986CAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6DDB282ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6ED188A25;
	Thu, 26 Sep 2024 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9YMxSAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3351AAC4;
	Thu, 26 Sep 2024 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332856; cv=none; b=tMvzVFkht1UE9i+fHmAKA7gpTYo2dT2xSOkbJrJQiEJir3klPNamm5ay2W3WxhN2X+qCGU3WkkJQRa1icay+QZQJEgJlJUacnAkpz3eWPvkFmgjVK6HK6vQnX2ePeE6bj9mvI/n1Pgg7IXl7Wb1ouJIxuRfw8ImGCiaDLF2y63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332856; c=relaxed/simple;
	bh=SbNFfNGwz76DV7PUYKZJ2oHIFY3WANEOgbwiTTyYNvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g07L2/E8YuEmx9PO4ucCIBupTrkuvtb/6ds5d7dg+IkHJ9Egf7rx6ZIyEEFkI//xzeccZZ+m7DOlz3XB1R2Q5s9KDXVIILUnIaVwJidovayVXNTGbxPB7Nh5nfMBSYWZJN5eipEU1UHhJ3fHPv8qpWmKoHxffe2rkqglQPj9Ifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9YMxSAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192A1C4CEC5;
	Thu, 26 Sep 2024 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332855;
	bh=SbNFfNGwz76DV7PUYKZJ2oHIFY3WANEOgbwiTTyYNvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9YMxSAudiuPIPAJg0cwf1jq7LB1fyVWHKEhP/CqiS5O20EErccYVqZhVOLZGP38n
	 xvX4256BJq4xS1QxOiJBDuWqHJnw/GcjPGn9HmrpV2rbUowf2sm0VTdfe3090RXRje
	 51kKkKQ66lrczuLxOXsG+oI8fiJ2pz7DjO9ShxkV6rdlrPd8ZhL14Xp8jb/5RrOlbW
	 x7oXBPE5Z7TGrbqJPDP7pp+YyBUut4Ki38Txq9AmzNkDUBh7vrJUfOsBvx03ny0nua
	 h0GQ4E4AOf0iwe/G82jdeCE9uPXyADluldvs01ri+tc/XWkT+FOyiLc7ISyKWKlg4U
	 W7dWTCyMZdwFg==
Date: Thu, 26 Sep 2024 08:40:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
Message-ID: <rch5bhvg2tghg4d2hqzlmwwibx4i3zrxmiisxzdfuwo7zmcmap@6n5x5sweddfu>
References: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>

On Wed, Sep 25, 2024 at 03:21:37PM +0800, Jingyi Wang wrote:
> Document the components used to boot the ADSP, CDSP and GPDSP on the
> Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
> remoteproc on the QCS8300 with that on the SA8775P.
> 
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



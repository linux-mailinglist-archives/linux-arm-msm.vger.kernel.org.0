Return-Path: <linux-arm-msm+bounces-49898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD1CA4A609
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 23:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28A887A7FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665461DE4FE;
	Fri, 28 Feb 2025 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M212eres"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F8723F39A;
	Fri, 28 Feb 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782225; cv=none; b=EeukPDAxe4kD18dCALrW0eOsDA8yq4JEQOE3FcRrtmge1JdoGuBuHyNxuhyxAfiFLrxBxojzBOWWXK33sQ01vspr1RmeX5iOplg8t0joOI8zpJ9SAY7ezGh69NLY0ESWV9mZl1Nv6ENFLPdouEj9F4xts/P3lG5dTXX1Nw7rjUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782225; c=relaxed/simple;
	bh=lGDPVM1ejRwGkbcdP511JzIheqYEer88GF7wrqPEtxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYaomcqQR2Z8R2p1UXs3rEgDFLxnFRpqb/nS0BL4nnsuxe71V9WWMJKeIvbxqBtaEMW71X3PlMuAyW69hYtbHOSRpAb6awp9UIcnnsGynfXZY3M/BZ7tkrCiFrBKP77TMzpVfGFW5gJ5dYtTMmJq08ieuzqRHf/ZENSxenCBDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M212eres; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56181C4CED6;
	Fri, 28 Feb 2025 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740782224;
	bh=lGDPVM1ejRwGkbcdP511JzIheqYEer88GF7wrqPEtxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M212eresH6z9jMYc1RJuGjO2itAJgTOE2aGpxc2deiKj9MNmYdX/Xnie/mLCsdFw2
	 HG6Vos8M+mwh+QLUR4lNx0ggaMDdpoxcF1vyCvwuPtr2yKFPkiNYDhQuI09ZXfEjrO
	 Wmhwdzs2k8mdx+nfXap+l94PTToRp2jC3krlEnNAo3Ctz9X15rq3+QoLEoS+Npmkgz
	 bj8ZoS7M4XYwedl/TLUjvJdj6XGust/epndscIi2PdQUvJVkTc9Wl+aFyIkRFB1WbQ
	 gPkJy7mD3RU/7/Z366HLGhXYU5gKa6MbjByrDsJ9wQs/gpLoJBvEx3cU+0KtiWL01P
	 CWl48iSU7REGA==
Date: Fri, 28 Feb 2025 16:37:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,sm6115-pas: Use
 recommended MBN firmware format in DTS example
Message-ID: <174078222108.3799337.17139253325259810750.robh@kernel.org>
References: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>


On Wed, 26 Feb 2025 15:51:03 +0100, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



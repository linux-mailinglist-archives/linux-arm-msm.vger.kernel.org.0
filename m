Return-Path: <linux-arm-msm+bounces-44033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16AA0304E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D05BD3A3970
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208101DF997;
	Mon,  6 Jan 2025 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMqq95Wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58841DF75E;
	Mon,  6 Jan 2025 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190873; cv=none; b=kNGbSQ4a8O0z4YAqzADTVsMEfzq8x2GllfHsCtqVpIvqfi2SARh560Q1xPokGbniOjUB7StRYplMg/gIdMDV9E2AxmWDB2N+7mgL6pubm0Vvp0eshH5CLhJT95JXXMu5zOfsT10yRmYnrpPlNY4qyQLIFMgRItm7VWJHVNx3f1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190873; c=relaxed/simple;
	bh=KQb70EbRxCMaVJKTkhRU/La3b/JAaB9BUuxhn6kQ+H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJN6sRKB+gKaZH9gU6SzA7KXGkxWB3+yZCgD823Zmx4TgmEnG93pfA93jUagI3HFNSLVk805fkMFwWXsznfl2HCXkHPjlRtSqF6XzNsulSQEjcVnqNMBRqKVvicf5InxM8XkWiNSjaFQ7mrrup7CyGMXYrYUNs8pCFQKW0cf+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMqq95Wd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24274C4CED6;
	Mon,  6 Jan 2025 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736190873;
	bh=KQb70EbRxCMaVJKTkhRU/La3b/JAaB9BUuxhn6kQ+H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMqq95WdNGcCmOMogW6UXiYUl2yJQzVfIIwdXKfanIcXoFCTy9UEWt02GfncFLgq1
	 +5/tz3kq+qjm2yppQwIQ4wAaGEv5DMXWp/j2OW374SGlYgH3s3kRagd3ObZz5zX7k9
	 SunYCoQbaht0Ii/wL7u5PPhDFz7R2R+sercbgd2Ms5Kxd3EakHc/8xDQqp+YYLB/bi
	 aMtjCo3YZd8cnq3ocH13zD2O76INxw8I6xfHGx0CJmamu81wVGtrUnsQ04Y3pkr6mq
	 Lopi70O2jEuxQ9zycnE+MtIw8Z/qr8OSyhEZXe4nTFuRlgeJWtlxjL20V1o4DLZh2S
	 QceeuQSC20vBQ==
Date: Mon, 6 Jan 2025 13:14:32 -0600
From: Rob Herring <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for QCS615
Message-ID: <20250106191432.GA825987-robh@kernel.org>
References: <20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com>

On Thu, Sep 12, 2024 at 10:54:41AM +0800, Lijuan Gao wrote:
> Document compatible for QFPROM used on QCS615. It's compatible
> with generic QFPROM fallback.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Document QFPROM compatible for Qualcomm QCS615. It provides access
> functions for QFPROM data to rest of the drivers via nvmem interface.
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.


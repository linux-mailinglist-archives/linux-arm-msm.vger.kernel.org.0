Return-Path: <linux-arm-msm+bounces-86685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE1CDF7CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 304C030076AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 10:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF9F265632;
	Sat, 27 Dec 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvEy1RBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23D199D8;
	Sat, 27 Dec 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831170; cv=none; b=XnKBWmAx+pGWBP30bAWlPsrfnQrCQon/raXN6UrA2PghBKtnveb5aqpRT+SSYYAMumBU6Tk08NPSXbQp/gCSD40nUunCjwIMV+QbgNmJrBqbFwv/OwIKFajE2yDc0tVt/WBHIWWDuXXusM15EbrVsrC18UdvHoz+fMLgV+SIitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831170; c=relaxed/simple;
	bh=i7XJIYAcw/8HkVs6WhLQcOjfqqNjkEqX4lOSYgSqDAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+3vPur/ajP7k17VQAC7wnQBc0gdMjDnSCKIWL5tkOh2qk6jL3pdUuqTn9F90FXmiKEljS1Z8VpH+jp8/0tAH1feJTzAItwKQp9VSjwHwFBk4zrnu/sWrcANQTgtFshw3+bVxhA4xW2JlHaxnOLcJtNqBfe9L7DeJ9LYWQEfM2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvEy1RBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1BFC4CEF1;
	Sat, 27 Dec 2025 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766831170;
	bh=i7XJIYAcw/8HkVs6WhLQcOjfqqNjkEqX4lOSYgSqDAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvEy1RBBEuGkt69wQ+1y9Qb4HTew1OgKZ5ZdpcuJDJSMu/uL7r96oUSXeEmCYBEjH
	 KztY8mSxlePyVqtUcxEDwsNWOzejle+LeK1qhaSPMFK1rrlFiDCR/UPojNvFGOcObf
	 Xx+djfK/WmAoW0sMQKCtvitQcXQrQxBc7+w358XdBFxs4+2zuMDWKPoadqbgF0t7C2
	 6VWFsW+cpFDF3kf4n8dDhJyc+8exDGtkxWpJvDaVt+UfB/iNncLgoZu/HX3gvfKT6f
	 9FBKouoJJsDIIpOJ2njTyny8zDfQOmNu0MniQJq+9dQvFiKWZ+SMO3TXvtr9KPXa2D
	 jHQv7ypDuimag==
Date: Sat, 27 Dec 2025 11:26:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251227-optimistic-silky-shrimp-f5dcd8@quoll>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-2-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-2-kumari.pallavi@oss.qualcomm.com>

On Fri, Dec 26, 2025 at 12:35:31PM +0530, Kumari Pallavi wrote:
> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
> that differ from previous SoCs. The SID field moves within the physical
> address, and CDSP now supports a wider DMA range, requiring updated
> sid_pos and DMA mask handling in the driver.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



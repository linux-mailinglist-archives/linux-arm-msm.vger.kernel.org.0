Return-Path: <linux-arm-msm+bounces-78993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB2C0F719
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F4A463958
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D62312819;
	Mon, 27 Oct 2025 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ec5NEWwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917FEAE7;
	Mon, 27 Oct 2025 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583375; cv=none; b=BoVuvVqs2QDIdOSKVayLbQXpjiMp6kx92CqScnD7KyqBDrQwEk/Vr7mfI+OqbnOuc+NIDrJgCIwgXJNv9GBidRx1N3+6SFRSYo65lGvDJzdg3SNFOzubIo58g7IKlqzX1nimGKCNlT0wSx0CWm+hqnX5KSFg5l1zQRkvej5J1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583375; c=relaxed/simple;
	bh=xi3p1plspiMb+oEZCo7OhEMYcKsZn5qpqNZLgN6rP+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjTmJEueUtPK+7EsTsq48iNXS/YUx/qqbjtGr8CIiCs012ZUQw3I8RooqmjNYH07khnmpZxTzESIjl6XbaW5cYAPpGtwkjcY3bTO9FrJLJIvd8tbZnCI09g23McOTUzIncrdQ9XtsNVRwiAd/RUKdRT1pLNxZA1YmNbHg3R44ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ec5NEWwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5A6C4CEF1;
	Mon, 27 Oct 2025 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583375;
	bh=xi3p1plspiMb+oEZCo7OhEMYcKsZn5qpqNZLgN6rP+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ec5NEWwtwvUCT6XBtM30FRyNeTIbKbBWMFgtw9LzwDx6ZWi9+5AyNzOBc9X4f3Z+V
	 FusgcgRRSvXTxBGeqihCsRuqODvJmiE+oLrCxAAeewIh2Q1v/WAYIBWga/f3BxqKdy
	 xrzezf2wCOQHlSrtEMj7cB4IuL2TQOXaKRFDFPj8yttzu5m8WY2ZHlZZf6wlNqigIT
	 tXpRdMBVlZJhqpjbwSIQoYy3vecXuCBik9BeYYGYKvMkB2gNjLa0VP8Te1muHXG636
	 yR8w7cbtkqQScQd0OzqEWxve8Q26aJ3J4cP2ytwzw2oikUj6WWRsWXwtA0uZIZAYAN
	 XDpq4uZ6/lLrg==
Date: Mon, 27 Oct 2025 11:45:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Alexander Martinz <amartinz@shiftphones.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add
 missing reserved-memory
Message-ID: <3ryhntdf52cukvcbfad5prlggqsee54nsf7us6hdd5h5f73pog@yrgo6o6j22gw>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-3-5bb2f4a02cea@fairphone.com>

On Thu, Oct 09, 2025 at 11:06:33AM +0200, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> It seems we also need to reserve a region of 81 MiB called "removed_mem"
> otherwise we can easily hit memory errors with higher RAM usage.
> 

If you make sure CONFIG_MEMTEST is enabled, you can boot with memtest=1
on the command line to catch such issues, without relying on "higher RAM
usage" (or randomness).

Regards,
Bjorn

> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index 0d331bda4a82..31650c29b1ca 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -118,6 +118,11 @@ cdsp_mem: cdsp@88f00000 {
>  			no-map;
>  		};
>  
> +		removed_mem: removed@c0000000 {
> +			reg = <0x0 0xc0000000 0x0 0x5100000>;
> +			no-map;
> +		};
> +
>  		rmtfs_mem: rmtfs@f8500000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0x0 0xf8500000 0x0 0x600000>;
> 
> -- 
> 2.51.0
> 


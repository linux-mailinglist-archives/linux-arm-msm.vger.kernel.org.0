Return-Path: <linux-arm-msm+bounces-44761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C87A097A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 17:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43403AA98F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07135211293;
	Fri, 10 Jan 2025 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdVlef0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0087205507;
	Fri, 10 Jan 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527118; cv=none; b=K8zclfhSDLHFN0IaYZGADZdL9Vr3MoenokdsbaRS0O4EuYBXtP9ZOCvKmqK05zBk/GKT9fXh6YxvgkM80G9aH+cAVxxRXf32Qa+X0LaRR/iD3MMRHoewQ8JgDky8qlT+btbUOJ5DEkXarMOXaq1DsUyM06bLslafcKC2JIWFDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527118; c=relaxed/simple;
	bh=J5bdc2X9Rsmw5euopx3iH5iYQSDoe5mcSUUJdV3mzYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNlwdHfkv4w0GMp5PYqR6IpUSztTKHtl7R1AtJc+ZQ11C8qXRzDZpPrZTl81yczZLNX4kZcDlq/hY+g4FN2C0za7fYWb/pelYFIMz10DTjqkMmTqK5qq1EJCBgdSYqLgxK5HPyhukN5i8agKc9awHjKPQ/XCJw7RAN4mDxgtZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdVlef0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E08C4CEE1;
	Fri, 10 Jan 2025 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736527118;
	bh=J5bdc2X9Rsmw5euopx3iH5iYQSDoe5mcSUUJdV3mzYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdVlef0qJImen6hc/+ad13GgTHvTqcDyKzeRAi/usRuNfLO/U/vwcD05SvLtlS+9d
	 dYrd5E1ahVwFujDk29RCPneEkgGojP4fOvp/JvM2nhk3sg9vhXKGhPdHBgPDMDqqmE
	 k8B3jSFZJucZrtFz7SzUXbuFH3u3Ur1lN0YHOIbYjSa41FcQhQiWicQlK9M5itHFVF
	 Eyf50PLAibMdExb/4iF4WuagWV1MkWvDGVdpHK1x7SVfXnLx7ZP2WfHihaaP0nQeg2
	 lOH34iWWrmGJXAsQr/xzkmT65159PCIwZuPQZB665boEAMd4F1k1ZdyQWTGuaDEsvc
	 9mxv6fRZuwI6Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tWI1v-000000002KG-1ptw;
	Fri, 10 Jan 2025 17:38:40 +0100
Date: Fri, 10 Jan 2025 17:38:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Kettenis <kettenis@openbsd.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent
Message-ID: <Z4FND-b-gEb6YJw6@hovoldconsulting.com>
References: <20250109205232.92336-1-kettenis@openbsd.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109205232.92336-1-kettenis@openbsd.org>

On Thu, Jan 09, 2025 at 09:52:31PM +0100, Mark Kettenis wrote:
> Make this USB controller consistent with the others on this platform.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 4936fa5b98ff..aad1153a443d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4814,6 +4814,8 @@ usb_2_dwc3: usb@a200000 {
>  				snps,dis-u1-entry-quirk;
>  				snps,dis-u2-entry-quirk;
>  
> +				dma-coherent;
> +

Can someone from Qualcomm please confirm that this is correct, and that
it's not the other way round and this property should be removed from
the other controllers (e.g. if this was just some copy-pasta from sm8550
which is the only other Qualcomm platform that claims to have
dma-coherent USB controllers).

Johan


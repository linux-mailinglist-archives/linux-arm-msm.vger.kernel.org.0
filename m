Return-Path: <linux-arm-msm+bounces-85627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A700CCA400
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 05:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A17A300A375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E3D279DC2;
	Thu, 18 Dec 2025 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIShoj3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A642F85B;
	Thu, 18 Dec 2025 04:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766032112; cv=none; b=O/j0KdvT1spoEHEAvcHFK0I6vp08nMMAxTsEtHfz0E8Z9Z37dHE5SeBx77NuSnrt1OjNS+GTpXQbJdYPmuKgqx/vI8tBimg7y/yTRG7nkm/d5I075OYooG2mOLEYq4hginrTmKGxsFVRQcEiCe7JGio/6cGv780JfLjGJy5TBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766032112; c=relaxed/simple;
	bh=2bu1Nvgsu/JczKu0KOjHuWzhJ6Fow8oFWMm7tK/eRcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMR268DzVi1pwcoDxrkROplJ/tIvYh6yTncL76CmLurcL2qvMK7yVK+ym8EEZzW4RJ0IwkORcfAfyzPgnnAPcn56yiq5lEN5VU0xSWRswnhpotr42lwpniHcFdDzmFglMx3ld9HvS+raaW8Kt20q1dxRd3TTiLKwtOCPDSm++Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIShoj3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A496C4CEFB;
	Thu, 18 Dec 2025 04:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766032111;
	bh=2bu1Nvgsu/JczKu0KOjHuWzhJ6Fow8oFWMm7tK/eRcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIShoj3XCINYvoXui7yJIdB6nADTacktf9W+xmCoouNKkMmjEuHrvqWJLUFgqSRSb
	 YRJ2IZlFBEaQ/OBzZWp/UlWPuTZin07aijPPVi2x1+WjoYHDu3JKZX4MAzpo/pgohy
	 pvihszFQZhDkdRqvbdeQjAPfbL9ld0DNlT8kgIvXtvz+QIHZrSocylW0BoTepmGMnD
	 mpOiNgE62ukc3FIu0FlAFZmgw3D0QEMXNSmXDuqwLbeNaUg57jgK0VNd+14qNMWgha
	 hzuBGqYPmdydfO+VFXwVSpdqsDXD0DkWwrLi6RICWn7yT3GpqAebSvRoJy3Lr7IzfE
	 vfD0lFL5YdWiQ==
Date: Wed, 17 Dec 2025 22:28:28 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: george.moussalem@outlook.com
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 4/8] mailbox: qcom: fix IPC register offset for IPQ5424
Message-ID: <ozpwi5xkqikuu45s4z5c5lw32oz7m5c6r4thjq4k7ndkvgodrv@3cnk2dgyl3qt>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
 <20251215-ipq5018-wifi-v7-4-ec4adba941b5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-ipq5018-wifi-v7-4-ec4adba941b5@outlook.com>

On Mon, Dec 15, 2025 at 10:35:09AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The IPC register in IPQ5424 is at offset 0xc instead of 0x8 as defined
> in driver data for msm8994. As such, switch to the existing
> apps_shared_apcs_data driver data which has offset set to 0xc.
> 

This doesn't have any compile time dependencies to the rest of the
series, so it would be better to send separately to make this clear.

Further, there should be a Fixes: tag here, and if there are any users a
Cc: stable@....

Regards,
Bjorn

> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..258b03307869b244e053e7a355531268114906df 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -164,7 +164,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
>  	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
>  	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
> -	{ .compatible = "qcom,ipq5424-apcs-apps-global", .data = &msm8994_apcs_data },
> +	{ .compatible = "qcom,ipq5424-apcs-apps-global", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> 
> -- 
> 2.52.0
> 
> 


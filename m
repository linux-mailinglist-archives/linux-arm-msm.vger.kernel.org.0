Return-Path: <linux-arm-msm+bounces-79998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65776C2836C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 17:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAC418935F1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 16:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2FB277814;
	Sat,  1 Nov 2025 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLAv10NZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E750278154;
	Sat,  1 Nov 2025 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762016300; cv=none; b=c3yJKBbFEx8UOoaQ9RQ7cYiV7YATGpMLbIzW6YNVnvrrbPt9QkzInuw5yWv0WqUhNsvdFZvglGrB8OlaHaBEarTQaxKGB+rSkazORSm8wzrS95NYcn17/W0rhVSfggv8Cl2N+EW1HZ6cVm4GAAFbY5ZgTRG1ltVVvJmQ7bTbj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762016300; c=relaxed/simple;
	bh=DuN4GpeTtcLzVNubqIDbQWs9oyUi3KcVMlMm871X5NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T36Wi6H7+fpnVDNNd7jtb8x+U1luZyCX12bAKWV3pZV1PVX0b9U/V4uw9v/SJWaqE8gsKTP611PLwhoOM85RvShv3vAi2Knm67cSzfaQ26oN+DCiz0Q0o4JeLRpeWDF7IfiOZORJYhU174Ka6s+UxBljcEPSzmxs7OwBbIQ8xOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLAv10NZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D5DC4CEF1;
	Sat,  1 Nov 2025 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016299;
	bh=DuN4GpeTtcLzVNubqIDbQWs9oyUi3KcVMlMm871X5NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLAv10NZdJbVp4isXzZLIZC6ygjoT+Qh5qBlelBoGrSmMKb1cNUYCZWXIFzNwLu1s
	 3D1B2SGotiLH1Ve7hJoAAOUbgTWUFKa6mOFRvWdjjjjvYBhs2iTT5AHXSQ04LWhKxU
	 mioksJe19rg4jYcWcYEgmuIGSIpKaMV99UUeSlT+GjgQUg8+Ju9vk++QmbXfA7qIjf
	 QY7Kq/fZAPVz6nUD6IYY9Xg4E/jb8Z/U3c2eBesTINMWLTyD+WyvD0+rz+GMr/mpt+
	 purRNg5IsHSmSqqNsJfkCvPV2FNRf2F4OSOgZHn7worquF+m8m1s3IRdv9HQhn9TDH
	 0sMasJDPmOQFg==
Date: Sat, 1 Nov 2025 12:01:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
Message-ID: <ba2zen62i74zr5sqrwqmi5ez73netndpuedk726clx27rsntf5@yx6262j27kc6>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:41:44AM -0700, Jingyi Wang wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Kaanapali and Glymur Platforms, which will be used to route interrupts
> across various subsystems found on the SoC.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index e5c423130db6..7c4d6170491d 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,glymur-ipcc
> +          - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
> 
> -- 
> 2.25.1
> 
> 


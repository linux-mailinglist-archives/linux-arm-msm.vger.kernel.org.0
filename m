Return-Path: <linux-arm-msm+bounces-72803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227AAB4FF5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD2803B3EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257633451D8;
	Tue,  9 Sep 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1vCEcbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF01B2FF679;
	Tue,  9 Sep 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757428080; cv=none; b=aSZq/fGbVOQfY4hE9lfNEyAezi/4OcmShgEJ7W8mqwGKzyw7e/Gk6c0NSpWeeHAiEdEeapYhCe43Ud8VJ+pjCJHnPlctqVVV8AdIqZ5Wx9WqMNEu0HyV/2UnxMiTlfOc3D/8/tsdWZO6bgF5Kdj4LSSCcCJv1SWX9XLZ0OcL6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757428080; c=relaxed/simple;
	bh=kd3j/NmXElMzDXtutAX1VLJUOBmvY2i0I/wqbF5TUb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIS/P3/XfGNAaQtYHJPg+t8edXChG2nk+1ygFt4F7HrnDIlsPGyYOA0YysQlhl5LoFT8g3N6hggcyfS1EeMU+36kMrAdPRpfdr5KqOhPW35IjincD+xA0ga5DfKIGjmXZLglP5AkzHc8gxEucediLhCNTJHWdzTcduxgNo/HDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1vCEcbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36CBC4CEF4;
	Tue,  9 Sep 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757428079;
	bh=kd3j/NmXElMzDXtutAX1VLJUOBmvY2i0I/wqbF5TUb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1vCEcbEwsWkiydXazh44kEtD0YNXdcuhi46NbSMidh5JxAuTTjAlwo8cClPyR581
	 r44+qRf864iJ9BTstV51WAiLmBhQxCVKUw+cTFD0/WPwAGh/r8d75OeDXl+FhvGTGU
	 Kd0h8E8ziBd4kRXUopOzWAiBetb1MJ0BDFyObbXyRbrF+ZOdagKIDuM8iUCYxSqclw
	 BnuhVAd5hX60zdVgmFAPvmujQ9suoCD8I1LRBtAZCnHlxhBJqHsLqhkddUgOxD2pu3
	 GXOUlHWvwezki3nAjGNgDFD6JhW9bPD8r5xwSbm29jE6AzrCW0x5n2fSdvg658hUmm
	 rGvao4z5rdGyQ==
Date: Tue, 9 Sep 2025 09:27:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615
 talos evk board
Message-ID: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909125255.1124824-1-tessolveupstream@gmail.com>

On Tue, Sep 09, 2025 at 06:22:54PM +0530, Sudarshan Shetty wrote:
> This adds binding support for the QCS615-based talos evk SMARC platform.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 03a7d3c92ecd..a5dbe6af68ac 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -952,6 +952,12 @@ properties:
>            - const: qcom,qcs615
>            - const: qcom,sm6150
>  
> +      - items:
> +          - enum:
> +              - qcom,qcs615-iq-615-evk

Can't we make that qcom,talos-evk?

Regards,
Bjorn

> +          - const: qcom,qcs615
> +          - const: qcom,sm6150
> +
>        - items:
>            - enum:
>                - qcom,sa8155p-adp
> -- 
> 2.34.1
> 


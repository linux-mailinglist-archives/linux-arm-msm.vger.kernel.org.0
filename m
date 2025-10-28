Return-Path: <linux-arm-msm+bounces-79200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A39C15411
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD701894909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EC633A025;
	Tue, 28 Oct 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ7KKwcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2A3328F8;
	Tue, 28 Oct 2025 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663056; cv=none; b=TkXOfCi3GLHexOlXzRGT1OODCGmvn7GawEdfh9dAxWYRP3WRg4tRGGSP4acdzDmmkbKbsfj4om57sqR/rz0HBxLwZ0dctcjaxGRIYXT1cAMfe9fEsiuB3ZUnf63DaMs6Tg2nmChNu5m+BA+DfXtINGpTiPcG7MPEOVe8e2COaco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663056; c=relaxed/simple;
	bh=c+qwy9ot9/I5v0SI70tCmFZP79XtsMdrHBxpPutRPuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LShs7+czO49HGTYiNlqqD0HCedS54xd92Zu+2oakFzryY9WKrhl0EuiLIc+TtI68HtpSOrlai4rRPXigzY/52lo3+EMPPohEYrHpBrqvJeZO9QINnJ+dxMPt1T2gLf46QYduIPxPUEhS1qhKoDs2TOFRlfHe63eluHcShspbf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ7KKwcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EC5C4CEFD;
	Tue, 28 Oct 2025 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761663056;
	bh=c+qwy9ot9/I5v0SI70tCmFZP79XtsMdrHBxpPutRPuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJ7KKwcBOLGlfhXafApGtP+iGyuBdK1E0zBdI6KhvrmeEMQeLIEeuzYGLPUxRECym
	 82uEPoHTLyFrqUhUXDDVKMY9u9iljs40jFadHXvFNqB6utcMOQYW7ccJCs8zjzAVXo
	 rvR9ccl/FvxgPy2vUXkpDz3gNCOHYNeUUg8jfMsRcKEZ/V88M9yWJ7EcJ39cbr/5Tq
	 DMqVQzFxELd6TePFLNbIvoaJw6TcjMVaabaXTBDqeFW8NFgfMrcy/5d0SJRcawhsNN
	 6nrFElpbvHAqIKyy1YOO7sPmX99AYMlfs6t6gZ7NixHXJ1FhOeiVlaEGS9JEfYywfq
	 MGwnSECnJlNlw==
Date: Tue, 28 Oct 2025 09:53:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Document Glymur
 compatible
Message-ID: <p4l2d4mow3my5zzgjieqxldv7dybk7qgfx2yshlji5svaad46s@xprmpn2s6na2>
References: <20251028-bindings-pmic-glink-glymur-v1-1-f76f00161f46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-bindings-pmic-glink-glymur-v1-1-f76f00161f46@linaro.org>

On Tue, Oct 28, 2025 at 03:59:49PM +0200, Abel Vesa wrote:
> Document the Glymur compatible used to describe the pmic glink on
> this SoC.
> 

This has been posted multiple times already:
https://lore.kernel.org/all/20251017003033.268567-2-anjelique.melendez@oss.qualcomm.com/
https://lore.kernel.org/all/20251027212250.3847537-2-anjelique.melendez@oss.qualcomm.com/

Regards,
Bjorn

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 7085bf88afabaa3dd9d0387ec0c800019850a60c..fa7704fdb9eacb712653cc21fe5f25f2435d7847 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -37,6 +37,7 @@ properties:
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> +              - qcom,glymur-pmic-glink
>                - qcom,milos-pmic-glink
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-bindings-pmic-glink-glymur-72148fafcdfd
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 


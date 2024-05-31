Return-Path: <linux-arm-msm+bounces-21318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 346ED8D668E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A9A1C2348A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159F91761B8;
	Fri, 31 May 2024 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMfbo/Pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D9176187;
	Fri, 31 May 2024 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172079; cv=none; b=kP0T8gOo/FoXhHFePcBGHgArD/NaCPaqPmJG1v904584LgCEVtHte4Fh26Zt1jHMXGPfaH10xkrAMeHg6hkypVAW+8aUF52gHs/u5jGyoQqZqpnb+bULc2slkKF0VJPyB2wtQ/c20xvSWcSY1VdCzybgzlwcEKi9m6pl+/LKYrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172079; c=relaxed/simple;
	bh=QdzlEyMDhhnNbePJUWmMm+1/sM2F1xaHRBUXUSNsT1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heK0GoCOLixrik9Nbkxami0EQaxlpArup4U/FyhbQhOmpEeHye8UhZDhII+sySFouTBQ6opTF2+1yQ6EwKrZwjh0K3DjYDyI1Y6zR90mr3YPduUgPlUzScBK54RkSSi3/37Re0iamWuTmbJEl1R4cfW+5OIafcUHLXMZa3we9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMfbo/Pk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6ECC4AF09;
	Fri, 31 May 2024 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717172078;
	bh=QdzlEyMDhhnNbePJUWmMm+1/sM2F1xaHRBUXUSNsT1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMfbo/PkJZXLjoSvSALFUeQNFcjVwL+/keE0mRGIzlnsx29xKsfizstNisWtcNwXO
	 X2XB8sAfudxx9gmPoBLZ1C2zvht2W+s0k4IG37vFpZCMLSal+KCgQV3QzpUmzwLt4J
	 s6mCstHLL0pB5+SjwfSV1JEIsDABEdoRC0tQVdzjjw53PsspkE6HoW/6fOqLWyhR5G
	 0JVoWAZkmjXIyoIjEDZZ49Mm2qHZHNT8o560N6Q8jaPyK0JtF7vAegrlQhLJ+Nzgb2
	 F5TIZP9TzQ9vmRvv37VINXY9mek7B1MFTjNU8fkMLM2q3SwHgsIn+s0b3eOph6T7T3
	 hdvQIPnVJGdnQ==
Date: Fri, 31 May 2024 17:14:33 +0100
From: Lee Jones <lee@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: Document PMC8380
 and SMB2360
Message-ID: <20240531161433.GU1005600@google.com>
References: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
 <20240529-topic-x1e_pmic-v1-1-9de0506179eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529-topic-x1e_pmic-v1-1-9de0506179eb@linaro.org>

On Wed, 29 May 2024, Konrad Dybcio wrote:

> These are just some more PMICs adjacent to X1 SoCs. Document them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index b7f01cbb8fff..a2b2fbf77d5c 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -75,6 +75,7 @@ properties:
>            - qcom,pma8084
>            - qcom,pmc8180
>            - qcom,pmc8180c
> +          - qcom,pmc8380
>            - qcom,pmd9635
>            - qcom,pmi632
>            - qcom,pmi8950
> @@ -95,6 +96,7 @@ properties:
>            - qcom,pmx65
>            - qcom,pmx75
>            - qcom,smb2351
> +          - qcom,smb2360

Abel already added this in:

  dt-bindings: mfd: qcom-spmi-pmic: Document SMB2360 PMIC

I've made changes to the commit message to reflect it.

-- 
Lee Jones [李琼斯]


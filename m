Return-Path: <linux-arm-msm+bounces-87215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8217CEE538
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FFF300F882
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9882E62AC;
	Fri,  2 Jan 2026 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzpZn9Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07FE2C0F76;
	Fri,  2 Jan 2026 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353001; cv=none; b=JQEYCmoLEn6lRqP4EjjQdqZ7N3QmH4w48UTZGgwlpDMVF+NkGTSaJC1nP9NSLC7p2cn11sgv9kYg0tNene8SCWvnoKaCmmcuG8cJACvMv5eU6nTEOlsgk3GkpnTTay1N/YM1KPn1ZHBUmYXAIb6TtErZ9FQBwj/okhB5o6c5sn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353001; c=relaxed/simple;
	bh=A0hT4+hoK/1Wjwpp9+mpnmzYk20Pow4qRCSe9OUBA9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVGxTv9jDPA9ZXFC/GNSSqbaNkep4ZD/NnowiGosC22OYTwL5R5AjWKAZWv7udqmonMpj8oIh3a4AaAxJjaUdzSOnLh3CEEmpliTLPHpgM/Cn7lFP/jsFRnEIUcPLsZ86K0npXhMxV5Ot8OYVu1YLk5rLv8N3KEo0UaIeWzW/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzpZn9Hj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21B0C116B1;
	Fri,  2 Jan 2026 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353000;
	bh=A0hT4+hoK/1Wjwpp9+mpnmzYk20Pow4qRCSe9OUBA9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzpZn9HjXfd4u+T5s8YZNUM7DkF4sf9eS3CJDzH6pkLxgi3sTuO+dNsNwIg7UcUDi
	 zW5zu1t2gmxVJ7XqgY8WG2UfdngAKSJ2yQzo591opVdEskyGZ/qz6mV03S9oFDNjPs
	 eO1cxcB7xqTTZsRZynnvXqaNnfASKoQNFxeg/OlgZHXI6YNa3QkGD/h0oOngYpZCqN
	 spb3H8FFcogV46m8QkjedbcWqKPM33wTWhf3r5uGFcspddgtRdJwCgFMBMFzLR07Dz
	 iM0E3dTunxTVpQy0uj8Jc1YXfIeH8wgIOIsdrHAdhg/5Tfgepn8wwzuXFPfog8yQUK
	 evSyTR4WzBRtA==
Date: Fri, 2 Jan 2026 12:23:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V2 1/4] dt-bindings: phy: Add QMP UFS PHY compatible for
 x1e80100
Message-ID: <20260102-heretic-angelic-narwhal-5d9d8c@quoll>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-2-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231101951.1026163-2-pradeep.pragallapati@oss.qualcomm.com>

On Wed, Dec 31, 2025 at 03:49:48PM +0530, Pradeep P V K wrote:
> Add the QMP UFS PHY compatible string for Qualcomm x1e80100 SoC to
> support its physical layer functionality for UFS. Use SM8550 as a
> fallback since x1e80100 UFS PHY shares the same tech node, allowing

What is a "tech node"?

> reuse of existing UFS PHY support.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index fba7b2549dde..552dd663b7c9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -28,6 +28,10 @@ properties:
>            - enum:
>                - qcom,kaanapali-qmp-ufs-phy
>            - const: qcom,sm8750-qmp-ufs-phy
> +      - items:
> +          - enum:
> +              - qcom,x1e80100-qmp-ufs-phy
> +          - const: qcom,sm8550-qmp-ufs-phy

85 < 87, keep the order by last compatible. It was already screwed by
Xin Liu in previous commit but you do not have to grow discouraged
patterns.

Best regards,
Krzysztof



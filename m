Return-Path: <linux-arm-msm+bounces-30626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2496B209
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 08:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA3BCB25567
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 06:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74CE13DDCC;
	Wed,  4 Sep 2024 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZD6yyAVS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6E13AD20;
	Wed,  4 Sep 2024 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432127; cv=none; b=LZh1mGaRTzgbBmypm7+kHq14qEc9VSP4yDw8JABxTQmyaZB9fo77e/k1Xggh3l+fzRdFIYAxnkEUbGuw6bVEY1wu5CiRWDjFtvWQcFoH64hM+S8DDaDyzZMSUe/PmIpCrATt/mFTzCfOMtDjWoc4QWDj0E01yRH7pFJp/9VYJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432127; c=relaxed/simple;
	bh=r7o5OJ6zffeVqup5ba63/AnfCP9SGWd11G8fJdwml4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3DLt0NH/YKW/Ex2YNzVZxIw9lmHUwwSd40c/sTa9tINPDvgEvhLxYe37wMsr3xypWyY/kXH98Yq0bmWjxuNwyTOszEMJF0Y1D4UiCZv2VlftN013XxBSZF79QZgStEh6++/+urq8JnLtdQvzcbdKNYXB4phV512WWeGCnKxkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZD6yyAVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27A2C4CEC3;
	Wed,  4 Sep 2024 06:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725432127;
	bh=r7o5OJ6zffeVqup5ba63/AnfCP9SGWd11G8fJdwml4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZD6yyAVSYn+9sr3y2OcxN6znt21xvkACQJC/zfqhIpLuL6xa2ouuTaZn+M8u8Xtgp
	 cLc/8LlkDMaWtznFcU7NQar9ekEVhS6b7ndE/duZt7MklacOEPR+yZpQsepusZ/SBN
	 TcPEZcjK2gyQ8/AeOibqz0hkJvniXdS7pWzuCt4/UIJeUag+x24OuvR+SDVAkAd796
	 oTLaiBLclV/dbmu8a+jIUFzVg1q1PW65sIaH3LEnaIXrdkA7DVEcHRUye1XaCd8J0Z
	 EBYMI2O2FcT3sMbYYOxkY+JLH0AsxsBPKksVoH08ne2vHNPWY6AhdE6ZJPV8b9v7A1
	 pW+k6QC5hY5Ag==
Date: Wed, 4 Sep 2024 08:42:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 9 5G
Message-ID: <3jvabmjo4tid6vkbjqbhmf2hfow7wv7dgux6txbsvxrefisgjh@d2bajvnwzj4s>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-2-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240903224252.6207-2-jerome.debretagne@gmail.com>

On Wed, Sep 04, 2024 at 12:42:49AM +0200, J=C3=A9r=C3=B4me de Bretagne wrot=
e:
> Add compatible for the SC8280XP-based Microsoft Surface Pro 9 5G,
> using its Arcata codename.
>=20
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



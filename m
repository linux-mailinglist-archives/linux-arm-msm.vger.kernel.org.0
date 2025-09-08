Return-Path: <linux-arm-msm+bounces-72509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59ACB486E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D439178540
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12092EB5A2;
	Mon,  8 Sep 2025 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll3+Nd6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB342EAB6A;
	Mon,  8 Sep 2025 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319758; cv=none; b=e7WWp2YLCbWI4z90rRyAEl/J7kb3oocNRCG5+acaFkWZAVi9YYtL7vr8WjJ9/HxEv7fpAGswk9972UU9znEhGK6ty2/pnz+JBa08cJq6zhhEA6s+r8Y5L8Q6zb50cAeicynVz07BwD807AHTjJMCdEMOglpGQ6VGfnvgqRWn7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319758; c=relaxed/simple;
	bh=CnLSaQxm80jSCsER2GLNHTt2gAwHrsghFhL25VddNfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0+ycycsUILGASzM1rDg/Qi+z6oT2RQBSCahkz6kurMlmgZDtkcbSiDHl/EGWrYrSB9EFawT50kvDm2z1Vj3eGcWQM8Yihvf1gB97jdtTIQ+JR2avBaiXVToHn63aUGMJKtGu01nCw9cIFvrf6TdNQCRSI0VEmbGDfpUCskieNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll3+Nd6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70282C4CEF1;
	Mon,  8 Sep 2025 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757319758;
	bh=CnLSaQxm80jSCsER2GLNHTt2gAwHrsghFhL25VddNfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ll3+Nd6LkFTgiUMlcjdxTs7iNzCIgPF4aYe6jaPHUIcBrHdJ1UV2xD2zwhXVgNKoY
	 4sGM79h9laExBSE7MGwz81nMeBGEb5tWO+Vi0W5KI+x6hbt1IVkkwX2h3+yQZqRuOf
	 EZVBegLd1IDJDa6EBLCXxBFETBvFjUBvcVqqisnPdYqInaORSKXxZm7dp5qAhOlnUV
	 6Zi0VueT4dogyBVB9hsvShJMRv0M6QDuwLR/4QkVwT9ElNE621LiM2uAtOai9wNoG6
	 p6GD+hH3N/1ih3yR4lP4sit7IKihBw+GnNLDubBEYnxDBWx2XNEfInuutEAL7J0iKy
	 ZbtcaEafKAPQg==
Date: Mon, 8 Sep 2025 10:22:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add qcom,msm8939-camss
Message-ID: <20250908-aquatic-masked-lori-9afc70@kuoka>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
 <20250908-camss-8x39-vbif-v1-1-f198c9fd0d4d@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250908-camss-8x39-vbif-v1-1-f198c9fd0d4d@apitzsch.eu>

On Mon, Sep 08, 2025 at 12:04:15AM +0200, Andr=C3=A9 Apitzsch wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> [Andr=C3=A9: Make order of items the same as in 8916]
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

You need to keep versioning. This is not a v1.


> ---
>  .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++=
++++++
>  1 file changed, 254 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



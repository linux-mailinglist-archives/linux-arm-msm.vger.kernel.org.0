Return-Path: <linux-arm-msm+bounces-79258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F2C16277
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D8E91C25E9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5A734CFB9;
	Tue, 28 Oct 2025 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNGB3jKG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBDE34C9AE;
	Tue, 28 Oct 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672553; cv=none; b=L7WWsRinxE1q2E2Fy1scTHaytH5GarW6fz7DomVRXsg0SJC/JnLA4INYdVXTeYoNHKMs2pEtTgEshG500g6sFYtbaT5dyfijzzQ74buBabd3OqA8hbECtZGhqRSZ2gN0OB3hUz2eaUU+p2XHfGNcPF5eoEYEhiJWhQOpWFhiLIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672553; c=relaxed/simple;
	bh=x7JOSnMPcduMJf98gQKHKXMvFtwmt8rz7DaKQl9AYio=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=i1QA80bGb5mK019M6nnHsws/0yi6bvO9O+oiAPF9KdrCUzhJuxRz+aNcYqpPLiooINMsE3G72nPBaEabOUSTQSVERVsmr2sFwy/g0CzBUh02F4hWNfmjn3OB1nRm4LeEIVzjmYB3koBiLUr7UnD7lt11XIEFAzPMeVTzHcDj/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNGB3jKG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BCEC4CEFF;
	Tue, 28 Oct 2025 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672553;
	bh=x7JOSnMPcduMJf98gQKHKXMvFtwmt8rz7DaKQl9AYio=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZNGB3jKGy7cm2CDtlTGnPR5J2gQCrpGLr2Ahiy6/gT/gwpdUj9LHa64vTZ4/70fQd
	 OxNVPn1BhmIB3FIboX6TqEBUmSv7k7EuT0na6RuEfumg8znMN50Un5fVfBVOfXlx4+
	 cfNnEYRkXsDM5eYgElPyHW0+WVPxIGkUTP9eyhjcjBPleXrD9shFauO6QvWxtN+OMo
	 +D9OXW5Ep4WSDB+6XaUabTtzyegNHA4uh4Zg7oE0NWkXgf7/gzYZQ70UkvIqh71WGt
	 c5W5ws0FsCrmhlWOsK1pAlT50UIoz0BoSH40zGlrzkXEMENvyXosb8IMjXRB7U2N4w
	 RbqO8Td6aZ7VA==
Date: Tue, 28 Oct 2025 12:29:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
 linux-bluetooth@vger.kernel.org, Rocky Liao <quic_rjliao@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-4-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-4-524a978e3cda@linaro.org>
Message-Id: <176167254551.2794738.406064217328056234.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: bluetooth: qcom,qca6390-bt: Split
 to separate schema


On Tue, 28 Oct 2025 16:31:53 +0100, Krzysztof Kozlowski wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qca6390-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    | 64 ++++++++++++++++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 15 -----
>  2 files changed, 64 insertions(+), 15 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251028-dt-bindings-qcom-bluetooth-v1-4-524a978e3cda@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-arm-msm+bounces-79260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B45C162AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FA41501534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880EA34DCD9;
	Tue, 28 Oct 2025 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/3AKvVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9334DCCC;
	Tue, 28 Oct 2025 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672557; cv=none; b=qq+RW3quRyYI7iu7eUV9lfsKikl79B80nbVaWFaLyXHOYSCRsqLqBitlXKErGNVDVrtGrMQHGZSU8nx51df5ciuIk+hNZh8Uk/shk31PqmGk5YpzUk8Y5M5PqGni4zKp6RQCT7ixVAB7M6qw5Y0BoGdF3Z8rboGhdpy7zL5LeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672557; c=relaxed/simple;
	bh=SlOKNstFKaaueGB/AyFAzTIoP+zBnaPGWTaBaVu1fkQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=W058wy+/9o8zkPwKvDcwgWQsGDXBUqcx04rUOIyOKNzfBJbPNFhIbiwXJ/Ww9S9hQrxKt/avslNIOn4+osC4jNqFfOSylbjI180VLyXfb9xcc9VghkjVKk4rbOFM34kY5XQufYX51npBFZCcxJBafjN73i0yM0LCWJi5FptBySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/3AKvVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B70C4CEE7;
	Tue, 28 Oct 2025 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672557;
	bh=SlOKNstFKaaueGB/AyFAzTIoP+zBnaPGWTaBaVu1fkQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=t/3AKvVQ1KXN9kvnKPWdfOqWlob+mnSxNXEvmiOf9/qqQYc4Z79xWahxulUJfenuE
	 lXdRPedcl7tlT1NX9zq3q1oPbMhExe+x18Mv9OGAepn7hz55VHXO981766u7QaBz8J
	 mYNH6AP28nH4RVpwBuelWUOR+18iRyXAQJ3LtNWfQkdvPr3Vqfr4DhoyjWMjwUZzbU
	 hXrWNoN8gasQaeI6uMhSXBbixfiTtx6/XM0MGRMwg8Ab8L7iHGJouf/wpsDgBr+3qu
	 UtixOUt/AAHy3xe0hJKZ2OD7H3aA1a5HPaXfNLnf3vu9cOBk5VAT1plrQi2sXK+cnv
	 K7qIE6yTp/ONQ==
Date: Tue, 28 Oct 2025 12:29:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rocky Liao <quic_rjliao@quicinc.com>, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-6-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-6-524a978e3cda@linaro.org>
Message-Id: <176167254795.2794822.10305900307376723190.robh@kernel.org>
Subject: Re: [PATCH 06/12] dt-bindings: bluetooth: qcom,wcn3990-bt: Split
 to separate schema


On Tue, 28 Oct 2025 16:31:55 +0100, Krzysztof Kozlowski wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,wcn3990-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> This binding is very similar to qcom,wcn3950-bt, however devices have
> additional VDD_CH1 supply.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    | 66 ++++++++++++++++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 40 -------------
>  2 files changed, 66 insertions(+), 40 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts:24.42-58 Unexpected 'GPIO_ACTIVE_HIGH'
Lexical error: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts:25.42-58 Unexpected 'GPIO_ACTIVE_HIGH'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251028-dt-bindings-qcom-bluetooth-v1-6-524a978e3cda@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



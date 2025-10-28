Return-Path: <linux-arm-msm+bounces-79257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5CC16298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 172364FB343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3383F34BA40;
	Tue, 28 Oct 2025 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehnQNThI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047EA3491DE;
	Tue, 28 Oct 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672552; cv=none; b=O0fTCFKP7xMdCgcwv+8UTR1YR1kTgsZ0BW6h5sj5/P09eIHEsgpF1upgwkas7bKxVo3gBnT9J1Q5VW9YbM0Xp6dB/RvsJE/ZY+P6hELpGg72os15nAU5M/Y61Oy6B6ISf6/f0cqh1M/S1sSGUdps67ehrYMejUJ4F19Ksch0F68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672552; c=relaxed/simple;
	bh=uBujIXxcJJ5J7YgHgbMjKDhgiyGUCxraK0bCGHbpblg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MxNho1eff2buu2lndUyOsXmqxqMNdmc2p3SASkekJO1mVYQG1zr4T40J75qkFHMMEyQfaUU/xHVSbc+Xr8cAb1ffsBOgbuAMlmdS/DI9J0vUrE7gjUZzfeX+bp3PTUaQdhowYadiRmBEb9zwJtAWvstWoKDvNn0YMpEwsv/Fy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehnQNThI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46214C4CEFF;
	Tue, 28 Oct 2025 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672551;
	bh=uBujIXxcJJ5J7YgHgbMjKDhgiyGUCxraK0bCGHbpblg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ehnQNThIiCAbVMYLt5xj+ZtD6TSHhZOf9rVXYCR4mgqawIp0PQVmn2XkZE0mjLDOL
	 KVI1pBR2mp/PaJHOQVcIjm4A4ZV09bu5xCA34n5mkcFuaybYe1XWK3tk7FFklq/uaw
	 GjzuGvj2QTQizjmvj45S2Wwx2zKsRMEGPQVK/lGcbXcp9zEEQxqoqortksuNEcg/ft
	 7fG1C/wQqP/2Jf7eC+jFxtSyvv4mDjPVPc09c0SbjBSYKE9Fthm2elsgWeHjGLE3+Q
	 5iJkyOP/+CqGpuEUiYHI0qUL/+WhGlQw93nxECuj9EpWrb5h/AIwLrIufsJ+Lc/ism
	 /X5PqdIbSye9A==
Date: Tue, 28 Oct 2025 12:29:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-3-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-3-524a978e3cda@linaro.org>
Message-Id: <176167254431.2794699.14746757595036149744.robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: bluetooth: qcom,qca9377-bt: Split
 to separate schema


On Tue, 28 Oct 2025 16:31:52 +0100, Krzysztof Kozlowski wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qca9377-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> Existing binding has incomplete and incorrect list of supplies (e.g.
> there is no VDD_XO) and Linux driver does not ask for any, thus keep
> this state unchanged.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    | 58 ++++++++++++++++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  1 -
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251028-dt-bindings-qcom-bluetooth-v1-3-524a978e3cda@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



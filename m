Return-Path: <linux-arm-msm+bounces-79259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69930C1627A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894251C25D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D708C34DB43;
	Tue, 28 Oct 2025 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQCuHb4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22534D936;
	Tue, 28 Oct 2025 17:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672555; cv=none; b=eijhHvRc181IvOHog3WcYGh7/xwj9xNRbcI0fy26ZAsw0vGvxVINW7FfMpZ74u+d/lSV1sjNUUel3FGmABnbBhhrgGqErtvYrmP0ewDJnHwWMDfEBVQFCV6Fj3KWVwORsFehdeSF+9i9q54f4PXCUAiQTPvg5XDpoNMM6RyAHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672555; c=relaxed/simple;
	bh=FifBP+4KE1PURAtoa+bAWBg7GcTdwiLD21W6m8oc0Ak=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RH/bsE0UapRHNfG7X00H61PAnIzckzwVb8B5hqRvkQ90STHcqb/MMaNq4p28rjPjzcXnkZ2+lw0+8uOXgY9wFXr+wWdvoaAOVHH5/NBm8UBNDdIl8hbidFXjVrQoEFoCpshnDyuOIM7Sl/RAoc6Zc2uAGsvpGJimhUnvvfXlW3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQCuHb4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BBBC4CEE7;
	Tue, 28 Oct 2025 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672555;
	bh=FifBP+4KE1PURAtoa+bAWBg7GcTdwiLD21W6m8oc0Ak=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hQCuHb4epNPOS2PO9/S2/1OLNu5/eqamn95gFAqKdzlLIuiiLNRj4v0IrqDyQeaKN
	 VTujzLR2RcPSED5up/a1UQ+mCVvSnoPYw4oPDL9xfcdST/qyZZgX7WF7YzWhr3HHe7
	 rhiXYc57XUY6u4TEywl54QIOeb764yZfLjeN9IJp5V6y3qD/MzWs0sO+oRQNT2Beds
	 KdSvwDnlbIbnpzf0v8Pv+YOO4FcNPEdOZ2RAOc3Ds26IS+UCvdSskSkow2q03I4I1v
	 pJvh0UmAv4MN2tRH7Hy5tX43uT9pi7hVL4PKX2ws9ACYsWdx3Y+Tqwab/qr8r/7yXl
	 L4P+rkldSjeCw==
Date: Tue, 28 Oct 2025 12:29:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
 Rocky Liao <quic_rjliao@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-5-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-5-524a978e3cda@linaro.org>
Message-Id: <176167254671.2794778.17393737461667637294.robh@kernel.org>
Subject: Re: [PATCH 05/12] dt-bindings: bluetooth: qcom,wcn3950-bt: Split
 to separate schema


On Tue, 28 Oct 2025 16:31:54 +0100, Krzysztof Kozlowski wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,wcn3950-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    | 67 ++++++++++++++++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 --
>  2 files changed, 67 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251028-dt-bindings-qcom-bluetooth-v1-5-524a978e3cda@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



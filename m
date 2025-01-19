Return-Path: <linux-arm-msm+bounces-45507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB64A1617D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55BAB18863BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0E71DE8A2;
	Sun, 19 Jan 2025 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bN4L3xBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6F1DC9B8;
	Sun, 19 Jan 2025 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737287598; cv=none; b=ncToJMicqZSJBS5FMTSEDI5U5mWjaAQ7HK9XcFFNBBto1lcbBtzRIIq4SmQfA3Rl5xDb8cZ5vLpc+UBxAamoJ/pQ81Ab6IPJ/J9Q0lBZIk2dsUF3d8Qs5+JyM1+o9nDsqahldCe42rNadLocK/vDc85FHdqw1W0aRzXchDtLrag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737287598; c=relaxed/simple;
	bh=uxIvwK4AoMSXrXG7hoH/WiBzwCDlc57TnYp8UffnNaw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dSMQzG2NHfxYT0r8fsRFoL6X8xtIWPVNTvbzqj5+05+znYUJyEpKDWBLK3WQbP4BpuKM++8u/kewy/duy/IqtdvPgfKlqnAY+TlbC5waHRhZ4BCKTaetAAJMYLtQM1BcYhVJaTHX7qwMVWIXZE5auJABBu3AD2+T4E0mqxX/e6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bN4L3xBf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BDAC4CEE4;
	Sun, 19 Jan 2025 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737287597;
	bh=uxIvwK4AoMSXrXG7hoH/WiBzwCDlc57TnYp8UffnNaw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bN4L3xBfTeMz6vta3ECosjS3Stdij3hpjlUnwmfWB3q+IkrCauPuMInVLKXZ0Zx1x
	 aLl1WMk2L2a2m20nr7649Wquw3h12ZxLHRgBOkdJ0Dbl+cSuLVjnoqrgJOLWE2/mxA
	 UKwYE4S5jijni/OUmZ0SkQFXueTygFZx3Nf20dr+GP/jzVcKniTCUl6A4hrGlyKh5e
	 RRX567y+PNIok4x6Rl/xJynGb9HiLmsJqm+Mb9CiNCoKDjYjHY4ZwD0qRGTwJSQh6l
	 9MqgvT2D9xcaWiFhDitRykqy7Npy6Jefh7k5wKYIiHvyMGzrLu7ymKDVl7Zz+7Y5L+
	 dNyOt80JhQfFQ==
Date: Sun, 19 Jan 2025 05:53:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
To: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com>
Message-Id: <173728759363.813145.4986928739834717140.robh@kernel.org>
Subject: Re: [PATCH v4 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller


On Sun, 19 Jan 2025 15:53:02 +0530, Taniya Das wrote:
> Add DT bindings for the Video clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
>  2 files changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-arm-msm+bounces-37209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC59C011C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AFB7283230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06541DF96A;
	Thu,  7 Nov 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQllOons"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E92196D8F;
	Thu,  7 Nov 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730971692; cv=none; b=SflT7TSkwRh/WXPuVdQ/WWAson2NQYoBJBO1T/4cpU6xQ3Uc3PQJtGIcNCcBmiEttVIrAFpgANMwj2NMTnOQjUSHEpFjLB2oz2tuAx5Ev1vn6bfoE+jvxCQ/gQNYqKQwN5EinPTPE8HdekRKzw3fbMdi/qvxmjTDuP+KQpGWrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730971692; c=relaxed/simple;
	bh=inInmAOEGIQYmj1++GbuXfyk7lHVgFnSJgJOGWipTjk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=t56FrU0hZ7G0q3mBaM9AErQZsYS2k43CKhGSwAk18ZFYXPz3bk1xR8fF+N6iQIYK+mHodch3UqikRJpunIzj5TUk//ulbXOZpURylTp4LDqaV92oBrKe7PW1JfEQWLP8YBQHltz4AUrTKlVsiNA9NVlbU8A96Rop8rm+I2wwvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQllOons; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B895EC4CECC;
	Thu,  7 Nov 2024 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730971692;
	bh=inInmAOEGIQYmj1++GbuXfyk7lHVgFnSJgJOGWipTjk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IQllOons9q1GW676npTQaZgApYsAUUlpYXvsxx/H2b1czH53GlLQ3lQKvskzA86pC
	 0j49vyiVHHTYAAqthSAER06O3cssf/XyzD8kSMiwa+FeLfW1xMKr4B6hSwqHKTFMi5
	 RsSF58uhhEnJqidtGbkPffwbQTs9aD6M4whwKPy/8GhS/hsm9H9lx6jqAug7E2VC4E
	 zQ4HGlIYp/nLbWYhgzo4HYlPynQnOroCiqTF4jmykZwN/78FHLysdum6vXgbu28p7/
	 f1IRWTu9tTqzLj1y1Gmk+7LP+n8j5XvHk2eFpXrw9a5hcOYXO+fknGoNrmTvnUZJC+
	 J6UmAfPIyoWxg==
Date: Thu, 07 Nov 2024 03:28:10 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, quic_rampraka@quicinc.com, 
 Conor Dooley <conor+dt@kernel.org>, quic_nguyenb@quicinc.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, 
 quic_pragalla@quicinc.com, quic_bhaskarv@quicinc.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_sachgupt@quicinc.com, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org, 
 quic_nitirawa@quicinc.com, quic_cang@quicinc.com, quic_narepall@quicinc.com, 
 quic_sayalil@quicinc.com, linux-mmc@vger.kernel.org, kernel@quicinc.com, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20241107080505.29244-2-quic_sartgarg@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-2-quic_sartgarg@quicinc.com>
Message-Id: <173097168998.1358564.6585218093768664587.robh@kernel.org>
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter
 flag for SD card


On Thu, 07 Nov 2024 13:35:03 +0530, Sarthak Garg wrote:
> Introduce a flag to indicate if the Qualcomm platform has a level
> shifter for SD cards. With level shifter addition some extra delay is
> seen on RX data path leading to CRC errors. To compensate these delays
> and avoid CRC errors below things needs to be done:
> 
> 1) Enable tuning for SDR50 mode
> 2) Limit HS mode frequency to 37.5MHz from 50MHz
> 
> Add this flag for all targets with a level shifter to handle these
> issues for SD card.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml: qcom,use-level-shifter: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241107080505.29244-2-quic_sartgarg@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



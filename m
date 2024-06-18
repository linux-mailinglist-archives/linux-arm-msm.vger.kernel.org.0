Return-Path: <linux-arm-msm+bounces-22998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B190CA1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9A1E28E5D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4969F19EEC2;
	Tue, 18 Jun 2024 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcWqq19g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A0F158DB4;
	Tue, 18 Jun 2024 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709157; cv=none; b=EW+pIR6WbOO3QldrNZFUYnsK23OQrZxQRUpoREBmipKGciah0G28cGiHTY7OjVatfcxdCQvEadjT/MPsYZz4VixJuCxvycKEgpqfP8r1wRQrzqefxEuCu6ET8DNT8Qzzzj+i4jtDf6zhwrClOl+GJkTjBEAPTeAvXMbqlV4cPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709157; c=relaxed/simple;
	bh=0GHupV46ZiTQkCvR/9xjYYpLuWY+JLethuNFtKgsOBw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=o4ou2HZ+DDGriBsdl1PNyhrbYbZfKKK18atYwgzCj4TXOXU7fhajZDurLF9vP83ertgLZr6gbqoaJkHT9kQ1TJoKQuw74WI9t+B9A5mm9TUOBwgUvVJFtV44PU9nTsNyleWLPB9EnsW9FXjxu23jqgLhToaLqmixmUx2UsnLue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcWqq19g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CDCC3277B;
	Tue, 18 Jun 2024 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709156;
	bh=0GHupV46ZiTQkCvR/9xjYYpLuWY+JLethuNFtKgsOBw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FcWqq19gnRsWN+uOVya+nn3wDKn5n/t9aaUP7vQBiIpz7Aqs7bhUHUtjg//tp34gG
	 j23hOHiEUJlnfoVOlg+GiHPjFtpoBkOZCEDHdaZtKInh4TCrqGlbfjua7vhRstYkEI
	 CpWLV7nMht88H2eGDOGmG/TUCWluPcKRSLaDYsIqLeZVqE+LjzUvJPrncdjn3DzYri
	 0y5p8b3jwVWQObyuyRb6NTrE6hxtGNRYoTwT5tM5vKo9KDgIQ/uY7tFSptf2N0NnIK
	 AfHcSwS2YLYiEVq4jjp3GwA5XGkuDpHSYuL6un7dNS8GzWq5PsHWkViRHrhMxHPmmU
	 rhFCUiwMOvJhg==
Date: Tue, 18 Jun 2024 05:12:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, linux-kernel@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, quic_xinlon@quicinc.com, 
 Song Chai <quic_songchai@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>, 
 quic_yanzl@quicinc.com, Tao Zhang <quic_taozha@quicinc.com>, 
 andersson@kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 linux-arm-kernel@lists.infradead.org, quic_yuanjiey@quicinc.com, 
 Konrad Dybcio <konradybcio@gmail.com>, Mike Leach <mike.leach@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, coresight@lists.linaro.org, 
 Trilok Soni <quic_tsoni@quicinc.com>, quic_liuxin@quicinc.com, 
 quic_yijiyang@quicinc.com, quic_sijiwu@quicinc.com, 
 quic_xueqnie@quicinc.com, Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20240618072726.3767974-2-quic_jiegan@quicinc.com>
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
 <20240618072726.3767974-2-quic_jiegan@quicinc.com>
Message-Id: <171870915568.1107169.13844924050806547324.robh@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: Add binding document for
 Coresight Slave Register device.


On Tue, 18 Jun 2024 15:27:24 +0800, Jie Gan wrote:
> Add binding document for Coresight Slave Register device.
> 
> Add a new property to TMC, qcom,csr-atid-offset, to indicate which
> ATID registers will be used by the TMC ETR. Each TMC ETR device is
> associated with four ATID registers that are continuous in address.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/arm,coresight-tmc.yaml       |  8 ++
>  .../bindings/arm/qcom,coresight-csr.yaml      | 76 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml: properties:clock-names: {'maxItems': 1, 'items': [{'const': 'apb_pclk'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
Error: Documentation/devicetree/bindings/arm/qcom,coresight-csr.example.dts:43.3-44.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/arm/qcom,coresight-csr.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240618072726.3767974-2-quic_jiegan@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



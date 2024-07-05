Return-Path: <linux-arm-msm+bounces-25370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B79286E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845D728515E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726E3148853;
	Fri,  5 Jul 2024 10:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CL6VGoNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D514883F;
	Fri,  5 Jul 2024 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720175907; cv=none; b=JAVxgJHMHD4Ef5DC1mceK/9s3eYFB2eo3UptDs0nZuMYhtKt0QgWEG/rirvaMf+dkqYlSeEzCpExDtJcUFB58Oa7O3+Bv8UQlq1frSunegt3kudm4mYdJYMP89iEXg+tfxtpcU4yUO3RkzWKLxkkmzy2rmviv3llZ0pQFcWYVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720175907; c=relaxed/simple;
	bh=iEZnnK2AWEZC7uLR/+qs4jJV3guyk9LlQ+WyeybrVD4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ekzgxN90WVCHXrxYHMhvF+tqVNOwq0fIS+pEX3KylMKVKAXrNizBKLNh3rzeNcmUin7JiQ0yUqYfBn7o9BqTZmVpF9KaZCi+8RfhjGywJepsP7IsoN5hvp3H6Q/8t+zDEags3XHR1eR9/xaHzpfqGKJ5ZCBdxXdgdjCrZ3LH3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CL6VGoNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C250C4AF0A;
	Fri,  5 Jul 2024 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720175905;
	bh=iEZnnK2AWEZC7uLR/+qs4jJV3guyk9LlQ+WyeybrVD4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CL6VGoNNt6O8bFsCs8v7dbqhjV3s08CrZNbSKLf0mM9Cx7BGdFX53D5biTYjhbKfp
	 q6o44TcbT8cjcB1WJoDv9nkJZQRl0DY3tc41H7lSCvKLmZ4IC/7VRud3jQzyfOYfUw
	 FN64NAxlEgyZyDCXcqKyz+OvczfjJc7bhpZiRXHBxTSVVgQ76z6+V/MoWHV9Z0wDEq
	 s9HmjSnD9UVfzlOTMf64Pz6ODnKOIn/PbNwqQMbLhEw9MjOSho5iPS3sJX3KcTg54I
	 GTyDgseZ0CKALh3Drjz6PrtsXLcE6aAdfe6rIw3lVC7tWoL6202G8KKaEn6MHPqc2E
	 N17GbQFOZTOrg==
Date: Fri, 05 Jul 2024 04:38:24 -0600
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
Cc: Trilok Soni <quic_tsoni@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Tingwei Zhang <quic_tingweiz@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Song Chai <quic_songchai@quicinc.com>, Leo Yan <leo.yan@linaro.org>, 
 Jinlong Mao <quic_jinlmao@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 devicetree@vger.kernel.org, coresight@lists.linaro.org, 
 Tao Zhang <quic_taozha@quicinc.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@arm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240705090049.1656986-3-quic_jiegan@quicinc.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
Message-Id: <172017590340.2933768.7232556209802046646.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: Add binding document for
 Coresight Control Unit device.


On Fri, 05 Jul 2024 17:00:47 +0800, Jie Gan wrote:
> Add binding document for Coresight Control Unit device.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml: unevaluatedProperties: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240705090049.1656986-3-quic_jiegan@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



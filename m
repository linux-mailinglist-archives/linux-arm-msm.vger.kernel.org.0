Return-Path: <linux-arm-msm+bounces-69756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63BB2C3C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 14:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599AD16FC2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A59932275B;
	Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1rfmTDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3D231A050;
	Tue, 19 Aug 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606749; cv=none; b=XsywMq0wdMUGPJ2X0uKzoee+F33NEIXSyB+8rTaSUOfTiBRbDDsiRHjKbOfbEiTynphMlAo6e+hdo3RGwJTI9zXF5cr9lSuilTmBZV+b2cV2pN1gu6V6/bvJTKqaYB8ARk5YQViRa3Gfz5umAintI0SLdxzWLxMXXtLnweO7D48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606749; c=relaxed/simple;
	bh=MTiHv6t2LpJIY7fgJdikRO0+EvUhRQm0Kzkj4vfM1+c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iA1NgkBH7cE/6qMVVYcCf0OMuq9SWtJjLW3xCpcAj1qUf6E0vAWOrYxXjFL0kH+sBgVs7rzA7jMI0GXhdrxHk89/PnX/2tYmGCvn5rJXIN7zkqsrwAqkoTh3kqYr5R6XZ7kvlGrfDhgMUebsw43fYSP3wFih3Gsf0yAfaazbcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1rfmTDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD125C19421;
	Tue, 19 Aug 2025 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755606749;
	bh=MTiHv6t2LpJIY7fgJdikRO0+EvUhRQm0Kzkj4vfM1+c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Q1rfmTDm0WCrzSxGP1lVOKYUmYsUym84cdSHq9O3bu+WYLcLQ9rWqAJ3svPS8z9vR
	 sRQdwU/UvRczMP75BeelR26iyOGgK502Ltb275jIIzqJWlIYBb2763ZzqTmA4xVh56
	 VYuFkU1sIGcVGTd6z8e1uFLKK/1sIHE4ij3BMWMikxHH4tq7IMHow8+c9bvLIyzlqW
	 xsHTaHz2MLxYuYguwHGXSlilW3OpFAM/onIWm5ctWslTcbjZsAjAiZnTD5HAd0TSZa
	 Zenzii1E7Acb61MWpdhb2gSEqDgQTee8KO0aKLTAI4+0bTNSSGdQQ1Xpbp7tCMNrm0
	 SQfpOokxyx2rw==
Date: Tue, 19 Aug 2025 07:32:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: James Clark <james.clark@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org, 
 kernel@oss.qualcomm.com
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
Message-Id: <175560674472.26193.14154235220441518996.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC


On Tue, 19 Aug 2025 03:27:43 -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



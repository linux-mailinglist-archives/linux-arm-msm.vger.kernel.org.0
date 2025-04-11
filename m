Return-Path: <linux-arm-msm+bounces-53980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E6A85992
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8851605DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E441221272;
	Fri, 11 Apr 2025 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQk5wyKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4104219A86;
	Fri, 11 Apr 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367019; cv=none; b=uDO0IWMp6bvCj90QVOcd4yKqhXfeBVorsWB7tZp2SxYDvlQfy6nzErlEC8nt7oau0l5ILK8gtMUV4IMzzXyaInm1+1eoeh4/KvGHvGGW+qZmnEchR1kLz8wOS3mseFcoZNM/3KfzbgxhyrO3pgA8oPATWhl2+y3/n1edfGTz8kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367019; c=relaxed/simple;
	bh=CeBdzRV91w3LrNeyTj22CoKGG0an90zsDGxRfFa9lXY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lbI0uw8h4PgXOjPvOR96zg0YeC0sXXQoWpZp9eJSQ+FhZjry05Vv1YMUH+R50DJSAAfzJK5RETp1JM9CXw14TKBTEQgQp5/11Y3GcrE4JcoZndPSVzJHkVmICiAP8pDhgYDnUdNVVzJdnWdkR1zKU7VVmnXi7F0Z0icgc9Cpdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQk5wyKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC98C4CEE2;
	Fri, 11 Apr 2025 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744367019;
	bh=CeBdzRV91w3LrNeyTj22CoKGG0an90zsDGxRfFa9lXY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DQk5wyKgHVSXrUJHlHibUyuAVoAYSiapJvVn0MwGJ0YB4bN9quCCmjrwvTbyFPRyN
	 lLUCOXFd0bSAM/0kqK1DcqIH88t0awfJMPOJMoC3jl/kc5lOJZm4SdQl3WHSzz+e7W
	 xayICKeqKYCLAO5794cymNMeRCtBzrBOYJp91/7JCIHpJfcLgOT076WYGsiQ6ZqJm+
	 quW6BaZoML7nuzumD5R8PVUtQ4KpP5Q0wp1h2YDdFEV/lXsB7aG00vdE99kDof4b51
	 VNkD8jer7Q4lxS+sWFSO6wFf42SRc+YG2j39gqPSxDsTou879G+zaCztbcf9dYHGZr
	 ZjImiiv2qJLrQ==
Date: Fri, 11 Apr 2025 05:23:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 kernel@oss.qualcomm.com, coresight@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 linux-arm-kernel@lists.infradead.org
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com>
Message-Id: <174436701568.2577511.18034852387802198634.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add device Trace Network On
 Chip definition


On Fri, 11 Apr 2025 16:57:52 +0800, Yuanfang Zhang wrote:
> Add a new coresight-tnoc.yaml file to describe the bindings required to
> define Trace Network On Chip (TNOC) in device trees. TNOC is an
> integration hierarchy which is a hardware component that integrates the
> functionalities of TPDA and funnels. It collects trace form subsystems
> and transfers to coresight sink.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.example.dtb: tn@109ab000 (qcom,coresight-tnoc): reg: [[0, 278573056], [0, 16896]] is too long
	from schema $id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250411-trace-noc-v3-1-1f19ddf7699b@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



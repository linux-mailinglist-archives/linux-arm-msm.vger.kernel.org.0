Return-Path: <linux-arm-msm+bounces-79429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D8C1A132
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B640565DBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8763330B12;
	Wed, 29 Oct 2025 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmNN9tZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8932F757;
	Wed, 29 Oct 2025 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737329; cv=none; b=JetBpWOTV1O+2ptBhKWLgh+SQfdimn1yxxnDXfvBx26ap7lMSEfO6KOoygUv2ab8410gimW7nvmFuY0DDF+BDdmh7Q6VU0i3m5fmDEuUkmGqHOfn2f2/bzLdjvBjpdeSBVYNqa3Ei/0d4nvkcy7PHossCTIDDr7LCyDAUSK8DxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737329; c=relaxed/simple;
	bh=10LKGFEI693cxXXD+Q/n/vKAUuZe+EZS+v/Zx/82cLs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rEoGoFZAQGv8hBochZFBsK5+HynoicF/KVGhFrlkEG4AzXmX0nVELnG3MBhl1B5OuaHES6NZAuq2ZiJl3ecebLK9IPG2pw4xJuqLHrUEcn4e+o/AFLKZUwOXB28lhIRwzVEvA8OWODv+Fh/r10cJQu0tGgIplwM/FKFgBtYd1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmNN9tZY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72EBC4CEF7;
	Wed, 29 Oct 2025 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761737328;
	bh=10LKGFEI693cxXXD+Q/n/vKAUuZe+EZS+v/Zx/82cLs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AmNN9tZYkUIiLFcRKQKF+NOQO9fsqTZ1BgIylisUSgz0m0j9stL/ovFoUEo6e+ubR
	 TjmmRSbueIs6plJUoEcGIkW8vysc0AFsEeTJ5KOaplzvM80Zu7doLEGAoPS9ij9RQx
	 RmqwztsruC2Ai5MjUE9SWt36ox5DB+an6CjxqLDYrOtSw5wRJBF21VNIgtb5zg3M/G
	 JA2fbf7edMago8YXJRFmVB44cAI1f5rDUMSHaBcAdrlxdIWY3GWipSbhOkfAJSPXIj
	 NsOipgcu3NUBKDnxMA8kUuN7bEqF60NcbotWpsNCjnI3m5ENcV3/9cC0j0OyME+Whl
	 sj0+Z+/IQjihw==
Date: Wed, 29 Oct 2025 06:28:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, trilok.soni@oss.qualcomm.com, 
 Bjorn Andersson <andersson@kernel.org>, yijie.yang@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com, 
 tingwei.zhang@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
Message-Id: <176173731073.226348.14173297054891268954.robh@kernel.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms


On Wed, 29 Oct 2025 01:05:41 -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states" and "qcom,smem-state-names" properties and
> add conditions for the "interrupts" and "interrupt-names" properties
> in the pas-common.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
>  2 files changed, 194 insertions(+), 23 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:67.46-62 Unexpected 'IPCC_MPROC_SOCCP'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dts:70.33-49 Unexpected 'IPCC_MPROC_SOCCP'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



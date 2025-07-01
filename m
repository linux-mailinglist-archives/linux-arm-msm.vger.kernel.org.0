Return-Path: <linux-arm-msm+bounces-63154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350AAEF11B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDDE14A04AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D20D213E6D;
	Tue,  1 Jul 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceOjQ36n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319FF1C6FF4;
	Tue,  1 Jul 2025 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358621; cv=none; b=CTzy06fng5Xe9ZrlcE9YqThznMQ5eEeJljEuZbabkZKuW0FY9AxXStoEB5UqpXoMfS9uzY1d4hcSRLp+MIy5z3EVv5hOzcTagUUWCqSnAPrzZullM9taTs8v+Kyn6XOV04eI0Y0SI3tLUlHPXNEiV7JfEIlDYSbySpgqpTuMVu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358621; c=relaxed/simple;
	bh=HL7i/yJKOopc3B9FVmXFkyNK1QnF2R8I8jERrgLs0HE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=exxq8GZK0n81R8qEMu86x0PsUasff8nrCRFQbYTWLDk3gJf9ZQC7LGJI4W7fOseKkew8ZA9l5XsHUdO9+cS5pch8bpjMWSirTrwx3+bjBstqe3z9I3d+iAsPCnErwC+eoikF06oWZ2lDdh1Q5sYABKoazjtu6OpEZev4Ac+u6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceOjQ36n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1634C4CEEB;
	Tue,  1 Jul 2025 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358620;
	bh=HL7i/yJKOopc3B9FVmXFkyNK1QnF2R8I8jERrgLs0HE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ceOjQ36nmlLXS9wFIcm3k8P6kEJXIAzbm2leVWHFdofZ4DNS36KU+C6C7NcHbc0d2
	 /TphWXbRS6EUwaBdKOoxqfElDyGmUv3yPAm0dzq4CaPlKQKF/iDzaTUQ4hTxrFlPAt
	 Iknv3zTGLZicbmDxCxQCzTJa9LRmkKyQQNsDrbf16RrOmuRV7G/e9xXOkFTDA6o9qs
	 BMy4uM1oRyczpRZ6rfQXU5YHfgjnoESkIeuG9+uvapfsx9UFD2OeDqkVz6e0Jcpktd
	 1fwsMhEthvVSkbfrFpYuuhKBCWqaKEq7kx8XJ8GGB9Fbsrw6l/bTQApAI3VSU8E3fu
	 60MEE696EcbmA==
Date: Tue, 01 Jul 2025 03:30:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alok.a.tiwari@oracle.com, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, devicetree@vger.kernel.org, 
 linux-i3c@lists.infradead.org, krzk+dt@kernel.org, 
 wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Message-Id: <175135861992.753883.14771836154436597983.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller


On Tue, 01 Jul 2025 12:48:50 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.example.dtb: i3c@884000 (qcom,geni-i3c): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



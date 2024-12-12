Return-Path: <linux-arm-msm+bounces-41635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D079EDD9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 03:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5AB188A9A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E63198A29;
	Thu, 12 Dec 2024 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeNwusmv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D4193402;
	Thu, 12 Dec 2024 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970321; cv=none; b=ebUhU1/bVesLfiLkjguMgB6qz/Oa6aF0soVjUvVeJxYH/SCImdnBffSbnVxd7UfFbNI4eWiyXENYkhV7z/YN3IL3wsqjMjhiUanOdWclEoplcagun7VHQy61NXCpU2V77WUC1AlWL0az0mBmThm8WJca4g3W7ZAUX0fAQcchdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970321; c=relaxed/simple;
	bh=XVRwjFDMd2T6WW9jGbEMTj4CW4AGj1tebo56A4NVHk0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IazOFoMCwjTcDbjRovkS9ql43oy2UwTBjwMxDZwYPpWIIz8E1EQ+d6/H1csaya2//8K7Lq7xS9Lbzl4EAnFamYCZlZP2m5TJr/UDsMx2/xmMyCzgNwBHShNqXLDmVI9JdTbYoQXHYfhDG8OgeGD0A20f8Sifr0xCoNdzPRdGpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeNwusmv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67302C4CED2;
	Thu, 12 Dec 2024 02:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733970320;
	bh=XVRwjFDMd2T6WW9jGbEMTj4CW4AGj1tebo56A4NVHk0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DeNwusmvQjakITW+mqHLLH3qa46uY6NehV4jxN06GpIfqUloQbP4HcmKagQ96OPZZ
	 J+wzthkDPg8Al2NXXqvwJRPMeYaa5V1a574sjaVtGHGNeA/OXltqk+G4NvskQ7Ge/7
	 g7JJyCG0h2cPg4f7sH5FprmpN6DKBTyUvRJtDJFvt4UXGX1OV8rX0+3quACyqbJLbK
	 o8H+api44cGfEgBklElGwCVA0dsnhHj+Sh8YzEOymZDDTkFYGyp0r+i1SEG5m5AlX+
	 t6a2cKMqtMM4FoBLxRzlcnk22zuJI2/7QUxfbj6udXm0oRiVeyLwIPKPMoxd27SkHT
	 PW/LkGiRH7wMQ==
Date: Wed, 11 Dec 2024 20:25:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lgirdwood@gmail.com, tiwai@suse.com, conor+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
 perex@perex.cz, dmitry.baryshkov@linaro.org, devicetree@vger.kernel.org, 
 broonie@kernel.org, konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, 
 srinivas.kandagatla@linaro.org
To: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20241212004727.2903846-10-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-10-alexey.klimov@linaro.org>
Message-Id: <173397031679.639542.8133765476022166585.robh@kernel.org>
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode


On Thu, 12 Dec 2024 00:47:22 +0000, Alexey Klimov wrote:
> WSA881X also supports analog mode when device is configured via i2c
> only. Document it, add properties, new compatibles and example.
> 
> While at this, also adjust quotes.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa881x.yaml          | 75 +++++++++++++++++--
>  1 file changed, 67 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wsa881x.example.dtb: amplifier@e: compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,wsa8810' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$'
	'qcom,wsa8810' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,wsa8810' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8810' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8810' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8810' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,wsa8810' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,wsa8810' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,wsa8810' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,wsa8810' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212004727.2903846-10-alexey.klimov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-arm-msm+bounces-26481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3593406B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 18:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170671F22020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 16:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053DD181CE4;
	Wed, 17 Jul 2024 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CC5bSFjQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EED5B05E;
	Wed, 17 Jul 2024 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721233726; cv=none; b=rthlfNk9YKrGb4IIuqOax2l9q49wXfr6E7Al/Bdk+yG7OuV3DG+2nIH5ArwSsd9+pSMuvyRzJ7pkQdsn2utWIuNhNFP5hF9zT+RDihtUd5NzPGrn1XQGmon0/vdhVbMGEBH0JBSBvjVxRFMeB4BcLUMUPETo7JG5ai0yWoDXyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721233726; c=relaxed/simple;
	bh=kyPhzTGtGDNL9biDJoif92+wviaphqfQaaifLhJuCiY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lbLLrB4jUrFRR8N+Fo9Wxm48NVbs8yTGlmDMZ7JhnPwk34SYVnw8eBE4I/enAaCKRAzPpwTsUPjRTDUlwxsTttEjGp3QYCOit1m0V9aeNINwqOkTb7m5wP08dLyQnaDBPCJMx1ChxXzQdA8S+p2gLu93x7UtRAxyXvnHI94TV7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CC5bSFjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6FCC4AF0D;
	Wed, 17 Jul 2024 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721233726;
	bh=kyPhzTGtGDNL9biDJoif92+wviaphqfQaaifLhJuCiY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CC5bSFjQbhTweghK6PGptJBHlyIoAbxCjQY5ac5vlvR1ObQmyOcQiwWUdUgYvqywU
	 V/8f2Ja6GHOfXdg1ZzIRad/NjjmCSUhLzF0YzjhewJ+JKfkWBtOAYbYpPclb5NyqFM
	 2MvDpRRRrtT/de4e5Y6ctIjkH9PshhUO00M3GdBoa3Kmtmop/C1cc/rhULx7YxnULA
	 7j4+bhjh7U8IbTGR+mEw2z96y5IzPXgnu6fvPs/BSL42412pUW6kl5UvMSEvHsYJix
	 Rx0yF7Jn12WJO73oPBzdkEAdc1JwdcBLOWsi+lJXvq3c6ZcLbLvtw+ELBdmUJL9ye6
	 PnucQAoEiEyXw==
Date: Wed, 17 Jul 2024 10:28:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 netdev@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Timur Tabi <timur@kernel.org>
In-Reply-To: <20240717090931.13563-1-rayyan.ansari@linaro.org>
References: <20240717090931.13563-1-rayyan.ansari@linaro.org>
Message-Id: <172123372353.179030.4294895894656071334.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: qcom,emac: convert to dtschema


On Wed, 17 Jul 2024 10:09:27 +0100, Rayyan Ansari wrote:
> Convert the bindings for the Qualcomm EMAC Ethernet Controller from the
> old text format to yaml.
> 
> Also move the phy node of the controller to be within an mdio block so
> we can use mdio.yaml.
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,emac.yaml    |  98 ++++++++++++++++
>  .../devicetree/bindings/net/qcom-emac.txt     | 111 ------------------
>  2 files changed, 98 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/qcom,emac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/qcom-emac.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,emac.example.dtb: ethernet@feb20000: compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,fsm9900-emac' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$'
	'qcom,fsm9900-emac' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,fsm9900-emac' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,fsm9900-emac' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,fsm9900-emac' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,fsm9900-emac' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,emac.example.dtb: ethernet@feb38000: compatible: 'oneOf' conditional failed, one must be fixed:
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$'
	'qcom,fsm9900-emac-sgmii' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,fsm9900-emac-sgmii' is not one of ['qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240717090931.13563-1-rayyan.ansari@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



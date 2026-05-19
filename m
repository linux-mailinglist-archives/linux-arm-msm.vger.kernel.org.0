Return-Path: <linux-arm-msm+bounces-108614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIAUHqX4DGrnqgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 01:56:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E5586263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 01:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13BA73013D75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 23:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A903A9639;
	Tue, 19 May 2026 23:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITgCsbAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEED3A6F11;
	Tue, 19 May 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234978; cv=none; b=SIAko3GbhOIQZh7bqkGZNv6/Xdxq/nLmMsxpkfFIiSyFug9MJ3pDXZLQMe0439rBaDhHcCv9nw1SSIdPDSxtydhQbYlKdKB4yDywIeB6ITI7DFEb/bRKM8LCGSPNAtrTnEywf9m6Bsn+gKh66nJ42bGsQSkE9bvOzY8o8ybfJtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234978; c=relaxed/simple;
	bh=JGnldyeEPx8P9iWWf0ERkeNUkQXBUBWnno5F1gsDARc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iv5ammb9ko/9kIxtMHEcmFCPgsNf2X2RuEObrGq6kzea/R3r8nl4dFKkSthi0gP4gNRiOatU6OnMfW3WUVrMdwvA9ZPUWTbfutS0Flf2uvGMsEucv+FWDP+Yz+CMCTBwGMD8KkdARw8LcZ9fC9ht83pRRPDk9VXzbe1hCj18CXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITgCsbAp reason="signature verification failed"; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75CC1F000E9;
	Tue, 19 May 2026 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779234976;
	bh=ukgYR5BtEQdugnAz4VPVz+2e+UlKz5nd+3j0OI16ln4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ITgCsbApRnISwFXd+7nDHGWsemcR7I27duxBJfhG8hIWKuR5Tq0B4Z7LVjNIDndsE
	 77fbqQyE0rCVoTnsINS1XO+Qej9x3kzZ/KWkp8Eh51yHnBfLftfUBCqHCV/M32mlfA
	 NMzIJnLhBntmIiessOCv1EVmf6PzKFrqBX1CPPYMLwnBxLPcSFsk7ydtsysApSFL/k
	 ufrbNksCKkodEpM5q49etK/qe/VFCo3Y7FBFpGN5Fd3AYyrQCg/G8XOEyZK/xJG9JP
	 QfueaxUyrC9S3Gg0TzIS9Midq/d2uSenLxZ4LiFZrUaukhDjiwIY23au/bX9Ov7tsG
	 hHHPEh9SLuHSA==
Date: Tue, 19 May 2026 18:56:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-3-005d29d261ae@oss.qualcomm.com>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-3-005d29d261ae@oss.qualcomm.com>
Message-Id: <177923497620.3650559.15856076545077851448.robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.971];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20260515];
	TAGGED_FROM(0.00)[bounces-108614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: D22E5586263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 19 May 2026 22:03:20 +0200, Krzysztof Kozlowski wrote:
> The schema checking for expected naming patterns for SoC IP block nodes
> was really incomplete and was checking only nodes with single
> compatible.  Fixing this and applying schema for nodes with fallbacks is
> not trivial, because obvious solution like:
> 
>   minItems: 1
>   items:
>     - oneOf:
>         - pattern: ...
>         - pattern: ...
>     - {}
>     - {}
> 
> is not allowed by dtschema.  The binding should also skip root nodes,
> which have SoC-based fallback, but completely random front compatibles.
> 
> Solve this all by:
> 1. Extending the select pattern to match all nodes except root node.
> 2. Apply schema to all items of "compatible" property, which means it
>    will be evaluating also all sorts of generic compatibles like
>    "syscon".  List them all and let's hope that fallback list will not
>    grow too much, because generic compatible fallbacks are discouraged.
> 
> The benefit is that this schema is finally very specific and evaluates
> all nodes for desired naming.
> 
> Diff is a bit obfuscated, due to indentation change so briefly
> explaining:
> 1. None of the patterns are changed (neither in "Preferred naming style"
>    group nor in "Legacy namings").
> 2. None of the enums with "Legacy namings" and "Legacy compatibles with
>    wild-cards" are changed.
> 3. Add pattern for sound cards.
> 4. Add list with all used generic fallbacks.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom-soc.yaml          | 182 ++++++++++++++++-----
>  1 file changed, 137 insertions(+), 45 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.example.dtb: phy (qcom,usb-hsic-phy-msm8974): compatible:0: 'anyOf' conditional failed, one must be fixed:
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,apss-wdt-[a-z]+$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,scm-[a-z]+$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' does not match '^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy-msm8974' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,usb-hsic-phy-msm8974' is not one of ['qcom,ipq806x-ahci', 'qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	'qcom,usb-hsic-phy-msm8974' does not match '^.*,.*sndcard$'
	'qcom,usb-hsic-phy-msm8974' is not one of ['arm,gic-v3', 'arm,mmu-500', 'generic-ahci', 'jedec,ufs-2.0', 'mmio-sram', 'qcom,adreno-smmu', 'qcom,aoss-qmp', 'qcom,cpr', 'qcom,cpufreq-epss', 'qcom,cpufreq-hw', 'qcom,dcc', 'qcom,dwc3', 'qcom,epss-l3', 'qcom,eud', 'qcom,glink-smd-rpm', 'qcom,inline-crypto-engine', 'qcom,ipcc', 'qcom,kpss-gcc', 'qcom,kpss-timer', 'qcom,kpss-wdt', 'qcom,mdp5', 'qcom,mdss-dsi-ctrl', 'qcom,msm-iommu-v1', 'qcom,msm-iommu-v2', 'qcom,msm-timer', 'qcom,osm-l3', 'qcom,pcie2-phy', 'qcom,pdc', 'qcom,pmic-glink', 'qcom,qce', 'qcom,qfprom', 'qcom,qspi-v1', 'qcom,qusb2-v2-phy', 'qcom,rpm-proc', 'qcom,rpmh-rsc', 'qcom,rpmcc', 'qcom,saw2', 'qcom,scm', 'qcom,sdhci-msm-v4', 'qcom,sdhci-msm-v5', 'qcom,sec-qfprom', 'qcom,smd-rpm', 'qcom,smmu-500', 'qcom,smmu-v2', 'qcom,snps-dwc3', 'qcom,ssc-block-bus', 'qcom,tcsr-mutex', 'qcom,trng', 'qcom,tsens-v0_1', 'qcom,tsens-v1', 'qcom,tsens-v2', 'qcom,ufshc', 'qcom,usb-hs-phy', 'qcom,usb-snps-hs-5nm-phy', 'qcom,usb-snps-hs-7nm-phy', 
 'simple-mfd', 'snps,dwmac', 'syscon']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,usb-hsic-phy.example.dtb: phy (qcom,usb-hsic-phy-msm8974): compatible:1: 'anyOf' conditional failed, one must be fixed:
	'qcom,usb-hsic-phy' does not match '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,apss-wdt-[a-z]+$'
	'qcom,usb-hsic-phy' does not match '^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,scm-[a-z]+$'
	'qcom,usb-hsic-phy' does not match '^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$'
	'qcom,usb-hsic-phy' does not match '^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
	'qcom,usb-hsic-phy' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', 'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-regulator']
	'qcom,usb-hsic-phy' is not one of ['qcom,ipq806x-ahci', 'qcom,ipq806x-gmac', 'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
	'qcom,usb-hsic-phy' does not match '^.*,.*sndcard$'
	'qcom,usb-hsic-phy' is not one of ['arm,gic-v3', 'arm,mmu-500', 'generic-ahci', 'jedec,ufs-2.0', 'mmio-sram', 'qcom,adreno-smmu', 'qcom,aoss-qmp', 'qcom,cpr', 'qcom,cpufreq-epss', 'qcom,cpufreq-hw', 'qcom,dcc', 'qcom,dwc3', 'qcom,epss-l3', 'qcom,eud', 'qcom,glink-smd-rpm', 'qcom,inline-crypto-engine', 'qcom,ipcc', 'qcom,kpss-gcc', 'qcom,kpss-timer', 'qcom,kpss-wdt', 'qcom,mdp5', 'qcom,mdss-dsi-ctrl', 'qcom,msm-iommu-v1', 'qcom,msm-iommu-v2', 'qcom,msm-timer', 'qcom,osm-l3', 'qcom,pcie2-phy', 'qcom,pdc', 'qcom,pmic-glink', 'qcom,qce', 'qcom,qfprom', 'qcom,qspi-v1', 'qcom,qusb2-v2-phy', 'qcom,rpm-proc', 'qcom,rpmh-rsc', 'qcom,rpmcc', 'qcom,saw2', 'qcom,scm', 'qcom,sdhci-msm-v4', 'qcom,sdhci-msm-v5', 'qcom,sec-qfprom', 'qcom,smd-rpm', 'qcom,smmu-500', 'qcom,smmu-v2', 'qcom,snps-dwc3', 'qcom,ssc-block-bus', 'qcom,tcsr-mutex', 'qcom,trng', 'qcom,tsens-v0_1', 'qcom,tsens-v1', 'qcom,tsens-v2', 'qcom,ufshc', 'qcom,usb-hs-phy', 'qcom,usb-snps-hs-5nm-phy', 'qcom,usb-snps-hs-7nm-phy', 'simple-
 mfd', 'snps,dwmac', 'syscon']
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260519-dt-bindings-qcom-soc-naming-v1-3-005d29d261ae@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



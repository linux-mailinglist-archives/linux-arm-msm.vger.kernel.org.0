Return-Path: <linux-arm-msm+bounces-115545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kOv7BMEpRGpzpwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:40:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8746E7E49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:40:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P3JmURxg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115545-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115545-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 013C130776D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A593A47AF6D;
	Tue, 30 Jun 2026 20:35:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30D243367;
	Tue, 30 Jun 2026 20:35:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851730; cv=none; b=US+K0GHGEAvr3BouRzXsrtxDEmsuK8kPrDaFIK92BcRGu0vjshHLEsh8ybLt6PgGGBbr//ttmN2B+spRKzS3qBjv1JKeM7rNMyNK42/DC9RnmHOGwBeXVrovsZ5NAHLA6XufZRpqdIHgEgDWcbDzodzJBc4dot0eG+j68TMLr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851730; c=relaxed/simple;
	bh=FCcH0cjWHBiKMyK6MUXCng4THBGd8OOACDIv66ppbQA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QrLj9z1lh3xtornJjSroyKTPGfvEVPSZsAvmP++OtH/q7srbhk4a8K7znyEKdyG0ch4l+xHMhCGBvwiM44i4F4sD1xCFMKS3vlP2fOQurH8WGwcxnDqELSw1C3PTqsWYIDGaZdTSYc7v5uhM4e/2ykg7Bz7lHkxRaEls7s+GGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3JmURxg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB001F000E9;
	Tue, 30 Jun 2026 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782851728;
	bh=xRBkIGoWPjYCazJY1It+LXcF4wxJ+Bg0xHJEQ0RN/bI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=P3JmURxgq4Woubp407/24y6zygp4vn9HNu8Jh9WszFfFqkojpBjlYD8GU2KQZZt8K
	 ObeMgj08YZvu+eXyDnq4bA6f63MLzBqu2HOFORvkNRGhWql6GMT7Ub0Zr97ZqNZK8u
	 ja7ACXLuHpdKud4qDjmrH93IrSGT73nBb3eEGSOOghAMo/jocNxr8MGjN+eTMBYnH1
	 xNV3WbrOaXgMMu/PJmrjyuWqwudD/cEFlMainscDmD0iAudxay4r3C58Wcb78iQYHx
	 shUHFXzi2m2nhzIRv6kpwtUdmeS2Y3FfG3+Q0IteR7loIeweu3HCl2+lbT3YMVOkYf
	 vefLTp8VYBmDQ==
Date: Tue, 30 Jun 2026 15:35:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
Message-Id: <178285172593.288348.3890129606237873483.robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115545-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:mani@kernel.org,m:krzk+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-pci@vger.kernel.org,m:brgl@kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F8746E7E49


On Wed, 01 Jul 2026 00:32:44 +0530, Sushrut Shree Trivedi wrote:
> Add a dedicated schema for the PCIe controller found on the Shikra
> platform.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>  1 file changed, 211 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:57.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:57.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:58.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:58.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:59.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:59.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:60.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:60.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:61.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:61.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:62.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:62.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:63.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:63.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:64.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:64.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:65.29-36 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:65.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:76.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:77.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:78.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:79.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:83.30-46 Unexpected 'GCC_PCIE_AUX_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:84.30-50 Unexpected 'GCC_PCIE_CFG_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:85.30-51 Unexpected 'GCC_PCIE_MSTR_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:86.30-50 Unexpected 'GCC_PCIE_SLV_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:87.30-54 Unexpected 'GCC_PCIE_SLV_Q2A_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:88.30-58 Unexpected 'GCC_DDRSS_MEMNOC_PCIE_SF_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:89.30-59 Unexpected 'GCC_PCIE_TILE_AXI_SYS_NOC_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:90.30-55 Unexpected 'GCC_QMIP_PCIE_CFG_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:100.39-55 Unexpected 'GCC_PCIE_AUX_CLK'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:103.44-58 Unexpected 'MASTER_PCIE2_0'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:103.59-73 Unexpected 'RPM_ALWAYS_TAG'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:104.40-53 Unexpected 'SLAVE_EBI_CH0'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:104.54-68 Unexpected 'RPM_ALWAYS_TAG'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:105.41-56 Unexpected 'MASTER_AMPSS_M0'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:105.57-71 Unexpected 'RPM_ACTIVE_TAG'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:106.43-56 Unexpected 'SLAVE_PCIE2_0'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:106.57-71 Unexpected 'RPM_ACTIVE_TAG'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:114.30-42 Unexpected 'GCC_PCIE_BCR'
Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:117.37-50 Unexpected 'GCC_PCIE_GDSC'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1669: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-arm-msm+bounces-54644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B2A91EAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62549179F44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 13:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080E724E4A8;
	Thu, 17 Apr 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFyqnc1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6732139DC;
	Thu, 17 Apr 2025 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897862; cv=none; b=B/RZg+VkzPxKAZpxOZqWpfdH5EToRCH6W0RuJSH2ceWJYKM/4IQcHRdN9a7QO48zEk96Clmm7QlMCQX4Vx5/Xb/Lpb861ZRKXiFLwqQX1q2Y5SDMsjVcJLvxNcMtWeWMl65jOaveKPLuH0aPH9dB+79h/zOfEAF/PNcSwdvxHTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897862; c=relaxed/simple;
	bh=sFxKFtm2l7o0U4719U+5robMIUF6Yyewgq4pQya5YHg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=incn+glMwTcq6jE5ywwSQkE8muAaD2CkmgZ6CDpFjJjWk/7AGkeNAzKmb4HfpT6MHvI/nZee0VJDLxEUH3IVVgCxpEkxj/O3YH5uCcGInVo4+t4jvu8kyucmT1ZdHvFeoUMgbsNuABLAFazPkfY39Wozdz8N7S6YENWKiBEk/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFyqnc1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6382CC4CEE4;
	Thu, 17 Apr 2025 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744897862;
	bh=sFxKFtm2l7o0U4719U+5robMIUF6Yyewgq4pQya5YHg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NFyqnc1m5HIpT7QvL3J8PQtBui0KGNGvz1+d+5P8C/B6UuFqr/ykwmU0FFnn9botR
	 a7kkmdQV+GIJ0dDycVUqlQZwF5armvAZx1i9XkSIfF8cVRnAduHEKXsXumz/VqmvI9
	 PB54BHcwJtcFgrw/OWu9sk6SdCBo69u4PJ092Cq7hKW3sW7VMelquqdZPuFsYlB+Ba
	 Upqj7DYDOvHtovVS8QpeD9yhhDplHPu53epIGPhvhQJF1Qh8iqHQEGM/1oAh54Uvmj
	 5KjgtKI4ZSKU5BEqRxQ7kT5FP1ZGyu9WFwNFu2bOezS6qWn6zcwRExqNus3QgJ/4Ap
	 4Mc/IT6vuq4pw==
Date: Thu, 17 Apr 2025 08:51:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, mathieu.poirier@linaro.org, 
 vignesh.viswanathan@oss.qualcomm.com, krzk+dt@kernel.org, 
 konradybcio@kernel.org, devicetree@vger.kernel.org, 
 quic_srichara@quicinc.com, andersson@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 quic_mmanikan@quicinc.com
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Message-Id: <174489760501.1657232.1882523053763202826.robh@kernel.org>
Subject: Re: [PATCH V5 0/6] Add new driver for WCSS secure PIL loading


On Thu, 17 Apr 2025 11:42:39 +0530, Gokul Sriram Palanisamy wrote:
> This series depends on Sricharan's tmel-qmp mailbox driver series v4 [1].
> 
> - Secure PIL is signed, split firmware images which only TrustZone (TZ)
>   can authenticate and load. Linux kernel will send a request to TZ to
>   authenticate and load the PIL images.
> 
> - When secure PIL support was added to the existing wcss PIL driver
>   earlier in [2], Bjorn suggested not to overload the existing WCSS
>   rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
>   This series adds a new secure PIL driver for the same.
> 
> - Also adds changes to scm to pass metadata size as required for IPQ5332,
>   reposted from [3].
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/
> 
> [3]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/
> 
> changes in v5:
> 	- retained all the patches as in v3 and addressed comments in
> 	  v3.
> 	- reverted changes to dt-bindings done in v4 and retained as in
> 	  v3 and fixed firmware format from .mdt to .mbn and retained
> 	  reviewed-by.
> 	- dropped 2 patches in v4 that adds support for q6 dtb loading.
> 	  Will post them as a new series.
> 
> 	Following tests were done:
> 	- checkpatch
> 	- dt_binding_check and dtbs_check
> 
> changes in v4:
>         - changed q6 firmware image format from .mdt to .mbn
>         - corrected arrangement of variable assignemnts as per comments
>           in qcom_scm.c
>         - added scm call to get board machid
>         - added support for q6 dtb loading with support for additional
>           reserved memory for q6 dtb in .mbn format
>         - updated dt-bindings to include new dts entry qcom,q6-dtb-info
>           and additional item in memory-region for q6 dtb region.
>         - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
>           Kconfig
>         - removed unwanted header files in qcom_q6v5_wcss_sec.c
>         - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
>         - added required check for using tmelcom, if available. Enabled
>           fallback to scm based authentication, if tmelcom is unavailable.
>         - added necessary padding for 8digt hex address in dts
> 
> 	Following tests were done:
> 	- checkpatch
> 	- kernel-doc
> 	- dt_binding_check and dtbs_check
> 
> changes in v3:
>         - fixed copyright years and markings based on Jeff's comments.
>         - replaced devm_ioremap_wc() with ioremap_wc() in
>           wcss_sec_copy_segment().
>         - replaced rproc_alloc() and rproc_add() with their devres
>           counterparts.
>         - added mailbox call to tmelcom for secure image authentication
>           as required for IPQ5424. Added ipq5424 APCS comatible required.
>         - added changes to scm call to pass metadata size as required for
>           IPQ5332.
> 
> changes in v2:
>         - Removed dependency of this series to q6 clock removal series
>           as recommended by Krzysztof
> 
> Gokul Sriram Palanisamy (1):
>   arm64: dts: qcom: ipq5424: add nodes to bring up q6
> 
> Manikanta Mylavarapu (4):
>   firmware: qcom_scm: ipq5332: add support to pass metadata size
>   dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
>   arm64: dts: qcom: ipq5332: add nodes to bringup q6
>   arm64: dts: qcom: ipq9574: add nodes to bring up q6
> 
> Vignesh Viswanathan (1):
>   remoteproc: qcom: add hexagon based WCSS secure PIL driver
> 
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 ++-
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  82 +++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 ++-
>  drivers/firmware/qcom/qcom_scm.c              |  17 +-
>  drivers/firmware/qcom/qcom_scm.h              |   1 +
>  drivers/remoteproc/Kconfig                    |  19 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 399 ++++++++++++++++++
>  include/linux/remoteproc.h                    |   2 +
>  10 files changed, 769 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250417 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: /soc@0/qmp@32090000: failed to match any schema with compatible: ['qcom,ipq5424-tmel']







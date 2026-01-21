Return-Path: <linux-arm-msm+bounces-90033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PaFOvXncGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:51:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FC58C31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B341E4EC42C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF9F3C00AA;
	Wed, 21 Jan 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+3iI/yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811362FAC14;
	Wed, 21 Jan 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005468; cv=none; b=BJTzsfwUbig/eH3zduoXKYdHuDNZeUScyv4CM7SKrRDNiVUjr6bn9Cxy7VNCRxpE1IVGPPWjWqZnM4H/rURM5xgFWbX8SdQxPDQXGiyswaaP/Z6tvR2q6vDaoZuTWWJ6nIjqLN/1GNynKQ0QHD9k6wIQPJ1yWyUyIXA4FVBjIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005468; c=relaxed/simple;
	bh=nUQZc9vColUSpAfn6Am+XlnLl72fg3fA/kN0NFJO0l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+dfgW6aC8uvG772Oy+aGnQukCFSE8A7pgR8ZFOVzEJMhq9hcRBu7wVJLMkPyDT0UHKsUhjpSHPddj2YANS7JfjO1V1/aDA+7MC21sLLi9cDGbBdDvuA94MaUNkF+uuO4+jJ9xtJxkFKjRfqg5fifVfHe0vrj3D608VoUk+lDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+3iI/yU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E8DC4CEF1;
	Wed, 21 Jan 2026 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005468;
	bh=nUQZc9vColUSpAfn6Am+XlnLl72fg3fA/kN0NFJO0l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+3iI/yUYeTaKS2NBoSKHfnnhVxzkrqYEqQ9EItaKH5XAddQaca3pSGJKBOURDe0V
	 LcVKbTWnpEO0O7oKgzm2DTa4LUNWHSTyAlgrvkrZpWCjISlJNcuniX6lmcgbEVFJiU
	 PGw55aR2GUjmFVeKr1tdugO4Sc4Wos9MZ0/v49xEwwwWN+7ZuLFOaj3VYNlgZ1NFNN
	 nV9T4abspK19bG7XyRQH7Uau3R8iaeuXhiOksgjvtP4GL8d0iMMgoSFd69hQ5JMvhX
	 +0ouGyOkNJu4/Ai7sPLKzOqy1OyLZrPs071MiD0b12kOWEEbfoMFUmQn210I4xcdFJ
	 0auwaXcOLeORw==
Date: Wed, 21 Jan 2026 19:54:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org, 
	kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com, 
	Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: Re: [PATCH v4 0/3] Add PCIe3 and PCIe5 support for HAMOA-IOT-EVK
 board
Message-ID: <gz3a5me6w7kq6f7kwftso3r26wev563lufqmmldyevyxc4zkrq@ditr3kb4skao>
References: <20260109104504.3147745-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109104504.3147745-1-ziyue.zhang@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90033-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linaro.org,linux.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,quicinc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7D9FC58C31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 09, 2026 at 06:45:01PM +0800, Ziyue Zhang wrote:
> From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> 
> This patch series adds support for PCIe3 and PCIe5 on the HAMOA-IOT-EVK
> board.
> 
> PCIe3 is a Gen4 x8 slot intended for sata controller.
> PCIe5 is a Gen3 x2 slot designed for external modem connectivity.
> 
> To enable these interfaces, the series introduces the necessary device
> tree nodes and associated regulator definitions to ensure proper power
> sequencing and functionality.
> 

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> Changes in v4:
> - Move PCIe reset/wake GPIOs to pcie_port node (Mani)
> - Move PCIe phy to pcie_port node for all Hamoa platform (Mani)
> - Remove output-high property (Konrad)
> - Modified the DT and patch format, and adjusted the commit message (Konrad)
> - Link to v3: https://lore.kernel.org/all/20251112090316.936187-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v3:
> - Update commit message and DT format (Bjron)
> - Merge PCIe3 and PCIe5 changes into one patch
> - Link to v2: https://lore.kernel.org/all/20251030084804.1682744-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v2:
> - Move PMIC gpio pins to patch set 4 (Krishna)
> - Link to v1: https://lore.kernel.org/all/20250922075509.3288419-1-ziyue.zhang@oss.qualcomm.com/
> 
> Ziyue Zhang (3):
>   arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port
>     nodes and add port Nodes for all PCIe ports
>   arm64: dts: qcom: Add PCIe3 and PCIe5 support for HAMOA-IOT-SOM
>     platform
>   arm64: dts: qcom: Add PCIe3 and PCIe5 regulators for HAMAO-IOT-EVK
>     board
> 
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    | 97 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   | 80 +++++++++++++--
>  arch/arm64/boot/dts/qcom/hamoa.dtsi           | 42 +++++---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 24 +++--
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 24 +++--
>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 14 +--
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |  3 +
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 14 +--
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  8 +-
>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 19 ++--
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     | 21 ++--
>  11 files changed, 279 insertions(+), 67 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


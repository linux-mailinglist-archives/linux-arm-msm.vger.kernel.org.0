Return-Path: <linux-arm-msm+bounces-100341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBMAE7aPxmlLLwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:09:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAA345CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D963030A184F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2373F0A9B;
	Fri, 27 Mar 2026 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTCSg6E1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFECA2ED154
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620287; cv=none; b=La9EG6j4HOAKsAeoRkQGsGMryAjMnJluEx2G/ccTXFqp0Lp7Kw+0ylHyPpg7yOfWWSbLALMZguAXp9Pu9BizTgEZf/4pAIHJbCkCMvwx92w8BKtIN3Cp8iyP54vk8IWTNUjxF2cYP+Ak7OSmDW5VyYHJUGPuZJ/P3Xvv4dEo3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620287; c=relaxed/simple;
	bh=q9V97Tr+6k2fCh537AkmCOo0/qg1EEGC6ygs46eoSNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uykmoG4XI8w+dqZuz3omCbH7u6FKhYNIuZCdNO/p3kOxAkFEHQevCG+AtQpkhyflq6S02mA4PwaELKGIlxvy9ZTbijrMlHl12P4ns4BrSOB/o7N1l+FMDcgIxCOW6i1ENVJGM1HfFGk6U9epcJLSiEldiPK1jtuc9kCOrvRpeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTCSg6E1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fda2a389so17452265e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774620283; x=1775225083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=oTCSg6E1R8Drfgc/vnfQmcQJJZ5t4RwdAYzyvKsj2uVb6Q8woIlTPSShPn8E1ni2J/
         bwW532e3faPT1djMherB3fiU6V0SHnuTpAF1NSdl2fLyeKv1LGdG2h2BOzGj0XfPEYxZ
         WwbzKxXFtaovCGEQXSp/9/D3ebskF2IWVKZFwNThkRP8pi4v2kaYccrBfCe3FPMTRuRP
         6EIU/zy+QI4BlCtX5Dk4fDUtaQbxgmqoO5oQP5dpUiZzPvsinCPTxeQBdbxvVA9JPgKc
         6bN1tRPevSRHVWvh22pnXzthftR5j5igXSIMKm+WamfFDVFgiuCZlZDUcQ4gxt9lybma
         LKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620283; x=1775225083;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnwOxiQgTrY2GQTcPVQdPC36P8UQNWjAuceWpM/pOE8=;
        b=nVT6m+HuTcRZBsompsEn74cnBxYX1b8aNPjTDqT7FkU75bmPaWz0AsG8ce0wk+t4TY
         zjJ610p1O0fjbWm4o96XXFJcXNcpqfn4oFlMOY8wWPNaJKxjxFWn5uoY7TSOshRro0pp
         UNr7wiwAtZd+NtXuqZBiyyI6nRNa38dm/ZzKb3hDosiY23k7SFVRXiuzz5uyECe/92Yn
         B3Dea3dq3tFQ3KdWtP6YAzU0p0M0EU9nIHkuQ5braeEz60o21CK8WLzfQa538P4XN1Se
         s6J5uqWc2Pti8jqoOZpv3KoYDORXZs4tLx2VPSC7fKzdCdBMdghyMLCGSiE0eQ24bRzQ
         djxA==
X-Forwarded-Encrypted: i=1; AJvYcCXV357joxtqGqKfy8JNHaxekbBl0DQ+1XWH1MAJPws031gb663tPOIltUe2pnB3ix1Xy1QAqJcvjF/an2Pk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw82Ekypc5I22yJC8cucFNjPkBSf26zLFGmC3IVK2syCgiGnyiq
	mwaPaAmUwzyHgxiLPDki2kP1wFUxCb+7oA6vklRLcDw8rckzf6hd1LQ71oHkxxzO330=
X-Gm-Gg: ATEYQzzRT/GjlCAYPrbiALTJZQkphQBVkhQWX9i481dV88d7x1vDAsYK51S0GVsNuUA
	785fm867NAQ3tepAKuWEdiygYakdpitMtQsEJ9jxGr8VQMPWhPpvECWqK4Musk95e5vhnSeRz/n
	/OFha4BARjqIKh2C5dQEyAZMnqvBR5WSMTHRlgTtM4Qb9xo96cT/qk23FR6u4w70RfnGMkGsEOm
	WYZmTp5RCgx7UgN2Oito4M/AMrsCM9nRWLnhNeeMgU+hsD22vSd+aXyE0xU86WwBm/SitTW+pnB
	e5mywsFTxyPVAVMvD0/r6vxj5VDSkMaFHHSr2y8/h8u7gNufVr76zv/SM2Df7MPHeSmbQHmaNfD
	ewW6PHMSARd7fxofk/KRlJu1duaZNwd6tvUB5TcLkZYFmjSWwTNQdAzmQ3CnPeO6XB7FkEnfLDl
	YA29ogZ7o/+okw7hXF04qj/M3iFS9WCg+CPbDZLIy+vYjVxr+euv6j9sVF0vBqpX67CnvkjA34U
	IHXSjoJsGU1OiUD/Jv0rtI=
X-Received: by 2002:a05:600c:3f16:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-48727c86862mr44979375e9.0.1774620283136;
        Fri, 27 Mar 2026 07:04:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725eb5417sm27114795e9.3.2026.03.27.07.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 07:04:42 -0700 (PDT)
Message-ID: <7d9675e6-3f02-49e8-b65a-9785d5b6a7c7@linaro.org>
Date: Fri, 27 Mar 2026 15:04:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Chuanhua Lei <lchuanhua@maxlinear.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100341-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,google.com,gmail.com,kernel.org,samsung.com,nxp.com,pengutronix.de,Amlogic.com,baylibre.com,googlemail.com,sifive.com,maxlinear.com,renesas.com,glider.be,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[n:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.com:url,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: F3AAA345CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 05/03/2026 à 07:20, Sumit Kumar a écrit :
> This series adds support for multi-port PCIe controllers in the DesignWare
> driver. Currently, the driver only supports a single Root Port with
> controller-level properties, which doesn't work for multi-port controllers
> where each port may have different configurations.
> 
> This series introduces a per-port structure and parsing API that allows
> each Root Port to be configured independently via pcie@N child nodes in
> device tree, while maintaining backward compatibility with existing
> single-port bindings.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error code preservation in dw_pcie_resume_noirq() to return actual
>    error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
> - Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
> - dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
>    failures fatal for now, add TODO comment about making properties
>    optional later (Mani).
> - Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com
> 
> ---
> Sumit Kumar (2):
>        PCI: API changes for multi-port controller support
>        PCI: dwc: Add multi-port controller support
> 
>   drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>   drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>   drivers/pci/controller/dwc/pci-meson.c            |   1 -
>   drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
>   drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
>   drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>   drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>   drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>   drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>   drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>   drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>   drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>   drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>   drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>   drivers/pci/of.c                                  |   6 +-
>   drivers/pci/pci.h                                 |   2 +
>   16 files changed, 232 insertions(+), 74 deletions(-)
> ---
> base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
> change-id: 20251010-dt-parser-98b50ce18fc1
> 
> Best regards,

Tested on meson-pci (boot log https://gitlab.com/amlogic-foss/abcd-linux-test/-/jobs/13677061036)

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # On Bananapi M2S

Thanks,
Neil


Return-Path: <linux-arm-msm+bounces-112774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kWiRDZXUKmr5xgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FF673146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:30:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ciZs+/De";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0A30312A930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6C23EC2E1;
	Thu, 11 Jun 2026 15:29:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA1403B17;
	Thu, 11 Jun 2026 15:29:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191796; cv=none; b=I67qxIOhhDEKmmON81P7WBefMXcfndVB9aqonNLjCpxo/Erfg+B27qq9aKFNvHz+asG0oiTvZdNJ6D3z3aLPfO9uOQhhcy4msEJ9LLqFDNFGqG7gHyAwTuG+ooj+3aeGJUrqp/fqN0gnF3vK+aRvoiR9ArDk4+NAuPuq2f1VOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191796; c=relaxed/simple;
	bh=3THXNP0OySDzs9gfN+yJpV3WQlqOYoKVWbwHtCObJZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3kZnBPSD1KI3lpVGAWs7KPKG72spND07FQ09AXdhz1Waxa+2VTw5eNQik96ceHIoIl7pFKymUqZWDpJNPRnlYbgGylFgifJdULxBZWTQQvjkFtVmROgNFxTDZJSf0f8wXPRpm0a5lYc+1ZROOc38P6eW3/lvVBtLsV8fTQ0Fgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciZs+/De; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7715A1F00893;
	Thu, 11 Jun 2026 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781191795;
	bh=XMXAduZhXMi7sPl7wXbg3EtVrGgXmUglUtg25rqA6sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ciZs+/DefC3FEetqmSahSCuzh6jGeMeQK5b4Os2DLrT6x8XwCcZ6miyLrc41TLVLE
	 2b8fO2LcXAv3deQMiZcAHtFSiKZ1pj/dRQRBnjUJFO7IP7wa2kyqAjqd+1xn7IDHEy
	 n99HHux03s27GRli38vb8VjILwRg3+AFUc7nMqrB9tF5YaoDUAXlMfpDTJTGfCHyDz
	 KdJ8qbVvvi6MbW84TrdyPpAFiJtDJAS5hCKNsgHriUUP1NDq3sEsTF1sjVN8w7nI5W
	 NbSvugawn36bUM3j8mftsVeiYpbVbjSZ8sn9HTCRM/z7T7IXNnpkK9REqhTnSzMa0J
	 GPIkUGgnI9Ktg==
Date: Thu, 11 Jun 2026 20:59:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mani@kernel.org, alim.akhtar@samsung.com,
	bvanassche@acm.org, andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
	luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <airUb6wT-I-7cOXK@vaman>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
 <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112774-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:palash.kambar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vaman:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A5FF673146

On 26-05-26, 14:39, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.

This fails to build for me on phy/next

In file included from drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:24:
drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1878:26: error: ‘QSERDES_V8_COM_PLL_IVCO_MODE1’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_PLL_IVCO_MODE1’?
 1878 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_PLL_IVCO_MODE1, 0x1f),
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
   22 |                 .offset = o,            \
      |                           ^
drivers/phy/qualcomm/phy-qcom-qmp-ufs.c:1879:26: error: ‘QSERDES_V8_COM_CMN_IETRIM’ undeclared here (not in a function); did you mean ‘QSERDES_V6_COM_CMN_IETRIM’?
 1879 |         QMP_PHY_INIT_CFG(QSERDES_V8_COM_CMN_IETRIM, 0x07),
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/phy/qualcomm/phy-qcom-qmp-common.h:22:27: note: in definition of macro ‘QMP_PHY_INIT_CFG’
   22 |                 .offset = o,            \

And so on. Looks like QSERDES_V8_COM_PLL_IVCO_MODE1 etc are not define.
Please rebase test and send again

-- 
~Vinod


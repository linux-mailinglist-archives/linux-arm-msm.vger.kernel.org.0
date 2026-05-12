Return-Path: <linux-arm-msm+bounces-107208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLh2OsuOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D07552949F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA6E31829BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9352A3DDDA9;
	Tue, 12 May 2026 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICgbF7LK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC33DD875;
	Tue, 12 May 2026 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617444; cv=none; b=MQuvL6dxzluH6LaJ0DTsFH0LGbpV9m/vp5B0L/F9QZi6iMNkKTC4210QFAieMl8/AR8p76wDRilKUTJfs3uf7tPJIaxa73RT2Rek4GySuXzcuqaVY0RRDN/sQCecXdjQHzWEsmCAf3fec+bP8SP96TUr/dxgAWswJG+26Vh6Spw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617444; c=relaxed/simple;
	bh=gKxX4qAMvfvZ0hMgmnoPvQuUp3XFHxIqAE4bi+Y6vGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hf3iqcDJKS90h+XBoi4h3CR6eVhwKMoD0drcuUJp9XgzIUvoL8yfbI4hhdmX4NyAh9AatpIkunjp7xDreAXP1mWWgUxLRws8+fFQ2Jo1y1jO69bEKE2C+WdnG06J7zkxp2qWhkIrVGDWLafinhKinVQLUY35wbS9HxfRLY/BEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICgbF7LK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A124C2BCC7;
	Tue, 12 May 2026 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617443;
	bh=gKxX4qAMvfvZ0hMgmnoPvQuUp3XFHxIqAE4bi+Y6vGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ICgbF7LKsRAjuSXfRHCjI7o5QPfXKtCIFoB07VswQXbM9NfdJx4zcFkOyj0ZrtYwf
	 mYlpO90tTieags9AbcjACEiQAnQ5cGxd/FEEIUG5N52wXu9UMJE6OorsM6G0qEx3uf
	 1jJWP9p/lHWBMEjFG9h+xpEwTjGTir+yM4rlzDFizHFR9TsD80PMEpWNE5y0BLTZ0e
	 2CdRlRa77XEG2MiDr+OWBXNBxbzirri1TaRRy2GERZ6oA2zdT0XEUjT+b8Wa2IkVD8
	 IQTH9F3Lvuae4JnpQGMWU08DSmiyjiqEQpH6dPyjwgiW2cw4v1W/NSeUcE5B5VH0UP
	 3TPFjK26tHWzg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/7] Add QSPI support for QCS615 and improve interconnect handling
Date: Tue, 12 May 2026 15:23:15 -0500
Message-ID: <177861739353.1242344.2644710051139536941.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8D07552949F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107208-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 29 Apr 2026 22:31:35 +0530, Viken Dadhaniya wrote:
> Add QSPI controller support for the QCS615 (Talos) platform and improve
> interconnect bandwidth management for QSPI controllers across multiple
> Qualcomm SoCs.
> 
> The series consists of:
> 
> 1. Add QCS615 compatible string to device tree bindings.
> 2. Add qspi-memory interconnect path support to the driver for proper DMA
>    bandwidth allocation.
> 3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
>    controller node.
> 4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
> 5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
>    platforms.
> 
> [...]

Applied, thanks!

[4/7] arm64: dts: qcom: talos: Add QSPI support
      commit: ef4d269e5566ec8d32de149c91f1c907ec9b9511
[5/7] arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      commit: d2ed3f777f81989a7af6029dee59decad9f488d2
[6/7] arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      commit: 45287b9e5e28f10ec910480635d4f239154d4120
[7/7] arm64: dts: qcom: sc7180: Add QSPI memory interconnect path
      commit: 8289feadbcbc1b0458a9e81d0eca42f97b28bbe3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


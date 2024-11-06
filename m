Return-Path: <linux-arm-msm+bounces-37092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9429BDAA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B64284B0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66F915E5B8;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM8NUuRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9030157A5C;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854434; cv=none; b=Z+hhe7A0bqzItrjZ/Tw2Q+eTtKMwd8mT9RmHynyRnbb77Pdwdj24tB63PZSJSyP1GyB82k/b8ccLqDE6Wie9fS18nPvdWSh2ecrRCqIwWhVZMKpnXdjynC/bhhCErRfDO7HouVyINJPGRIwwRITgskdFM2uJ0QMvXoeIfUOXPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854434; c=relaxed/simple;
	bh=+gM1GTdysQV4ivKek/c2tvldf0AqZcouwGkz7I8pGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnwFrpixx5LvHZf+b5Iia0+KfLwhIZPpTolKZYlr6TYGSEmyiPAi0/R1f4x/F+cTQbk2rg1juTGtMoRXUg3SIfZYU8HeboSVn18PISJyvMTsJ/J4HxiL6kUupjAdQhUcW6rnr+ytZIAe9WNblrxCdgQbD5sLFUdK7w78WIDAM3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM8NUuRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121FBC4CEDB;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854434;
	bh=+gM1GTdysQV4ivKek/c2tvldf0AqZcouwGkz7I8pGxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HM8NUuRd/oKgpSqdUtYM9IzWzFoF1eKuar3AnpbPvZBViOTeBukgmLAf/pCeMFbGZ
	 wP0zhKEHMsXlRw4r9EEIxjZ34DE0Iss9Nn1Fb9TbqzMaEC6E/mKVXPZ4Z0uUeDNcTy
	 aerE59QEQw+QRzqgzkR1fMHEz4ijQEnFBvNIm3g3a0OsCkdbbEEc1Jq/nbearxIOSe
	 uxUZV1NUdq0itTMg97FFm5Hr1VxXz5x9MKfFFM23clRQMHVpZ5TFiHSpFyzEx9UhWh
	 IDhvFFCyMa3saX1LgE1Qu59tg8RXYMU52o81BDKn53ddmgNdoQc/OpbgErq+sgz8hw
	 uLWn9YfkWSV8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: (subset) [PATCH 0/3] Add IPQ5424 and IPQ5404 SOC IDs
Date: Tue,  5 Nov 2024 16:53:45 -0800
Message-ID: <173085441673.26510.11292687921842246596.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Oct 2024 20:45:25 +0530, Manikanta Mylavarapu wrote:
> Add SOC IDs for IPQ5424 and IPQ5404, and add smem, tcsr_mutex nodes
> for the socinfo driver probe to execute.
> 
> This series depends on the following patches
> https://lore.kernel.org/linux-arm-msm/20241004102342.2414317-1-quic_srichara@quicinc.com/
> https://lore.kernel.org/linux-arm-msm/20241016144852.2888679-1-quic_mmanikan@quicinc.com/
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: ipq5424: Add smem and tcsr_mutex nodes
      commit: 35e0a4f0a39651a6a6009f516847721cfdc633b7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


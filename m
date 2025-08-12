Return-Path: <linux-arm-msm+bounces-68839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA002B23A80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A75F1899A32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777B32D061D;
	Tue, 12 Aug 2025 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4D7z+GW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F02512F5;
	Tue, 12 Aug 2025 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033259; cv=none; b=O7qAlAMk5dL3PFsfRCdyxrap3kIZNG0msxYfhZcy71HdKmojCkQ8gvvuBqqpF+JX0nYLZKvicrIERq1x5fuWF7C8s1cKu7JuiuV4S2kKShpP4+iax8X4/1VDxmZeX5qEGACpoYqokJoWJ1KYUpxBM/y0KbrdIvtCEMHZ9y1YFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033259; c=relaxed/simple;
	bh=l1TeicWjiWBRD0Qr1qknQQP4Wv9kfWJUr80iSElIacg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FopTkc12dLDRQfOy5ExKE03yBBafm1m8N/BnvlT1WVBsQahA+7oSXwmtbon1eZZjeDL6ZjbULG+/eKVIkctmxWTCVi+taizc5+EviqypWMZIflFPrmG6scXrPYJ+O8x0d7p3oSHKUGF+bp5byHACvhQ9mJMMgUEO84j8qtHvtSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4D7z+GW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8323C4CEF9;
	Tue, 12 Aug 2025 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033259;
	bh=l1TeicWjiWBRD0Qr1qknQQP4Wv9kfWJUr80iSElIacg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4D7z+GWWRd/DLlH4gxgjvsPcluttd7ze8nCQ/ipvUOhGohtak6i6Z3Wb97g6F4JO
	 EQe8eUq+17gJZFyenWiqciAyCwrS2Sn3aXJtq40aowu3jtppLBlJL34R2srKcGr+5a
	 M7QDk89XcRXvToY98b3FkjFt38wgwKcyMaJIOkagMuDY7namw+awP9axWYBBvuMTRU
	 OjpTbxNx0S9NDeQvfUqcFJyu5MgumkTHG16yFJ0l2OoIenpzdFidKCcPsZDEGEFlwz
	 UC51r6JKLlLQdYkNuxpZ+rbsaKYaFTEqEhNLRvf9uWCyukmBXPNVYtT6q3UyT6LVpj
	 ULF+hXvaYXJzg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: document r0q board binding
Date: Tue, 12 Aug 2025 16:13:44 -0500
Message-ID: <175503322852.231048.4441689312374680275.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250615204438.1130213-1-ghatto404@gmail.com>
References: <20250615204438.1130213-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 15 Jun 2025 20:44:37 +0000, Eric Gonçalves wrote:
> Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on the Snapdragon 8 Gen 1 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: document r0q board binding
      commit: ebfe5797ac3e6e9fb56340b6b228d2747fdec912
[1/1] arm64: dts: qcom: add initial device tree for Samsung Galaxy S22
      commit: 46952305d2b64e9a2498c53046a832b51c93e5a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


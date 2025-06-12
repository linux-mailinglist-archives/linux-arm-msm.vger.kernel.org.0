Return-Path: <linux-arm-msm+bounces-61050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA662AD6676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C31916601F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E44222541F;
	Thu, 12 Jun 2025 04:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+xGNC3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD8F224B1F;
	Thu, 12 Jun 2025 04:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700863; cv=none; b=s5F1mspwqiYboyg+gxSjFT6KRzfJBCl+r3yW1Q1VdoK5AAuZ+iYUrZWWd6LwzcSybGYjitj8pfxg991/s/i4TOKK1sBGqNrs8xvtNwuvcWptZB41ut6HfRcopkaNa0KCMt70gEhwdn9GX+h34+ZrDl9jt01R0+eBmxSnWIDB2GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700863; c=relaxed/simple;
	bh=4RUkkQux5eVmdJdmIc2ZQmv/YPbiGtqlFXPkG2Y46O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JlWrQAhbLM4cR8FN9U7hqypUyC/tZwngDMwnCupz/e16K5726cTgaATMOWY2x89DrYZ41ixX/enujth+g5lAr/jqkgTdonYGuYwTYRXVbrNE/8XSV1V6VK2c1kR1eitmr0fES9eWotDHM/9zwFFBBeksbMKAKPS1RaRWw6JR9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+xGNC3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB28C4CEF0;
	Thu, 12 Jun 2025 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700862;
	bh=4RUkkQux5eVmdJdmIc2ZQmv/YPbiGtqlFXPkG2Y46O8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+xGNC3MXl6jAeFs1rAjLU/St9tU4S5TI4Sr/JYriYZqRgSjPIIcAATve7FQexF6D
	 i66dtrCckaq5rmP9zw+m9tktI1XRax8dQZO8zvjcY5BsYnIpPEDOhh3RQMhtRkU2Pu
	 QJDexiYwGZuYdrqc+VqsKw1WiCbX96l6a1Y//FqAIKKHtJugmLm9IbdpG6ljrjTNNQ
	 LUVjWwnklROzmUqFvRpv0o9+EEadfIVZdw5vSDb54d8CUC3+kwoz2JHIFraMLZ1DWX
	 SAh3alRjcnC2TNPKzDfZ/oQpXPkQkQ0w5oY4E64K3EZRsrQKopOFSpdRFqVNTSACpP
	 9dHbjsEY03yeA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Add support for Sony Xperia Z Ultra (togari)
Date: Wed, 11 Jun 2025 23:00:43 -0500
Message-ID: <174970084206.547582.5221938459867276231.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 20:34:51 +0200, Luca Weiss wrote:
> Do some tweaks to the common file for the devices in the 'rhine' family
> of Sony devices, and add a dts for togari.
> 
> 

Applied, thanks!

[1/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable USB charging
      commit: 702639bc50515c973cf92191d689623fa7d6c32e
[2/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Move camera buttons to amami & honami
      commit: edae4a6260d387e1e40dcf3acbbeb4c86bfd2ecb
[3/4] dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
      commit: 700a4c3f95a3cea340bf8c2371cf2bfd99da15ca
[4/4] ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)
      commit: 3d8663cb9e21912ad9554701bfb3a8254cf0a4ef

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


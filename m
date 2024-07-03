Return-Path: <linux-arm-msm+bounces-24963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55991924FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A9C1F2139D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6924912BF1B;
	Wed,  3 Jul 2024 03:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6oPWUqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE2F7E59A;
	Wed,  3 Jul 2024 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977866; cv=none; b=Xqt4y5xgh/msDtTTz0hc9eU4GyPabFhyE2T1ziRlSWDrFXbsTVseG+y6NpN+K1QVTYmHRNkWL2dX1JG2uo1bS/VJH8P4dQbgsVZ3MXRWP0jyvqiBrTxCnhRLJFbWSBN1YqvbpOYT1gUvaVBysYV+oIybraWXjJ04zZAGSP7DI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977866; c=relaxed/simple;
	bh=xoToX6Gjnvy3sD9v1vbBPQQLupj8TrPWns0P3Xk8/I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OaHXz0ikzBYBZK2WJA1iQ+J3GL8tvYO6d7VBi05k6tAPd5ymJeho+IzI091E4sRWtCOYzk3SgwZr8qcbZh7W4P9rFiX6oqDmUIyqeCv/nVEN5Imz9s77HsCkjrQvo507sSKCHIdutk8BYOuziUWaZh4pmpvI645cMKQGisOgbNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6oPWUqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045BFC4AF11;
	Wed,  3 Jul 2024 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977865;
	bh=xoToX6Gjnvy3sD9v1vbBPQQLupj8TrPWns0P3Xk8/I0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6oPWUqpM20AgaX0dHVdsHSRrVIFlK1KwH1UwNAySqwlsUmBjMH29Y6bQAkflv+QF
	 O7bzVUOXXY2wm40+HabiOQ54kKrZ0QhwokTBNiZF2PrDXtfz3duD5AzHb1fLuoIDIv
	 rz9AMj0OVSEBhcaNdiX0fi2lKMo8+Q+xBIN8uDuw42DIJ82apw2P070lKyI7gV11Qs
	 zjY6AVPGTQv8pHSGVuWCcPlwB98hEKM1vkdnOe74JJXhLf90PvUcJRIzseaxkSwqt3
	 Tz9JSt7mr1VlS1LcSQQ1XvmApkxYBYisgO9Cb42TUuJ8WvEGPDuHEnrJoY8BzQTQwc
	 A2Ba5bpQCdNRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ARM: dts: qcom: apq8064: drop incorrect ranges from QFPROM
Date: Tue,  2 Jul 2024 22:37:28 -0500
Message-ID: <171997785358.348959.15962304427964782202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701062253.18149-1-krzysztof.kozlowski@linaro.org>
References: <20240701062253.18149-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Jul 2024 08:22:53 +0200, Krzysztof Kozlowski wrote:
> There is no direct mapping between QFPROM children and parent/SoC MMIO
> bus, so 'ranges' property is not correct.  Pointed by dtbs_check:
> 
>   qcom-apq8064-cm-qs600.dtb: efuse@700000: Unevaluated properties are not allowed ('ranges' was unexpected)
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8064: drop incorrect ranges from QFPROM
      commit: 2a89f2b7e4b98ff684eff2950cbe62d8dd47da72

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


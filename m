Return-Path: <linux-arm-msm+bounces-67052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA39B15967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2B0172164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D9A23C506;
	Wed, 30 Jul 2025 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHLEAPfx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641C23C4EC;
	Wed, 30 Jul 2025 07:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859734; cv=none; b=uDNlkcIkIE2B2srQzx8F9FGE1BCvffJMtQ+bOaceUTtMsdoqThOpyxqZI1JUn/aFHhjUSTYtrTayoydMXJJMJjsFazii5n3Gtnknmv90JlS+UPDfnURZ8j99ZtwWIdJLq/igYc+DVY0goJa2JrZhE0cp1ssSF20arhtIJFY2WSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859734; c=relaxed/simple;
	bh=u9u2wJbc+api5H0faTFhHtBzTURYNb7dTog9OQI2PMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMo78Cpu0PhVZ/SC49hZQKYHwG3VA5pMPULc1mNNpQhimh4m442PITK5gvhUaLlkttR9iS7ZT2I5MDv07rnnCC41gKsls/HGJSbfWqIm0Sczw1DnGiswSJ9JYt5iA6HnTm3WKh8+GOqanIHZanhNv+ZZ6Pkd95Kg9T8m3CQtoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHLEAPfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA064C4CEE7;
	Wed, 30 Jul 2025 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859733;
	bh=u9u2wJbc+api5H0faTFhHtBzTURYNb7dTog9OQI2PMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHLEAPfxIi8JIQHU9s6I05RWVP6K7HFEzTUzECKhDJwTZYXxRU3mR+o4qKEB1lMwN
	 gwiHxf7ag1ChlYzBcF4JujCLm5ycGCF5Ers/2tr+tvqgBugOWYHv5eApy9uVMGFuby
	 cfvdAw3gH8Ayd8dWp5wc4fIPigEtNY0MRJRcgm8tMOlrZTrdQxHZjb9OquMB16KBiw
	 ZgHfot5G79hARqWhQ2xXONcUO/vDk954oz29qMnmwM5FYZwbnciCMiY42vr4IboNOt
	 cG6rNukwyCzXblaBje8We10KL8Blo06kgShnNv0+wdsKTjnd1Gss6w7IPTiAwScXMN
	 X+YeZGGsqACoQ==
Date: Wed, 30 Jul 2025 09:15:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] Add support for Clock controllers for Glymur
Message-ID: <20250730-axiomatic-colorful-gharial-1e6060@kuoka>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>

On Tue, Jul 29, 2025 at 11:12:34AM +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC), TCSR and the RPMH clock
> controller for the Qualcomm Glymur SoC.
> 
> Changes in v3:
> - Update the commit message for all the dt-bindings [Krzysztof]
> - Update the commit message as required.
> - Link to v2: https://lore.kernel.org/r/20250723-glymur-gcc-tcsrcc-rpmhcc-v2-0-7ea02c120c77@oss.qualcomm.com
> 
> Changes in v2:
> - Drop second/last, redundant "bindings" in TCSR and also align the
>   filename [Krzysztof]
> - Update the year to the copyright [Krzysztof]
> - Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
> - Use qcom_cc_probe() for tcsrcc [Dmitry]
> - Add RB tag from [Dmitry] to patch #5
> - Link to v-1: https://lore.kernel.org/r/20250714-glymur-gcc-tcsrcc-rpmhcc-v1-0-7617eb7e44d8@oss.qualcomm.com

None of the links work.

Best regards,
Krzysztof



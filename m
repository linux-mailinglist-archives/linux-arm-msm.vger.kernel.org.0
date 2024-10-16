Return-Path: <linux-arm-msm+bounces-34558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6339A02F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 09:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 952C5B25A84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 07:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C71B1AF0C5;
	Wed, 16 Oct 2024 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USO8bjom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2618B478;
	Wed, 16 Oct 2024 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064855; cv=none; b=WUOex/zgoY6vZd0oR2kTYMmzPv7jpG6V4gwGxuVX2ubqeSlSP4LGMSCrgr4f6TeJreMnoSXhv97WyWthXRLDfYa41qieAiGgXNHtY4pgKiX9q0Yu17G3/b3oREHxpWa9WBm2hVr0I9MsX8SgMEncZUDNTm6oRxNRsiJjcyH/74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064855; c=relaxed/simple;
	bh=jf4OwaxHcdsO0QCgg9KFcZKV0Gr1jLc6IZPiKDRY5gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBiBxw9+cmazF21SGTdsTU9h9V4l4VHCF66OksTVO3tnatPX2gkMyhBtx4K73QgVKhO3l5qvUD8n0VcA7vaSZS88PLfzX8XAGo0z7PPEF/BBJCO/Fh2labcH5JjIzfIuGrifrndIRT5wG/iG1kgoP/E1Ixcg+yFDAsUeSk58884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USO8bjom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DC3C4CEC5;
	Wed, 16 Oct 2024 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729064854;
	bh=jf4OwaxHcdsO0QCgg9KFcZKV0Gr1jLc6IZPiKDRY5gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USO8bjomVqGAS1r4X3ZCZqktD74PWGgdFNF2X40IJrMoV5L4zoHmcU3E3sFr0UcIl
	 Q/j0r7WFdIj0Si350gu4yKbKomyq0dIZvn3k0YrxJ/vVEzMv1brjDfpTrZXyaiSJIw
	 bCWtbtudVjbcz+27BegwIVEZvY8VExRZDCilpPYPQY3XHUI/GIfaGrQDJ/ac8k6H1B
	 Cjza1EHwAnZXcKJ/T/UzeX5SKo9Ub/aUNGSwvXV3+naemhNXIGNopyCd54ql1808mn
	 aVTUbp+9BrHWXOVGkcHQmvOMaI4MdmyEWgISvB0PZ1MGHwH5eiPRMohgPUevOgb6ft
	 gtmYYOb3RZcSg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0ykv-000000006Jl-10dx;
	Wed, 16 Oct 2024 09:47:41 +0200
Date: Wed, 16 Oct 2024 09:47:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: add
 missing x1e80100 pipediv2 clocks
Message-ID: <Zw9vnXpzyzLmZA4k@hovoldconsulting.com>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
 <20240916082307.29393-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916082307.29393-2-johan+linaro@kernel.org>

Hi Vinod,

On Mon, Sep 16, 2024 at 10:23:05AM +0200, Johan Hovold wrote:
> The x1e80100 QMP PCIe PHYs all have a pipediv2 clock that needs to be
> described.
> 
> Fixes: e94b29f2bd73 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHYs")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Bjorn has now picked up the DT fixes for 6.12, but we need this binding
change too to avoid checker warnings.

Could you pick this one up for 6.12-rc?

Johan


Return-Path: <linux-arm-msm+bounces-72403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77150B476D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 21:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217EB7C0543
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 19:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC0621ABD5;
	Sat,  6 Sep 2025 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi6iQuEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BBC19924D;
	Sat,  6 Sep 2025 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757186200; cv=none; b=hPsxNYIsTuXId+1R1XKiDU3xcV8Df1ff4L5nHhkS8GGCIVyH6vi4a7TRDIrGR2KIVIqYEQ4erM4rZavEJKCl0W89YnvgPOr+GWoGAsPnhOxnRqi5Kc1E6HmEO50RzievXVADX+zOlIgItH55TnEzgzR/Opa4PfP+mI094kovHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757186200; c=relaxed/simple;
	bh=uIDKj7ZXFbKOs9ax3//A63tNRR3uLcMYrOEG5/rAKkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1qCoMr5H2Q1KzRHBDMxhuBgzRV4zo5VsA2Rg94K6Ycv5IhfFY5FAXxNto1Wavysr2ujD5MjL3puOJRM4dTSwMoqouFLjt2fpnAP7Q91cBPI0DEIUBQp1WyiKQFnnllNKnBGZcGN480nAot6nGObbQY/T1ggZNrKrAErELOB3Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi6iQuEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C60C4CEE7;
	Sat,  6 Sep 2025 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757186200;
	bh=uIDKj7ZXFbKOs9ax3//A63tNRR3uLcMYrOEG5/rAKkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mi6iQuEhgnp5tOmxJ3oM9cYaw3FAxxc9SikcLPTGy1PskwNcVE0bxvSYQNFM7xRzj
	 tYi5Cq6/K9Un2+exi59cpu/7GBNPoL8YKkwPFEyviQpXwTTkL7/cU6nO3U3dp87nOA
	 OCXuo1X3BypFInFYVbZD7RDyNY3B1jEO37uMG0QArQSuipIx8NGRLC9zS4SKzdeyiN
	 z6C8IRP9qQKC7LfjDb2/Jo8Kjw0C18GkV1QhchFMPnEOTwhGTH1ObjyFBuHRYvxZAj
	 BPNWQbVEOple9+sbhzm/uYoMwC+cQVpwJQvuC6vSIN4O8NzFqddsYkO+OhOr+Rd9L2
	 plLAARE/wxZ0Q==
Date: Sat, 6 Sep 2025 14:16:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eric =?iso-8859-1?Q?Gon=E7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: qcom: document x1q board binding
Message-ID: <175718619242.1639538.7036385000984278430.robh@kernel.org>
References: <20250905190931.27481-1-ghatto404@gmail.com>
 <20250905190931.27481-3-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250905190931.27481-3-ghatto404@gmail.com>


On Fri, 05 Sep 2025 19:09:30 +0000, Eric Gonçalves wrote:
> Add binding for the Samsung Galaxy S20 board, codenamed X1Q,
> which is based on the Qualcomm Snapdragon 865 SoC.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



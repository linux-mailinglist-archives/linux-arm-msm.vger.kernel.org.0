Return-Path: <linux-arm-msm+bounces-30248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16500966158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 14:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794B51F2735D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92FD19993F;
	Fri, 30 Aug 2024 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts4mj0PW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66F1384B3;
	Fri, 30 Aug 2024 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725019752; cv=none; b=YKfyo3HfOhQoEY1Kq+YX0pOMeTfCwcNa26vvjN6Odf7w6JMvOJKy1GH5SgmfF73P7Aoaqttsk4LYvH9kBckk3bwQu4eDJo2VDnTAPxsz3Mvi9ztZx+5FIJL2nJ/a14+ukgYAKEJVJjewRnSGtqulIkTf+faM5OdJY7185Ms/DKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725019752; c=relaxed/simple;
	bh=+PdqaIAnbvFWzUlrXS5dGz+94tQph/rZhL6Pzhzm0RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLDEmUxQIGYRwab4e50sY2SV0voV7vdtPfF6OICKUrPumOrcaIc0XUPViycAUyHDbwRIY86028+7EVT0RgWdW7WK4z4Pl2tdQVk4NujtEH8X+QUBAo7FwqWroofOcP/FmppGfUjbmuxlj+23S60pp2VBHZTF8hgj6hFTYswnWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts4mj0PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27319C4CEC2;
	Fri, 30 Aug 2024 12:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725019752;
	bh=+PdqaIAnbvFWzUlrXS5dGz+94tQph/rZhL6Pzhzm0RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ts4mj0PWgjvWJ/9Hvw6e2c8sBU3UXW4VOt1XBc3uiwzIHodYOSPFnXiXmn6oQ1aXn
	 hNIpT7dx1M0e+NcN5fStkUQIccy6aZERUXEiA4hVf0eoD3epSzGBiC7R4IJLSaHi8S
	 c1VpE7Hu9OZWLZ1T/O4bgx6l4pnxyWxu10ohFpd1hcbxOGkjLpES/Foo+Y5hs++i1/
	 3eDhCkMA52nD5ghHSz4IRP8LsHnvTRPtF+P5TkJVrlOF+HHGafZI3veIRAC9nsncid
	 BGYDdQlw+ohuFc6+fqJctBVx1Zh6rRl0CtO4QtKWev0AeKem/9mCK8kfBWWAEKxxKH
	 k9KqumZy+tG9Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sk0RR-000000006vI-47q4;
	Fri, 30 Aug 2024 14:09:26 +0200
Date: Fri, 30 Aug 2024 14:09:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <ZtG2dUVkdwBpBbix@hovoldconsulting.com>
References: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
 <20240823-x1e80100-phy-add-gen4x4-v3-1-b7765631ca01@linaro.org>
 <gvx3sdsdxigel3iwu7vgvvgxohvnaqq6suogsqojeumobhwhdk@5qct23m5ncda>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gvx3sdsdxigel3iwu7vgvvgxohvnaqq6suogsqojeumobhwhdk@5qct23m5ncda>

On Fri, Aug 30, 2024 at 01:42:10PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 23, 2024 at 10:04:15AM GMT, Abel Vesa wrote:
> > The sixth PCIe instance on X1E80100 can be used in either 4-lane mode or
> > 2-lane mode. Document the 4-lane mode as a separate compatible.
> 
> As the patches were merged, it's too late for this series, but as a
> note: we should think of a way to describe the PHY configuration without
> changing the compatibility strings. The hardware stays the same, it's
> just the number of lanes being wired that changes.

No, this is not about configuration and we need two separate compatibles
as the two PHY instances are distinct and only one of them can be used
in 4-lane mode.

The mistake was to ever describe pcie6a as 2-lane in the x1e80100 dtsi
(and possibly also in the ambiguous commit message above). Whether
pcie6a is used in 4-lane or 2-lane mode is determined by a TCSR
register.

Johan


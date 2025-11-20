Return-Path: <linux-arm-msm+bounces-82666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993BC73B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C7FCC2AA84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B707336EE9;
	Thu, 20 Nov 2025 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6dFsT9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592B337105;
	Thu, 20 Nov 2025 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637628; cv=none; b=FXiWBWAMciPLIoViB/nzCqlsycW3mAOiJNMKFFNZX1LmkqkrI//OXUN0qCRc+/0GYoVC8KWIUnYrM4DICEcB8F3Rijcu4z6BuTY58k8XyaebfYQV5oENw3KAfXfPNUSOnO0Uf5GXt8/QGmgN10vjm9EhQRc9Yr8Cn3yIy8HT1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637628; c=relaxed/simple;
	bh=7M/+by6hjHaSWvOQWnNFtGMfjey8mHHTw3tpzF2pw2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFz2l3OSafCQMpUXDRgqG8KfZeKUrrk3mIaMUo6diNARkSlq3OKpZI7RKV5FzLhd9kjyriPodZydWQKLJDq7NXThJS/l3625zaI5zKrBW/4ZOBsFkQdiJgVIsk+EeC32QUPcvUdxiX/Jqvi2j/I5oRVEmDrrQTqMtyORFRBQk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6dFsT9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7967AC19423;
	Thu, 20 Nov 2025 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763637627;
	bh=7M/+by6hjHaSWvOQWnNFtGMfjey8mHHTw3tpzF2pw2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6dFsT9n0bk34WzsZndpIYXsI3Iz/wcjlSKLfRcrpxx4z+lzlxMFFt7oucqRuutbD
	 fm3VLZiW9D2800h5tUmepsj0i2jIJwH8jdhnAJFZBGVaPwlh86tGth33xY7QRVWkPy
	 PyIiahqDUVlUxqLYpuHoXBv33p2pk5B5J7puSxLgXRx1ChDl2a8Wl6DCs/QfJFdtoF
	 NiaLGSGVgneY8HpNll2cbLuXdlosZseIcDM2SlRUF2NwA8VVwaEwQOGbeqDbIE893u
	 YEr4gv6qyD9DMLi8a+IZV0T77prNsvlDwLQ0sqEacPHhrENkaw0iDiaPmqzpuBtfP1
	 oI2KDMe6MQm8w==
Date: Thu, 20 Nov 2025 16:50:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, 
	Wenbin Yao <wenbin.yao@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] Add support for Glymur PCIe Gen5 x4
Message-ID: <hoxawvhmxyht2pf53xiw5wratcmivc7d3g2w4u5lzhkvnjm2ua@yba3t26of36c>
References: <20251103-glymur-pcie-upstream-v6-0-18a5e0a538dc@oss.qualcomm.com>
 <aRyoo2Ve_hjgc84M@vaman>
 <aR7xkSWWLoGX1HYn@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR7xkSWWLoGX1HYn@hu-qianyu-lv.qualcomm.com>

On Thu, Nov 20, 2025 at 02:46:41AM -0800, Qiang Yu wrote:
> On Tue, Nov 18, 2025 at 10:40:59PM +0530, Vinod Koul wrote:
> > On 03-11-25, 23:56, Qiang Yu wrote:
> > > Glymur is the next generation compute SoC of Qualcomm. This patch series
> > > aims to add support for the fourth, fifth and sixth PCIe instance on it.
> > > The fifth PCIe instance on Glymur has a Gen5 4-lane PHY and fourth, fifth
> > > and sixth PCIe instance have a Gen5 2-lane PHY.
> > > 
> > > The device tree changes and whatever driver patches that are not part of
> > > this patch series will be posted separately after official announcement of
> > > the SOC.
> > 
> > Please rebase on phy/next, this does not apply for me
> 
> Hi Vinod
> 
> This patch serie depends on
> https://lore.kernel.org/all/20251017045919.34599-2-krzysztof.kozlowski@linaro.org/
> 

Why was this dependency not mentioned in the cover letter?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


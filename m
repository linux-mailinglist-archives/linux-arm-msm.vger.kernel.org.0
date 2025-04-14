Return-Path: <linux-arm-msm+bounces-54175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E515A879ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAF783B0827
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 08:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6A31FECAB;
	Mon, 14 Apr 2025 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxXdKqWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C0D2F42;
	Mon, 14 Apr 2025 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618427; cv=none; b=fdjC8OCInDRxddz2Ee7V/u9tPiM8gWKflGW/VOdglvMrYyd2FkJsWzjDpgKutkXxLG0Skd+4dKW5K83sD7oV1+huDzxpohWBrBneQz8m2sHFpcbrGOSNyQRCMR71fYvhqFXtIqsLOMUzcGEsqoDtAs/MUU8jLMcJErFVNgiGs3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618427; c=relaxed/simple;
	bh=/GliPvWxqmWkfViSv1OxAlqTAyRsqoblIC/0Lf7EkFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGX4EpVt8Thl1yKnW/q/fCY7usMk/hPWHPH64ItA1Vc1aXIAw9V75Y0eELepKxLMhlDDdfcw20ubWy9G83sou/RAWEHMjUNut8gluTNEoWITWUImdXngd9hqy2E+GMK1qqC9qaL41c+kqEJFuNzrg4hP3ISg90DfmI5to7ej7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxXdKqWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A79C4CEE2;
	Mon, 14 Apr 2025 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744618426;
	bh=/GliPvWxqmWkfViSv1OxAlqTAyRsqoblIC/0Lf7EkFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rxXdKqWribRXynbgV7o3GDzN2oslDuc1R0xhHvkUN73fltLvhGPwB3GdIpID/30zV
	 NK9sDhneTmHDTc7VNkc92ieX2mDNwAb8xuufHOx+7qIt6vf3tPW/pb3nE6qf+Fdx4v
	 mYNGgzlI6jVS5J+fTbaid5jA2YKVcIBCLZZHUDsQlr6oXF6hLkbKBHsGkJ8/KAbvfy
	 7uYDM1aE/8iBEVoAhSXLkdpwQwpbsSfj6pXL+SYUdDtQeRkCAfGTH08wuF3tFWV89V
	 KaHlrQY6IkuF94u808CWE+Y1U0OSoTu6HaA2EIKGLGyASZocH/pW+goowlEVcKyxw5
	 CjRgstDAy5n1A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Ewn-000000002q1-2onL;
	Mon, 14 Apr 2025 10:13:42 +0200
Date: Mon, 14 Apr 2025 10:13:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, vkoul@kernel.org,
	kishon@kernel.org, lumag@kernel.org, quic_kriskura@quicinc.com,
	manivannan.sadhasivam@linaro.org, konrad.dybcio@oss.qualcomm.com,
	quic_varada@quicinc.com, quic_kbajaj@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <Z_zDtfEsgXsFodG9@hovoldconsulting.com>
References: <20250413212518.2625540-1-chenyuan0y@gmail.com>
 <22ec4fc8-9368-4955-ac97-c49b3317d3b3@kernel.org>
 <Z_y73a5IDO66AzY1@hovoldconsulting.com>
 <f3b77aa4-e7a4-475f-a633-48aab59fa9b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3b77aa4-e7a4-475f-a633-48aab59fa9b1@kernel.org>

On Mon, Apr 14, 2025 at 10:08:18AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2025 09:40, Johan Hovold wrote:

> > I'm afraid you're mistaken here. See __devm_ioremap() which can return
> > NULL.
> > 
> Uh, you are right, I only checked devm_of_iomap in qmp_usb_iomap().
> Anyway, the fix should be different - given function should either
> return ERR or NULL, not both, so devm_ioremap return value needs to be
> wrapped in ERR_PTR.

Right, I already suggested that:

	https://lore.kernel.org/lkml/Z_yxxoa12N9rNn2z@hovoldconsulting.com/

Johan


Return-Path: <linux-arm-msm+bounces-79802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23531C23623
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F36B3B3E91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 06:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33522F1FFA;
	Fri, 31 Oct 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxsNeoXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBA2E6CDC;
	Fri, 31 Oct 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761891871; cv=none; b=fHb84BfMxg+u3S+w2US6OYdA3Xd+eE129YnRRRgC7MRa9u7m6qSR0nhqaM27Cj900Gpq+WbgxT6rf8CoTcT31pES6vtIuisVb5uYHtBAXY58/lbu1xQJbpM+KTRj3E+Vbluy2WP9u3+M/SyTA8iTmu07CFk7GCbGrOinRIQSZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761891871; c=relaxed/simple;
	bh=Gx36hnGWAQ2oEjgtU0RiIzRSUUtzVKWwySw5lRgt18Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leQVfzRIRROkx8fRjYycsa4hklgUm6SA39Fg7MqoZFMVKdLivumRHVriOcicjFcgyf1WHY+H4Ktq37lkQ9YarRl92NxIIvLw61FpwEQgFEApzyVR/9tffvUAX7HE6a3EFWXmlkOmulizxXZEhwRyTZuV7UjQAOSbTaHIZtkggeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxsNeoXS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8C2C4CEE7;
	Fri, 31 Oct 2025 06:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761891871;
	bh=Gx36hnGWAQ2oEjgtU0RiIzRSUUtzVKWwySw5lRgt18Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxsNeoXSm0Nbf5uzE70mETukL2gaymy5t40jq4q+s84SqQJRhB4Z6kEjRb2T3Ngly
	 uuT2K1tjfMBfK8+yajAyhQpkJ4mGkTlteXja85LCzMSyVBij5rezk1j6ZUiDhEvTuM
	 PDZ2k5RRdOFUxlz/Mx+wEuyEpt/A+yx14InUdfUCBVDIxhnONPZ1wfnQYWN5PBoBPi
	 NEnbHteI4p1pu2dF7msKHSYl7+28ZQkny+7UO3RO6e0AqaCc5YSrirTxmNTvR/2tz/
	 LjGywqQRphj1JRuv0xoBkKYh/SIxFgegMe8yDpV7lfOw2Dg9h5Bul2oD5WYzfW9cHG
	 aTUDSIWqDRhrw==
Date: Fri, 31 Oct 2025 11:54:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable SCSI UFS Crypto and
 Block Inline encryption drivers
Message-ID: <2oynmuekw5lnzl244uqz2aehpg5rhttddu43lqplnxemyjd3g5@6yzchzihe57h>
References: <20251030095509.5877-1-manivannan.sadhasivam@oss.qualcomm.com>
 <27841a96-b8a5-44aa-b0ef-d8bab9ba3477@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27841a96-b8a5-44aa-b0ef-d8bab9ba3477@kernel.org>

On Thu, Oct 30, 2025 at 08:48:48PM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 10:55, Manivannan Sadhasivam wrote:
> > These drivers will allow using the crypto functionalities of the UFS
> > device, like Inline Crypto Encryption. Both of these drivers are of type
> > 'bool', so they cannot be built as modules.
> 
> Is there any device benefiting from these? Which board?
> 

All ICE capable Qcom UFS based boards.

> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> You do not need the second tag. You send it via oss.qualcomm.com which
> is still valid.
> 

Yes, I know. But I was having some issue in sending email through
oss.qualcomm.com. Now it got fixed in the RESEND patch, but forgot to remove my
korg s-o-b.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


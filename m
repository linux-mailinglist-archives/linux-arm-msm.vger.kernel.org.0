Return-Path: <linux-arm-msm+bounces-21596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0E8FB209
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA5C1B222BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963BC145B3C;
	Tue,  4 Jun 2024 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwyFVx58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6963A266A7;
	Tue,  4 Jun 2024 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503651; cv=none; b=DA0ObBnj2EP7AA+tbhhByB7Pibqg/9MEsRIddCR4BrL5V74xfzX1Ecea0Vk1jnCRYJznblgaNg0nmd1MkyumBQeIHqUPZwPAaPwEv8X3fZcZjTo9lYCvY4CtPkxh1tBfy9aZwwk4TmVr1riqmTRaCEnzS7FjjwKUi1FOTzLdnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503651; c=relaxed/simple;
	bh=NKwOpB3kbLqf8Jz4qx2GPKQlksGAkDAxnc+ruTQ5uUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glINFDWQ2lD0xluR+5aKTQwFeJbprm2QxkxFjBLaZY1GOFyIncAwE8QZcEqhlmYIdc/mt4j3kWA1BQ/FdhM6a9FKDlpj7c21h6G2SNY9upkVY/GdF/lGbAm6y3XLieNIUNbyvxs4xzgvtWVKZKo/fOu/DWrVzwe1tGZzmgH3koE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwyFVx58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7B1C2BBFC;
	Tue,  4 Jun 2024 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717503650;
	bh=NKwOpB3kbLqf8Jz4qx2GPKQlksGAkDAxnc+ruTQ5uUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwyFVx58ctzTvj0oJ4ON89UyU/K9WAQFS4zaFGjo2V33eZ1/sNZb3yttdG8eQ5ztZ
	 Jf2UhEAFRMSDZGT5kzpLKHJrokL/2uefENxq+d5HIml2YF8hJYnKDT+L1i7jSaKYGt
	 9BH48Gb632YdQ5bDltUQ+iHrRZm7portQcLIsHUvLLYv/5pnw+WqRNXZ3DnAtsAP/g
	 pUOtyir70LpZQ2AjbefVnMEsc58Nt4pRPDrgQZBKYj15T7K9NmlIRIagQxZgj93SpP
	 JG/svaiftbvy/MbUtFxF01lXBcaW/Fteyu2Tk6LTM6TNidF9pDc0jKQACOnMDGvvvu
	 xXyPltw89Q9sw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sET9l-000000004Kh-3zC9;
	Tue, 04 Jun 2024 14:20:50 +0200
Date: Tue, 4 Jun 2024 14:20:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Make the PCIe 6a PHY
 support 4 lanes mode
Message-ID: <Zl8GoRoY9lXRtg2R@hovoldconsulting.com>
References: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
 <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>
 <Zl28nvnpGFRsYpGh@hovoldconsulting.com>
 <d93fe55e-7c65-48cb-bdaf-5e15bc22be30@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93fe55e-7c65-48cb-bdaf-5e15bc22be30@linaro.org>

On Tue, Jun 04, 2024 at 02:00:10PM +0200, Konrad Dybcio wrote:
> On 6/3/24 14:52, Johan Hovold wrote:

> > As I just mentioned in my reply on the PHY patch, this does not seem to
> > work on the CRD were the link still come up as 2-lane (also with the
> > clocks fixed):
> > 
> > 	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up
> > 
> > So something appears to be wrong here or in the PHY changes.
> 
> Is the device on the other end x4-capable? Or does it not matter in
> this log line?

Yes, of course. It's the CRD as I wrote above, and you can tell from
other log entries:

	pci 0007:01:00.0: 31.506 Gb/s available PCIe bandwidth, limited by 16.0 GT/s PCIe x2 link at 0007:00:00.0 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)

lspci and what Windows reports.

Johan


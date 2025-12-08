Return-Path: <linux-arm-msm+bounces-84620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A13FCCAC0EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 06:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EA01300DBA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 05:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852B3285050;
	Mon,  8 Dec 2025 05:13:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D19D233704;
	Mon,  8 Dec 2025 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765170825; cv=none; b=OivwRVXIN+AENt9cWyb4e2nRJkYkHovSA/Av0yNqfY8Dydhu05er12CEnDWawX2YLMZ5tohRheoKRs6966zu10MHsKKdgIBlp6lCGeJ7zdAFoCLI3aA719zLmYszNJIT6yvs79TqmIlnfX9sL+aR7PggefIQoQyEdGluV5OAjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765170825; c=relaxed/simple;
	bh=WtfMvqpW97zqmnJPVDsJ2vmrHxRz85OLzP5oikjBVAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om2MBIUnBlTQJM1ijxhDFNN448xcXVWs9FGQuzNmf/AdyV2ReadbDbNjTb3lI/oQr+MChQtOSu8+sZoL+pEEOgDmIkba5SvJf+yjLBYttR1zf8BufCg0h5qGzF/D/Wc0oXQZCmWA5neJcAiVWb6RehCErW0V5rAA6BmAUV4NEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854DEC4CEF1;
	Mon,  8 Dec 2025 05:13:39 +0000 (UTC)
Date: Mon, 8 Dec 2025 14:13:33 +0900
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU
 nodes
Message-ID: <qzpeft3wmmh7idysviyevrmfs72oeoz3c4dddizfovd7ix7yoq@6vtqz5fhknij>
References: <20251015065703.9422-1-mani@kernel.org>
 <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>

On Sun, Oct 19, 2025 at 07:01:30PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 12:27:03PM +0530, Manivannan Sadhasivam wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > Enable passive cooling for CPUs in the X1E80100 SoC by adding the
> > '#cooling-cells' property. This will allow the OS to mitigate the CPU
> > power dissipation with the help of SCMI DVFS.
> 
> #cooling-cells isn't enough, the devices need to be listed in the
> thermal maps.
> 

Not strictly required unless the cooling device and trip points are wired in DT.
But I don't want to do that yet, and just expose the cooling devices to
userspace so that I can experiment with something like thermal-daemon.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


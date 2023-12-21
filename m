Return-Path: <linux-arm-msm+bounces-5775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6A81BCB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 18:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453601F23350
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324195990A;
	Thu, 21 Dec 2023 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejtRGhxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3358221;
	Thu, 21 Dec 2023 17:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D60C433C7;
	Thu, 21 Dec 2023 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703178794;
	bh=nAyiX2jVa47VcjFldc2L8bwP0OG/80C5+x4N04/VWn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejtRGhxj7cS86pXS2KzLKKAJLerUlW6+M4wQzjlIRnyiP9lgkl9MC3SHQ91dc6igr
	 VJV3uq+wzBBLwagh48AOWkoTR5/nZ52RUXfZYb2WH2qfjMH10CTn1i/QGgcA4Zl4Ks
	 3YZkXhWhsMC1vjaeUCzV8kS4Wm0iKkwgdxLXOv/Joqm9GpLLBX0+9pOXsedkxGZYSP
	 4eGIByOofhN2AD9DCJpp72YMNGWwY16z7GSw4g+sUnt/50LhUMCFxYp4emIOC2xg3g
	 q782ViZF4N3XFY73gV+oHnpfcLmPLzuPxio69tjaqz9Yum5sEOInfX2BgLuwf+tYps
	 nKYXZS74e7JXA==
Date: Thu, 21 Dec 2023 22:43:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 09/10] phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550
 UFS HS-G4 PHY Settings
Message-ID: <ZYRyJU9klhZzLdni@matsya>
References: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com>
 <1701520577-31163-10-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701520577-31163-10-git-send-email-quic_cang@quicinc.com>

On 02-12-23, 04:36, Can Guo wrote:
> The registers, which are being touched in current SM8550 UFS PHY settings,
> and the values being programmed are mainly the ones working for HS-G4 mode,
> meanwhile, there are also a few ones somehow taken from HS-G5 PHY settings.
> However, even consider HS-G4 mode only, some of them are incorrect and some
> are missing. Rectify the HS-G4 PHY settings by strictly aligning with the
> SM8550 UFS PHY Hardware Programming Guide suggested HS-G4 PHY settings.

This fails for me, as I have picked Abels offset series, can you please
rebase these two patches and send

-- 
~Vinod


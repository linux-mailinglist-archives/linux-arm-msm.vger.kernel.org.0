Return-Path: <linux-arm-msm+bounces-50873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B4BA5A438
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 20:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E8516C252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 19:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFAE1DE2CE;
	Mon, 10 Mar 2025 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELSA4Ikd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A781DE2C6;
	Mon, 10 Mar 2025 19:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741636760; cv=none; b=Tpem6owhR/aEW7ITt44oWb66vDmaqi8BKLRD9wylcRKGApSMxw2yC6Gb4d1SgfsCMFS7UaQOZQ+4HG3HZ4zW3/bLzXUEVGWLe1iD/NZgEcddEhIyZKvndZ4lfmbG+D263ytza/zv04ZdzWVWdHwt5isppJdV/eBjdi18iGUVaQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741636760; c=relaxed/simple;
	bh=YqJdrfcQL5bnoaK4e6HG8xxxcS9OpHaA0+10lzP6WRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9GhaPbeCsWEm4NIvVmeFel0m8HTQW3/SWV42/3KorDdW6PQt/bfNfPjgBOCVMf/Lcbb0QNIZA4QCTmKJsK78VS4aY9tDw7XdSKL/q5/tqARegg/KUaHT6EYNwFp4yyxWl6CnZT+CBj3sEx/ULekIBqWDvB4p1mdUsttP9hPueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELSA4Ikd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCE4C4CEE5;
	Mon, 10 Mar 2025 19:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741636759;
	bh=YqJdrfcQL5bnoaK4e6HG8xxxcS9OpHaA0+10lzP6WRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELSA4IkdAyOc/R4oignOVi0GSH5WimVosRrPkHmnUNzvU44ucu6Rug24nJlBen4BI
	 1SF95b24TYr9ya7oNj4w52pva7KmVNlMOLTsLjBQPcf1UzbWKqnwgG4OWNP27/QWP5
	 p4BGyNQ+LBcNVkESGVqU9kONuHjGgfco3EVks/TQLMkYqoys7CsEuUmMnxe1cMp0ca
	 raDxBZ63kYZCr5JZ7KsdKl6OmZNez1viGEA04OnkLX+1mXJEX4VF5pidq87HUctduw
	 dXMpXuU71XQG8Osmxn15fw2FyTDcYGhLrzhB3ARoBmniUTfvt/2EEn/P2tWl71z3W6
	 CS8lF90dLu3PA==
Date: Tue, 11 Mar 2025 01:29:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
Cc: kishon@kernel.org, p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
	abel.vesa@linaro.org, quic_qianyu@quicinc.com,
	neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
	quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
Message-ID: <Z89Ek8Y7TRSgTuMg@vaman>
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
 <e556e3c9-93ee-494a-be35-9353dc5718e4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e556e3c9-93ee-494a-be35-9353dc5718e4@quicinc.com>

On 10-03-25, 16:58, Wenbin Yao (Consultant) wrote:
> On 2/26/2025 6:35 PM, Wenbin Yao wrote:
> > The series aims to skip phy register programming and drive PCIe PHY with
> > register setting programmed in bootloader by simply toggling no_csr reset,
> > which once togglled, PHY hardware will be reset while PHY registers are
> > retained.
> > 
> > First, determine whether PHY setting can be skipped by checking
> > QPHY_START_CTRL register and the existence of nocsr reset. If it is
> > programmed and no_csr reset is supported, do no_csr reset and skip BCR
> > reset which will reset entire PHY.
> > 
> > This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
> > decide whether the PHY supports nocsr reset by checking the existence of
> > nocsr reset in device tree.
> > 
> > The series are tested on X1E80100-QCP and HDK8550.
> > 
> > The commit messages of this patchset have been modified based on comments
> > and suggestions.
> > 
> > Changes in v5:
> > - Add a check whether the init sequences are exist if the PHY needs to be
> >    initialized to Patch 2/2.
> > - Link to v4: https://lore.kernel.org/all/20250220102253.755116-1-quic_wenbyao@quicinc.com/
> > 
> > Changes in v4:
> > - Add Philipp's Reviewed-by tag to Patch 1/2.
> > - Use PHY instead of phy in comments in Patch 2/2.
> > - Use "if (qmp->nocsr_reset)" instead of "if (!qmp->nocsr_reset)" in
> >    function qmp_pcie_exit for readability in Patch 2/2.
> > - Use goto statements in function qmp_pcie_power_on and qmp_pcie_power_off
> >    for readability in Patch 2/2.
> > - Refine the comment of why not checking qmp->skip_init when reset PHY in
> >    function qmp_pcie_power_off in Patch 2/2.
> > - Link to v3: https://lore.kernel.org/all/20250214104539.281846-1-quic_wenbyao@quicinc.com/
> > 
> > Changes in v3:
> > - Replace devm_reset_control_get_exclusive with
> >    devm_reset_control_get_optional_exclusive when get phy_nocsr reset
> >    control in Patch 1/2.
> > - Do not ignore -EINVAL when get phy_nocsr reset control in Patch 1/2.
> > - Replace phy_initialized with skip_init in struct qmp_pcie in Patch 2/2.
> > - Add a comment to why not check qmp->skip_init in function
> >    qmp_pcie_power_off in Patch 2/2.
> > - Link to v2: https://lore.kernel.org/all/20250211094231.1813558-1-quic_wenbyao@quicinc.com/
> > 
> > Changes in v2:
> > - Add Abel's and Manivannan's Reviewed-by tag to Patch 1/2.
> > - Refine commit msg of Patch 2/2.
> > - Link to v1: https://lore.kernel.org/all/20250121094140.4006801-1-quic_wenbyao@quicinc.com/
> > 
> > Konrad Dybcio (1):
> >    phy: qcom: pcie: Determine has_nocsr_reset dynamically
> > 
> > Qiang Yu (1):
> >    phy: qcom: qmp-pcie: Add PHY register retention support
> > 
> >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 86 +++++++++++++++++-------
> >   1 file changed, 63 insertions(+), 23 deletions(-)
> > 
> > 
> > base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
> 
> Hi, do you have any futher comments?

Patches lgtm, It would be great if this was tested by someone as well...
Abel, Stephan, Neil can you folks test this and provide T-B

I am also concerned about bootloader assumptions esp if the Qcom boot
chain is skipped

-- 
~Vinod


Return-Path: <linux-arm-msm+bounces-82398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222DC6BD21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57B954E5918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 22:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143C830FC13;
	Tue, 18 Nov 2025 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4JMu2TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384F30F947;
	Tue, 18 Nov 2025 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503672; cv=none; b=KqFgSKepEY2rgyJAAa5PODnztwkIIqrHubGOmmAQOoNx/em0U8C2e9pUYoY8YMrFJDN3q2INDAZYxzf/B9lxYjZCMgiMuOXYhqhUL6UR3IXk+ufw8uTAPGxf1qyApM80kcdG70GE/B7RSueK5v9HdexiYiaJSj/rARmfwh/ScNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503672; c=relaxed/simple;
	bh=JU2qtH5yscXiGSRhOuUtyaAl/sjxudVrA6J6/diZpe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtbIeaka38QuJA+/vCHMTrfUO69NNK8du9QaDFgalk1BzUnL6Wf9k/PYwgLYOhCa9u0AE+16KIZcPX/WMUY9J0lgiDPLGj+JlGrJap2pGVIrcrjKTJdk/N/zPf0slZnwlJThWtReMfS4+uyxQbMe56Ol2ztCGOuAcP4RmGS7kFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4JMu2TF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE05C4AF0D;
	Tue, 18 Nov 2025 22:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763503671;
	bh=JU2qtH5yscXiGSRhOuUtyaAl/sjxudVrA6J6/diZpe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g4JMu2TFcioY1MeDafoDofp4JnPAE97yVHqi154Qp+vPqeo8AEzxFZ1m6AZ/OjHz/
	 /hKoqv+qrkq0JSR+p9FHB5I/oq9kvCVlxvNG55xEXaduUskL+rym+cCWmmDAMBVC0o
	 765PDMySKoDNizyxjNvGJ6CVI+xX4U9WIdPMC/GIRlPt2RXBYp+FbuFiXC17ZVln+1
	 rJoxAIzd1CD5gFwCGAOfzpneso2TD1sjlsM6zaa0D37mc056bsZG7Zxp4vOqxvC3tl
	 NcvA74yjWEXdsi81a/ANYfBXywI2xg4Jr+fja8VAAdDYSFRkOIGldhSuPOBRSIli7W
	 gRExJ+oYersbw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/5] Add the support for SM8750 Video clock controller
Date: Tue, 18 Nov 2025 16:12:34 -0600
Message-ID: <176350395164.3382332.554948367903205082.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Nov 2025 12:47:04 +0530, Taniya Das wrote:
> Support the Video clock controller for SM8750 Qualcomm SoC. It includes
> the extended logic for branch clocks with mem_ops which requires the
> inverted logic.
> 
> Changes in v4:
> - Split the changes to remain functional as per suggestion [Konrad]
> 	- add the new struct fields
> 	- add the ECPRI driver
> 	- add the clk-branch.c changes for mem_ops invert
> - update the commit text for ecpricc code changes.
> - update the logic for mem_enable_invert [Konrad].
> - use GENMASK for 'mem_enable_ack_mask' in videocc driver [Konrad]
> - Link to v3: https://lore.kernel.org/r/20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/5] clk: qcom: clk_mem_branch: add enable mask and invert flags
      commit: 165d0b6dd248b939fb0d31a00687e6ef672b3b3c
[2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to the clock memory branch
      commit: 53a18958349a627ae5d6b1ea708289b6cf3d8b9d
[3/5] clk: qcom: branch: Extend invert logic for branch2 mem clocks
      commit: aa788d3b475652a3ebaca32ca714f02f8ece3393
[4/5] dt-bindings: clock: qcom: Add SM8750 video clock controller
      commit: b190eaea57803da00a4318ba12359625337be9e8
[5/5] clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750
      commit: a160860529b55c54dbd54137f86c818a53d07655

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


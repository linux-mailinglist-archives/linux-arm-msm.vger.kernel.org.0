Return-Path: <linux-arm-msm+bounces-33402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1CD992F57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 389BE2848D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A699A1DC188;
	Mon,  7 Oct 2024 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkUlxp/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D801DC07F;
	Mon,  7 Oct 2024 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311194; cv=none; b=MS3xVAIhH2tlcjUVPuN1u9j5mrKpl/5X+RI6PosBkES5yHRviVA01OFbUWEPZAl+TKo+QJFFOCtp39hpkF7YMOL/hB7vJPCYfIAh8fsOXIhA+biRUh/FqxdVrupSyAWDVJ2a+2lWyAc/IYJbwCJw7lGzMuds/KR0CzC8kRaZu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311194; c=relaxed/simple;
	bh=OyaAMERiTuuaLc4QPHcYCVuR8aGYbBexkajhlpocQmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nvt384ICWa594NurARn2ObhwH4xOu/6XlfMDCPS2ozRSdMuY2t4ljHzsdMA3xhNxHDkAGhWt7GIL7/KkK12KNFny6Xkyc+a7HCRzpm3vVpAIEo7uPqeEt7Rox/KoJXYr+8K4Dhkx6qI2a35871fvrpahqpumVsIXtWMJnhU+10E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkUlxp/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA853C4CECC;
	Mon,  7 Oct 2024 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311194;
	bh=OyaAMERiTuuaLc4QPHcYCVuR8aGYbBexkajhlpocQmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QkUlxp/VMIF2KDVNl5mwkASSS6Ip1A72Q1ivQpCOkgpNilMAW2x57CkLWwFj9wm0a
	 BFbcDTkXGde304XVYiciBWNMzhHb0CO+c54H54UUO2XzRvFDgBJpRyYSFzf+xoepoS
	 sfNzWZx209kr8ZpmZ3V5Ld5ZZDogKO//tF9IzK83WjDu7ANCG6P66kO7DUtXbnbIU9
	 7BVjW6hGxHZYOE4yUY0nO7UrVLdl95JAmmRWXsKoHPjyKKVEcGp8VPaGCyKasIHPZm
	 PRGURIIUqFQ7rcF9huuC2ywmuxWe5gpdFeZRZL9dcaBRAxNvL2a4RHiN2bMP8H58Ny
	 G5eP8gsBJBHRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	quic_nguyenb@quicinc.com,
	quic_bhaskarv@quicinc.com,
	quic_mapa@quicinc.com,
	quic_narepall@quicinc.com,
	quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_sartgarg@quicinc.com
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Date: Mon,  7 Oct 2024 09:26:06 -0500
Message-ID: <172831116161.468342.14405549447127047255.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919084826.1117-1-quic_sachgupt@quicinc.com>
References: <20240919084826.1117-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Sep 2024 14:18:26 +0530, Sachin Gupta wrote:
> Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
      commit: c17818a429affa1bc7c755e67e236c628c4099aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


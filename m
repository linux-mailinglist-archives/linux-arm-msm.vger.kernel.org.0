Return-Path: <linux-arm-msm+bounces-50652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D1A57418
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 22:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74E587A2271
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 21:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC6C21C9EC;
	Fri,  7 Mar 2025 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BO8+HRZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F120C01A;
	Fri,  7 Mar 2025 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384546; cv=none; b=CuL6C7ChW3iC8aJoavVPpw+3UBM1gybLmzyeMiBr39sn0yMw1CATzd7I4GS0uCG8/NbVPVCzVF1JcedNMjc2Sxjr8ZMPFvCxHb/DYaUWT+9LkHK4p64+GaWDTOBgoFI1+PE7q8sar7cW4fto8WvC8TtcSuPsEldCWonKvNzDClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384546; c=relaxed/simple;
	bh=HHaLvWmewEA0UB1/ZT/LTbWWfHBvq2qa7R4z05u++JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieGwSwnk+j1U8VHhkDWB3ShouqD6SGOnmudTF/VAlzflFzxSG1feXwgAfK99k4xdrepZFSngQq+krb7lNN62WNtsCCPiYue/yjLux3Ldosi3PIq7MQVx4WX1ftZwgRFDNRNTUwLIPFcA7i2TerSM7euFY/6D6w1jqpt6rsGFPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BO8+HRZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3F9C4CED1;
	Fri,  7 Mar 2025 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741384545;
	bh=HHaLvWmewEA0UB1/ZT/LTbWWfHBvq2qa7R4z05u++JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BO8+HRZHaRE5kBHYT5HbpF7Opg3fQElryBtTp79LF07A/DKXJqfN1cBNszyyLOZLp
	 Zj/UXPE/cnP+e1xIVF4dASEHoSMqTI7lluUu8NU92nhImuS417cLyVFasX2YQMzUic
	 YntmikDx2twsr+L8tnb+7HTCbaB7d+IyjtvEVFtEcF6jzuXO6Z7dbfvynPPfAWDWOf
	 kCHS3DX+UD7q5dyC6Rg5pK+O42N3h0IZjjuXJ14StHMBGdmHHRMCpOut2u9e5+BZOd
	 refk7J2V+p1cayr1hOWGseGVZOtr3QHuGI4MTnCgwfk0N/nuNcgAfJfQ4llGrtREjC
	 ROgVzbuJzoNTw==
Date: Fri, 7 Mar 2025 15:55:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-usb@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, iommu@lists.linux.dev,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 01/11] dt-bindings: iommu: qcom,iommu: Add optional TBU
 clock
Message-ID: <174138454322.672545.5612308446106419533.robh@kernel.org>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-1-0c84aceb0ef9@oss.qualcomm.com>


On Thu, 06 Mar 2025 19:11:13 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some MMU instances feature a Translation Buffer Unit (TBU), which comes
> with its own clock. Allow describing it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



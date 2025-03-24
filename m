Return-Path: <linux-arm-msm+bounces-52366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C886CA6E00B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222A7188A1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11496263F20;
	Mon, 24 Mar 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY0OUjop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D81263C6F;
	Mon, 24 Mar 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834509; cv=none; b=RUvHq2GC/XBykHDxIjiYH/FVZsicLTQVunVHuOTNZKnLlxPN+58TS1MEGh6QyDsyZ1ZIu8PhhVuh1A2288hSdR1RApVPSPhkhL9SVRvU/9US4rJ+Nvw0EnyzIYvCiMpVh8bsqz+W5phXlPHjOHBN4rOwNQHb2XRG6vmAnGn6EwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834509; c=relaxed/simple;
	bh=i1oZRhxNkp0+F1NACmxVCrAFAs0vLQTwjr++seaZLcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZblTSMhJ4aRu40GbUGUxOkSF+3LxQa81cNARsAGo/64FoEUClia8qZLgv1mtPtX5jeHuwS+o7PQjCo0QYCMMI2eKNmj/hGTVqBglzrbN+EYhIKLtffVHOGHIcCXd5idnsCZbRavnMs54Ab3mIwXtAo5won8z87nFx9juW6HR4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY0OUjop; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F484C4CEDD;
	Mon, 24 Mar 2025 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742834508;
	bh=i1oZRhxNkp0+F1NACmxVCrAFAs0vLQTwjr++seaZLcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NY0OUjop/oNUj57AXOw2Yp4PQ3IuDX9ZrOalirj9AWqcD6YPqMZF1nm2GF5Z/1iHJ
	 xs5Q2+kfKaF/+XDX/N4auvTU7a9RP6QL6Cu8eYRNnJ2ATU07ELJc3JrnrglrRgMdDr
	 9kbJvDJvz+hhdy+KPOCiEivCaUjjpq+gUGh+4HTBrCe49MkfkBqdEW/HsInGNGObS6
	 wimxclZCd40RpnSaeULD+6Mf+OBGRwt8NitMUl/Se38rQ3avsXm7LiDQPt1xcV82Qx
	 s9O4t594lJmnfqy+Wp/4oiEzXst3xRvNsUdRLoMrgUV391QcD2JPsAC0SowNHu82jP
	 r/fZy5CeioVmQ==
Date: Mon, 24 Mar 2025 11:41:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com
Subject: Re: [PATCH 2/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Message-ID: <20250324164146.GB304502-robh@kernel.org>
References: <20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com>
 <20250322-perst-v1-2-e5e4da74a204@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322-perst-v1-2-e5e4da74a204@oss.qualcomm.com>

On Sat, Mar 22, 2025 at 08:30:44AM +0530, Krishna Chaitanya Chundru wrote:
> Move phy, perst, to root port from the controller node.
> 
> Rename perst-gpios to reset-gpios to align with the expected naming
> convention of pci-bus-common.yaml.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts   | 5 ++++-

This dtb won't work with existing kernels without the driver change.

>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 5 ++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           | 7 +++----
>  4 files changed, 15 insertions(+), 7 deletions(-)


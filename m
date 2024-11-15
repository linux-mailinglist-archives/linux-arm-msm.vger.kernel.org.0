Return-Path: <linux-arm-msm+bounces-38066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D809CF36C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 18:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8853E28B862
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 17:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A721D79A9;
	Fri, 15 Nov 2024 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1eCqObl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D761D6DB1;
	Fri, 15 Nov 2024 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731693417; cv=none; b=VZLwnyol5wG8sihcHLBvFIABFz7thzYldPW+umOSsofkmbeTyxX03hTEzrSbUTDLoz6F2jd0FbKmFAD1ciW3/3EQVMXOpD8fx5o1oVDqyLnCVkVgRjXam+py20Fzz8l5c78ZyMZL6yr7xMrHFWiAK4C3x6lp4inOuyFs31p89n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731693417; c=relaxed/simple;
	bh=dthHWDqjHt3SDq3sMo1fmc57I9OJQ9v4FyjjuiizZDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0EY+lZ+thyu++3yWovpSu/SLr7yZAGw0GjA8LgiaDAB0TOdh+w9syU/6d/9qR5HtRyDCKOxWx31rAZtSTUqeQ5pz4XRWrq0oTbnnQUVvmrhTbRKnxRsiVeqQvUq08Jwrxz2DNefr7ofkCvS5l67nCZDEKIT01s0A4eyuZ+pXu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1eCqObl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D3EC4CED0;
	Fri, 15 Nov 2024 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731693416;
	bh=dthHWDqjHt3SDq3sMo1fmc57I9OJQ9v4FyjjuiizZDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1eCqOblAG6U6/4EUIuMx4jmJBouCncFeOE4jF2rGq5rUOfsF1lyE2zbKbD/yL6DN
	 93ckvLhUro3Pt2b/rtYXsDYFmYjBDQVWNoMqoOrWQ150HIMlOdV2ky+kwJQr8Fpx6Y
	 HT+++6Gr4F6VfHzBkUT9p82G9hAq3gmoSxXACAExNorpP07dmTO+b0opYklajDk9eg
	 HV4vmSX7wcu2Cz0SvDa2GAJT1M1cp6RupArRGyogHyJtwKAbLr6heapUfmH8x/G7pQ
	 gjsmg1vGewqqdybFlO/RqCMCCBFSprKcR/iAfHVEeALr7KTIhmOWgStklNd7nAP0Ei
	 yKVPNM1dbtbNQ==
Date: Fri, 15 Nov 2024 11:56:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: konradybcio@kernel.org, linux-phy@lists.infradead.org,
	andersson@kernel.org, kw@linux.com, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	quic_shashim@quicinc.com, kishon@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, quic_qianyu@quicinc.com,
	quic_kaushalk@quicinc.com, quic_aiquny@quicinc.com,
	quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
	bhelgaas@google.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
	vkoul@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: PCI: qcom,pcie-sa8775p: document qcs8300
Message-ID: <173169341435.3465850.13199039748236732939.robh@kernel.org>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-4-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114095409.2682558-4-quic_ziyuzhan@quicinc.com>


On Thu, 14 Nov 2024 17:54:07 +0800, Ziyue Zhang wrote:
> Add compatible for qcs8300 platform.
> 
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



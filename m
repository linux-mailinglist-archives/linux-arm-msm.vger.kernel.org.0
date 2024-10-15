Return-Path: <linux-arm-msm+bounces-34390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C499DE26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588E22851D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 06:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB677189B8C;
	Tue, 15 Oct 2024 06:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdYWXV2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A37C185936;
	Tue, 15 Oct 2024 06:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973376; cv=none; b=hP2dayUNzK1rgxMnFrNxf0e55JNriJiJB1NM8VmYVpIWrAAX5vl+Q548RSbC6KBwF0cfUf1boAxQrgHbq8CrM8XOzJvW04nHc1+ry2tPHDUsUvUZjs9cP3Grgj+G25MQ58wShTEjRNZ033LFNIp76kKWa9IT/Xq/2b+9A/CAip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973376; c=relaxed/simple;
	bh=V9KJcARXDedlgSnmljYjhAlMHx38oslz1LVgv0iCuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufPToSJaawB/5ydt4xIZOUNS6x8LReTBIF8XCHuxJOLAHvxMuTT/TgZcOEDDopOCIZIdf0iKPQ5G+iFPe7LLQZD/kWe2L/NYxas1qBNFDdaoRSh2CitPgYzSs/5JseNnTs86xF4HaUxNwKYiX8AvHcYs5opgfJ4gxN6CnmiLG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdYWXV2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEDDC4CECD;
	Tue, 15 Oct 2024 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728973376;
	bh=V9KJcARXDedlgSnmljYjhAlMHx38oslz1LVgv0iCuZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdYWXV2RaZCVrgCnKfaKvl5kTEvgrchehunbdh0S0wmJgMCRIqoPqbIl4upbWyy6D
	 JP1M3EBOD/UY1CEe2GojGrBhJL440d+1IU1P/RDCfvH3ojTcuPh4U5MWqcfm49ZKq4
	 p7n2U0vKIG+N8YVA7EKStTcOp7mCXP4I5M0N1kTLzw/BErWxUYMBmJ32EzD8GktC6r
	 bglN8sE1bxWkFJIb6lfkt4Qqo2cPqOPekAFQuwuKWkaJvW95JlJ2WIw504NlI7lMYM
	 CDnS/k4vUgaHG5hgQ3Sqz2H2NOspWywlYPw6rGATt6WzFVHI5/36+8c9ITrGw5nNOl
	 ojKZqCsTmfe2w==
Date: Tue, 15 Oct 2024 08:22:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH 3/5] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for QCS615
Message-ID: <6mma3sulerihegjsmkje574f6gkg5qdduq5b52nttpeevdcj5v@ri2q2hstfyr5>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
 <20241014084432.3310114-4-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014084432.3310114-4-quic_kriskura@quicinc.com>

On Mon, Oct 14, 2024 at 02:14:30PM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add QCS615 to QMP Phy list.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



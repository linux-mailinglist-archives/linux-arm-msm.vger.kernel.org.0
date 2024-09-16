Return-Path: <linux-arm-msm+bounces-31834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB097A490
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9891F21C69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD632158540;
	Mon, 16 Sep 2024 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP7U6+lD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DAD157E6B;
	Mon, 16 Sep 2024 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498452; cv=none; b=jemdJ/pnt5YTk7ybS7pnADX8YuiKvAqUyadvGeXgrFPHECZvjd7TyzUw0f7k3JpHcbqyNqk9wUITdDG4Zknhx8WxF715DaUy+TVeHfZdBef8AgXa+Ud6KNRdPlgPg7OSWGHQ3aPObj/kKwJ+TdshzrB4b8ZlfQpwujSBB2wLgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498452; c=relaxed/simple;
	bh=HMYbgkArDy29HIXZ+7m+CKgQUVmnpVYfF4k5JWhAzWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYFNaLmsDvzqTpOX6nTyfgP1BaUWa8Y+FB573epi5/gxHB59D4J7MPTsarI5tzWBxt66MKJSnIq/U4CbRJMGrP3ZGE8+UXRsED/8ZDgdDC2KXYAgDpo5D85zvwD5akAWhIZtfMMOabRgNL3HVbwTSh8K6sKM9tI559m8qiVLpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP7U6+lD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66724C4CEC4;
	Mon, 16 Sep 2024 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498452;
	bh=HMYbgkArDy29HIXZ+7m+CKgQUVmnpVYfF4k5JWhAzWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AP7U6+lDCCNBVUpg79fGPQR+T3KOPn6bjtC0LTeFsPaBYw90OkoyB3cL7GRGiVdCW
	 3F9cH6iKR20f9dxw8EeU4MUss67jUcX/4N7Vb4Phx9JjzGexVGfxWul6YNts6OwDvd
	 fYPjpk13FV+sQfg+MpYV6jAPJ4CJtHzt/zi9U+Gjw4du/Bjih40lS+l5m1ICNXuDTP
	 +ZOtBJjciOGTDHQleQuDWsYJw8AfxyqyAtpyXwZkd98NpUZNLqFOmOfCTwJG/wtMSA
	 AsQci9UKo1dFK53dkYVTCWbpclWvvIJnhzyWFIvcU6vgThFNIPC25itqdP2s/m47qE
	 s7i9gAau/zBVw==
Date: Mon, 16 Sep 2024 16:54:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: ufs: qcom: Document the QCS8300 UFS
 Controller
Message-ID: <q6koo6lgcssixodimowgnyzyleigs6gcvx762jumln2b3ewpap@zjzhp7fwr3ht>
References: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_ufs_binding-v2-1-68bb66d48730@quicinc.com>

On Wed, Sep 11, 2024 at 03:06:36PM +0800, Jingyi Wang wrote:
> From: Xin Liu <quic_liuxin@quicinc.com>
> 
> Document the Universal Flash Storage(UFS) Controller on the Qualcomm
> QCS8300 Platform.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof



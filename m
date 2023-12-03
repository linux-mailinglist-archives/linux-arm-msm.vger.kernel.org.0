Return-Path: <linux-arm-msm+bounces-3079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61006802097
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3167280F88
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC03BA55;
	Sun,  3 Dec 2023 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttHCk4BM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C27F5;
	Sun,  3 Dec 2023 04:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0414C433C7;
	Sun,  3 Dec 2023 04:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701576359;
	bh=Sb12NKNzKiav+jhQefJAJ2Uqyi4PD3GBfm4v+Jz7tuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttHCk4BMXGN5JaDPzXmzd/FxEWDj8BieAXsEcaW4u+TkzJJjHxJ/A52/MENRP4Dem
	 mQwoKEdc4BGiAeQ2OSFc3yxxP0P9yilcpKNhHC+qQ8aqV4JZlfb3JkZwn5vHBQmrT6
	 ZnxFwo/mPllkY/ErqrYmUEnc31NjYp+ZfBNplxejMRjBhXuFtOsoB9RoxrBU1wd2l5
	 TfZ6dt8MMSrHV+sRHLl3udTLkz4QY7A+8c60MZHmDLltUMQGND7fT9cng2bL6gZz9c
	 4SOvwS6vIi1rftm55YBYTwqqtUnniRY6faF0++8ImYFUC3TZrHigKLOE555Owsm5Il
	 rbt3PSafIVGdQ==
Date: Sat, 2 Dec 2023 20:09:24 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8550: Add GPU nodes
Message-ID: <y23kmalezyvwcd42jacpoksl7vh2p77e2we3jlbsfiszojmodd@uxlpmdyi3cuq>
References: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
 <20231127-topic-a7xx_dt-v1-3-a228b8122ebf@linaro.org>
 <6504d0d8-3087-4990-a8f3-1517eb68707b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6504d0d8-3087-4990-a8f3-1517eb68707b@linaro.org>

On Mon, Nov 27, 2023 at 05:21:30PM +0100, Konrad Dybcio wrote:
> On 27.11.2023 17:20, Konrad Dybcio wrote:
> > Add the required nodes to support the A740 GPU.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 166 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 166 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > index 7bafb3d88d69..8f6641c58b3b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -2841,6 +2841,172 @@ dispcc: clock-controller@af00000 {
> >  			#power-domain-cells = <1>;
> >  		};
> >  
> > +		gpu: gpu@3d00000 {
> > +			compatible = "qcom,adreno-740.1", "qcom,adreno";
> The milisecond I pressed "send" I realized this is not the correct revision
> of this patch.. The compatible needs to change.
> 

I could have corrected it while applying the patch if you only included
the revision here...

Looking forward to v2.

Regards,
Bjorn


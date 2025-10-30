Return-Path: <linux-arm-msm+bounces-79754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2BC21CF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9E01A240D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7504D36CA89;
	Thu, 30 Oct 2025 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnnaRgLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4871A1F37DA;
	Thu, 30 Oct 2025 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761849764; cv=none; b=cbJ/i+Y1CxVu01YTsicgIm3l2Tz/cs5NAG99t7qR83sfF5UpEhcO2ouhienRCeQ9kSYfNfPW9PUdl4o2P36G1Tw0GP+eaLTnzeEmUQUISuHLq+9e4AQAVZ1lzy0/DTxj+5EoOGaRumkVB9T+axa3j8wNt2Sabpw7kQ0nsnuWW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761849764; c=relaxed/simple;
	bh=g8c9ksy/OAeO6urz6065KVI1tuzfZbmQ1YkPXetQw7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV3MwVqZl+l63les1SKs5sTDD380/GdkrX+HerT0ebE6IAYD1xXSDpIYmJ3f7ctURf3Rc3hX/rdJAdl7WBQ781PZa3DoU+UbdP61xucm2Nkje3N3Q+PlVo/AUIFsGdyMA03kzxFdR9l3kML6wjec0b9fNKycqYCpgKcA15h8ofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnnaRgLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDECBC4CEF8;
	Thu, 30 Oct 2025 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849763;
	bh=g8c9ksy/OAeO6urz6065KVI1tuzfZbmQ1YkPXetQw7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnnaRgLM0XBnXnd18GqV1BfHkH11uAYX/cBUbs8FC0a6mIEw4Dj4WV6L6Sg1DVHN2
	 C7VYVl+yOARGHQTQPIG9CVvSPKPNGVPOyth5X16s368FKWE3oTmCANyql1kjEcVHOL
	 ObvFZK20B8kIOyv8i05fFVZcAazeT4p4FdlHA3pKjJjkw0d9Aih+fyhg2nPBfKeO59
	 byT8VE+hZ3k6a37bXmRM4kTRycaQxjzLLYlSro9XchPRTtdVotPEQnSt9JjxXfKziN
	 bH4Dx8SOYB/tiXAehHYn6NOXDRRwRRBV0F8LuB/q5h2+2N0koAhHK9jGSJ5QLALVtS
	 zFS76UvBhZmLg==
Date: Thu, 30 Oct 2025 13:45:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
Message-ID: <fuach44wl236rfm57itxmcvj376vr3m7idi4byge6mbbxcrr3h@4uzjnuefh2y5>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
 <c90b917e-b3bc-42fb-a127-ab47d5154d0d@oss.qualcomm.com>
 <c62a7f9d-6984-41c0-88c5-1d6c40d411dd@oss.qualcomm.com>
 <weyze7a2pqmt2klt763lbwyvpezqndm5rjnitexalru7hy3xhh@tdqx6xeqp3qu>
 <p5apfg5cbwcdmilfr3omoncvuj7z7zbj6dkex2eicjdubkyxwj@h42bzzhx4amt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p5apfg5cbwcdmilfr3omoncvuj7z7zbj6dkex2eicjdubkyxwj@h42bzzhx4amt>

On Thu, Oct 30, 2025 at 07:58:46PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 30, 2025 at 12:28:31PM -0500, Bjorn Andersson wrote:
> > On Thu, Oct 30, 2025 at 11:59:00AM +0100, Konrad Dybcio wrote:
> > > On 10/30/25 11:58 AM, Konrad Dybcio wrote:
> > > > On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> > > >> In order to reduce duplication, move common GPU memory configuration
> > > >> from individual board files to sc8180x.dtsi.
> > > >>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >> ---
> > > > 
> > > > [...]
> > > > 
> > > >> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > > >> index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
> > > >> --- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > > >> +++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
> > > >> @@ -14,6 +14,8 @@
> > > >>  #include "sc8180x.dtsi"
> > > >>  #include "sc8180x-pmics.dtsi"
> > > >>  
> > > >> +/delete-node/ &gpu_mem;
> > 
> > I agree with your hmm, seems this line should be dropped(?)
> > 
> > Dmitry, please confirm and I can fix it up as I'm applying the series.
> 
> Oh, and this line is necessary, because sc8180x-primus has its own
> location for the gpu_mem.
> 

Hmm, you're right, not sure why the memory map differs... But this looks
good then.

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry


Return-Path: <linux-arm-msm+bounces-80488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E860C37D23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 22:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5893B3EDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 21:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB83345CCD;
	Wed,  5 Nov 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4BjCydZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA1126C02;
	Wed,  5 Nov 2025 21:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762376559; cv=none; b=J1d3dM73+v1/RfnwW4CdOldNLIb2E2ebhpIfkFh0yJO/OmYJ4maWvqxa2ZOyU4yjOaB7qvc6WlveFUwo4498SdhhTg4bAsXFVDwLgSj+H6ue4p/77DrSobSf0emmitsA5UzbwelXiKI5plHqm9M22oCnyKG3BHnmdr6ldvQ+7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762376559; c=relaxed/simple;
	bh=PHTEON9TcQhnC9OleIc8NvCsR/EC26hDv4zm9fkb9jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1uSnTwqQM/2QgcGyHdcIsY7vSUt+en33rk56zaKhxJ1LwPhTU41zgbnXX2IFLkcyrLgHmESku6qqq+0nKZDzkZrqIEuyG4nwGMx3RVwqB/toZU0aJ0hgIsJGV9QwfQxvG2cAb1e/kTIih3LrMFRCaA4YKKaiq2r0Uv/1aq1u3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4BjCydZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4E5C4CEF5;
	Wed,  5 Nov 2025 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376559;
	bh=PHTEON9TcQhnC9OleIc8NvCsR/EC26hDv4zm9fkb9jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4BjCydZhpH5JjUBb0lzOk2L4z6UX/9gVRodjb+PoJptbilhFbXfEfJzK4S9xmAR3
	 Lfd4KJJDt2xxAtVuk/7Jkl8uv40hIh9WZQAN/RBcs2ugLPpQPSTuV4b/lRNgGy3yqJ
	 Cuo8L+DxcbaIrW9hMqr+GW3CDj62zVvix0jPD4i3jgopgbzH63PCxGwpC0qQM0TNp1
	 +z0mXqdvo0vC6CJaNr4W5HOMTNAcEYGJifNb1V2p8qNEZagHDsGHRA1oL+3T5hFnAH
	 wFIiW3Izi7e1xYcVH88+O0bnLgki3Ork1cG0oEWqsH48/Z5qXj7PfcgtBfmTmnEy5/
	 psypcDZoQ6KtQ==
Date: Wed, 5 Nov 2025 15:06:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
Message-ID: <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
> 
> 
> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
> > On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
> >> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
> >>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
> >>> control and status functions for their peripherals.
> >>>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>> index 14ae3f00ef7e..ae55b0a70766 100644
> >>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>> @@ -48,6 +48,7 @@ properties:
> >>>            - qcom,tcsr-ipq8064
> >>>            - qcom,tcsr-ipq8074
> >>>            - qcom,tcsr-ipq9574
> >>> +          - qcom,tcsr-kaanapali
> >>
> >> It looks good to me. Glymur didn't have this functionality verified yet.
> > 
> > You spelled Reviewed-by: Aiqun Yu <..> wrong.
> > 
> >> Remind for review.
> > 
> > No need for that, reviewers will review when they have time.
> > 
> >>
> 
> Hi Bjorn,
> 
> > 
> > But that said, most modern additions to this binding follow the common
> > format of qcom,<soc>-<block>.
> > 
> > So I would prefer this to be qcom,kaanapali-tcsr.
> > 
> > Regards,
> > Bjorn
> > 
> 
> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> 

So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
qcom,tcsr-kaanapali is the non-clock controller region of TCSR?

Sorry for not understanding that earlier, but this doesn't work for me.

It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
but it's always an nice chunk of 256K in the beginning (or end in some
cases?) of TCSR. But for the rest, there should be a single tcsr node in
DeviceTree and that one node should be a syscon and a clock controller.

Regards,
Bjorn

> Thanks,
> Jingyi
> 
> >>>            - qcom,tcsr-mdm9615
> >>>            - qcom,tcsr-msm8226
> >>>            - qcom,tcsr-msm8660
> >>>
> >>> ---
> >>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> >>> change-id: 20250917-knp-mfd-4dd3c81e6b9b
> >>>
> >>> Best regards,
> >>
> >>
> >> -- 
> >> Thx and BRs,
> >> Aiqun(Maria) Yu
> 


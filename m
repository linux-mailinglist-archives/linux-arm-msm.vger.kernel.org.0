Return-Path: <linux-arm-msm+bounces-79493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9BC1BF76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C96625C2CF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAADA330D51;
	Wed, 29 Oct 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hE/jr6Um"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFED32A3C5;
	Wed, 29 Oct 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752074; cv=none; b=fcYhKOPkNF1e5vrj36G7sYx2axwN0hRhLNljUcgj9tUhPgHGmeM/+rtYjcwlVlfg9vKNgLHtla/B+cQmIVI4cNWU5340poZabeUnHBdeB+3a3thqsXdk9udP0arsbRX0/WyXzXhQ3Jtx19cXIxzH5lymnkBJtfd2NG3s2onogPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752074; c=relaxed/simple;
	bh=oNcXp8gdfxVeszlYk66nASq1kzOb0Ssu6NZIeyKk7zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljfky/Arb7KBTfQbDs8dO6yBgaI6Y7I17Q+2sa+6+00Z8R7pHB4BqFCZTcPQA19oZ/0pHA1eT4IzdARH4nTNb+eDB2NhRz+5RoxP74QYsR2NnXn+8hoWkhRCQZG75fwBa/ffPDzYp6fWU9cxLTueIisBVcRreWNNpKFdGc/7/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hE/jr6Um; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154B1C4CEF7;
	Wed, 29 Oct 2025 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761752074;
	bh=oNcXp8gdfxVeszlYk66nASq1kzOb0Ssu6NZIeyKk7zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hE/jr6UmoeEWC6iPIljNx/9tlBFwlDtK48q/Jzn8vf7lr4GVm5v62CyUQrnE3ZQv3
	 g3jjloFRmehvz3VXskd2AxiBpogBbLTG3wviLJ/90FA7DWIdKcSfmjcdmmaexUEv9F
	 AWVltj9y7vM2w5HYXEi60R4juEoDl0KvjCGN8YKeZA0iJDeK6B8pN+s0dGyuaAjiB3
	 1FpxCZmmVYezVi8j6nxnZ6ma/iKyK9vcCqoSCINgTCPMmMoNtyHAij9Zf2tmoAQaXC
	 Aau0ViRLO/oOzlwaFv6deAg78MsFiqCFw8CFJvKE0YIvZ+HeuifyLYS8E6NPqci0+a
	 UgNbvk1THbf2g==
Date: Wed, 29 Oct 2025 10:37:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <x4rzktpij4ggnbvnuyoli65gugymli5acrmrlovglttpakaauw@o3vu23bjedul>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
 <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
 <mwin3lfvpcwxxhsub2whcpibuayk36f4ljrodvithfygqad5w4@cg4h6peh4v4a>
 <ygqgzflpavwgd43e5zedgcijm3lz27nqlzprttalgcroedz45u@ztqkppajpyry>
 <a7cdd2b3-6097-4a8c-a639-af974292cc8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7cdd2b3-6097-4a8c-a639-af974292cc8b@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 07:47:11PM +0800, Aiqun(Maria) Yu wrote:
> On 10/28/2025 2:44 AM, Bjorn Andersson wrote:
> > On Thu, Oct 23, 2025 at 03:06:00AM +0300, Dmitry Baryshkov wrote:
> >> On Wed, Oct 22, 2025 at 05:42:58PM -0500, Bjorn Andersson wrote:
> >>> On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
> >>>> On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
> >>>>>
> >>>>>
> >>>>> On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
> >>>>>> On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
> >>>>>>> Document qcom,kaanapali-imem compatible.
> >>>>>>>
> >>>>>>> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> >>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
> >>>>>>>  1 file changed, 1 insertion(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> >>>>>>> index 6a627c57ae2f..1e29a8ff287f 100644
> >>>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> >>>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> >>>>>>> @@ -19,6 +19,7 @@ properties:
> >>>>>>>        - enum:
> >>>>>>>            - qcom,apq8064-imem
> >>>>>>>            - qcom,ipq5424-imem
> >>>>>>> +          - qcom,kaanapali-imem
> >>>>>>
> >>>>>> Can you use mmio-sram instead?
> >>>>>>
> >>>>>
> >>>>> Here is the node: 
> >>>>>
> >>>>> 		sram@14680000 {
> >>>>> 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
> >>>>> 			reg = <0x0 0x14680000 0x0 0x1000>;
> >>>>> 			ranges = <0 0 0x14680000 0x1000>;
> >>>>>
> >>>>> 			#address-cells = <1>;
> >>>>> 			#size-cells = <1>;
> >>>>>
> >>>>> 			pil-reloc@94c {
> >>>>> 				compatible = "qcom,pil-reloc-info";
> >>>>> 				reg = <0x94c 0xc8>;
> >>>>> 			};
> >>>>> 		};
> >>>>>
> >>>>> other qualcomm are also using imem, could you please give more details on why
> >>>>> we should use mmio-sram here?
> >>>>
> >>>> https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
> >>>>
> >>>
> >>> I considered exactly this when I wrote the binding back then...
> >>>
> >>> But the binding defines mmio-sram as "Simple IO memory regions to be
> >>> managed by the genalloc API." and the Linux sram driver follows that and
> >>> registers a gen_pool across the sram memory region.
> >>>
> >>> I believe IMEM is SRAM (it's at least not registers), but its memory
> >>> layout is fixed, so it's not a pool in any form.
> >>>
> >>>
> >>> What Krzysztof says makes sense, but rather than just throwing a yak at
> >>> Jingyi, it would be nice if you provided some guidance on how you would
> >>> like to see this turn out.
> >>
> >> I tested, pretty same approach seems to work:
> >>
> > 
> > Now you're shaving at random ;)
> > 
> >> 	sram@14680000 {
> >> 		compatible = "mmio-sram";
> > 
> > You can put "pil-reloc-sram" wherever, because it will perform a
> > of_find_compatible_node() to dig up some node with the compatible
> > "qcom,pil-reloc-info" .
> > 
> > In other words, this line created a genpool for something that really
> > isn't a genpool, but luckily that didn't have any side effects.
> > 
> > 
> > There are however other users of IMEM, such as the "reboot-mode", which
> > relies on the "sram" device probing child devices, and is implemented by
> > "syscon-reboot-mode".
> > 
> > Perhaps the solution is to not support any new users of that?
> > 
> > 
> > But no matter what, the definition "Simple IO memory regions to be
> > managed by the genalloc API" will never be true for IMEM.
> > 
> > And as this isn't a syscon, simple-mfd, or mmio-sram...how about making
> > the fallback "qcom,imem" (in this same binding) and omitting any
> > implementation until we need one)?
> 
> 
> Totally agree. We can remove the "syscon" and "simple-mfd" compatibles
> for Kaanapali.
> For Kaanapali, the reboot reason does not rely on imem at all—it uses
> nvmem cells instead.
> Previously, the syscon-reboot-mode required "syscon" and "simple-mfd"
> compatibles for older targets like APQ8064, which used imem as the
> reboot mode solution.
> 

And there's
https://lore.kernel.org/lkml/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/
which Konrad pointed out, which would also work with this model
(qcom,imem fallback but no implementation).


This also does leave the door open for a future qcom,imem
implementation, if we need to associate some logic to the imem device
itself.

Regards,
Bjorn

> 
> > 
> > Regards,
> > Bjorn
> > 
> >> 		reg = <0x0 0x14680000 0x0 0x1000>;
> >> 		ranges = <0 0 0x14680000 0x1000>;
> >>
> >> 		#address-cells = <1>;
> >> 		#size-cells = <1>;
> >>
> >> 		pil-reloc-sram@94c {
> >> 			compatible = "qcom,pil-reloc-info";
> >> 			reg = <0x94c 0xc8>;
> >> 		};
> >> 	};
> >>
> >>
> >> -- 
> >> With best wishes
> >> Dmitry
> 
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu


Return-Path: <linux-arm-msm+bounces-78420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAABBFE712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D21854EC94E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C471289376;
	Wed, 22 Oct 2025 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Azuk2DQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF2A26F443;
	Wed, 22 Oct 2025 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761172836; cv=none; b=M3AlwqqxbXzKdJfyJ8NduUybue/MtZGifmScHs2iyzB9aeqg5Tbied0t9u3WN6pJ1L5rg3i0qptPaJlCssLymcvNFY0VGf+e0RTxMYF3wLKe3PbEwic4qYIN8ScllrZbCUFfcQ/Z8wu2WimwTpmBqP7WuVdmdLMtIY+V2TX0rAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761172836; c=relaxed/simple;
	bh=ogv9R7dm0HyxwlHvdDMXjpFtyl4pUEB/JTx9TXj9lz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLovj4P3DFxCCho1lBebjqXY5xVdNFUKluLVPvBTcfFut32TekNe658kFfuo1oOV+24yrxFt7Db45rVRH9mzypcp5uf2aLZKZQtpw2rH1h215t0tAD1CAIL/az52KscRaH6zNqoFZb9DUNxyE9ASLLxqz/TFki/ZiP1aGSFzaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Azuk2DQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476B0C4CEE7;
	Wed, 22 Oct 2025 22:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761172836;
	bh=ogv9R7dm0HyxwlHvdDMXjpFtyl4pUEB/JTx9TXj9lz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Azuk2DQ5oaF97WGm4cOGJWZfquMDVeBZFW2ZgV7bvyizpGaJ+uiKKWgOmKGfKUAcE
	 /OZ7PeJis0RGww2EME8ELhYYCATOrZRGKXQTloQystDFWEOwCIFwaoTQSP4yiPR9MY
	 XDAww82qmCJgQcKMKd7Aa4orCwrMw6mP+65Rxo3sFMZZ7lXg5zYUv7qtWH4BUQbH4n
	 OUvieY3BWddGARHwtJYJm58d4Oi/b/8SPnZREzJGNDntFPM0Kj4CALCmfo5BX91BoB
	 hzfTo20f9bdRglkGi89JiBtr9p9W+Wp7OhjxBLfsG9SHXjNct1MSPo8R+tIdeph1gC
	 qjngBeyIZRDuw==
Date: Wed, 22 Oct 2025 17:42:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>

On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
> > 
> > 
> > On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
> > > On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
> > >> Document qcom,kaanapali-imem compatible.
> > >>
> > >> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > >> index 6a627c57ae2f..1e29a8ff287f 100644
> > >> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > >> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > >> @@ -19,6 +19,7 @@ properties:
> > >>        - enum:
> > >>            - qcom,apq8064-imem
> > >>            - qcom,ipq5424-imem
> > >> +          - qcom,kaanapali-imem
> > > 
> > > Can you use mmio-sram instead?
> > > 
> > 
> > Here is the node: 
> > 
> > 		sram@14680000 {
> > 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
> > 			reg = <0x0 0x14680000 0x0 0x1000>;
> > 			ranges = <0 0 0x14680000 0x1000>;
> > 
> > 			#address-cells = <1>;
> > 			#size-cells = <1>;
> > 
> > 			pil-reloc@94c {
> > 				compatible = "qcom,pil-reloc-info";
> > 				reg = <0x94c 0xc8>;
> > 			};
> > 		};
> > 
> > other qualcomm are also using imem, could you please give more details on why
> > we should use mmio-sram here?
> 
> https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
> 

I considered exactly this when I wrote the binding back then...

But the binding defines mmio-sram as "Simple IO memory regions to be
managed by the genalloc API." and the Linux sram driver follows that and
registers a gen_pool across the sram memory region.

I believe IMEM is SRAM (it's at least not registers), but its memory
layout is fixed, so it's not a pool in any form.


What Krzysztof says makes sense, but rather than just throwing a yak at
Jingyi, it would be nice if you provided some guidance on how you would
like to see this turn out.

Regards,
Bjorn

> > 
> > Thanks,
> > Jingyi
> > 
> > >>            - qcom,msm8226-imem
> > >>            - qcom,msm8974-imem
> > >>            - qcom,msm8976-imem
> > >>
> > >> -- 
> > >> 2.25.1
> > >>
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry


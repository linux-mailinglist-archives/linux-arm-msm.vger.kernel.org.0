Return-Path: <linux-arm-msm+bounces-86367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7ACD9D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 16:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3DC330194C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A552512DE;
	Tue, 23 Dec 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiSG+bv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4C237163;
	Tue, 23 Dec 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504921; cv=none; b=qRPPA0eCvTgd+vl/x0JyTdpS2M5gFHxkle/Sl/UJGzeLvO1v0xV2KnZTodSRR3H0rd9ZitA0rOdbII6pZLidYVa99rxTm/oftIWrBHD/sAYKETgx9MWcDg3mbK4JbEemk1lb3sHQoplL8AP17Cd/5W4IQpndwyU8EO1aLmBesMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504921; c=relaxed/simple;
	bh=PfrdJjYesmSwYkHNAziVHb+UM+TYIC/Of5TWQUotgXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpnwM3KY1AHXsKgwZDRAWuo1E1THBpD43wW6yPwFK8pwTypUNM5Kz0NCUC9sk+JiadfJ/cx799tOu5dAJTCYgrRjYw9jlfhBVk2HAK/r0qgA+vNKjQsoIyjSl9ui+fEgWwrEl/7t2PQUops/1d8UZRTBFvg7K2nqPtYnV8qfpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiSG+bv1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DFBC113D0;
	Tue, 23 Dec 2025 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766504921;
	bh=PfrdJjYesmSwYkHNAziVHb+UM+TYIC/Of5TWQUotgXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GiSG+bv1Yauo0XY/SVwC94sWXGAB0e13EahM6WsVRmvarK4JsQJTA9WyyYUjdKzDa
	 CbReXXUsz1ZJbIz2erQZzaDlRO6vUes+66iIwRhtt4pUG2OfYm5+dArQB8eA5g4npH
	 kYp6HYZpgDLGWulLPLpOay4DmKqCpDbOWO09TkQJoFnz9uKCqqmwRHHn6A9/Sc6Ixf
	 8Usu6038NjQirmGSO++oXNb7M0iq8IXXcHETEUhuQ5WoUSRqnp6RlAoN4T9v03eHbU
	 FpDXeINOYJrxIAubQqf4aXDPjlEDFwTZn0rIwJe8aVm44GSgprNv1fB0nvWRNZnd0J
	 cTqcxFlYJd9ZQ==
Date: Tue, 23 Dec 2025 21:18:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
Message-ID: <aUq51TxXwiJE2DWb@vaman>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
 <aUqjG4pVXWN3H88N@vaman>
 <bb775051-8635-4e2d-a1f9-46d6f0e6bc15@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb775051-8635-4e2d-a1f9-46d6f0e6bc15@kernel.org>

On 23-12-25, 15:16, Krzysztof Kozlowski wrote:
> On 23/12/2025 15:11, Vinod Koul wrote:
> > On 19-12-25, 23:01, Krishna Kurapati wrote:
> >> Add squelch detect parameter update for synopsys eusb2 repeater. The
> >> values (indicated in basis-points) depict a percentage change with
> >> respect to the nominal value.
> >>
> >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> >> index 5bf0d6c9c025..f2afcf0e986a 100644
> >> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> >> @@ -59,6 +59,14 @@ properties:
> >>      minimum: 0
> >>      maximum: 7
> >>  
> >> +  qcom,squelch-detector-bp:
> >> +    description:
> >> +      This adjusts the voltage level for the threshold used to detect valid
> >> +      high-speed data.
> >> +    minimum: -6000
> > 
> > 6000Volts, mV, can you please document the units?
> 
> 
> Code is correct, the '-bp' is the unit here. Unless the suffix was
> chosen incorrectly?

I was hoping it will be commented in the description here.
For my reference, what is bp and where is it documented ?

> 
> 
> Best regards,
> Krzysztof

-- 
~Vinod


Return-Path: <linux-arm-msm+bounces-86474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607DCDB62C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0054301765B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 05:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42332E540C;
	Wed, 24 Dec 2025 05:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqfPidJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41152D7DEC;
	Wed, 24 Dec 2025 05:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766554135; cv=none; b=JKIJm276m0ENNqeZJkPzK4EzFhNYoE0f0v0aHYncQEMPGC9Bu7RviLfqH4QT/aDRCwaUEr6vWxAOZkdZYLZKcDXybpKk8QvEXabbVnbEeSERO51u7IZmIY1THAQ9h3ezhz8kR49lC2E5gVTzRkSD2mAVKM8xebC7aUOz9Pomc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766554135; c=relaxed/simple;
	bh=C/GnFv5Pg+zL30Vai7m1dAM/fuNNOsDmUVTl2nzGmnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdNUikdeRzedwGcpghAefLQPIyKhQcuXf1dMD5W+XTP8WqcSpFJqDA68fKmDRORwXKHdwmP7aKNlUOCsdatBH5eAfPGhUaaO8GLq/B3adRToBf9Q5OUEJM4km+MgAkwpxrnEjkcs46/JK2FffGJy7FJGLnQtqEk+uVDeZbpZyME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqfPidJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A6DC4CEFB;
	Wed, 24 Dec 2025 05:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766554135;
	bh=C/GnFv5Pg+zL30Vai7m1dAM/fuNNOsDmUVTl2nzGmnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqfPidJQ/miNSrvls/TdR7kU/lfIuBMklmL10AS7LDhpmL3gBNFmwxacDsdB+GUA2
	 vFSdukiXuF5DEI14JKyOKdXPfKcwqC+b6X82OwNGaVEk7Xxw/7AHyVC0bddeMFqnfj
	 CVjUoFmMxOOfqfe8H2vyhLrbGxk7u+FqgM8D28+DYj3kWxK5idnuoad//uZxkEQ2SK
	 JERX6FjcM1IzxmzThOptRHAwlUS+fl1bocqPBhfWm4zP0B45GEHLVrAwCpugABEriT
	 rZpzTQCa7xyILtgv+UrjNkIQ8ySIpUSoOs/dVk9kelHyxiPtTqoDimKImgSVxQPz0T
	 SdFeLY6uaNHSQ==
Date: Wed, 24 Dec 2025 10:58:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
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
Message-ID: <aUt6E-AVVVkmo6E5@vaman>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
 <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
 <aUqjG4pVXWN3H88N@vaman>
 <bb775051-8635-4e2d-a1f9-46d6f0e6bc15@kernel.org>
 <aUq51TxXwiJE2DWb@vaman>
 <niverh5ydbah6axshbtop56wjsoluen64anojp3nvizcn4bthr@h4yickq6gtea>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <niverh5ydbah6axshbtop56wjsoluen64anojp3nvizcn4bthr@h4yickq6gtea>

On 23-12-25, 21:16, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 09:18:37PM +0530, Vinod Koul wrote:
> > On 23-12-25, 15:16, Krzysztof Kozlowski wrote:
> > > On 23/12/2025 15:11, Vinod Koul wrote:
> > > > On 19-12-25, 23:01, Krishna Kurapati wrote:
> > > >> Add squelch detect parameter update for synopsys eusb2 repeater. The
> > > >> values (indicated in basis-points) depict a percentage change with
> > > >> respect to the nominal value.
> > > >>
> > > >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > >> ---
> > > >>  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
> > > >>  1 file changed, 8 insertions(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > >> index 5bf0d6c9c025..f2afcf0e986a 100644
> > > >> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > >> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > > >> @@ -59,6 +59,14 @@ properties:
> > > >>      minimum: 0
> > > >>      maximum: 7
> > > >>  
> > > >> +  qcom,squelch-detector-bp:
> > > >> +    description:
> > > >> +      This adjusts the voltage level for the threshold used to detect valid
> > > >> +      high-speed data.
> > > >> +    minimum: -6000
> > > > 
> > > > 6000Volts, mV, can you please document the units?
> > > 
> > > 
> > > Code is correct, the '-bp' is the unit here. Unless the suffix was
> > > chosen incorrectly?
> > 
> > I was hoping it will be commented in the description here.
> > For my reference, what is bp and where is it documented ?
> 
> Base points, 0.01%

Thanks Dmitry, where is this documented for people who dont know

-- 
~Vinod


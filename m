Return-Path: <linux-arm-msm+bounces-41422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE179EC695
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 207902815BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828501CDA14;
	Wed, 11 Dec 2024 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhWS5zby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561C78F40;
	Wed, 11 Dec 2024 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904568; cv=none; b=rtSJBXuZtvjRvIUp/Di6Xcv35QnO6xFyAc8trSvQzYURzStbF0t/kdWIM31q8Cz2ApXYMpUxHfPwyVw5OIvYdQ/wB37W+yBynArA1Fr/LriBrOGNtAzSwQLEUNDPUSXQMCD6s2b5fMctIx+MdB/y/GLBQEIQmdA1UdxtpdZcaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904568; c=relaxed/simple;
	bh=ozpnRXQ6tys9QL4mHy+7QU8u2U1Yvi98dO4LeVEsue4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmhiKMGd0E4GR5yVYpnOMl4QDwD7AoghtcsJiUgWH7ZcAJbuNoUkdk3mnyvCsUYXZy+VW99NBQpq7kMgO2IqnYMSAB8QDx51rW9CIFFedGytPDZ1dcTH5QeUnj+KdUnmnbke60kLbHaw3AB3WbSjThJUgLVuUNQ/zgBGS3gYM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhWS5zby; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B35C4CED2;
	Wed, 11 Dec 2024 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733904566;
	bh=ozpnRXQ6tys9QL4mHy+7QU8u2U1Yvi98dO4LeVEsue4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhWS5zby1RTimhN1ZV/BXFH6g8nURr5ATck9h7wMXmpRG2XR45e3s2mfb56HgjPAY
	 Gmjwc/QXdB+5yXzfRjW/Mh2oqjs9cPgEOmu/H/OG9W4gOe0tJpWWIA6xPgnCiiHRlh
	 tbiqO9zHSH1/2FUavcS6M3okUo7w8fyWSEvZ4vPTQspFe2pE8Yh+GsQbdwQX2oX2+J
	 ThepoyAxqwcLS6WK1z6FbT/Tb0f3cPD6X/oMPCPRc3epTIzk9H4qWVyBi5k7CnTMoJ
	 ie/OFzIhPqOL4Ilpe3TEJuNJRpcP9BrR5r/u6pENBeLJfKx+mk+T7KRY50nqeuosKa
	 5X6qTDSW1F63g==
Message-ID: <33697bd9-02f4-4a9a-b8c0-4930d7fdaee2@kernel.org>
Date: Wed, 11 Dec 2024 09:09:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional current
 load properties
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
 neil.armstrong@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
 <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>
 <20241211062053.vxdpovlmetvyx3za@thinkpad>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241211062053.vxdpovlmetvyx3za@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2024 07:20, Manivannan Sadhasivam wrote:
> On Thu, Dec 05, 2024 at 11:23:11AM +0100, Krzysztof Kozlowski wrote:
>> On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
>>> On some platforms, the power supply for PCIe PHY is not able to provide
>>> enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
>>> set current load to vote the regulator to HPM mode.
>>>
>>> Document the current load as properties for each power supply PCIe PHY
>>> required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
>>> vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
>>> set appropriate current load during PHY power on.
>>>
>>> This three properties are optional and not mandatory for those platforms
>>> that PCIe PHY can still work with power supply.
>>
>>
>> Uh uh, so the downstream comes finally!
>>
>> No sorry guys, use existing regulator bindings for this.
>>
> 
> Maybe they got inspired by upstream UFS bindings?
> Documentation/devicetree/bindings/ufs/ufs-common.yaml:
> 
> vcc-max-microamp
> vccq-max-microamp
> vccq2-max-microamp

And it is already an ABI, so we cannot do anything about it.

> 
> Regulator binding only describes the min/max load for the regulators and not

No, it exactly describes min/max consumers can use. Let's quote:
"largest current consumers may set"
It is all about consumers.

> consumers. What if the consumers need to set variable load per platform? Should

Then each platform uses regulator API or regulator bindings to set it? I
don't see the problem here.

> they hardcode the load in driver? (even so, the load should not vary for each
> board).

The load must vary per board, because regulators vary per board. Of
course in practice most designs could be the same, but regulators and
their limits are always properties of the board, not the SoC.

Best regards,
Krzysztof


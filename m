Return-Path: <linux-arm-msm+bounces-87066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DACEB7BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F83D300A1C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE86530BF59;
	Wed, 31 Dec 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ7rXWgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48E3A1E82;
	Wed, 31 Dec 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767167600; cv=none; b=U+tqi2EHb/nBtie1rKpv0FxU5MNlQ2/PL3KWa71DnWExXia+mbiXOjkOTc28WFosSyY/JnhQI3TvV/z+xRs6ov98Troot2cKWDupS7eHw0Ldbq9ZNOv1rGfogood/evM2J9Oh1lUGQ3vhgljDhGKlrZL0a30A7oHTZKLi75PFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767167600; c=relaxed/simple;
	bh=H5jPsgsSv4KCjARHMk4KVRQLHJdj82jE0FtU9svOXCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOGHZ9Li+54YXrFPNmEzRL0pQObF1z1cTD/hGnk/f+0LNXRebHFBsOMi7HheRmdHS3r8JWk5wp+Rbyy9l417elFFwNBLR8ZL9A9U/SgMJTCi3o2m/O9fPw7Dq+j0ib1EpcXNMyRBHH19ILhPqyKVIZKT2ZNkHUH3q2jqFhSo4Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ7rXWgq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE725C113D0;
	Wed, 31 Dec 2025 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767167600;
	bh=H5jPsgsSv4KCjARHMk4KVRQLHJdj82jE0FtU9svOXCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJ7rXWgqQ3V6KDyusKoLAihPxgnU5vJ05Hcw6SRQwQ2Qom5zAy/fJoHZdDxJilhtb
	 tlRGKC/XzXuqdqXzT8dxUA5i1h5ZApeZhLhpIg/+1X0vog0AkqAjvCbY96oozvOVrD
	 XyTd9Ev7TBC6psWsYaBNZewLrWL3+BbgktquMybrYbBs0TrDx3ddC5DH2fnxf6Y22h
	 vurTJwMdLXRciwodXGPHA1Z7+7vaLBkJJ85s5CkdMl2ba8V6O7FtRFsVC68N1HW+7t
	 JpQnh+8XckYdA8gJaH/xDn0oFOp3j04WFX2V6GPePEDRaNnOsPMPJov6qW5lM3veYt
	 3LXgAG/FSGp/g==
Message-ID: <d724c6d3-0dff-43a3-827b-fdf8be2a6a0d@kernel.org>
Date: Wed, 31 Dec 2025 08:53:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, James.Bottomley@hansenpartnership.com,
 martin.petersen@oracle.com, anjana.hari@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
 <20251231045553.622611-3-ram.dwivedi@oss.qualcomm.com>
 <4mq5a4lhboymigbaruphlhip4zvmxl6xusvqrqb57bhx3yirt4@mgxdlr5onl6l>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4mq5a4lhboymigbaruphlhip4zvmxl6xusvqrqb57bhx3yirt4@mgxdlr5onl6l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/12/2025 06:19, Dmitry Baryshkov wrote:
> On Wed, Dec 31, 2025 at 10:25:51AM +0530, Ram Kumar Dwivedi wrote:
>> Document the device tree bindings for UFS host controller on
>> Qualcomm SA8255P platform which integrates firmware-managed
>> resources.
>>
>> The platform firmware implements the SCMI server and manages
>> resources such as the PHY, clocks, regulators and resets via the
>> SCMI power protocol. As a result, the OS-visible DT only describes
>> the controller’s MMIO, interrupt, IOMMU and power-domain interfaces.
>>
>> The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
>> removed from the binding, since this firmware managed design won't
>> be compatible with the drivers doing full resource management.
>>
>> Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
>> ---
>>  .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 62 +++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
>>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
> 
> This didn't really improve. You don't need 'soc' node at all. Please
> drop it.
> 

It was already asked by Bjorn, then I reminded that. So I wonder if
repeating three times will work?

Feels like a waste of our time if same feedback has to be repeated three
times.

Best regards,
Krzysztof


Return-Path: <linux-arm-msm+bounces-52275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058AA6D543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F81165E11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6931257453;
	Mon, 24 Mar 2025 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/DCj6aJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8634F257438;
	Mon, 24 Mar 2025 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801924; cv=none; b=LbBMQA8YpvhLJg+m148zR885Ku6B6W5hR8sXHCo7rjjlswcPW6zELEoncDIHJvuHA+H7Xo36SW8CMP7BPyW5Tv1nXCTeFQ4syHJ7fvrqETBTBVKpoVMtUXsj7lKT80OrgUStFu6WT9V7nUd4aAz9pHUPBN6g29o0unkD3pDTNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801924; c=relaxed/simple;
	bh=e6SIowdMXYBD6xhP/5nsiEyaBQQ8xzjEYV6YQOv7ymM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUEZ0wwBxqt1zBwTYA3VPiSbRz5s48/kUe2obMstR9gILMa+AQuWR81sqc8LbrvRdABOiCeVCwKZSh4Z/Bf5NuZ72ErranbTPD5+lslz6WJ1j5SFF6PXsr0zzHHtyzopnJJ+jrUBcGYobT4zNXFRKfijPSHDJGVDYsyc34USgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/DCj6aJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD385C4CEDD;
	Mon, 24 Mar 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742801924;
	bh=e6SIowdMXYBD6xhP/5nsiEyaBQQ8xzjEYV6YQOv7ymM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G/DCj6aJbFrctGnnNft7BvBOvluAP/K89AzprkIRMNZvv7bMDagxizxlZH81+6cHW
	 fZToOiRCFHBIx4aGs0H+4IR6GTMJJjzm3Jp2vwdsIXpe5pP3xK5L2+QjvQJG68jVBR
	 CwJglWxvRsCxLd6Y4cMtN1e5kgRVPt7uzP9CAtATZS4mb7pMEkkaus+qCgHjmCYQ5z
	 3GaZGAOvtMOiNYX77EJtFfHHdrwroynnsA3kpw+k8Bymt4WisPRY7DG+SnU4kS6hNv
	 MBYIP8AhcZOp5r/MYFeVg23ydzZnX5tsZzUEjhUhh68BG3KeQPdzlK5uXkfeYqzZ67
	 7OX89F2laUpJQ==
Message-ID: <fbd5c153-b73a-4dbc-a923-4e3d3924e748@kernel.org>
Date: Mon, 24 Mar 2025 08:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
 sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
 <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
 <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/03/2025 08:09, Wenbin Yao (Consultant) wrote:
> On 3/21/2025 5:43 PM, Bartosz Golaszewski wrote:
>> On Fri, Mar 21, 2025 at 8:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> On 20/03/2025 06:55, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> Enable the pwrctrl driver, which is utilized to manage the power supplies
>>>> of the devices connected to the PCI slots. This ensures that the voltage
>>>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>>>> on/off if they are described under PCIe port device tree node.
>>>>
>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>> ---
>>>>   arch/arm64/configs/defconfig | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>> index 85ec2fba1..de86d1121 100644
>>>> --- a/arch/arm64/configs/defconfig
>>>> +++ b/arch/arm64/configs/defconfig
>>>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>>>   CONFIG_PCI_ENDPOINT=y
>>>>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>>>   CONFIG_PCI_EPF_TEST=m
>>>> +CONFIG_PCI_PWRCTL_SLOT=y
>>> Bartosz,
>>>
>>> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
>>> selected?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> For sure. I would expect there to be something like:
>>
>> select PCI_PWRCTL_SLOT if ARCH_QCOM
>>
>> in Kconfig and nothing in defconfig.
>>
>> Bartosz
> 
> IIUC, pci slot power driver is a common driver that could be used by all DT
> based platform.


You are not responding to the raised problem.

Best regards,
Krzysztof


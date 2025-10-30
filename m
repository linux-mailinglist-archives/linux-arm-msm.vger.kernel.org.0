Return-Path: <linux-arm-msm+bounces-79564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28142C1E787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44832188B56B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 05:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7CE2EA756;
	Thu, 30 Oct 2025 05:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrKptVlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C6246333;
	Thu, 30 Oct 2025 05:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761803722; cv=none; b=dXgeDN7TQ7RzEaMG71LHYbdwKlJ2iySASlUTcEdn/8c8BuKJ7EPyu4Z3MvkwfQGOKXcyE/cSQhYBaL5/rbl8sLNhVk7gQww9+Ytpg90+c/noNYoSdFxFcvGVqclinFtp2jsKbAatrz58fNV5+aU08OTZXOcu2s/O7qDXW1saTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761803722; c=relaxed/simple;
	bh=kmYiPgQoz2pXEhJOd4VNiPMnOXp/QqwNqMVfMuxjpbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/5OC+Gv61kNvKzlS9+nI2GPTMiwVqxMqXwC7XHQHLlMqW8bzMSd/RGZx0Fo1z7OlLKyadT5u1JU5o3AvJrdxsaroAskRUkbYy+dixt++BIG/u2+dB+jQ/+DU9T2SEWwfNrGC2FkqVtXXI7guB6xCXigae/smWugGWUDuBqEZGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrKptVlO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A444DC4CEF1;
	Thu, 30 Oct 2025 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761803721;
	bh=kmYiPgQoz2pXEhJOd4VNiPMnOXp/QqwNqMVfMuxjpbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MrKptVlOSM6ipxPDG73JLsVaDrZNYXdZh3oH9ZT8e8YVndpOujK/rdakmp9hXTb6w
	 g76twl4dntIzo5YqTTsY6EFzsqtr1GFh2JxEZimADJjHUdXtpmeX17JT/1IQNuHASe
	 M+I7UXLa2EkkLSWM3g7FHpanFdjXxjvZgnqx+tC4DrsJywwW1cdfYPOYnPyAml5bb5
	 nfXdoO28CfC+hhGesfpRj/O6QFaCQAKLnNV3t4QKDHr7GWIMAC0iJjoa3ZF8B4JBGe
	 Ph17AebxCMsYpRpxou9GOQ+DhgzlavrX0OrI9L16RaDqBBM4c4XOoa9f9rgsD2BOS+
	 DwY7JtqRN1LNg==
Message-ID: <cbdd9048-8d96-4ae6-94b1-c552e92642c5@kernel.org>
Date: Thu, 30 Oct 2025 06:55:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali Platform
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-1-8ba303ab82de@oss.qualcomm.com>
 <k2wgpzkfklso42nsd6w527gqiadgdb235kzmvgk4wy27vievir@vlyxti5y7yan>
 <cdfde03c-0fa1-4142-87b6-7c023e0b5c0d@kernel.org>
 <l6ja2uni4grnhicis3xksmco65l5axodwg6umpomhkssuc4ja5@zy33evwbv3zy>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <l6ja2uni4grnhicis3xksmco65l5axodwg6umpomhkssuc4ja5@zy33evwbv3zy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2025 17:15, Bjorn Andersson wrote:
> On Wed, Oct 29, 2025 at 04:47:17PM +0100, Krzysztof Kozlowski wrote:
>> On 29/10/2025 16:16, Bjorn Andersson wrote:
>>> On Wed, Oct 29, 2025 at 01:15:09AM -0700, Jingyi Wang wrote:
>>>> Add the physical client ids and binding for Kaanapali platform. Physical
>>>> client IDs instead of virtual client IDs are used for qcom new platforms
>>>> in the Inter Process Communication Controller (IPCC) driver as virtual to
>>>> physical mapping logic is removed in HW.
>>>
>>> Happy to see the description of what changed wrt physical vs virtual
>>> client IDs, but you're leaving the task of figuring out how this
>>> explanation is applicable to the imagination of the reader.
>>>
>>> Nobody knows that the values in dt-bindings/mailbox/qcom-ipcc.h are
>>> "virtual client IDs", so it's not clear that you're trying to provide an
>>> explanation to why a new, platform-specific, header file is needed here.
>>>
>>>
>>
>>
>> Physical or virtual, standard expectation is that they are used by the
>> driver. This does not happen here, so what do they exactly represent?
>> Which part of SW ABI?
>>
> 
> I was under the impression that they would be used only in DeviceTree
> source, and the driver simply uses the values it reads at runtime.


And uses them for what? What do the values mean for the driver, how does
it use them? If I change some entry from "1" to "2" does Linux code
behave differently?


Best regards,
Krzysztof


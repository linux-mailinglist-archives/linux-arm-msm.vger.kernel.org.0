Return-Path: <linux-arm-msm+bounces-76731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AABCA984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 20:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BF28353EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 18:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882142512E6;
	Thu,  9 Oct 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="bMU5V9YK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F5244675
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035286; cv=none; b=sCgmuXjXmrpt0t1njgR6du2bGxEpCy2xAKf6miQ92T40FyVewJEVq5Z/1rUBzfvmo9WQQlTRQFJwoheg582nq94Ry6bJmAkhYsCzwAjbR8NaMFRPwZz5Noj/KWqt4mbVFWVU5AIqlzDbocMhKJ59vMhX4U0ntC4ShohZJBEFVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035286; c=relaxed/simple;
	bh=8pRvggxfsXP6L0iumbHlzl0yn/JWiHfIlsvMWZjNYXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uti4beh0tw3hwxS2vmFWl7xKZUxq/JyUmo37xWFkRnzHzC5OLsxU89iel3klSew2NxGDJJDDEw8eA6pUkzAEkt03Ln/0gpg//2Rbp3s17DAJwngAKHzfpFn+V8meSu9j2KGUkebVKxZDQqqrPyWHyzuTIdpZwpYivB34wBg0tNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=bMU5V9YK; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <ab555975-77bd-4232-9f36-b722a16f4110@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1760035279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vanhb6g4lVC745LgWuYYWnzrHT54e9aSzmk4dwUmsoE=;
	b=bMU5V9YKm2JSxa1AFrZ9xaKUOTFam2uJJHHRLHqbNWvo63rJt1WmPAEBWml/K8bNvSfWa6
	trdD3jI7b7LCv6K4kuIqZoNkIRWICM3Ynk8swKDnuqSptQfQMVeAbU+dUngzRThqP/MepG
	WUIQWRJa5CSR/scfGmN97PX2Nfx69ZFfu/everGkNisUPJRq+NqYPWSWDumcLA4T5MGdM+
	z75BSTtwEdfa5wGGe6yOCIbZWEcOKraAzB0vFVYlVjvRv3juIpjHabqUPbxQYggkk0UVPM
	YoMinlkDHscVeD31i6NfQXiWyqsW66d3AssPgApKR/KW75NfWN8QCyeJ9ZrvzQ==
Date: Thu, 9 Oct 2025 21:41:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 06.10.2025 01:16, Dmitry Baryshkov wrote:
> Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> cell, although it spans two bytes (offset 5, size 7 bits). It was being
> accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> core: fix bit offsets of more than one byte") the kernel didn't have
> length check. After this commit nvmem core rejects QFPROM on sdm630 /
> sdm660, making GPU and USB unusable on those platforms.
> 
> Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
> error.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8b1a45a4e56ed1ae02e5bb6e78ca6255d87add1c..21f7dcf60679026e45202c6ce137ca0463c00d0e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -598,7 +598,7 @@ qusb2_hstx_trim: hstx-trim@240 {
>   			};
>   
>   			gpu_speed_bin: gpu-speed-bin@41a0 {
> -				reg = <0x41a2 0x1>;
> +				reg = <0x41a2 0x2>;
>   				bits = <5 7>;
>   			};
>   		};

Hi Dmitry,

I think bits should be <5 8> as well.

I had similar fix in [1] for quite some time with a bit longer
explanation why. In short, we need 8 bits to be able to read the
value in speedbin efuse fully. Currently on my device
(sdm660-xiaomi-laevnder) the resulting value in Adreno driver is
0x7. There is no such speedbin in [2]. It should read 0x87 (135)
which corresponds to downstream's qcom,gpu-pwrlevels-3 with 647
MHz max, which is further confirmed by testing on the device running
Android by doing:

  cat /sys/kernel/gpu/gpu_max_clock

Which will show 647, confirming that 0x87 should be the bin.

Also when you look at the list of speedbins downstream [2] [3] for each
SoC you'll see:

  * SDM636/660: 157 (0x9d), 146 (0x92), 135 (0x87), 122 (0x7a),
                 90 (0x5a),  78 (0x4e)
  * SDM630:     162 (0xa2), 146 (0x92), 135 (0x87)

it becomes clear that 7 bits are not enough to hold values above 127.
Therefore we need 8 bits.

[1] 
https://github.com/sdm660-mainline/linux/commit/f9f92384794ca792a622ed19d5b5d2dac73a1a78
[2] 
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm660-gpu.dtsi
[3] 
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/arch/arm/boot/dts/qcom/sdm630-gpu.dtsi

--
Regards,
Alexey Minnekhanov



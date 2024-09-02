Return-Path: <linux-arm-msm+bounces-30430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C79968EA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 22:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3128728379B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 20:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887FE1C62C3;
	Mon,  2 Sep 2024 20:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPsrhTfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1C1A2656;
	Mon,  2 Sep 2024 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307516; cv=none; b=Xgt43cLJy2sWL0SecPwEKjXP5sMBkogkqpwdC5yE+YGxx9r99s6jZTvZ65b9ip6FUCTPXKD7hGvCzg+3hBqkF9E4R7F8nzIRec10yst9If3iJb+pZ3hArVCCiipAgRJTi5u88Us0uAg/kTx0JETTs5YvdGiCCeBrPgEBoqXkGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307516; c=relaxed/simple;
	bh=hTs8v+dIotmZYJZL8iDde0DHOaDQoZeGsavc9Jc1hYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+WIm8nlthJkQlvgTts3hFGP+0ZfrV8q8969lXGTfy/d2yvxOeA7/HgeyIQJOaXRNf9lJwF8whWZxjbmfoUpIvfeyu0T+BKKpPtyhdThESCUB+6etVg4uXbyK9VIkR9kWGxuuBDkzSVKa0OkKrqAUC2fLB7+/nYlCVUjUW8nOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPsrhTfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7184C4CEC2;
	Mon,  2 Sep 2024 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725307515;
	bh=hTs8v+dIotmZYJZL8iDde0DHOaDQoZeGsavc9Jc1hYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QPsrhTfc7DmbvvMNNcf/S2p88IYwck9izHx6jW5DkcF53RzIlsi8PAFGXBqXVyAlY
	 fo+mH96KJJ4R5YrSAKTUrnmJ+N0QuRj1cORyi88VnZlSlKxyzT4WflvEdYBc3Byu0R
	 58hJhTqPOC8sgcgZdcENiOniLjmmUgJJdPwxDVot+LaVZ/0+KNAklJuzf6CMRhuRkX
	 EG51NGtRRzSXBsZqFWQT9YMlIVBvoZ1oVSKpHmBLw3nVIM+33b6ChZfOOixez+79bW
	 KpoG0QHTsk769qTiuE+cS1LrGOtVMKWzc3ddziwIOGRhj214J3wau+jZo8nwsFbQjS
	 iJ15BZ6PUMdxQ==
Message-ID: <29c63407-d32a-4afd-ac92-498bf5855359@kernel.org>
Date: Mon, 2 Sep 2024 22:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Enable external DP
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>
 <th2x3gtx56fr7zuhhleuj77eghfe7kgbfhok7ul5egez4iq5v2@qy5wy4hxpb5s>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <th2x3gtx56fr7zuhhleuj77eghfe7kgbfhok7ul5egez4iq5v2@qy5wy4hxpb5s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.09.2024 8:54 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 02, 2024 at 06:01:35PM GMT, Abel Vesa wrote:
>> The Qualcomm Snapdragon X Elite CRD board has 3 USB Type-C ports,
>> all of them supporting external DP altmode. Between each QMP
>> combo PHY and the corresponding Type-C port, sits one Parade PS8830
>> retimer which handles both orientation and SBU muxing. Add nodes for
>> each retimer, fix the graphs between connectors and the PHYs accordingly,
>> add the voltage regulators needed by each retimer and then enable all
>> 3 remaining DPUs.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---

[...]

> 
>> @@ -1164,7 +1566,7 @@ &usb_1_ss0_dwc3_hs {
>>  };
>>  
>>  &usb_1_ss0_qmpphy_out {
>> -	remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +	remote-endpoint = <&retimer_ss0_ss_in>;
>>  };
> 
> orientation-switch

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=17c5909f53e01c151c91f66949a9c4f191756bae

> and mode-switch for the QMP PHY?

Oops! Looks like adding it and fixing some bugs in the qmpphy driver makes
usb+dp work every now and then..

Konrad


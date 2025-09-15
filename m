Return-Path: <linux-arm-msm+bounces-73494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57AB57199
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A3817C41A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89EA2D6630;
	Mon, 15 Sep 2025 07:35:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896F2D6E4C;
	Mon, 15 Sep 2025 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921707; cv=none; b=Y1y4vWHCiYxO44KYUL/0Zl4VYAq8pLBqUesKZKU86SJV9DnL1YFuSCVou+SvN8wACI+aAibX0JXoQqJ7rtlS8Zoo9UeDmXPCUH3EZeE67BJpvnJUjp2qsC2Quahy1K3ByLvdXZ4FaxNziG3E1grT9jMtjwP66I29grPqPoc1DPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921707; c=relaxed/simple;
	bh=OTlhYlwmlrHd5LLpKbj2RzBc7GgHsmuWPZ832h7Kq7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iw5lth8NZQNL6OkrTvCh6Lq54UQZt4xHh2bfz3mleAjSuYHmTN9u9+WmhVqeYzQA1KZ4PmVYLwKabvz06MUDG++9y19McHXhbVd0xY9djxxEF3Fb0g3KOUm2k2rlEhGuMFeHFIFUJkngT2Z4qZ+N59avzbRZX0TaLTDse7vFAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz16t1757921690t60967de8
X-QQ-Originating-IP: kSwovttHONOrwwhmhJpODn+fWUYHq0Htq6+XUFWGxhE=
Received: from [127.0.0.1] ( [116.234.26.9])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 15:34:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3665793942661466864
Message-ID: <4AD4461A95C1A8F2+bc2124f8-d1ae-4fe4-8d0e-55872609d3f3@radxa.com>
Date: Mon, 15 Sep 2025 15:34:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 4/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable UFS controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-4-045f7e92b3bb@radxa.com>
 <9a18cfae-4fcd-490e-b44d-6f9345cc7c3b@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <9a18cfae-4fcd-490e-b44d-6f9345cc7c3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MBClcpj4hUKmyYOMfKfD7FTLfligRsXGmCRzKlLeD3ZISsCr+XD/C/My
	aVzjBn5Di/dz6culWDKY3oWB5Ezg5p9oe/iejo35EXAy3mWh6zWB4I4zHhKweK0iGca5yEs
	19sn2jijcYD0dAAyLQaHnWsIHwCmQLkDeUHdNWj3jA2SLlLlnYp9M2TixeKHCWit2aloSNr
	UzfUnB4Le/25mj98MBLmNYgkvu5h/WN30mrIATDlaxw2KYfzB0gqu6QHTQjOcko9Ty2dITj
	9nnMdSHihtM9KJmSOifp2NZue0KRNxpFXIsu4l7+sqhuaIyXNrgqiAIYDs7rZxYJakGXDcx
	DDKYEOokU9olf+j57mxzc0S/vgIzT3PhLP8rJ6TZZ7xfbu1Qrot+siZUXv3D55cr12IkAnX
	e7/1W6p6mPBRPFFwo61w59qlrey6GoWYaTyrU7AWscqTv2B2YRlQKfOKPGHcyiJ8kfEipLr
	8EP6Z9o3E7p+QluBnubJynAGE3JnumZUJL6ycHN8Bg2Og3n/ACjcK96GwL5JU7pqTf6yFU8
	UfcSnXCsQjSbq62IxYCuTlrF+/9bkkGFgVKR7IB1d/3NnUfMkF/tkflaLRl1Fl/kS+QhMpi
	DzmFEpx1CdJ/20n4oNREyDM7nUaleo4B8azP5gXl7Vg3mVWENlrey7DyC0wucXAnB9aycMl
	rwdAtwxzoRwekLQwjciiJ6dhPnchvOJMFtE/34soA4v6yYIgrWM+4jvFm3WLszMJ3UkxHkN
	Mkzd9K6BhgDsHInru7AApsqM9dWNgjRkipH0ZnKMk4KqUM5iCD00Y0gwwNjvW5h6+bLsmse
	kmnPq96dC9zg1p1LSaxZHtmK0LSO2VI1vfWDNqLyeSHC8AS9auNmf/wzv3YYf1NCw9B7Yur
	T2kKI2NRYTd3qxTdPoJ4/PU6mdZcrfuZ6EsFHi8STje7Mafm0fci5yKm2AHj5NYzZPCTmbs
	ZXLyEZd/v8tySi0JNS4REevDViSYuZMqSZjEcFcc69QjCh789NeEhyE3Z2+DbbUvddFRJ+0
	gdEp3EstFx/s0cdQrs2jWTqVWxOjo=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On 9/15/2025 3:24 PM, Konrad Dybcio wrote:
> On 9/14/25 5:57 PM, Xilin Wu wrote:
>> Add and enable UFS related nodes for this board.
>>
>> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
>> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>
>> ---
>>
>> This change depends on the following patch series:
>> https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
>> ---
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 29 ++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index d30cddfc3eff07237c7e3480a5d42b29091d87d6..3bf85d68c97891db1f1f0b84fb5649803948e06f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -482,6 +482,11 @@ &i2c13 {
>>   	status = "okay";
>>   };
>>   
>> +/* It takes a long time in ufshcd_init_crypto when enabled */
> 
> Huh? It only turns on some clocks, writes a couple of mmio registers
> and turns the clocks back off, could you investigate a little more?

More specifically, it takes a long time in 
`qcom_scm_ice_invalidate_key`. Considering this platform boots from SPI 
NOR, while TrustZone doesn't really support SPI NOR storage on this 
platform, there could be something broken in TZ.

>> +&ice {
>> +	status = "disabled";
>> +};
>> +
>>   &lpass_audiocc {
>>   	compatible = "qcom,qcm6490-lpassaudiocc";
>>   	/delete-property/ power-domains;
>> @@ -938,6 +943,30 @@ &uart5 {
>>   	status = "okay";
>>   };
>>   
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
>> +	vcc-supply = <&vreg_l7b_2p96>;
>> +	vcc-max-microamp = <800000>;
>> +	vccq-supply = <&vreg_l9b_1p2>;
>> +	vccq-max-microamp = <900000>;
>> +	vccq2-supply = <&vreg_l9b_1p2>;
>> +	vccq2-max-microamp = <1300000>;
>> +
>> +	/* Gear-4 Rate-B is unstable due to board */
>> +	/* and UFS module design limitations */
> 
> /* Gear-4 Rate-B is unstable due to board and UFS module design limitations */
> 
> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


Return-Path: <linux-arm-msm+bounces-76520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D619BC72FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8C7A3AC78A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0817854652;
	Thu,  9 Oct 2025 02:16:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB9182D0;
	Thu,  9 Oct 2025 02:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.65.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759976209; cv=none; b=Uon5cbKtzUP3aicRDpQ2mpnfmSZeBeWI0wNLG/pUEoW2FF9/shxWUYKwZrHiCZLuH2MdVEkgGYRMhl2nzpUTsrKzhM1ip3ZW7bYnHw70mrP5OlkkQ9XEHCXDnCAx+/WkmfCADzDNrcswx8DCJMAnXGG7r23z4C0BQXUkIqZf5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759976209; c=relaxed/simple;
	bh=EXlTnayX8iZs1RmOI2PwhPc7Xd2rnDyLCCsaCyNwEHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyJyd10gcx2+6BfPjMtDC16x3sagTPg70a2a56Ow+tsefrr1y+vOrCfQFmYNc/5zN5RyS9lfJhNqEIT9f5qeiOmrXHy7qe/8oxNNaibllwJoV+cUrW9QA/4nWPnv9uwLTvPZXe4UqjCJlGyhyIckSuK8joOuIExJVITJYN2JSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=114.132.65.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1759976187t26981058
X-QQ-Originating-IP: QJywRK6yFCSFRt7FydXwg9CgEhop58NLlivjWVLVJ7Q=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 10:16:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 417726807767555763
Message-ID: <03A4C3DFA86FD6DF+6262361b-e129-4b19-b5eb-42188fa76505@radxa.com>
Date: Thu, 9 Oct 2025 10:16:25 +0800
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
 <4AD4461A95C1A8F2+bc2124f8-d1ae-4fe4-8d0e-55872609d3f3@radxa.com>
 <25a53665-d400-4bd3-a1ad-5ba8d3a0d9a6@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <25a53665-d400-4bd3-a1ad-5ba8d3a0d9a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MD5XEDocxEOLdLzjZUvfOGq5nymi/F92xVPzReiXj01OMIrEojath6KH
	4q0JkLIzTB4LJn/9Y6sIYvB6gjbwAoP+JL/Avgq2vRkDdSMfEWhZqXZapNgBMlNit21msRg
	wMwL4L1zb/ED8FUMd2a/cFVaQriP4QHoET5lk7X0nuFGI3Oywb7D1Zczes8N1Fb0JMW4g3K
	CaqoSuUaj2Jj7X4tMp3LLgal63QPO0SOyYufzgCStPe7CfooI07qwKdJRVjyl3spEuLLBu6
	1EP0REqoJbJf1Euy47+Cpni41Jq7C+rN71mi8MhTfXxlcTgmVi94gM284NdTnEX5RqGnnAd
	RlPwkNbNJJ14190cZC/2qxF5AsP2TI5kLrmZeXoxtAhhS8fp6x1QvcZ7X/N7CkxTWTHGd9q
	zT18ddeOKi58NnIvlg63juujnH1XtK/JISlpE7KHvPwa+XxUszYooGTPw4u0DOOhI7EcLF/
	RcH2P2Vpeli4tQi0BqGCB5ieGY/kMxe5N39T3X6eCgYuYOwclcOagg03uvBIqNqDZTpYM8c
	WIT2Qk1ZL9hPgghxZx+cZ7KZELDdTVnZHoMhpQOTvz4AwNZh9qM/ZTWuzchccfl8TPautaz
	CkOxE5mGNEfgvMaFOrOTbf3sHPFJQ0aq99PTT/C93ggx/vuHTDY7V2eZH942hkwbF/hKBke
	6oGCa9jpjIlv5wItrUmRxfoCGnRgpotQxA4UeIrmCJdZdxuR6OijrzYV17i4cMd6Lq/T+G/
	QPO/PIe883EZ1fsfE22k2vAxnLZDKsWoY9KLYes16iStw5gRRc9ptxHR0IqphLVxmtQilvb
	FcSTgNRJbs04BtheO5ZxwGiJO14eaaRQyB2ywLQaoCeqEwyjzOW0Bkpkx7cJ3p4G6yKJlRn
	IaG562CrvopICScUB4UUAxOxyXRFqAaUMb5U0QraTQdiT/3Px6abMl8T2omoYcmqJrRMnfZ
	LCT3LkWWYT9MzfBNiuA7ftg1HL7K/3j6NdtK2rj79e0rEdiSqL6NZjBZhGGG4z3Lfb1TNVm
	6N+41r6usURsy7n+qR4oQULFAVKWvtC7rv45h5wQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 10/8/2025 5:53 PM, Konrad Dybcio wrote:
> On 9/15/25 9:34 AM, Xilin Wu wrote:
>> On 9/15/2025 3:24 PM, Konrad Dybcio wrote:
>>> On 9/14/25 5:57 PM, Xilin Wu wrote:
>>>> Add and enable UFS related nodes for this board.
>>>>
>>>> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
>>>> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
>>>>
>>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>>>
>>>> ---
>>>>
>>>> This change depends on the following patch series:
>>>> https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
>>>> ---
>>>>    .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 29 ++++++++++++++++++++++
>>>>    1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>>> index d30cddfc3eff07237c7e3480a5d42b29091d87d6..3bf85d68c97891db1f1f0b84fb5649803948e06f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>>> @@ -482,6 +482,11 @@ &i2c13 {
>>>>        status = "okay";
>>>>    };
>>>>    +/* It takes a long time in ufshcd_init_crypto when enabled */
>>>
>>> Huh? It only turns on some clocks, writes a couple of mmio registers
>>> and turns the clocks back off, could you investigate a little more?
>>
>> More specifically, it takes a long time in `qcom_scm_ice_invalidate_key`. Considering this platform boots from SPI NOR, while TrustZone doesn't really support SPI NOR storage on this platform, there could be something broken in TZ.
> 
> Hm.. if you change the boot order (if you can on your board..) to start
> with UFS (which would require reflashing of all boot sw onto there), does
> this still manifest?

Unfortunately the board is designed to boot from SPI NOR only. And 
there's no way to change that without replacing some resistors on the board.

Just now I tried a v6.17 based kernel, it now simply triggers a reset 
somewhere when ICE is enabled.


-- 
Best regards,
Xilin Wu <sophon@radxa.com>



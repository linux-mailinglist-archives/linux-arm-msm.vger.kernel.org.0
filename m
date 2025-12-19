Return-Path: <linux-arm-msm+bounces-85895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2BCD0135
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5C4B300EA1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C2631D750;
	Fri, 19 Dec 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7gJkZS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YP51dDFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672B320A33
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766151199; cv=none; b=AX5OaZ3TNOspjaHA6ROtB/iW73W0nnmZCY8LwLozsKPClNW7kkYzWwJs6pN/SJl6UfH6BKZaWsRPoLd7dqIZtYDZAasW4iMTHL/aTURjzl2eTSXQ0dp4Tg2RzNRC/QV1F5NthKrUTosSvjfo8yUl9rx2DQ2KgoTBwQQ4CXtF8VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766151199; c=relaxed/simple;
	bh=y/78bf5G8lbi5N5++TA4RIXe3uQy2zd6zGvGNvFcGsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3IYCQNcms8yfnDh0XqNAg1memxxrKg8LxLGq+TGqocfEciXcsLtd1wQ3JMMFn2JsaV1EFEB93GZekEV/jsuzKgXAkNjBy13lW+09j4IGBWjKopkEkX7+2fzDkAbC9x7pswAgwfSnr11s1PS7jn9qh3XARhNvCfvIbuTTdoPg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7gJkZS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YP51dDFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBl4g43992033
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9orEthglfu+PnjZEtg1EkiIu/RLCFUj7Foj950BKbA=; b=j7gJkZS8JIyUln21
	3sDzcMn6Rz/XkNAJpjracuXz4vZzP3V9naurlQrV2EMBqbSIlcaKEG0h4Mhhj/1s
	FuCvtn9RtXtQd5hhvGPOGU2mkSpkE2XQ6L5SY1Js76SMHLm9Gw4ge0awbIT4nfuh
	QviP6wTAk8rmeXACVByOjPG4H1WbhRtGd5K3Dk32Qo+VTxTGFOkKMFrclrUpWNn+
	b2q0O3trEh6PXp9shWgLQh4MCkVraX6P16qtDCiKy6ejUuiIDZt0/xBKioSZUIbK
	UPbE/ihlLqvTqVuOoF2Tv10PdIF8PZlenFCt9tQd5ewdR34AiNhLT957nPWzces5
	jc73TA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2daqtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:33:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f34c24e2cbso5089011cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766151196; x=1766755996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9orEthglfu+PnjZEtg1EkiIu/RLCFUj7Foj950BKbA=;
        b=YP51dDFWZKLWMN7xpnIaPrEoHgUN/Me/KvmWksPMcV4Y+sxCpyCF/mIgh5ykMEO9ve
         OYnI3wpwJMdLNgKydJT9EmumElHOG5sUwqLQUXwd2xYkV1kIVUaLuRImwBoc5GByLp6F
         rnB1S82guRiFrpNmvl7ji+71Q+O4NGRviBUgx8zT0wFMMYLXyezIEKp914Xy0mcV/ycP
         cGA5O7xp/EhMCCEDxyJEKEgkXO64oAVWe5csRuZqHKFX/TKwLxBBZ0u7M0KkGUNIzudn
         6OTaq5W2Td31niT8ko9UsQT03Olh7FB6wLKhBiMn7lE24R8pRz7YGfcnCYEDCwrcwKYD
         9C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766151196; x=1766755996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9orEthglfu+PnjZEtg1EkiIu/RLCFUj7Foj950BKbA=;
        b=d5/YHeGgGZxOm/zcXAn9QBJEMvEb/9NwWcPbvC/3S2ZSQhQQEfQzL385HvSQU9KcPH
         8Lbfkc94gVdnZHxTDEkN5MEpISbM8TK+HTUvixyfgxnP1pBFZbaWYoFjgrnvy9FVlqIY
         Riz+XAqpb8SOvBJuS03o1U5mM/0oo/XJpIIX1dNf0fu8B0dKOwhHssfzvl5Dy+uFs+Ay
         t5blUqvfE+9qI+zmodSM5VRDiK3mBtSQKnaGbfYSw79B4AVQEti4Jqx5yBouHk5y0sOe
         06+m9YZz2s/SIhJgoX2NM7WnrPBbaNMlwDKtv51JdzNP2FXWTefuKm+jzL+BEyZkJ1wa
         76iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrwFz8uTVMCW5URLxie9IKvttxUwHPl7U6u7zh9/udqeBiWaoKXnD+fAY646Tu7in+d/RvaM4KorY2QdRQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4age8mKBsAEX8szH1eOZ5QqPgg3HTw9kzGbhcTPG8cl028Ons
	j84WjrPVyjLKDNwamAbfHHH/li7Ty5uVgK/4ufz498S/Q9C3ALlP2z6C0Q46Oyg5+r80pXYH/eA
	zjUQAj3SuTXhS3cDA1KKcBi8jDQN7oM4Qwfl5qBAA/8ToIVhHQblNfq/OxlqsiCXxQzZ7
X-Gm-Gg: AY/fxX5z07cEZ0SHnvDqgLCqwtR0MQqewinVUnT5MHo2U0xhrYP9UEAp/5uwrzxrPIR
	AhQwAWvbmsoju9bi+sNvU2xZfdP3haLOe3HHxpfvYBRtuZd49IeVuAtAtuSuz3U5DsYyqg2QQEe
	/reyYdtu8B9sLpsKyVmpTalesG+Kl0TNRla/aPl//QkMGm4gRt9IxDzyoQi6HKRgnxKb2caicmH
	WUrdEJWvP7stSa1qpcoVkd4z6LwWah7R2/xxllJsS74x63LTUfyyBNWPh7FVdqTnjlWa2A/PcIE
	WW9zR9IdbObkPXNGZ6WSj79rekR64s6CXzel05ywBkTKDHMF8eP2S6HWMQ7uuri9keH0y2RJ4cD
	iTkKTuvJGQ1SWvqb0y1KuyDOO94ulfouwPbgjdmejSyQU5NN+yCx2fgHbKqgbm8ip0w==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr30865711cf.5.1766151196495;
        Fri, 19 Dec 2025 05:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCRQttfRGvz4IETD4ibzOBiHm3VS45e6KRJmrOxaGhERSR383GVg/VvQup5ivuLKP3chW7qw==
X-Received: by 2002:a05:622a:14:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4f4abd1239emr30865151cf.5.1766151195895;
        Fri, 19 Dec 2025 05:33:15 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90414649sm2245506a12.0.2025.12.19.05.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:33:15 -0800 (PST)
Message-ID: <b58a6cf6-fb18-4d31-8b45-85a76192f7ac@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:33:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
References: <20251120-lt8713sx-bridge-linux-for-next-v1-0-2246fc5fb490@qti.qualcomm.com>
 <20251120-lt8713sx-bridge-linux-for-next-v1-1-2246fc5fb490@qti.qualcomm.com>
 <7d31f45b-1062-4118-8769-49209908f2ef@oss.qualcomm.com>
 <aUU05P+xP1XdwihO@hu-vishsain-blr.qualcomm.com>
 <4112ba0b-6feb-4e30-a57e-50ef9e3d6b5e@oss.qualcomm.com>
 <aUVMFTtVLPe7re0L@hu-vishsain-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aUVMFTtVLPe7re0L@hu-vishsain-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945541d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VRXACKE1YIbZzR_II2oA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMyBTYWx0ZWRfX9YLWzRD7qOGt
 oOHgp6BMaltOpQHX7G4RJgyX3z+bQoQ2OnytJs+dHrYFtT8CAJ4XI9BkEScpol4JdEY0b9tgWbO
 SSTt3M5Aq814uGsUMizGwzHqP+LxbRek7kb6WQK/hu9m6ADq2+Ql4gWuUWwJr/G0P0jY3gOtJJV
 CZAHf226mXZDq/zXOEZ2y6eYQMrt06SFuGthKlmDSAWDQDlEBKTzp/pIp/IwVgf1/hg/PYr6Iq9
 ZyHx5v7Fu34kfv1dlwg2UqLAeeufYzs2gtGgxaOOYU5f35MGos7Ug+e5bdef/FNVjGayDdArELY
 DSy2LwWPYUzTXS/ag4HDXRxDIZ3k3h/EzQAfDy8gMTUdcgcA/IjfQdr0g8eYpdHAI0+/YUWSwiM
 07zPm76roXVE4iqRpNYL4iDYpFa9y4hmmi7EraYwfm57ECvZwaJI0K7XEUrnbo8/WcLhYGog1Ox
 YX4XJtKGFppN/PcZOew==
X-Proofpoint-GUID: rTDhXiwwuJkgL-V3f-Gi6grAbmdw-Dv_
X-Proofpoint-ORIG-GUID: rTDhXiwwuJkgL-V3f-Gi6grAbmdw-Dv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190113

On 12/19/25 1:59 PM, Vishnu Saini wrote:
> On Fri, Dec 19, 2025 at 01:10:19PM +0100, Konrad Dybcio wrote:
>> On 12/19/25 12:20 PM, Vishnu Saini wrote:
>>> On Thu, Nov 20, 2025 at 01:11:00PM +0100, Konrad Dybcio wrote:
>>>> On 11/20/25 11:58 AM, Vishnu Saini wrote:
>>>>> Monaco-evk has LT8713sx which act as DP to 3 DP output
>>>>> converter. Edp PHY from monaco soc is connected to lt8713sx
>>>>> as input and output of lt8713sx is connected to 3 mini DP ports.
>>>>> Two of these ports are available in mainboard and one port
>>>>> is available on Mezz board. lt8713sx is connected to soc over
>>>>> i2c0 and with reset gpio connected to pin6 or ioexpander5.
>>>>>
>>>>> Enable the edp nodes from monaco and enable lontium lt8713sx
>>>>> bridge node.
>>>>>
>>>>> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>>>> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
>>>>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +	qup_i2c0_default: qup-i2c0-state {
>>>>> +		pins = "gpio17", "gpio18";
>>>>> +		function = "qup0_se0";
>>>>> +		drive-strength = <2>;
>>>>> +		bias-pull-up;
>>>>
>>>> Similarly, you can move these settings to monaco.dtsi and keep them as
>>>> defaults since 99.99% of I2C users will share them
>>> Is it ok if i update this in a different series, similar other nodes like qup_i2c1_default
>>> added in monaco-evk.dts?
>>
>> No, I don't want you to introduce something "wrong" only because you
>> don't want to run git commit --amend
>>
>> I see you've now sent a v2 just 7 minutes after asking this question.
>> Should I interpret that as you expecting me to drop everything and rush
>> to respond to your queries immediately, or do you not care about my
>> feedback anyway?
> Apologies, for quickly raising the new patch, i thought of correcting this
> in next V3 patch if you ask for.
> I am new contributor to the upstream community, just now i setup mutt and learned a bit about
> sending reply to the emails and V2 patch was already validated that's why i submitted it.

It's okay. Just please try not to do it again - it's really an anti-pattern.

> monaco.dtsi already have below node except drive-strength and  bias-pull-up.
> tlmm {
> 	qup_i2c0_data_clk: qup-i2c0-data-clk-state {
> 		pins = "gpio17", "gpio18";
> 		function = "qup0_se0";
> 	};
> };
> I will add drive-strength and  bias-pull-up in monaco-evk.dts, let me know if this is ok?

That should be fine. Other SoC DTSIs do that already

Konrad


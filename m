Return-Path: <linux-arm-msm+bounces-72390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4EAB46A26
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 10:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3662A1BC50ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 08:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A0D2C325C;
	Sat,  6 Sep 2025 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8RDQYrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35412C2376
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Sep 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757147335; cv=none; b=C07A1jtsRFOQeWHubYTlWpjz7bPO7Upd0oNJCAKzjvgRVrm8CGz2yE8QzF3x2Wh6BWYhXrgLt9bJP+rGSRojycPJ0CpyB0UtyHkzywaSpUnwiKjGqVit4lZv8qx8T5grYwH9DgAHWFD8rldyGJPqZ7aAe54E+MP2RutzpYyoK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757147335; c=relaxed/simple;
	bh=n3YYbeyql2yL1SH/t8tDGUT7N9M3cy6l+tco6F3vxpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdV8YoW9+XteWxDN4TYyXbKz94lTRuHtudbFhwaERPHkDbwuepqNkMz86kGSrIvrIxOhCrwUZ37xKxd3h2Kk2mDhSATjpfZAjr8FjOIoLcMxYrBskRnkqQopfnha982kHDhWhvK7WPIJl4MVo9eDCAC4EnwtIfSgprhCOhYwGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8RDQYrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5863k29U011752
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Sep 2025 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKdwIMsuOs8hXrBNQvvXPiZ2vNFLXyJWMTWiOB3kSMs=; b=I8RDQYrQJI5XWMYG
	CVEND3u+va15bk5ulW5EfdlM4vvd5k1tM1eUxBQixl3x5b0aeLEuMhVx8ujbbwmO
	dqvUa93y5Nkxmvb5HExqDppVers2XyHafDjkEbjrjQXBwFFsQz9AxP/A/jECRWQc
	J2H3Ldb3tlf8ocMeOF5MrRR1dqsqwz+T8odDroQw1p9O2KqzCfgd5rVZ2x1L4nsH
	20fQbDThEhMx6RH9Z0U0NenbDUVy4rZMbfpLwXWS122i1WcrGqZtXpKjp52uyhwX
	EA8keiXZ2YXIDlWxxReqhXc7n0cnJv/yuEtrrNYsSQaXkl6k5FAzS5LSgnvDLn8Q
	LMHDzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db88bek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 08:28:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32216a52cso8372361cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Sep 2025 01:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757147332; x=1757752132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKdwIMsuOs8hXrBNQvvXPiZ2vNFLXyJWMTWiOB3kSMs=;
        b=YuU93LeUjjK24cmzBZRKiYA7FA1vAJ3HCz+HrukufymiLe/aQ3CZp/C6x4UFmaYcks
         Byhd3ufMbd9JPAnxwRQmZDgF2pwoS5hPNIidq17V4+YgCOUti2In50VERL7TxCTJdo4d
         F8JxOzqd+Sczp3wl1yL2eeUwaUgUaoQSIXiCsALcJb2BhlY5Ocn8ChvlH6glSDJNKkBV
         +76hucJI80Koz0kNYPHS9pn3derTUN5yQuJZgawVC6m8nkmtjO45QKrNB2C74OsZ1PAo
         LQ5GupLKPQCft8zfO+t8b4FtMe+A8XdjEXhWtBFjUeoAMh93BaqUCM2IPsY2bGHpGF+F
         Ie9g==
X-Forwarded-Encrypted: i=1; AJvYcCUePvVmUA7h3pE7v6osZM2RPPHtjQPIp8qZhlGt7o7F0sJWm8l2/L/iB4if9lNknztQFSjfTsp5s+0Nfdjd@vger.kernel.org
X-Gm-Message-State: AOJu0YwjosszpEPS3Y54KsJAOM3iw5E3q0uV1LQa6tq15B/lL+d2s5dQ
	EZkhmG6yVGk7mDpICwlUon7XXvs2g48Hafg9pLH0V3H9y9pVrOqdjeAdkyDMCWUydz0zPFpRg5E
	Udy8sDQV5o7GzllzdK8M3lRb5xL+8yKLt+130Tuv4DYDJvjhP3ywG9xAwJSkWcquvX5t6
X-Gm-Gg: ASbGncsVpBpQRlGKMQzgS9Uk6y9zR7TJ0F1hhYHctcsaCZFmMwzTdusCoPMYc/9HvKU
	rgazmaLoAGEciOsXtic+4pJNDiKG+PsW0ZMZgx2byFgo+b1mXd1xA93xejHFbxSCIbUvrvZCM/j
	qfyWZx/DDxzI7JC9XYhIoowFm4NsL632unMV2Jz8ipOGTrFsMX8I/9iuT/dUBFNiLgzYjvbfUe8
	4w0GI5pfsQTSHMqFatDZlFb7SRh4vmvCOh03z0dfKRZRMSohxNtDpOiqdC37qrRqOTgj5rzpQ0O
	xNpY/XbAciTWD9UZXFQa/QnDtjt+r9PbWAYQWXZ3pXJjGDKHuBz1T4M86kxLHQHTzgzyqolQSz6
	QufEmoERTIOQo4T1GI8UCEw==
X-Received: by 2002:ac8:5a82:0:b0:4b5:eb76:3c6a with SMTP id d75a77b69052e-4b5f8464b47mr9538721cf.12.1757147331625;
        Sat, 06 Sep 2025 01:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3y3GSyZNNkgjIVF+qqXTkBKrkNGyGUS1amXxGqYrBzXr417aU+8RqZGf0t3Sfd6GltOwwIA==
X-Received: by 2002:ac8:5a82:0:b0:4b5:eb76:3c6a with SMTP id d75a77b69052e-4b5f8464b47mr9538561cf.12.1757147330963;
        Sat, 06 Sep 2025 01:28:50 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm1548972366b.30.2025.09.06.01.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 01:28:50 -0700 (PDT)
Message-ID: <d3e96be4-8c78-4938-8072-abdb0f0e8f05@oss.qualcomm.com>
Date: Sat, 6 Sep 2025 10:28:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: lemans: Add SDHC controller and SDC
 pin configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
 <c82d44af-d107-4e84-b5ae-eeb624bc03af@oss.qualcomm.com>
 <aLhssUQa7tvUfu2j@hu-wasimn-hyd.qualcomm.com>
 <tqm4sxoya3hue7mof3uqo4nu2b77ionmxi65ewfxtjouvn5xlt@d6ala2j2msbn>
 <3b691f3a-633c-4a7f-bc38-a9c464d83fe1@oss.qualcomm.com>
 <zofmya5h3yrz7wfcl4gozsmfjdeaixoir3zrk5kqpymbz5mkha@qxhj26jow5eh>
 <57ae28ea-85fd-4f8b-8e74-1efba33f0cd2@oss.qualcomm.com>
 <xausmwmh6ze5374eukv6pcmwe3lv4qun73pcszd3aqgjwm75u6@h3exsqf4dsfv>
 <53aac104-76fb-42b8-9e0d-0e8a3f59b2da@oss.qualcomm.com>
 <zw6o6nxczrzz3dkreq2nuxalbrlv7jmra2hs3pljew7xnbuepo@b6rs47vnnctx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zw6o6nxczrzz3dkreq2nuxalbrlv7jmra2hs3pljew7xnbuepo@b6rs47vnnctx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX0AXcLE7Ah8Se
 vV/9f0dLRj1WotencYx3sCG6uZXucdmVAakB9HVsEfT3dmMJ7u2qx1/vWkyenLaIYBL8zWcZEeq
 CovrOCxh9yF2h6nKe0bb3iwf1e/YVha4gjXhKu6/P+LNvrMKLXrCB+In82hMfRuiSMwb71dWf9z
 rf+XHQXsOKjVOeq0ReTP/OfHosqdTp+QhlQ0QEzM9ju7RzcZA7VVZaUmmYzIVJVtrw77RnVdl36
 kb2CChygyJJRM36Joc5XahCJioOLKDo2jhNN+O5RHJDQL71AGgHi2MiofOdHudwuXCwTNg9aRgb
 hI4WHvo9SjOr9u7kYwcyZyTsBigBgZNChtKcQfKMLQTBJUTcHSRwVmjZDyfmdT8k42TcEFZNtxt
 etbjh5tm
X-Proofpoint-ORIG-GUID: rJZ5lZXMdTo3QMvAdkiV9pTonH04hVEe
X-Proofpoint-GUID: rJZ5lZXMdTo3QMvAdkiV9pTonH04hVEe
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bbf0c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pmlacQdDjGSF83KW4JAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/5/25 3:44 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 02:04:47PM +0200, Konrad Dybcio wrote:
>> On 9/5/25 1:45 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 05, 2025 at 01:14:29PM +0200, Konrad Dybcio wrote:
>>>> On 9/4/25 7:32 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 04, 2025 at 04:34:05PM +0200, Konrad Dybcio wrote:
>>>>>> On 9/4/25 3:35 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Sep 03, 2025 at 09:58:33PM +0530, Wasim Nazir wrote:
>>>>>>>> On Wed, Sep 03, 2025 at 06:12:59PM +0200, Konrad Dybcio wrote:
>>>>>>>>> On 8/27/25 3:20 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
>>>>>>>>>>> From: Monish Chunara <quic_mchunara@quicinc.com>
>>>>>>>>>>>
>>>>>>>>>>> Introduce the SDHC v5 controller node for the Lemans platform.
>>>>>>>>>>> This controller supports either eMMC or SD-card, but only one
>>>>>>>>>>> can be active at a time. SD-card is the preferred configuration
>>>>>>>>>>> on Lemans targets, so describe this controller.
>>>>>>>>>>>
>>>>>>>>>>> Define the SDC interface pins including clk, cmd, and data lines
>>>>>>>>>>> to enable proper communication with the SDHC controller.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>>>>>>>>>>> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>>>>>>>>>>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>  1 file changed, 70 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>>>>> index 99a566b42ef2..a5a3cdba47f3 100644
>>>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>>>>> @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
>>>>>>>>>>>  			};
>>>>>>>>>>>  		};
>>>>>>>>>>>  
>>>>>>>>>>> +		sdhc: mmc@87c4000 {
>>>>>>>>>>> +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
>>>>>>>>>>> +			reg = <0x0 0x087c4000 0x0 0x1000>;
>>>>>>>>>>> +
>>>>>>>>>>> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
>>>>>>>>>>> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>>>>> +			interrupt-names = "hc_irq", "pwr_irq";
>>>>>>>>>>> +
>>>>>>>>>>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>>>>>>>>>>> +				 <&gcc GCC_SDCC1_APPS_CLK>;
>>>>>>>>>>> +			clock-names = "iface", "core";
>>>>>>>>>>> +
>>>>>>>>>>> +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
>>>>>>>>>>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
>>>>>>>>>>> +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
>>>>>>>>>>> +
>>>>>>>>>>> +			iommus = <&apps_smmu 0x0 0x0>;
>>>>>>>>>>> +			dma-coherent;
>>>>>>>>>>> +
>>>>>>>>>>> +			resets = <&gcc GCC_SDCC1_BCR>;
>>>>>>>>>>> +
>>>>>>>>>>> +			no-sdio;
>>>>>>>>>>> +			no-mmc;
>>>>>>>>>>> +			bus-width = <4>;
>>>>>>>>>>
>>>>>>>>>> This is the board configuration, it should be defined in the EVK DTS.
>>>>>>>>>
>>>>>>>>> Unless the controller is actually incapable of doing non-SDCards
>>>>>>>>>
>>>>>>>>> But from the limited information I can find, this one should be able
>>>>>>>>> to do both
>>>>>>>>>
>>>>>>>>
>>>>>>>> It’s doable, but the bus width differs when this controller is used for
>>>>>>>> eMMC, which is supported on the Mezz board. So, it’s cleaner to define
>>>>>>>> only what’s needed for each specific usecase on the board.
>>>>>>>
>>>>>>> `git grep no-sdio arch/arm64/boot/dts/qcom/` shows that we have those
>>>>>>> properties inside the board DT. I don't see a reason to deviate.
>>>>>>
>>>>>> Just to make sure we're clear
>>>>>>
>>>>>> I want the author to keep bus-width in SoC dt and move the other
>>>>>> properties to the board dt
>>>>>
>>>>> I think bus-width is also a property of the board. In the end, it's a
>>>>> question of schematics whether we route 1 wire or all 4 wires. git-log
>>>>> shows that bus-width is being sent in both files (and probalby we should
>>>>> sort that out).
>>>>
>>>> Actually this is the controller capability, so if it can do 8, it should
>>>> be 8 and the MMC core will do whatever it pleases (the not-super-sure
>>>> docs that I have say 8 for this platform)
>>>
>>> Isn't it a physical width of the bus between the controller and the slot
>>> or eMMC chip?
>>
>> No, that's matched against reported (sd/mmc) card capabilities IIUC
> 
> What if both host and the card support 4 bits bus (normal SD card), but
> board has only one data wire?

Ohhh, touche.. I assumed it's "smart" like PCIe, but it's (probably)
not.

Sorry for the trouble, Wasim. Let's keep 4 for now and get this patch
merged.

Konrad> 


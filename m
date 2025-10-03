Return-Path: <linux-arm-msm+bounces-75926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BCBB792C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 18:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8354347088
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 16:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300222C21EF;
	Fri,  3 Oct 2025 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGG2VnIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117B2C21DB
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509397; cv=none; b=YKDC6qblFMQC2Q4f72xDGHWlzbVsTDzwbCC4ZQssIMT6o6FD2r7+/yl3P9wQ2cqvuYYhP2tnWggCrfY6p0c8nhk+kKsFYzvj5KY35ZQ+iEwSvn94fiPATemXf0OXXHVzXnaAPGK6hv+Ly9CfPVPNd1qEAm3Z+Gpy1CZjRQYNj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509397; c=relaxed/simple;
	bh=ZaijyCJq8RhriFIQ2yguFRQneneiApnJF7GrOU1k4fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXyoH905Nc31AB1JBlPY3SkllWQ/FTy32X1jbCUn8E6PI0IVhLxQDYKRVWAdhcR4Bzt/ghogmdh3b5TZaKcJg6lj6nPj0sUM7OLFwUfJ7m9ydvvYTRzFzDe9VGDluUHfpKzrnXnFTjVjeRwdQ4KxwfClaFgdzKuzq0rX5EGG29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGG2VnIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BXfNC018009
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 16:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFFx9CZBotui5rMyhpbxkDYfHjf5bD25BY8RnVU5vWA=; b=JGG2VnIR7XTqtlVl
	4IxPMVHIK/X4dPjT47V+B7JtLBInGEUtyQcjwj5PNnwx2Jy3bkfd0UQ6ie7IGu6n
	8NS/Dx2JuD+xZSj+2Wy/vFUsxm9yo2+YnVDsyTE4XmpNN9ipYdcr96Ru9hlDc8wR
	4Mt0q09y1x/4HpJKa8CliFQ1rBTXDPdx2r2WV2Z+8JZtyFbQZumBDRr/bI52wWgj
	Xbi9FsaW4lIZN71RaGgidMcAFXNa3UhDeG7s12PbIkkiK2/QRIgSvvFmz47s5BM7
	Uxw/AW5rAW1fwqsMWeNe6Tt7kwWtm+luOvCQbNPFStewoXpPhpULJiUjuhKVqgJB
	RqqvFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcvw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 16:36:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27c62320f16so24921175ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 09:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759509393; x=1760114193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFFx9CZBotui5rMyhpbxkDYfHjf5bD25BY8RnVU5vWA=;
        b=OxcjD3oIVqgA+9GpPqXpKbdlW+lopYHCmKU8gha6iSbYgbugX3eE6aRPDMhs4vef5C
         Ic70wsL86rsacae7+TB6dbIuAtfqu3tw8s9lYS5/X2XzO//VrJofzSV8LTNR9S4gKYyz
         4ux7DIpMahm2oHnpJOlz8r6p5PHYwwGoVnqDHa3JAztfbWLQ8QBiyP7FFrm2rbNF274e
         6YcF5B0NZsT+M97+Ned31Cw2rp1dIrSL+20izXkXqhVHpQoDcGenAnA8Hyz/00veANlx
         s8GMMvMILDkhDbMiElZ2E5a6/7XPYr+J5n67c+FtUoo9cYPlp63bcJzUMv3qv5XJ3Ib2
         Mx4Q==
X-Gm-Message-State: AOJu0YyJbLLhb9aZjUVyJD+G2Y7vhJ8wC2YxSaRqxP8UfDehjj/PXFEq
	S20PCEg62ry2CgW9ktqMeIyLDGAZXu9TxKJ1nqODa9A5ugcbDJ71q4MzQONitbn778QMiHMCriG
	q2pZsWTZcjupmHF4G1/rSdEUyOGfmiaeeG1B+bIxRV25Xg+bcvR6OLcdJY3Tm7Rp2PWLK
X-Gm-Gg: ASbGncvczMuoMvzk91yfJROwcGcoC3FkU4ctpNNoF/ZN4kNGfTqdEfDaACc3mm16cA0
	pd3+i+I5drNMTQaBuvAPIVgXV1JAMw4IklMW/Js4IuOZhbGKgNI8NBP+gCOxkW42WmOtLHMrjH6
	7ya2oKEBxORdU9AuibKV04ydV+J4953f5r3vjZsUrOhURJJJYCPpMZd3eneFYTqvysxQyUiYDs8
	WtXQJVY1yfard9Mbs1K2y8JPjwi30qj2pzxgNYeyOP6eowMC8JYl0Gk2hVlGJrKejPViB3hBkoM
	72rETPf6v6Xea9A4cTI7lnCwfkouUNaPjy1QO8t0AwzmlU+vqBdBt9bUJ97t6tpuT3j5wse8F5x
	3RmI=
X-Received: by 2002:a17:903:1ae8:b0:27d:69bd:cc65 with SMTP id d9443c01a7336-28e9a64897cmr46059315ad.45.1759509392633;
        Fri, 03 Oct 2025 09:36:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJKibX9WYsF7u8gjX03v+K3SueAafEPiiU1G1b/DGIlI/MZLepk+3L3tyJUhRRTfutSX8MKQ==
X-Received: by 2002:a17:903:1ae8:b0:27d:69bd:cc65 with SMTP id d9443c01a7336-28e9a64897cmr46058975ad.45.1759509392120;
        Fri, 03 Oct 2025 09:36:32 -0700 (PDT)
Received: from [192.168.1.3] ([223.230.61.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b878bsm54868735ad.81.2025.10.03.09.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 09:36:31 -0700 (PDT)
Message-ID: <b1698759-ef46-43c2-9e86-4bfe3736f731@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 22:06:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add OTG support for primary
 USB controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251002172946.589061-1-krishna.kurapati@oss.qualcomm.com>
 <ee0adfa3-f042-4d2a-adf0-2c5d84d79cd8@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <ee0adfa3-f042-4d2a-adf0-2c5d84d79cd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tzq1u0Sd13BWe0-qtj55dArOb28USP0X
X-Proofpoint-GUID: tzq1u0Sd13BWe0-qtj55dArOb28USP0X
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dffb92 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=QA6PZsKgKftjOHn1obVSzQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hw8d4qyt-kRrifida1AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX7aJtDAHXmSER
 GWEyZ5vIL6bOjJuZ8kSNvFGmtgCPUks/s1dynml1B0yhVNtAjI2cOCVJ6MFU8VHbgrFpU4UBrld
 gxhO/bDkH5h4cTQNBYO0EgzxoI/7jHSlagPdNS2ST9jVq9l0g+pBsv6thpjw17C8YHRklU9t84I
 Mzr4gE762G7nXAhVJOb/xkUSaq/y4HmFApOUaQP5uV6RqJVM6DypFnzVoXnFOz+a7bYIoImJyyb
 DkNKZFsPV6f1aDOJ2ausBytdWE8tIoGggjovRDhM4fCmMDJBu5aQ0yDq3AwrJA897hIaoJxn3E3
 0jj3LuyNl39qqXOSG1TJd27H5pVbHtDAIXEFcDebdU5wqZ9M3GjlVF1Uqnu/Plr2u5AgLPxosig
 lhn9ETypX0gIrLZEvJQyi1bWE0T/BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175



On 10/3/2025 6:57 PM, Konrad Dybcio wrote:
> On 10/2/25 7:29 PM, Krishna Kurapati wrote:
>> Enable OTG support for primary USB controller on EVK Platform. Add
>> HD3SS3220 Type-C port controller present between Type-C port and SoC
>> that provides role switch notifications to controller.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Link to driver and binding changes:
>> https://lore.kernel.org/all/20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com/
>>
>>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 122 +++++++++++++++++++++++-
>>   1 file changed, 121 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index c7dc9b8f4457..0b6d8d2d19d6 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -37,6 +37,32 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	connector0 {
>> +		compatible = "usb-c-connector";
>> +		label = "USB0-Type-C";
> 
> Are there other, non-type-C ports labeled USB0 onboard?
> 

There is another Type-C port connected to secondary controller.
There is one Micro USB Port connected to tertiary controller.

>> +		data-role = "dual";
> 
> power-role = "xxx"
> 

ACK. Will add it.

> [...]
> 
>> +	vbus_supply_regulator_0: vbus-supply-regulator-0 {
> 
> the suffix suggests there are going to be more - is that the case?
> 

The second Typec port would have another connector added. So another 
vbus node would be added.

> [...]
> 
>>   &usb_0 {
>> -	dr_mode = "peripheral";
>> +	dr_mode = "otg";
> 
> otg is default, you can probably drop it
> 

ACK.

Regards,
Krishna,


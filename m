Return-Path: <linux-arm-msm+bounces-43092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2029FA962
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 03:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE8FF1884418
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 02:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693D5171CD;
	Mon, 23 Dec 2024 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BuiyCQb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF22184E;
	Mon, 23 Dec 2024 02:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922062; cv=none; b=Qhwr+WdZbmGfT++jDVzxDNVZLtcjmEgz8l00/htfFVIOX1qYn1DZyBG5VcK94e3l8KYUkzoNTqYqwgQTLQ7r2+TqSYRUITWo5YT5Ao02fVBvHBD6w1Kt5NwGWxV2FJWQCBkccorAJEdFyDspjBMygnZtu0AYMMeg8j5fgQJbGHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922062; c=relaxed/simple;
	bh=nkgNXsoqW++NHxpadYs094XZDYjmIzYos5p6pRuddnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HjgqFsrwxL2RQugx0UEhIGg5fAdoFSSHTzL/yFzPcX5vsrNE3qHfiUCyFwrdchwqXTcfg6GMETxSY9jwHC2N1SDBaBdUtZ0lF1Nt5xWvRHqDWsj/sldw7foUBVYKr4iY85VCnbTzHZatY0Fa+YIwx69/DEBQF/ucVP1z1ZG9Nys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BuiyCQb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMCMaS0028860;
	Mon, 23 Dec 2024 02:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPKrapVVVWGcnjYH8nOSfxItt2fi/Z85ZO3JY9SDS24=; b=BuiyCQb8efVcFlqe
	Y6PstAK868Dl8ZlNk5cRnZZs65UgjM7ZY0ijFD9jdnPM9cTDAohBga2gZKhsGTfS
	JtSEhqGBA07ZYPvHVIcN+gba6xag4JOosPTtm9EMVAK85JCaMOduUCMzLfre+Yjr
	TMLS98vI1AmrqhNpJ8Udz2Kh58dNYLLvMxSk1h8ygmOKXDF8BD2j9b05EdbZGcK8
	cPZbrGjpE/pvvX3WB6ahNk/POIAh/pHJsAf9pKnik48MUydmb5ZLTe1Sku80efl6
	nkgn3YU+kfvk6DWk74x2igjRryHoa3XCE/ehFwPY0Mvt6UdY+JG9kdBN/UUXxrzk
	TdM0yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43p6v92uvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 02:47:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN2lKxb029716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 02:47:20 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 22 Dec
 2024 18:47:15 -0800
Message-ID: <3a8fe16f-aca7-482e-b1cb-e6fa37717843@quicinc.com>
Date: Mon, 23 Dec 2024 10:47:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support
 board specific nvm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-3-quic_chejiang@quicinc.com>
 <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
 <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
 <d5fe224b-7ef5-47ae-840c-7b6df21da816@oss.qualcomm.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <d5fe224b-7ef5-47ae-840c-7b6df21da816@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j2v-jFoDOpkq-CfStqgsPLNm9iD7stRq
X-Proofpoint-ORIG-GUID: j2v-jFoDOpkq-CfStqgsPLNm9iD7stRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230023

Hi Konrad,

On 12/20/2024 9:46 PM, Konrad Dybcio wrote:
> On 13.12.2024 8:05 AM, Cheng Jiang (IOE) wrote:
> 
> [...]
> 
>>> /*
>>>  * If the board-specific file is missing, try loading the default
>>>  * one, unless that was attempted already
>>>  */
>>>
>>> But, even more importantly:
>>>
>>> a) do we want to load the "incorrect" file?
>> Normally, there is a default NVM file ending with .bin, which is suitable 
>> for most boards. However, some boards have different configurations that 
>> require a specific NVM. If a board-specific NVM is not found, a default 
>> NVM is preferred over not loading any NVM.
> 
> So, if one is specified, but not found, this should either be a loud error,
> or a very loud warning & fallback. Otherwise, the device may provide subpar
> user experience without the user getting a chance to know the reason.
> 
> I think failing is better here, as that sends a clearer message, and would
> only happen if the DT has a specific path (meaning the user put some
> intentions behind that choice)
> 
In the existing BT driver implementation, even if the rampatch/nvm are not found,
BT still works with ROM code only. No fails, just a warning in the dmesg. For this
new approach, we use the similar logic. 

The fallback to load a default nvm file is due to each board has a unique board
id, it's not necessary to upstream all the board-specific nvm since most of them 
may be the same, the default nvm file is suitable for them. But we can't set the 
default nvm file name in the DT, since the platform can attach different 
connectivity boards. This is a reasonable way to approach this. 

>>> b) why would we want to specify the .bin file if it's the default anyway?
>> The default NVM directory is the root of qca. The 'firmware-name' property 
>> can specify an NVM file in another directory. This can be either a default 
>> NVM like 'QCA6698/hpnv21.bin' or a board-specific NVM like 'QCA6698/hpnv21.b205'.
> 
> Do we expect QCA6698/hpnv21.bin and QCAabcd/hpnv21.bin to be compatible?
> 
No. It may be different. 
> [...]
> 
>>>> -static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
>>>> -					    const char *stem, u8 rom_ver, u16 bid)
>>>> -{
>>>> -	if (bid == 0x0)
>>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
>>>> -	else if (bid & 0xff00)
>>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>>>> -			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
>>>> -	else
>>>> -		snprintf(cfg->fwname, sizeof(cfg->fwname),
>>>> -			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
>>>> +	if (soc_type == QCA_WCN6855 || soc_type == QCA_QCA2066) {
>>>> +		/* hsp gf chip */
>>>
>>> This is a good opportunity to explain what that means
>>>
>> Ack. This means the chip is produced by GlobalFoundries.
> 
> Please update the comment there
> 
ACK. 
> Konrad



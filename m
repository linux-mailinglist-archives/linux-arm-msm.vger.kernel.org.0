Return-Path: <linux-arm-msm+bounces-97320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE5aEcWws2lYZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:37:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3327E360
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCB4F301BA41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 06:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4547417A300;
	Fri, 13 Mar 2026 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Czp3QzsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krT1uXL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D071A3164
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383873; cv=none; b=dt6bJ93wVngYkHfZVRha6/FRDK38zR9cvXNELYKmmeTzKFyCWDEZBNDiB5yphnacaQJNnHA5K+OuTqlXwAYZYSSw6EWuvTcyBZBvDrOgzU7ZyDhBj0PhUUPE9fHw6fjWIVsvF860wEhZ0B+KaK9GoHMP3kz/aYDERNLqpPWGTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383873; c=relaxed/simple;
	bh=eXX32EnsrJtXZeC6ghwpSOVoFw7cQHT1FJ4A99lykxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaJu0FxPl0xV0uNl1sOqh2U6W7yh521CAuyR4LTM/CbZM3Q7qel+6OKvgrqQv4JJ/xwrSUs81EF4BVi2K9jx8zaq0Zg/hA2f+H/HWDMjdsTxw5qbwqW+mFSSco4PvMAeuzSRIm5KDmXUEtxpjjzq0r3wCuYoooJ3AXXjfibCxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Czp3QzsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krT1uXL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tmuN3844431
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEawz2/uulbkXKFxTMF08cT7BTaaWL0evQAKbAWCYMI=; b=Czp3QzsGCX64RXvk
	vGDXoHip8AhYmX03hJL+8vhjfRSAuykAyJgvUasng8zdXR6NWXZ8zo7JDjz/MlHf
	+IMGphMB++A9Y2SNQ0BovRd1IsrZoiZMa9noIraVvHuyR5bfNLzdKOzn66otKWsF
	57/DfnreXS346qP1cCBujaj7Lu9ujwjvOlASJrEPr2rqCKRjWzbzYrB/JQe6wTgW
	nRiGMHbtKkOSvwvNH8zbzlVJStUtSxuq5QpCCiV9++ndYzY4XYgZ+LtmxxrVWQTj
	O1w9iREFs1Wmjk1xoH7HKnORlbVZCZkWdBZmTEO73+kkdcLC5CxUzIZWQa3J/f8/
	6LKhuA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54vs08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:37:50 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-466f705757bso7576158b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 23:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773383870; x=1773988670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEawz2/uulbkXKFxTMF08cT7BTaaWL0evQAKbAWCYMI=;
        b=krT1uXL7JTJ8ZfvZjE9q0gpMImAN+oTnt4ofC0GHKBzByYGwW+R9mTMRt9tKRibSRR
         iulcIdI/99ODD18sOvSliZ+PR+Bizy7ip/zvYFXXToUvEaO8AFi1+pzTrvqEUkfAr3In
         1lCGQMwdZ4ajB4Pv/QYhKtKrgAlAbM/dgHiyoaA0pgR34NxKTweuDmkeVQ0NoJXSOfkd
         KgWSLJSGVEJYKb56NV3MgKy3T0ne7r41fI6TVypA5bO60hZLkNy1noURyop63wUR/3nU
         MgWKlrBTA+A7HTprxmG6MJaMJvv/e0KwxvEb5o1IBv+6vTPvO1+87Q413HIcoFPhg0wB
         KBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383870; x=1773988670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEawz2/uulbkXKFxTMF08cT7BTaaWL0evQAKbAWCYMI=;
        b=Cd+vWf2ArGvKAv0o0COhjtHb2SlmhbR9bY/pkjCdCc1SbmoAm2x2KPGaWFZH0aDFmz
         Qi/lF9H4sQyv8cadu1AcmexCoHry7zPoBIPWqNL5ZcwQeeoSuUMVrhVFwWzG5NrWxvVn
         tXDmw8Ui2tQDNbypLjOUGXzCzuZf7psD40NPG5fJeWcIkqIws/eMZJ5lewZIzhhaEA7N
         Iqf1S7xWJw1QPQX7FR92Wz/3HRbW9uk5DrqsFyWxBh3iuTKxDZPZ5Y0IWEGtFHHZftO0
         SdjtYbsGSqbw1kfjePtnPLUTS64xc6BiPXWIXxCAXQIFU4MiwERYf9I1MhBvYPas19wc
         oN3w==
X-Gm-Message-State: AOJu0YyBGDg+HX00U7H6hYTxw98k2bEoNVfA1LysHVGRGYxGSKJLgvor
	Ue57Zu5nWYlhN1cUTJzK3ijCLfF+26Yhsg2hh/pGVaNrPh7afeaFn+jHzR0lwB+3fnWWS7lOE8f
	Y2u88zlm5Vi+xNLVeh6NwtmPZNuxPVKOec9EOkd9KbMj9TFOyJtWVM1/olG7EGx4l3hHj
X-Gm-Gg: ATEYQzwZHoTN/YxbTB/W5Qy/HpMR0oibKsoUa9cLDTV00E/+lwdrhBHnVzJnYF5bWMj
	Eh+FLiNtE7zJfsGqDx8EyciLFyZEtc4m2SRQ4X+W80r/+IyFFid6x/uft4q6OY17s8n75FeDpgJ
	AX6ijCW7xB+tEZ15Z4FQpLe9a7ZVUQKKRXOnpBGIkJBnkWSzpRSxPlXaUrdAM4+nfijUsUfRHV5
	C7l4mJTM82H34pX6wN28hfCBNHQuPfYxXYRzkSwYuS97uBbjFCiN0TPfUI3+TbO9B7M9wVBYaCs
	LrN+c2mOFSZ16vSuysJPKOf49/KrMinvJ4t3kR86kN6drFDREA6W2y6lyc8iQ/7eMMb+Ube5Gd2
	pRY6O9O69lbGNBrzdzLsOG5PVBS6pUD0uhkfndrN2DU0IC8I=
X-Received: by 2002:a05:6808:344c:b0:467:1c9e:2121 with SMTP id 5614622812f47-46757037223mr1168929b6e.1.1773383870289;
        Thu, 12 Mar 2026 23:37:50 -0700 (PDT)
X-Received: by 2002:a05:6808:344c:b0:467:1c9e:2121 with SMTP id 5614622812f47-46757037223mr1168922b6e.1.1773383869856;
        Thu, 12 Mar 2026 23:37:49 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46743aca62fsm2856962b6e.2.2026.03.12.23.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:37:49 -0700 (PDT)
Message-ID: <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:37:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
 <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pjDrb2nbVVrOnmPT9KVo1MqItxGZdXUX
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3b0be cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Zpc01jWA_6A4uBNqY6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: pjDrb2nbVVrOnmPT9KVo1MqItxGZdXUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MSBTYWx0ZWRfXxO764TFABEar
 6cVrykEsnA+sVmCl4JSjbnrl3YbPPtv8vfu8KgPS52i9djTADIbZHOcUwAAWE6w0MXJWU6aIjCa
 4aok0tEzN+nsiRCPoC7mkKOcCjpzq0OlDZ+3mN/76Q14AfMTHsngoUMPFF8C2wb1AvR/OIxWhip
 oDaWqCaZ9WiSHwpPsf7sSt64DrZ2KCjERCfwNXecQnDogQ8sCkO3h9Enc5OJyroNCJzE3BiLBkX
 Y91y+zUz9zA7P90VS0OL+4ikLWWmog4LpVbvpEtUyO27TgA3676tDUTkxtVTeugaUW74lFaZWSd
 zPcyp52miT2U0WhbKLdAdMjeIO2GX45gnc0SmnLgN86BOk/KKfXhMjb0lwa5KZlcv1V+T0y7/Om
 R87P73UKRtYWS6hP24FnO5SyM6B4DjzkGKu+Qh8LnXnX/bDe8pKx0iA4zPKc255obdMCMWY0Bxb
 P4tcCGybxX6iHqDOvtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-97320-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0C3327E360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad

On 3/11/2026 9:07 PM, Konrad Dybcio wrote:
> On 3/11/26 10:09 AM, Shuai Zhang wrote:
>> When Bluetooth supports both USB and UART, the BT UART driver is
>> always loaded, while USB is hot-pluggable. As a result, when Bluetooth
>> is used over USB, the UART driver still be probed and drive BT_EN low,
>> which causes the Bluetooth device on USB to be disconnected.
> Is bluetooth connected over UART *and* USB simultaneously?
BT uses either UART or USB, never both at the same time.

On platforms supporting both, the UART driver is always probed, while 
USB is hot‑pluggable.

As a result, when BT runs over USB, the UART driver still probes and 
pulls BT_EN low,

unintentionally powering off the USB BT device.

>
>> Configure BT_EN as a GPIO hog so that it is controlled by the platform
> What's "the platform"?

hamoa-evk


>
>> instead of the UART driver, preventing BT over USB from being
>> unintentionally powered down.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> index 630642baa435..60a0b3ecbc1b 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -647,10 +647,9 @@ wcn7850-pmu {
>>   		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>>   		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>>   
>> -		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> What if I want to power down Bluetooth now?


It cannot be pulled low because it is not possible to determine whether 
the inserted M.2 card is UART‑based or USB‑based.

Identifying whether the interface is USB or UART would allow control of 
the UART probe accordingly;

however, no reliable solution is available so far. Additional approaches 
are still being explored.


>
>>   		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>>   
>> -		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
>> +		pinctrl-0 = <&wcn_wlan_en>;
>>   		pinctrl-names = "default";
>>   
>>   		regulators {
>> @@ -1398,11 +1397,12 @@ wcd_default: wcd-reset-n-active-state {
>>   		output-low;
>>   	};
>>   
>> -	wcn_bt_en: wcn-bt-en-state {
>> -		pins = "gpio116";
>> -		function = "gpio";
>> -		drive-strength = <2>;
>> -		bias-disable;
>> +	wcn_bt_en_hog: wcn-bt-en-state-hog {
> This name is illegal (make CHECK_DTBS=1 qcom/hamoa-iot-evk.dtb)


|I will use tlmm to control|


>
>> +		gpio-hog;
>> +		gpios = <116 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +		input-disable;
> This property is not allowed for TLMM pins
>
>> +		link-name = "BT_EN";
> This property doesn't exist


I  will remove it;


>
> Konrad


thanks,
Shuai



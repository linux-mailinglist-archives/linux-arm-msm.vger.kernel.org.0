Return-Path: <linux-arm-msm+bounces-71706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB1B41207
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 03:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADE93BFD4E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 01:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2818D50276;
	Wed,  3 Sep 2025 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAmTMmeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72B2C187
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756863924; cv=none; b=QGI09DfZx1hIIAvZvRX6y1TOdu4/h9gjW7YpWX0K4u5JZc8NrnBH37wWMLNUiLhF49wr9NV+fjGEULrstZHsLDUkPBWLJGr5q5jTMNs78c3TAgAPJuVTWvGqO0yWsnYRs7VHkTahxOcu7GRWnWDzgvzdB4jJu2IdkZESs1LbL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756863924; c=relaxed/simple;
	bh=FwZLZxIxYTadK2Kduz15dFpZ/khEoBz4UzAbFb6JWcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWD2O0+1mQ6aSbw1AqXjjygOSQngmKaPVCggjBiTA7BrbaUG94ULg5eyqlg22rrP3Cx4pRIcSqamPwmKMwLyAFoR8B0yNBAxQspK1ZqqCFBjt1kFu5K/fVt7An8aeOA07YPhcuUYpJB8HLY/umdoSFx7ELHXEVISgP0D57w9qgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAmTMmeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58310EUA024057
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 01:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSKVIY6OYbeZ9o9Z+5cggaWcqnF8AUnxpa/ouOb+evY=; b=BAmTMmeYz/zLdI26
	UdP/zJesx7wVFl//F4OTnvJ4Qt30IgchreDp84XnylpgCqegWdElUozRk4dlEUHp
	meAMA8ilw6GORIgES7lMb1L/s7h0NoHpOJ0fm1l7YUtjL9qfe9J504KUS4toI2Ro
	H9k+KlNTE6DZB3SDHDoSjEDtolMOGourju4JshBAohG8NlHMx3Z2UIv0R2hdLcA7
	johUpBTRzkHWq6aJ24MsQl2P6/a3O2xnZ8is4kMzLrGJLOZzdyzGfYbbIzt9galJ
	NzyzdiGxpEG7eNQSIOqxL0UZ/MziNK/xxrbFW+amR4bQGXLCFWtbwcntg2/9iU7K
	3VO05g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush31nws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 01:45:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47174c667aso4878189a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 18:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756863921; x=1757468721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSKVIY6OYbeZ9o9Z+5cggaWcqnF8AUnxpa/ouOb+evY=;
        b=gnqgq8eAi78FjY3dhup90CBYr/xiUXdeEFSQOvtmIbbbxsnhDh/3SGEToM5cX5a49R
         gO2+PVKnDx3e3klMf9r2bEZKDVjLUAk5ZfTySv3Js6JUsxqre2yuCJny5L6M7O4Aw/Zj
         mLSAnmvPh1iuIsjOxjdMBRyVFsSHbw8sLnc3z9T/uk+iZEVlZGBwDXn7iVmifpwsnQOG
         SFwreocpduSG9YyAfdKOaWQmLxV/nbU1ZsCaoRIScaPhHoL9ZO58KGhw0M0CA80fCt2z
         c00R6QB9PQ118WSeFHT3Z1sjardbmJoa5P3J80tyw2qANOLyFdvaoME0YtYx7ZFhKzbR
         p8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW3vvlZklea21w+fRQ0YYPD7To/J/tR9nHSiqGpq/SFyOxhmlwEVEi60gpC6+nhdyXrAQOsb3x2fa3ucXO5@vger.kernel.org
X-Gm-Message-State: AOJu0YyWk1EYQTHBm2tp+AYjl2Us/RKJvaJGUz+12+Cf5t1iBdOjWfUm
	ME2qNKx5L5GdzL/J32zArpgCZncGeiV2O2hgW/uFUsvRxzRG7TzWOJcsuX9i3snQVYkEJ3aB/xJ
	Y9uq9iE/jBrzYI0mZC74YLMF4Ih77rKZf0xS0hFFgNYrpkrVj6KKEc6JlcC18YBT4+8BW
X-Gm-Gg: ASbGncvu8RGHRxUKA0CjDoIEux0m2lVfOyvChu96qR8Jky6LmfhNUqP+8K0hrRZYyPv
	gIjxYDyvn+H5jzd1vci+wE3H3NRz2rS6ZKWvRndAipzsIrmBP8/ywuNXcjPJ/3AFYAgb9fOHaJZ
	hc4b4IzXUArcCOoCbuey8A+KItFFQMMXj1YVJ+ViBDvs2CZ8TKIksjJsniCxLNtgv6wY2GUzcSX
	BLFPx4ewbf6sAewzVGSIWcLb/fkvChXXzDbMik2kL+EKbmYZurMCT6ejdM4D9UIEquIqSKuqKXw
	sTVfJ3gst5UxSbDudR7qWjKr3pFjdJAlaGtxrwiA53sU6zj41W/FVwuuLhtUZErZYrELXhILi3b
	jx3iOlhMDvU/mesCEyToQp3WgJpfvCXNLhcA=
X-Received: by 2002:a05:6a20:2447:b0:232:9530:2300 with SMTP id adf61e73a8af0-243d6e00b1cmr18787169637.18.1756863920530;
        Tue, 02 Sep 2025 18:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPcu7WQqWP/xkbBlXV4L0CiyF0ufiS+LD89LO/RgiStFAaC6nkWqXiyzMSSMmTsSRTo8KIkA==
X-Received: by 2002:a05:6a20:2447:b0:232:9530:2300 with SMTP id adf61e73a8af0-243d6e00b1cmr18787140637.18.1756863920013;
        Tue, 02 Sep 2025 18:45:20 -0700 (PDT)
Received: from [10.249.10.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f992d3de9sm2574010a12.14.2025.09.02.18.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 18:45:19 -0700 (PDT)
Message-ID: <52c1f77a-b3b9-4c4f-90b8-1ff2ac042724@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 09:45:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
 <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
 <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
 <0c2a4877-d63b-4650-b7d4-a06a2730c73c@oss.qualcomm.com>
 <zoogyjua4l6e2bgsvxx7w26n6v2hwnp2pvkizzzsds3c6cgaag@2bvqdl2z5ds6>
 <4913e937-3892-42ac-8145-cc9c2364242c@oss.qualcomm.com>
 <snery6acisgvxtofsrbbqtpoirh5ffyha64lz4zekg3kvwrsyv@tfyydedc7ddm>
 <ae4ef090-7edc-49f8-a964-090bb94ff097@oss.qualcomm.com>
 <7sd3rvvwnte7dub6vuywi6np7rig547ugfpu626ruufx7psrds@igqdchhianju>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <7sd3rvvwnte7dub6vuywi6np7rig547ugfpu626ruufx7psrds@igqdchhianju>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4IqwfSLrekNW
 WP/WzeSBVwCLsTmX+IUi3rLNrE39zZQg9p0zGRaunOlzYCzS2zIdvDeX3zb676iHR8qXJVktpHb
 0uGYy7Jeng0NyGW1vgAfKRsnfLqh+qL1nNIknFO3DXvAup5L1JzLILQl1yiRUrPzfAoDQx+OXP/
 7vsSa93KHtE1FHvUEo7EsGGKrK5Ch6UGW6DJqkwaBWz1+LIqVhXJeDPhNPVSDKsE7U/yUikd3i0
 LxO83NH6ZEBRP0mLSM7GfvRunaWcU54e1KvsvX2y0/6OX07OAkwO0nIQy8v9LHfuZPWjFbh5+Qp
 NIouYJBc7jllgtxpI7XEe41n8WpjBXfbdiidZxcO0DRFA1uEA8yP6h9397R0QIY5+8n6hg31gtQ
 Qmrh1EZe
X-Proofpoint-ORIG-GUID: x52HhLK0DaoOoz-hcQVNJ83NcyQrl7jr
X-Proofpoint-GUID: x52HhLK0DaoOoz-hcQVNJ83NcyQrl7jr
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b79db1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=-S4KrNXkqzQhTUXETMwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 9/2/2025 9:56 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 11:23:28AM +0800, Fange Zhang wrote:
>>
>>
>> On 8/28/2025 7:02 PM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 28, 2025 at 01:12:14PM +0800, Fange Zhang wrote:
>>>>
>>>>
>>>> On 8/28/2025 12:41 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 28, 2025 at 10:57:41AM +0800, Fange Zhang wrote:
>>>>>>
>>>>>>
>>>>>> On 8/28/2025 4:01 AM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
>>>>>>>> From: Li Liu <li.liu@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>>>>>>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 150 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>>>>>> @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
>>>>>>>>      		};
>>>>>>>>      	};
>>>>>>>> +	dp-dsi0-connector {
>>>>>>>> +		compatible = "dp-connector";
>>>>>>>> +		label = "DSI0";
>>>>>>>> +		type = "mini";
>>>>>>>> +
>>>>>>>> +		port {
>>>>>>>> +			dp_dsi0_connector_in: endpoint {
>>>>>>>> +				remote-endpoint = <&dsi2dp_bridge_out>;
>>>>>>>> +			};
>>>>>>>> +		};
>>>>>>>> +	};
>>>>>>>> +
>>>>>>>> +	vreg_12p0: vreg-12p0-regulator {
>>>>>>>
>>>>>>> I should be more carefull when doing reviews. I thought that it was
>>>>>>> pointed out already and didn't some of the obvious things...
>>>>>>>
>>>>>>> First of all, the nodes are sorted. By the name, not by the label.
>>>>>>> Second, there are already regulators in this file. Why are the new nodes
>>>>>>> not following the existing pattern and why are they not placed at a
>>>>>>> proper place?
>>>>>>
>>>>>> Initially, we referred to https://patchwork.kernel.org/project/linux-arm-msm/patch/20250604071851.1438612-3-quic_amakhija@quicinc.com/
>>>>>> as a reference, but its node ordering seems a bit unconventional.
>>>>>>
>>>>>> Would this revised ordering be acceptable?
>>>>>>
>>>>>> ...
>>>>>> + dp-dsi0-connector
>>>>>>
>>>>>> vreg_conn_1p8: regulator-conn-1p8
>>>>>> vreg_conn_pa: regulator-conn-pa
>>>>>> regulator-usb2-vbus
>>>>>
>>>>> So... Existing regulator nodes have the name of 'regulator-foo-bar'.
>>>>>
>>>>>>
>>>>>> + vreg_12p0: vreg-12p0-regulator
>>>>>> + vreg_1p0: vreg-1p0-regulator
>>>>>> + vreg_1p8: vreg-1p8-regulator
>>>>>> + vreg_3p0: vreg-3p0-regulator
>>>>>> + vreg_5p0: vreg-5p0-regulator
>>>>>
>>>>> While yours use 'vreg-baz-regulator'. Why? Don't blindly c&p data from
>>>>> other platforms.
>>>>
>>>> Got it, The revised format will be:
>>>>
>>>> + vreg_12p0: regulator-vreg-12p0
>>>> + vreg_1p0: regulator-vreg-1p0
>>>> + vreg_1p8: regulator-vreg-1p8
>>>> + vreg_3p0: regulator-vreg-3p0
>>>> + vreg_5p0: regulator-vreg-5p0
>>>>
>>>> Let me know if you have any further suggestions.
>>>
>>> What's the name of power rail in the schematics? vreg-Np0?
>>
>> I reviewed the Ride board schematics and found the following power rail
>> mappings:
>>
>> VREG_1P0 -> DSI0_DVDD10 / DSI0_AVDD10 -> ANX7625 AVDD10 / DVDD10
>> VREG_1P8 -> DSI0_AVDD18 -> ANX7625 AVDD18
>> VREG_S4A_1P8 -> DSI0_DVDD18 -> ANX7625 DVDD18
>> VIDEO_OUT_VREG_3P3 -> DSI0_AVDD30 -> ANX7625 AVDD30
> 
> Then it looks like regulator-vreg-NpM is okay

Got it, I'll update v8 today following this format. Thanks!

> 
>>
>> would the current approach also be acceptable?
>> or we need configure the power supplies strictly according to this mapping.
>> Appreciate your guidance.
>>
>>>
>>>
>>
> 



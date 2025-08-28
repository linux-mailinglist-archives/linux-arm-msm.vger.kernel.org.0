Return-Path: <linux-arm-msm+bounces-71064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C763B392CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 350D436734B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 05:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1D7265298;
	Thu, 28 Aug 2025 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J376A0hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DC9625
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756357946; cv=none; b=q8fslwKF/nf3adsgwQgX0+w6IlM3fw3paO+oxG9Z+ISfa7G07VUrRzqjv31LzpZK4o0puzcEI8aHgVXHEbvGSOPoS+xcpagumaKZPMnEZIoYvEJrXs8RNqzrISUOwuHfEV70cCKLlKKQavKwUtDQXkPxpg9/kTb31uslc0uZ3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756357946; c=relaxed/simple;
	bh=clAMrz6KLy6NUqRmVn9yJ6X0kICZUVETZorxJPhYsiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2jIvmsQcSpFwm648qZ591TMa9qSaV3hZghBGZBTQKmaWkrnihiq0a7iOLEYCFK05WtFmwnlwIinA2oNbo3HgxCNP27xrWEfYD3Um07JIYDsMtJ8EwRQXDSQiU+UPJcLgkf+oTEcrrX+pWZpxf15TVP6mMAiSmHKmkBOj43HDuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J376A0hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RNSA7g007869
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usCl6mH6TNDrCxedB4k41lYzPFlB63q5zEaGSKGtmmE=; b=J376A0hjMF+USnNY
	+Cyg1BTQ5zLKQ/NTOVCzyaC79PdE0+gHhv4fOKrlCf289/kFLzatyOAtJ/3BQa2L
	j6SQrl9/39KpMtUJkgafiE0hzciUA6KOBlbaFUC2ZLzNY+J4fPIt/WWKxmkh9+Xy
	1IQBFr22A4P3JUtQ20gg8rRbKO3VVZ2HZjCslQCp/tzzPHTp4XWRSl8gIEdFfyTQ
	U0+TuRMUQqkABI5+jaqGq7QC6N85g6iIdOApGOPAvRp/t89IVtG/kJH3H/G3v2Fq
	5883I1mUUSfV5F1bLUaJz7zmTlUROiBzws7gSuj8FUatn47aO49mLQByCrSR+szj
	tM17TA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpggqkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:12:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4765bf9ed2so509180a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 22:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756357943; x=1756962743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usCl6mH6TNDrCxedB4k41lYzPFlB63q5zEaGSKGtmmE=;
        b=Z9rV5PEnBdVCWlhFn6sHVCoojX68Jh4HG/Jq3Aw6mwDLGSB6QeNLg8I6sdUjZhoMSH
         /A/O1RU+dcLuH5ZdVjExTQNrh9FaS9s/XUOp+eO+z4mvHUdFwBSXNTnxJEaZFsdXw+76
         Ajc1zu3dkix8Cs4g1NPOnQYN/8S7Dr9ObmC0uLJLEPkM/saP9WM8ONL/afTAVHP+LDOL
         ViAOr+VGyY2dD4aV3hLpBpPn5RADuThMd3JdJhr9ByYUsNIJ/Fd7UAldzTzCt6uk57JT
         OEV4ZIopiB40/dB+K8fGIYceIhHdwvq13swrV9+kKy/WpqwDtA4fz5iVHKmBJVYa7amc
         pvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXh2NvdIHX90/llvBWnGBb6R2TgsfYHrMWhq3IglrJwvT7euDJrp15IcKrf0cASiGzyCJkUUgw/UzVZhkt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2t8vVrWvDwCRs0+5sVnzktHTJtgCEwY2HSuMf0JMwPpLKq2AT
	KSfIjm9bYkYCWUAWkPNzNl6LTm096RS4Z5APGSf/jAU0qYHjNI59ZwLjPogEnYqofLVySvJYTnk
	ZdAUy5QLHag+gf0zkFLDNAWdem2fjV/i4QA/8kox2bciYSRi98+AGlmMvnzFfzWnI7dGm
X-Gm-Gg: ASbGncsO1+70o4sducOMfzX8rMAqx318OaPt13Ji035ELN4rwxALr2MFNe9FY/XdDWn
	4zmf4Rql94tmip+Q6LKucb9L9fi3LkV03n0IL9X4nlXeinbiUq7JZ+dzathLuq75hgaAGr5q8ya
	O/Sl6TKlzmjp8ySLiCbkfGxkCkR6pFmwz3tPAQPzVASruK5wfEgY/gTrpemHTZpncue1RZsuMDF
	5uz3my7QKrtnnIKQ+EEvtDMj45VVvs3jjZ+Xoxm4Q0TDddKXe7hEMOII2sXY/lQTVWPuYWctuz8
	fiyUNODohV66E4H7t5nx9VvYAx0kUFAci38c/Fsb85AvklyJFnrysxFZE7vHlAzJCMNWdUky7Qv
	2AtPcyRUFmIpwVWnl/SaCPhVTKDt+u8266js=
X-Received: by 2002:a05:6a20:939e:b0:21a:e751:e048 with SMTP id adf61e73a8af0-24340d7bb9emr31194781637.35.1756357942466;
        Wed, 27 Aug 2025 22:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh2Imy//naH19O30FjkWLd+lhOsGWdcbs2fB+COXPig7IKKsbqvmFGL0Zqk34EsrYRm2Ayxg==
X-Received: by 2002:a05:6a20:939e:b0:21a:e751:e048 with SMTP id adf61e73a8af0-24340d7bb9emr31194743637.35.1756357942007;
        Wed, 27 Aug 2025 22:12:22 -0700 (PDT)
Received: from [10.249.30.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb7b5ca9sm13008126a12.0.2025.08.27.22.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:12:21 -0700 (PDT)
Message-ID: <4913e937-3892-42ac-8145-cc9c2364242c@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 13:12:14 +0800
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
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <zoogyjua4l6e2bgsvxx7w26n6v2hwnp2pvkizzzsds3c6cgaag@2bvqdl2z5ds6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MD7cukxLys8epjXuVzGb-AJBhc4lioz5
X-Proofpoint-ORIG-GUID: MD7cukxLys8epjXuVzGb-AJBhc4lioz5
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68afe537 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=V-We5vXZukcDR5633V4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX2SGZiwRI1jeA
 y64V5qufiKevQxnN0eQhkA/t/pk006uVkkOKDubYuVJzSwcexYGumHMdDm6K6r54vzWxT1qyHxG
 b9SoG6Q0zYYUq+w6XK9a0zviXAbtg0V5U1dsat8zjl9DRBph7kcfXSMZaBNXpGjX8deJ6RcMbul
 MN2pn7n1egGzCGRGSTFTCi2gy6vLfQG4HNNQkJs1cSh6g8wsIKGXGKbzO8n1hx9j+UKtg55IEun
 vZwpPRZK6O6mXukEgitBU+hEon2lZxf60V0hSBXqhUQZZySTw16QbY4oceBWXx2YQ9k9bl1Mfvv
 2+xBtSk7vA6qKP/Vj5HOHKkbv2GN89Gu3uU8d0SlZgL0Ze/R9gpnR4oABbXoQ9Njm7C9DC2uwaW
 uvzu3f67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199



On 8/28/2025 12:41 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 28, 2025 at 10:57:41AM +0800, Fange Zhang wrote:
>>
>>
>> On 8/28/2025 4:01 AM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
>>>> From: Li Liu <li.liu@oss.qualcomm.com>
>>>>
>>>> Add display MDSS and DSI configuration for QCS615 RIDE board.
>>>> QCS615 has a DP port, and DP support will be added in a later patch.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
>>>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
>>>>    1 file changed, 150 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>>> @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
>>>>    		};
>>>>    	};
>>>> +	dp-dsi0-connector {
>>>> +		compatible = "dp-connector";
>>>> +		label = "DSI0";
>>>> +		type = "mini";
>>>> +
>>>> +		port {
>>>> +			dp_dsi0_connector_in: endpoint {
>>>> +				remote-endpoint = <&dsi2dp_bridge_out>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>> +
>>>> +	vreg_12p0: vreg-12p0-regulator {
>>>
>>> I should be more carefull when doing reviews. I thought that it was
>>> pointed out already and didn't some of the obvious things...
>>>
>>> First of all, the nodes are sorted. By the name, not by the label.
>>> Second, there are already regulators in this file. Why are the new nodes
>>> not following the existing pattern and why are they not placed at a
>>> proper place?
>>
>> Initially, we referred to https://patchwork.kernel.org/project/linux-arm-msm/patch/20250604071851.1438612-3-quic_amakhija@quicinc.com/
>> as a reference, but its node ordering seems a bit unconventional.
>>
>> Would this revised ordering be acceptable?
>>
>> ...
>> + dp-dsi0-connector
>>
>> vreg_conn_1p8: regulator-conn-1p8
>> vreg_conn_pa: regulator-conn-pa
>> regulator-usb2-vbus
> 
> So... Existing regulator nodes have the name of 'regulator-foo-bar'.
> 
>>
>> + vreg_12p0: vreg-12p0-regulator
>> + vreg_1p0: vreg-1p0-regulator
>> + vreg_1p8: vreg-1p8-regulator
>> + vreg_3p0: vreg-3p0-regulator
>> + vreg_5p0: vreg-5p0-regulator
> 
> While yours use 'vreg-baz-regulator'. Why? Don't blindly c&p data from
> other platforms.

Got it, The revised format will be:

+ vreg_12p0: regulator-vreg-12p0
+ vreg_1p0: regulator-vreg-1p0
+ vreg_1p8: regulator-vreg-1p8
+ vreg_3p0: regulator-vreg-3p0
+ vreg_5p0: regulator-vreg-5p0

Let me know if you have any further suggestions.

Thanks,
Fange

> 
>> wcn6855-pmu
>> ...
>>
>>>
>>>
>>> [.... skipped all defined regulators ...]
>>>
>>>> +	};
>>>> +
>>>>    	vreg_conn_1p8: regulator-conn-1p8 {
>>>
>>> Tadam! It's even a part of the patch.
>>>
>>>>    		compatible = "regulator-fixed";
>>>>    		regulator-name = "vreg_conn_1p8";
>>>
>>
> 



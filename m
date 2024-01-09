Return-Path: <linux-arm-msm+bounces-6841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89763828F56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 22:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3F7EB209D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 21:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6843DB87;
	Tue,  9 Jan 2024 21:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WewYTVQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DB3DB84
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 21:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409L9tLt019170;
	Tue, 9 Jan 2024 21:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gF65zN3fZ/bv/jCZHzzEHAnO1tSXedmWZcmQmp291xg=; b=We
	wYTVQDc7W6WukSY5HlT1LJFXQFVgqdrItLW47BC+LQAi7STG3skQHntVRtlzTT3N
	umXTr+2qoc2WBhVDqgbbFfoMqsvZitV2G4SN25NfLJk18pdDDgieS+dAbMPsK08f
	XIqOiFJDVztEe4FnpI/40Tj9Wcv4pkVMEI1XupwuvqkRuBzXv+9qVRTys188bMK7
	ftnibET3aFYG536iwbPVEHzH9Rdnaf08dGHJdeS870r23yoJlQXW/hdET2OHk4wf
	8bKG22uSnkPUdWWMAlZrY0ZhmXMmljyxRbuchampii7rlfHHUUSv49BUvyvNL27R
	qkARV681rurajG7me5Xw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9vfgnup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 21:56:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409LuViq020253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 21:56:31 GMT
Received: from [10.71.108.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 13:56:31 -0800
Message-ID: <37ff80b1-62fa-45ce-b181-955cc887d47d@quicinc.com>
Date: Tue, 9 Jan 2024 13:56:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
Content-Language: en-US
To: Brian Masney <bmasney@redhat.com>,
        Shazad Hussain
	<quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Eric Chanudet <echanude@redhat.com>,
        "Prasad Sodagudi" <psodagud@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com> <ZZxgCKQmQdUL81pX@x1>
 <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com> <ZZ2-P1xzsDwk91Yq@x1>
From: Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <ZZ2-P1xzsDwk91Yq@x1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -CUg7fooChiaC_VHHOTSQ_4-AO4sYc5S
X-Proofpoint-ORIG-GUID: -CUg7fooChiaC_VHHOTSQ_4-AO4sYc5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=770 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090175



On 1/9/2024 1:44 PM, Brian Masney wrote:
> On Mon, Jan 08, 2024 at 03:35:55PM -0800, Elliot Berman wrote:
>> On 1/8/2024 12:50 PM, Brian Masney wrote:
>>> On Mon, Jan 08, 2024 at 11:44:35PM +0530, Shazad Hussain wrote:
>>>> I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
>>>> enabled before this particular clk is enabled. But that required
>>>> power-domain I do not see in the ice DT node. That can cause this
>>>> problem.
>>>
>>> Thank you! I'll work on and post a patch set as I find free time over
>>> the next week or two.
>> I think I observe the same issue on sm8650. Symptoms seem to be same as
>> you've described. I'll test out the following diff and see if things
>> seem more reliable:
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index fd4f9dac48a3..c9ea50834dc9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2526,6 +2526,7 @@ ice: crypto@1d88000 {
>>                                      "qcom,inline-crypto-engine";
>>                         reg = <0 0x01d88000 0 0x8000>;
>>  
>> +                       power-domains = <&gcc UFS_PHY_GDSC>;
>>                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>>                 };
>>  
>>
>> If yes, I can post a patch for sm8650 if no else has yet.
> 
> The intermittent boot issue is still present against
> linux-next-20240109 with the following patch:
> 
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -1556,6 +1556,7 @@ ice: crypto@1d88000 {
>                         compatible = "qcom,sa8775p-inline-crypto-engine",
>                                      "qcom,inline-crypto-engine";
>                         reg = <0x0 0x01d88000 0x0 0x8000>;
> +                       power-domains = <&gcc UFS_PHY_GDSC>;
>                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>                 };
> 

Things have been a bit more reliable for me after adding the power-domains.

Are you getting stuck at the same spot or somewhere else?

I've been looking at a similar issue to [1], so I wonder if maybe you're
facing that instead.

[1]: https://lore.kernel.org/linux-arm-msm/20240104101735.48694-1-laura.nao@collabora.com/T/#m39f7c80b59c750ee4c0082474c5c15b6055927ef


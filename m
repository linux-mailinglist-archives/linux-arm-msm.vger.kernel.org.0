Return-Path: <linux-arm-msm+bounces-109998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFrMLEjyFmo3yQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:31:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 163BE5E4FE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A60930530D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A7540F8E3;
	Wed, 27 May 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wt6ZH/uI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKACRtdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF492BE02C
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888237; cv=none; b=IXBQ6sO+9B+19U9/Th7Usf1HiLgStyrcC7rGqKf45ESLkjHOQ1zXCNe+iA3lHm/K4lKk8N5vFHUmjDX259GntUUH9PlYLEpDkbWiYBZZE29VMYF3onOrO2TzahjTKVTTvBXpyRE1X8VpRLrPkF/3+jaQSnvx47g1klDbzF/ZiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888237; c=relaxed/simple;
	bh=fZEirdPhsiXXXgzeCpAJ/Yl+U0Bn3pFVopZz2C1bxzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyPqKnUdTUAWFdQG5oJh0oOmcM5+Fk8cyvW/eZRDV7PoFhIFphexruDxWhF/foC5EF3HJS5tPB01nXU79+X5WodeyN7PFueW4v+bN2vi0L0a8uaJTfv2HV0LvIUJBGw5Rdp20J1vMdZFWzY6eI0xyEmvzhbpCHgWsKBduVl82WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wt6ZH/uI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKACRtdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mS4J2282541
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/gnMR6HFXrUp4eDo7X8GSCD7DZCtPox7sItISbE2X4=; b=Wt6ZH/uImYVEEPcG
	Ip6vnNXu9AsxYJG9KYAe1Y3hvhVVk2+u9tO1pofDCEobgLXyrPNaox5XcmDQ8P00
	nn+d1kTmbcCqPo2vqKymZTtlzxybHVBMh6tq/ymwP646AIGHvDFEKa4iwMWcm095
	iChib0AoEqsDk+GFOD3ZkWeXnZFd47KmMjE9nKkxzbohtZe387Lqql4VMekdownc
	6OxemKIzy7qBMxJ/85wKxY1mNhRoAate3tsArGbRB/vcYvjjltXSMD2U2qVVh2Gb
	unm4EMQZaecDHkc/Bv3V9cVwtebidNuQbPByR1v9XUtlYgMqCriMujGrBJKmaUGJ
	yLoB1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcskmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:23:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso6988640b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779888234; x=1780493034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/gnMR6HFXrUp4eDo7X8GSCD7DZCtPox7sItISbE2X4=;
        b=MKACRtdUWE/spmo/p2MBYBD1gebfF0XEjj5GJJuuQ88aquT8HorKi4JuJW4pZj4fYB
         2G4D9G59zWAzkbZe11QGbBHSh2nK3ZmvC2gDz8P62dGsMyEskkcbrM950ubY164h6mgU
         ZmrdHp8GzFBLoW/zEad4pAz35lSTyehQLNL3RrEzBAE3KhCrekvEY/bcIHDAhOvz8yje
         G10yu1GDSbabG0ZvMbrUgD//DqW6o11zaGEdlN31WoK4/LXWx4GI5WM5UHp4E3XlRCUP
         Fzv5ERNqWj2YdC3YrAuKjIKUnhFfPKUT5NMt5A5hWqqtzOXRofoccWKLEETyfFzfjIK5
         bskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888234; x=1780493034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/gnMR6HFXrUp4eDo7X8GSCD7DZCtPox7sItISbE2X4=;
        b=c2eZsDl8+joK77AQ35UUUmaU3x+hNSMqc3C/i5RfTjEXyYpMIDM3ZKdiDqHjTMNBhX
         FF/uco/lPTxJHPCbgyGxZHxRsR8dszNJyQQahfop9pw36BJ6+iR9Q5E03RxX40li9lJU
         Jjq/KFNah3lFsLaQ8D6LaLYlI/Rms6fRIHTwWlKZ+Lem8a71Mkou2hf5Nag905XQh9Hu
         6PcLzdjJvcaWJnyhgKQ9522j/lJ1uE6LFaxnU1uYDBHy9om5PAieaTFAoH/xVx/k4Ejd
         1WJ9SOpMI0ard02QV+J4JAYhk3YDdtbZyoQ3/oAK9cAJtzsBlchI6hQ97Lmg8TBx1wIZ
         68mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v5Dw0RMoTu0hbFq9KRZZqhn7f885QMS0sXI/UFejDSadAXpucwPDe5pox+QgkNxTeYLaxP7IQSaMXHanh@vger.kernel.org
X-Gm-Message-State: AOJu0YxOxarizqsNbzoSo1dZ7QwHsD8TM1YlLqP8okChWiOkg58TOFIX
	JwvIX+i7mVgL1d8iHZMnLwI7mepIZlL/5hrWcXUSb/3yqoujnd225+OlTgyEpJFsE04TRkiJZQ9
	bXrvtVSzLPzmi2gfDXbcSbdAV5rIOZq6F9J7JPMpDcfu4gtZpOAG48vnFoHyHvPTTfj+w
X-Gm-Gg: Acq92OHzqlRtlpep+x4lCQc5m8ntFq3FdtmIZT6QQs8gDObCmR22BaK96BPiC3rPYLK
	Y3wIG+uWKjgw/CXR9dWknnjGTn/tto0XjCDUuIeyKSYGVzpzLkVU53Ep0gPxyb5Ijz6lvm+JKbb
	XcTJWpQrn2i8wrQ1f6nal4tqXEt0rY27O98I6bwE1A/bBg7BpjsTnwK9gTVu+ww7kM3cbet0Ah+
	iS8cA8QTlOTzgh3kqR5ZNxiQ7rsttRvoLtJdQiTN5+IszO8PA4mPe3r1ukHbkdpDmUR+6ONRhnJ
	HGb9n2bGCBToIP/GwqFiBI2Ky7LkwkaZIs9ZDLvcW/XD5M7dfbMqOsAy8db8AJaNXat5fkZH/Qh
	SJddwyYywW3K9viXc8kSCGFOQOPqGkGjg8qbIBoWTxkjQQEzDi9SoyVtN1QFS
X-Received: by 2002:a05:6a00:194f:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-8415f307755mr21996060b3a.32.1779888233818;
        Wed, 27 May 2026 06:23:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-8415f307755mr21996009b3a.32.1779888233257;
        Wed, 27 May 2026 06:23:53 -0700 (PDT)
Received: from [10.219.1.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eb0313sm3374638b3a.13.2026.05.27.06.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:23:52 -0700 (PDT)
Message-ID: <30a33da1-6424-47f3-9e7e-a09ca61a1234@oss.qualcomm.com>
Date: Wed, 27 May 2026 18:53:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>, hbandi@qti.qualcomm.com,
        rahul.samana@oss.qualcomm.com
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
 <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D02WGDM7XFFPc7yJqKLLM8cbgZ_b1Hr5
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16f06a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GjFf7XSWKEao_LXfqQMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMCBTYWx0ZWRfX6QFr92QpQjQp
 l1pYuEjQq1HjGzhMgr1peh+81Q1aBgi4kltnDkOJyA2Wmx4vFNtkbC9Wh5MPctAf6xlgK6lh9Na
 UC8Qn+ZMqtnB/j+NltraGSlHwRFMVvXjeRO1+U6mI/eDRpI+OIi7PMlKMhkcQvsS6/LbYfAxFpT
 OePtP/eqIHV0dlUzJi8Vs2oJO27E0oMSeIqbh0m/Bu/bagp/Lu3WayhkKySKFy82yi6ft/YxXXz
 xay+ZB5QuMVqnSABjmQkmxBoLy3L8WsQRqigSn+kDB8qg/Xnoyhoevz145y3g/5p/QZkm2Ekrjv
 YJlXmg0uwBiSz5pml6Xc+BKqTKl2vxahEu2uSu34DAKxlKAPk0SKFFFfIp9BuPA4QCVvH7/jgGP
 faJVZB4IZdDLnTtCfEH1kpjxhCpLn9x+jsmZMmRSDjNvh+yVNcMdN06Xm1laq9aBH69IAMi26ga
 EiazyH2LXcT0UK6WlxQ==
X-Proofpoint-ORIG-GUID: D02WGDM7XFFPc7yJqKLLM8cbgZ_b1Hr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-109998-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,4aa4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 163BE5E4FE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 3:01 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:18AM +0530, Komal Bajaj wrote:
>> From: Yepuri Siddu <ysiddu@qti.qualcomm.com>
>>
>> Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
>> supplies across CQM, CQS and IQS Shikra EVK boards.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
>>   4 files changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index b112b21b1d79..259032bd20af 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -16,6 +16,7 @@ / {
>>   	aliases {
>>   		mmc0 = &sdhc_1;
>>   		serial0 = &uart0;
>> +		serial1 = &uart8;
>>   	};
>>   
>>   	chosen {
>> @@ -57,3 +58,14 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&uart8 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		vddio-supply = <&pm4125_l7>;
>> +		vddxo-supply = <&pm4125_l13>;
>> +		vddrf-supply = <&pm4125_l10>;
>> +		vddch0-supply = <&pm4125_l22>;
> 
> Use the modern (PMU) bindings. Also please add WiFi.
The modern PMU support for the WCN39xx family is currently not available 
in hci qca driver, that is why we have defined the regulators directly 
within the Bluetooth node.
> 
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index e62ba5aef71f..142cc8da53ce 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -16,6 +16,7 @@ / {
>>   	aliases {
>>   		mmc0 = &sdhc_1;
>>   		serial0 = &uart0;
>> +		serial1 = &uart8;
>>   	};
>>   
>>   	chosen {
>> @@ -57,3 +58,14 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&uart8 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		vddio-supply = <&pm4125_l7>;
>> +		vddxo-supply = <&pm4125_l13>;
>> +		vddrf-supply = <&pm4125_l10>;
>> +		vddch0-supply = <&pm4125_l22>;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 727809430fd1..9bf52030bcc5 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -16,11 +16,20 @@ / {
>>   	aliases {
>>   		mmc0 = &sdhc_1;
>>   		serial0 = &uart0;
>> +		serial1 = &uart8;
>>   	};
>>   
>>   	chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>> +
>> +	vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "bt_3p3_dummy";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &remoteproc_cdsp {
>> @@ -57,3 +66,14 @@ &sdhc_1 {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&uart8 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		vddio-supply = <&pm8150_s4>;
>> +		vddxo-supply = <&pm8150_l12>;
>> +		vddrf-supply = <&pm8150_l8>;
>> +		vddch0-supply = <&vreg_bt_3p3_dummy>;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 124d0f05538d..73681bf0e3ea 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1753,6 +1753,13 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   				pinctrl-names = "default";
>>   
>>   				status = "disabled";
>> +
>> +				bluetooth {
>> +					compatible = "qcom,wcn3988-bt";
> 
> No, it's not a part of the SoC. Move it to the board files.
I will move the node from the SoC DTSI to the board-specific files in 
the next revision.
> 
>> +					enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
>> +					max-speed = <3200000>;
>> +				};
>> +
>>   			};
>>   
>>   			i2c9: i2c@4aa4000 {
>>
>> -- 
>> 2.34.1
>>
> 



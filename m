Return-Path: <linux-arm-msm+bounces-82407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23168C6C52D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4C844EC9CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 02:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD77A24A076;
	Wed, 19 Nov 2025 02:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1gz3Q5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB21YEKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED924A07C
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763517731; cv=none; b=gZQMD17tNZ5coVHmm65RyKQSY8cZcQcrDaH5QzGNnIsHDgrAiRXzSCZAcrc5OdB0qxm+n+Jro+WvVghe38xhIQJ+Pis2lnced+hK7dSfYx6vLOzSrmUdjGy3fZ/398zNaRJnYVh79AV5bddXefn3IUAcx8dHGHFQ99UE+qi74GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763517731; c=relaxed/simple;
	bh=7f1viE8CvaMFMTbnc7qz7jbsU6+J5kEGQW8yqx66MYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tksn52k5w4j7pX9f5DV12qogzOSH4RwsuzRCv5g7xldfV1r9DB+jvhTRH5WwCK7ncP0PBvh2TnbSX1IpEXXUQZEl/95gCMMl4/522Ejf4lQ32oQjm6m750A0/e3E+95A+WPAJKYK76twq4h7JdRsQUvMTP5u35Gf2B/0jz6PaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1gz3Q5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB21YEKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AILff5D2272050
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 02:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tFcRwzKeLu6babJyYsmyc9yoMZ8zBiFDTWsefwBPmo=; b=O1gz3Q5Qq+VPW7ku
	4M8iTrs0Hl4ihcGbm02e8R434gLwD/wh6r+jJXPhgl7N4i3eFf6DIVFg0tPlgtI6
	6MOEqNucr7slZPuXF+otDq0dVlsu0HWTX/x7x6G8GqgOpw0HPbnMlqJWb7WZT4UA
	KUmh8MQ8SsCGzeRRRty0y5embKSwdQa7tJdr2SmPtIiDbvziiwpNhSdlh6DR/S7v
	DIojARslBvfVws2nRHOhfsFx4QWSFC1S4uKvi4/reImNjJzDm9SePo1VztZurUZK
	6+KS0+vpSf86aLRkva4oXQwPXXKKadNLnB6r0Q3zE18lPI7GSZfXyApvtTYSXI8A
	tiMlEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmk5tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 02:02:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29848363458so162642435ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763517725; x=1764122525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tFcRwzKeLu6babJyYsmyc9yoMZ8zBiFDTWsefwBPmo=;
        b=PB21YEKnEZlOsjBjM5j4LeNIp7u/HGbWdN6bUu72SvL8rsdVkZqbgDrSq/V4kwZ+Js
         qLtr2BdroD4V+uDOEJenhuZoBUq5w2lWrffo3Bzx6e4Knq+EydivZuvMCKbmatDtmn9+
         qWCFH0vfbFCHnYpJtBMejOnjGaOgn5PhLx5GsvF7/8h7nnNA3Y6u0BY1WO+U+mxK+BCJ
         mtJZi1MhAZgXkD0dIZ+cBnGy/FUlUaBt7TkEXSYAZku6xByr/67ufp58wbEXJKChJbwm
         xZy704LrpBFBLONkm+H+fEM7HsDKGbLlVBPvUDDyqiAxDbQ2+BCrgDwjLLQYPn3IB60P
         3WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763517725; x=1764122525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tFcRwzKeLu6babJyYsmyc9yoMZ8zBiFDTWsefwBPmo=;
        b=e41RFfTUPb7A2gtsaoTwwLilMLnHv0CCF+vSzBvQdSyUy7AwpOzvZqwOzfO7n6L9l+
         rYGTndz6OUy40nADkiGu0xL4BLOVGU3TSl/kT3Vao7gXsuMtYhJwXQqaD1pXPKUjcC2T
         MpTUU3Ed7AqNsfsEHPtEMMAYgILrGDfZnkwk2LLHofiLyefZO9ocXF7NG9kQj6TyEKNj
         CbYJwOCJ90bqiPIrfWgOKcmsEzKVijT3LaSTe93OAeBDM2pXXpyOAL1i9FO4TPLnJuLL
         5fnG1txuKulaiPOgSNqNSlM75KfESp3e2Doi2mSDvUO0dU4bj2iHNJhTkGqYrWRvXtmH
         Ytfw==
X-Gm-Message-State: AOJu0Yx3icwLbk4tfVODy64ot3qUAxx6WpoBnJnyS5WimDh+vS2V90Rx
	rFlbSMM5/Jbokd05z4Xa+hikIHoKUuS4nRtZ4G/fO183YYZFNtimmpuIwUP2Ieo9tN9sGB4tep+
	rjQgrcb061U4Lgwl7oh4EicuDa8fRUPhPkx3aU88j1sak3tFIAa4B/LtpDMWBU3eCPjLf
X-Gm-Gg: ASbGncvusz6OUxZbO0MfnI3Al6M7fGvJs2WjwUUJUjcxD8fm23Y21YAqYa8ZC/fjjie
	FZBmVA1IhQDNdB9yUvcBkJcaGFF7AC5UYmC1EdyeuLtKBhFu6iRjKnF68T2Z5A79rQ9WYDhhZNx
	ueMmwxD9lXyY7V14iBH3mBN6k9GVDCn4vw+zaGRgsTGKwFj5xQO4H7uMs70BdA3OapneUyOD7Uh
	v4pm4DAMzLDjrNbMwlVbJux0BeV3jT3Ccc+ysuIL1jTOY0K6CaRnHpq24Yy9LuO+fPclPRa5c+e
	cRy1K3x/VMGcSt/aSQraZ3cpfkGaw3kXG06V4hIVJXn792NPFRTzQNVsaGL3p2gR8ZDc95xMlKI
	nHhC9BfJgcuNBWsUVyUUsC45YrLFjPBk+uPIWQFPgRp7TUoeFbcMjH1x4u3Ri6saGmY/Lt5fA4w
	==
X-Received: by 2002:a17:902:f606:b0:298:42ba:c437 with SMTP id d9443c01a7336-2986a7676c4mr198153585ad.50.1763517724645;
        Tue, 18 Nov 2025 18:02:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEntQRzZoDhMGwqrRc3rzZEInzusADzC6i81QtlFU1yRAn92V7cknmUJBwNjCNy9ERiFaEWA==
X-Received: by 2002:a17:902:f606:b0:298:42ba:c437 with SMTP id d9443c01a7336-2986a7676c4mr198153155ad.50.1763517724108;
        Tue, 18 Nov 2025 18:02:04 -0800 (PST)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c253b30sm185775125ad.46.2025.11.18.18.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 18:02:03 -0800 (PST)
Message-ID: <cfd9867a-5fa5-43f1-a1a7-81f05bacc47f@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:01:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: qcom: dts: sm8750: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-add-coresight-nodes-for-pakala-v1-1-d26bfaa44fe7@oss.qualcomm.com>
 <350ddcc0-cbab-4b58-8b50-5004f27688db@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <350ddcc0-cbab-4b58-8b50-5004f27688db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAxNCBTYWx0ZWRfX+JfcIT1C6baM
 gtyz7FZXbbmpAcHUJF8DMV00qq5YoF9dMJYEIk1Y8zZ+OmH+0/j3Vc0Rq1BMpDFz5QNkCcIxnVT
 KJaBzazXyzIAzLqrsTsbTnPqiBI/B4DqRqXrSA4W4J4PD9Ib/2el5+J+qqto4QyE+RMUYsghBg2
 A8Vw8Os898TbuNW1276Lc6BPdyq5ULvjs3sRbbSQTK2ZZKV5zncN3FVdNcwrCN5vQnmUuCPh90S
 WQMI1Lf2BHk97Iwzjfj5sUEtkfpsCRvdp/oF2FORevU1q3JKqNrgYYWmn+5KFEb6Qq1uXgvRg4O
 NDWGPWXqCIXOTuB6x6Zqz8EGxdZ2PhmRfq4ixQGAyUAZtd3HFKS7wll1wBB2aE1FC2/P5mX5ZB7
 M0uThccHO1arqYvduFnADYVlyZq6KQ==
X-Proofpoint-ORIG-GUID: tY8kemu9Vs_JGosGoLa3LVvGWUmAi9QH
X-Proofpoint-GUID: tY8kemu9Vs_JGosGoLa3LVvGWUmAi9QH
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691d251d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Cy051OMfBe0flYlIuU8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190014



On 11/18/2025 6:03 PM, Konrad Dybcio wrote:
> On 11/17/25 10:31 AM, Jie Gan wrote:
>> Add CoreSight DT nodes for AOSS, QDSS, Turing, and Modem blocks to enable
>> the STM and TPDM sources to route trace data to the ETF for debugging.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 981 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 981 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3f0b57f428bb..56c2605f3e0d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -3313,6 +3313,948 @@ tcsrcc: clock-controller@f204008 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		stm@10002000 {
>> +			compatible = "arm,coresight-stm", "arm,primecell";
>> +			reg = <0x0 0x10002000 0x0 0x1000>,
>> +			      <0x0 0x37280000 0x0 0x180000>;
> 
> This region is a little bigger but it's not described clearly. Is there
> a reason to use this slice of it and not the whole thing?

This region is about the STM channels which are allocated for APSS/HLOS. 
The channel 10240-20479 is allocated for APSS/HLOS, each occupied 256. 
So the start address is 10240 * 256 = 2,621,440 (0x28000). The length is 
0x180000 because we only use part of these channels so far.

> 
> [...]
> 
>> +					funnel_in0_in0: endpoint {
>> +						remote-endpoint =
>> +						<&tn_ag_out>;
> 
> Please unwrap this line

Will fix it.

> 
> [...]
> 
> 
>> +		tn@109ab000 {
>> +			compatible = "qcom,coresight-tnoc", "arm,primecell";
> 
> "tnoc@"?

In dt-binding, we suggested tn, it also could be tnoc here.

> 
> [...]
> 
> 
>> +	tpdm_llm {
> 
> Node names still can't include underscores ;)

Sure, missed this part, will fix.

> 
> Please also rename 'llm' and 'turing' to 'cdsp' unless there's a good
> reason not to
> 

Will fix.

> I confirmed the coresight components addresses match their claimed function

Thanks for checking, it's a huge effort.

Thanks,
Jie

> 
> Konrad



Return-Path: <linux-arm-msm+bounces-81804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59314C5C00A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD8CB3592B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C592FB62A;
	Fri, 14 Nov 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNjeAcuF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoNjj8W/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC802F6592
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109187; cv=none; b=F7NGOo1le3ade+P/+IAJmDDYUNl46QOBJUuH9TinzmOo2x4BbSeZkyqdDlTeb0Yz8brhfNixN4WsvYqJ/brXbB4tntVWQXVEaGuWF8KXwmJEXd6Rvsvb8MCpW0RHj6cQxcWVdqjGHQOcwi9Vo4sK7Ix68XP+Qz0cTXCvmcCWleE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109187; c=relaxed/simple;
	bh=0CYzgYnHsb5zXYx0LH5cXY0NOiMvS980i9Gh645DQQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsxsVxtk7DqztIDYDI3+wQm6QXK5135oKdINjupiwHqEXNDAWuB0xSYuLctaSqT4BOfU/8pcT95yB1aYDuIXbGlmIE9UzRSDMa/FvrUeTX3vqGpxd3EsiUfNGpuLwnjfLitjbglNy0ETkw8iGrLPJPF6VUI2GjFPLEfkVfNg+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNjeAcuF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoNjj8W/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb16i1485460
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4BlQO3s0eHx1U9rvDLOT6OHLy03I7HwhTPlqhcjQYI=; b=YNjeAcuFHjMjJDPQ
	YpLxUSrDrNUd3fn3DAOhWg+syLLbojEQEMsZFAzgwh1Vf2dZ1yV9/h2pXer7q8vQ
	qZXZEFfaCySOr338E0krAb6lfAYERlnrGONXQaYM+Mivwnd5v4JxJrvFWzUqEfim
	hU26qGeXkGbG5W1+iK7f44N4ARaAjdt1ltHYkF3P33rqEDolXB6QnD2VPsjPy33m
	hZv6HijMi9R8OWhxY6I0xx7Odozk5vTXgj1eoESSmxCNTDK1zlegfT1n3RkDyUmy
	96wkRxaAi0HP10/3+FQus3ib+P6Y0oC9h31ZVPJbCfvIDLubG4YlWVyb7KxXwky2
	O/MBcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hsdre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:33:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b82c1cbfc0so468459b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763109183; x=1763713983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4BlQO3s0eHx1U9rvDLOT6OHLy03I7HwhTPlqhcjQYI=;
        b=LoNjj8W/UfhmY/l+Xf4RwvccK57MWGsvcikF59fXPPvxwPA56LojyTs+Xhbw5BVyqs
         WddmilgDXDGeW504Oa7xvxTfwaJVVL7lGMpg81LipKh5ekZ3chzlG4McAjZQ/HdgXVUD
         IQ5XZ4nQVMrI7BU874k+LjhMvbDYNEqa9TPEjx0N5zS7pFqzMhEMvdZZ/WG/+1vj8uBT
         rs6tfoyhvRpV1rX5VH4ihNpKhrHJYaj+fFr7KrTtnyErS0O79ntXnv2VYW0xso0Nsajk
         H8EoIdstXeI5CDpZo52FnRcJpRAA044iEsOG0FdYgUIxMkv1Rj0PG1I4NVaArYQNCo9J
         ZRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763109183; x=1763713983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4BlQO3s0eHx1U9rvDLOT6OHLy03I7HwhTPlqhcjQYI=;
        b=AbDZM3gbAy2vJOuJyntGTZMrAZXmMhP+1mC9m66rYImri6hoRhc2fXLxG23X/nnZhi
         PlI+iXzl4Cs4xjNL5y+CsEN7JqsuqyG4mruwW5vuH9qa5SIK1LEFaNfPCRNQtEKePpLM
         qF9Bz7mIpPA0+Zlwo0SXATT8KL2m8LxpaGUxPybll/S2kx/l+/3ypnO4Dc06n2vIP1kZ
         JKOP+I0EFgQhk7pcIVzctaUDijXknChiv8a4W2MKe9+FhgtMeXSEhAmv/3gZEC7lQBya
         o2Kn1GLzEdzfl4N0R+p5r9dcHsxfqnyu7fJ+cd2RIEG/BcffUHC16EYAEW1c5cdf4bdS
         8a7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQY730xEuUQlp/LIYQqOvwarTJsUUqFRFEcTbdYUIp/QS5CPjFOKtgz7cst0hITMh/LD9Cv9I7tElmbMr3@vger.kernel.org
X-Gm-Message-State: AOJu0YwMosQNAoAsML09DXp5H5HWXdqV2vBcZhB3VZVZJQsOZ980Jw+A
	7TjOy3NWVS5PqBW2PA4lZ8/jyO1fWNLeEa29QXU0u/R8qPBljDwEvP9BARrjN5wMBO8BheBmXTm
	nVa6xBqy2Li7Japn57evGUArjDp1G6KdNQ6QbK6Pxz8+ZTLFAz0LRhWZHBSQf0PxvatQ=
X-Gm-Gg: ASbGncsUczgQVkwZUW+QzE4S5lLWGjPC2jQB2iUfI6qfhbHvWTcd2ThKJTZgJKZBNqP
	AsQnjHPJdhWYqeJ16u91pD2VE+clrV0/WmTj/6FQyUCo1AQ+PydCJsWlBW73c2o6pta5l6VpSl0
	C4j0I5d52l+YM7LizlAjHDuvWdrURwNt9fTg2npHdodBhShh/+uvzO72bb2FLngjawmIdldORcP
	LCJOHkmZwZAXTVOL0VlHLkSqUBXD9RRqZfn36Q0BVNDJlOVojJXNcUXPU2u/kEVYa4RDY6vYAbK
	Jfq5v2ItFKQjK/nNRJh27m15V0DIuajVuUYwkuTkpTf47ffYh1zQStX6L0Nu5FU2OgZmJWPeBcE
	ddpbkLeZAqO93KuJgdVTiQ+x8gcjVmKe8qhB02jw=
X-Received: by 2002:a05:6a00:2d27:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ba39b3ea79mr1552879b3a.2.1763109182814;
        Fri, 14 Nov 2025 00:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb6ke1Nr1AEQwuzlva1GyQBZ0Mlu6vW13cRreQFxUZ2Hgfofqhff7ISlUppU0oCKqca78PRg==
X-Received: by 2002:a05:6a00:2d27:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-7ba39b3ea79mr1552851b3a.2.1763109182293;
        Fri, 14 Nov 2025 00:33:02 -0800 (PST)
Received: from [10.217.216.168] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm4530728b3a.4.2025.11.14.00.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 00:33:01 -0800 (PST)
Message-ID: <5dcd735d-31bf-4c7f-bf12-89a5cae0d628@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 14:02:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Avoid early clock doubling during
 HS400 transition
To: Bjorn Andersson <andersson@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20251110063801.641866-1-sarthak.garg@oss.qualcomm.com>
 <wshfjbdjmoe5hfsmh2rrwxiy67wo4k6i7bzap4hz4n5j22uiol@xz7wfxaw4bve>
Content-Language: en-US
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
In-Reply-To: <wshfjbdjmoe5hfsmh2rrwxiy67wo4k6i7bzap4hz4n5j22uiol@xz7wfxaw4bve>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4oXiuX35elCHzLFwKU03A1kGTZZUxC09
X-Proofpoint-ORIG-GUID: 4oXiuX35elCHzLFwKU03A1kGTZZUxC09
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916e940 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Uc-8ieBvFDwtx1LFMkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NiBTYWx0ZWRfX8U5YfgPu0GHf
 1VINsUAz6YmhyTOgh6W/iLLP8GyGzOr5EntCKgIxf426ogaP/Gc9xqp0vQ+MJPGarwCyh+o2flG
 fzxUajLvRWoLgufly65Mlx9A5GwX5Vm4FW8dbFwsaC5OejdGcT4Rr3zwWSdbVYTs+Pp9luU41iK
 aS369TIKh0LTmqmuGF5qvDYQXA/6PkTBFEANAvDiSFMofdcqO9B5eWUOFRCwt+Drnnhr9yA45E5
 hOGelIRHXNoojZ2QN7Y64iF31MPj7N3xnei6SwdnFDhArIHDUerT2bCewgX+vZm+dbUTCIgEPQR
 ZbYjk+2WSkMbWYCGvWSOVwXbpgCpYCQjcYOvMz+vaBtJQDqSSix8Evj8CKGKm+DDux1TPn0aYwu
 NMsMFt6f66EDH5l85Vw0l2+Vo47/sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140066


On 11/10/2025 8:09 PM, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 12:08:01PM +0530, Sarthak Garg wrote:
>> According to the hardware programming guide, the clock frequency must
>> remain below 52MHz during the transition to HS400 mode.
>>
>> However,in the current implementation, the timing is set to HS400 (a
>> DDR mode) before adjusting the clock. This causes the clock to double
>> prematurely to 104MHz during the transition phase, violating the
>> specification and potentially resulting in CRC errors or CMD timeouts.
>>
>> This change ensures that clock doubling is avoided during intermediate
>> transitions and is applied only when the card requires a 200MHz clock
>> for HS400 operation.
>>
>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..eca6a09a4547 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -355,7 +355,8 @@ static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
>>   	 */
>>   	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
>>   	    ios.timing == MMC_TIMING_MMC_DDR52 ||
>> -	    ios.timing == MMC_TIMING_MMC_HS400 ||
>> +	    (ios.timing == MMC_TIMING_MMC_HS400 &&
>> +	    ios.clock == MMC_HS200_MAX_DTR) ||
> It's a bit ugly that sdhci_msm_execute_tuning() passes ios.clock as an
> argument to msm_set_clock_rate_for_bus_mode(), which then calls
> msm_get_clock_mult_for_bus_mode() where you reach back into ios.clock.
>
> In fact, having msm_get_clock_mult_for_bus_mode() reach into
> host->mmc->ios to get ios.timing, seems a violation of the original
> intent of the prototype.
>
>
> How about cleaning this up and passing "timing" as an argument to
> msm_set_clock_rate_for_bus_mode(), and then pass host, clock, and timing
> to msm_get_clock_mult_for_bus_mode()?
>
> That way we avoid this mix of passing parameters to the functions in
> both arguments and in state at the same time.
>
> Regards,
> Bjorn


Sure will update in V2.

Regards,
Sarthak


>>   	    host->flags & SDHCI_HS400_TUNING)
>>   		return 2;
>>   	return 1;
>> -- 
>> 2.34.1
>>
>>


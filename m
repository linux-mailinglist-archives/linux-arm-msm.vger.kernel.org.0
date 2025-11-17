Return-Path: <linux-arm-msm+bounces-82049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF1C62A27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BFAA3A6C2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F021D2F3623;
	Mon, 17 Nov 2025 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1qqOwRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNEYUzCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AF25F7A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363026; cv=none; b=bm7iaJE3XjbCgjN3F0+bIOjLu6gbL2/wwMFz6D96uWVRPenfPH25zVn3x2AsW9auisu7FYoEL3cwKCECeT4CjBUVqGqlULnuSMmx0AoWVsSsA0EjclTD39OSHjqFBoUcc8a5+fVDM/lOn0RyuQ7sUeD/d/ZLAAO+P27ulWwt69U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363026; c=relaxed/simple;
	bh=bHiE/tg5qa4XPRcP6uV5CqfqG9T5TvF6ZNPkIBFeNKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9kuYzrpr/lb/G6bcOt4SwJvwop9m06eG2CIoqUS+aYLpntt7UmWO5dhg2fiHaG0URc9Uo6FcT2AW0wRf+Py/tpKCIq+sefmACIxK+79S2bVhuhhvC4/FnvTY4pXcysEeQtGQu/l9LY4Fjs9gtY64Z/wBi4AHpm+oyTCjRqrBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1qqOwRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNEYUzCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4ndjG2582077
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=; b=P1qqOwRNH2SjxmtV
	TU4+A4ETopDSqwMZY8+0isB+7Srx7/t8tgQa1uhx6cC1n8yTDQDDlTX/CaDGQQc0
	KnD2daODWq8N2aCNskujexWhAEOYqiNHpjsxhajfsgtNBLviQu21nDEpjf5o2qKK
	IbD3pazm6cY9jOw3/P64DA3TLhzskugABpNewt632vQmsaw2xXiCMlVBYFGPTtxb
	WJceS6TQ1AvM8n2VsikwgWQoT7DR0+T2ORF4X6Q7V2V/rCSjQcZsF1kPm01Pz/y/
	bzyAJYxebhnSUrlf5KJGNiEjXF8Y2rdbirdxB/vKXQtRxfAGZRuXJpa2L7sVfg4F
	XVcA3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssf8r9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:03:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438744f11bso6871492a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763363024; x=1763967824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=;
        b=CNEYUzCitc0omUq1Ywk2kHf8q78l0o4z71sue2cJ5qEt+mxCRfPhWg0AbO7BKX5I0y
         6o3e7oa+pG/MTzGDIMylt7w2CaD643eRvjBBbDiQIHUman4gHUZ592Zn/K0bxstwHLWz
         RhgBKzknASAwvs8xtgxYXLRamSdH8v9p0gb1yQk0quvlOdw1dFbJFVVmMSWu/BCagS64
         I08mGnrFi6/qplXA/gvFJKR+lCqKM7F969Hurin0sgcozbKimpul8y4iQwp+uTXl/7Bl
         WOX/X/JfLGj6jQJew0HzarFwP7AY9zQ/iR4jzrjftLUNWJ2zo/IJILIdoWFPR1ozwcsf
         DNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363024; x=1763967824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUcuLPCs1yzm/zFnNLKPtyCct5btToJh3ZjXZFtWngI=;
        b=YDcntQJ1cpr6UZrVssZsEVWq+Fe7F4ZTwN3AbuyI430LKn5rVQVRNZaqsJtLxZlWZO
         C2PVvnZuIANCRp2FjCeZtobchMoxblET9xbSnIk/A66PwQ88Dq0ed61/d3YOoB3p7as6
         NYSxsFGgqhFvK5Cd++AZibJUlq9xtyH7TFHDci7IK/XGoK51arFuvVtTvFHHI0hsgsGq
         2GvOUxUNHo76IhCRF8gUuGDgSab4roIQI3rXYZC/Fy03Wf65x/ImAY8eDtG5B236gjvt
         OYP00Oc1eAazf3+pAc5NLHeSAAHhGwsLT56A8HzBtg9nE+S2yvttV0F9ZuCys0gVnESL
         ZcRw==
X-Forwarded-Encrypted: i=1; AJvYcCUsAmqBQb1As9I0i1Ay3Ky1u8wg5MNU3iWsQzl9oGjshg4xWPJPJhtUdB6fhPUyPhNseCa3wKNdxXnFsjkK@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbEDMq/XzdL5j4kb6npMw13UQ9m/nVze/8pKTjWRbk/uenuTj
	JbXjilQQr8yApn1r8t3TyzHrPumm75qL6irvBZQg+DEniF/Uqvazz+6hLd//X+BJ7xAAoid7TQ5
	csAHZd8FTb73BC+btYnTnPEg9xu/ayEjn090UmEXxo+cVWR0x7lmUH1sGeu6ZKRoNm8mk
X-Gm-Gg: ASbGnctyT2J+GSs9bITxY08wiLhAFlRxMgGgL8y6u4VHy2YEsDeZso/cWHERPcReAZs
	+e3Df42Am7TUQej4GpsIznXF9vf9cu/P/h95jt3USK8DmV6lOfy1JU2lCc7AyTSQbad+4HMDPyH
	eyEFoTaXo/YAKo3MeBNy2Xj9AoxEJ9grRdk2PcYy/+fsaXnJ9d9p8GOj+6D/WuCqnxidMmacjhq
	OhpuKVqUjN9hQzROjNOZC9KL9rObyyuvRch4NrDE2XKrlVQJyCPJsnjerajD7bz79SDCN5ZeAom
	7+SOfu/y1YoCHNh5gLNUb0+yeEuDVySFqNZ44KbkEuXSPplremxPxb5LAcSCJYolgfL7vlyoH7q
	neY4n3dVyXAnwZRZwLFJBN3mShNyzxQ8=
X-Received: by 2002:a17:90b:55c6:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-343f9eadd5bmr11547244a91.9.1763363023894;
        Sun, 16 Nov 2025 23:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcS9xLWaU+orjr3u9xRNLpdYNVrxaOF+hEocHdvMHAbk96AHOE0fqkDyg6ZGyADK6p0eLcpQ==
X-Received: by 2002:a17:90b:55c6:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-343f9eadd5bmr11547215a91.9.1763363023373;
        Sun, 16 Nov 2025 23:03:43 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456511fa6fsm8195729a91.1.2025.11.16.23.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:03:42 -0800 (PST)
Message-ID: <5fc9b289-2578-44fc-aa87-61b27aee49da@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:33:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <cjuzht6hfzmog7xkwbydisl67iuttdo2jy5hndnruzeu3hp22g@dergmterq2an>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SSMbSzqfS1WA32XJcZFsNEv1HcxQkwaA
X-Proofpoint-GUID: SSMbSzqfS1WA32XJcZFsNEv1HcxQkwaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfXwqbBDwqN1Qsf
 SHfh+p+rtwskKky/+qRoEpuRY1YrRi8q7vLveX3YH3QdLkhtJbDz/841bXmbQhQ6FYCxnaXrVZV
 jKQQKUsf6pTU/8Mdb9ZSgaJcoS78JbOvhJCT9tu+49283gCI6y/y+54yHObwsN8IeWiaurPztEm
 mklNTrxJHOQGc+vxvp3JkKpsPx1iiWhx3h7gt3nasZiJwFf/q4+DfCO4uXD3mVnj/L9nChL+N8P
 yqHP4Zwhwyshw6a+ge/VwltdD6j0SWHKPv8JpfPiEjxGeXXEQXDqWw9SEFQbx2Mih7ZsqzaGfg/
 wPlRyFAo5aAP1V4wj0soEuue+gHv75hzztKLF/+eslwpDtanOpvlFAM4xutrnZSpwEiCeQHiWVw
 CP3Mx75+pVd30i2kxAnHL03xneleTQ==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691ac8d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8 a=EUspDBNiAAAA:8
 a=7QmZVlL-b-cmGkn9gTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=CFiPc5v16LZhaT-MVE1c:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058



On 11/14/2025 5:45 PM, Dmitry Baryshkov wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
> Why do you mention dma_addr_t here?
> 

I mentioned dma_addr_t in the commit message because of the earlier 
feedback highlighted about the confusing use of phys for fields that 
actually store an IOVA-like address ('phys' with something more fitting 
for an IOVA or DMA address).

https://lore.kernel.org/all/969bdb49-0682-4345-98f7-523404bb4213@app.fastmail.com/

>> Signed-off-by: Kumari Pallavi<kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ee652ef01534..d6a7960fe716 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -106,7 +106,7 @@
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>>   struct fastrpc_phy_page {
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
> What is the difference here? Aren't all of them DMA addresses?

Yes, correct—both represent DMA addresses, just typed differently 
depending on whether it originate from a physical or DMA mapping context.

ACK, I will update this in the next patch series.

Thanks,
Pallavi


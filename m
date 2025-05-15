Return-Path: <linux-arm-msm+bounces-58087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96FAB8B98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26AD73B0ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3AB1FF1C7;
	Thu, 15 May 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiXF5xpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E31F3FDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324271; cv=none; b=GBpinz+G+/eCsFfHjrMtVvC4y741PK7G2L1+EUnmRNng4bbpO5kHhaD4HwLMQrwUmonPkBYRF3jRLbwL22Z05SceA9XuS7ZGFwUjSM4p+qYJaSUyh9bGjGAUmdbcddbRsN/dCXiBItMHabgskBNHof1Gx4DfXKdq1akd6o9txO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324271; c=relaxed/simple;
	bh=/Ll25eGOig8uLptB/ZNRa/LgifV0dB9j9Ahb9Pe9pGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVr/S+r+nhasBGNzZ0Ho+OesqtY2mRSRPvxzhvUk6vsdnx0ulUjwSkrObJU5owuvGnOEI5Xe5w6eUO5K5bhpFkK0QSRsIGyaH4sKipI3HoV2NEedY/K75UOQn1cgIag1I4wGD84MvBtmgorBTIXwKbIa7/4sujZXA72ZOhXdC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiXF5xpl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFfIF019550
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=; b=GiXF5xpl7xptwRm4
	pF19Ie4+u9zfT3/0yx/lR+Plg5siSxVxCoZqPYLXYudzC6fan3bDGi21iMkiYH7m
	CDEprpPjdpkkKiMg99Bm6QH8BiCwvolrAl8J+TV8PWsvGY2XXjhXFshGDeFQaNMn
	sSkApNLLbWr3QUtpTLSawzouCafJktmVFIqgViNC9d+zt9gCzoBcJqkACr0AsNQ3
	iLJR8hBv8ydXUoDWnOsFX+C4g1c9VBahqhk2FTKVmPBWmg1MB+MGr1i0f5RIfnRb
	V1Vp/cIR2+okLCUOp2k+hA76l+/wZBfe1kDsmxYynkFYDx1JJVfPMPhuYBAaFJLv
	uTaI/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnpp7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f89a2df0deso3317116d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324268; x=1747929068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwVpEIqOsJer60fiNoaqHMYmRIZm7xE7Ct+1ZmlS3Vo=;
        b=DloWqWLDjfw7Ka60j+vjtln/nwhhwt9HJuGaFxtHzyL5FFq003OzzlEn83UlyM5PcH
         FhOpu22QZb32/YD+XCZCjY512YvdlrxwE3usShpQaqt4KFxCXuZ1HspE3V1VSrXPMtyA
         H+TiLctR1XDUzukHlHtC/5PqO9tg+T37B1rO5KtDlb9HhrYcZUQWVxKsEyFpt/dybqIE
         TeFMTd8uUkM6IXUcZ8id1PFgvW5PdiYHt6WPlIh5lLtkQu9fC5N3tJ8uJ8EuhlJm5CHk
         XWIpkZSR2/57w4g1maCDfRw/xsFla8ySW535yOtRLQJ5WsRLVmFfZ3EKaaYPlepU9J75
         v3bA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Y1sZL/24nCifz7Sco1XQZTEEDmCtBWUrPLK6u7jtif8uHEnMgA6qx5FkPSTLN7GSp3yAvE94Q9qtCJ4v@vger.kernel.org
X-Gm-Message-State: AOJu0YzMJPCPTrE41LKQ1Q1riIan6FE5WjW6JDzf4XVLi+uj59ZJp5UG
	1Y3TL44SpS9JtcFOpdlWj7U81ezh80bNLFHFITGnfbuY6OFY+WPC4BmkF25l2tT6fuEC1w4xShk
	b7rQH0ea+vUPehgJ1nKNKshYU8XhbdRTHyN/k9cWAXLegx9KWpg5NsBYKuRxZr4iExgtr
X-Gm-Gg: ASbGncvntWmpgZi6hTIw2r6dNcZgB0RWHxAnHfL6Y/2YJOQL2oqkBV7vsRRtpoVhJQA
	xC9a0f+jeciK/dLuKbt22+iGcaSep9GNppMb4iNY3Ve/CqEWBK0EcwiGgJv2c0hojih0eXhYv5q
	5PwQPUcyVUJzFbKAfl++GgtSFoLQXirDxJ1/i3T+pJfxxIR4xCdkr4UdF0p0Aro4lfvPEPZwJmv
	JO7+an53dnzYoOUneo5WDVEYcZchZzsrwcw0hDhdW/1usRFDRkG6frAiOuIq/H0uCA/CSd0ZTuz
	p1cLnM4x8OlMaplce+IxcFEioVBoxRAnNeSX2thmIfgDE4qIUfOF7ESO+yC+9mxD8Q==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1262606d6.5.1747324267818;
        Thu, 15 May 2025 08:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuP636c4a4W/vTuDcHADRpcLgMarKC0rmzXDUBxsuM0NINQpQHYG/rJHp1KJPbZZsCqr9WEQ==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1262376d6.5.1747324267436;
        Thu, 15 May 2025 08:51:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d276592sm7839866b.73.2025.05.15.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:51:06 -0700 (PDT)
Message-ID: <d7cf919e-bded-45a1-a352-6b2e659d0197@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
 <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VQLTXdeziHRpu9c0YN6YhkwTau47DWv1
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68260d6c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=zQN7QPYGGEOyCfchBhgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: VQLTXdeziHRpu9c0YN6YhkwTau47DWv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX6dk596u0oK0O
 XcwvhbeXrCb+ujL79C3VYvFsdcHp+jmEKyskNjSL2ws1IbHpIl1bws2U6ymP11oo6hD1M2kapJu
 70z0oHzWsO6UPGGWAmzD0pbbnsAzTFdKpPjxUQCV9GZ0RXTTXV/fWdZ2raMt/j6kRc8vUAyfdUC
 kii2LB/56ELyEDvdZkRK8QHIt4jwMT2SWVBvvz8Ep8geanDzl9ipzGwiqXqDtRGNpaQIRqGS6Yv
 L7C25gG9Lhn+4KvjFZqOpvbP1vnVY6VyKzCcc9scoW6/Ewd84HF+1hInHfIaIPnAc6BrYjgKka3
 beDzkvVkzURZoe0hIyBbhetKXP4nS+bsZCBz3pm6Y1PH9Sc/hWcCxrRLvRbZlVqPcGe2D3aIqew
 VnVnvgZhQ8dnxQR55PBCvnRaKkPYt6uTxoNhKGEyJOSAYA7Z+rFlH8lCyUJUWaWZo0VLJnB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:19 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> It's only necessary for some lower end parts.
>> Also rename it to min_acc_len_64b to denote that if set, the minimum
>> access length is 64 bits, 32b otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>>  1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  	if (IS_ERR(gpu->common_ubwc_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.min_acc_len = 0;
>>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>>  	gpu->ubwc_config.macrotile_mode = 0;
>>  	gpu->ubwc_config.highest_bank_bit = 15;
> 
> It occurred to me that here (and in some previous patches) you stopped
> setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
> Would you mind updating the patches in this way?
> 
> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I mean.. I could.. but I delete the whole thing couple patches later

Konrad


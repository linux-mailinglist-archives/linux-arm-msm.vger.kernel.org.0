Return-Path: <linux-arm-msm+bounces-83358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5AC87F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 04:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE33C4EBA84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 03:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD7F30EF9B;
	Wed, 26 Nov 2025 03:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkUQofnj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpWUpgvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B530E0E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764127267; cv=none; b=c+1CjVcb/u3yZ6ICz7SuLdwIWeVXdSpHJKq8b6g6n/tyBik7wEMjJ76qp71yN6hMIRDG+L81NfGxbi78+4ZipU66sJ5TyVYP/47s11WVqnj9n44PB2P+G/CVX4SRnJ3Dqt6wJc+RnAs7/330iStatTxzc+0JS0SwFezkt87y+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764127267; c=relaxed/simple;
	bh=PMiQeEd98Cjd00Y+TKpISiWumSMgViPvAgwPAQmd3nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rScSmonG2VNWTljZ+9cHW2DTaPXoeQ6RqaZwA3nTir7IbWkyPBjR5BQwr6fwtnoXEk/JA/K+5MztTQv93Kjl+AE2S6Q/1QN3lG8I5s7yQmfghisMYL6QyT7AMyYgXqJfl8YSC6RJjG15HDSgOax57c+Od8i+HCWs64QB03WYgP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkUQofnj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpWUpgvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGKuHn2655379
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=; b=kkUQofnjt5WDQGaa
	hDSbJQvYF9Hqo/CIzg89Tud5/GIlC9KofKQZ7Gt2X/gXx2UZTd9oyVaNTtAIP0YJ
	Xdxy8n08L+RKfkfloxLk0+pYhCkCHWGKkQDJlpG+mWPXAICTW0uypgZITDq1YVlc
	f5CUr6hHxny324cDx1Fg+QRxOY/Nwx7FTxNMOWd/CC90jLkb5Fvam220sffIikUq
	sGKfKqa/QTNACvyVTAaCgLEMe9u+WZlb26zEkXhvMY2U0gNqhfXEvuJ6y+a0hTKU
	f3RQUsdl5T6NzOkaFHEuECvVKjdujUkjql2Zve9A96FEsZtD7FZYZxy/qGxM/NNi
	8VC8CA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxtvfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:21:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso10944265a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 19:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764127264; x=1764732064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
        b=jpWUpgvE+YrEmmFfc/Gja6VCpdTNUaeGod2GJFO3XfR/2zn4GR9yYJrWupKhkcK0ex
         E38/XSURWAFZABzCwph7EKoiywXMPbViExvZr+kkdBXFcjb1WsRhn1AiI7nWtPoac9cc
         M6kDyBkphFAOy2hHTVBaqgrLTjGJjbJ1xF3drRDNO72Nz9viuAMQ4n8cjWuMAWh33shh
         6kwJIoV7OxeU9gwNwpWtp823E9ACch0wAZZMdIpxuM0Xd5Nb+aP0VeLDntHW7aMp13G8
         rN+kj83rrKhovT8/yNM+GOF49T6fU4ItGK2eeVaVVbt14HlF5csotqxtARIJR2AqXtdg
         jSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764127264; x=1764732064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUSij966+HRiUH0i/n3DzHvXFNJRC2P5sPL2WyUURiI=;
        b=DPgJ8x9vbwrpBfSUkcW+EnMlt/cTzI/8fETSSdpSxEcl0xXnUWR3DW8UmDGqhmUWI6
         LQFyJtKcil2GvvFCzm/mIo3aQS7+cS6+6J1xkM7gmn2tQJbUIIGI/zeDNlsgRjDWAQVY
         88PvRXX8exahXst/tdiLd8fg3WqPDa1zmjXrpMgb37yUOy8yrQ916C7pUzeqJYTBQ0Fc
         c7JPtOCUGvTQbfAOykX/M8Li9au0OvGRCYtfxsMQYauTiPcNxAPDl7iGFcJZuMhF9p8L
         FsNvm+RKlX18QLa6ipB2ebAf3+g8dv+4oJIbl2NzZAnBMgQnx93BlWpsz3/3jQXoZAhg
         gAAA==
X-Forwarded-Encrypted: i=1; AJvYcCXwlQbkTqQ713NvTfYBBlilsbhgo8bblBbuq6WroT7rYnNmRJvIFRix6pCTqFfCPH+rEYeUu7ydwz1EsDxK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvep7QNGOTBWcSJqzsOnPN6gyXvniHLQs41541zQJ/nrAmRSHP
	uESmGtBW64SG3ZoRbJVxSO/n+GLjIZtlAU1L1WACpiwwD4mlvBFO5k6c5auwKqfQqUwFPHjlWRr
	lFuSVPJm1IBXZq/MqjZYs5dhk7jP/kwrcLfMYyRILW+rkYB0jVRQHLPf/d62TjmoWM8ZT
X-Gm-Gg: ASbGncs4ZMRHDHev64tqF0jWW0DhkB7PYGIEZ7opwPpXgnNGjFZ1aWWUytv3MK2V6/2
	9rtMwk7GjoNh+4QqEoJXXMAhrCEfwfl/nk8wzsf7OHZQQ+JWdNbsanUlvFpXGZzSQWY7cRlZmtg
	MRSt9lko2xkjS2CUsV78axRWV+lWR5uA8Eut1X9MShQVArkioJp7WZ1S9E2Bx521bc/VW8TX0wE
	W8EqGEcDxLucln4t4UCNEX27dyeUzOnN9FZAb6RfgL3C9Mf4tZ+KfrOrU4QhdpiXTdm9tpMhIWx
	IWy0kGTiuFqGy7pGgvcw0DOPxHH8WuN0H0AjbpSMmXHKYzByBGsZx+qrsjtPSLGA7DvPtjAf3XH
	1fpoq2BtWpSnJGikO1gMXaYCftTdPHNkvn0mBQAmuy17e09PiL1XOoe6JzA1hwnDrEQ6XAQ==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id adf61e73a8af0-3614eb27712mr21998827637.1.1764127263900;
        Tue, 25 Nov 2025 19:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY5GTmXB6LRIcB/8CKQbkXtSEMjcFcfmYhsgY/Tg9UhZJyBXxtYvylvK9lnxc5BwtLpd4OJQ==
X-Received: by 2002:a05:6a20:4311:b0:35b:ae01:a4cc with SMTP id adf61e73a8af0-3614eb27712mr21998793637.1.1764127263426;
        Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd775ccabfdsm17447699a12.29.2025.11.25.19.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 19:21:03 -0800 (PST)
Message-ID: <48e5427b-a17f-42f6-9c04-ddba8f383d58@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:20:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=69267220 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aISMk_G62U0n0vxTSHQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNCBTYWx0ZWRfX+BBDCmT3IXYG
 xG/HPXNqNlrsdkxT+9E9unGfUTKxN32DvTH7a/8uMffzx7Te0peaqbDAG+R5WtjP0zYSgmqG4vI
 C2KALMkQpV6vIOmk9AeJHkvF1oSu673MsOVydLC90qCM7laMpInNX9KVtoug6baESpCGL0d5k7I
 AjXMTlia0egjvHeTqgh3ofn9/UIkfrbTwNUuXAyJ1B/StPX1P2d9lnG5N8blR/UDAZPL9TYMnzr
 yc+hKWp/mpH15eBfWN1CIKBOyWucbR32+s9qda6NiZD1qHm7uptk/a2tbmXFqd+R00hJLauLaJI
 gPzt8FGmKgS8pbi2cG+/+wRaokho1VzmFsDPVAzsw==
X-Proofpoint-ORIG-GUID: lsfVetdmy2PtqJItLW-TF6nxDyuqIJQ4
X-Proofpoint-GUID: lsfVetdmy2PtqJItLW-TF6nxDyuqIJQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260024



On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> This patch was split out from the MST V3 patch series:
>> https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
>> ---
>> Changes in v4:
>> - Splite chagne out from the MST V3 series.
> 
> Why?
> 
I would like to send out some patches that are independent and have no 
dependencies on the overall series, to make maintenance and review 
easier. For example, in V3, patches 1, 29, 33, and 37. I mentioned this 
approach in the first patch of V3 before. Please let me know if this is 
appropriate. If not, I will stop immediately.

>> - Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Fix through the whole catalog
>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/
>>
>> Changes in v2:
>> - Change the patch order in the series.
>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   	}, {
>>   		.name = "intf_6", .id = INTF_6,
>>   		.base = 0x3A000, .len = 0x280,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>> -		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>> -		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> 
> This is a separate fix, it should be a separate patch.
> 
Got that, thanks..



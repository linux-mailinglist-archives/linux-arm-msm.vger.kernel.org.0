Return-Path: <linux-arm-msm+bounces-80405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2CC34730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 09:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 373164F529A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BAC28C862;
	Wed,  5 Nov 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juopY66a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXw8o2Dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A35280024
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331005; cv=none; b=VyBmOtc3BJVNRxOI6r1ACS5GvEgcMFcSFWi2m0mYSgJzWsF7fJOzyasTqT7l4ViI31ImRq3gE7oYtyAFFeqiYRj2s98Pym3ssd3AMiW7uPf+NRz60kGlBS9jF15LwrRgVPE2yzreusGfPtqQzq1mgFGNTxvyl7hr9mZ6PWlbXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331005; c=relaxed/simple;
	bh=OGxIuTjuT9QUth5tviNLROGJDx0BPvfd0vIUdJqNFQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0Rfv68Mb3OLBaxxKAOmJXY6V5GZEceOKhWxlqYrXVERNGT5A8INLVEYPcd/yk/LrhfT2rsq9YsoYpm37XOQUJBLJg4A3Qf7g1UFjBoG5wbG7/4ar/xd1qVoqDCribNGAYpODCp1Cqfm6Y1uTdZRdKUEuaFLkYkCtws9cyATmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juopY66a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXw8o2Dh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54YPkk4012235
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 08:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCgTIkJgcGjREVJRipm5DUuZDPsi1flrzSwxBnkSqZU=; b=juopY66a6UdbqL8n
	OJ8fNl7s5iZ4HP6YnenlhW1kxzJ+Iy5qFmeOHql3qvMlOsyzMY+IWk3479tHH1G+
	shj9yCwS4K9n/rts86FBGIB4hKeVF/2pjMYbIEwWPyJmWVGVlyEzFI898Vs4zkh4
	KAH2kCRpAjxTBoa3wV0NcK5Phwpsmzu2Z2hqsMoOeUjL8iBOYFvQNU6mAOFX8SQw
	K4uMpao5sw/9hVjvPyvSWwSNS4gIticbDzJZmGlJNm3S8Chfw9j4Xd3njfm3kFkK
	KB1q6WFEQZyhf5w6jpDOMAS+GSsDDX6an6XbNrlDZVPy3LYQ8KI5F1vqvkehORRg
	hp6fXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwrj15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:23:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-294df925293so71628155ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762331002; x=1762935802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCgTIkJgcGjREVJRipm5DUuZDPsi1flrzSwxBnkSqZU=;
        b=WXw8o2Dh5KBoMD86YGNl9m7yloi1RfmICqg9u+CituAUqFYbGYbiNkorV4VCM+FdvG
         f3+glNo0BgX6cGOjNlIl2F7OvJmdsFeVhU6dLfCHCOnDfyVZtn3cymsF7G6sKZy2j3wV
         E/V9pzHGX1lp9G+XETEI7vL0WzPqfQzDuNk6aTXRuQAYYiIJORCJ0EimVAmmSl5TVtLt
         Od9LxYIAjPEwj1TnYgTnJvO8bKC1+WfuT1YEKWF7n1IqkNlq8pevwmmN8Pk1regTABsj
         eY7UOHOsuO3ulqzpiPrAOvr1FbqXu9+SvyiSbas83oHhgRoO0Gm3TV871mJ4nm6PWMJs
         gSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331002; x=1762935802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCgTIkJgcGjREVJRipm5DUuZDPsi1flrzSwxBnkSqZU=;
        b=ueGdNQW/sU25n7hBjWsPL0YtP17si885gSMM/I816cA91hENfLLyCLKfm7s+S/r2La
         xY+48U+CoDG3TosIzLDqRtD7TEcGHKTi1G0kPXY7USiAOIxAioacBlG8lLk+Bdypjsyi
         kdBDCegxeB3nTHFLb/+dwMcFHH+rgJtT84dPhRA5TH09kmfO7ISRxQlb3JUzgHdb/n3k
         uQpfvxlYkwI4oGy9q7ZCoOeTQR7IJKx+/jar9z024UqEX/X60jzhkQVhWZ397dn6A5j5
         lgplNcy5rDh5GcJlU6dnxUcdLvE3m3esCdiGOHc5nRpnU3isHRXpoScir9+sITzOI+5M
         K/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVqPAKd6Pws4sSvKuRPCZl5OjsW4euZ3PXTzBGCsOrerVCfdjumF4ajCyeaFu1PdO1NcrYnPxp3fv1NwGma@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFHpAp0d433vbIqK+B2tWIgF/vUr2PYxcTuJfHjKobKX1GFxZ
	ndPmuzQwSMrYJYvNUThJxBWyCvMLT6OySK6tv8ir6efhAyvicnLieOCl/BaaNbZ+OprA9NPFvXI
	i5NphkDixu1rZDg8fSWP/aO/WiHvkWcaf9bfg0Sej0/K0846JYq+Paw80lMhwMgfSo4E+
X-Gm-Gg: ASbGncv45TzrcAP7y8nuVBuX7xZikQ3gBg6fxyuELdmk7xEwoVURHXxBBk9dyx/fW7X
	HYV90rlcbVxnfms3T3TMGdj9fST84KA3kQFGbEGsHYLa3XqwgGeWT43Itl0DdOwu63QCcFXuIlu
	IG4lDPzQhOLXZiDe4LQ1sjBGlqnosEPeev0dlAyOu18eG6rxB0Zu7CaJOYV7bFraxJzGNuY1R0U
	zUzyo4fY4vBZEsDhASoJvHyfrSFZbyRdMwbP/zgLNDlhqj4IlVV3L4BXNpxLJ6oAaZaOOi7P7sL
	X7D6WdiPp+2pRAV+QngWBXPu6KB5kpGaZFJc+ciMiyhuq8pp6hKHZvthU+dSfkYHXwutboKC8/e
	LA26URChZGRM90sNO69nan1TDAVyU/mI=
X-Received: by 2002:a17:902:ecce:b0:294:621c:a84b with SMTP id d9443c01a7336-2962ade3a3emr41995815ad.56.1762331002097;
        Wed, 05 Nov 2025 00:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2/ml1wZTgQyjOdGBjdGCJJ3AbNiVC5lD7CGWaurnvwcR2//Zu+UgCzBWxIDLg25v0xDEA+w==
X-Received: by 2002:a17:902:ecce:b0:294:621c:a84b with SMTP id d9443c01a7336-2962ade3a3emr41995485ad.56.1762331001599;
        Wed, 05 Nov 2025 00:23:21 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a69d91sm51520155ad.95.2025.11.05.00.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:23:21 -0800 (PST)
Message-ID: <ea009a8b-5a09-5c2c-8f61-7b7c7efc8b53@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 13:53:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Content-Language: en-US
To: Val Packett <val@packett.cool>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com>
 <7d26e4e9-e298-4991-883f-ceb60f240394@packett.cool>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <7d26e4e9-e298-4991-883f-ceb60f240394@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2MSBTYWx0ZWRfXx2HjHRqihrha
 uOvwwu3vQGTcc8TYeDcJGtWEAA7hqh1pCBvSFvku/wcrmnVe4EZJgTgkNxpaAYI8vfpPGGuRois
 lVztSIg7IitGHEE/+0FuWIh+vqFd9GlhBhSNIjmBehN32qIWWlte3htx6ZKV1ZVuTp27qnTRcot
 caUR9HPrEJSmQugeMr/CnSoKBJpMLBOlE3ueyC1CDKyOybH+/dNBPtyXFknogIeumUFkujmUzh2
 zwlT/yLDBApYamSCg4eLQE3iqrZfodXB8RGAymmEH3phvVdJ68xHsG42siKmT6RO0cKNgck2u0Z
 n+nrTIsMvnrKxU6DXL1H1/UT/rvj+L2y3M7x75vJ8O8BYdzBxyH05wB314ogPCS5qFW2cOpVwRX
 7pci++rM/yv3regAdFquxrvLQyjtBA==
X-Proofpoint-ORIG-GUID: usiqPH5-XqP6anFjqYPPm68r4KtamkVG
X-Proofpoint-GUID: usiqPH5-XqP6anFjqYPPm68r4KtamkVG
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b097b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=k8ZG-Nafi6ezIJLqpSUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050061



On 11/5/2025 5:20 AM, Val Packett wrote:
> 
> On 11/4/25 2:11 AM, Dikshita Agarwal wrote:
>> [..]
>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>> @@ -91,12 +91,13 @@ int iris_process_streamon_input(struct iris_inst *inst)
>>   int iris_process_streamon_output(struct iris_inst *inst)
>>   {
>>       const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> -    bool drain_active = false, drc_active = false;
>>       enum iris_inst_sub_state clear_sub_state = 0;
>>       int ret = 0;
>>
>> [..]
> 
> Somehow, you have lost the + edited line that declares the bools.. Hence
> the CI failure reported for v1, and the kernel test robot message from just
> a couple minutes ago.

Yes, I realized the mistake and have posted v3 with the fix. However, I
missed to add your tested-by, apologies for the same.

Could you please review v3 and add the tag again.

Thanks,
Dikshita
> 
> But with `bool first_ipsc = false, drain_active = false, drc_active =
> false;` filled in,
> 
> Tested-by: Val Packett <val@packett.cool>
> 
> finally the decoder is actually usable \o/
> 
> ~val
> 


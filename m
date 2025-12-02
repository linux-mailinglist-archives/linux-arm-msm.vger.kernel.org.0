Return-Path: <linux-arm-msm+bounces-84040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA5C9A585
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E34844E29CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFF430147E;
	Tue,  2 Dec 2025 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyDzfPP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kpu2dhXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071D24E4C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657541; cv=none; b=UuPArfAXwPdVDGn7yaxgA7FtjGvrG1H8hp9D8MWoMyE4WHqZcnkwLrRGxxA0NrmSKUO6nO5NRKl5cT13jUlN/FpVv7Jk//d2UNNybFQCDUAmNva5XDI0ZObiyGm8bokQyFZb2oqY7RI53435f1VPrbwqDf8rxuRZvsd19BfUMoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657541; c=relaxed/simple;
	bh=peV8KREfrq72FJVaLI9eXBd7GU8p85ylOrYnUxG6CY8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KM5ZIyibGQmhHPabB3qiI6vb5JIuB3nKK4hSH4WWxmeba/7Rt+G/mqSNqTNhmLtJAqFWZaIqCZ3dzozkFhRhQx5yhCDUBwCPu/BdfeC5Zoa2ukKp5/+Nib9ef/tTm/4NOoDcdBY+cFRGzT/Q8Fdrq3IOhg74dSQ3biumlrrLxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyDzfPP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kpu2dhXg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25kWo51688783
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=; b=WyDzfPP+ARsnovsd
	xqo3snTZL+66Gipgdsz4G0C9QtKURZGhvtK/LC6EUqUryEjz1Mt0KQeqt3a0UFzF
	6uZTaUQf3eJiVup8LcM1XgBjhnCJOGvImCZKk8FEbnl32jirtrcQuRxymmVxNAk+
	R0yAL4lvARMEt65MXHsiPmQnMlZfykwD9rBd6fpBfiPejQLFYB4cJDBy/q6fBkfy
	SlEGZ9RFX7nlzLRJ2GeYYlLKmOLKP7c8cN9QOr0W23wu4/s/FI4tr1yLC8Oo6IOC
	da4a0ebPcTAe+gd6rxHm/eYbofx6A5bfeYUGJo0vwYi6F4qCM+LCv494sZEYTdoE
	1zHbBg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxeswmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:38:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34188ba5990so12608729a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657538; x=1765262338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=;
        b=Kpu2dhXgEyMFZSrMnBQW3t+CbaSbKbMUpF3g4b5TzEsV4F3fVVsiTr4jHGnZChCicb
         BUfsyVdObNSfdgkJ6nsIk8NLFRDb4cXZelQcd3gTlJN/GohNEGonScK6YSpCML0WUAp0
         JVywKmBP7Ok19k5Dqh5rcA1J7yOwiPEO7Ora1FYkgzlXXTiLk2nZBiT6KSl5iTvJlZYi
         +WAlMnrxawDprmro43J0lvdZ2L83KW+rkF/qNoYYtoGIi03nibe0I/YGbOqoLkKgZlXB
         7yEB0OIiI0XxqqFVN34ILGpAseoSVKQ5bEWEy2FRkiYVPtL2Tt2OKsQe4CngZA8r4pNq
         haXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657538; x=1765262338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=;
        b=j7ugheaxhPFSYM9MvhLrCk/sVir+yGsKSnfsbendpEqXPmo5rJuu+HSgIuaZ9Qx1Si
         PeT2QW3qUa6UX+k1r50exNhIO2sj5Wr7PZyxgPn0Ob72VNbPfHzSVo0SAGO+7Kn9PTXs
         j+dKo0LpeVL+1/KQxC+NCk7uUJX4QPp/9atQ44CJGvdioVzGBub2RdaI8tSbNRIKLKU/
         hGQkst0ecLktCCbHVYZ6H1UMgcPc12mUX8P5ypX9nxQrQUVJfbmCdWzwaIRM5HzD9f/p
         VSN3fKS/FpuBjXa3llyXvYVDEMh15njKvSJpZet7KZXptSyLcVANebOlCKPLLXI77hH+
         FUFg==
X-Forwarded-Encrypted: i=1; AJvYcCXd/D84bgZ/9JD20uV/HxTKt6FklZltX0rNhpfm5/ezpN+mg+pf9dUgpe8YcolL2ChBRAwlKR7Tdu4QDGR7@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYdJEiyD5zav9mWGI0C8LREOvAL2LtUVI4CbHpHUw76/bdaFL
	rDQqrWVAfLtBDloYAqBc1tOAY/9xcUG2VLpa+iL/Ua7p4YzSi5ilH+Elr4KyaZ53xIBIR/3xSsf
	vDb1SFdBQdWZqxg7Oa2vvXfrITdu7zMQevnovjd3jWcjkIED+pHtrV7FW6YPNpUnbA/l2
X-Gm-Gg: ASbGnctiDBm1ipLCn5QU8t7C1Vf7CO7T/FyyOg9uVzABVud2B1WVCdDm2KDWCRwKGxC
	nyxiD+PFHEVJC0yM58QumonDERokyWwfGGOrKZKiJYiQ8IvOTEvz43/Fm++LHjxY9LJiIt000W0
	A8bfkdNpZQZsoTwblJIdrTQIF+nhGXlIztulMDShQyGbJeXqwvxSX+nNVJKHwR2tkTt0P2542ko
	GvnasaSrOM5EWAyegAWEq6SsfpfZOCMBHk7sE1/obaV7Orbb+g+7vxT1FvEFnvOox9lHWxCHmTk
	B5Add24Es35/SqcLuooyZom25kjhPQa6yL77uN5mQPzZKvrN2P9x+XgGfJ78Zpoar4bZJT1CHbJ
	rj35W3ads2LIEPZFtJOhfpLrDTyhMUrBXyAgOqebv7bdddX1Vhk/8YQgiaAYOPmGxfhkvRwL5GL
	lVlW4=
X-Received: by 2002:a17:90b:4c8f:b0:341:133:e13d with SMTP id 98e67ed59e1d1-3475ebd2d92mr31264048a91.5.1764657537587;
        Mon, 01 Dec 2025 22:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ktYlRR9nG5ZUi0nAS6rXl4dEj9u5a4Ln1FMdZZzAfPBEqFlbadYLW79kLok9/9OoeY/CYQ==
X-Received: by 2002:a17:90b:4c8f:b0:341:133:e13d with SMTP id 98e67ed59e1d1-3475ebd2d92mr31264024a91.5.1764657536960;
        Mon, 01 Dec 2025 22:38:56 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b74b328sm15150023a91.13.2025.12.01.22.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:38:56 -0800 (PST)
Message-ID: <40785b92-e947-4c02-a5e3-94e0dd97423b@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:38:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: qcom: iris: Add Long-Term Reference support
 for encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <Lm-sduib7iCBaaUii-g8s2lQybZpjV4n2nWi9p68zk9gRImpIof2Z2zkV1pYMifyLlQmN4CqnFpbHpz8K-bffw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
 <26c1e2ac-6568-4d04-93f8-a8f1e49d156a@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <26c1e2ac-6568-4d04-93f8-a8f1e49d156a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LS5n2-G4dgeImg6PSJk_nBnU_I3zZHp5
X-Proofpoint-ORIG-GUID: LS5n2-G4dgeImg6PSJk_nBnU_I3zZHp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX4ma5kLvz/WpB
 e1X0uz4/shClSS+a0LfHhVQ5xvTzQjFAamHlzNbzMZL+a3XGIG5kjwumRjOyE7gUNX4rPi1GTnR
 gjWX7d+x02QzGbEbLW6En7cfLmMeQgdV96TRv6bZKvJAfCwprVNUbKiuPZIToi1OLnYArPswZwb
 POXd6dBu6i75j8woo9f7w+Si60A3TU8v3yvkxm94oi1Jm5vFWKb/Li6ZmRL60FEoj5qnDgKJLWw
 MfKM6fCAlmFDCmyuW67Qu540O/zbZidC2TDgY+RAtuvlCvzx4HolXbgZQN7mYsc+JGaNq54L+6G
 pHPMkZCgGYlepnohB81HjBgnljwIK7frFVLclgJzOTz2mvCmGc0eXZ4Dk3yt3lQJiHG6clZjT0m
 fJgxfVVClxmK0F2lv0Wddim+zWKK5w==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692e8982 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EilkzCsaa4XF8CN22ykA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020051



On 2025/11/27 18:41, Bryan O'Donoghue wrote:
>> @@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct 
>> hfi_session_set_property_pkt *p
>>           packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
>>           break;
>>       }
>> +    case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
>> +        struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
>> +
>> +        ltr_mode->mode = in->mode;
>> +        ltr_mode->count = in->count;
>> +        ltr_mode->trust_mode = in->trust_mode;
>> +        packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
> 
> This looks like an unconditional pattern in this code
> 
> packet->shdr.hdr.size += sizeof(u32) for each one of the switch cases.
> 
> Could you at least add a patch to the end of this series to tidy this up 
> - either always incrmenting by sizeof(u32) before the swich - or making 
> a macro or static inline that packs the header appropriately.
> 
> Also what is the sizeof(u32) representative of ? "Some field in the 
> header" - get that but right now its just a literal unnamed dword.
> 

A patch will be added in v2 to optimize the code structure here.
-- 
Best Regards,
Wangao



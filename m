Return-Path: <linux-arm-msm+bounces-59399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F363AC3BE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2463A5426
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4C21E990E;
	Mon, 26 May 2025 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ca08TtmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35D1DE882
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248992; cv=none; b=I6RpMzsKdBwdXVQ73msGYVWQGOQKeCOUo2eNEJ32DsgHT1deREBjwenz2KLTzHb4J5vQN4PDPmE0pFKQZpOind0/Nk8zzYZeZ7aWsz59PzVkjTqBIgNs7sT3YcMQAFbL9Pf482Un0CDr+4uBLV4ujjcfxT3eCf5KAmedXQRw4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248992; c=relaxed/simple;
	bh=wvtD7UOxWptjnLXoK3lgX+akul/om9cVgjZjaIgSqCI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RcoeH/5yd5ilNdTI1LbtKrB/eTGzsSKQ9VRpRIRyFuDii1P0mh4pSRura4cMJWbcyUeKw3PI0Qow6OQ5Eokci71sVTPCls/9xMgRIid+uus57+p5FGzrN9OqvJFk79QHn+QyoQ+QubBuwWMTZgjrdIKP2bqKnCr9osUrxFNkX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ca08TtmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNPAb2010880
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sinlLLdJcZNbmFp3xHrrm5fCnPkdkH7iM8nLujxdoeY=; b=Ca08TtmHn6xL1Kff
	9TY+DrLlT5tBGf2HciqNM3pLFiHurugr8mbxD+kee1q+ZRVdVXwhy8+pqMo3o1u4
	RHcv4lOz412qSamlE7WkpvGLTufVaR63UDAHpxqKPQVd1GtE4OPK8m93y4YZhW7E
	lzF9vbNQNfGZlllJe/gPfkZtPuOBrgdXcYbRp9LOrhuR3VZjLlX4/6HEv1KhEHEJ
	DjFyyhYfC6JakozqpmoPuQxEXaRqtn9w+HVMnSHmiKg7LKlN47EpHmsAtvkc2vNr
	819CDeb5zqiXjx9XPebktV4TdnaKYf9+8fra5jkTH9aXh1J/zgCE/fHwzES0fRwe
	xjcwdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjkh9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 08:43:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742aa6581caso1453132b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 01:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248988; x=1748853788;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sinlLLdJcZNbmFp3xHrrm5fCnPkdkH7iM8nLujxdoeY=;
        b=KRQ5yCxPjfDCvtN/Ta5AjIrDZ2LpMC7sAbN4NzGLHb3/su4RrV2o+eOTvb4hqgUFAt
         apH7mK4BTABuJRHQ1FSpwSwFIE0HnxvPcymSabfg5bV29qSbBFxwun3s27hiTyKzTTqn
         mmFfcqz7hkpJZWl8SFdQMd33XhD2qhGthuVSbiMdvu0LgnBu00u292XT/v1Ed75SLMV1
         gncBM+C9rlqkK28mcg8MUoKTntz24YI4MqFG4oeV4T0fCKFpZu6npx/9wGgUygw1jOIb
         /eCXWo3WbEOgqHj26XKVXXLZq6lmT0CFsy4u/JoCYWwxtx06oCGks9fzUT0faHI/baUj
         4wng==
X-Forwarded-Encrypted: i=1; AJvYcCUI6gDoLhnVRFBHx1w67ToSnmCKeau/t6QV3Plha6SYi698ukCdIrSnlrx7Q8l2oDTLyuGSqqig4knfUJwW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp+tVZPDHKBsEkeZ6gwuiZDQ/NzJuq8OuYVX1kbwZQczFS8b+
	ybame1RE7qd1lAhS+0t3B2FbTRJEb4TRiuA3zN7fjQx3VkHcLiA8ULkQfrWTnTRqGIYEg7Zz2KQ
	e6kN0DM8O/ximAbXkWL3M8HAKSt0d3SebijmoqKc0dC5H2aEqMRFMZUuJPZQPAwiYA3yf
X-Gm-Gg: ASbGnctCvVikQRU47JUwNcbjigewv2bkWp2M+b2yG/QXTnpGoe0OnlHo6nx3/a+YSSY
	3EiAHR3xelFg1IrT1CsL9W6CA7whOrmgc6qdXF/5HqLvHJuWZqQhcWK4PPk+IVH4K+kV5eUkTyL
	dPa6OIo4hCYM71QGbIUv7ZkM42kWgTeLrPWsPSA7vVpHT8uoZV4pAoNj/UueQVaLpNkTHT+f8ku
	C4Nv4VPbv5mNiNma2CLAaPwwbKkXoX/2AS74C1lM/9doFslReTPUUug0lmg0DiXTw8Wk1tTxwEr
	uFYF+h79vMFldevigfe0v+ZrzQ1fcxBEjg==
X-Received: by 2002:a05:6a00:14c6:b0:736:5438:ccc with SMTP id d2e1a72fcca58-745fde87a75mr12107159b3a.9.1748248988325;
        Mon, 26 May 2025 01:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoizJR5p+a89MPZAfJfUO3m/tGSDp0byZESTr1wQfYRLYacqwKo8ENa6edgbqkfWqehnyKgg==
X-Received: by 2002:a05:6a00:14c6:b0:736:5438:ccc with SMTP id d2e1a72fcca58-745fde87a75mr12107134b3a.9.1748248987935;
        Mon, 26 May 2025 01:43:07 -0700 (PDT)
Received: from [10.239.154.73] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c8a8sm17197718b3a.60.2025.05.26.01.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:43:07 -0700 (PDT)
Message-ID: <a6deee53-6106-4e50-8d53-f1a87e50e9f0@oss.qualcomm.com>
Date: Mon, 26 May 2025 16:43:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
 <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
 <70b6d885-ca52-4731-9a78-80dd25248e2f@linaro.org>
Content-Language: en-US
In-Reply-To: <70b6d885-ca52-4731-9a78-80dd25248e2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6834299d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Htw2NgF16vZQhe7wStQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eDwgu37eL_AIIYtEumJczwY17PI2r8Jx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA3MiBTYWx0ZWRfX1XFhcjcvIRWA
 HeTr/kPFlnqGN4WwneG93EQOHZh9QYBCjNgpvcmZwyTewVpidLYbe9u1IPLSY2hqd2IzFptQgAT
 l+8BgjjNOoHJBudE1cJT+thFWrpEqzSgNQzSaGJOPTLp/8OyAfzOd2N3FxdcQgepwwqaGWAM4DB
 UxruPPnFijNGT4jt5VLbIOfxhyQGbWPFwB/wVEI5uX3UKZEH33QPtPZIBRBD286opmW9/+cmnmA
 /gM8NvsNa9GJTaiXCfCd6uYa9JafZAQsxQ1hUUQFgGPodW4QzqZ0p7E3G70bZ5ldYGNX9IVFidx
 cm+kv9w8aDrbW9VKjX+4s21MXfXzMdAgtJjGOQ6gJjDyRSxr9JB45bD24OBDfJhKus9//PRumn6
 Q+DcDz0EiZpZQoQSl0Nlvbb+LNmHrE7Av6zwXRIGe4QYA78Q4FCW3M6PNF2vMutDErX2WqqJ
X-Proofpoint-GUID: eDwgu37eL_AIIYtEumJczwY17PI2r8Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260072


On 5/26/2025 4:27 PM, neil.armstrong@linaro.org wrote:
> On 26/05/2025 08:19, Fenglin Wu wrote:
>>
>> On 5/24/2025 5:29 AM, György Kurucz wrote:
>>> Hi!
>>>
>>>> +static int qcom_battmgr_set_charge_control(struct qcom_battmgr 
>>>> *battmgr,
>>>> +                       u32 target_soc, u32 delta_soc)
>>>> +{
>>>> +    struct qcom_battmgr_charge_ctrl_request request = {
>>>> +        .hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>>>> +        .hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
>>>> +        .hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
>>>> +        .enable = cpu_to_le32(1),
>>>> +        .target_soc = cpu_to_le32(target_soc),
>>>> +        .delta_soc = cpu_to_le32(delta_soc),
>>>> +    };
>>>> +
>>>> +    return qcom_battmgr_request(battmgr, &request, sizeof(request));
>>>> +}
>>>> +
>>>> +static int qcom_battmgr_set_charge_start_threshold(struct 
>>>> qcom_battmgr *battmgr, int soc)
>>>> +{
>>>> +    u32 target_soc, delta_soc;
>>>> +    int ret;
>>>> +
>>>> +    if (soc < CHARGE_CTRL_START_THR_MIN ||
>>>> +            soc > CHARGE_CTRL_START_THR_MAX) {
>>>> +        dev_err(battmgr->dev, "charge control start threshold 
>>>> exceed range: [%u - %u]\n",
>>>> +                CHARGE_CTRL_START_THR_MIN, 
>>>> CHARGE_CTRL_START_THR_MAX);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If the new start threshold is larger than the old end 
>>>> threshold,
>>>> +     * move the end threshold one step (DELTA_SOC) after the new 
>>>> start
>>>> +     * threshold.
>>>> +     */
>>>> +    if (soc > battmgr->info.charge_ctrl_end) {
>>>> +        target_soc = soc + CHARGE_CTRL_DELTA_SOC;
>>>> +        target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
>>>> +        delta_soc = target_soc - soc;
>>>> +        delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
>>>> +    } else {
>>>> +        target_soc =  battmgr->info.charge_ctrl_end;
>>>> +        delta_soc = battmgr->info.charge_ctrl_end - soc;
>>>> +    }
>>>> +
>>>> +    mutex_lock(&battmgr->lock);
>>>> +    ret = qcom_battmgr_set_charge_control(battmgr, target_soc, 
>>>> delta_soc);
>>>> +    mutex_unlock(&battmgr->lock);
>>>> +    if (!ret) {
>>>> +        battmgr->info.charge_ctrl_start = soc;
>>>> +        battmgr->info.charge_ctrl_end = target_soc;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int qcom_battmgr_set_charge_end_threshold(struct 
>>>> qcom_battmgr *battmgr, int soc)
>>>> +{
>>>> +    u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
>>>> +    int ret;
>>>> +
>>>> +    if (soc < CHARGE_CTRL_END_THR_MIN ||
>>>> +            soc > CHARGE_CTRL_END_THR_MAX) {
>>>> +        dev_err(battmgr->dev, "charge control end threshold exceed 
>>>> range: [%u - %u]\n",
>>>> +                CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (battmgr->info.charge_ctrl_start && soc > 
>>>> battmgr->info.charge_ctrl_start)
>>>> +        delta_soc = soc - battmgr->info.charge_ctrl_start;
>>>> +
>>>> +    mutex_lock(&battmgr->lock);
>>>> +    ret = qcom_battmgr_set_charge_control(battmgr, soc, delta_soc);
>>>> +    mutex_unlock(&battmgr->lock);
>>>> +    if (!ret) {
>>>> +        battmgr->info.charge_ctrl_start = soc - delta_soc;
>>>> +        battmgr->info.charge_ctrl_end = soc;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>
>>> These function names sound quite generic, but AFAIU this patch is 
>>> only adding charge control support for the SM8550. Is sc8280xp and 
>>> x1e80100 also expected to be supported using the same 
>>> qcom_battmgr_charge_ctrl_request format?
>>
>> No, sc8280xp and x1e80100 don't support it. So I didn't add the 
>> support for them.
>
> And what about SM8650 and SM8750 ?
>
> Neil
>
Both SM8650 and SM8750 support charge control functionality. I saw 
SM8650 has already used "qcom,sm8550-pmic-glink" as fallback compatible 
string, so it will have it enabled by default when the change gets 
accepted. SM8750 platform can also use "qcom,sm8550-pmic-glink" as 
fallback to support it when uploading the DT change.

Fenglin

>>
>> These are generic functions are similar to 
>> "qcom_battmgr_update_charge_time" and "qcom_battmgr_update_info" 
>> which are only used for sc8280xp platform. Even right now charge 
>> control is only supported in mobile platforms starting from SM8550, 
>> however, it could be potentially supported in battery management 
>> firmware of any future platforms and the same functions could be reused.
>>
>>> Thanks,
>>> György
>>
>


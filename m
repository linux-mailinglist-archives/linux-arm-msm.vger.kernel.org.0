Return-Path: <linux-arm-msm+bounces-89004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6CD1E1B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 140993002D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFAF38B7C2;
	Wed, 14 Jan 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co6DMUHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LCRDbtwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692737F732
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386723; cv=none; b=ApYDvYsG4CytT6u3TXPVE+YmHqRg1eNSxgapNDp03vmvAa0kFxm4sJks5Vsnhixa01Y2LqeqVDa3oAXgK4O2zIoze0rNTn1WtA7D8/CA/WtzGN3UvmCUnlGWVn01IYSQuCmrVZtGuAHvcr+SESp5Nox80usz+Y7J7Hkmpb9YUKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386723; c=relaxed/simple;
	bh=jla/MYd4+2oFBVKTdb3a1CvjAVITJvhxRNE4Y4ypt6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNNKxUGIFtFfEf/w3TzqVgekLTzYHPFw/aWy8b+Gi9cCHAxKSie0V+s1pwRGrDq2zSQ1VKq8lqlOweoqKfZ6t+Fh08vJoU45Fcjtgi5EYse5G7e5jQSdzZRaeJda3kkydWDl/y4fXzVX4A9SyIxbRGeYxEAKNDSOx0lT2EQPRXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co6DMUHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCRDbtwY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j6Jl3270962
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQGrxRY3HuMFkUxGavmviPtyWCXgkL9hJSHhfZfU4sE=; b=co6DMUHsbl9XeMSd
	rNFCaPTEC9LpOzgEsskhcL72QqliPgyCxuFPIdC4/ICdV+dHfe6xnvNEFdutUVRh
	cXlipdiy4pfoMdW4KBUGPvml0ViiD5NTw1/bUd64S9Mc0Wuflsfq+H1du4WklSSh
	pR14j881ghqvXzwrM5RavzKTmOtCLFhI9nSeN5Nnm43GCszFRAmicPnqvVOTrrvw
	30j1feRYl5ccz9gGQQxXOTo78QcggjpLMBUNL+wrUVzxrw342QyzeBm8OX4HzoCh
	9Z/1AMTz4psmsRjcbwtQUY3R0kE2cECWO527dkVpXisKuckR7CZs6AC9Dql0cFp9
	Mq+fbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v3dte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:32:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50149945d26so1869981cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768386720; x=1768991520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQGrxRY3HuMFkUxGavmviPtyWCXgkL9hJSHhfZfU4sE=;
        b=LCRDbtwYEJAKVJHBFtUgxtDFVLV+3JPSdHj/x8zo6dU335rb5hsQaIfrRv0P4f5We3
         QWRyE1jEnmKEzPM+dBUKVPtpYngQSyuOH05+F7obrsXj7pmEhExwvB7q7PLzyfOAPI8c
         No7vrPFO/qil1kYmqsviR2O7nHgUianayMNcSLXQPniVE3ep58QG78cBpqe2C1EZt7Fk
         gCMd99HBo92TLjLdKZucIyJV0x5bbsqyX21D8Gjnnj3aSg8hRuH1dAsQOXUQMBlF7SXa
         UOu7JigOEAYM1cv/O+Jm+IxHVoltfIqryfBU/JnhjSMjT1PbGwDjiRgaFaR3bBMJjMvE
         aS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386720; x=1768991520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQGrxRY3HuMFkUxGavmviPtyWCXgkL9hJSHhfZfU4sE=;
        b=IMajGtILynXe8bftm+KmuckfgXp4nDY+IJCZXKEf8uzQdjC5yflJKvpIltQ3uIuZmt
         U9PPqcC6djTShcHwgezzEGi+4mlrhJRQn9dEy0YnSGe6QQXQmnoJvLmoAN3urdCC4gbP
         1we1kN88RiJ5zXxZMNN9sAZ7hTAi/f/VqjX1znmg2qgUOEGgevpS6x4V16DB0cA+b2hy
         PTZnQmuukIEsfspq4PzZ5HbHUbSijP/2Ltt2eKzOoCsbJw2HnwpCRyI1MNOZ7i0mZB0/
         LPC3Gy9l/+7x/zhFf6Vzsneyplmt+e/zzFs6el7QJm7Zf0Ab1CSNovHwHuPn1oa84Pyi
         j0wQ==
X-Gm-Message-State: AOJu0YyU7sA7QZp+0yLuwJlVcngKhoUZvdS48E4WTb9F6aZtHFsbKbma
	5n19f9FQ2Ou6g8T83WH0/PVM3g4XRVRiZjUHgvQQ7D7M7AEB11cbvjGJj4A1XZu01Igxe5bwhFH
	qKJvItKqu1cMuBshuBFezT/RCax+7qFwf0B7Y0+uPdlriK6S9tNzt7+MHz7dLTBMzJZnm
X-Gm-Gg: AY/fxX5NvrsC6LiyJb8gmJfEprBqecdktJUwqIeqfMLWSQnFSaNZ0SXQLW9ym3DVjdH
	davsjmNJBQFuOE5hnx9F1L3UpT1xtyB9JHqsNpN28FUf7naIlv4RLoFeuceydWo3eCOocdVK2nm
	TOH0YjGIUAb/0vfuHtBiyqzMFTu31lluG5UEd4tu2YFCEM9JWjr8/d4tJWhA80+ETNtpsG5SG5F
	e+LX5f9TjlAoYBivqkergrDNO4B3LUU6c9bMkglJHr5MFTkFhX/zIvubUpM3li0BArFXlq/mehL
	MYIUTU/FcEdbBn7bSuuXxQnDKJU4hqpZBUydWccxGLVdQepsofJLI/IvTRUIU2ONbPy7oCrQsw7
	vlJCTI3T2gJ2jUHq5XAbZYz26z7jUwqpIOrGR8a3NXbr/ISihSA7eekH3UZoyJN3fOpM=
X-Received: by 2002:ac8:5894:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-5014846f892mr20028631cf.7.1768386720516;
        Wed, 14 Jan 2026 02:32:00 -0800 (PST)
X-Received: by 2002:ac8:5894:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-5014846f892mr20028481cf.7.1768386719918;
        Wed, 14 Jan 2026 02:31:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm22308961a12.31.2026.01.14.02.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:31:59 -0800 (PST)
Message-ID: <ae97da56-7e4c-4ff2-b0fa-9724b95229eb@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:31:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] interconnect: qcom: implement get_bw with
 rpmh_read
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org>
 <8eb528dd-71fc-408e-a97c-d484198e4f81@kernel.org>
 <1be287ac-fce9-4f27-aa88-b1f786e968cd@oss.qualcomm.com>
 <95becfde-ba4b-4024-9b90-e64e77551f0a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <95becfde-ba4b-4024-9b90-e64e77551f0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=696770a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kMUB7RtO3m2hnyBDxvcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6L7Ax8lmB8ittOwyoZ7zhjt6PXl-cADz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NiBTYWx0ZWRfX7aJmPRY1b81r
 pVEoH5A8BdF8rSIZ2d1jjC0XG/mpb15xCD7shb+KR1euIHs60XZKzJNptV8nQzmt9+klhpGFhzs
 M9eBaEzpNTPnzb+mNNNyKi9jU7SLQ6hAR2RhN2UxahcsAN1Du02ED5nl2pGsn9z3QJVqdGOo4Xq
 T2o7ncbOhEla0WiP/ko3xV2kB5ij1kVpbDSD53skWsGkusNAUD8qA/Ub+BsIvPPw+LdaRgbWV12
 6RwaCoP4KC3eNvgmy8TvL2YuaqJJ4/ioVApmy+KjIMaURHDTwKB1aulKspMSfyu+4wqOADMWxs7
 wmlCPhd8qQWTcqeNOA3IY+/36gmiPtNcApPWhR+cNCuyb7or9fG719qUaOqQYnJHrRfNvaxSf74
 ibRxwPR56KSswQncd7IEEAbqYrUHJbtpJ6ZAcdFzpfDeL3VrD1vpV7mHHHhX9n049FyuOh+iJ18
 fRzbSlwyHLUwFMIRseQ==
X-Proofpoint-GUID: 6L7Ax8lmB8ittOwyoZ7zhjt6PXl-cADz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140086

On 1/14/26 11:07 AM, Neil Armstrong wrote:
> On 1/14/26 11:01, Konrad Dybcio wrote:
>> On 1/13/26 6:53 PM, Georgi Djakov wrote:
>>> On 11/6/25 6:46 PM, Neil Armstrong wrote:
>>>> Since we can actually read back the APPS rpmh interconnect
>>>> BCM votes we can actually implement the get_bw() callback
>>>> and provide a coherent average and peak bandwidth at probe time.
>>>>
>>>> The benefits of that are:
>>>> - keep disabled BCMs disabled
>>>> - avoid voting unused BCMs to INT_MAX
>>>>
>>>> If the interconnects are correctly described for a platform,
>>>> all the required BCMs would be voted to the maximum bandwidth
>>>> until sync_state is reached.
>>>>
>>>> Since we only get the BCM vote, we need to redistribute
>>>> the vote values to the associated nodes. The initial BCM
>>>> votes are read back at probe time in order to be ready when
>>>> the get_bw() is called when a node is added.
>>>>
>>>
>>> FWIW, I was able to finally test this on sdm845. Some nodes are indeed
>>> showing reasonable bandwidth values instead of the default INT_MAX.
>>
>> As I learnt here
>>
>> https://lore.kernel.org/linux-arm-msm/1e7594dc-dca6-42e7-b478-b063e3325aff@oss.qualcomm.com/
>>
>> rpmh_read() will only retrieve the currently active values, so as-is,
>> this hunk:
>>
>> +    /* For boot-up, fill the AMC vote in all buckets */
>> +    for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
>> +        bcm->vote_x[i] = x;
>> +        bcm->vote_y[i] = y;
>> +    }
>>
>> is lying about the state of wake/sleep buckets
>>
>> this is ""fine"" today, as I don't see any "if (old_bw == new_bw)" checks
>> across the framework, but debugfs is going to report incorrect values and
>> if anyone decides to add the aforementioned check, it may introduce issues
>> where the values aren't commited to the hardware (because Linux is going
>> to believe they're already set)
> 
> This is only for the pre-sync-state phase, where we don't need the wake/sleep
> values but the interconnect rpmh implementation needs them, and anyway they will
> be replaced by proper values in sync_state

I realize this may not be the most convincing argument, but consider
the case where sync_state can not be hit, for example with the Venus
driver that requests FW at probe time and errors out if it's absent

> So this is an informed & assumed choice I did here. It's a small optimization
> to avoid turning on _all_ interconnects at INT_MAX, and keep boot votes
> up to sync_state.

Another question is, whether that's a desired change - I could easily
see pinning buses to the maximum speed helping boot time KPIs, but
perhaps that could/should be configurable?

Konrad

